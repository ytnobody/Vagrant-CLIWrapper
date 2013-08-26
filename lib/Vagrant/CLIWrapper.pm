package Vagrant::CLIWrapper;
use 5.008005;
use strict;
use warnings;
use File::Which ();
use IPC::Run ();
use Scalar::Util ();

our $VERSION = "0.01";
our $VAGRANT_BIN = File::Which::which('vagrant');
our $AUTOLOAD;

sub AUTOLOAD {
    my ($things, @args) = @_;
    my ($subcommand) = $AUTOLOAD =~ /::([0-9a-z]+)$/;
    return 
        Scalar::Util::blessed($things) ? IPC::Run::run [@$things, $subcommand, @args] :
        $subcommand !~ /^(box|gem)$/ ? IPC::Run::run [$VAGRANT_BIN, $subcommand, @args] :
        bless [$VAGRANT_BIN, $subcommand], $things
    ;
}


1;
__END__

=encoding utf-8

=head1 NAME

Vagrant::CLIWrapper - It's new $module

=head1 SYNOPSIS

    use Vagrant::CLIWrapper;

=head1 DESCRIPTION

Vagrant::CLIWrapper is ...

=head1 LICENSE

Copyright (C) ytnobody.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

ytnobody E<lt>ytnobody@gmail.comE<gt>

=cut

