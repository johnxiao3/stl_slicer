function [] = plot_stl(fig,v)
%%% plots the triangles in stl file. The vertices in v need to be
%%% continuous.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%Author: Sunil Bhandari%%%%%%%%
%%%%Date: Mar 29, 2017 %%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vr = reshape(v',9,size(v,1)/3)';
vr = [vr(:,:),vr(:,1:3),ones(size(vr,1),1)*[NaN, NaN, NaN]];
vr = reshape(vr',3,size(vr,1)*5)';
%h = figure(1);
%set(fig, 'renderer','opengl')
%view(3)
%plot3(vr(:,1),vr(:,2),vr(:,3))
plot3(fig,vr(:,1)',vr(:,2)',vr(:,3)')
mx = max(max(v));
mn = min(min(v));
axis(fig,[mn mx mn mx mn mx]);
end
