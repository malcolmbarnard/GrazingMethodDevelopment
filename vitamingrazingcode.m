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
    y1 = ASGFF;
    y2 = ASGFFVit;
    y3 = ASMIS;
    y4 = ASMISVit;
    y5 = ASbactGFFVit;
    y6 = ASbactMISVit;
    err1 = ASGFFE;
    err2 = ASGFFVitE;
    err3 = ASMISE;
    err4 = ASMISVitE;
    x1 = FracUnfilteredWater;
    x2 = ASbactGFF;
    x3 = ASbactMIS;
    E1 = ASbactGFFE;
    E2 = ASbactGFFVitE;
    E3 = ASbactMISE;
    E4 = ASbactMISVitE;
    subplot(3,2,1)
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
    title('Atlantic Shelf GF/F')
    xlabel('Fraction Unfiltered Water')
    ylabel('Apparent Growth Rate (d^-^1)')
    %txt11 = ['y = µ_0 - g(Fraction Unfiltered Water)'];
    %txt12 = ['g = ' num2str(-g1,2) ' ± ' num2str(e1,2)];
    %txt13 = ['µ_0 = ' num2str(m1,2) ' ± ' num2str(l1,2)];
    %txt14 = ['R^2 = ' num2str(R1,2) ', R^2-adjusted = ' num2str(R1a,2)];
    %txt15 = ['t = ' num2str(t1,4) ' , p = ' num2str(p1,5)];
    %text(.65,0.75,txt11)
    %text(.65,0.65,txt12)
    %text(.65,0.55,txt13)
    %text(.65,0.45,txt14)
    %text(.65,0.35,txt15)
    hold off
    subplot(3,2,3)
    hold on
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
    scatter(x1,y2,'xb')
    errorbar(x1,y2,err2,'ob')
    
    xs=[0:0.0001:1];
    ys= a2-b2*xs*(1+c2)./(1+c2*xs);
    plot(xs,ys,'g');
    hold on
    plot(xs,m2+g2.*xs,'-r')
    set(gca,'ylim',[-.5 2.5]);
    title('Atlantic Shelf GF/F + F/200 Vitamins')
    xlabel('Fraction Unfiltered Water')
    ylabel('Apparent Growth Rate (d^-^1)')
    %txt21 = ['y = µ_0 - g(Fraction Unfiltered Water)'];
    %txt22 = ['g = ' num2str(-g2,2) ' ± ' num2str(e2,2)];
    %txt23 = ['µ_0 = ' num2str(m2,2) ' ± ' num2str(l2,2)];
    %txt24 = ['R^2 = ' num2str(R2,2) ', R^2-adjusted = ' num2str(R2a,2)];
    %txt25 = ['t = ' num2str(t2,4) ' , p = ' num2str(p2,5)];
    %text(.65,0.95,txt21)
    %text(.65,0.83,txt22)
    %text(.65,0.71,txt23)
    %text(.65,0.60,txt24)
    %text(.65,0.48,txt25)
    hold off
    subplot(3,2,2)
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
    scatter(x1,y3,'xb')
    errorbar(x1,y3,err3,'ob')
    
    xs=[0:0.0001:1];
    ys= a3-b3*xs*(1+c3)./(1+c3*xs);
    plot(xs,ys,'g');
    hold on
    plot(xs,m3+g3.*xs,'-r')
    set(gca,'ylim',[-.5 2.5]);
    %txt31 = ['y = µ_0 - g(Fraction Unfiltered Water)'];
    %txt32 = ['g = ' num2str(-g3,2) ' ± ' num2str(e3,2)];
    %txt33 = ['µ_0 = ' num2str(m3,2) ' ± ' num2str(l3,2)];
    %txt34 = ['R^2 = ' num2str(R3,2) ', R^2-adjusted = ' num2str(R3a,2)];
    %txt35 = ['t = ' num2str(t3,4) ' , p = ' num2str(p3,5)];
    %text(.65,0.36,txt31)
    %text(.65,0.29,txt32)
    %text(.65,0.22,txt33)
    %text(.65,0.15,txt34)
    %text(.65,0.08,txt35)
    hold off
    subplot(3,2,4)
    hold on
    mdl4 = fitlm(x1,y4);
    title('Atlantic Shelf MIS + F/200 Vitamins')
    xlabel('Fraction Unfiltered Water')
    ylabel('Apparent Growth Rate (d^-^1)')
    g4 = mdl4.Coefficients.Estimate(2,:);
    m4 = mdl4.Coefficients.Estimate(1,:);
    e4 = mdl4.Coefficients.SE(2,:);
    l4 = mdl4.Coefficients.SE(1,:);
    R4 = mdl4.Rsquared.Ordinary;
    R4a = mdl4.Rsquared.Adjusted;
    t4 = mdl4.Coefficients.tStat(2,:);
    p4 = mdl4.Coefficients.pValue(2,:);
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
    
    [fitcurve4, fitcurve_gof4] = fit( x1, y4, ft, opts )
    
    
    a4 = fitcurve4.a;
    b4 = fitcurve4.b;
    c4 = fitcurve4.c;
    scatter(x1,y4,'xb')
    errorbar(x1,y4,err4,'ob')
    
    xs=[0:0.0001:1];
    ys= a4-b4*xs*(1+c4)./(1+c4*xs);
    plot(xs,ys,'g');
    hold on
    plot(xs,m4+g4.*xs,'-r')
    set(gca,'ylim',[-.5 2.5]);
    %txt41 = ['y = µ_0 - g(Fraction Unfiltered Water)'];
    %txt42 = ['g = ' num2str(-g4,2) ' ± ' num2str(e4,2)];
    %txt43 = ['µ_0 = ' num2str(m4,2) ' ± ' num2str(l4,2)];
    %txt44 = ['R^2 = ' num2str(R4,2) ', R^2-adjusted = ' num2str(R4a,2)];
    %txt45 = ['t = ' num2str(t4,4) ' , p = ' num2str(p4,5)];
    %text(.65,0.36,txt41)
    %text(.65,0.29,txt42)
    %text(.65,0.22,txt43)
    %text(.65,0.15,txt44)
    %text(.65,0.08,txt45)
    subplot(3,2,5)
    hold on
    errorbar(x2,y5,E2,E2,E1,E1,'ob')
    errorbar(x3,y6,E4,E4,E3,E3,'ok')
    xs=[-1:0.0001:1];
    ys=[-1:0.0001:1];
    hold on
    plot(xs,ys,'-r')
    title('Parity Plot of Atlantic Shelf Bacterial Production')
    xlabel('Bacterial Growth Rate (d^-^1) Without Vitamin Additions')
    ylabel('Bacterial Growth Rate (d^-^1) With F/200 Vitamin Additions')
    hold off

