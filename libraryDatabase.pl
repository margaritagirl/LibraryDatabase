###### library database
%lib=("studentID1",1,"studentID2",4);
@k=keys %lib;
@v=values %lib;
sub view 
{

	while(($k,$v)=each %lib) 
	{
		print "$k => $v\n";
	}	

print "to go back to the main menu press 1\n";
$work=<STDIN>;
if($work==1){&main_menu;}

}

sub ad_del
{

	print "to add press 1\n to delete press 2\n";
	chomp($ad_del=<STDIN>);
	print "$ad_del\n";
	if($ad_del==1)
		{
		print "how many members you want to add into tha database\n";
		chomp($n1=<STDIN>);
		for($i=0;$i<$n1;$i++)
		{
		print "enter the roll number of the new member\n";
		chomp($k=<STDIN>);
		if(exists $lib{$k})
		{
			print "this member already exist in the database\n";
		}
		else
		{
			$lib{$k}=0;
			print "$k is added to the database \n";
		}
		}
		}
	else
		{
		print "how many members you want to delete from the database\n";
		chomp($n2=<STDIN>);
		for($i=0;$i<$n2;$i++)
		{
		print "enter the roll number to be deleted\n";
		chomp($k=<STDIN>);
		if(exists $lib{$k})
			{
			delete $lib{$k};
			print "$k is deleted from the database\n";
			}
		}
		}
		
print "to go back to the main menu press 1\n \n";
chomp($work=<STDIN>);
if($work==1){&main_menu;}
}

sub issue_return
{
	print "to issue a book press 1 to return a book press 2\n";
	chomp($i_r=<STDIN>);
	if($i_r==1)
	{
		print "print enter the roll number and number of books he or she is issuing\n";
		chomp($k=<STDIN>);
		chomp($lib{k}=<STDIN>);
		$n=5-$lib{$k};
		if($lib{$k}>=5)
		{
			print "cannot issue any more books since you have already issued five books\n";
			print "you can issue $n more books\n";
		}
		while ($lib{$k}<=$n)
		{
		$lib{$k}=$lib{$k}+$v;
		}
	}
	if($i_r==2)
	{
		print "print enter the roll number and number of books he or she is returning\n";
		chomp($k=<STDIN>);
		chomp($v=<STDIN>);
		$lib{$k}=$lib{$k}-$v;
		print "the returned books are recorded to the database\n";
	}
	
print "to go back to the main menu press 1\n";
chomp($work=<STDIN>);
if($work==1){&main_menu;}
}
sub search
{
print "enter the roll number of the person you want to search for\n";
chomp($temp=<STDIN>);
if(exists $lib{$temp}){print "$temp is present number of books issued is $lib{$temp}\n";}
else{print "this member is not found in the database\n";}	
print "to go back to the main menu press 1\n";
chomp($work=<STDIN>);
if($work==1){&main_menu;}
}
sub main_menu
{
print "main menu \n to view the existing database press 1\n to add or delete a member press 2 \n to issue or return books press 3 \nto search a member press 4\n ";
chomp($main=<STDIN>);
if($main==1){&view;}
if($main==2){&ad_del;}
if($main==3){&issue_return;}
if($main==4){&search;}
}
&main_menu;
