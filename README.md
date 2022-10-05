# marvel-app-swiftui

This document aims to define the structure of the project as well as the architecture and design patterns implemented in it.
It also aims to explain which libraries are used and why, as well as explaining future development paths for the project.

## Project structure

The project implements two main functionalities, listing the Marvel superheroes obtained by an API and displaying the details of these superheroes.

## Architecture

### SOLID

The main architecture is based on solid principles and is a proprietary adaptation, similar to VIPER. The project is divided into 3 main folders: presentation, data and domain.

In **data** are those elements that connect to the API or those that communicate with a local DB. In this layer we find the DataSource, which are the ones that provide the information, and the implementation of the Repositories that are the ones that send information to the domain layer. This layer is only dependent on the domain.

In **domain** are those elements that are called *business layer*, necessary to satisfy the requirements of the project. In this layer we find the interfaces of the repositories, necessary to be implemented in the data layer, the use cases, representing key business functionalities, and finally the entities, representation in the form of data of the business elements. This layer does not depend on any other layer.

In **presentation** are the elements necessary to visually present the functionalities to the users. Later on, we will talk about the architecture followed for the view. This layer is dependent on **domain**.

### MVVM

For the presentation part, the MVVM pattern has been implemented. This is done by substituting the normally used Presenter in the VIPER architecture. This is done because of the ease that the MVVM pattern allows you to communicate with the view and because of the ease of changing the view type from UIKIT to SWIFTUI or other possible in the future, as Kotlin is already doing with its KMM.

### Design Patterns

Since this is a small project with relatively simple requirements, a large number of design patterns have not been implemented, with the exception of the Singleton pattern.

In future developments of other functionalities some of these patterns could be implemented: Decorator, Strategy, Facade, Factory, Builder, Compositor, etc.

### Other folders

#### Resources

This folder contains all the things that the project needs to display resources. In it we find the fonts used in the project, the images, the LaunchScreen, etc.

#### Config

This folder contains the project configuration files. Firstly the Info.plist that gives us information about the whole project and on the other hand the Config.plis, configuration file to put information from different environments such as the *url base* to attack or *private keys* from external providers.

## External Libraries

### Alamofire

This is one of the most used Swift libraries, used to make requests to APIs.

### AlamofireImage

This is a related library that provides an Alamofire-specific component for downloading images.

### Localize-Swift

Library that facilitates the localisation of the application

### SkeletonView

Library used to show users that data is being loaded without the need to display blocking *loadings* in an elegant way.

### Lottie-iOS

Library to show in an easy way lottie animations

### Future avenues of development

### Improving the superhero detail

In addition to the basic information shown, you could show other information related to superheroes such as comics, stories, events and series, making carrousels in the same detail.

### Adding filters to the superheroes list

The only data filter that has been done in the list has been the search engine, looking for superheroes by the first letters of their name. You could add the other filters like the order, in which comics they appear, change the search to full names, etc.

### Adding Stringer for Coordinator Pattern

For bigger apps, the Coordinator Pattern is really useful to manage all the navigation in our app. For that reason, it would be interesting to add this library to the project
