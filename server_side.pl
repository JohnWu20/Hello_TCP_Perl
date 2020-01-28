use IO::Socket;    
use strict;    
use warnings;    
  
my $socket = new IO::Socket::INET (    
# LocalHost => 'localhost',    
LocalPort => '8081',    
Proto => 'tcp',    
Listen => 1,    
Reuse => 1,    
);    
  
die "Could not create socket: $!n" unless $socket;    
  
 
print "Waiting for data from the client end\n";    
my $new_socket = $socket->accept();    
print $new_socket "Response in Perl"; 
while(<$new_socket>)  
{    
    print $_;   
}    

  
close($socket); 