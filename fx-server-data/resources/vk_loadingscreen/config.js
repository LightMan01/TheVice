/*
    This script was developed by Piter Van Rujpen/TheGamerRespow for Vulkanoa (https://discord.gg/bzMnYPS).
    Do not re-upload this script without my authorization. (I only give authorization by PM on FiveM.net (https://forum.fivem.net/u/TheGamerRespow))
*/

var VK = new Object(); // DO NOT CHANGE
VK.server = new Object(); // DO NOT CHANGE

VK.backgrounds = new Object(); // DO NOT CHANGE
VK.backgrounds.actual = 0; // DO NOT CHANGE
VK.backgrounds.way = true; // DO NOT CHANGE
VK.config = new Object(); // DO NOT CHANGE
VK.tips = new Object(); // DO NOT CHANGE
VK.music = new Object(); // DO NOT CHANGE
VK.info = new Object(); // DO NOT CHANGE
VK.social = new Object(); // DO NOT CHANGE
VK.players = new Object(); // DO NOT CHANGE 

//////////////////////////////// CONFIG

VK.config.loadingSessionText = "Загрузка сеанса..."; // Loading session text
VK.config.firstColor = [0, 191, 255]; // First color in rgb : [r, g, b]
VK.config.secondColor = [255, 150, 0]; // Second color in rgb : [r, g, b]
VK.config.thirdColor = [52, 152, 219]; // Third color in rgb : [r, g, b]

VK.backgrounds.list = [ // Backgrounds list, can be on local or distant(http://....)
    "img/1.jpg",
    "img/2.jpg",
    "img/3.jpg"
];
VK.backgrounds.duration = 3000; // Background duration (in ms) before transition (the transition lasts 1/3 of this time)

VK.tips.enable = true; //Enable tips (true : enable, false : prevent)
VK.tips.list = [ // Tips list
    "Присоединяйтесь к нашему Discord серверу!", // If you use double-quotes, make sure to put a \ before each double quotes
    //"Appuyez sur \"T\" pour accèder à votre menu personnel !",
   // "Appuyez sur \"U\" pour vérouiller ou déverouiller votre véhicule !",
   // "Maintenez \"X\" pour mettre vos mains en l'air !",
];

VK.music.url = "http://drivemusic.me/dl/2mIW4KG56DWd8FMZbvduhw/1548444114/download_music/2014/01/aaron-smith-dancin-krono-remix.mp3"; // Music url, can be on local or distant(http://....) ("NONE" to desactive music)
VK.music.volume = 0.2; // Music volume (0-1)
VK.music.title = "Aaron Smith - Dancin [Krono Remix]"; // Music title ("NONE" to desactive)
VK.music.submitedBy = "NONE; // Music submited by... ("NONE" to desactive)

VK.info.logo = "icon/vulkanoa.png"; // Logo, can be on local or distant(http://....) ("NONE" to desactive)
VK.info.text = "NONE"; // Bottom right corner text ("NONE" to desactive) 
VK.info.website = "thevice.ru"; // Website url ("NONE" to desactive) 
VK.info.ip = "213.159.210.108"; // Your server ip and port ("ip:port")

VK.social.discord = "https://discord.gg/ThcBeDB"; // Discord url ("NONE" to desactive)
VK.social.twitter = "NONE"; // Twitter url ("NONE" to desactive)https://discord.gg/ThcBeDB
VK.social.facebook = "NONE"; // Facebook url ("NONE" to desactive)
VK.social.youtube = "?????????????"; // Youtube url ("NONE" to desactive)
//VK.social.twitch = "/thegamerrespow"; // Twitch url ("NONE" to desactive)

VK.players.enable = true; // Enable the players count of the server (true : enable, false : prevent)
VK.players.multiplePlayersOnline = "Игроков онлайн: @players"; // @players equals the players count
VK.players.onePlayerOnline = "1 игрок онлайн"; // Text when only one player is on the server
VK.players.noPlayerOnline = "Нет никого онлайн"; // Text when the server is empty

////////////////////////////////
