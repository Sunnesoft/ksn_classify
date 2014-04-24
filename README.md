ksn_classify
============

Классификация объектов на изображении вне зависимости от времени суток, года и погоды.

ТЗ:

Задание 1: 
Построить плотности распределения условных вероятностей для площадных ориентиров (лес, поле, дорога) при различных условиях наблюдения. Изменение условий наблюдения моделируются изменением яркости изображения.
В качестве признаков использовать МО и дисперсию яркости и цвета. 
При построении плотностей распределения по дисперсиям провести эксперименты с размерами окна 8x8 и 16x16 пикселей.
Строить плотности распределения для каждого изображения необходимо методами «парзеновского» окна и kn ближайших соседей. Каждую полученную плотность распределения сохранить в отдельный файл *.mat.

Задание 2: 
Исследовать плотности распределения вероятностей, построенных для различных условий наблюдения, ориентиров и признаков.
Необходимо провести распознавание ориентиров по предложенным плотностям. Оценить ошибку результата распознавания. 
Вместе с исходным изображением будет приложено сегментированное изображение. В зависимости от яркости каждый участок изображения будет считаться лесом, дорогой, полем. Это изображение принимается за эталон при оценке ошибки результатов распознавания.
После проведения экспериментов со всеми предложенными плотностями распределения и изображениями составить правила по выбору плотности распределения в зависимости от условий наблюдения. 
Правила должны включать в себя следующие описания условий наблюдения: широту или регион (приблизительно), время года (лето, осень, зима, весна), время суток (день, вечер и т.д.), погодные условия (например, облачность). 