elseif z==2
    %Pamlico Sound
    y1 = PSGFF;
    y2 = PSGFFVit;
    y3 = PSMIS;
    y4 = PSMISVit;
    y5 = PSbactGFFVit;
    y6 = PSbactMISVit;
    err1 = PSGFFE;
    err2 = PSGFFVitE;
    err3 = PSMISE;
    err4 = PSMISVitE;
    x1 = FracUnfilteredWater;
    x2 = PSbactGFF;
    x3 = PSbactMIS;
    E1 = PSbactGFFE;
    E2 = PSbactGFFVitE;
    E3 = PSbactMISE;
    E4 = PSbactMISVitE;
    subplot(3,2,1)
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
    title('Pamlico Sound GF/F')
    xlabel('Fraction Unfiltered Water')
    ylabel('Apparent Growth Rate (d^-^1)')
    %txt11 = ['y = µ_0 - g(Fraction Unfiltered Water)'];
    %txt12 = ['g = ' num2str(-g1,2) ' ± ' num2str(e1,2)];
    %txt13 = ['µ_0 = ' num2str(m1,2) ' ± ' num2str(l1,2)];
    %txt14 = ['R^2 = ' num2str(R1,2) ', R^2-adjusted = ' num2str(R1a,2)];
    %txt15 = ['t = ' num2str(t1,4) ' , p = ' num2str(p1,5)];
    %text(.65,0.75,txt11)
    %text(.65,0.65,txt12)
    %text(.65,0.55,txt13)
    %text(.65,0.45,txt14)
    %text(.65,0.35,txt15)
    hold off
    subplot(3,2,3)
    hold on
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
    scatter(x1,y2,'xb')
    errorbar(x1,y2,err2,'ob')
    
    xs=[0:0.0001:1];
    ys= a2-b2*xs*(1+c2)./(1+c2*xs);
    plot(xs,ys,'g');
    hold on
    plot(xs,m2+g2.*xs,'-r')
    set(gca,'ylim',[-.5 2.5]);
    title('Pamlico Sound GF/F + F/200 Vitamins')
    xlabel('Fraction Unfiltered Water')
    ylabel('Apparent Growth Rate (d^-^1)')
    %txt21 = ['y = µ_0 - g(Fraction Unfiltered Water)'];
    %txt22 = ['g = ' num2str(-g2,2) ' ± ' num2str(e2,2)];
    %txt23 = ['µ_0 = ' num2str(m2,2) ' ± ' num2str(l2,2)];
    %txt24 = ['R^2 = ' num2str(R2,2) ', R^2-adjusted = ' num2str(R2a,2)];
    %txt25 = ['t = ' num2str(t2,4) ' , p = ' num2str(p2,5)];
    %text(.65,0.95,txt21)
    %text(.65,0.83,txt22)
    %text(.65,0.71,txt23)
    %text(.65,0.60,txt24)
    %text(.65,0.48,txt25)
    hold off
    subplot(3,2,2)
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
    scatter(x1,y3,'xb')
    errorbar(x1,y3,err3,'ob')
    
    xs=[0:0.0001:1];
    ys= a3-b3*xs*(1+c3)./(1+c3*xs);
    plot(xs,ys,'g');
    hold on
    plot(xs,m3+g3.*xs,'-r')
    set(gca,'ylim',[-.5 2.5]);
    %txt31 = ['y = µ_0 - g(Fraction Unfiltered Water)'];
    %txt32 = ['g = ' num2str(-g3,2) ' ± ' num2str(e3,2)];
    %txt33 = ['µ_0 = ' num2str(m3,2) ' ± ' num2str(l3,2)];
    %txt34 = ['R^2 = ' num2str(R3,2) ', R^2-adjusted = ' num2str(R3a,2)];
    %txt35 = ['t = ' num2str(t3,4) ' , p = ' num2str(p3,5)];
    %text(.65,0.36,txt31)
    %text(.65,0.29,txt32)
    %text(.65,0.22,txt33)
    %text(.65,0.15,txt34)
    %text(.65,0.08,txt35)
    hold off
    subplot(3,2,4)
    hold on
    mdl4 = fitlm(x1,y4);
    title('Pamlico Sound MIS + F/200 Vitamins')
    xlabel('Fraction Unfiltered Water')
    ylabel('Apparent Growth Rate (d^-^1)')
    g4 = mdl4.Coefficients.Estimate(2,:);
    m4 = mdl4.Coefficients.Estimate(1,:);
    e4 = mdl4.Coefficients.SE(2,:);
    l4 = mdl4.Coefficients.SE(1,:);
    R4 = mdl4.Rsquared.Ordinary;
    R4a = mdl4.Rsquared.Adjusted;
    t4 = mdl4.Coefficients.tStat(2,:);
    p4 = mdl4.Coefficients.pValue(2,:);
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
    
    [fitcurve4, fitcurve_gof4] = fit( x1, y4, ft, opts )
    
    
    a4 = fitcurve4.a;
    b4 = fitcurve4.b;
    c4 = fitcurve4.c;
    scatter(x1,y4,'xb')
    errorbar(x1,y4,err4,'ob')
    
    xs=[0:0.0001:1];
    ys= a4-b4*xs*(1+c4)./(1+c4*xs);
    plot(xs,ys,'g');
    hold on
    plot(xs,m4+g4.*xs,'-r')
    set(gca,'ylim',[-.5 2.5]);
    %txt41 = ['y = µ_0 - g(Fraction Unfiltered Water)'];
    %txt42 = ['g = ' num2str(-g4,2) ' ± ' num2str(e4,2)];
    %txt43 = ['µ_0 = ' num2str(m4,2) ' ± ' num2str(l4,2)];
    %txt44 = ['R^2 = ' num2str(R4,2) ', R^2-adjusted = ' num2str(R4a,2)];
    %txt45 = ['t = ' num2str(t4,4) ' , p = ' num2str(p4,5)];
    %text(.65,0.36,txt41)
    %text(.65,0.29,txt42)
    %text(.65,0.22,txt43)
    %text(.65,0.15,txt44)
    %text(.65,0.08,txt45)
    subplot(3,2,5)
    hold on
    errorbar(x2,y5,E2,E2,E1,E1,'ob')
    errorbar(x3,y6,E4,E4,E3,E3,'ok')
    xs=[-1:0.0001:1];
    ys=[-1:0.0001:1];
    hold on
    plot(xs,ys,'-r')
    title('Parity Plot of Pamlico Bacterial Production')
    xlabel('Bacterial Growth Rate (d^-^1) Without Vitamin Additions')
    ylabel('Bacterial Growth Rate (d^-^1) With F/200 Vitamin Additions')
    hold off
    
