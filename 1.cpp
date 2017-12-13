#include <iostream>
#include <cstdio>
using namespace std;
int main()
{
	int l,n,a,mi=0,ma=0;
	cin>>l>>n;
	for (int i=1;i<=n;i++)
	{
		cin>>a;
		mi=max(mi,min(a,l+1-a));
		ma=max(ma,max(a,l+1-a));
	}
	cout<<mi<<' '<<ma;
	return 0;
}
