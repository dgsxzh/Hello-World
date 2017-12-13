#include <iostream>
#include <cmath>
using namespace std;
int gcd(int a,int b)
{
	int c;
	if (a<b)
	{
		int t=a;
		a=b;
		b=t;
	}
	while (b!=0)
	{
		c=a%b;
		a=b;
		b=c;
	}
	return a;
}
int main()
{
	int x,y,ans=0;
	cin>>x>>y;
	for (int i=1;i<=x*y;i++)
	for (int j=1;j<=x*y;j++)
	{
		int t=gcd(i,j);
		if ((i*j/t==y)&&(t==x))
		{
			ans++;
			break;
		}
	}
	cout<<ans;
	return 0;
}
