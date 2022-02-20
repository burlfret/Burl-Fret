const fs = require('fs');
const Discord = require('discord.js');
const { prefix, token } = require('./config.json');

const client = new Discord.Client();
client.commands = new Discord.Collection();

const commandFiles = fs.readdirSync('./commands').filter(file => file.endsWith('.js'));

for (const file of commandFiles) {
	const command = require(`./commands/${file}`);
	client.commands.set(command.name, command);
}

client.once('ready', () => {
	console.log('Ready!');
});
client.on('message', message => {
	console.log(message.content);
});
client.on('message', message => {
	if (!message.content.startsWith(prefix) || message.author.bot) return;

	const args = message.content.slice(prefix.length).trim().split(/ +/);
	const command = args.shift().toLowerCase();

	if (command === 'set') {
		let user = message.mentions.users.first(); // You can mention someone, not only just user.
  if (!user) return message.channel.send({embed: {color: "RED", description: "You need to mention the user!"}});
  
  let nick = args.slice(1).join(" ");
  if (!nick) return message.channel.send({embed: {color: "RED", description: "You need to input the nickname!"}});
  
  let member = message.guild.members.cache.get(user.id);
  
   member.setNickname(nick).catch(err => message.channel.send({embed: {color: "RED", description: `Error: ${err}`}}));
  return message.channel.send({embed: {color: "GREEN", description: `Successfully changed **${user.tag}** nickname to **${nick}**`}});
	} else if (command === 'doit') {
		message.channel.send('Do it for Burl Fret https://cdn.discordapp.com/attachments/764971562205184002/767324313987579914/video0.mov');
	}
});
client.login(token);