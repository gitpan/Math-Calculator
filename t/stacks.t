
use Test::More 'no_plan';
use Data::Dumper;

use_ok('Math::Calculator');

isa_ok(
	my $calc = Math::Calculator->new(),
	'Math::Calculator'
);

is($calc->current_stack,  "default", "start on default stack");
is($calc->push(10,20,30),         3, "three items on default stack");

is($calc->current_stack("secondary"), "secondary", "switch to secondary stack");
is($calc->push(15,25,35),                       3, "three items on secondary stack");
is($calc->add,                                 60, "25 + 35 = 60");

is($calc->current_stack("default"),  "default", "switch to default stack");
is($calc->add,                              50, "20 + 30 = 50");

is($calc->current_stack("no good!"), "default", "fail to switch to badly named stack");
