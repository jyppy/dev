#!/bin/perl -w
 use strict;
 use warnings;
 use MIME::Base64;
 use JSON;
 use REST::Client;

# Set the request parameters
my $host = 'https://vts21-jyp.aws.lab/';
# user3 - last 4
# user6 - 1st 6
my $user = 'user6';
my $pwd = 'Ssl1234%';

my %token1 = ( 'tokentemplate' => 'Alpha-Group_Key1', 'tokengroup' => 'Group_Key1', 'token' => "$ARGV[1]");
my %token2 = ( 'tokentemplate' => 'Alpha-Group_Key1', 'tokengroup' => 'Group_Key1', 'token' => "$ARGV[2]");

 my $client = REST::Client->new(
	host => $host);
my $encoded_auth = encode_base64("$ARGV[0]:$pwd", '');

  # POST to the VTS server
$client->getUseragent()->ssl_opts(verify_hostname => '0');
$client->POST( 'vts/rest/v2.0/detokenize', encode_json(\%token1), { 'Authorization' => "Basic $encoded_auth", 'Content-Type' 	=> 'application/json' });
print $client->responseContent() . "\n";

$client->getUseragent()->ssl_opts(verify_hostname => '0');
$client->POST( 'vts/rest/v2.0/detokenize', encode_json(\%token2), { 'Authorization' => "Basic $encoded_auth", 'Content-Type' 	=> 'application/json' });
print $client->responseContent() . "\n";
