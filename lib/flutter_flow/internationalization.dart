import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ml', 'hi'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? mlText = '',
    String? hiText = '',
  }) =>
      [enText, mlText, hiText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Userlogin
  {
    'idgme7kl': {
      'en': 'Login To Your Account!',
      'hi': 'अपने अकाउंट में लॉग इन करें!',
      'ml': 'നിങ്ങളുടെ അക്കൗണ്ടിൽ ലോഗിൻ ചെയ്യുക!',
    },
    'cixgc37b': {
      'en': 'Email Address',
      'hi': 'मेल पता',
      'ml': 'ഇമെയിൽ വിലാസം',
    },
    'gekt1nft': {
      'en': 'Enter your email here...',
      'hi': 'अपना ई मेल यहा भरे...',
      'ml': 'നിങ്ങളുടെ ഇമെയിൽ ഇവിടെ നൽകുക...',
    },
    'sge3rxo6': {
      'en': 'Password',
      'hi': 'पासवर्ड',
      'ml': 'Password',
    },
    'of2oljx0': {
      'en': 'Enter your password here...',
      'hi': 'यहां अपना पासवर्ड डालें...',
      'ml': 'നിങ്ങളുടെ പാസ്‌വേഡ് ഇവിടെ നൽകുക...',
    },
    'xnwvazrv': {
      'en': 'Login',
      'hi': 'लॉग इन करें',
      'ml': 'ലോഗിൻ',
    },
    'smjcu3xe': {
      'en': 'Sign In',
      'hi': 'दाखिल करना',
      'ml': 'സൈൻ ഇൻ',
    },
    'iys1fxot': {
      'en': 'Home',
      'hi': 'घर',
      'ml': 'വീട്',
    },
  },
  // UserSignIn
  {
    'wqp1cwi9': {
      'en': 'Get Started Now!',
      'hi': 'अब शुरू हो जाओ!',
      'ml': 'ഇപ്പോൾ ആരംഭിക്കുക!',
    },
    'd6w5gnya': {
      'en': 'Get Started!',
      'hi': 'शुरू हो जाओ!',
      'ml': 'തുടങ്ങി!',
    },
    '2y6eyu6j': {
      'en':
          'Sign in to explore a world of personalized experiences, manage your bookings, and discover exciting new destinations',
      'hi':
          'वैयक्तिकृत अनुभवों की दुनिया का पता लगाने, अपनी बुकिंग प्रबंधित करने और रोमांचक नए गंतव्यों की खोज करने के लिए साइन इन करें',
      'ml':
          'വ്യക്തിഗത അനുഭവങ്ങളുടെ ലോകം പര്യവേക്ഷണം ചെയ്യാനും നിങ്ങളുടെ ബുക്കിംഗുകൾ നിയന്ത്രിക്കാനും ആവേശകരമായ പുതിയ ലക്ഷ്യസ്ഥാനങ്ങൾ കണ്ടെത്താനും സൈൻ ഇൻ ചെയ്യുക',
    },
    '0hpv00wc': {
      'en': 'Email Address',
      'hi': 'मेल पता',
      'ml': 'ഇമെയിൽ വിലാസം',
    },
    '3xq9gidg': {
      'en': 'Enter your email here...',
      'hi': 'अपना ई मेल यहा भरे...',
      'ml': 'നിങ്ങളുടെ ഇമെയിൽ ഇവിടെ നൽകുക...',
    },
    'rfqogkk3': {
      'en': 'Password',
      'hi': 'पासवर्ड',
      'ml': 'Password',
    },
    '2sh0rdh4': {
      'en': 'Enter your password here...',
      'hi': 'यहां अपना पासवर्ड डालें...',
      'ml': 'നിങ്ങളുടെ പാസ്‌വേഡ് ഇവിടെ നൽകുക...',
    },
    'kr8224tc': {
      'en': 'Confirm Password',
      'hi': 'पासवर्ड की पुष्टि कीजिये',
      'ml': 'പാസ്വേഡ് സ്ഥിരീകരിക്കുക',
    },
    'x445wwfv': {
      'en': 'Confirm your password here...',
      'hi': 'यहां अपने पासवर्ड की पुष्टि करें...',
      'ml': 'നിങ്ങളുടെ പാസ്‌വേഡ് ഇവിടെ സ്ഥിരീകരിക്കുക...',
    },
    '3buro3ie': {
      'en': 'Create Account',
      'hi': 'खाता बनाएं',
      'ml': 'അക്കൗണ്ട് സൃഷ്ടിക്കുക',
    },
    '6my4srqn': {
      'en': 'Already have an account?',
      'hi': 'क्या आपके पास पहले से एक खाता मौजूद है?',
      'ml': 'ഇതിനകം ഒരു അക്കൗണ്ട് ഉണ്ടോ?',
    },
    'igh7ngjn': {
      'en': 'Log In',
      'hi': 'लॉग इन करें',
      'ml': 'ലോഗിൻ',
    },
    'kvqny9d4': {
      'en': 'Home',
      'hi': 'घर',
      'ml': 'വീട്',
    },
  },
  // UserHomePage
  {
    'aybuix11': {
      'en': 'Discover Kottayam: Your Gateway to Unforgettable Experiences!',
      'hi': 'कोट्टायम की खोज करें: अविस्मरणीय अनुभवों का आपका प्रवेश द्वार!',
      'ml':
          'കോട്ടയം കണ്ടെത്തുക: മറക്കാനാവാത്ത അനുഭവങ്ങളിലേക്കുള്ള നിങ്ങളുടെ കവാടം!',
    },
    'j2mw91zk': {
      'en': 'Hotel \nStays',
      'hi': 'होटल\nरिहाइश',
      'ml': 'ഹോട്ടൽ\nതാമസിക്കുന്നു',
    },
    'hdyxudgw': {
      'en': 'Restaurants ',
      'hi': 'रेस्टोरेंट',
      'ml': 'ഭക്ഷണശാലകൾ',
    },
    '9bk4z59h': {
      'en': 'Medical \nServices',
      'hi': 'चिकित्सा\nसेवाएं',
      'ml': 'മെഡിക്കൽ\nസേവനങ്ങള്',
    },
    'rfaeax5d': {
      'en': 'Top Destinations',
      'hi': 'शीर्ष गंतव्य',
      'ml': 'പ്രധാന ലക്ഷ്യസ്ഥാനങ്ങൾ',
    },
    'qhybqnyx': {
      'en': 'Adventure \nTourism',
      'hi': 'साहसिक काम\nपर्यटन',
      'ml': 'സാഹസികത\nടൂറിസം',
    },
    '08nk6tv2': {
      'en': 'Backwater \nTourism',
      'hi': 'मेड़\nपर्यटन',
      'ml': 'കായൽ\nടൂറിസം',
    },
    'twf9smh0': {
      'en': 'Home',
      'hi': 'घर',
      'ml': 'വീട്',
    },
  },
  // Myprofile
  {
    'axvgypr2': {
      'en': 'Hi ',
      'hi': 'नमस्ते',
      'ml': 'ഹായ്',
    },
    'oah9b6at': {
      'en': 'Your Account',
      'hi': 'आपका खाता',
      'ml': 'നിങ്ങളുടെ അക്കൗണ്ട്',
    },
    'v5p5bek3': {
      'en': 'Edit Profile',
      'hi': 'प्रोफ़ाइल संपादित करें',
      'ml': 'പ്രൊഫൈൽ എഡിറ്റ് ചെയ്യുക',
    },
    'cj21i8di': {
      'en': 'Your Bookings',
      'hi': 'आपकी बुकिंग',
      'ml': 'നിങ്ങളുടെ ബുക്കിംഗുകൾ',
    },
    '6qfw5i9s': {
      'en': 'Reviews',
      'hi': 'समीक्षा',
      'ml': 'അവലോകനങ്ങൾ',
    },
    'uj18oc6h': {
      'en': 'Ratings',
      'hi': 'समीक्षा',
      'ml': 'അവലോകനങ്ങൾ',
    },
    '94gdod9m': {
      'en': 'Registration',
      'hi': 'थीम',
      'ml': 'തീം',
    },
    'd2pf7l31': {
      'en': 'Hotel registration',
      'hi': 'होटल पंजीकरण',
      'ml': 'ഹോട്ടൽ രജിസ്ട്രേഷൻ',
    },
    'w11sy125': {
      'en': 'Theme',
      'hi': 'थीम',
      'ml': 'തീം',
    },
    'g8mr4r8v': {
      'en': 'App Settings',
      'hi': 'एप्लिकेशन सेटिंग',
      'ml': 'ആപ്പ് ക്രമീകരണങ്ങൾ',
    },
    'jopftw13': {
      'en': 'Support',
      'hi': 'सहायता',
      'ml': 'പിന്തുണ',
    },
    'w9qbqgeb': {
      'en': 'Terms of Service',
      'hi': 'सेवा की शर्तें',
      'ml': 'സേവന നിബന്ധനകൾ',
    },
    'nitxalce': {
      'en': 'Account Settings',
      'hi': 'अकाउंट सेटिंग',
      'ml': 'അക്കൗണ്ട് ക്രമീകരണങ്ങൾ',
    },
    'f8hwerej': {
      'en': 'Delete Account',
      'hi': 'खाता हटा दो',
      'ml': 'അക്കൗണ്ട് ഇല്ലാതാക്കുക',
    },
    'i295n6l4': {
      'en': 'Logout',
      'hi': 'लॉग आउट',
      'ml': 'പുറത്തുകടക്കുക',
    },
    'j7b31qxs': {
      'en': 'Profile',
      'hi': 'प्रोफ़ाइल',
      'ml': 'പ്രൊഫൈൽ',
    },
  },
  // EditProfile
  {
    '7xfmjbv9': {
      'en': 'Upload Profile Picture \n& \nUpdate Your details Below',
      'hi': 'प्रोफ़ाइल चित्र अपलोड करें',
      'ml': 'പ്രൊഫൈൽ ചിത്രം അപ്‌ലോഡ് ചെയ്യുക',
    },
    'kpmw8ae5': {
      'en': 'Your Name',
      'hi': 'अप का नाम',
      'ml': 'നിങ്ങളുടെ പേര്',
    },
    'ecmz2emr': {
      'en': 'Age',
      'hi': 'आयु',
      'ml': 'പ്രായം',
    },
    'fmfs5znw': {
      'en': 'Phone Number',
      'hi': 'फ़ोन नंबर',
      'ml': 'ഫോൺ നമ്പർ',
    },
    'm01hqe4n': {
      'en': 'Your City',
      'hi': 'आपका सिटि',
      'ml': 'നിങ്ങളുടെ നഗരം',
    },
    'g5dfgko7': {
      'en': 'Thiruvananthapuram ',
      'hi': 'तिरुवनंतपुरम',
      'ml': 'തിരുവനന്തപുരം',
    },
    'jb1q7wgg': {
      'en': 'Kollam',
      'hi': 'कोल्लम',
      'ml': 'കൊല്ലം',
    },
    'qpkn8udr': {
      'en': 'Pathanamthitta',
      'hi': 'पथानामथिट्टा',
      'ml': 'പത്തനംതിട്ട',
    },
    'adnuuvox': {
      'en': 'Alappuzha ',
      'hi': 'अलपुझा',
      'ml': 'ആലപ്പുഴ',
    },
    '6hzywwuj': {
      'en': 'Kottayam',
      'hi': 'कोट्टायम',
      'ml': 'കോട്ടയം',
    },
    '2cgsfyb6': {
      'en': 'Idukki',
      'hi': 'इडुक्की',
      'ml': 'ഇടുക്കി',
    },
    '7f79dabu': {
      'en': 'Ernakulam',
      'hi': 'एर्नाकुलम',
      'ml': 'എറണാകുളം',
    },
    'dwu8zm7p': {
      'en': 'Thrissur',
      'hi': 'त्रिशूर',
      'ml': 'തൃശൂർ',
    },
    'uandz17m': {
      'en': 'Palakkad',
      'hi': 'पलक्कड़',
      'ml': 'പാലക്കാട്',
    },
    'gz759566': {
      'en': 'Malappuram',
      'hi': 'मलप्पुरम',
      'ml': 'മലപ്പുറം',
    },
    'o5ktujhn': {
      'en': 'Kozhikode',
      'hi': 'कोझिकोड',
      'ml': 'കോഴിക്കോട്',
    },
    'f9wzrc1h': {
      'en': 'Wayanad',
      'hi': 'वायनाड',
      'ml': 'വയനാട്',
    },
    'kda8ehhi': {
      'en': 'Kannur',
      'hi': 'कन्नूर',
      'ml': 'കണ്ണൂർ',
    },
    'iylod5je': {
      'en': 'Kasargod',
      'hi': 'कासरगोड',
      'ml': 'കാസർകോട്',
    },
    '3hwgmihh': {
      'en': 'District',
      'hi': 'ज़िला',
      'ml': 'ജില്ല',
    },
    'ipauv0l1': {
      'en': 'Select State',
      'hi': 'राज्य चुनें',
      'ml': 'സംസ്ഥാനം തിരഞ്ഞെടുക്കുക',
    },
    'o3v7q7f5': {
      'en': 'Bio',
      'hi': 'जैव',
      'ml': 'ബയോ',
    },
    'v0lwk54c': {
      'en': 'Your bio',
      'hi': 'आपका बायो',
      'ml': 'നിങ്ങളുടെ ജീവചരിത്രം',
    },
    'i2ln6w89': {
      'en': 'Save Changes',
      'hi': 'परिवर्तनों को सुरक्षित करें',
      'ml': 'മാറ്റങ്ങൾ സൂക്ഷിക്കുക',
    },
    'fb186i8h': {
      'en': 'Your Profile',
      'hi': 'आपकी प्रोफ़ाइल',
      'ml': 'നിങ്ങളുടെ പ്രൊഫൈൽ',
    },
  },
  // Calendar
  {
    'sbo8vmr8': {
      'en': 'Select the START date and END date!',
      'hi': 'प्रारंभ तिथि और समाप्ति तिथि चुनें!',
      'ml': 'START തീയതിയും അവസാന തീയതിയും തിരഞ്ഞെടുക്കുക!',
    },
    'zs8f8u30': {
      'en': 'Contact:  ',
      'hi': 'संपर्क करना:',
      'ml': 'ബന്ധപ്പെടുക:',
    },
    '1yjs0kdu': {
      'en': ' - ',
      'hi': '-',
      'ml': '-',
    },
    'welszv86': {
      'en': 'Proceed To Checkout',
      'hi': 'चेक आउट करने के लिए आगे बढ़ें',
      'ml': 'ചെക്കൗട്ടിനായി മുന്നോട്ടുപോകുക',
    },
    '3xjektiu': {
      'en': 'Calender',
      'hi': 'कैलेंडर',
      'ml': 'കലണ്ടർ',
    },
  },
  // ARUVIKUZHIWATERFALLS
  {
    '1sh05h2k': {
      'en': 'ARUVIKUZHI WATERFALLS',
      'hi': 'अरुविकुझी झरने',
      'ml': 'അരുവിക്കുഴി വെള്ളച്ചാട്ടം',
    },
    'wkwbq3sm': {
      'en':
          'Aruvikuzhy Waterfalls is a waterfall in Kottayam district in the Kerala state of India. It is situated 2 km from Pallickathode and 7.5 km from Pampady. The waterfall measures about 30 ft in height and active only during monsoon. In summer the river almost dries up.',
      'hi':
          'अरुविकुझी झरना भारत के केरल राज्य के कोट्टायम जिले में एक झरना है। यह पल्लीकाथोड से 2 किमी और पंपडी से 7.5 किमी दूर स्थित है। झरने की ऊंचाई लगभग 30 फीट है और यह केवल मानसून के दौरान सक्रिय होता है। गर्मियों में नदी लगभग सूख जाती है।',
      'ml':
          'ഇന്ത്യയിലെ കേരളത്തിലെ കോട്ടയം ജില്ലയിലെ ഒരു വെള്ളച്ചാട്ടമാണ് അരുവിക്കുഴി വെള്ളച്ചാട്ടം. പള്ളിക്കത്തോട് നിന്ന് 2 കിലോമീറ്ററും പാമ്പാടിയിൽ നിന്ന് 7.5 കിലോമീറ്ററും അകലെയാണ് ഇത് സ്ഥിതി ചെയ്യുന്നത്. ഏകദേശം 30 അടി ഉയരമുള്ള വെള്ളച്ചാട്ടം മൺസൂൺ കാലത്ത് മാത്രം സജീവമാണ്. വേനൽക്കാലത്ത് നദി ഏതാണ്ട് വറ്റിപ്പോകുന്നു.',
    },
    '2o5q6vpi': {
      'en': 'Home',
      'hi': 'घर',
      'ml': 'വീട്',
    },
  },
  // illikkalkallu
  {
    'l7asfot8': {
      'en': 'ILLIKKAL KALLU',
      'hi': 'इलिक्कल कल्लू',
      'ml': 'ഇല്ലിക്കൽ കല്ല്',
    },
    'dmt23mjf': {
      'en':
          'Illikkal Kallu is a prominent tourist attraction and a peak located in the Kottayam district of Kerala, India. It is a part of the Western Ghats, a UNESCO World Heritage Site known for its rich biodiversity and stunning natural landscapes.The peak of Illikkal Kallu stands at an elevation of around 3,000 feet (900 meters) above sea level and offers panoramic views of the surrounding valleys, villages, and the Western Ghats.',
      'hi':
          'इलिक्कल कल्लू एक प्रमुख पर्यटक आकर्षण और भारत के केरल के कोट्टायम जिले में स्थित एक चोटी है। यह पश्चिमी घाट का एक हिस्सा है, जो एक यूनेस्को विश्व धरोहर स्थल है जो अपनी समृद्ध जैव विविधता और आश्चर्यजनक प्राकृतिक परिदृश्यों के लिए जाना जाता है। इलिक्कल कल्लू की चोटी समुद्र तल से लगभग 3,000 फीट (900 मीटर) की ऊंचाई पर है और मनोरम दृश्य प्रस्तुत करती है। आसपास की घाटियाँ, गाँव और पश्चिमी घाट।',
      'ml':
          'ഇന്ത്യയിലെ കേരളത്തിലെ കോട്ടയം ജില്ലയിൽ സ്ഥിതി ചെയ്യുന്ന ഒരു പ്രമുഖ വിനോദസഞ്ചാര കേന്ദ്രവും കൊടുമുടിയുമാണ് ഇല്ലിക്കൽ കല്ല്. പശ്ചിമഘട്ടത്തിന്റെ ഭാഗമാണിത്, സമ്പന്നമായ ജൈവവൈവിധ്യത്തിനും അതിശയകരമായ പ്രകൃതിദൃശ്യങ്ങൾക്കും പേരുകേട്ട യുനെസ്കോയുടെ ലോക പൈതൃക സ്ഥലമാണിത്. സമുദ്രനിരപ്പിൽ നിന്ന് ഏകദേശം 3,000 അടി (900 മീറ്റർ) ഉയരത്തിലാണ് ഇല്ലിക്കൽ കല്ലിന്റെ കൊടുമുടി നിലകൊള്ളുന്നത്. ചുറ്റുമുള്ള താഴ്വരകൾ, ഗ്രാമങ്ങൾ, പശ്ചിമഘട്ടങ്ങൾ.',
    },
    'z4zs63yg': {
      'en': 'Home',
      'hi': 'घर',
      'ml': 'വീട്',
    },
  },
  // ELAVEEZHAPOONJIRA
  {
    '7vhjvrs2': {
      'en': 'ELAVEEZHAPOONCHIRA',
      'hi': 'एलावीझापूनचिरा',
      'ml': 'ഇലവീഴാപൂഞ്ചിറ',
    },
    'kq0bcpmm': {
      'en':
          'Elaveezhapoonchira is a picturesque hill station located in the Idukki district of Kerala, India. It is known for its sprawling meadows and breathtaking landscapes. The vast expanse of green meadows against the backdrop of blue skies creates a serene and tranquil atmosphere. The sunrise and sunset views from Elaveezhapoonchira are particularly mesmerizing.',
      'hi':
          'इलावीज़ापूनचिरा भारत के केरल के इडुक्की जिले में स्थित एक सुरम्य हिल स्टेशन है। यह अपने विशाल घास के मैदानों और लुभावने परिदृश्यों के लिए जाना जाता है। नीले आकाश की पृष्ठभूमि में हरे घास के मैदानों का विशाल विस्तार एक शांत और शांत वातावरण बनाता है। एलावीज़ापूनचिरा से सूर्योदय और सूर्यास्त के दृश्य विशेष रूप से मंत्रमुग्ध कर देने वाले होते हैं।',
      'ml':
          'ഇന്ത്യയിലെ കേരളത്തിലെ ഇടുക്കി ജില്ലയിൽ സ്ഥിതി ചെയ്യുന്ന മനോഹരമായ ഒരു ഹിൽസ്റ്റേഷനാണ് ഇലവീഴാപൂഞ്ചിറ. വിശാലമായ പുൽമേടുകൾക്കും അതിമനോഹരമായ പ്രകൃതിദൃശ്യങ്ങൾക്കും പേരുകേട്ടതാണ് ഇത്. നീലാകാശത്തിന്റെ പശ്ചാത്തലത്തിൽ പച്ച പുൽമേടുകളുടെ വിശാലമായ വിസ്തൃതി ശാന്തവും ശാന്തവുമായ അന്തരീക്ഷം സൃഷ്ടിക്കുന്നു. ഇലവീഴാപൂഞ്ചിറയിൽ നിന്നുള്ള സൂര്യോദയവും അസ്തമയ കാഴ്ചകളും പ്രത്യേകം മനോഹരമാണ്.',
    },
    'hkt0gfvd': {
      'en': 'Home',
      'hi': 'घर',
      'ml': 'വീട്',
    },
  },
  // MATHRUMALA
  {
    '9twtwbzn': {
      'en': 'MATHRUMALA',
      'hi': 'मथुमाला',
      'ml': 'മാതൃമല',
    },
    'y91prybw': {
      'en':
          'Mathrumala is a hill located 16 km (9.9 mi) east of the town of Kottayam in Kooroppada, Kottayam District, Kerala, India. The hilltop has a temple shrine dedicated to Rajarajeshwari. From the top it is a mesmerizing scenic view of the surrounding lush green and small towns. it is a best place for Trekking and photography.',
      'hi':
          'मातृमाला एक पहाड़ी है जो भारत के केरल के कोट्टायम जिले के कूरोप्पाडा में कोट्टायम शहर से 16 किमी (9.9 मील) पूर्व में स्थित है। पहाड़ी की चोटी पर राजराजेश्वरी को समर्पित एक मंदिर है। ऊपर से आसपास के हरे-भरे और छोटे शहरों का मनमोहक प्राकृतिक दृश्य दिखाई देता है। ट्रैकिंग और फोटोग्राफी के लिए यह सबसे अच्छी जगह है।',
      'ml':
          'ഇന്ത്യയിലെ കേരളത്തിലെ കോട്ടയം ജില്ലയിലെ കൂരോപ്പടയിൽ കോട്ടയം പട്ടണത്തിൽ നിന്ന് 16 കിലോമീറ്റർ (9.9 മൈൽ) കിഴക്കായി സ്ഥിതി ചെയ്യുന്ന ഒരു കുന്നാണ് മാതൃമല. കുന്നിൻ മുകളിൽ രാജരാജേശ്വരിക്ക് സമർപ്പിച്ചിരിക്കുന്ന ഒരു ക്ഷേത്രമുണ്ട്. മുകളിൽ നിന്ന് നോക്കിയാൽ ചുറ്റുമുള്ള പച്ചപ്പിന്റെയും ചെറുപട്ടണങ്ങളുടെയും മനോഹര ദൃശ്യം. ട്രെക്കിംഗിനും ഫോട്ടോഗ്രാഫിക്കും പറ്റിയ സ്ഥലമാണിത്.',
    },
    'h3c31u7m': {
      'en': '360° image',
      'hi': '360° छवि',
      'ml': '360° ചിത്രം',
    },
    'w95d3eo2': {
      'en': 'Directions',
      'hi': 'दिशा-निर्देश',
      'ml': 'ദിശകൾ',
    },
    'ay66z1mm': {
      'en': 'Home',
      'hi': 'घर',
      'ml': 'വീട്',
    },
  },
  // VALLYACHANMALA
  {
    'si1o3js1': {
      'en': 'VALLYACHAN MALA',
      'hi': 'वल्ल्याचन माला',
      'ml': 'വല്ല്യച്ചൻ മാള',
    },
    'zzu4ugw0': {
      'en':
          'Vallyachan Mala, also known as Vallyachanpara, is a popular hill station located in the Kottayam district of Kerala, India. It is situated near the town of Vaikom and is known for its scenic beauty and panoramic views.Visitors to Vallyachan Mala can enjoy trekking and hiking through the hills, exploring the rich flora and fauna, and soaking in the tranquility of the surroundings. The hill station also offers opportunities for birdwatching, as various species of birds can be spotted in the area.',
      'hi':
          'वल्ल्याचन माला, जिसे वल्ल्याचनपारा के नाम से भी जाना जाता है, भारत के केरल के कोट्टायम जिले में स्थित एक लोकप्रिय हिल स्टेशन है। यह वैकोम शहर के पास स्थित है और अपनी प्राकृतिक सुंदरता और मनोरम दृश्यों के लिए जाना जाता है। वल्याचन माला के पर्यटक पहाड़ियों के माध्यम से ट्रैकिंग और लंबी पैदल यात्रा का आनंद ले सकते हैं, समृद्ध वनस्पतियों और जीवों की खोज कर सकते हैं और आसपास की शांति का आनंद ले सकते हैं। यह हिल स्टेशन पक्षियों को देखने के अवसर भी प्रदान करता है, क्योंकि इस क्षेत्र में पक्षियों की विभिन्न प्रजातियों को देखा जा सकता है।',
      'ml':
          'ഇന്ത്യയിലെ കേരളത്തിലെ കോട്ടയം ജില്ലയിൽ സ്ഥിതി ചെയ്യുന്ന ഒരു പ്രശസ്തമായ ഹിൽസ്റ്റേഷനാണ് വല്ല്യച്ചൻപാറ എന്നും അറിയപ്പെടുന്ന വല്ല്യച്ചൻ മല. വൈക്കം പട്ടണത്തിനടുത്താണ് ഇത് സ്ഥിതി ചെയ്യുന്നത്, അതിന്റെ പ്രകൃതിസൗന്ദര്യത്തിനും വിശാലമായ കാഴ്ചകൾക്കും പേരുകേട്ടതാണ് ഇത്. വല്ല്യച്ചൻ മലയിലെ സന്ദർശകർക്ക് മലനിരകളിലൂടെയുള്ള ട്രക്കിംഗും കാൽനടയാത്രയും ആസ്വദിക്കാം, സമ്പന്നമായ സസ്യജന്തുജാലങ്ങൾ പര്യവേക്ഷണം ചെയ്യുക, ചുറ്റുപാടുകളുടെ ശാന്തതയിൽ കുതിർന്ന്. വിവിധയിനം പക്ഷികളെ ഈ പ്രദേശത്ത് കാണാമെന്നതിനാൽ, പക്ഷിനിരീക്ഷണത്തിനുള്ള അവസരങ്ങളും ഹിൽ സ്റ്റേഷനിൽ ഒരുക്കുന്നുണ്ട്.',
    },
    'cheqf2xn': {
      'en': '360° image',
      'hi': '360° छवि',
      'ml': '360° ചിത്രം',
    },
    'rwpp2euk': {
      'en': 'Directions',
      'hi': 'दिशा-निर्देश',
      'ml': 'ദിശകൾ',
    },
    'wk3lkx93': {
      'en': 'Home',
      'hi': 'घर',
      'ml': 'വീട്',
    },
  },
  // Backwater
  {
    'ryvg2fji': {
      'en': 'KUMARAKOM',
      'hi': 'कुमारकोम',
      'ml': 'കുമരകം',
    },
    '24fkuqk5': {
      'en': 'VAIKOM',
      'hi': 'वाईकॉम',
      'ml': 'വൈക്കം',
    },
    'fshoh0dy': {
      'en': 'AYMANAM',
      'hi': 'अयमानम',
      'ml': 'അയ്മനം',
    },
    '1ws21qgm': {
      'en': 'THANNEERMUKKOM',
      'hi': 'तन्नीरमुक्कम',
      'ml': 'തണ്ണീർമുക്കം',
    },
    'sm6zb3vc': {
      'en': 'Home',
      'hi': 'घर',
      'ml': 'വീട്',
    },
  },
  // KUMARAKOM
  {
    'bdcc4ucc': {
      'en': 'KUMARAKOM',
      'hi': 'कुमारकोम',
      'ml': 'കുമരകം',
    },
    'r3ii7w26': {
      'en':
          'Kumarakom is a popular tourist destination situated in the Kottayam district of Kerala, India. It is a beautiful village located on the banks of Vembanad Lake, which is the largest lake in Kerala and one of the largest in India. Kumarakom is renowned for its backwater tourism, lush greenery, and serene atmosphere.it is also known for the Kumarakom Bird Sanctuary, which is spread across 14 acres of land.',
      'hi':
          'कुमारकोम भारत के केरल के कोट्टायम जिले में स्थित एक लोकप्रिय पर्यटन स्थल है। यह वेम्बनाड झील के किनारे स्थित एक खूबसूरत गाँव है, जो केरल की सबसे बड़ी झील है और भारत की सबसे बड़ी झीलों में से एक है। कुमारकोम अपने बैकवाटर पर्यटन, हरी-भरी हरियाली और शांत वातावरण के लिए प्रसिद्ध है। यह कुमारकोम पक्षी अभयारण्य के लिए भी जाना जाता है, जो 14 एकड़ भूमि में फैला हुआ है।',
      'ml':
          'ഇന്ത്യയിലെ കേരളത്തിലെ കോട്ടയം ജില്ലയിൽ സ്ഥിതി ചെയ്യുന്ന ഒരു പ്രശസ്തമായ വിനോദസഞ്ചാര കേന്ദ്രമാണ് കുമരകം. കേരളത്തിലെ ഏറ്റവും വലിയ തടാകവും ഇന്ത്യയിലെ ഏറ്റവും വലിയ തടാകവുമായ വേമ്പനാട് കായലിന്റെ തീരത്ത് സ്ഥിതി ചെയ്യുന്ന മനോഹരമായ ഗ്രാമമാണിത്. കുമരകം കായൽ വിനോദസഞ്ചാരത്തിനും പച്ചപ്പിനും ശാന്തമായ അന്തരീക്ഷത്തിനും പേരുകേട്ടതാണ്. 14 ഏക്കർ സ്ഥലത്ത് പരന്നുകിടക്കുന്ന കുമരകം പക്ഷി സങ്കേതത്തിനും ഇത് പേരുകേട്ടതാണ്.',
    },
    'fb6ojcd6': {
      'en': 'Home',
      'hi': 'घर',
      'ml': 'വീട്',
    },
  },
  // VAIKOM
  {
    'hkm7eux2': {
      'en': 'VAIKOM',
      'hi': 'वाईकॉम',
      'ml': 'വൈക്കം',
    },
    'wx8o7bi9': {
      'en':
          'Vaikom is a town located in the Kottayam district of Kerala, India. It is situated on the eastern shore of Vembanad Lake, one of the largest lakes in Kerala. Vaikom holds historical and cultural significance and is known for its religious heritage.One of the prominent attractions in Vaikom is the Vaikom Mahadeva Temple, dedicated to Lord Shiva.The town of Vaikom also has a bustling market area where you can find local produce, handicrafts, and traditional items.',
      'hi':
          'वाइकोम भारत के केरल राज्य के कोट्टायम जिले में स्थित एक शहर है। यह वेम्बनाड झील के पूर्वी किनारे पर स्थित है, जो केरल की सबसे बड़ी झीलों में से एक है। वैकोम ऐतिहासिक और सांस्कृतिक महत्व रखता है और अपनी धार्मिक विरासत के लिए जाना जाता है। वैकोम में प्रमुख आकर्षणों में से एक वैकोम महादेव मंदिर है, जो भगवान शिव को समर्पित है। वैकोम शहर में एक हलचल भरा बाजार क्षेत्र भी है जहां आप स्थानीय उत्पाद, हस्तशिल्प पा सकते हैं। , और पारंपरिक वस्तुएँ।',
      'ml':
          'കേരളത്തിലെ കോട്ടയം ജില്ലയിൽ സ്ഥിതി ചെയ്യുന്ന ഒരു പട്ടണമാണ് വൈക്കം. കേരളത്തിലെ ഏറ്റവും വലിയ തടാകങ്ങളിലൊന്നായ വേമ്പനാട് കായലിന്റെ കിഴക്കൻ തീരത്താണ് ഇത് സ്ഥിതി ചെയ്യുന്നത്. വൈക്കം ചരിത്രപരവും സാംസ്കാരികവുമായ പ്രാധാന്യമുള്ളതും മതപരമായ പൈതൃകത്തിനും പേരുകേട്ട സ്ഥലമാണ്. വൈക്കത്തെ പ്രധാന ആകർഷണങ്ങളിലൊന്നാണ് ശിവന് സമർപ്പിച്ചിരിക്കുന്ന വൈക്കം മഹാദേവ ക്ഷേത്രം. വൈക്കം നഗരത്തിൽ തിരക്കേറിയ മാർക്കറ്റ് ഏരിയയും ഉണ്ട്, അവിടെ നിങ്ങൾക്ക് പ്രാദേശിക ഉൽപ്പന്നങ്ങളും കരകൗശല വസ്തുക്കളും ലഭിക്കും. , പരമ്പരാഗത ഇനങ്ങൾ.',
    },
    'khourgvw': {
      'en': '360° image',
      'hi': '360° छवि',
      'ml': '360° ചിത്രം',
    },
    '3ofsit57': {
      'en': 'Directions',
      'hi': 'दिशा-निर्देश',
      'ml': 'ദിശകൾ',
    },
    'f4j9kfiu': {
      'en': 'Home',
      'hi': 'घर',
      'ml': 'വീട്',
    },
  },
  // AYMANAM
  {
    't9u98htr': {
      'en': 'AYMANAM',
      'hi': 'अयमानम',
      'ml': 'അയ്മനം',
    },
    '1tg1ops4': {
      'en':
          'Aymanam is a village located in the Kottayam district of Kerala, India. It is situated on the banks of the Meenachil River, a tributary of the Pamba River. Aymanam is known for its scenic beauty, cultural heritage, and its connection to renowned Indian author Arundhati Roy\'s novel, \"The God of Small Things.\"The village of Aymanam is characterized by its lush greenery, coconut groves, and tranquil backwater landscapes. The Meenachil River flows through the village, offering picturesque views and opportunities for boat rides and cruises.',
      'hi':
          'अयमानम भारत के केरल राज्य के कोट्टायम जिले में स्थित एक गाँव है। यह पंबा नदी की सहायक मीनाचिल नदी के तट पर स्थित है। अयमानम अपनी प्राकृतिक सुंदरता, सांस्कृतिक विरासत और प्रसिद्ध भारतीय लेखिका अरुंधति रॉय के उपन्यास, \"द गॉड ऑफ स्मॉल थिंग्स\" से इसके संबंध के लिए जाना जाता है। अयमानम गांव की विशेषता इसकी हरी-भरी हरियाली, नारियल के पेड़ और शांत बैकवाटर परिदृश्य हैं। मीनाचिल नदी गाँव से होकर बहती है, जो सुरम्य दृश्य और नाव की सवारी और परिभ्रमण के अवसर प्रदान करती है।',
      'ml':
          'കേരളത്തിലെ കോട്ടയം ജില്ലയിൽ സ്ഥിതി ചെയ്യുന്ന ഒരു ഗ്രാമമാണ് അയ്മനം. പമ്പ നദിയുടെ കൈവഴിയായ മീനച്ചിൽ നദിയുടെ തീരത്താണ് ഇത് സ്ഥിതി ചെയ്യുന്നത്. അതിമനോഹരമായ സൗന്ദര്യത്തിനും സാംസ്കാരിക പൈതൃകത്തിനും പ്രശസ്ത ഇന്ത്യൻ എഴുത്തുകാരി അരുന്ധതി റോയിയുടെ \"ദി ഗോഡ് ഓഫ് സ്മോൾ തിംഗ്സ്\" എന്ന നോവലുമായുള്ള ബന്ധത്തിനും പേരുകേട്ടതാണ് അയ്മനം. പച്ചപ്പ്, തെങ്ങിൻ തോപ്പുകൾ, ശാന്തമായ കായൽ പ്രകൃതിദൃശ്യങ്ങൾ എന്നിവയാണ് അയ്മനം ഗ്രാമത്തിന്റെ സവിശേഷത. മീനച്ചിൽ നദി ഗ്രാമത്തിലൂടെ ഒഴുകുന്നു, മനോഹരമായ കാഴ്ചകളും ബോട്ട് സവാരികൾക്കും ക്രൂയിസുകൾക്കും അവസരമൊരുക്കുന്നു.',
    },
    '6fkjushe': {
      'en': 'Home',
      'hi': 'घर',
      'ml': 'വീട്',
    },
  },
  // THANNEERMUKKOM
  {
    '9dew7x80': {
      'en': 'THANNEERMUKKOM',
      'hi': 'तन्नीरमुक्कम',
      'ml': 'തണ്ണീർമുക്കം',
    },
    'uz3k9yo6': {
      'en':
          'It has been built across Lake Vembanad. It connects Vechoor of Vaikom taluk of Kottayam district and Thanneermukkom of Cherthala taluk Alappuzha district. It can be reached by road, from Kottayam town, Alappuzha or Cherthala. Frequent bus services are available from all the places mentioned.',
      'hi':
          'इसे वेम्बनाड झील के पार बनाया गया है। यह कोट्टायम जिले के वैकोम तालुक के वेचूर और चेरथला तालुक अलप्पुझा जिले के थान्नीरमुक्कोम को जोड़ता है। यहां कोट्टायम शहर, अलाप्पुझा या चेरथला से सड़क मार्ग द्वारा पहुंचा जा सकता है। उल्लिखित सभी स्थानों से लगातार बस सेवाएँ उपलब्ध हैं।',
      'ml':
          'വേമ്പനാട് കായലിന് കുറുകെയാണ് ഇത് നിർമ്മിച്ചിരിക്കുന്നത്. കോട്ടയം ജില്ലയിലെ വൈക്കം താലൂക്കിലെ വെച്ചൂരിനെയും ആലപ്പുഴ ജില്ലയിലെ ചേർത്തല താലൂക്കിലെ തണ്ണീർമുക്കിനെയും ഇത് ബന്ധിപ്പിക്കുന്നു. കോട്ടയം ടൗണിൽ നിന്നോ ആലപ്പുഴയിൽ നിന്നോ ചേർത്തലയിൽ നിന്നോ റോഡ് മാർഗം ഇവിടെയെത്താം. സൂചിപ്പിച്ച എല്ലാ സ്ഥലങ്ങളിൽ നിന്നും പതിവായി ബസ് സർവീസുകൾ ലഭ്യമാണ്.',
    },
    'tlrmup4f': {
      'en': '360° image',
      'hi': '360° छवि',
      'ml': '360° ചിത്രം',
    },
    'skl2x0a9': {
      'en': 'Directions',
      'hi': 'दिशा-निर्देश',
      'ml': 'ദിശകൾ',
    },
    '9fle2gyo': {
      'en': 'Home',
      'hi': 'घर',
      'ml': 'വീട്',
    },
  },
  // ROOMCHOICES
  {
    '9b2h3ekq': {
      'en': 'Hotel Name: ',
      'hi': 'होटल का नाम:',
      'ml': 'ഹോട്ടലിന്റെ പേര്:',
    },
    '2bhnsqtz': {
      'en': 'Address: ',
      'hi': 'पता:',
      'ml': 'വിലാസം:',
    },
    'mha2z15y': {
      'en': 'Rate/day: ',
      'hi': 'दर/दिन:',
      'ml': 'നിരക്ക്/ദിവസം:',
    },
    'cfqbp7v7': {
      'en': 'Contact: ',
      'hi': 'दर/दिन:',
      'ml': 'നിരക്ക്/ദിവസം:',
    },
    'u68a5ja9': {
      'en': 'RoomsAvailable: ',
      'hi': 'कमरे उपलब्ध:',
      'ml': 'ലഭ്യമായ മുറികൾ:',
    },
    'p1of3yuu': {
      'en': 'Admin Verified',
      'hi': 'व्यवस्थापक सत्यापित',
      'ml': 'അഡ്മിൻ പരിശോധിച്ചു',
    },
    'iu49gn77': {
      'en': 'Please Enter The Required Rooms At The \nEnd Of This Page!',
      'hi': 'कृपया आवश्यक कमरों में प्रवेश करें\nइस पेज का अंत!',
      'ml': 'ദയവസരത്തിൽ ആവശ്യമായ മുറികൾ നൽകുക\nഈ പേജിന്റെ അവസാനം!',
    },
    'wznlfmn0': {
      'en': 'Choose',
      'hi': 'चुनना',
      'ml': 'തിരഞ്ഞെടുക്കുക',
    },
    'asijbrc0': {
      'en': 'Enter Rooms required and press icon...>>',
      'hi': 'आवश्यक कमरे दर्ज करें और आइकन दबाएं...>>',
      'ml': 'ആവശ്യമുള്ള മുറികൾ നൽകി ഐക്കൺ അമർത്തുക...>>',
    },
    'pvnh52zv': {
      'en': 'Room Choices ',
      'hi': 'कमरे का विकल्प',
      'ml': 'റൂം തിരഞ്ഞെടുപ്പുകൾ',
    },
    '7by4z8t9': {
      'en': 'Home',
      'hi': 'घर',
      'ml': 'വീട്',
    },
  },
  // RatingPage
  {
    'ai8r9mc5': {
      'en': 'Reviews',
      'hi': 'समीक्षा',
      'ml': 'അവലോകനങ്ങൾ',
    },
    'bcqks8dd': {
      'en': 'Share Your Experience and Help Others Make\nInformed Decisions',
      'hi':
          'अपना अनुभव साझा करें और दूसरों को बनाने में मदद करें\nसूचित निर्णय',
      'ml':
          'നിങ്ങളുടെ അനുഭവം പങ്കിടുകയും മറ്റുള്ളവരെ സഹായിക്കുകയും ചെയ്യുക\nഅറിയിച്ച തീരുമാനങ്ങൾ',
    },
    'z7g2d72p': {
      'en': 'Hotel Name',
      'hi': 'होटल का नाम',
      'ml': 'ഹോട്ടലിന്റെ പേര്',
    },
    'ntkqmh97': {
      'en': 'Enter Hotel Name...',
      'hi': 'होटल का नाम दर्ज करें...',
      'ml': 'ഹോട്ടലിന്റെ പേര് നൽകുക...',
    },
    'u77lnivo': {
      'en': 'Review',
      'hi': 'समीक्षा',
      'ml': 'അവലോകനം',
    },
    'fxn4z637': {
      'en': 'Write your review here...',
      'hi': 'अपनी समीक्षा यहां लिखें...',
      'ml': 'നിങ്ങളുടെ അവലോകനം ഇവിടെ എഴുതുക...',
    },
    'ztd65xbq': {
      'en': 'Submit!',
      'hi': 'जमा करना!',
      'ml': 'സമർപ്പിക്കുക!',
    },
    '20q114v3': {
      'en': 'Home',
      'hi': 'घर',
      'ml': 'വീട്',
    },
  },
  // AppOpenPage
  {
    'c5h64kf8': {
      'en': 'Welcome To Tripwiser!',
      'hi': 'ट्रिपवाइजर में आपका स्वागत है!',
      'ml': 'ട്രിപ്പ്വൈസറിലേക്ക് സ്വാഗതം!',
    },
    '6k5b5kf0': {
      'en':
          'Discover, Explore, and Experience with Tripwiser - Your Travel Companion',
      'hi':
          'ट्रिपवाइजर के साथ खोजें, अन्वेषण करें और अनुभव करें - आपका यात्रा साथी',
      'ml':
          'ട്രിപ്പ്വൈസർ ഉപയോഗിച്ച് കണ്ടെത്തുക, പര്യവേക്ഷണം ചെയ്യുക, അനുഭവിക്കുക - നിങ്ങളുടെ യാത്രാ കൂട്ടാളി',
    },
    '0mu4wik4': {
      'en': 'Choose Your Login Option Below',
      'hi': 'नीचे अपना लॉगिन विकल्प चुनें',
      'ml': 'താഴെ നിങ്ങളുടെ ലോഗിൻ ഓപ്ഷൻ തിരഞ്ഞെടുക്കുക',
    },
    'ggsfba9v': {
      'en': 'User',
      'hi': 'उपयोगकर्ता',
      'ml': 'ഉപയോക്താവ്',
    },
    'zyifz4kb': {
      'en': 'Admin',
      'hi': 'व्यवस्थापक',
      'ml': 'അഡ്മിൻ',
    },
    'haxfw9jq': {
      'en': 'Home',
      'hi': 'घर',
      'ml': 'വീട്',
    },
  },
  // AdminLogin
  {
    'zgr6zjv0': {
      'en': 'Get Started, Admin!',
      'hi': 'आरंभ करें, व्यवस्थापक!',
      'ml': 'ആരംഭിക്കുക, അഡ്മിൻ!',
    },
    'wh6p497b': {
      'en': 'Email Address',
      'hi': 'मेल पता',
      'ml': 'ഇമെയിൽ വിലാസം',
    },
    'r2t2gx7b': {
      'en': 'Enter your email here...',
      'hi': 'अपना ई मेल यहा भरे...',
      'ml': 'നിങ്ങളുടെ ഇമെയിൽ ഇവിടെ നൽകുക...',
    },
    '6ltxut0z': {
      'en': 'Password',
      'hi': 'पासवर्ड',
      'ml': 'Password',
    },
    'iafwuf87': {
      'en': 'Enter your password here...',
      'hi': 'यहां अपना पासवर्ड डालें...',
      'ml': 'നിങ്ങളുടെ പാസ്‌വേഡ് ഇവിടെ നൽകുക...',
    },
    'ki856vbj': {
      'en': 'Login',
      'hi': 'लॉग इन करें',
      'ml': 'ലോഗിൻ',
    },
    'yf6xamb6': {
      'en': 'Home',
      'hi': 'घर',
      'ml': 'വീട്',
    },
  },
  // HOwnerDataEntryPage
  {
    'l02w2qv5': {
      'en': 'Get Started As Owner!',
      'hi': 'स्वामी के रूप में आरंभ करें!',
      'ml': 'ഉടമയായി ആരംഭിക്കുക!',
    },
    'edl50z3l': {
      'en': 'Get Started As Owner!',
      'hi': 'स्वामी के रूप में आरंभ करें!',
      'ml': 'ഉടമയായി ആരംഭിക്കുക!',
    },
    '5buhtw51': {
      'en':
          'Gain authorization by uploading your documents securely and effortlessly. Take the first step towards unlocking a world of possibilities!',
      'hi':
          'अपने दस्तावेज़ सुरक्षित और सहजता से अपलोड करके प्राधिकरण प्राप्त करें। संभावनाओं की दुनिया को खोलने की दिशा में पहला कदम उठाएँ!',
      'ml':
          'നിങ്ങളുടെ പ്രമാണങ്ങൾ സുരക്ഷിതമായും അനായാസമായും അപ്‌ലോഡ് ചെയ്യുന്നതിലൂടെ അംഗീകാരം നേടുക. സാധ്യതകളുടെ ഒരു ലോകം അൺലോക്ക് ചെയ്യുന്നതിനുള്ള ആദ്യപടി സ്വീകരിക്കുക!',
    },
    'xqlcalpf': {
      'en': 'Name',
      'hi': 'नाम',
      'ml': 'പേര്',
    },
    'bvs0jpcw': {
      'en': 'Enter your name here...',
      'hi': 'अपना नाम यहाँ दर्ज करें...',
      'ml': 'നിങ്ങളുടെ പേര് ഇവിടെ നൽകുക...',
    },
    'e8j6xnwe': {
      'en': 'Phone Number',
      'hi': 'फ़ोन नंबर',
      'ml': 'ഫോൺ നമ്പർ',
    },
    'mq6jon54': {
      'en': 'Enter your phone number here...',
      'hi': 'यहां अपना फ़ोन नंबर दर्ज करें...',
      'ml': 'നിങ്ങളുടെ ഫോൺ നമ്പർ ഇവിടെ നൽകുക...',
    },
    'nv77rhzh': {
      'en': 'Email ID',
      'hi': 'ईमेल आईडी',
      'ml': 'ഇ - മെയിൽ ഐഡി',
    },
    '0jo9vzud': {
      'en': 'Enter your Email here...',
      'hi': 'अपना ई मेल यहा भरे...',
      'ml': 'നിങ്ങളുടെ ഇമെയിൽ ഇവിടെ നൽകുക...',
    },
    '34k10uz6': {
      'en': 'Address',
      'hi': 'पता',
      'ml': 'വിലാസം',
    },
    '49zh8utl': {
      'en': 'Enter the full address of your hotel...',
      'hi': 'अपने होटल का पूरा पता दर्ज करें...',
      'ml': 'നിങ്ങളുടെ ഹോട്ടലിന്റെ മുഴുവൻ വിലാസവും നൽകുക...',
    },
    'vkzd6vw1': {
      'en': 'Upload Room Pics',
      'hi': 'कमरे की तस्वीरें अपलोड करें',
      'ml': 'റൂം ചിത്രങ്ങൾ അപ്‌ലോഡ് ചെയ്യുക',
    },
    'uc695im9': {
      'en': 'Continue',
      'hi': 'जारी रखना',
      'ml': 'തുടരുക',
    },
    'jciqj8y0': {
      'en': 'Home',
      'hi': 'घर',
      'ml': 'വീട്',
    },
  },
  // OwnerAssets
  {
    '7rfd2zlr': {
      'en': 'Seamless Credential Verification for Hotel Room Owners!',
      'hi': 'होटल के कमरे के मालिकों के लिए निर्बाध क्रेडेंशियल सत्यापन!',
      'ml': 'ഹോട്ടൽ റൂം ഉടമകൾക്ക് തടസ്സമില്ലാത്ത ക്രെഡൻഷ്യൽ പരിശോധന!',
    },
    'upm34nhu': {
      'en': 'Provide Essential informations Below ',
      'hi': 'नीचे आवश्यक जानकारी प्रदान करें',
      'ml': 'അവശ്യ വിവരങ്ങൾ ചുവടെ നൽകുക',
    },
    'uqs5lljn': {
      'en': 'Enter accommodation service name...',
      'hi': 'आवास सेवा का नाम दर्ज करें...',
      'ml': 'താമസ സേവനത്തിന്റെ പേര് നൽകുക...',
    },
    'zt8vkdga': {
      'en': 'Enter number of rooms available...',
      'hi': 'उपलब्ध कमरों की संख्या दर्ज करें...',
      'ml': 'ലഭ്യമായ മുറികളുടെ എണ്ണം നൽകുക...',
    },
    '7w8uxvhp': {
      'en': 'Enter rate/day...',
      'hi': 'दर/दिन दर्ज करें...',
      'ml': 'നിരക്ക്/ദിവസം നൽകുക...',
    },
    '1day0gj9': {
      'en': 'Enter accommodation licence number...',
      'hi': 'आवास लाइसेंस संख्या दर्ज करें...',
      'ml': 'താമസ ലൈസൻസ് നമ്പർ നൽകുക...',
    },
    'tlt0l697': {
      'en': 'Upload Accommodation Certificate for Verification',
      'hi': 'सत्यापन के लिए आवास प्रमाणपत्र अपलोड करें',
      'ml': 'സ്ഥിരീകരണത്തിനായി താമസ സർട്ടിഫിക്കറ്റ് അപ്‌ലോഡ് ചെയ്യുക',
    },
    'ulza4zl4': {
      'en': 'Upload',
      'hi': 'डालना',
      'ml': 'അപ്‌ലോഡ് ചെയ്യുക',
    },
    'vgqofcs3': {
      'en': 'Save',
      'hi': 'बचाना',
      'ml': 'രക്ഷിക്കും',
    },
    'vg5mvrdl': {
      'en': 'Click Here To Clear The Above Selection',
      'hi': 'उपरोक्त चयन को साफ़ करने के लिए यहां क्लिक करें',
      'ml': 'മുകളിലുള്ള സെലക്ഷൻ മായ്ക്കാൻ ഇവിടെ ക്ലിക്ക് ചെയ്യുക',
    },
    'l2sf31s1': {
      'en': 'Submit',
      'hi': 'जमा करना',
      'ml': 'സമർപ്പിക്കുക',
    },
    'grj2s5kk': {
      'en': 'Home',
      'hi': 'घर',
      'ml': 'വീട്',
    },
  },
  // AdminDashboard
  {
    'c22g2dw9': {
      'en': 'Tracker',
      'hi': 'परियोजनाओं',
      'ml': 'പദ്ധതികൾ',
    },
    'i73u0go6': {
      'en': 'Track Your Progress',
      'hi': 'अपनी प्रगति को ट्रैक करें',
      'ml': 'നിങ്ങളുടെ പുരോഗതി ട്രാക്ക് ചെയ്യുക',
    },
    'vslwawle': {
      'en': 'Owner Verifications',
      'hi': 'स्वामी सत्यापन',
      'ml': 'ഉടമ സ്ഥിരീകരണങ്ങൾ',
    },
    'uep3ze6l': {
      'en': 'Manage and Monitor\nYour Accommodation Network',
      'hi': 'प्रबंधन और निगरानी करें\nआपका आवास नेटवर्क',
      'ml': 'നിയന്ത്രിക്കുകയും നിരീക്ഷിക്കുകയും ചെയ്യുക\nനിങ്ങളുടെ താമസ ശൃംഖല',
    },
    'oq4fg130': {
      'en': 'User Details',
      'hi': 'उपयोगकर्ता विवरण',
      'ml': 'ഉപയോക്തൃ വിശദാംശങ്ങൾ',
    },
    '059qis6n': {
      'en': 'Explore User Details and Activity at a Glance',
      'hi': 'एक नज़र में उपयोगकर्ता विवरण और गतिविधि देखें',
      'ml':
          'ഉപയോക്തൃ വിശദാംശങ്ങളും പ്രവർത്തനങ്ങളും ഒറ്റനോട്ടത്തിൽ പര്യവേക്ഷണം ചെയ്യുക',
    },
    'humwd88o': {
      'en': 'Add New Restaurants ',
      'hi': 'नए रेस्तरां जोड़ें',
      'ml': 'പുതിയ റെസ്റ്റോറന്റുകൾ ചേർക്കുക',
    },
    '902nwl9d': {
      'en': 'Add informations of new restaurants',
      'hi': 'नए रेस्तरां की जानकारी जोड़ें',
      'ml': 'പുതിയ റെസ്റ്റോറന്റുകളുടെ വിവരങ്ങൾ ചേർക്കുക',
    },
    'q1twnphb': {
      'en': 'Add Hospitals',
      'hi': 'अस्पताल जोड़ें',
      'ml': 'ആശുപത്രികൾ ചേർക്കുക',
    },
    'xj4n2wh3': {
      'en': 'Add Essential Information about the Hospital',
      'hi': 'अस्पताल के बारे में आवश्यक जानकारी जोड़ें',
      'ml': 'ആശുപത്രിയെക്കുറിച്ചുള്ള അവശ്യ വിവരങ്ങൾ ചേർക്കുക',
    },
    'i0e9mzy7': {
      'en': 'LogOut',
      'hi': 'लॉग आउट',
      'ml': 'ലോഗ് ഔട്ട്',
    },
    '6lx9955l': {
      'en': 'Admin Dashboard',
      'hi': 'व्यवस्थापक डैशबोर्ड',
      'ml': 'അഡ്മിൻ ഡാഷ്ബോർഡ്',
    },
    'ak4q1my4': {
      'en': '__',
      'hi': '__',
      'ml': '__',
    },
  },
  // RestaurantsList
  {
    'y0e8bw33': {
      'en': 'Resturants Nearby',
      'hi': 'आस-पास के रेस्तरां',
      'ml': 'സമീപത്തുള്ള ഭക്ഷണശാലകൾ',
    },
    'xvpf5epi': {
      'en': 'some of the popular restaurants around kottyam',
      'hi': 'कोट्टयम के आसपास के कुछ लोकप्रिय रेस्तरां',
      'ml': 'കോട്ടയത്തിന് ചുറ്റുമുള്ള ചില ജനപ്രിയ റെസ്റ്റോറന്റുകൾ',
    },
    '0bedxd66': {
      'en': 'Veg Or Non-Veg: ',
      'hi': 'शाकाहारी या गैर-शाकाहारी:',
      'ml': 'വെജ് അല്ലെങ്കിൽ നോൺ വെജ്:',
    },
    'rvfhc5ci': {
      'en': 'Home',
      'hi': 'घर',
      'ml': 'വീട്',
    },
  },
  // HotelOwnerVerificationPage
  {
    'lbm8fu6v': {
      'en': 'Certification Request Queue',
      'hi': 'प्रमाणीकरण अनुरोध कतार',
      'ml': 'സർട്ടിഫിക്കേഷൻ അഭ്യർത്ഥന ക്യൂ',
    },
    'jirzmybx': {
      'en':
          'Manage and Review Owner Submissions and new owner \nregistration requests listed below',
      'hi':
          'स्वामी सबमिशन और नए स्वामी को प्रबंधित और समीक्षा करें\nपंजीकरण अनुरोध नीचे सूचीबद्ध हैं',
      'ml':
          'ഉടമ സമർപ്പിക്കലുകളും പുതിയ ഉടമയും നിയന്ത്രിക്കുകയും അവലോകനം ചെയ്യുകയും ചെയ്യുക\nരജിസ്ട്രേഷൻ അഭ്യർത്ഥനകൾ ചുവടെ പട്ടികപ്പെടുത്തിയിരിക്കുന്നു',
    },
    '3wagegrt': {
      'en': 'Name:  ',
      'hi': 'नाम:',
      'ml': 'പേര്:',
    },
    'abruxv61': {
      'en': 'Address:  ',
      'hi': 'पता:',
      'ml': 'വിലാസം:',
    },
    'yttu2ftw': {
      'en': 'Phone Number:  ',
      'hi': 'फ़ोन नंबर:',
      'ml': 'ഫോൺ നമ്പർ:',
    },
    'zmdllqgt': {
      'en': 'Email:  ',
      'hi': 'ईमेल:',
      'ml': 'ഇമെയിൽ:',
    },
    'sgtsby0u': {
      'en': 'Rate/Day:  ',
      'hi': 'दर/दिन:',
      'ml': 'നിരക്ക്/ദിവസം:',
    },
    '8bbrv70y': {
      'en': 'Address:  ',
      'hi': 'पता:',
      'ml': 'വിലാസം:',
    },
    'ctslqkf3': {
      'en': 'Service Name:  ',
      'hi': 'सेवा का नाम:',
      'ml': 'സേവനത്തിന്റെ പേര്:',
    },
    'avvtjmif': {
      'en': 'License Number:  ',
      'hi': 'लाइसेंस संख्या:',
      'ml': 'ലൈസൻസ് നമ്പർ:',
    },
    'r6p3u343': {
      'en': 'CERTIFICATE BELOW',
      'hi': 'नीचे प्रमाणपत्र',
      'ml': 'സർട്ടിഫിക്കറ്റ് താഴെ',
    },
    'jedf3dtj': {
      'en': 'Click on the image to expand',
      'hi': 'विस्तृत करने के लिए छवि पर क्लिक करें',
      'ml': 'വികസിപ്പിക്കാൻ ചിത്രത്തിൽ ക്ലിക്ക് ചെയ്യുക',
    },
    '6fg2qbgf': {
      'en': 'Room Image Below',
      'hi': 'नीचे कमरे की छवि',
      'ml': 'മുറിയുടെ ചിത്രം താഴെ',
    },
    'cal3kuoz': {
      'en': 'Verify And Add',
      'hi': 'सत्यापित करें और जोड़ें',
      'ml': 'പരിശോധിച്ച് ചേർക്കുക',
    },
    'ui056bdc': {
      'en': 'Home',
      'hi': 'घर',
      'ml': 'വീട്',
    },
  },
  // CurrentUsers
  {
    '1aa5q8s9': {
      'en': 'Current Users',
      'hi': 'मौजूदा उपयोगकर्ता',
      'ml': 'നിലവിലെ ഉപയോക്താക്കൾ',
    },
    'y60tba4p': {
      'en':
          'Explore User Details: Gain Insights and Manage\nUser Information, This list may include Hotel Owners as well',
      'hi':
          'उपयोगकर्ता विवरण देखें: जानकारी प्राप्त करें और प्रबंधित करें\nउपयोगकर्ता जानकारी, इस सूची में होटल मालिक भी शामिल हो सकते हैं',
      'ml':
          'ഉപയോക്തൃ വിശദാംശങ്ങൾ പര്യവേക്ഷണം ചെയ്യുക: സ്ഥിതിവിവരക്കണക്കുകൾ നേടുകയും നിയന്ത്രിക്കുകയും ചെയ്യുക\nഉപയോക്തൃ വിവരങ്ങൾ, ഈ ലിസ്റ്റിൽ ഹോട്ടൽ ഉടമകളും ഉൾപ്പെട്ടേക്കാം',
    },
    '23pt5f7w': {
      'en': 'Name:  ',
      'hi': 'नाम:',
      'ml': 'പേര്:',
    },
    'uef3j4uf': {
      'en': 'Phone Number:  ',
      'hi': 'फ़ोन नंबर:',
      'ml': 'ഫോൺ നമ്പർ:',
    },
    '26xpua8u': {
      'en': 'Email:  ',
      'hi': 'ईमेल:',
      'ml': 'ഇമെയിൽ:',
    },
    '89psp5nu': {
      'en': 'Age:  ',
      'hi': 'आयु:',
      'ml': 'പ്രായം:',
    },
    'lacsvpbl': {
      'en': 'City:  ',
      'hi': 'शहर:',
      'ml': 'നഗരം:',
    },
    'npjmfrdh': {
      'en': 'Created Time:  ',
      'hi': 'निर्मित समय:',
      'ml': 'സൃഷ്ടിച്ച സമയം:',
    },
    '3ug0rxeq': {
      'en': 'Home',
      'hi': 'घर',
      'ml': 'വീട്',
    },
  },
  // RestaurantsUpdate
  {
    '70zdtos6': {
      'en': 'Add New Restaurants! ',
      'hi': 'नए रेस्तरां जोड़ें!',
      'ml': 'പുതിയ റെസ്റ്റോറന്റുകൾ ചേർക്കുക!',
    },
    'x2oe50q9': {
      'en': 'Add New Restaurant: Expand Your Culinary Offerings',
      'hi': 'नया रेस्तरां जोड़ें: अपनी पाककला संबंधी पेशकशों का विस्तार करें',
      'ml':
          'പുതിയ റെസ്റ്റോറന്റ് ചേർക്കുക: നിങ്ങളുടെ പാചക ഓഫറുകൾ വികസിപ്പിക്കുക',
    },
    'c7xsxizm': {
      'en': 'Enter new restaurant name...',
      'hi': 'नया रेस्तरां नाम दर्ज करें...',
      'ml': 'പുതിയ റെസ്റ്റോറന്റ് പേര് നൽകുക...',
    },
    'mbjc3lyb': {
      'en': 'Enter place...',
      'hi': 'स्थान दर्ज करें...',
      'ml': 'സ്ഥലം നൽകുക...',
    },
    'eh65aat7': {
      'en': 'Veg /Non-Veg OR Both...',
      'hi': 'शाकाहारी/नॉन-वेज या दोनों...',
      'ml': 'വെജ് / നോൺ വെജ് അല്ലെങ്കിൽ രണ്ടും...',
    },
    'c821eure': {
      'en': 'Enter google map direction link..',
      'hi': 'गूगल मानचित्र दिशा लिंक दर्ज करें..',
      'ml': 'ഗൂഗിൾ മാപ്പ് ദിശ ലിങ്ക് നൽകുക..',
    },
    'akll7je9': {
      'en': 'Upload Restaurant Image ',
      'hi': 'रेस्तरां छवि अपलोड करें',
      'ml': 'റെസ്റ്റോറന്റ് ചിത്രം അപ്‌ലോഡ് ചെയ്യുക',
    },
    'lo9ozm76': {
      'en': 'Upload Image',
      'hi': 'तस्विर अपलोड करना',
      'ml': 'ചിത്രം അപ്ലോഡ് ചെയ്യുക',
    },
    'e99mx1b5': {
      'en': 'Save Changes',
      'hi': 'परिवर्तनों को सुरक्षित करें',
      'ml': 'മാറ്റങ്ങൾ സൂക്ഷിക്കുക',
    },
    'spxekzhd': {
      'en': 'Home',
      'hi': 'घर',
      'ml': 'വീട്',
    },
  },
  // supportpage
  {
    'v99normo': {
      'en': 'WE CAN HELP YOU!',
      'hi': 'हम आप की मदद कर सकते हैं!',
      'ml': 'ഞങ്ങൾക്ക് നിങ്ങളെ സഹായിക്കാനാകും!',
    },
    'q43pjg68': {
      'en': 'send us an email:',
      'hi': 'हमें एक ईमेल भेजो:',
      'ml': 'ഞങ്ങൾക്ക് ഒരു ഇമെയിൽ അയയ്ക്കുക:',
    },
    '0z5g1z9r': {
      'en': 'tripwiser23@gmail.com',
      'hi': 'ट्रिपवाइज़र23@gmail.com',
      'ml': 'tripwiser23@gmail.com',
    },
    'n55ifcef': {
      'en': 'Reach the support team',
      'hi': 'सहायता टीम तक पहुंचें',
      'ml': 'പിന്തുണാ ടീമിനെ സമീപിക്കുക',
    },
    'pyzjaoh2': {
      'en': 'Home',
      'hi': 'घर',
      'ml': 'വീട്',
    },
  },
  // termsandconditions
  {
    'p54i67z6': {
      'en': 'TERMS AND CONDITIONS',
      'hi': 'नियम और शर्तें',
      'ml': 'ഉപാധികളും നിബന്ധനകളും',
    },
    'krvi17hg': {
      'en':
          '1.Acceptance of Terms: Users are required to acknowledge and accept the terms and conditions in order to use the travel advisor application.\n\n2.User Eligibility: Users must meet certain eligibility criteria, such as being of legal age, to use the application.\n\n3.Account Creation: Users may be required to create an account, providing accurate and complete information, to access the features and services of the application.\n\n4.User Responsibilities: Users are responsible for maintaining the confidentiality of their account information, as well as for any activities or actions taken under their account.\n\n5.Services Provided: The terms and conditions should describe the services offered by the travel advisor application, which may include providing travel recommendations, itinerary planning, booking assistance, and other related services.\n\n6.Termination: The terms and conditions should specify the conditions under which the application provider can terminate a user\'s access to the service, as well as the user\'s rights to terminate their own account.\n\n7.Modifications to Terms: The application provider may reserve the right to modify or update the terms and conditions at any time, with or without prior notice to the users.\n',
      'hi':
          '1.शर्तों की स्वीकृति: उपयोगकर्ताओं को यात्रा सलाहकार एप्लिकेशन का उपयोग करने के लिए नियमों और शर्तों को स्वीकार करना आवश्यक है।\n\n2. उपयोगकर्ता पात्रता: एप्लिकेशन का उपयोग करने के लिए उपयोगकर्ताओं को कुछ पात्रता मानदंडों को पूरा करना होगा, जैसे कि कानूनी उम्र का होना।\n\n3.खाता निर्माण: उपयोगकर्ताओं को एप्लिकेशन की सुविधाओं और सेवाओं तक पहुंचने के लिए सटीक और पूरी जानकारी प्रदान करते हुए एक खाता बनाने की आवश्यकता हो सकती है।\n\n4.उपयोगकर्ता की जिम्मेदारियां: उपयोगकर्ता अपने खाते की जानकारी की गोपनीयता बनाए रखने के साथ-साथ अपने खाते के तहत की गई किसी भी गतिविधि या कार्रवाई के लिए जिम्मेदार हैं।\n\n5. प्रदान की गई सेवाएँ: नियम और शर्तों में यात्रा सलाहकार एप्लिकेशन द्वारा दी जाने वाली सेवाओं का वर्णन होना चाहिए, जिसमें यात्रा सिफारिशें, यात्रा कार्यक्रम योजना, बुकिंग सहायता और अन्य संबंधित सेवाएं प्रदान करना शामिल हो सकता है।\n\n6.समाप्ति: नियम और शर्तों में वे शर्तें निर्दिष्ट होनी चाहिए जिनके तहत एप्लिकेशन प्रदाता सेवा तक उपयोगकर्ता की पहुंच को समाप्त कर सकता है, साथ ही उपयोगकर्ता के अपने खाते को समाप्त करने के अधिकार भी।\n\n7. शर्तों में संशोधन: एप्लिकेशन प्रदाता उपयोगकर्ताओं को पूर्व सूचना के साथ या उसके बिना, किसी भी समय नियमों और शर्तों को संशोधित या अपडेट करने का अधिकार सुरक्षित रख सकता है।',
      'ml':
          '1. നിബന്ധനകളുടെ സ്വീകാര്യത: യാത്രാ ഉപദേശക അപേക്ഷ ഉപയോഗിക്കുന്നതിന് ഉപയോക്താക്കൾ നിബന്ധനകളും വ്യവസ്ഥകളും അംഗീകരിക്കുകയും അംഗീകരിക്കുകയും വേണം.\n\n2.ഉപയോക്തൃ യോഗ്യത: ആപ്ലിക്കേഷൻ ഉപയോഗിക്കുന്നതിന് ഉപയോക്താക്കൾ നിയമപരമായ പ്രായം പോലെയുള്ള ചില യോഗ്യതാ മാനദണ്ഡങ്ങൾ പാലിക്കണം.\n\n3.അക്കൗണ്ട് സൃഷ്‌ടിക്കൽ: ആപ്ലിക്കേഷന്റെ സവിശേഷതകളും സേവനങ്ങളും ആക്‌സസ് ചെയ്യുന്നതിന് കൃത്യവും പൂർണ്ണവുമായ വിവരങ്ങൾ നൽകിക്കൊണ്ട് ഉപയോക്താക്കൾ ഒരു അക്കൗണ്ട് സൃഷ്‌ടിക്കേണ്ടതായി വന്നേക്കാം.\n\n4.ഉപയോക്തൃ ഉത്തരവാദിത്തങ്ങൾ: ഉപയോക്താക്കൾക്ക് അവരുടെ അക്കൗണ്ട് വിവരങ്ങളുടെ രഹസ്യസ്വഭാവം നിലനിർത്തുന്നതിനും അവരുടെ അക്കൗണ്ടിന് കീഴിലുള്ള ഏതെങ്കിലും പ്രവർത്തനങ്ങൾക്കും പ്രവർത്തനങ്ങൾക്കും ഉത്തരവാദിത്തമുണ്ട്.\n\n5. നൽകിയിരിക്കുന്ന സേവനങ്ങൾ: യാത്രാ ഉപദേശക ആപ്ലിക്കേഷൻ നൽകുന്ന സേവനങ്ങളെ നിബന്ധനകളും വ്യവസ്ഥകളും വിവരിക്കണം, അതിൽ യാത്രാ നിർദ്ദേശങ്ങൾ, യാത്രാ പദ്ധതി ആസൂത്രണം, ബുക്കിംഗ് സഹായം, മറ്റ് അനുബന്ധ സേവനങ്ങൾ എന്നിവ ഉൾപ്പെടുന്നു.\n\n6. ടെർമിനേഷൻ: ഒരു ഉപയോക്താവിന്റെ സേവനത്തിലേക്കുള്ള പ്രവേശനം ആപ്ലിക്കേഷൻ ദാതാവിന് അവസാനിപ്പിക്കാൻ കഴിയുന്ന വ്യവസ്ഥകളും ഉപയോക്താക്കൾക്ക് അവരുടെ സ്വന്തം അക്കൗണ്ട് അവസാനിപ്പിക്കാനുള്ള അവകാശങ്ങളും നിബന്ധനകളും വ്യവസ്ഥകളും വ്യക്തമാക്കണം.\n\n7. നിബന്ധനകളിലെ പരിഷ്‌ക്കരണങ്ങൾ: ഉപയോക്താക്കൾക്ക് മുൻകൂർ അറിയിപ്പ് നൽകിയോ അല്ലാതെയോ ഏത് സമയത്തും നിബന്ധനകളും വ്യവസ്ഥകളും പരിഷ്‌ക്കരിക്കാനോ അപ്‌ഡേറ്റ് ചെയ്യാനോ ഉള്ള അവകാശം ആപ്ലിക്കേഷൻ ദാതാവിന് നിക്ഷിപ്‌തമായിരിക്കും.',
    },
    'l40g51wp': {
      'en': 'Home',
      'hi': 'घर',
      'ml': 'വീട്',
    },
  },
  // MedicalServices
  {
    'eevuxfet': {
      'en': 'Medical Services',
      'hi': 'चिकित्सा सेवाएं',
      'ml': 'മെഡിക്കൽ സേവനങ്ങൾ',
    },
    'qtuf0pyi': {
      'en': 'some of the medical servicess around kottyam',
      'hi': 'कोट्टयम के आसपास कुछ चिकित्सा सेवाएं',
      'ml': 'കോട്ടയത്തിന് ചുറ്റുമുള്ള ചില മെഡിക്കൽ സേവനങ്ങൾ',
    },
    't829ap2p': {
      'en': 'Home',
      'hi': 'घर',
      'ml': 'വീട്',
    },
  },
  // MedicalPlacesUPDATE
  {
    'cv47fcat': {
      'en': 'Add Hospitals',
      'hi': 'अस्पताल जोड़ें',
      'ml': 'ആശുപത്രികൾ ചേർക്കുക',
    },
    'id3dpgm9': {
      'en': 'Add New Hospital Details below',
      'hi': 'नीचे नए अस्पताल का विवरण जोड़ें',
      'ml': 'പുതിയ ആശുപത്രി വിശദാംശങ്ങൾ ചുവടെ ചേർക്കുക',
    },
    'ziwo8smu': {
      'en': 'Enter new hospital name...',
      'hi': 'अस्पताल का नया नाम दर्ज करें...',
      'ml': 'പുതിയ ആശുപത്രിയുടെ പേര് നൽകുക...',
    },
    'm00sjug5': {
      'en': 'Enter place...',
      'hi': 'स्थान दर्ज करें...',
      'ml': 'സ്ഥലം നൽകുക...',
    },
    'd7b9czuh': {
      'en': 'Enter Hospital contact number...',
      'hi': 'अस्पताल का संपर्क नंबर दर्ज करें...',
      'ml': 'ആശുപത്രി കോൺടാക്റ്റ് നമ്പർ നൽകുക...',
    },
    '6kcmp229': {
      'en': 'Enter google map direction link..',
      'hi': 'गूगल मानचित्र दिशा लिंक दर्ज करें..',
      'ml': 'ഗൂഗിൾ മാപ്പ് ദിശ ലിങ്ക് നൽകുക..',
    },
    'tdg621gu': {
      'en': 'Upload Hospital Image ',
      'hi': 'अस्पताल की छवि अपलोड करें',
      'ml': 'ആശുപത്രി ചിത്രം അപ്‌ലോഡ് ചെയ്യുക',
    },
    'w1awmxgp': {
      'en': 'Upload Image',
      'hi': 'तस्विर अपलोड करना',
      'ml': 'ചിത്രം അപ്ലോഡ് ചെയ്യുക',
    },
    'id2ydquu': {
      'en': 'Save Changes',
      'hi': 'परिवर्तनों को सुरक्षित करें',
      'ml': 'മാറ്റങ്ങൾ സൂക്ഷിക്കുക',
    },
    'x5kfk4vd': {
      'en': 'Home',
      'hi': 'घर',
      'ml': 'വീട്',
    },
  },
  // BookedRooms
  {
    '035ssxok': {
      'en': 'Your  Bookings',
      'hi': 'आपकी बुकिंग',
      'ml': 'നിങ്ങളുടെ ബുക്കിംഗുകൾ',
    },
    '892fmvip': {
      'en': 'View Your Bookings: Access and Review Your Reservations',
      'hi': 'अपनी बुकिंग देखें: अपने आरक्षण तक पहुंचें और उसकी समीक्षा करें',
      'ml':
          'നിങ്ങളുടെ ബുക്കിംഗുകൾ കാണുക: നിങ്ങളുടെ റിസർവേഷനുകൾ ആക്സസ് ചെയ്യുക, അവലോകനം ചെയ്യുക',
    },
    'hk81gry8': {
      'en': 'Hotel Name -',
      'hi': 'होटल का नाम -',
      'ml': 'ഹോട്ടലിന്റെ പേര് -',
    },
    'oe79uv8p': {
      'en': 'Start Date -',
      'hi': 'आरंभ करने की तिथि -',
      'ml': 'ആരംഭിക്കുന്ന തീയതി -',
    },
    'q1tmf04j': {
      'en': 'End Date -',
      'hi': 'अंतिम तिथि -',
      'ml': 'അവസാന ദിവസം -',
    },
    '86fuarwx': {
      'en': 'Cancel Booking',
      'hi': '',
      'ml': '',
    },
    '8z3u8c94': {
      'en': 'Home',
      'hi': 'घर',
      'ml': 'വീട്',
    },
  },
  // ReviewViewPageCopy
  {
    'pi1vf98e': {
      'en': 'All Reviews',
      'hi': 'सभी समीक्षाएँ',
      'ml': 'എല്ലാ അവലോകനങ്ങളും',
    },
    'm4w1upr3': {
      'en':
          'Discover What Our Customers Have to Say: Read Reviews \nand Testimonials',
      'hi':
          'जानें कि हमारे ग्राहक क्या कहते हैं: समीक्षाएँ पढ़ें\nऔर प्रशंसापत्र',
      'ml':
          'ഞങ്ങളുടെ ഉപഭോക്താക്കൾക്ക് എന്താണ് പറയാനുള്ളതെന്ന് കണ്ടെത്തുക: അവലോകനങ്ങൾ വായിക്കുക\nഒപ്പം സാക്ഷ്യപത്രങ്ങളും',
    },
    'hp2yxwmp': {
      'en': 'Hotel Name -',
      'hi': 'होटल का नाम -',
      'ml': 'ഹോട്ടലിന്റെ പേര് -',
    },
    's9helwvz': {
      'en': 'Rating - ',
      'hi': 'रेटिंग -',
      'ml': 'റേറ്റിംഗ് -',
    },
    '2njs9y35': {
      'en': 'Home',
      'hi': 'घर',
      'ml': 'വീട്',
    },
  },
  // Adventure
  {
    'i7xy4q4x': {
      'en': 'Aruvikuzhi Waterfalls',
      'hi': 'कुमारकोम',
      'ml': 'കുമരകം',
    },
    'dotp0ok8': {
      'en': 'Illikkalkallu',
      'hi': 'वाईकॉम',
      'ml': 'വൈക്കം',
    },
    'a0cfzqca': {
      'en': 'ELAVEEZHAPOONCHIRA',
      'hi': 'अयमानम',
      'ml': 'അയ്മനം',
    },
    'rj4zwelt': {
      'en': 'VALLYACHANMALA',
      'hi': 'तन्नीरमुक्कम',
      'ml': 'തണ്ണീർമുക്കം',
    },
    'df7sg60h': {
      'en': 'Home',
      'hi': 'घर',
      'ml': 'വീട്',
    },
  },
  // DarkLightModeSwitch
  {
    'jxeof2nc': {
      'en': 'Switch to Dark Mode',
      'hi': 'डार्क मोड पर स्विच करें',
      'ml': 'ഡാർക്ക് മോഡിലേക്ക് മാറുക',
    },
    'kj3sbjww': {
      'en': 'Switch to Light Mode',
      'hi': 'लाइट मोड पर स्विच करें',
      'ml': 'ലൈറ്റ് മോഡിലേക്ക് മാറുക',
    },
  },
  // HotelAuthenticationInfo
  {
    'ql4ajjyy': {
      'en':
          'Authentic Document Policy: Submission of Fake Documents may Result in Listing Exclusion!',
      'hi':
          'प्रामाणिक दस्तावेज़ नीति: नकली दस्तावेज़ जमा करने पर लिस्टिंग बहिष्करण हो सकता है!',
      'ml':
          'ആധികാരിക പ്രമാണ നയം: വ്യാജ രേഖകൾ സമർപ്പിക്കുന്നത് ലിസ്റ്റിംഗ് ഒഴിവാക്കലിന് കാരണമായേക്കാം!',
    },
    'jfp4ts6r': {
      'en':
          'Once you submit this form, you will receive a notification regarding the verification status of your application. Please ensure the contact details provided are accurate to receive the notification promptly ',
      'hi':
          'एक बार जब आप यह फॉर्म जमा कर देंगे, तो आपको अपने आवेदन की सत्यापन स्थिति के बारे में एक अधिसूचना प्राप्त होगी। कृपया सुनिश्चित करें कि अधिसूचना तुरंत प्राप्त करने के लिए दिए गए संपर्क विवरण सटीक हैं',
      'ml':
          'നിങ്ങൾ ഈ ഫോം സമർപ്പിച്ചുകഴിഞ്ഞാൽ, നിങ്ങളുടെ അപേക്ഷയുടെ സ്ഥിരീകരണ നില സംബന്ധിച്ച് നിങ്ങൾക്ക് ഒരു അറിയിപ്പ് ലഭിക്കും. അറിയിപ്പ് ഉടനടി ലഭിക്കുന്നതിന് നൽകിയിരിക്കുന്ന കോൺടാക്റ്റ് വിശദാംശങ്ങൾ കൃത്യമാണെന്ന് ഉറപ്പാക്കുക',
    },
    'obx8i2ma': {
      'en': 'Continue',
      'hi': 'जारी रखना',
      'ml': 'തുടരുക',
    },
  },
  // BookingConfirmation
  {
    'qi3p3a1u': {
      'en': '\"Booking Confirmation: Email Notification on its Way!\"',
      'hi': '\"बुकिंग पुष्टिकरण: ईमेल अधिसूचना आने वाली है!\"',
      'ml': '\"ബുക്കിംഗ് സ്ഥിരീകരണം: ഇമെയിൽ അറിയിപ്പ് അതിന്റെ വഴിയിൽ!\"',
    },
    '95hy5wsm': {
      'en':
          'Thank you for your booking! Your reservation has been confirmed. An email containing the details of your booking will be sent to you shortly. We look forward to welcoming you and providing you with a memorable experience. Should you have any questions or require further assistance, please don\'t hesitate to contact us.',
      'hi':
          'आपकी बुकिंग के लिए धन्यवाद! आपका आरक्षण कन्फर्म हो गया है. आपकी बुकिंग के विवरण वाला एक ईमेल आपको शीघ्र ही भेजा जाएगा। हम आपका स्वागत करने और आपको एक यादगार अनुभव प्रदान करने के लिए तत्पर हैं। यदि आपके कोई प्रश्न हों या अतिरिक्त सहायता की आवश्यकता हो, तो कृपया हमसे संपर्क करने में संकोच न करें।',
      'ml':
          'നിങ്ങളുടെ ബുക്കിംഗിന് നന്ദി! നിങ്ങളുടെ റിസർവേഷൻ സ്ഥിരീകരിച്ചു. നിങ്ങളുടെ ബുക്കിംഗിന്റെ വിശദാംശങ്ങൾ അടങ്ങിയ ഒരു ഇമെയിൽ ഉടൻ നിങ്ങൾക്ക് അയയ്‌ക്കും. നിങ്ങളെ സ്വാഗതം ചെയ്യാനും അവിസ്മരണീയമായ ഒരു അനുഭവം നൽകാനും ഞങ്ങൾ ആഗ്രഹിക്കുന്നു. നിങ്ങൾക്ക് എന്തെങ്കിലും ചോദ്യങ്ങളുണ്ടെങ്കിൽ അല്ലെങ്കിൽ കൂടുതൽ സഹായം ആവശ്യമുണ്ടെങ്കിൽ, ദയവായി ഞങ്ങളെ ബന്ധപ്പെടാൻ മടിക്കരുത്.',
    },
    'vazfowck': {
      'en': 'Continue',
      'hi': 'जारी रखना',
      'ml': 'തുടരുക',
    },
  },
  // Miscellaneous
  {
    '0fz0xrlz': {
      'en': '',
      'hi': '',
      'ml': '',
    },
    'ms6bn01z': {
      'en': '',
      'hi': '',
      'ml': '',
    },
    't7c8n215': {
      'en': '',
      'hi': '',
      'ml': '',
    },
    'ua9ep95r': {
      'en': '',
      'hi': '',
      'ml': '',
    },
    'x8pxszkh': {
      'en': '',
      'hi': '',
      'ml': '',
    },
    '5s62f1v0': {
      'en': '',
      'hi': '',
      'ml': '',
    },
    'wzz0xv6i': {
      'en': '',
      'hi': '',
      'ml': '',
    },
    'adrdml20': {
      'en': '',
      'hi': '',
      'ml': '',
    },
    'hnaey4r7': {
      'en': '',
      'hi': '',
      'ml': '',
    },
    'm9c8pnqq': {
      'en': '',
      'hi': '',
      'ml': '',
    },
    'b5icwf6k': {
      'en': '',
      'hi': '',
      'ml': '',
    },
    'jv4k1fbj': {
      'en': '',
      'hi': '',
      'ml': '',
    },
    'ik6wt1vf': {
      'en': '',
      'hi': '',
      'ml': '',
    },
    'b9a3nwth': {
      'en': '',
      'hi': '',
      'ml': '',
    },
    'c41by10z': {
      'en': '',
      'hi': '',
      'ml': '',
    },
    'zoh6ehmo': {
      'en': '',
      'hi': '',
      'ml': '',
    },
    'uqxqp4yo': {
      'en': '',
      'hi': '',
      'ml': '',
    },
    'y1wnf8v5': {
      'en': '',
      'hi': '',
      'ml': '',
    },
    'b0iqv2jf': {
      'en': '',
      'hi': '',
      'ml': '',
    },
    'c5t8xri4': {
      'en': '',
      'hi': '',
      'ml': '',
    },
    'g0ebdunx': {
      'en': '',
      'hi': '',
      'ml': '',
    },
    'fofyt6b1': {
      'en': '',
      'hi': '',
      'ml': '',
    },
    'ogqpdv5r': {
      'en': '',
      'hi': '',
      'ml': '',
    },
  },
].reduce((a, b) => a..addAll(b));
