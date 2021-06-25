%Cite this code as Barnard, M.A. 2021 “GitHub: malcolmbarnard/GrazingMethodDevelopment” https://www.doi.org/10.5281/zenodo.5026535. 

%%Import Data from Method_Dilution_Grazing_Bioassay_Data.csv
z = 1;
% Execubtable demands
%% z = 1, Atlantic Shelf
%% z = 2, Pamlico Sound
%% z = 3, Neuse River Estuary
%% z = 4, Chowan River
%% z = 5, Jordan Lake

if z==1 
    %Atlantic Shelf
    y1 = AS02;
    y2 = ASGFF;
    y3 = ASMIS;
    y4 = ASbactMIS;
    x1 = FracUnfilteredWater;
    x2 = ASbact02;
    x3 = ASbactGFF;
    err1 = AS02E;
    err2 = ASGFFE; 
    err3 = ASMISE; 
    E1 = ASbactMISSE;
    E2 = ASbact02SE;
    E3 = ASbactGFFSE;

    subplot(2,2,1)
    hold on
    
    mdl1 = fitlm(x1,y1);
    g1 = mdl1.Coefficients.Estimate(2,:);
    m1 = mdl1.Coefficients.Estimate(1,:);
    e1 = mdl1.Coefficients.SE(2,:);
    l1 = mdl1.Coefficients.SE(1,:);
    R1 = mdl1.Rsquared.Ordinary;
    R1a = mdl1.Rsquared.Adjusted;
    t1 = mdl1.Coefficients.tStat(2,:);
    p1 = mdl1.Coefficients.pValue(2,:);
    %nonlinear fit model based on code provided by Jana Haddad
    fitmodel = ['a - b*F*(1+c)./(1+c*F)'];
    
    % G = a-b*F*((1+c)/(1+c*F)) Holling II curve
    % Set up fittype and options
    ft = fittype( fitmodel, 'independent', 'F', 'dependent', 'G' );
    opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
    opts.Display = 'off';
    opts.Robust = 'Bisquare';
    % opts.StartPoint = [0 0 0];
    % Fit model to data:
    
    [fitcurve1, fitcurve_gof1] = fit( x1, y1, ft, opts )
    
    
    a1 = fitcurve1.a;
    b1 = fitcurve1.b;
    c1 = fitcurve1.c;
    scatter(x1,y1,'xb')
    errorbar(x1,y1,err1,'ob')
    
    xs=[0:0.0001:1];
    ys= a1-b1*xs*(1+c1)./(1+c1*xs);
    plot(xs,ys,'g');
    hold on
    plot(xs,m1+g1.*xs,'-r')
    set(gca,'ylim',[-.5 2.5]);
    title('Atlantic Shelf 0.2 µm')
    xlabel('Fraction Unfiltered Water')
    ylabel('Apparent Growth Rate (d^-^1)')
    %txt11 = ['y = µ_0 - g(Fraction Unfiltered Water)'];
    %txt12 = ['g = ' num2str(-g1,2) ' ± ' num2str(e1,2)];
    %txt13 = ['µ_0 = ' num2str(m1,2) ' ± ' num2str(l1,2)];
    %txt14 = ['R^2 = ' num2str(R1,2) ', R^2-adjusted = ' num2str(R1a,2)];
    %txt15 = ['t = ' num2str(t1,4) ' , p = ' num2str(p1,5)];
    %text(.65,0.88,txt11)
    %text(.65,0.84,txt12)
    %text(.65,0.80,txt13)
    %text(.65,0.76,txt14)
    %text(.65,0.72,txt15)
    hold off
    subplot(2,2,2)
    hold on
    %ylim([-0.1 2.5])
    %ylim manual
    mdl2 = fitlm(x1,y2);
    g2 = mdl2.Coefficients.Estimate(2,:);
    m2 = mdl2.Coefficients.Estimate(1,:);
    e2 = mdl2.Coefficients.SE(2,:);
    l2 = mdl2.Coefficients.SE(1,:);
    R2 = mdl2.Rsquared.Ordinary;
    R2a = mdl2.Rsquared.Adjusted;
    t2 = mdl2.Coefficients.tStat(2,:);
    p2 = mdl2.Coefficients.pValue(2,:);
    %nonlinear fit model based on code provided by Jana Haddad
    fitmodel = ['a - b*F*(1+c)./(1+c*F)'];
    
    % G = a-b*F*((1+c)/(1+c*F)) Holling II curve
    % Set up fittype and options
    ft = fittype( fitmodel, 'independent', 'F', 'dependent', 'G' );
    opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
    opts.Display = 'off';
    opts.Robust = 'Bisquare';
    % opts.StartPoint = [0 0 0];
    % Fit model to data:
    
    [fitcurve2, fitcurve_gof2] = fit( x1, y2, ft, opts )
    
    
    a2 = fitcurve2.a;
    b2 = fitcurve2.b;
    c2 = fitcurve2.c;
    
    xs=[0:0.0001:1];
    ys= a2-b2*xs*(1+c2)./(1+c2*xs);
    plot(xs,ys,'g');
    
    hold on
    scatter(x1,y2,'xb')
    errorbar(x1,y2,err2,'ob')
    xs=[0:0.0001:1];
    hold on
    plot(xs,m2+g2.*xs,'-r')
    set(gca,'ylim',[-.5 2.5]);
    title('Atlantic Shelf GF/F')
    xlabel('Fraction Unfiltered Water')
    ylabel('Apparent Growth Rate (d^-^1)')
    %txt21 = ['y = µ_0 - g(Fraction Unfiltered Water)'];
    %txt22 = ['g = ' num2str(-g2,2) ' ± ' num2str(e2,2)];
    %txt23 = ['µ_0 = ' num2str(m2,2) ' ± ' num2str(l2,2)];
    %txt24 = ['R^2 = ' num2str(R2,2) ', R^2-adjusted = ' num2str(R2a,2)];
    %txt25 = ['t = ' num2str(t2,4) ' , p = ' num2str(p2,5)];
    %text(.65,1.36,txt21)
    %text(.65,1.28,txt22)
    %text(.65,1.20,txt23)
    %text(.65,1.12,txt24)
    %text(.65,1.04,txt25)
    hold off
    subplot(2,2,3)
    %ylim([-0.1 2.5])
    %ylim manual
    hold on
    mdl3 = fitlm(x1,y3);
    title('Atlantic Shelf MIS')
    xlabel('Fraction Unfiltered Water')
    ylabel('Apparent Growth Rate (d^-^1)')
    g3 = mdl3.Coefficients.Estimate(2,:);
    m3 = mdl3.Coefficients.Estimate(1,:);
    e3 = mdl3.Coefficients.SE(2,:);
    l3 = mdl3.Coefficients.SE(1,:);
    R3 = mdl3.Rsquared.Ordinary;
    R3a = mdl3.Rsquared.Adjusted;
    t3 = mdl3.Coefficients.tStat(2,:);
    p3 = mdl3.Coefficients.pValue(2,:);
    %nonlinear fit model based on code provided by Jana Haddad
    fitmodel = ['a - b*F*(1+c)./(1+c*F)'];
    
    % G = a-b*F*((1+c)/(1+c*F)) Holling II curve
    % Set up fittype and options
    ft = fittype( fitmodel, 'independent', 'F', 'dependent', 'G' );
    opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
    opts.Display = 'off';
    opts.Robust = 'Bisquare';
    % opts.StartPoint = [0 0 0];
    % Fit model to data:
    
    [fitcurve3, fitcurve_gof3] = fit( x1, y3, ft, opts )
    
    
    a3 = fitcurve3.a;
    b3 = fitcurve3.b;
    c3 = fitcurve3.c;
    xs=[0:0.0001:1];
    ys= a3-b3*xs*(1+c3)./(1+c3*xs);
    plot(xs,ys,'g');
    
    hold on
    scatter(x1,y3,'xb')
    errorbar(x1,y3,err3,'ob')
    xs=[0:0.0001:1];
    hold on
    plot(xs,m3+g3.*xs,'-r')
    set(gca,'ylim',[-.5 2.5]);
    %txt31 = ['y = µ_0 - g(Fraction Unfiltered Water)'];
    %txt32 = ['g = ' num2str(-g3,2) ' ± ' num2str(e3,2)];
    %txt33 = ['µ_0 = ' num2str(m3,2) ' ± ' num2str(l3,2)];
    %txt34 = ['R^2 = ' num2str(R3,2) ', R^2-adjusted = ' num2str(R3a,2)];
    %txt35 = ['t = ' num2str(t3,4) ' , p = ' num2str(p3,5)];
    %text(.65,2.43,txt31)
    %text(.65,2.28,txt32)
    %text(.65,2.13,txt33)
    %text(.65,1.98,txt34)
    %text(.65,1.83,txt35)
    hold off
    
    subplot(2,2,4)
    hold on
    errorbar(x2,y4,E1,E1,E2,E2,'ob')
    errorbar(x3,y4,E1,E1,E3,E3,'ok') 
    xs=[0:1:3000000];
    ys=[0:1:3000000];
    hold on
    plot(xs,ys,'-r')
    title('Parity Plot of Atlantic Shelf Initial Bacterial Concentrations')
    ylabel('Initial bacteria concentration (cells mL^-^1) MIS as Dilution Media')
    xlabel('Initial bacteria concentration (cells mL^-^1) Prefiltered Water as Dilution Media')
    hold off