elseif z==3
    %Neuse River Estuary
    y1 = NREGFF;
    y2 = NREGFFVit;
    y3 = NREMIS;
    y4 = NREMISVit;
    y5 = NREbactGFFVit;
    y6 = NREbactMISVit;
    err1 = NREGFFE;
    err2 = NREGFFVitE;
    err3 = NREMISE;
    err4 = NREMISVitE;
    x1 = FracUnfilteredWater;
    x2 = NREbactGFF;
    x3 = NREbactMIS;
    E1 = NREbactGFFE;
    E2 = NREbactGFFVitE;
    E3 = NREbactMISE;
    E4 = NREbactMISVitE;
    subplot(3,2,1)
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
    title('Neuse River Estuary GF/F')
    xlabel('Fraction Unfiltered Water')
    ylabel('Apparent Growth Rate (d^-^1)')
    %txt11 = ['y = µ_0 - g(Fraction Unfiltered Water)'];
    %txt12 = ['g = ' num2str(-g1,2) ' ± ' num2str(e1,2)];
    %txt13 = ['µ_0 = ' num2str(m1,2) ' ± ' num2str(l1,2)];
    %txt14 = ['R^2 = ' num2str(R1,2) ', R^2-adjusted = ' num2str(R1a,2)];
    %txt15 = ['t = ' num2str(t1,4) ' , p = ' num2str(p1,5)];
    %text(.65,0.75,txt11)
    %text(.65,0.65,txt12)
    %text(.65,0.55,txt13)
    %text(.65,0.45,txt14)
    %text(.65,0.35,txt15)
    hold off
    subplot(3,2,3)
    hold on
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
    scatter(x1,y2,'xb')
    errorbar(x1,y2,err2,'ob')
    
    xs=[0:0.0001:1];
    ys= a2-b2*xs*(1+c2)./(1+c2*xs);
    plot(xs,ys,'g');
    hold on
    plot(xs,m2+g2.*xs,'-r')
    set(gca,'ylim',[-.5 2.5]);
    title('Neuse River Estuary GF/F + F/200 Vitamins')
    xlabel('Fraction Unfiltered Water')
    ylabel('Apparent Growth Rate (d^-^1)')
    %txt21 = ['y = µ_0 - g(Fraction Unfiltered Water)'];
    %txt22 = ['g = ' num2str(-g2,2) ' ± ' num2str(e2,2)];
    %txt23 = ['µ_0 = ' num2str(m2,2) ' ± ' num2str(l2,2)];
    %txt24 = ['R^2 = ' num2str(R2,2) ', R^2-adjusted = ' num2str(R2a,2)];
    %txt25 = ['t = ' num2str(t2,4) ' , p = ' num2str(p2,5)];
    %text(.65,0.95,txt21)
    %text(.65,0.83,txt22)
    %text(.65,0.71,txt23)
    %text(.65,0.60,txt24)
    %text(.65,0.48,txt25)
    hold off
    subplot(3,2,2)
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
    scatter(x1,y3,'xb')
    errorbar(x1,y3,err3,'ob')
    
    xs=[0:0.0001:1];
    ys= a3-b3*xs*(1+c3)./(1+c3*xs);
    plot(xs,ys,'g');
    hold on
    plot(xs,m3+g3.*xs,'-r')
    set(gca,'ylim',[-.5 2.5]);
    %txt31 = ['y = µ_0 - g(Fraction Unfiltered Water)'];
    %txt32 = ['g = ' num2str(-g3,2) ' ± ' num2str(e3,2)];
    %txt33 = ['µ_0 = ' num2str(m3,2) ' ± ' num2str(l3,2)];
    %txt34 = ['R^2 = ' num2str(R3,2) ', R^2-adjusted = ' num2str(R3a,2)];
    %txt35 = ['t = ' num2str(t3,4) ' , p = ' num2str(p3,5)];
    %text(.65,0.36,txt31)
    %text(.65,0.29,txt32)
    %text(.65,0.22,txt33)
    %text(.65,0.15,txt34)
    %text(.65,0.08,txt35)
    hold off
    subplot(3,2,4)
    hold on
    mdl4 = fitlm(x1,y4);
    title('Neuse River Estuary MIS + F/200 Vitamins')
    xlabel('Fraction Unfiltered Water')
    ylabel('Apparent Growth Rate (d^-^1)')
    g4 = mdl4.Coefficients.Estimate(2,:);
    m4 = mdl4.Coefficients.Estimate(1,:);
    e4 = mdl4.Coefficients.SE(2,:);
    l4 = mdl4.Coefficients.SE(1,:);
    R4 = mdl4.Rsquared.Ordinary;
    R4a = mdl4.Rsquared.Adjusted;
    t4 = mdl4.Coefficients.tStat(2,:);
    p4 = mdl4.Coefficients.pValue(2,:);
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
    
    [fitcurve4, fitcurve_gof4] = fit( x1, y4, ft, opts )
    
    
    a4 = fitcurve4.a;
    b4 = fitcurve4.b;
    c4 = fitcurve4.c;
    scatter(x1,y4,'xb')
    errorbar(x1,y4,err4,'ob')
    
    xs=[0:0.0001:1];
    ys= a4-b4*xs*(1+c4)./(1+c4*xs);
    plot(xs,ys,'g');
    hold on
    plot(xs,m4+g4.*xs,'-r')
    set(gca,'ylim',[-.5 2.5]);
    %txt41 = ['y = µ_0 - g(Fraction Unfiltered Water)'];
    %txt42 = ['g = ' num2str(-g4,2) ' ± ' num2str(e4,2)];
    %txt43 = ['µ_0 = ' num2str(m4,2) ' ± ' num2str(l4,2)];
    %txt44 = ['R^2 = ' num2str(R4,2) ', R^2-adjusted = ' num2str(R4a,2)];
    %txt45 = ['t = ' num2str(t4,4) ' , p = ' num2str(p4,5)];
    %text(.65,0.36,txt41)
    %text(.65,0.29,txt42)
    %text(.65,0.22,txt43)
    %text(.65,0.15,txt44)
    %text(.65,0.08,txt45)
    subplot(3,2,5)
    hold on
    errorbar(x2,y5,E2,E2,E1,E1,'ob')
    errorbar(x3,y6,E4,E4,E3,E3,'ok')
    xs=[-1:0.0001:1];
    ys=[-1:0.0001:1];
    hold on
    plot(xs,ys,'-r')
    title('Parity Plot of Neuse River Estuary Bacterial Production')
    xlabel('Bacterial Growth Rate (d^-^1) Without Vitamin Additions')
    ylabel('Bacterial Growth Rate (d^-^1) With F/200 Vitamin Additions')
    hold off
    
