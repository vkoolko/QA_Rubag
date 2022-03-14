﻿#language: ru

@tree

Функционал: Создание базовой анкеты

Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий
	И я закрываю все окна клиентского приложения

Сценарий: Создание базовой анкеты

	Дано Я открываю навигационную ссылку "e1cib/list/Документ.Числа_НоваяАнкета"
	Тогда открылось окно "Анкета"
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылась форма с именем "Документ.Числа_НоваяАнкета.Форма.УправляемаяФормаДокумента"
	

	*Проверка заполнения значений по умолчанию
	И Проверка значений по умолчанию реквизитов шапки
	И Проверка значений по умолчанию: закладка Стропы
	И Проверка значений по умолчанию: закладка тело БЭГА
	И Проверка значений по умолчанию: закладка Ткань
	И Проверка значений по умолчанию: закладка Низ
	И Проверка значений по умолчанию: закладка Карман для документов
	И Проверка значений по умолчанию: закладка Упаковка

	*Проверка, что ничего недоступно пока не выбрали площадку
	И элемент с именем "ПошивКомплектовка" доступен только для просмотра
	И элемент с именем "ВидПошива" доступен только для просмотра
	И элемент с именем "ТипТкани" доступен только для просмотра
		
	И из выпадающего списка с именем "Площадка" я выбираю точное значение 'Воронеж'
	И я нажимаю кнопку выбора у поля с именем "Контрагент"
	Тогда открылось окно 'Выбор типа данных'
	И в таблице "" я перехожу к строке:
		| ''           |
		| 'Контрагент' |
	И я нажимаю на кнопку "Ок"
	И я закрываю текущее окно
	
	И из выпадающего списка с именем "Контрагент" я выбираю по строке 'Собчак Ксения Анатольевна'
	И я перехожу к следующему реквизиту

	И из выпадающего списка с именем "ШиринаСтропы" я выбираю точное значение '4,5'
	Тогда элемент формы с именем "ГрузоподъемностьЛенточныеСтропы" стал равен '1200'
	
	*Группа "Верх"
	И я перехожу к закладке с именем "ГруппаВерх"
	И из выпадающего списка с именем "ТипВерха" я выбираю точное значение 'ЮБКА'
	Тогда элемент формы с именем "ПлотностьПанели" стал равен '70'
	Тогда элемент формы с именем "ВерхДлинаЗавязкиЮбки" стал равен '0,900'
	Тогда элемент формы с именем "ВысотаВерхКлапан" стал равен '80'

	*Группа "Тело"			
	И я перехожу к закладке с именем "ГруппаТело"
	И в поле с именем 'Высота' я ввожу текст '130'
	И я перехожу к следующему реквизиту

	*Группа "Низ"
	И я перехожу к закладке с именем "ГруппаНиз"
	И из выпадающего списка с именем "ТипНиза" я выбираю точное значение 'КЛАПАН'
	Тогда элемент формы с именем "КоличествоСлоевПанелиНиз" стал равен '1'
	Тогда элемент формы с именем "ПлотностьПанелиНиз1" стал равен '140'
	Тогда элемент формы с именем "ПлотностьКлапанаНиз" стал равен '75'
	Тогда элемент формы с именем "ШиринаНиз" стал равен '35'
	Тогда элемент формы с именем "ВысотаНиз" стал равен '50'
	Тогда элемент формы с именем "ЗащитноеУстройствоНиз" стал равен 'ЗУ Голено'
	Тогда элемент формы с именем "НизДлинаЗавязкиЗУКлапана" стал равен '1,400'
	Тогда элемент формы с именем "НизДлинаЗавязкиКлапана" стал равен '0,900'

	И я перехожу к закладке с именем "ГруппаКарманДляДокументов"
	И я перехожу к закладке с именем "ГруппаЛоготип"
	И я перехожу к закладке с именем "ГруппаУплотнительныйШнур"

	*Группа "Работы"
	И я перехожу к закладке с именем "ГруппаТехОперации"
	И в таблице "СписокТехОпераций" я нажимаю на кнопку с именем 'СписокТехОперацийЗаполнитьТехОперации'
	*Проверка таблицы видов работ по шаблону (цена и сумма проверяются ниже, т.к. расценка может меняться)
	Тогда таблица "СписокТехОпераций" стала равной по шаблону:
		| 'N' | 'Количество' | 'Код'       | 'Это характеристика' | 'Технологическая операция'                                        | 'Сумма' | 'Расценка' | 'Часть БЭГА'            |
		| '1' | '1,00000'    | '000000093' | 'Нет'                | 'Формирование п/ф панели от 120гр +  клап ЗУГ с пришивом завязки' | '*'     | '*'        | 'Низ'                   |
		| '2' | '1,00000'    | '000000021' | 'Нет'                | 'Пришив юбки к заготовке рукава (h бб 1-180)'                     | '*'     | '*'        | 'Верх'                  |
		| '3' | '1,00000'    | '000000170' | 'Нет'                | 'Пришив пакета для документов'                                    | '*'  	| '*'        | 'Карман для документов' |
		| '4' | '1,00000'    | '000000109' | 'Нет'                | 'Формирование юбки с пришивом завязки'                            | '*'  	| '*'        | 'Верх'                  |
		| '5' | '1,00000'    | '000000007' | 'Нет'                | 'Оверлок бб 95*95*(1-180)(стропы, карман, дно) рукав'             | '*'  	| '*'        | 'Тело'                  |
		*Проверка арифметики в таблице видов работ
		И для каждой строки таблицы "СписокТехОпераций" я выполняю
			И я запоминаю значение поля с именем "СписокТехОперацийКоличество" таблицы "СписокТехОпераций" как "_Количество"
			И я запоминаю значение поля с именем "СписокТехОперацийРасценка" таблицы "СписокТехОпераций" как "_Расценка"
			И Я запоминаю значение выражения 'Format($_Количество$*$_Расценка$, "ЧДЦ=2")' в переменную "_Сумма"
			И в таблице "СписокТехОпераций" поле с именем "СписокТехОперацийСумма" имеет значение "$_Сумма$"

	*Группа "Материалы"
	И я перехожу к закладке с именем "Материалы"
	И в таблице "СписокТехМатериалов" я нажимаю на кнопку с именем 'СписокТехМатериаловЗаполнитьТехМатериалы'
	*Проверка таблицы материалов по шаблону (цена и сумма проверяются ниже, т.к. расценка может меняться)
	Тогда таблица "СписокТехМатериалов" стала равной по шаблону:
		| 'N'  | 'Артикул ' | 'Количество'    | 'Цвета красок' | 'Номенклатура'                     | 'Часть БЭГА'            | 'Ед. изм.' | 'Расценка' | 'Сумма'  | 'Это характеристика' | 'Количество подобрано' | 'Единица измерения' |
		| '1'  | '07933'    | '7,5110000000'  | ''             | 'Стропа 4,5см 1200кгс белая'       | 'Стропы'                | 'м'        | '*'     	| '*'  	   | 'Нет'                | ''                     | ''                  |
		| '2'  | '5093'     | '1,0000000000'  | ''             | 'Пакет ПСД 25х31 25мкм "Рубэг"'    | 'Карман для документов' | 'шт'       | '*'     	| '*'      | 'Нет'                | ''                     | ''                  |
		| '3'  | '08209'    | '0,9000000000'  | ''             | 'Лента 1см'                        | 'Верх'                  | 'м'        | '*'     	| '*'      | 'Нет'                | ''                     | ''                  |
		| '4'  | '7390'     | '0,2700000000'  | ''             | 'Лента ПП 15*1*1200м'              | 'Упаковка'              | 'м'        | '*'     	| '*'      | 'Нет'                | ''                     | ''                  |
		| '5'  | '7889'     | '18,5133000000' | ''             | 'Нить 2-е руки ППМ 2500den белая'  | 'Низ'                   | 'г'        | '*'     	| '*'      | 'Нет'                | ''                     | ''                  |
		| '6'  | '7889'     | '26,5832000000' | ''             | 'Нить 2-е руки ППМ 2500den белая'  | 'Тело'                  | 'г'        | '*'     	| '*'      | 'Нет'                | ''                     | ''                  |
		| '7'  | '04080'    | '1,4140000000'  | ''             | 'Рукав 190см 140г/м2'              | 'Тело'                  | 'м'        | '*'    	| '*'      | 'Нет'                | ''                     | ''                  |
		| '8'  | '08209'    | '2,3000000000'  | ''             | 'Лента 1см'                        | 'Низ'                   | 'м'        | '*'     	| '*'      | 'Нет'                | ''                     | ''                  |
		| '9'  | '02245'    | '4,0400000000'  | ''             | 'Полотно 78см 70г/м2'              | 'Верх'                  | 'м'        | '*'     	| '*'      | 'Нет'                | ''                     | ''                  |
		| '10' | '02545'    | '6,8120460000'  | ''             | 'Нить 1-е руки ППМ 2000den  белая' | 'Низ'                   | 'г'        | '*'     	| '*'      | 'Нет'                | ''                     | ''                  |
		| '11' | '02545'    | '13,3623000000' | ''             | 'Нить 1-е руки ППМ 2000den  белая' | 'Верх'                  | 'г'        | '*'     	| '*'      | 'Нет'                | ''                     | ''                  |
		| '12' | '06743'    | '0,8080000000'  | ''             | 'Рукав 60см 70г/м2'                | 'Низ'                   | 'м'        | '*'    	| '*'      | 'Нет'                | ''                     | ''                  |
		| '13' | '04078'    | '1,0605000000'  | ''             | 'Полотно 105см 140г/м2'            | 'Низ'                   | 'м'        | '*'    	| '*'      | 'Нет'                | ''                     | ''                  |
		| '14' | '03100'    | '1,0000000000'  | ''             | 'Этикетка с номером'               | 'Верх'                  | 'шт'       | '*'     	| '*'      | 'Нет'                | ''                     | ''                  |
		| '15' | '03100'    | '1,0000000000'  | ''             | 'Этикетка с номером'               | 'Низ'                   | 'шт'       | '*'     	| '*'      | 'Нет'                | ''                     | ''                  |
		| '16' | '04058'    | '0,1000000000'  | ''             | 'Скоба 15 мм'                      | 'Упаковка'              | 'шт'       | '*'     	| '*'      | 'Нет'                | ''                     | ''                  |
		*Проверка арифметики в таблице материалов
		И для каждой строки таблицы "СписокТехМатериалов" я выполняю
			И я запоминаю значение поля с именем "СписокТехМатериаловКоличество" таблицы "СписокТехМатериалов" как "_Количество"
			И я запоминаю значение поля с именем "СписокТехМатериаловРасценка" таблицы "СписокТехМатериалов" как "_Расценка"
			И Я запоминаю значение выражения 'Format($_Количество$*$_Расценка$, "ЧДЦ=2")' в переменную "_Сумма"
			И в таблице "СписокТехМатериалов" поле с именем "СписокТехМатериаловСумма" имеет значение "$_Сумма$"
		
	И я перехожу к закладке с именем "ГруппаУпаковка"
	И я перехожу к закладке с именем "ГруппаКомментарий"
	И я перехожу к закладке с именем "ГруппаВидыРаботv11"
	И я перехожу к закладке с именем "ГруппаТехМатериалыNew"

	И я нажимаю на кнопку с именем 'ОбновитьЦену'
	Если в сообщениях пользователю есть строка "Для следующих материалов цена устанавливалась более 35 дней назад!" Тогда
		Тогда поле с именем "ДекорацияЦенаНоменклатуры" имеет заголовок "Цена: <...>"
		Тогда поле с именем "ДекорацияСтоимостьАктаОскол" имеет заголовок "Стоимость акта: <...>"
	
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	И я перехожу к закладке с именем "СтраницаПроизводство"
	И в таблице "ДеревоПроизводство" я нажимаю на кнопку с именем 'ДеревоТехМатериаловАнализПотребностей'
	Тогда открылось окно 'Потребность материалов с аналогами, ПФ '
	# проверка работы формы анализа потребностей (Какая тут должна быть проверка?) + кнопки анализ потребностей (зеленая, если хватает, красная, если дефицит)
	И Я закрываю окно 'Потребность материалов с аналогами, ПФ '

	*Добавление полуфабриката
	И в таблице "ДеревоПроизводство" я нажимаю на кнопку с именем 'ДеревоПроизводствоДобавитьВыпускПроизводство'
	И в таблице "ДеревоТехМатериаловПроизводство" я перехожу к строке:
		| 'Ед. изм.' | 'Код'   | 'Количество'   | 'Материал'              |
		| 'м'        | '04078' | '1,0605000000' | 'Полотно 105см 140г/м2' |
	И в таблице "ДеревоПроизводство" я перехожу к строке:
		| 'Проверен' | 'Этап'               |
		| 'Нет'      | 'Полуфабрикат <...>' |
	И в таблице "ДеревоПроизводство" я перехожу к строке:
		| 'Проверен' | 'Этап'      |
		| 'Нет'      | 'Материалы' |
	И в таблице "ДеревоТехМатериаловПроизводство" я нажимаю на кнопку с именем 'ДеревоТехМатериаловПроизводствоМатериалыПеренестиВДеревоПроизводство'
	И в таблице "ДеревоПроизводство" я перехожу к строке:
		| 'Проверен' | 'Часть БЭГА' | 'Этап'               |
		| 'Нет'      | 'Низ'        | 'Полуфабрикат <...>' |
	И я выбираю пункт контекстного меню с именем 'ДеревоПроизводствоКонтекстноеМенюДобавитьРезанныйПолуфабрикат' на элементе формы с именем "ДеревоПроизводство"
	Тогда открылось окно 'Создание отрезного полуфабриката'
	И из выпадающего списка с именем "Полуфабрикат" я выбираю точное значение '05305 - 105*105d30/140'
	И я нажимаю на кнопку с именем 'Готово'

	*Добавление полуфабриката
	И в таблице "ДеревоПроизводство" я нажимаю на кнопку с именем 'ДеревоПроизводствоДобавитьВыпускПроизводство'
	И в таблице "ДеревоТехМатериаловПроизводство" я перехожу к строке:
		| 'Ед. изм.' | 'Код'   | 'Количество'   | 'Материал'          |
		| 'м'        | '06743' | '0,8080000000' | 'Рукав 60см 70г/м2' |
	И в таблице "ДеревоПроизводство" я перехожу к строке:
		| 'Проверен' | 'Этап'               |
		| 'Нет'      | 'Полуфабрикат <...>' |
	И в таблице "ДеревоПроизводство" я перехожу к строке:
		| 'Проверен' | 'Этап'      |
		| 'Нет'      | 'Материалы' |
	И в таблице "ДеревоТехМатериаловПроизводство" я нажимаю на кнопку с именем 'ДеревоТехМатериаловПроизводствоМатериалыПеренестиВДеревоПроизводство'
	И в таблице "ДеревоПроизводство" я перехожу к строке:
		| 'Проверен' | 'Часть БЭГА' | 'Этап'               |
		| 'Нет'      | 'Низ'        | 'Полуфабрикат <...>' |
	И я выбираю пункт контекстного меню с именем 'ДеревоПроизводствоКонтекстноеМенюДобавитьРезанныйПолуфабрикат' на элементе формы с именем "ДеревоПроизводство"
	Тогда открылось окно 'Создание отрезного полуфабриката'
	И из выпадающего списка с именем "Полуфабрикат" я выбираю точное значение '04194 - Кл.60h80/70'
	И я нажимаю на кнопку с именем 'Готово'

	*Добавление сшивного полуфабриката
	И в таблице "ДеревоПроизводство" я нажимаю на кнопку с именем 'ДеревоПроизводствоДобавитьВыпускПроизводство'
	И в таблице "ДеревоПроизводство" я сворачиваю строку:
		| 'Артикул' | 'на ед.' | 'на партию' | 'Проверен' | 'Часть БЭГА' | 'Этап'           |
		| '05305'   | '1,000'  | '1,000'     | 'Да'       | 'Низ'        | '105*105d30/140' |
	И в таблице "ДеревоПроизводство" я сворачиваю строку:
		| 'Артикул' | 'на ед.' | 'на партию' | 'Проверен' | 'Часть БЭГА' | 'Этап'        |
		| '04194'   | '1,000'  | '1,000'     | 'Да'       | 'Низ'        | 'Кл.60h80/70' |
	И в таблице "ДеревоПроизводство" я перехожу к строке:
		| 'Артикул' | 'на ед.' | 'на партию' | 'Проверен' | 'Часть БЭГА' | 'Этап'           |
		| '05305'   | '1,000'  | '1,000'     | 'Да'       | 'Низ'        | '105*105d30/140' |
	И В таблице  "ДеревоПроизводство" я перехожу на одну строку вниз с выделением
	И В таблице  "ДеревоПроизводство" я перехожу на одну строку вниз с выделением
	И я запоминаю текущее окно как "_ТекущаяАнкета"
	И я выполняю код встроенного языка (Расширение)
	"""bsl
		ТекОкно = VAExtensionКлиент.ПолучитьОкноПоЗаголовку("$_ТекущаяАнкета$");
		ТекОкно.ЭмулироватьПеретаскиваниеВнутриДереваПроизводство();
	"""
	И в таблице "ДеревоПроизводство" я перехожу к строке:
		| 'Проверен' | 'Этап'      |
		| 'Нет'      | 'Материалы' |
	И в таблице "ДеревоТехМатериаловПроизводство" я перехожу к строке:
		| 'Ед. изм.' | 'Код'   | 'Количество'   | 'Материал'  |
		| 'м'        | '08209' | '2,3000000000' | 'Лента 1см' |
	И в таблице "ДеревоТехМатериаловПроизводство" я нажимаю на кнопку с именем 'ДеревоТехМатериаловПроизводствоМатериалыПеренестиВДеревоПроизводство'
	И в таблице "ДеревоТехМатериаловПроизводство" я перехожу к строке:
		| 'Ед. изм.' | 'Код'   | 'Количество'   | 'Материал'                         |
		| 'г'        | '02545' | '6,8120460000' | 'Нить 1-е руки ППМ 2000den  белая' |
	И в таблице "ДеревоТехМатериаловПроизводство" я нажимаю на кнопку с именем 'ДеревоТехМатериаловПроизводствоМатериалыПеренестиВДеревоПроизводство'	
	И в таблице "ДеревоТехМатериаловПроизводство" я перехожу к строке:
		| 'Ед. изм.' | 'Код'   | 'Количество'   | 'Материал'           |
		| 'шт'       | '03100' | '1,0000000000' | 'Этикетка с номером' |
	И в таблице "ДеревоТехМатериаловПроизводство" я нажимаю на кнопку с именем 'ДеревоТехМатериаловПроизводствоМатериалыПеренестиВДеревоПроизводство'	
	И в таблице "ДеревоПроизводство" я перехожу к строке:
		| 'Проверен' | 'Этап'      |
		| 'Нет'      | 'Работы'    |
	И в таблице "СписокТехОперацийПроизводство" я перехожу к строке:
		| 'Количество' | 'Работа'                                                          | 'Это характеристика' |
		| '1,00000'    | 'Формирование п/ф панели от 120гр +  клап ЗУГ с пришивом завязки' | 'Нет'                |
	И в таблице "СписокТехОперацийПроизводство" я нажимаю на кнопку с именем 'СписокТехОперацийПроизводствоРаботыПеренестиВДеревоПроизводство'	
	И в таблице "ДеревоПроизводство" я перехожу к строке:
		| 'Проверен' | 'Часть БЭГА' | 'Этап'               |
		| 'Нет'      | 'Низ'        | 'Полуфабрикат <...>' |
	И я выбираю пункт контекстного меню с именем 'ДеревоПроизводствоКонтекстноеМенюДобавитьРезанныйПолуфабрикат' на элементе формы с именем "ДеревоПроизводство"
	Тогда открылось окно 'Создание сшивного полуфабриката'
	И из выпадающего списка с именем "Полуфабрикат" я выбираю точное значение '09387 - 105*105d30/140 + Кл.60h80/70 зуГ'
	И я нажимаю на кнопку с именем 'Готово'
	Когда открылось окно 'Анкета  * () 95х95х130(140) ов 4стр(30) Ю/Кл /d35*50 зуГ '
	И в таблице "ДеревоПроизводство" я сворачиваю строку:
		| 'Артикул' | 'на ед.' | 'на партию' | 'Проверен' | 'Часть БЭГА' | 'Этап'                             |
		| '09387'   | '1,000'  | '1,000'     | 'Да'       | 'Низ'        | '105*105d30/140 + Кл.60h80/70 зуГ' |

	*Добавление полуфабриката	
	И в таблице "ДеревоПроизводство" я нажимаю на кнопку с именем 'ДеревоПроизводствоДобавитьВыпускПроизводство'
	И в таблице "ДеревоТехМатериаловПроизводство" я перехожу к строке:
		| 'Ед. изм.' | 'Код'   | 'Количество'   | 'Материал'            |
		| 'м'        | '04080' | '1,4140000000' | 'Рукав 190см 140г/м2' |
	И в таблице "ДеревоПроизводство" я перехожу к строке:
		| 'Проверен' | 'Этап'               |
		| 'Нет'      | 'Полуфабрикат <...>' |
	И в таблице "ДеревоПроизводство" я перехожу к строке:
		| 'Проверен' | 'Этап'      |
		| 'Нет'      | 'Материалы' |
	И в таблице "ДеревоТехМатериаловПроизводство" я нажимаю на кнопку с именем 'ДеревоТехМатериаловПроизводствоМатериалыПеренестиВДеревоПроизводство'	
	И в таблице "ДеревоПроизводство" я перехожу к строке:
		| 'Проверен' | 'Часть БЭГА' | 'Этап'               |
		| 'Нет'      | 'Тело'       | 'Полуфабрикат <...>' |
	И я выбираю пункт контекстного меню с именем 'ДеревоПроизводствоКонтекстноеМенюДобавитьРезанныйПолуфабрикат' на элементе формы с именем "ДеревоПроизводство"
	Тогда открылось окно 'Создание отрезного полуфабриката'
	И из выпадающего списка с именем "Полуфабрикат" я выбираю точное значение '03375 - 190h140/140'
	И я нажимаю на кнопку с именем 'Готово'
	И в таблице "ДеревоПроизводство" я сворачиваю строку:
		| 'Артикул' | 'на ед.' | 'на партию' | 'Проверен' | 'Часть БЭГА' | 'Этап'        |
		| '03375'   | '1,000'  | '1,000'     | 'Да'       | 'Тело'       | '190h140/140' |
	
	*Добавление полуфабриката
	И в таблице "ДеревоПроизводство" я нажимаю на кнопку с именем 'ДеревоПроизводствоДобавитьВыпускПроизводство'
	И в таблице "ДеревоТехМатериаловПроизводство" я перехожу к строке:
		| 'Ед. изм.' | 'Код'   | 'Количество'   | 'Материал'            |
		| 'м'        | '02245' | '4,0400000000' | 'Полотно 78см 70г/м2' |
	И в таблице "ДеревоПроизводство" я перехожу к строке:
		| 'Проверен' | 'Этап'      |
		| 'Нет'      | 'Материалы' |
	И в таблице "ДеревоТехМатериаловПроизводство" я нажимаю на кнопку с именем 'ДеревоТехМатериаловПроизводствоМатериалыПеренестиВДеревоПроизводство'
	И в таблице "ДеревоПроизводство" я перехожу к строке:
		| 'Проверен' | 'Часть БЭГА' | 'Этап'               |
		| 'Нет'      | 'Верх'       | 'Полуфабрикат <...>' |
	И я выбираю пункт контекстного меню с именем 'ДеревоПроизводствоКонтекстноеМенюДобавитьРезанныйПолуфабрикат' на элементе формы с именем "ДеревоПроизводство"
	Тогда открылось окно 'Создание отрезного полуфабриката'
	И из выпадающего списка с именем "Полуфабрикат" я выбираю точное значение '03330 - ю.80h400/70'
	И я нажимаю на кнопку с именем 'Готово'
	И в таблице "ДеревоПроизводство" я сворачиваю строку:
		| 'Артикул' | 'на ед.' | 'на партию' | 'Проверен' | 'Часть БЭГА' | 'Этап'        |
		| '03330'   | '1,000'  | '1,000'     | 'Да'       | 'Верх'       | 'ю.80h400/70' |

	*Добавление сшивного полуфабриката
	И в таблице "ДеревоПроизводство" я нажимаю на кнопку с именем 'ДеревоПроизводствоДобавитьВыпускПроизводство'
	И в таблице "ДеревоПроизводство" я перехожу к строке:
		| 'Артикул' | 'на ед.' | 'на партию' | 'Проверен' | 'Часть БЭГА' | 'Этап'        |
		| '03375'   | '1,000'  | '1,000'     | 'Да'       | 'Тело'       | '190h140/140' |
	И В таблице  "ДеревоПроизводство" я перехожу на одну строку вниз с выделением
	И В таблице  "ДеревоПроизводство" я перехожу на одну строку вниз с выделением
	И я выполняю код встроенного языка (Расширение)
	"""bsl
		ТекОкно = VAExtensionКлиент.ПолучитьОкноПоЗаголовку("$_ТекущаяАнкета$");
		ТекОкно.ЭмулироватьПеретаскиваниеВнутриДереваПроизводство();
	"""
	И в таблице "ДеревоПроизводство" я перехожу к строке:
		| 'Проверен' | 'Этап'      |
		| 'Нет'      | 'Материалы' |
	И в таблице "ДеревоТехМатериаловПроизводство" я перехожу к строке:
		| 'Ед. изм.' | 'Код'   | 'Количество'   | 'Материал'  |
		| 'м'        | '08209' | '0,9000000000' | 'Лента 1см' |
	И в таблице "ДеревоТехМатериаловПроизводство" я нажимаю на кнопку с именем 'ДеревоТехМатериаловПроизводствоМатериалыПеренестиВДеревоПроизводство'
	И в таблице "ДеревоТехМатериаловПроизводство" я перехожу к строке:
		| 'Ед. изм.' | 'Код'   | 'Количество'   | 'Материал'           |
		| 'шт'       | '03100' | '1,0000000000' | 'Этикетка с номером' |
	И в таблице "ДеревоТехМатериаловПроизводство" я нажимаю на кнопку с именем 'ДеревоТехМатериаловПроизводствоМатериалыПеренестиВДеревоПроизводство'
	И в таблице "ДеревоТехМатериаловПроизводство" я перехожу к строке:
		| 'Ед. изм.' | 'Код'   | 'Количество'    | 'Материал'                         |
		| 'г'        | '02545' | '13,3623000000' | 'Нить 1-е руки ППМ 2000den  белая' |
	И в таблице "ДеревоТехМатериаловПроизводство" я нажимаю на кнопку с именем 'ДеревоТехМатериаловПроизводствоМатериалыПеренестиВДеревоПроизводство'
	И в таблице "ДеревоПроизводство" я перехожу к строке:
		| 'Проверен' | 'Этап'   |
		| 'Нет'      | 'Работы' |
	И в таблице "СписокТехОперацийПроизводство" я перехожу к строке:
		| 'Количество' | 'Работа'                                      | 'Это характеристика' |
		| '1,00000'    | 'Пришив юбки к заготовке рукава (h бб 1-180)' | 'Нет'                |
	И в таблице "СписокТехОперацийПроизводство" я нажимаю на кнопку с именем 'СписокТехОперацийПроизводствоРаботыПеренестиВДеревоПроизводство'	
	И в таблице "СписокТехОперацийПроизводство" я перехожу к строке:
		| 'Количество' | 'Работа'                               | 'Это характеристика' |
		| '1,00000'    | 'Формирование юбки с пришивом завязки' | 'Нет'                |
	И в таблице "СписокТехОперацийПроизводство" я нажимаю на кнопку с именем 'СписокТехОперацийПроизводствоРаботыПеренестиВДеревоПроизводство'	
	И в таблице "ДеревоПроизводство" я перехожу к строке:
		| 'Проверен' | 'Часть БЭГА' | 'Этап'               |
		| 'Нет'      | 'Верх'       | 'Полуфабрикат <...>' |
	И я выбираю пункт контекстного меню с именем 'ДеревоПроизводствоКонтекстноеМенюДобавитьРезанныйПолуфабрикат' на элементе формы с именем "ДеревоПроизводство"
	Тогда открылось окно 'Создание сшивного полуфабриката'
	И из выпадающего списка с именем "Полуфабрикат" я выбираю точное значение '08908 - ю.80h400/70 + 190h140/140'
	И я нажимаю на кнопку с именем 'Готово'
	И в таблице "ДеревоПроизводство" я перехожу к строке:
		| 'на ед.' | 'Проверен' | 'Этап'                                                            |
		| '1,000'  | 'Нет'      | 'Готовая продукция: 95х95х130(140) ов 4стр(30) Ю/Кл /d35*50 зуГ ' |
	
	*Заключительные действия (заппись, проведение)	
	И я выбираю пункт контекстного меню с именем 'ДеревоПроизводствоКонтекстноеМенюЗаполнитьОставшимися' на элементе формы с именем "ДеревоПроизводство"
	И я нажимаю на кнопку с именем 'ОбновитьЦену'
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	И в таблице "ДеревоПроизводство" я нажимаю на кнопку с именем 'ДеревоПроизводствоСоздатьГотовуюПродукцию'
	Тогда открылось окно 'Что делать?'
	И я нажимаю на кнопку с именем 'МнеВсеРавно'
	И я запоминаю значение поля с именем "Номер" как "_НомерДок"
	И я запоминаю значение поля с именем "Дата" как "_ДатаДок"
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Анкета  * ' в течение 20 секунд
	И В панели открытых я выбираю 'Анкета'
	Тогда открылось окно 'Анкета'
	И таблица "Список" содержит строки:
		| 'Дата' 	   | 'Номер' 	   |
		| '$_ДатаДок$' | '$_НомерДок$' |

И я закрываю все окна клиентского приложения
И я закрываю сеанс текущего клиента тестирования
	