elseif z==2
    %Pamlico Sound
    y1 = PS02;
    y2 = PSGFF;
    y3 = PSMIS;
    y4 = PSbactMIS;
    x1 = FracUnfilteredWater;
    x2 = PSbact02;
    x3 = PSbactGFF;
    err1 = PS02E;
    err2 = PSGFFE; 
    err3 = PSMISE; 
    E1 = PSbactMISSE;
    E2 = PSbact02SE;
    E3 = PSbactGFFSE;

    subplot(2,2,1)
    hold on
    
    mdl1 = fitlm(x1,y1);
    g1 = mdl1.Coefficients.Estimate(2,:);
    m1 = mdl1.Coefficients.Estimate(1,:);
    e1 = mdl1.Coefficients.SE(2,:);
    l1 = mdl1.Coefficients.SE(1,:);
    R1 = mdl1.Rsquared.Ordinary;
    R1a = mdl1.Rsquared.Adjusted;
    t1 = mdl1.Coefficients.tStat(2,:);
    p1 = mdl1.Coefficients.pValue(2,:);
    %nonlinear fit model based on code provided by Jana Haddad
    fitmodel = ['a - b*F*(1+c)./(1+c*F)'];
    
    % G = a-b*F*((1+c)/(1+c*F)) Holling II curve
    % Set up fittype and options
    ft = fittype( fitmodel, 'independent', 'F', 'dependent', 'G' );
    opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
    opts.Display = 'off';
    opts.Robust = 'Bisquare';
    % opts.StartPoint = [0 0 0];
    % Fit model to data:
    
    [fitcurve1, fitcurve_gof1] = fit( x1, y1, ft, opts )
    
    
    a1 = fitcurve1.a;
    b1 = fitcurve1.b;
    c1 = fitcurve1.c;
    scatter(x1,y1,'xb')
    errorbar(x1,y1,err1,'ob')
    
    xs=[0:0.0001:1];
    ys= a1-b1*xs*(1+c1)./(1+c1*xs);
    plot(xs,ys,'g');
    hold on
    plot(xs,m1+g1.*xs,'-r')
    set(gca,'ylim',[-.5 2.5]);
    title('Pamlico Sound 0.2 µm')
    xlabel('Fraction Unfiltered Water')
    ylabel('Apparent Growth Rate (d^-^1)')
    %txt11 = ['y = µ_0 - g(Fraction Unfiltered Water)'];
    %txt12 = ['g = ' num2str(-g1,2) ' ± ' num2str(e1,2)];
    %txt13 = ['µ_0 = ' num2str(m1,2) ' ± ' num2str(l1,2)];
    %txt14 = ['R^2 = ' num2str(R1,2) ', R^2-adjusted = ' num2str(R1a,2)];
    %txt15 = ['t = ' num2str(t1,4) ' , p = ' num2str(p1,5)];
    %text(.65,0.88,txt11)
    %text(.65,0.84,txt12)
    %text(.65,0.80,txt13)
    %text(.65,0.76,txt14)
    %text(.65,0.72,txt15)
    hold off
    subplot(2,2,2)
    hold on
    %ylim([-0.1 2.5])
    %ylim manual
    mdl2 = fitlm(x1,y2);
    g2 = mdl2.Coefficients.Estimate(2,:);
    m2 = mdl2.Coefficients.Estimate(1,:);
    e2 = mdl2.Coefficients.SE(2,:);
    l2 = mdl2.Coefficients.SE(1,:);
    R2 = mdl2.Rsquared.Ordinary;
    R2a = mdl2.Rsquared.Adjusted;
    t2 = mdl2.Coefficients.tStat(2,:);
    p2 = mdl2.Coefficients.pValue(2,:);
    %nonlinear fit model based on code provided by Jana Haddad
    fitmodel = ['a - b*F*(1+c)./(1+c*F)'];
    
    % G = a-b*F*((1+c)/(1+c*F)) Holling II curve
    % Set up fittype and options
    ft = fittype( fitmodel, 'independent', 'F', 'dependent', 'G' );
    opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
    opts.Display = 'off';
    opts.Robust = 'Bisquare';
    % opts.StartPoint = [0 0 0];
    % Fit model to data:
    
    [fitcurve2, fitcurve_gof2] = fit( x1, y2, ft, opts )
    
    
    a2 = fitcurve2.a;
    b2 = fitcurve2.b;
    c2 = fitcurve2.c;
    
    xs=[0:0.0001:1];
    ys= a2-b2*xs*(1+c2)./(1+c2*xs);
    plot(xs,ys,'g');
    
    hold on
    scatter(x1,y2,'xb')
    errorbar(x1,y2,err2,'ob')
    xs=[0:0.0001:1];
    hold on
    plot(xs,m2+g2.*xs,'-r')
    set(gca,'ylim',[-.5 2.5]);
    title('Pamlico Sound GF/F')
    xlabel('Fraction Unfiltered Water')
    ylabel('Apparent Growth Rate (d^-^1)')
    %txt21 = ['y = µ_0 - g(Fraction Unfiltered Water)'];
    %txt22 = ['g = ' num2str(-g2,2) ' ± ' num2str(e2,2)];
    %txt23 = ['µ_0 = ' num2str(m2,2) ' ± ' num2str(l2,2)];
    %txt24 = ['R^2 = ' num2str(R2,2) ', R^2-adjusted = ' num2str(R2a,2)];
    %txt25 = ['t = ' num2str(t2,4) ' , p = ' num2str(p2,5)];
    %text(.65,1.36,txt21)
    %text(.65,1.28,txt22)
    %text(.65,1.20,txt23)
    %text(.65,1.12,txt24)
    %text(.65,1.04,txt25)
    hold off
    subplot(2,2,3)
    %ylim([-0.1 2.5])
    %ylim manual
    hold on
    mdl3 = fitlm(x1,y3);
    title('Pamlico Sound MIS')
    xlabel('Fraction Unfiltered Water')
    ylabel('Apparent Growth Rate (d^-^1)')
    g3 = mdl3.Coefficients.Estimate(2,:);
    m3 = mdl3.Coefficients.Estimate(1,:);
    e3 = mdl3.Coefficients.SE(2,:);
    l3 = mdl3.Coefficients.SE(1,:);
    R3 = mdl3.Rsquared.Ordinary;
    R3a = mdl3.Rsquared.Adjusted;
    t3 = mdl3.Coefficients.tStat(2,:);
    p3 = mdl3.Coefficients.pValue(2,:);
    %nonlinear fit model based on code provided by Jana Haddad
    fitmodel = ['a - b*F*(1+c)./(1+c*F)'];
    
    % G = a-b*F*((1+c)/(1+c*F)) Holling II curve
    % Set up fittype and options
    ft = fittype( fitmodel, 'independent', 'F', 'dependent', 'G' );
    opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
    opts.Display = 'off';
    opts.Robust = 'Bisquare';
    % opts.StartPoint = [0 0 0];
    % Fit model to data:
    
    [fitcurve3, fitcurve_gof3] = fit( x1, y3, ft, opts )
    
    
    a3 = fitcurve3.a;
    b3 = fitcurve3.b;
    c3 = fitcurve3.c;
    xs=[0:0.0001:1];
    ys= a3-b3*xs*(1+c3)./(1+c3*xs);
    plot(xs,ys,'g');
    
    hold on
    scatter(x1,y3,'xb')
    errorbar(x1,y3,err3,'ob')
    xs=[0:0.0001:1];
    hold on
    plot(xs,m3+g3.*xs,'-r')
    set(gca,'ylim',[-.5 2.5]);
    %txt31 = ['y = µ_0 - g(Fraction Unfiltered Water)'];
    %txt32 = ['g = ' num2str(-g3,2) ' ± ' num2str(e3,2)];
    %txt33 = ['µ_0 = ' num2str(m3,2) ' ± ' num2str(l3,2)];
    %txt34 = ['R^2 = ' num2str(R3,2) ', R^2-adjusted = ' num2str(R3a,2)];
    %txt35 = ['t = ' num2str(t3,4) ' , p = ' num2str(p3,5)];
    %text(.65,2.43,txt31)
    %text(.65,2.28,txt32)
    %text(.65,2.13,txt33)
    %text(.65,1.98,txt34)
    %text(.65,1.83,txt35)
    hold off
    
    subplot(2,2,4)
    hold on
    errorbar(x2,y4,E1,E1,E2,E2,'ob')
    errorbar(x3,y4,E1,E1,E3,E3,'ok')
    xs=[0:1:2000000];
    ys=[0:1:2000000];
    hold on
    plot(xs,ys,'-r')
    title('Parity Plot of Pamlico Sound Initial Bacterial Concentrations')
    ylabel('Initial bacteria concentration (cells mL^-^1) MIS as Dilution Media')
    xlabel('Initial bacteria concentration (cells mL^-^1) Prefiltered Water as Dilution Media')
    hold off
    
