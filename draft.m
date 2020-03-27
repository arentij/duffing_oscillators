x = [5 10 11 13 18];
y1 = [40 80 150 80 50];
a1 = 100*[100 50 80 30 50];
scatter(x,y1,a1,'MarkerFaceColor','b','MarkerEdgeColor','b',...
    'MarkerFaceAlpha',.2,'MarkerEdgeAlpha',.2)
axis([0 20 0 200])
x = [2 6 8 11 13];
y2 = [30 40 100 60 140];
a2 = 100*[30 50 30 80 80];
hold on
scatter(x,y2,a2,'MarkerFaceColor','r','MarkerEdgeColor','r',...
    'MarkerFaceAlpha',.2,'MarkerEdgeAlpha',.2)
hold off