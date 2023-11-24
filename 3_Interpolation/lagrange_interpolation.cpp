#include<iostream>
using namespace std;

int main()
{
	 float x[100], y[100], ip_x, ip_y=0, iteration_product;
	 int n;

	 /* Input Section */
	 cout<<"Enter number of data: ";
	 cin>>n;
	 cout<<"Enter data:"<< endl;
	 for(int i=1;i<=n;i++)
	 {
		  cout<<"x["<< i<<"] = ";
		  cin>>x[i];
		  cout<<"y["<< i<<"] = ";
		  cin>>y[i];
	 }
	 cout<<"Enter interpolation point: ";
	 cin>>ip_x;

	 /* Implementing of Lagrange Interpolation */
	 for(int i=1;i<=n;i++)
	 {
		// Reset product value of each iteration  
		  iteration_product=1;
		  for(int j=1;j<=n;j++)
		  {
			   if(i!=j)
			   {
					cout << "(x - " << x[j] << ") / (" << x[i] << " - " << x[j] << ")) * ";
			    	iteration_product = iteration_product 
					* (ip_x - x[j])/(x[i] - x[j]);
			   }
		  }
		  cout << y[i] << ") \n";
		  ip_y = ip_y + iteration_product * y[i];
	 }
	 cout<< endl<<"Interpolated value at "<< ip_x<< " is "<< ip_y << endl;

	 return 0;
}