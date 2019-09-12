#Programmer: Tyler Stringer                             Date: 5-1-15
#Description: This program generates a 3D random walk.
#Copyright: Attribution 4.0 International (CC BY 4.0)

1; #The "1" ensures Octave doesn't think that this script is a function.

r = 1;

#Generate initial point.
plot3(0,0,0)
hold on;

n = 1; 
nn = 10; #Number of iterations user wants.
x_old = 0;
y_old = 0;
z_old = 0;
j = 1; #Counter for cycling through color options.
rainbow = ['r', 'm', 'y', 'g', 'c', 'b', 'k'];
h = axes;
k = 1;

while n <= nn && ishandle(h) #Do loop while n <= nn and if there is a figure present.
  theta = randi([0,359]); #Random integer degree between 0 and 359.
  x_comp = r*cosd(theta);
  y_comp = r*sind(theta);
  z_comp = randi([-1,1]);
  x = x_old + x_comp;
  y = y_old + y_comp;
  z = z_old + z_comp;
    #Choose color of line
    choose_color = rainbow(j);
    if j < 7
      j = j+1;
    else
      j = 1;
    end
  line([x_old x],[y_old y],[z_old z],'Color',choose_color,'LineWidth',2) #For a 3D line:   line([.3 .7],[.4 .9],[1 1],'Marker','.','LineStyle','-')
  plot3(x,y,z)
  figure = plot3(x,y,z);
  hold on;
  n = n+1;
  x_old = x; #New x value becomes the old.
  y_old = y; #Same for y.
  z_old = z;
  %sim(n) = theta; #Array of simulation's theta values.
  pause(0.2); #Wait half a second (or however long the user wants). Comment out if you only want to see the final result (takes longer for larger nn). 
  %filename = sprintf('output/fig%0.4d.png',k);
  %saveas(figure,filename); #Uncomment if you want to save the figures (later you can make an animated gif, etc.).
  %k++;
end
