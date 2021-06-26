%Cite this code as Barnard, M.A. 2021 “GitHub: malcolmbarnard/GrazingMethodDevelopment” https://www.doi.org/10.5281/zenodo.5026535. 

%%Import Data from Grazing_Results.csv

z = 1;
% Execubtable demands
%% z = 1, Grazing Rates
%% z = 2, Growth Rates in the absence of grazers

if z==1 
    y1 = l_02um_g;
    y2 = l_GFF_g;
    y3 = n_02um_g;
    y4 = n_GFF_g;
    x1 = l_MIS_g;
    x2 = n_MIS_g; 
    E1 = l_MIS_g_SD;
    E2 = l_02um_g_SD;
    E3 = l_GFF_g_SD;
    E4 = n_MIS_g_SD;
    E5 = n_02um_g_SD;
    E6 = n_GFF_g_SD;   
    
    subplot(2,1,1)
    hold on
    errorbar(y1,x1,E2,E2,E1,E1,'ob')
    errorbar(y2,x1,E3,E3,E1,E1,'ok') 
    xs=[-1:.0000001:12];
    ys=[-1:.0000001:12];
    hold on
    plot(xs,ys,'-r')
    set(gca,'xlim',[-1 10],'ylim',[-1 12]);
    title('Parity Plot of Grazing Rates of MIS Compared to Prefiltered Water Calculated Using the Linear Model')
    ylabel('MIS Grazing Rates')
    xlabel('Prefiltered Water Grazing Rates')
    hold off    
    
    subplot(2,1,2)
    hold on
    errorbar(y3,x2,E5,E5,E4,E4,'ob')
    errorbar(y4,x2,E6,E6,E4,E4,'ok') 
    xs=[-1:.0000001:12];
    ys=[-1:.0000001:12];
    hold on
    plot(xs,ys,'-r')
    set(gca,'xlim',[-1 10],'ylim',[-1 12]);
    title('Parity Plot of Grazing Rates of MIS Compared to Prefiltered Water Calculated Using the Holling II Model')
    ylabel('MIS Grazing Rates')
    xlabel('Prefiltered Water Grazing Rates')
    hold off    
    
elseif z==2
    y1 = l_02um_u;
    y2 = l_GFF_u;
    y3 = n_02um_u;
    y4 = n_GFF_u;
    x1 = l_MIS_u;
    x2 = n_MIS_u; 
    E1 = l_MIS_u_SD;
    E2 = l_02um_u_SD;
    E3 = l_GFF_u_SD;
    E4 = n_MIS_u_SD;
    E5 = n_02um_u_SD;
    E6 = n_GFF_u_SD;   
    
    subplot(2,1,1)
    hold on
    errorbar(y1,x1,E2,E2,E1,E1,'ob')
    errorbar(y2,x1,E3,E3,E1,E1,'ok') 
    xs=[-1:.0000001:12];
    ys=[-1:.0000001:12];
    hold on
    plot(xs,ys,'-r')
    set(gca,'xlim',[-1 10],'ylim',[-1 12]);
    title('Parity Plot of µ_0 Growth Rates of MIS Compared to Prefiltered Water Calculated Using the Linear Model')
    ylabel('MIS Grazing Rates')
    xlabel('Prefiltered Water Grazing Rates')
    hold off    
    
    subplot(2,1,2)
    hold on
    errorbar(y3,x2,E5,E5,E4,E4,'ob')
    errorbar(y4,x2,E6,E6,E4,E4,'ok') 
    xs=[-1:.0000001:12];
    ys=[-1:.0000001:12];
    hold on
    plot(xs,ys,'-r')
    set(gca,'xlim',[-1 10],'ylim',[-1 12]);
    title('Parity Plot of µ_0 Growth Rates of MIS Compared to Prefiltered Water Calculated Using the Holling II Model')
    ylabel('MIS Grazing Rates')
    xlabel('Prefiltered Water Grazing Rates')
    hold off    
        
    
end
