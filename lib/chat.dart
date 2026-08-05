library;

class Chat {
  const Chat({
    required this.name,
    required this.imageUrl,
    required this.lastMessage,
    required this.timestamp,
    this.isOnline = false,
    this.isUnread = false,
    this.unreadCount = 0,
    this.isGroup = false,
    this.senderName = '',
    this.borderColor,
  });

  final String name;
  final String imageUrl;
  final String lastMessage;
  final String timestamp;
  final bool isOnline;
  final bool isUnread;
  final int unreadCount;
  final bool isGroup;
  final String senderName;
  final String? borderColor;
}

const List<Chat> sampleChats = [
  Chat(name: 'Alex Rivet', imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCvpHg6ZxFZ2yTGOaDbZS6EizCjMvY53_lP-_qOB1eWj0Ihnixp4a4TE5UpOXpKPdbt3F24UX_G16AdjwZuswIE9AzllM5xJOO47MTN3wqFPwieK23jdxQ7rkCEnAX8lTVQBicKggX1fRHYG2pyA4krjB9sKyG-9rLVBidMVbb-afoRfwxypq3whdU2r3dvDriiOPLmXNq0Z_O2QsBwjvQeRyBsvJIiVSYV1wPXARGa5UNL8mwH2R5IwdbS1Ftkj_yeoBNxRYMaM1s', lastMessage: 'The view from the summit is insane! You should definitely join us next time.', timestamp: '2m ago', isOnline: true, isUnread: true),
  Chat(name: 'Sarah Jenkins', imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBz4PJ3rRgxQWcEYbHVLrb6UVLOYk-8e9gBUNaUDL9zId9SVD120xzPi2D5hFVHFr2VQY0lju0OjGP1XLDA6ZsoUjnaYcWjqimRVhBMRCq0nNSGKUvRtinU3fkL6I03tye5QtDxW8nfl0Pk8mU8lYL1qBH2GQsAkOEPDrQ_sbk9yzmVbY5shBedRlSipGftyZD14y_GocWxewzB-YGIiSksKDOD3LL_A-ZypfZPLUJfBbMEbXCXqy9ip4Pfob_Au5QOarXBXgaPjD0', lastMessage: 'I sent over the itinerary for Tokyo. Let me know if the hotel works for you.', timestamp: '1h ago', isOnline: false, isUnread: false),
  Chat(name: 'Leo Torres', imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAgAJjl3L_Ka2N_Cmelgu8j6VIq8LdA7KUEKQwCEuysCQWDYUWTS98dujMQAp9bs8Nl1qxPIuRABPE4l5LgXbBPEd53jEMAYTuafB7huMlNpBObwuxLPCRTeaqw-zx1OX0O3noU_tbMAXzoVtHwv1tbOJ2lK9DH3SmTOAzckqTKML6pV98cTSXT82VJL8f7UDCR7w2CEdu6cJhlqBotCh501NEi4aGHqzFc4NWr1GYjaWG6ZNmkC5xxMuz-eGvwOBWRNNuz81e1GMg', lastMessage: 'Did you see the price drop for the Paris flight? We need to book now!', timestamp: '14m ago', isOnline: false, isUnread: true, unreadCount: 3),
  Chat(name: 'EuroTrip 2024', imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuC13-PnAcLbJiP6TRt-nK7VdXXtMV_qQqYONlQFszHeXDv1ckCdgnASbxCXK1mwavbBpHvUFhfVNndMN8aQzPTMy9wO9d1aPjXDJoj33pUmtLWr2Z1ffbjIckwe3PZaofBcr1Gl4waQtbW1If8kLdaajgAGzed_YYzsprVynvMwzhTkJQUIN6pRdc7OHslFv8bGeaHBf3xcOuojEFOIibA73aLhxpd1iMS4CZatpbnoahJtExdFQBTdDpBfP5SYH23Iym4epClKjBA', lastMessage: 'Who is handling the Eurail passes?', timestamp: 'Yesterday', isOnline: false, isUnread: false, isGroup: true, senderName: 'Marco'),
  Chat(name: 'Chloe Chen', imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBsbggN2sprXks6xRitnA_LDnwe3yMyQ7fxS9UVz5Vl2wyfFXieJgiLMSYDGKdrgTHkWT6279vcI356D02_k6vjHl_DlCwCwkW0hpaqst3lFgLFIOQAEILccTo-2C8uuThW7bXM6m2cuYsgDmc_tGqzroatYwoEcsm4TJc6XvJn7I9yGeypYUiLl10n3Tb4KxXxlFaydgnQBmVUDw8rtcklbwtvUUYXJffJXyRKGinH_4Hn_i2T7f3q655d_vFjdNG77dVnx929b6A', lastMessage: 'That cafe we found in Hanoi was the best part of the trip.', timestamp: 'Mar 12', isOnline: false, isUnread: false),
  Chat(name: 'WanderWise Support', imageUrl: '', lastMessage: 'Your refund for the canceled flight to Bali has been processed.', timestamp: 'Mar 10', isOnline: false, isUnread: false),
];