elseif z==3
    %Neuse River Estuary
    y1 = NRE02;
    y2 = NREGFF;
    y3 = NREMIS;
    y4 = NREbactMIS;
    x1 = FracUnfilteredWater;
    x2 = NREbact02;
    x3 = NREbactGFF;
    err1 = NRE02E;
    err2 = NREGFFE; 
    err3 = NREMISE; 
    E1 = NREbactMISSE;
    E2 = NREbact02SE;
    E3 = NREbactGFFSE;

    subplot(2,2,1)
    hold on
    
    mdl1 = fitlm(x1,y1);
    g1 = mdl1.Coefficients.Estimate(2,:);
    m1 = mdl1.Coefficients.Estimate(1,:);
    e1 = mdl1.Coefficients.SE(2,:);
    l1 = mdl1.Coefficients.SE(1,:);
    R1 = mdl1.Rsquared.Ordinary;
    R1a = mdl1.Rsquared.Adjusted;
    t1 = mdl1.Coefficients.tStat(2,:);
    p1 = mdl1.Coefficients.pValue(2,:);
    %nonlinear fit model based on code provided by Jana Haddad
    fitmodel = ['a - b*F*(1+c)./(1+c*F)'];
    
    % G = a-b*F*((1+c)/(1+c*F)) Holling II curve
    % Set up fittype and options
    ft = fittype( fitmodel, 'independent', 'F', 'dependent', 'G' );
    opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
    opts.Display = 'off';
    opts.Robust = 'Bisquare';
    % opts.StartPoint = [0 0 0];
    % Fit model to data:
    
    [fitcurve1, fitcurve_gof1] = fit( x1, y1, ft, opts )
    
    
    a1 = fitcurve1.a;
    b1 = fitcurve1.b;
    c1 = fitcurve1.c;
    scatter(x1,y1,'xb')
    errorbar(x1,y1,err1,'ob')
    
    xs=[0:0.0001:1];
    ys= a1-b1*xs*(1+c1)./(1+c1*xs);
    plot(xs,ys,'g');
    hold on
    plot(xs,m1+g1.*xs,'-r')
    set(gca,'ylim',[-.5 2.5]);
    title('Neuse River Estuary 0.2 µm')
    xlabel('Fraction Unfiltered Water')
    ylabel('Apparent Growth Rate (d^-^1)')
    %txt11 = ['y = µ_0 - g(Fraction Unfiltered Water)'];
    %txt12 = ['g = ' num2str(-g1,2) ' ± ' num2str(e1,2)];
    %txt13 = ['µ_0 = ' num2str(m1,2) ' ± ' num2str(l1,2)];
    %txt14 = ['R^2 = ' num2str(R1,2) ', R^2-adjusted = ' num2str(R1a,2)];
    %txt15 = ['t = ' num2str(t1,4) ' , p = ' num2str(p1,5)];
    %text(.65,0.88,txt11)
    %text(.65,0.84,txt12)
    %text(.65,0.80,txt13)
    %text(.65,0.76,txt14)
    %text(.65,0.72,txt15)
    hold off
    subplot(2,2,2)
    hold on
    %ylim([-0.1 2.5])
    %ylim manual
    mdl2 = fitlm(x1,y2);
    g2 = mdl2.Coefficients.Estimate(2,:);
    m2 = mdl2.Coefficients.Estimate(1,:);
    e2 = mdl2.Coefficients.SE(2,:);
    l2 = mdl2.Coefficients.SE(1,:);
    R2 = mdl2.Rsquared.Ordinary;
    R2a = mdl2.Rsquared.Adjusted;
    t2 = mdl2.Coefficients.tStat(2,:);
    p2 = mdl2.Coefficients.pValue(2,:);
    %nonlinear fit model based on code provided by Jana Haddad
    fitmodel = ['a - b*F*(1+c)./(1+c*F)'];
    
    % G = a-b*F*((1+c)/(1+c*F)) Holling II curve
    % Set up fittype and options
    ft = fittype( fitmodel, 'independent', 'F', 'dependent', 'G' );
    opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
    opts.Display = 'off';
    opts.Robust = 'Bisquare';
    % opts.StartPoint = [0 0 0];
    % Fit model to data:
    
    [fitcurve2, fitcurve_gof2] = fit( x1, y2, ft, opts )
    
    
    a2 = fitcurve2.a;
    b2 = fitcurve2.b;
    c2 = fitcurve2.c;
    
    xs=[0:0.0001:1];
    ys= a2-b2*xs*(1+c2)./(1+c2*xs);
    plot(xs,ys,'g');
    
    hold on
    scatter(x1,y2,'xb')
    errorbar(x1,y2,err2,'ob')
    xs=[0:0.0001:1];
    hold on
    plot(xs,m2+g2.*xs,'-r')
    set(gca,'ylim',[-.5 2.5]);
    title('Neuse River Estuary GF/F')
    xlabel('Fraction Unfiltered Water')
    ylabel('Apparent Growth Rate (d^-^1)')
    %txt21 = ['y = µ_0 - g(Fraction Unfiltered Water)'];
    %txt22 = ['g = ' num2str(-g2,2) ' ± ' num2str(e2,2)];
    %txt23 = ['µ_0 = ' num2str(m2,2) ' ± ' num2str(l2,2)];
    %txt24 = ['R^2 = ' num2str(R2,2) ', R^2-adjusted = ' num2str(R2a,2)];
    %txt25 = ['t = ' num2str(t2,4) ' , p = ' num2str(p2,5)];
    %text(.65,1.36,txt21)
    %text(.65,1.28,txt22)
    %text(.65,1.20,txt23)
    %text(.65,1.12,txt24)
    %text(.65,1.04,txt25)
    hold off
    subplot(2,2,3)
    %ylim([-0.1 2.5])
    %ylim manual
    hold on
    mdl3 = fitlm(x1,y3);
    title('Neuse River Estuary MIS')
    xlabel('Fraction Unfiltered Water')
    ylabel('Apparent Growth Rate (d^-^1)')
    g3 = mdl3.Coefficients.Estimate(2,:);
    m3 = mdl3.Coefficients.Estimate(1,:);
    e3 = mdl3.Coefficients.SE(2,:);
    l3 = mdl3.Coefficients.SE(1,:);
    R3 = mdl3.Rsquared.Ordinary;
    R3a = mdl3.Rsquared.Adjusted;
    t3 = mdl3.Coefficients.tStat(2,:);
    p3 = mdl3.Coefficients.pValue(2,:);
    %nonlinear fit model based on code provided by Jana Haddad
    fitmodel = ['a - b*F*(1+c)./(1+c*F)'];
    
    % G = a-b*F*((1+c)/(1+c*F)) Holling II curve
    % Set up fittype and options
    ft = fittype( fitmodel, 'independent', 'F', 'dependent', 'G' );
    opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
    opts.Display = 'off';
    opts.Robust = 'Bisquare';
    % opts.StartPoint = [0 0 0];
    % Fit model to data:
    
    [fitcurve3, fitcurve_gof3] = fit( x1, y3, ft, opts )
    
    
    a3 = fitcurve3.a;
    b3 = fitcurve3.b;
    c3 = fitcurve3.c;
    xs=[0:0.0001:1];
    ys= a3-b3*xs*(1+c3)./(1+c3*xs);
    plot(xs,ys,'g');
    
    hold on
    scatter(x1,y3,'xb')
    errorbar(x1,y3,err3,'ob')
    xs=[0:0.0001:1];
    hold on
    plot(xs,m3+g3.*xs,'-r')
    set(gca,'ylim',[-.5 2.5]);
    %txt31 = ['y = µ_0 - g(Fraction Unfiltered Water)'];
    %txt32 = ['g = ' num2str(-g3,2) ' ± ' num2str(e3,2)];
    %txt33 = ['µ_0 = ' num2str(m3,2) ' ± ' num2str(l3,2)];
    %txt34 = ['R^2 = ' num2str(R3,2) ', R^2-adjusted = ' num2str(R3a,2)];
    %txt35 = ['t = ' num2str(t3,4) ' , p = ' num2str(p3,5)];
    %text(.65,2.43,txt31)
    %text(.65,2.28,txt32)
    %text(.65,2.13,txt33)
    %text(.65,1.98,txt34)
    %text(.65,1.83,txt35)
    hold off
    
    subplot(2,2,4)
    hold on
    errorbar(x2,y4,E1,E1,E2,E2,'ob')
    errorbar(x3,y4,E1,E1,E3,E3,'ok')
    xs=[0:1:12000000];
    ys=[0:1:12000000];
    hold on
    plot(xs,ys,'-r')
    title('Parity Plot of Neuse River Estuary Initial Bacterial Concentrations')
    ylabel('Initial bacteria concentration (cells mL^-^1) MIS as Dilution Media')
    xlabel('Initial bacteria concentration (cells mL^-^1) Prefiltered Water as Dilution Media')
    hold off
    
