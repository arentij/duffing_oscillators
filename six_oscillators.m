% allowing other functions to know the frequency
global w k3 bodies

% say we have six bodies
bodies = 6;     
tic
statistics = 10;
% define all the frequencies array for the swipe
w_array = linspace(0.9,3,10);
% amount of steps for the simulation
k3_array = 5; %[0.5, 1, 2, 3];
steps = 40000;

% for saving max energy of the run after 
energies_matrix = zeros(length(k3_array),length(w_array),statistics);

for stat_index = 1:statistics
    
    for k3_index = 1:length(k3_array)
        k3 = k3_array(k3_index);

        % swipe across w_array and save E_max
        for w_index = 1:length(w_array)
            % define the frequency for the run
            w = w_array(w_index);

            % set initial locations to zero but giving some momentum
    %         y0 = [0; randn(); 0; randn(); 0; randn(); 0; randn(); 0; randn(); 0; 0];
            % still total zero momentum
    %         y0(12) = -sum(y0);

            % or just start from random positions
            y0 = randn(1,2*bodies);

            % defining timeset
            time = linspace(0,300,steps);
            % solving the ODE
            [t,y] = ode45(@six_osc_eq, time, y0);

            % calculating energy during the run
            energy_array = zeros(length(t),1);
            for timestep = 1:length(t)
                energy_array(timestep) = energy_six(y(timestep,:));
            end

            % saving the highest energy in the last half of the run
            energies_matrix(k3_index,w_index,stat_index) = max(energy_array(fix(end/2):end));
    %         if w == 1
    %             figure(2)
    %             plot(abs(y(:,[1:2:12])))
    %         end
        end
    end

end
% figure(1)
% imagesc(abs(y(:,[1:2:12])'))
% caxis([0 9])
% figure(2)
% plot(abs(y(:,[1:2:12])))
% figure(2)
% imagesc(energies_matrix')

%% plotting E_max = f(w)
figure(3)
cmap = zeros(length(k3_array),3);
cmap(:,1) = linspace(0,1,length(k3_array));
cmap(:,2) = mod(linspace(1,0,length(k3_array)),1);
cmap(:,3) = mod(linspace(0,2,length(k3_array)),1);
% for k3_index = 1:length(k3_array)
%     
% end

% scatter_size = ones(size(energies_matrix,1),size(energies_matrix,2));
% for k3_index = 1:length(k3_array)
%     for w_index = 1:length(w_array)
%         scatter_size = 
%     end
% end


hold on
for stat_index = 1:statistics
    for k3_index = 1:length(k3_array)

        scatter(w_array,energies_matrix(k3_index,:,stat_index),...
            [200],...
            'MarkerFaceColor',cmap(k3_index,:),...
            'MarkerEdgeColor',cmap(k3_index,:),...
            'MarkerFaceAlpha',.2,...
            'MarkerEdgeAlpha',.5)
        xlabel('Driver frequency, $\Omega$','Interpreter','latex')
        ylabel('Maximum energy, E','Interpreter','latex')
        set(gca,'fontsize', 18)
        ylim([0 1.2*max(energies_matrix(:))])
    end
end
hold off
legend(num2str(k3_array'))

t2 = toc;
%% play some music
load gong
sound(y/5,Fs)