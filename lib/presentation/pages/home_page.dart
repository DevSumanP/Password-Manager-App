import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:iconly/iconly.dart';
import 'package:password_manager/service/encryption_handler.dart';
import 'package:password_manager/service/local_auth.dart';
import 'package:password_manager/core/constants/app_colors.dart';
import 'package:password_manager/core/constants/app_text_styles.dart';
import 'package:password_manager/core/utils/app_helpers.dart';
import 'package:password_manager/database/model/account_model.dart';
import 'package:password_manager/database/save_data.dart';
import '../widgets/account_card.dart';
import '../widgets/custom_search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _authService = AuthService();
  late Future<List<Account>> _accountsFuture;
  final TextEditingController _searchController = TextEditingController();

  final List<String> _tabs = ['All Accounts', 'Social Platform', 'Browser'];
  int _selectedChipIndex = 0;

  List<Account> filteredAccounts = [];
  List<Account> allAccounts = [];

  @override
  void initState() {
    super.initState();
    _fetchAndSetAccounts();
    _searchController.addListener(() {
      _onSearchChanged(_searchController.text);
    });
  }

  void _fetchAndSetAccounts() {
    _accountsFuture = retrieveAccountData();
    _accountsFuture.then((accounts) {
      setState(() {
        allAccounts = accounts; // Initialize allAccounts with fetched data
        filteredAccounts =
            allAccounts; // Initialize filteredAccounts with all accounts
      });
    });
  }

  void _onSearchChanged(String value) async {
    setState(() {
      filteredAccounts = allAccounts.where((account) {
        return account.serviceName
                .toLowerCase()
                .contains(value.toLowerCase()) ||
            account.serviceUrl.toLowerCase().contains(value.toLowerCase());
      }).toList();
    });
  }

  Future<void> _onVisibilityToggle(int index) async {
    if (filteredAccounts[index].isPasswordVisible == true) {
      // If the password is already visible, hide it without authentication
      setState(() {
        filteredAccounts[index].isPasswordVisible = false;
      });
    } else {
      // Authenticate with biometrics before showing the password
      bool isAuthenticated =
          await _authService.authenticateWithBiometrics(context);

      if (isAuthenticated) {
        setState(() {
          filteredAccounts[index].isPasswordVisible = true;
          filteredAccounts[index].password = EncryptionHandler.decryptPassword(
            filteredAccounts[index].password,
          );
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Biometric Authentication Failed')),
        );
      }
    }
  }

  void _onChipSelected(int index) {
    setState(() {
      _selectedChipIndex = index;
      filteredAccounts = allAccounts.where((account) {
        return index == 0 || account.category == _tabs[index];
      }).toList();
    });
  }

  Future<void> deleteAccount(int index) async {
    final box = await Hive.openBox<Account>('accounts');
    await box.deleteAt(index);
    setState(() {
      allAccounts.removeAt(index);
      filteredAccounts = allAccounts;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Account deleted successfully')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          'Accounts',
          style: AppTextStyles.heading1,
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(IconlyLight.setting),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          CustomSearchBar(
            searchController: _searchController,
            onSearch: _onSearchChanged,
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(_tabs.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: ChoiceChip(
                    side: BorderSide.none,
                    showCheckmark: false,
                    label: Text(
                      _tabs[index],
                      style: GoogleFonts.poppins(
                        color: _selectedChipIndex == index
                            ? AppColors.textColor
                            : AppColors.textLightColor,
                        fontWeight: _selectedChipIndex == index
                            ? FontWeight.w600
                            : FontWeight.w500,
                      ),
                    ),
                    selected: _selectedChipIndex == index,
                    onSelected: (bool selected) {
                      if (selected) {
                        _onChipSelected(index);
                      }
                    },
                    selectedColor: AppColors.backgroundColor,
                    backgroundColor: AppColors.backgroundColor,
                  ),
                );
              }),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder<List<Account>>(
                future: _accountsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text('No accounts saved!'),
                    );
                  }
                  return ListView.builder(
                    itemCount: filteredAccounts.length,
                    itemBuilder: (context, index) {
                      var account = filteredAccounts[index];
                      return Slidable(
                        endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            dismissible: DismissiblePane(
                                key: ValueKey(
                                    'Dismissible ${account.serviceName}'),
                                onDismissed: () {}),
                            children: [
                              SlidableAction(
                                backgroundColor: AppColors.backgroundColor,
                                foregroundColor: AppColors.textColor,
                                icon: IconlyLight.delete,
                                onPressed: (BuildContext context) {
                                  deleteAccount(index);
                                },
                              ),
                            ]),
                        child: AccountCard(
                          serviceName: account.serviceName,
                          serviceUrl: account.serviceUrl,
                          serviceLogo:
                              AppHelpers.getServiceImage(account.serviceName),
                          password: account.isPasswordVisible
                              ? account.password
                              : '********',
                          isPasswordVisible: account.isPasswordVisible,
                          onVisibilityToggle: () => _onVisibilityToggle(index),
                          onDelete: () {},
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
