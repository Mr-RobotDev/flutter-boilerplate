const String ksHomeBottomSheetTitle = 'Build Great Apps!';
const String ksHomeBottomSheetDescription =
    'Stacked is built to help you build better apps. Give us a chance and we\'ll prove it to you. Check out stacked.filledstacks.com to learn more';

final RegExp emailRegex = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
const String ksEmailInvalidErrorTitle = 'Invalid Email';
const String ksEmailInvalidError = 'Please enter a valid email address';
const String ksEmailEmptyError = 'Email Address cannot be empty';

final RegExp passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
const String ksPasswordInvalidErrorTitle = 'Invalid Password';
const String ksPasswordInvalidError =
    'Password must be at least 8 characters long and contain at least one letter and one number';
const String ksPasswordEmptyError = 'Password cannot be empty';

const String ksSomethingWentWrongError = 'Something went wrong';
const String ksOfflineError = 'You are currently offline';
const String ksInternetRestored = 'Your connection has been restored';