elseif z==4
    %Chowan River
    y1 = CR02;
    y2 = CRGFF;
    y3 = CRMIS;
    y4 = CRbactMIS;
    x1 = FracUnfilteredWater;
    x2 = CRbact02;
    x3 = CRbactGFF;
    err1 = CR02E;
    err2 = CRGFFE; 
    err3 = CRMISE; 
    E1 = CRbactMISSE;
    E2 = CRbact02SE;
    E3 = CRbactGFFSE;

    subplot(2,2,1)
    hold on
    
    mdl1 = fitlm(x1,y1);
    g1 = mdl1.Coefficients.Estimate(2,:);
    m1 = mdl1.Coefficients.Estimate(1,:);
    e1 = mdl1.Coefficients.SE(2,:);
    l1 = mdl1.Coefficients.SE(1,:);
    R1 = mdl1.Rsquared.Ordinary;
    R1a = mdl1.Rsquared.Adjusted;
    t1 = mdl1.Coefficients.tStat(2,:);
    p1 = mdl1.Coefficients.pValue(2,:);
    %nonlinear fit model based on code provided by Jana Haddad
    fitmodel = ['a - b*F*(1+c)./(1+c*F)'];
    
    % G = a-b*F*((1+c)/(1+c*F)) Holling II curve
    % Set up fittype and options
    ft = fittype( fitmodel, 'independent', 'F', 'dependent', 'G' );
    opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
    opts.Display = 'off';
    opts.Robust = 'Bisquare';
    % opts.StartPoint = [0 0 0];
    % Fit model to data:
    
    [fitcurve1, fitcurve_gof1] = fit( x1, y1, ft, opts )
    
    
    a1 = fitcurve1.a;
    b1 = fitcurve1.b;
    c1 = fitcurve1.c;
    scatter(x1,y1,'xb')
    errorbar(x1,y1,err1,'ob')
    
    xs=[0:0.0001:1];
    ys= a1-b1*xs*(1+c1)./(1+c1*xs);
    plot(xs,ys,'g');
    hold on
    plot(xs,m1+g1.*xs,'-r')
    set(gca,'ylim',[-.5 2.5]);
    title('Chowan River 0.2 µm')
    xlabel('Fraction Unfiltered Water')
    ylabel('Apparent Growth Rate (d^-^1)')
    %txt11 = ['y = µ_0 - g(Fraction Unfiltered Water)'];
    %txt12 = ['g = ' num2str(-g1,2) ' ± ' num2str(e1,2)];
    %txt13 = ['µ_0 = ' num2str(m1,2) ' ± ' num2str(l1,2)];
    %txt14 = ['R^2 = ' num2str(R1,2) ', R^2-adjusted = ' num2str(R1a,2)];
    %txt15 = ['t = ' num2str(t1,4) ' , p = ' num2str(p1,5)];
    %text(.65,0.88,txt11)
    %text(.65,0.84,txt12)
    %text(.65,0.80,txt13)
    %text(.65,0.76,txt14)
    %text(.65,0.72,txt15)
    hold off
    subplot(2,2,2)
    hold on
    %ylim([-0.1 2.5])
    %ylim manual
    mdl2 = fitlm(x1,y2);
    g2 = mdl2.Coefficients.Estimate(2,:);
    m2 = mdl2.Coefficients.Estimate(1,:);
    e2 = mdl2.Coefficients.SE(2,:);
    l2 = mdl2.Coefficients.SE(1,:);
    R2 = mdl2.Rsquared.Ordinary;
    R2a = mdl2.Rsquared.Adjusted;
    t2 = mdl2.Coefficients.tStat(2,:);
    p2 = mdl2.Coefficients.pValue(2,:);
    %nonlinear fit model based on code provided by Jana Haddad
    fitmodel = ['a - b*F*(1+c)./(1+c*F)'];
    
    % G = a-b*F*((1+c)/(1+c*F)) Holling II curve
    % Set up fittype and options
    ft = fittype( fitmodel, 'independent', 'F', 'dependent', 'G' );
    opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
    opts.Display = 'off';
    opts.Robust = 'Bisquare';
    % opts.StartPoint = [0 0 0];
    % Fit model to data:
    
    [fitcurve2, fitcurve_gof2] = fit( x1, y2, ft, opts )
    
    
    a2 = fitcurve2.a;
    b2 = fitcurve2.b;
    c2 = fitcurve2.c;
    
    xs=[0:0.0001:1];
    ys= a2-b2*xs*(1+c2)./(1+c2*xs);
    plot(xs,ys,'g');
    
    hold on
    scatter(x1,y2,'xb')
    errorbar(x1,y2,err2,'ob')
    xs=[0:0.0001:1];
    hold on
    plot(xs,m2+g2.*xs,'-r')
    set(gca,'ylim',[-.5 2.5]);
    title('Chowan River GF/F')
    xlabel('Fraction Unfiltered Water')
    ylabel('Apparent Growth Rate (d^-^1)')
    %txt21 = ['y = µ_0 - g(Fraction Unfiltered Water)'];
    %txt22 = ['g = ' num2str(-g2,2) ' ± ' num2str(e2,2)];
    %txt23 = ['µ_0 = ' num2str(m2,2) ' ± ' num2str(l2,2)];
    %txt24 = ['R^2 = ' num2str(R2,2) ', R^2-adjusted = ' num2str(R2a,2)];
    %txt25 = ['t = ' num2str(t2,4) ' , p = ' num2str(p2,5)];
    %text(.65,1.36,txt21)
    %text(.65,1.28,txt22)
    %text(.65,1.20,txt23)
    %text(.65,1.12,txt24)
    %text(.65,1.04,txt25)
    hold off
    subplot(2,2,3)
    %ylim([-0.1 2.5])
    %ylim manual
    hold on
    mdl3 = fitlm(x1,y3);
    title('Chowan River MIS')
    xlabel('Fraction Unfiltered Water')
    ylabel('Apparent Growth Rate (d^-^1)')
    g3 = mdl3.Coefficients.Estimate(2,:);
    m3 = mdl3.Coefficients.Estimate(1,:);
    e3 = mdl3.Coefficients.SE(2,:);
    l3 = mdl3.Coefficients.SE(1,:);
    R3 = mdl3.Rsquared.Ordinary;
    R3a = mdl3.Rsquared.Adjusted;
    t3 = mdl3.Coefficients.tStat(2,:);
    p3 = mdl3.Coefficients.pValue(2,:);
    %nonlinear fit model based on code provided by Jana Haddad
    fitmodel = ['a - b*F*(1+c)./(1+c*F)'];
    
    % G = a-b*F*((1+c)/(1+c*F)) Holling II curve
    % Set up fittype and options
    ft = fittype( fitmodel, 'independent', 'F', 'dependent', 'G' );
    opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
    opts.Display = 'off';
    opts.Robust = 'Bisquare';
    % opts.StartPoint = [0 0 0];
    % Fit model to data:
    
    [fitcurve3, fitcurve_gof3] = fit( x1, y3, ft, opts )
    
    
    a3 = fitcurve3.a;
    b3 = fitcurve3.b;
    c3 = fitcurve3.c;
    xs=[0:0.0001:1];
    ys= a3-b3*xs*(1+c3)./(1+c3*xs);
    plot(xs,ys,'g');
    
    hold on
    scatter(x1,y3,'xb')
    errorbar(x1,y3,err3,'ob')
    xs=[0:0.0001:1];
    hold on
    plot(xs,m3+g3.*xs,'-r')
    set(gca,'ylim',[-.5 2.5]);
    %txt31 = ['y = µ_0 - g(Fraction Unfiltered Water)'];
    %txt32 = ['g = ' num2str(-g3,2) ' ± ' num2str(e3,2)];
    %txt33 = ['µ_0 = ' num2str(m3,2) ' ± ' num2str(l3,2)];
    %txt34 = ['R^2 = ' num2str(R3,2) ', R^2-adjusted = ' num2str(R3a,2)];
    %txt35 = ['t = ' num2str(t3,4) ' , p = ' num2str(p3,5)];
    %text(.65,2.43,txt31)
    %text(.65,2.28,txt32)
    %text(.65,2.13,txt33)
    %text(.65,1.98,txt34)
    %text(.65,1.83,txt35)
    hold off
    
    subplot(2,2,4)
    hold on
    errorbar(x2,y4,E1,E1,E2,E2,'ob')
    errorbar(x3,y4,E1,E1,E3,E3,'ok')
    xs=[0:1:3000000];
    ys=[0:1:3000000];
    hold on
    plot(xs,ys,'-r')
    title('Parity Plot of Chowan River Initial Bacterial Concentrations')
    ylabel('Initial bacteria concentration (cells mL^-^1) MIS as Dilution Media')
    xlabel('Initial bacteria concentration (cells mL^-^1) Prefiltered Water as Dilution Media')
    hold off
    
