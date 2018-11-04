%this script shows how everything works together
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Sunil Bhandari 
%3/17/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
fv = stlread('_3DBenchy.stl');
% The model is rendered with a PATCH graphics object. We also add some dynamic
% lighting, and adjust the material properties to change the specular
% highlighting.
figure(1);
subplot(1,3,1);cla;
patch(fv,'FaceColor',       [0.8 0 0], ...
         'EdgeColor',       'none',        ...
         'FaceLighting',    'gouraud',     ...
         'AmbientStrength', 0.15);
% Add a camera light, and tone down the specular highlighting
camlight('headlight');
material('dull');
% Fix the axes scaling, and set a nice view angle
% axis('image');
view([15 23]);

axis equal;

%% new method read
% clc; clear vars; close all;
triangles = read_binary_stl_file('_3DBenchy.stl');
% triangles = read_ascii_stl('D638_TypeI_ascii.stl',1);
original = triangles;
%triangles = orient_stl(triangles,'z');
% triangles = rotate_stl(triangles,'x',90);
slice_height = .4;
tic;
[movelist, z_slices] = slice_stl_create_path(triangles, slice_height);
toc;

%'plotting'
%for i = 1: size(
clc;
while(1)
    figure(1);
    subplot(1,3,1);axis([-Inf Inf -Inf Inf z_slices(1) z_slices(end)])
    subplot(1,3,2);cla;
    subplot(1,3,3);cla;
    tic
        plot_slices(movelist,z_slices, 0.000);
    toc
    
    for i = 1:180
        subplot(1,3,2);
        view([15+i*2,23]);
        subplot(1,3,1);
        view([15+i*2,23]);
        drawnow
        pause(0.2);
    end
    pause(5)
end
% mov = make_movie(movelist, z_slices);
