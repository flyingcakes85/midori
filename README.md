# 緑 - Midori

This is an application that lets you practice and learn Japanese Kana.

## What does 'Midori' mean?

Midori means 'green', which happens to be my favourite color. This application is in no way related to the Midori Web Browser.

## Development

This application is written in Dart using Flutter SDK. I have tested it only on Android device so I cannot verify if it works on iOS.

### Clone the repo

```sh
git clone https://github.com/snehitsah/midori.git
cd Midori
```

### Download packages

```sh
flutter pub get
```

### Run application

Start an emulator or connect your mobile device and then run

```sh
flutter run
```

## To-Do
 - Let users view character-sets inside the application
 - Re-write the Stats screen to include pie-graph
 - <s>Re-write about page to make it look better</s>
 - Support for words in quiz
 - Publish this app
 - Long term : Make it an interactive app to learn Kana and track your progress

## What will not be added
 - Any kind of sync feature
 - Any kind of data collection/telemetry
 - Backing up progress locally is not planned yet, but may be introduced in the future
 - Advertising
 - In-app purchases to unlock features

## Contribue

Contributions in form of pull requests, posting issues, or feature requests are highly appreciated. If you want to work on adding a feature, please first create an issue describing the feature you want to add and how it will be beneficial to the end-user. Ensure that the features you want to add respects user's privacy and freedom.

## License

This project, '**Midori**', is Free Software and is distributed under the terms of GNU GPL v3. ("free" as in freedom)

The license text is included with the repository [here](https://github.com/snehitsah/midori/blob/master/LICENSE) and is also included in the application. The included license **does not** apply to any dependencies listed in [`pubspec.yaml`](https://github.com/snehitsah/midori/blob/master/pubspec.yaml). Those dependencies may be licensed under different terms and are not directly included in this repository.

You enjoy *at least* the following four freedoms

 - The freedom to run the program as you wish, for any purpose *(freedom 0)*.
 - The freedom to study how the program works, and change it so it does your computing as you wish *(freedom 1)*. Access to the source code is a precondition for this.
 - The freedom to redistribute copies so you can help others *(freedom 2)*.
 - The freedom to distribute copies of your modified versions to others *(freedom 3)*. By doing this you can give the whole community a chance to benefit from your changes. Access to the source code is a precondition for this.

To know more about what makes a "free-software", visit [https://www.gnu.org/philosophy/free-sw.en.html](https://www.gnu.org/philosophy/free-sw.en.html).