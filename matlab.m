% Генерация случайных данных для примера
rng('default'); % Установка начального значения для генератора случайных чисел
data = [randn(100,2)+1.5; randn(100,2)-1.5];

% Выбор количества кластеров
k = 2;

% Инициализация случайных центроидов
centroids = datasample(data, k, 'Replace', false);

% Максимальное количество итераций и критерий сходимости
maxIterations = 100;
tolerance = 1e-4;

% Итеративный алгоритм кластеризации
for iter = 1:maxIterations
    % Нахождение ближайшего центроида для каждой точки
    distances = pdist2(data, centroids);
    [~, clusterIndices] = min(distances, [], 2);
    
    % Обновление центроидов
    newCentroids = zeros(k, size(data, 2));
    for i = 1:k
        newCentroids(i, :) = mean(data(clusterIndices == i, :));
    end
    
    % Проверка на сходимость
    if max(abs(newCentroids(:) - centroids(:))) < tolerance
        break;
    end
    
    centroids = newCentroids;
end

% Визуализация результатов
figure;
gscatter(data(:,1), data(:,2), clusterIndices);
hold on;
plot(centroids(:,1), centroids(:,2), 'kx', 'MarkerSize', 10, 'LineWidth', 2);
title('Результаты кластеризации методом c-средних (C-Means)');
legend('Кластер 1', 'Кластер 2', 'Центроиды', 'Location', 'Best');
hold off;
