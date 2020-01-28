use strict; 
use warnings; 
use IO::Socket; 

my $socket = new IO::Socket::INET ( 
PeerAddr => '35.171.18.12', 
PeerPort => '8080', 
Proto => 'tcp', 
 
); 

die "Could not create socket: $!n" unless $socket; 

# data to send to a server
my $string = 'hello from perl';
my $req = encode("UTF-8", $string);
$socket->send($req);
# notify server that request has been sent
shutdown($socket, 1);
 
# receive a response of up to 1024 characters from server

my $response = "";
$socket->recv($response, 1024);
my $string1 = decode("UTF-8", $response);
print "received response: $string1\n";


close($socket);