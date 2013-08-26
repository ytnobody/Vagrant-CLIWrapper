#!/usr/bin/env perl
use strict;
use warnings;
use File::Basename 'dirname';
use File::Spec;
use lib ( File::Spec->rel2abs(File::Spec->catdir( dirname(__FILE__), '..', 'lib' )) );
use Vagrant::CLIWrapper;

my $class = 'Vagrant::CLIWrapper';

$class->box->add(base => 'http://files.vagrantup.com/lucid32.box');
$class->init;
$class->up;
