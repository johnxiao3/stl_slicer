function []= plot_slices(movelist_all, z_slices,delay)
%this function plots the movement path for countour creation computed by
%slice_stl_create_path
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Sunil Bhandari 
%3/17/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(1,3,2);
hold on;
view(15,23);
axis([-Inf Inf -Inf Inf z_slices(1) z_slices(end)])
subplot(1,3,3);
hold on;
view(15,23);
axis([-Inf Inf -Inf Inf z_slices(1) z_slices(end)])
for i = 1: size(movelist_all,2)
    mlst_all = movelist_all{i};
    if delay >0
    if ~isempty(mlst_all)
        Se = 4;
        for j = 1:Se:size(mlst_all,1)-Se
            try
                delete(h_cur(i,j));
            catch
            end
            h_cur(i,j) = plot3(mlst_all(1:j+Se,1),...
                mlst_all(1:j+Se,2),...
                ones(j+Se,1)*z_slices(i),'b');
            
            try
                delete(h);
            catch
            end
%             [h,h1,h2]=Cone([mlst_all(j+2,1),mlst_all(j+2,2),z_slices(i)],...
%                [mlst_all(j+2,1),mlst_all(j+2,2),z_slices(i)+10],...
%                [0 1.5],10,'r',0,0);
            h=plot3([mlst_all(j+Se,1);mlst_all(j+Se,1)],...
                [mlst_all(j+Se,2);mlst_all(j+Se,2)],...
                [z_slices(i);z_slices(i)+10]...
                ,'r','linewidth',5);
            pause(delay)
        end
    end  
    else
        if ~isempty(mlst_all)
            subplot(1,3,2);hold on;
            plot3(mlst_all(:,1),mlst_all(:,2),ones(size(mlst_all,1),1)*z_slices(i),'b')
            subplot(1,3,3);cla
            hold on;
            plot3(mlst_all(:,1),mlst_all(:,2),ones(size(mlst_all,1),1)*z_slices(i),'b')  
            
            view(15,23);
            axis([-30 30 -20 20 z_slices(1) z_slices(end)+10])
            drawnow;
            pause(0.01);
        end
    end
        
end   
end