elseif z==5
    %Jordan Lake
    y1 = JL02;
    y2 = JLGFF;
    y3 = JLMIS;
    y4 = JLbactMIS;
    x1 = FracUnfilteredWater;
    x2 = JLbact02;
    x3 = JLbactGFF;
    err1 = JL02E;
    err2 = JLGFFE; 
    err3 = JLMISE; 
    E1 = JLbactMISSE;
    E2 = JLbact02SE;
    E3 = JLbactGFFSE;

    subplot(2,2,1)
    hold on
    
    mdl1 = fitlm(x1,y1);
    g1 = mdl1.Coefficients.Estimate(2,:);
    m1 = mdl1.Coefficients.Estimate(1,:);
    e1 = mdl1.Coefficients.SE(2,:);
    l1 = mdl1.Coefficients.SE(1,:);
    R1 = mdl1.Rsquared.Ordinary;
    R1a = mdl1.Rsquared.Adjusted;
    t1 = mdl1.Coefficients.tStat(2,:);
    p1 = mdl1.Coefficients.pValue(2,:);
    %nonlinear fit model based on code provided by Jana Haddad
    fitmodel = ['a - b*F*(1+c)./(1+c*F)'];
    
    % G = a-b*F*((1+c)/(1+c*F)) Holling II curve
    % Set up fittype and options
    ft = fittype( fitmodel, 'independent', 'F', 'dependent', 'G' );
    opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
    opts.Display = 'off';
    opts.Robust = 'Bisquare';
    % opts.StartPoint = [0 0 0];
    % Fit model to data:
    
    [fitcurve1, fitcurve_gof1] = fit( x1, y1, ft, opts )
    
    
    a1 = fitcurve1.a;
    b1 = fitcurve1.b;
    c1 = fitcurve1.c;
    scatter(x1,y1,'xb')
    errorbar(x1,y1,err1,'ob')
    
    xs=[0:0.0001:1];
    ys= a1-b1*xs*(1+c1)./(1+c1*xs);
    plot(xs,ys,'g');
    hold on
    plot(xs,m1+g1.*xs,'-r')
    set(gca,'ylim',[-.5 2.5]);
    title('Jordan Lake 0.2 µm')
    xlabel('Fraction Unfiltered Water')
    ylabel('Apparent Growth Rate (d^-^1)')
    %txt11 = ['y = µ_0 - g(Fraction Unfiltered Water)'];
    %txt12 = ['g = ' num2str(-g1,2) ' ± ' num2str(e1,2)];
    %txt13 = ['µ_0 = ' num2str(m1,2) ' ± ' num2str(l1,2)];
    %txt14 = ['R^2 = ' num2str(R1,2) ', R^2-adjusted = ' num2str(R1a,2)];
    %txt15 = ['t = ' num2str(t1,4) ' , p = ' num2str(p1,5)];
    %text(.65,0.88,txt11)
    %text(.65,0.84,txt12)
    %text(.65,0.80,txt13)
    %text(.65,0.76,txt14)
    %text(.65,0.72,txt15)
    hold off
    subplot(2,2,2)
    hold on
    %ylim([-0.1 2.5])
    %ylim manual
    mdl2 = fitlm(x1,y2);
    g2 = mdl2.Coefficients.Estimate(2,:);
    m2 = mdl2.Coefficients.Estimate(1,:);
    e2 = mdl2.Coefficients.SE(2,:);
    l2 = mdl2.Coefficients.SE(1,:);
    R2 = mdl2.Rsquared.Ordinary;
    R2a = mdl2.Rsquared.Adjusted;
    t2 = mdl2.Coefficients.tStat(2,:);
    p2 = mdl2.Coefficients.pValue(2,:);
    %nonlinear fit model based on code provided by Jana Haddad
    fitmodel = ['a - b*F*(1+c)./(1+c*F)'];
    
    % G = a-b*F*((1+c)/(1+c*F)) Holling II curve
    % Set up fittype and options
    ft = fittype( fitmodel, 'independent', 'F', 'dependent', 'G' );
    opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
    opts.Display = 'off';
    opts.Robust = 'Bisquare';
    % opts.StartPoint = [0 0 0];
    % Fit model to data:
    
    [fitcurve2, fitcurve_gof2] = fit( x1, y2, ft, opts )
    
    
    a2 = fitcurve2.a;
    b2 = fitcurve2.b;
    c2 = fitcurve2.c;
    
    xs=[0:0.0001:1];
    ys= a2-b2*xs*(1+c2)./(1+c2*xs);
    plot(xs,ys,'g');
    
    hold on
    scatter(x1,y2,'xb')
    errorbar(x1,y2,err2,'ob')
    xs=[0:0.0001:1];
    hold on
    plot(xs,m2+g2.*xs,'-r')
    set(gca,'ylim',[-.5 2.5]);
    title('Jordan Lake GF/F')
    xlabel('Fraction Unfiltered Water')
    ylabel('Apparent Growth Rate (d^-^1)')
    %txt21 = ['y = µ_0 - g(Fraction Unfiltered Water)'];
    %txt22 = ['g = ' num2str(-g2,2) ' ± ' num2str(e2,2)];
    %txt23 = ['µ_0 = ' num2str(m2,2) ' ± ' num2str(l2,2)];
    %txt24 = ['R^2 = ' num2str(R2,2) ', R^2-adjusted = ' num2str(R2a,2)];
    %txt25 = ['t = ' num2str(t2,4) ' , p = ' num2str(p2,5)];
    %text(.65,1.36,txt21)
    %text(.65,1.28,txt22)
    %text(.65,1.20,txt23)
    %text(.65,1.12,txt24)
    %text(.65,1.04,txt25)
    hold off
    subplot(2,2,3)
    %ylim([-0.1 2.5])
    %ylim manual
    hold on
    mdl3 = fitlm(x1,y3);
    title('Jordan Lake MIS')
    xlabel('Fraction Unfiltered Water')
    ylabel('Apparent Growth Rate (d^-^1)')
    g3 = mdl3.Coefficients.Estimate(2,:);
    m3 = mdl3.Coefficients.Estimate(1,:);
    e3 = mdl3.Coefficients.SE(2,:);
    l3 = mdl3.Coefficients.SE(1,:);
    R3 = mdl3.Rsquared.Ordinary;
    R3a = mdl3.Rsquared.Adjusted;
    t3 = mdl3.Coefficients.tStat(2,:);
    p3 = mdl3.Coefficients.pValue(2,:);
    %nonlinear fit model based on code provided by Jana Haddad
    fitmodel = ['a - b*F*(1+c)./(1+c*F)'];
    
    % G = a-b*F*((1+c)/(1+c*F)) Holling II curve
    % Set up fittype and options
    ft = fittype( fitmodel, 'independent', 'F', 'dependent', 'G' );
    opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
    opts.Display = 'off';
    opts.Robust = 'Bisquare';
    % opts.StartPoint = [0 0 0];
    % Fit model to data:
    
    [fitcurve3, fitcurve_gof3] = fit( x1, y3, ft, opts )
    
    
    a3 = fitcurve3.a;
    b3 = fitcurve3.b;
    c3 = fitcurve3.c;
    xs=[0:0.0001:1];
    ys= a3-b3*xs*(1+c3)./(1+c3*xs);
    plot(xs,ys,'g');
    
    hold on
    scatter(x1,y3,'xb')
    errorbar(x1,y3,err3,'ob')
    xs=[0:0.0001:1];
    hold on
    plot(xs,m3+g3.*xs,'-r')
    set(gca,'ylim',[-.5 2.5]);
    %txt31 = ['y = µ_0 - g(Fraction Unfiltered Water)'];
    %txt32 = ['g = ' num2str(-g3,2) ' ± ' num2str(e3,2)];
    %txt33 = ['µ_0 = ' num2str(m3,2) ' ± ' num2str(l3,2)];
    %txt34 = ['R^2 = ' num2str(R3,2) ', R^2-adjusted = ' num2str(R3a,2)];
    %txt35 = ['t = ' num2str(t3,4) ' , p = ' num2str(p3,5)];
    %text(.65,2.43,txt31)
    %text(.65,2.28,txt32)
    %text(.65,2.13,txt33)
    %text(.65,1.98,txt34)
    %text(.65,1.83,txt35)
    hold off
    
    subplot(2,2,4)
    hold on
    errorbar(x2,y4,E1,E1,E2,E2,'ob')
    errorbar(x3,y4,E1,E1,E3,E3,'ok')
    xs=[0:1:6000000];
    ys=[0:1:6000000];
    hold on
    plot(xs,ys,'-r')
    title('Parity Plot of Jordan Lake Initial Bacterial Concentrations')
    ylabel('Initial bacteria concentration (cells mL^-^1) MIS as Dilution Media')
    xlabel('Initial bacteria concentration (cells mL^-^1) Prefiltered Water as Dilution Media')
    hold off
end