elseif z==4
    %Chowan River
    y1 = CRGFF;
    y2 = CRGFFVit;
    y3 = CRMIS;
    y4 = CRMISVit;
    y5 = CRbactGFFVit;
    y6 = CRbactMISVit;
    err1 = CRGFFE;
    err2 = CRGFFVitE;
    err3 = CRMISE;
    err4 = CRMISVitE;
    x1 = FracUnfilteredWater;
    x2 = CRbactGFF;
    x3 = CRbactMIS;
    E1 = CRbactGFFE;
    E2 = CRbactGFFVitE;
    E3 = CRbactMISE;
    E4 = CRbactMISVitE;
    subplot(3,2,1)
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
    title('Chowan River GF/F')
    xlabel('Fraction Unfiltered Water')
    ylabel('Apparent Growth Rate (d^-^1)')
    %txt11 = ['y = µ_0 - g(Fraction Unfiltered Water)'];
    %txt12 = ['g = ' num2str(-g1,2) ' ± ' num2str(e1,2)];
    %txt13 = ['µ_0 = ' num2str(m1,2) ' ± ' num2str(l1,2)];
    %txt14 = ['R^2 = ' num2str(R1,2) ', R^2-adjusted = ' num2str(R1a,2)];
    %txt15 = ['t = ' num2str(t1,4) ' , p = ' num2str(p1,5)];
    %text(.65,0.75,txt11)
    %text(.65,0.65,txt12)
    %text(.65,0.55,txt13)
    %text(.65,0.45,txt14)
    %text(.65,0.35,txt15)
    hold off
    subplot(3,2,3)
    hold on
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
    scatter(x1,y2,'xb')
    errorbar(x1,y2,err2,'ob')
    
    xs=[0:0.0001:1];
    ys= a2-b2*xs*(1+c2)./(1+c2*xs);
    plot(xs,ys,'g');
    hold on
    plot(xs,m2+g2.*xs,'-r')
    set(gca,'ylim',[-.5 2.5]);
    title('Chowan River GF/F + F/200 Vitamins')
    xlabel('Fraction Unfiltered Water')
    ylabel('Apparent Growth Rate (d^-^1)')
    %txt21 = ['y = µ_0 - g(Fraction Unfiltered Water)'];
    %txt22 = ['g = ' num2str(-g2,2) ' ± ' num2str(e2,2)];
    %txt23 = ['µ_0 = ' num2str(m2,2) ' ± ' num2str(l2,2)];
    %txt24 = ['R^2 = ' num2str(R2,2) ', R^2-adjusted = ' num2str(R2a,2)];
    %txt25 = ['t = ' num2str(t2,4) ' , p = ' num2str(p2,5)];
    %text(.65,0.95,txt21)
    %text(.65,0.83,txt22)
    %text(.65,0.71,txt23)
    %text(.65,0.60,txt24)
    %text(.65,0.48,txt25)
    hold off
    subplot(3,2,2)
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
    scatter(x1,y3,'xb')
    errorbar(x1,y3,err3,'ob')
    
    xs=[0:0.0001:1];
    ys= a3-b3*xs*(1+c3)./(1+c3*xs);
    plot(xs,ys,'g');
    hold on
    plot(xs,m3+g3.*xs,'-r')
    set(gca,'ylim',[-.5 2.5]);
    %txt31 = ['y = µ_0 - g(Fraction Unfiltered Water)'];
    %txt32 = ['g = ' num2str(-g3,2) ' ± ' num2str(e3,2)];
    %txt33 = ['µ_0 = ' num2str(m3,2) ' ± ' num2str(l3,2)];
    %txt34 = ['R^2 = ' num2str(R3,2) ', R^2-adjusted = ' num2str(R3a,2)];
    %txt35 = ['t = ' num2str(t3,4) ' , p = ' num2str(p3,5)];
    %text(.65,0.36,txt31)
    %text(.65,0.29,txt32)
    %text(.65,0.22,txt33)
    %text(.65,0.15,txt34)
    %text(.65,0.08,txt35)
    hold off
    subplot(3,2,4)
    hold on
    mdl4 = fitlm(x1,y4);
    title('Chowan River MIS + F/200 Vitamins')
    xlabel('Fraction Unfiltered Water')
    ylabel('Apparent Growth Rate (d^-^1)')
    g4 = mdl4.Coefficients.Estimate(2,:);
    m4 = mdl4.Coefficients.Estimate(1,:);
    e4 = mdl4.Coefficients.SE(2,:);
    l4 = mdl4.Coefficients.SE(1,:);
    R4 = mdl4.Rsquared.Ordinary;
    R4a = mdl4.Rsquared.Adjusted;
    t4 = mdl4.Coefficients.tStat(2,:);
    p4 = mdl4.Coefficients.pValue(2,:);
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
    
    [fitcurve4, fitcurve_gof4] = fit( x1, y4, ft, opts )
    
    
    a4 = fitcurve4.a;
    b4 = fitcurve4.b;
    c4 = fitcurve4.c;
    scatter(x1,y4,'xb')
    errorbar(x1,y4,err4,'ob')
    
    xs=[0:0.0001:1];
    ys= a4-b4*xs*(1+c4)./(1+c4*xs);
    plot(xs,ys,'g');
    hold on
    plot(xs,m4+g4.*xs,'-r')
    set(gca,'ylim',[-.5 2.5]);
    %txt41 = ['y = µ_0 - g(Fraction Unfiltered Water)'];
    %txt42 = ['g = ' num2str(-g4,2) ' ± ' num2str(e4,2)];
    %txt43 = ['µ_0 = ' num2str(m4,2) ' ± ' num2str(l4,2)];
    %txt44 = ['R^2 = ' num2str(R4,2) ', R^2-adjusted = ' num2str(R4a,2)];
    %txt45 = ['t = ' num2str(t4,4) ' , p = ' num2str(p4,5)];
    %text(.65,0.36,txt41)
    %text(.65,0.29,txt42)
    %text(.65,0.22,txt43)
    %text(.65,0.15,txt44)
    %text(.65,0.08,txt45)
    subplot(3,2,5)
    hold on
    errorbar(x2,y5,E2,E2,E1,E1,'ob')
    errorbar(x3,y6,E4,E4,E3,E3,'ok')
    xs=[-1:0.0001:1];
    ys=[-1:0.0001:1];
    hold on
    plot(xs,ys,'-r')
    title('Parity Plot of Chowan River Bacterial Production')
    xlabel('Bacterial Growth Rate (d^-^1) Without Vitamin Additions')
    ylabel('Bacterial Growth Rate (d^-^1) With F/200 Vitamin Additions')
    hold off
    
