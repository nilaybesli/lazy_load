Flutter: Lazy Load

In this project, we implemented a lazy load photo list in Flutter using GetX for state management. The list dynamically loads data from an API as the user scrolls, improving performance and user experience. By using GetX, we efficiently managed the state and UI updates.


![Ekran görüntüsü 2024-08-02 193543](https://github.com/user-attachments/assets/8aeef9dc-7bd5-42ed-bdf7-3d82f8fb2bbd)


![Ekran görüntüsü 2024-08-02 192300](https://github.com/user-attachments/assets/fe30c949-3443-45fe-ac4b-c443efa79917)


![Ekran görüntüsü 2024-08-02 192246](https://github.com/user-attachments/assets/f8882150-7f86-4b04-b864-05ec3b16ffc3)



-PhotoController: A GetX controller that manages the state of the photo list, handles fetching data from the API, and updates the UI.

-HttpService: A class responsible for making HTTP requests to fetch photo data from the API.

-PhotoList: The main UI component that displays the list of photos. It uses a ListView.builder to build the list and a ScrollController to detect when the user has scrolled to the bottom of the list.

-PhotoCard: A reusable widget that displays a photo's thumbnail and title in a card layout.

-Main: The main.dart file sets up the GetX dependency injection and initializes the PhotoList widget as the home screen.
