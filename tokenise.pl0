#!/bin/perl -w
 use strict;
 use warnings;
 use MIME::Base64;
 use JSON;
 use REST::Client;

my ($tuser, $data1, $data2) = @ARGV;
	if (not defined $data2) {
		die "Need to specify 3 parameters: username, data1 and data2 to Tokenize\n";
		}
# Set the request parameters
my $host = 'https://vts21-jyp.aws.lab/';

my $pwd = 'Ssl1234%';

my %json1 = ( 'tokentemplate' => 'Alpha-Group_Key1', 'tokengroup' => 'Group_Key1', 'data' => "$data1");
my %json2 = ( 'tokentemplate' => 'Alpha-Group_Key1', 'tokengroup' => 'Group_Key1', 'data' => "$data2");

 my $client = REST::Client->new(
	host => $host);
my $encoded_auth = encode_base64("$tuser:$pwd", '');

  # POST to the VTS server
# $client->getUseragent()->ssl_opts(verify_hostname => '0');
# $client->POST( 'vts/rest/v2.0/tokenize', encode_json(\%json1), { 'Authorization' => "Basic $encoded_auth", 'Content-Type' => 'application/json' });
# print $client->responseContent() . "\n";

my $multijson1 = "[" . encode_json(\%json1) . "," . encode_json(\%json2) . "]\n";
$client->getUseragent()->ssl_opts(verify_hostname => '0');
#$client->POST( 'vts/rest/v2.0/tokenize', encode_json(\%json2), { 'Authorization' => "Basic $encoded_auth", 'Content-Type' => 'application/json' });
$client->POST( 'vts/rest/v2.0/tokenize', $multijson1, { 'Authorization' => "Basic $encoded_auth", 'Content-Type' => 'application/json' });
print $client->responseContent() . "\n";