elseif z==5
    %Jordan Lake
    y1 = JLGFF;
    y2 = JLGFFVit;
    y3 = JLMIS;
    y4 = JLMISVit;
    y5 = JLbactGFFVit;
    y6 = JLbactMISVit;
    err1 = JLGFFE;
    err2 = JLGFFVitE;
    err3 = JLMISE;
    err4 = JLMISVitE;
    x1 = FracUnfilteredWater;
    x2 = JLbactGFF;
    x3 = JLbactMIS;
    E1 = JLbactGFFE;
    E2 = JLbactGFFVitE;
    E3 = JLbactMISE;
    E4 = JLbactMISVitE;
    subplot(3,2,1)
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
    title('Jordan Lake GF/F')
    xlabel('Fraction Unfiltered Water')
    ylabel('Apparent Growth Rate (d^-^1)')
    %txt11 = ['y = µ_0 - g(Fraction Unfiltered Water)'];
    %txt12 = ['g = ' num2str(-g1,2) ' ± ' num2str(e1,2)];
    %txt13 = ['µ_0 = ' num2str(m1,2) ' ± ' num2str(l1,2)];
    %txt14 = ['R^2 = ' num2str(R1,2) ', R^2-adjusted = ' num2str(R1a,2)];
    %txt15 = ['t = ' num2str(t1,4) ' , p = ' num2str(p1,5)];
    %text(.65,0.75,txt11)
    %text(.65,0.65,txt12)
    %text(.65,0.55,txt13)
    %text(.65,0.45,txt14)
    %text(.65,0.35,txt15)
    hold off
    subplot(3,2,3)
    hold on
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
    scatter(x1,y2,'xb')
    errorbar(x1,y2,err2,'ob')
    
    xs=[0:0.0001:1];
    ys= a2-b2*xs*(1+c2)./(1+c2*xs);
    plot(xs,ys,'g');
    hold on
    plot(xs,m2+g2.*xs,'-r')
    set(gca,'ylim',[-.5 2.5]);
    title('Jordan Lake GF/F + F/200 Vitamins')
    xlabel('Fraction Unfiltered Water')
    ylabel('Apparent Growth Rate (d^-^1)')
    %txt21 = ['y = µ_0 - g(Fraction Unfiltered Water)'];
    %txt22 = ['g = ' num2str(-g2,2) ' ± ' num2str(e2,2)];
    %txt23 = ['µ_0 = ' num2str(m2,2) ' ± ' num2str(l2,2)];
    %txt24 = ['R^2 = ' num2str(R2,2) ', R^2-adjusted = ' num2str(R2a,2)];
    %txt25 = ['t = ' num2str(t2,4) ' , p = ' num2str(p2,5)];
    %text(.65,0.95,txt21)
    %text(.65,0.83,txt22)
    %text(.65,0.71,txt23)
    %text(.65,0.60,txt24)
    %text(.65,0.48,txt25)
    hold off
    subplot(3,2,2)
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
    scatter(x1,y3,'xb')
    errorbar(x1,y3,err3,'ob')
    
    xs=[0:0.0001:1];
    ys= a3-b3*xs*(1+c3)./(1+c3*xs);
    plot(xs,ys,'g');
    hold on
    plot(xs,m3+g3.*xs,'-r')
    set(gca,'ylim',[-.5 2.5]);
    %txt31 = ['y = µ_0 - g(Fraction Unfiltered Water)'];
    %txt32 = ['g = ' num2str(-g3,2) ' ± ' num2str(e3,2)];
    %txt33 = ['µ_0 = ' num2str(m3,2) ' ± ' num2str(l3,2)];
    %txt34 = ['R^2 = ' num2str(R3,2) ', R^2-adjusted = ' num2str(R3a,2)];
    %txt35 = ['t = ' num2str(t3,4) ' , p = ' num2str(p3,5)];
    %text(.65,0.36,txt31)
    %text(.65,0.29,txt32)
    %text(.65,0.22,txt33)
    %text(.65,0.15,txt34)
    %text(.65,0.08,txt35)
    hold off
    subplot(3,2,4)
    hold on
    mdl4 = fitlm(x1,y4);
    title('Jordan Lake MIS + F/200 Vitamins')
    xlabel('Fraction Unfiltered Water')
    ylabel('Apparent Growth Rate (d^-^1)')
    g4 = mdl4.Coefficients.Estimate(2,:);
    m4 = mdl4.Coefficients.Estimate(1,:);
    e4 = mdl4.Coefficients.SE(2,:);
    l4 = mdl4.Coefficients.SE(1,:);
    R4 = mdl4.Rsquared.Ordinary;
    R4a = mdl4.Rsquared.Adjusted;
    t4 = mdl4.Coefficients.tStat(2,:);
    p4 = mdl4.Coefficients.pValue(2,:);
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
    
    [fitcurve4, fitcurve_gof4] = fit( x1, y4, ft, opts )
    
    
    a4 = fitcurve4.a;
    b4 = fitcurve4.b;
    c4 = fitcurve4.c;
    scatter(x1,y4,'xb')
    errorbar(x1,y4,err4,'ob')
    
    xs=[0:0.0001:1];
    ys= a4-b4*xs*(1+c4)./(1+c4*xs);
    plot(xs,ys,'g');
    hold on
    plot(xs,m4+g4.*xs,'-r')
    set(gca,'ylim',[-.5 2.5]);
    %txt41 = ['y = µ_0 - g(Fraction Unfiltered Water)'];
    %txt42 = ['g = ' num2str(-g4,2) ' ± ' num2str(e4,2)];
    %txt43 = ['µ_0 = ' num2str(m4,2) ' ± ' num2str(l4,2)];
    %txt44 = ['R^2 = ' num2str(R4,2) ', R^2-adjusted = ' num2str(R4a,2)];
    %txt45 = ['t = ' num2str(t4,4) ' , p = ' num2str(p4,5)];
    %text(.65,0.36,txt41)
    %text(.65,0.29,txt42)
    %text(.65,0.22,txt43)
    %text(.65,0.15,txt44)
    %text(.65,0.08,txt45)
    subplot(3,2,5)
    hold on
    errorbar(x2,y5,E2,E2,E1,E1,'ob')
    errorbar(x3,y6,E4,E4,E3,E3,'ok')
    xs=[-2:0.0001:1];
    ys=[-2:0.0001:1];
    hold on
    plot(xs,ys,'-r')
    title('Parity Plot of Jordan Lake Bacterial Production')
    xlabel('Bacterial Growth Rate (d^-^1) Without Vitamin Additions')
    ylabel('Bacterial Growth Rate (d^-^1) With F/200 Vitamin Additions')
    hold off

end



