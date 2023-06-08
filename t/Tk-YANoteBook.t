
use strict;
use warnings;
use Test::Tk;
use Tk;

use Test::More tests => 4;
BEGIN { use_ok('Tk::YANoteBook') };

$delay = 1500;

createapp;

my $nb;
if (defined $app) {
	my $frame = $app->Frame->pack(-expand => 1, -fill => 'both');
	$nb = $frame->YANoteBook(
# 		-tabside => 'left',
# 		-tabside => 'right',
# 		-tabside => 'bottom',
	)->pack(-expand => 1, -fill => 'both');
	for (1 .. 12) {
		my $num = $_;
		my $n = "page ";
		for (0 .. $num) { $n = $n . '*' }
		$n = "$n $num";
		my $p = $nb->addPage($n, -closebutton => 1);
		$p->Label(
			-width => 40 + $num, 
			-height => 18 + $num, 
			-text => $n, 
	# 		-relief => 'groove',
		)->pack(-expand => 1, -fill => 'both');
	}
	$app->geometry('300x200+100+100');
}

@tests = (
	[sub {  return defined $nb }, '1', 'Can create']
);

starttesting;


