function R = poltCor(cr1, changed, str, str1)
rv=2.^[1:5];
sv=2.^[-2:3];
for j = changed(1:3); 
    figure; 
    rst_view_mod(cr1(j).cr1,rv,sv,1); 
    rst_view_mod(cr1(j).cr1,rv,sv,2); 
    rst_view_mod(cr1(j).cr1,rv,sv,3);
    title(str1)
    h = gcf;
    saveas(h, [str '_' num2str(j) '.fig']);
    saveas(h, [str '_' num2str(j) '.jpg']);
end
R = 1;