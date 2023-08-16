# [NewFaceAuthenticator](https://docs.caf.io/sdks/android/getting-started/faceauthenticator) - Flutter Plugin

# Políticas de privacidade e termos e condições de uso

Ao utilizar nosso plugin, certifique-se que você concorda com nossas [Políticas de privacidade](https://www.combateafraude.com/politicas/politicas-de-privacidade) e nossos [Termos e condições de uso](https://www.combateafraude.com/politicas/termos-e-condicoes-de-uso).

## Pré requisitos

| Configuração mínima | Versão |
| ------------------- | ------ |
| Flutter             | 1.12+  |
| Dart                | 2.12+  |
| Android API         | 21+    |
| iOS                 | 11.0+  |

## Configurações

### Android

No arquivo `ROOT_PROJECT/android/app/build.gradle`, adicione:

``` gradle
android {

    ...

    dataBinding.enabled = true

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }

    rootProject.allprojects {
    repositories {
        maven { url "https://repo.combateafraude.com/android/release" }
        maven { url 'https://raw.githubusercontent.com/iProov/android/master/maven/' }
    }
}
}
```

### iOS

No arquivo `ROOT_PROJECT/ios/Podfile`, adicione no final do arquivo:

``` swift
source 'https://github.com/combateafraude/iOS.git'
source 'https://cdn.cocoapods.org/' # ou 'https://github.com/CocoaPods/Specs' se o CDN estiver fora do ar
```

Por último, adicione a permissão de câmera no arquivo `ROOT_PROJECT/ios/Runner/Info.plist`:

```
<key>NSCameraUsageDescription</key>
<string>To capture the selfie</string>
```


## Utilização

```dart
FaceAuthenticator faceAuthenticator = new FaceAuthenticator(mobileToken: mobileToken, personId: 'CPF');

// Outros parâmetros de customização

FaceAuthenticatorSuccess faceAuthenticatorResult = await faceAuthenticator.start();

if (faceAuthenticatorResult is FaceAuthenticatorSuccess) {
  // O SDK foi encerrado com sucesso e a selfie foi capturada
} else if (faceAuthenticatorResult is FaceAuthenticatorSuccess) {
  // O SDK foi encerrado devido à alguma falha e a selfie não foi capturada
} else {
  // O usuário simplesmente fechou o SDK, sem nenhum resultado
}
```

### FaceAuthenticator methods

| Parameter | Required |
| --------- | -------- |
| <p><strong><code>.setStage(String stage)</code></strong></p><p>Used to redirect the SDK to the desired environment in caf api.</p> | No |
| <p><strong><code>.setFilter(String filter)</code></strong></p><p>Used to change the SDK camera filter. It has the following options: **CameraFilter.NATURAL** or **CameraFilter.LINE_DRAWING**</p> | No, the default is **CameraFilter.LINE_DRAWING** |
| <p><strong><code>.setEnableScreenshots(bool enable)</code></strong></p><p>Used to enable screenshots during the SDK scan.</p> | No, the default is **false** |

### Enums

#### CafStage
| Description | Values |
| ----------- | ----- |
| Used to set the SDK stage on `.setStage(String stage)` method. | `CafStage.PROD`, `CafStage.BETA` |

#### CameraFilter
| Description | Values |
| ----------- | ----- |
| Used to set the SDK's camera filter | `CameraFilter.NATURAL`, `CameraFilter.LINE_DRAWING`  |


### FaceAuthenticatorSuccess

| Field |
| --------- |
| `String signedResponse`<br><br> Signed response from the CAF server confirming that the captured selfie has a real face. This parameter is used to get an extra layer of security, checking that the signature of the response is not broken, or caused by request interception. If it is broken, there is a strong indication of request interception.|

### FaceAuthenticatorFailure

| Fiel |
| --------- |
| `String errorMessage`<br><br>Mensagem explicando o motivo da falha do SDK.|