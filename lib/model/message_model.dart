import 'user_model.dart';

class Message {
  final User sender;
  final String
  time;
  final String text;
  final bool isLiked;
  final bool unread;

  Message({
    this.sender,
    this.time,
    this.text,
    this.isLiked,
    this.unread,
  });
}

// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'Current User',
  imageUrl: 'assets/images/greg.jpg',
);

// USERS
final User greg = User(
  id: 1,
  name: 'Greg',
  imageUrl: 'assets/images/female0.jpg',
);
final User james = User(
  id: 2,
  name: 'James',
  imageUrl: 'assets/images/male1.jpg',
);
final User john = User(
  id: 3,
  name: 'John',
  imageUrl: 'assets/images/male2.jpg',
);
final User olivia = User(
  id: 4,
  name: 'Olivia',
  imageUrl: 'assets/images/female1.jpg',
);
final User sam = User(
  id: 5,
  name: 'Sam',
  imageUrl: 'assets/images/male3.jpg',
);
final User sophia = User(
  id: 6,
  name: 'Sophia',
  imageUrl: 'assets/images/female2.jpg',
);
final User steven = User(
  id: 7,
  name: 'Steven',
  imageUrl: 'assets/images/male4.jpg',
);
final User feny = User(
  id: 8,
  name: 'Feny',
  imageUrl: 'assets/images/female3.jpg',
);
final User Odile = User(
  id: 9,
  name: 'Odile',
  imageUrl: 'assets/images/female4.jpg',
);
final User danial = User(
  id: 10,
  name: 'danial',
  imageUrl: 'assets/images/male5.jpg',
);

// FAVORITE CONTACTS
List<User> favorites = [greg, steven, olivia, john, sam];

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: james,
    time: '5:30 PM',
    text: 'Hey man, What\'s the plan today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: olivia,
    time: '4:30 PM',
    text: 'Hey dear, how\'s it going? Can we meet today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: john,
    time: '3:30 PM',
    text: 'Bro, Party tonight. Are you coming?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sophia,
    time: '2:30 PM',
    text: 'Dear you are not giving me time',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: steven,
    time: '1:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sam,
    time: '12:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: greg,
    time: '11:30 AM',
    text: 'In lockdown I am missing you so much!',
    isLiked: false,
    unread: false,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: james,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Just walked my doge. She was super duper cute. The best pupper!!',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '3:45 PM',
    text: 'How\'s the doggo?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '3:15 PM',
    text: 'All the food',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Nice! What kind of food did you eat?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '2:00 PM',
    text: 'I ate so much food today.',
    isLiked: false,
    unread: true,
  ),
];