#Использовать errors

Перем _Правила; // ФиксированныйМассив из ПравилоКлассификацииНативныхОшибок

#Область ОбработчикиСобытий

// Создает каталог встроенных правил классификации нативных ошибок.
Процедура ПриСозданииОбъекта()

	Правила = Новый Массив;

	ДобавитьПравилаФайловойСистемы(Правила);
	ДобавитьПравилаПроцессов(Правила);
	ДобавитьПравилаПотоков(Правила);
	ДобавитьПравилаJSON(Правила);
	ДобавитьПравилаXML(Правила);
	ДобавитьПравилаZIP(Правила);
	ДобавитьПравилаТекста(Правила);
	ДобавитьПравилаСтроковыхОпераций(Правила);
	ДобавитьПравилаЛокали(Правила);
	ДобавитьПравилаДвоичныхДанных(Правила);
	ДобавитьПравилаОбъектов(Правила);
	ДобавитьПравилаHTTP(Правила);
	ДобавитьПравилаВебСервера(Правила);
	ДобавитьПравилаВнешнихКомпонент(Правила);
	ДобавитьПравилаCOM(Правила);

	_Правила = Новый ФиксированныйМассив(Правила);

КонецПроцедуры

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

// Возвращает встроенные правила классификации нативных ошибок.
//
// Возвращаемое значение:
//  ФиксированныйМассив из ПравилоКлассификацииНативныхОшибок - Правила классификации.
Функция Все() Экспорт

	Возврат _Правила;

КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура ДобавитьПравилаФайловойСистемы(Правила)

	СообщениеРесурсНеНайден = "ru = 'Файл или каталог не найден'; en = 'File or directory not found'";

	ДобавитьПравило(
		Правила,
		"filesystem.access_denied",
		СпособыСопоставленияНативныхОшибок.ПоТипу(),
		"System.UnauthorizedAccessException",
		"",
		"",
		КодыНативныхОшибок.ФайловаяСистемаДоступЗапрещен(),
		"ru = 'Доступ к файлу или каталогу запрещен'; en = 'Access to file or directory is denied'"
	);
	ДобавитьПравило(
		Правила,
		"filesystem.already_exists.file_path",
		СпособыСопоставленияНативныхОшибок.ТипИОбрамление(),
		"System.IO.IOException",
		"ru = 'Файл '''; en = 'The file '''",
		"ru = ''' уже существует.'; en = ''' already exists.'",
		КодыНативныхОшибок.ФайловаяСистемаРесурсУжеСуществует(),
		"ru = 'Файл уже существует'; en = 'File already exists'"
	);
	ДобавитьПравило(
		Правила,
		"filesystem.already_exists.directory_path",
		СпособыСопоставленияНативныхОшибок.ТипИОбрамление(),
		"System.IO.IOException",
		"Cannot create '",
		"' because a file or directory with the same name already exists.",
		КодыНативныхОшибок.ФайловаяСистемаРесурсУжеСуществует(),
		"ru = 'Файл или каталог уже существует'; en = 'File or directory already exists'"
	);
	ДобавитьПравило(
		Правила,
		"filesystem.already_exists.file_win32",
		СпособыСопоставленияНативныхОшибок.ТипИОкончание(),
		"System.IO.IOException",
		"",
		"ru = 'Невозможно создать файл, так как он уже существует.';"
			+ "en = 'Cannot create a file when that file already exists.'",
		КодыНативныхОшибок.ФайловаяСистемаРесурсУжеСуществует(),
		"ru = 'Файл уже существует'; en = 'File already exists'"
	);
	ДобавитьПравило(
		Правила,
		"filesystem.resource_busy",
		СпособыСопоставленияНативныхОшибок.ТипИОбрамление(),
		"System.IO.IOException",
		"ru = 'Процесс не может получить доступ к файлу ''';"
			+ "en = 'The process cannot access the file '''",
		"ru = ''', так как этот файл используется другим процессом.';"
			+ "en = ''' because it is being used by another process.'",
		КодыНативныхОшибок.ФайловаяСистемаРесурсЗанят(),
		"ru = 'Файл уже используется'; en = 'File is already in use'"
	);
	ДобавитьПравило(
		Правила,
		"filesystem.not_found.file_type",
		СпособыСопоставленияНативныхОшибок.ПоТипу(),
		"System.IO.FileNotFoundException",
		"",
		"",
		КодыНативныхОшибок.ФайловаяСистемаРесурсНеНайден(),
		СообщениеРесурсНеНайден
	);
	ДобавитьПравило(
		Правила,
		"filesystem.not_found.directory_type",
		СпособыСопоставленияНативныхОшибок.ПоТипу(),
		"System.IO.DirectoryNotFoundException",
		"",
		"",
		КодыНативныхОшибок.ФайловаяСистемаРесурсНеНайден(),
		СообщениеРесурсНеНайден
	);
	ДобавитьПравило(
		Правила,
		"filesystem.not_found.file_message",
		СпособыСопоставленияНативныхОшибок.Префикс(),
		"",
		"Could not find file '",
		"",
		КодыНативныхОшибок.ФайловаяСистемаРесурсНеНайден(),
		СообщениеРесурсНеНайден
	);
	ДобавитьПравило(
		Правила,
		"filesystem.not_found.directory_message",
		СпособыСопоставленияНативныхОшибок.Префикс(),
		"",
		"Could not find a part of the path '",
		"",
		КодыНативныхОшибок.ФайловаяСистемаРесурсНеНайден(),
		СообщениеРесурсНеНайден
	);

КонецПроцедуры

Процедура ДобавитьПравилаПроцессов(Правила)

	ДобавитьПравило(
		Правила,
		"process.executable_not_found",
		СпособыСопоставленияНативныхОшибок.ТипИОбрамление(),
		"System.ComponentModel.Win32Exception",
		"An error occurred trying to start process '",
		"ru = 'Не удается найти указанный файл.'; en = 'The system cannot find the file specified.'",
		КодыНативныхОшибок.ПроцессИсполняемыйФайлНеНайден(),
		"ru = 'Исполняемый файл приложения не найден'; en = 'Application executable was not found'"
	);
	ДобавитьПравило(
		Правила,
		"process.executable_not_found.unix",
		СпособыСопоставленияНативныхОшибок.ТипИОбрамление(),
		"System.ComponentModel.Win32Exception",
		"An error occurred trying to start process '",
		"ru = 'Нет такого файла или каталога'; en = 'No such file or directory'",
		КодыНативныхОшибок.ПроцессИсполняемыйФайлНеНайден(),
		"ru = 'Исполняемый файл приложения не найден'; "
			+ "en = 'Application executable was not found'"
	);
	ДобавитьПравило(
		Правила,
		"process.exit_code_unavailable",
		СпособыСопоставленияНативныхОшибок.ТипИОкончание(),
		"System.InvalidOperationException",
		"",
		"Process must exit before requested information can be determined.",
		КодыНативныхОшибок.ПроцессКодВозвратаНедоступен(),
		"ru = 'Код возврата недоступен до завершения процесса'; "
			+ "en = 'Exit code is unavailable until the process exits'"
	);

КонецПроцедуры

Процедура ДобавитьПравилаПотоков(Правила)

	ДобавитьПравило(
		Правила,
		"stream.not_readable",
		СпособыСопоставленияНативныхОшибок.ТипИОкончание(),
		"System.ArgumentException",
		"",
		"Stream was not readable.",
		КодыНативныхОшибок.ПотокНедоступенДляЧтения(),
		"ru = 'Поток недоступен для чтения'; en = 'Stream is not readable'"
	);
	ДобавитьПравило(
		Правила,
		"stream.not_writable",
		СпособыСопоставленияНативныхОшибок.Точное(),
		"",
		"ru = 'Попытка записи в поток не поддерживающий запись';"
			+ "en = 'Cannot write to a stream that does not support writing'",
		"",
		КодыНативныхОшибок.ПотокНеПоддерживаетЗапись(),
		"ru = 'Поток не поддерживает запись'; en = 'Stream does not support writing'"
	);
	ДобавитьПравило(
		Правила,
		"stream.closed.onescript",
		СпособыСопоставленияНативныхОшибок.Точное(),
		"",
		"ru = 'Ошибка обращения к закрытому потоку'; en = 'Cannot access a closed stream'",
		"",
		КодыНативныхОшибок.ПотокЗакрыт(),
		"ru = 'Поток закрыт'; en = 'Stream is closed'"
	);
	ДобавитьПравило(
		Правила,
		"stream.closed.dotnet_stream",
		СпособыСопоставленияНативныхОшибок.ТипИОкончание(),
		"System.ObjectDisposedException",
		"",
		"ru = 'Доступ к закрытому потоку невозможен.'; en = 'Cannot access a closed Stream.'",
		КодыНативныхОшибок.ПотокЗакрыт(),
		"ru = 'Поток закрыт'; en = 'Stream is closed'"
	);
	ДобавитьПравило(
		Правила,
		"stream.closed.dotnet_file",
		СпособыСопоставленияНативныхОшибок.ТипИОкончание(),
		"System.ObjectDisposedException",
		"",
		"Cannot access a closed file.",
		КодыНативныхОшибок.ПотокЗакрыт(),
		"ru = 'Поток закрыт'; en = 'Stream is closed'"
	);
	ДобавитьПравило(
		Правила,
		"stream.closed.tcp_client",
		СпособыСопоставленияНативныхОшибок.ТипИОкончание(),
		"System.ObjectDisposedException",
		"",
		"Object name: 'System.Net.Sockets.TcpClient'.",
		КодыНативныхОшибок.ПотокЗакрыт(),
		"ru = 'Поток закрыт'; en = 'Stream is closed'"
	);
	ДобавитьПравило(
		Правила,
		"stream.buffer_range",
		СпособыСопоставленияНативныхОшибок.ТипИОкончание(),
		"System.ArgumentOutOfRangeException",
		"",
		"ru = 'Смещение и длина находились вне границ массива.';"
			+ "en = 'Offset and length were out of bounds for the array or count is greater than the number "
			+ "of elements from index to the end of the source collection. (Parameter ''count'')'",
		КодыНативныхОшибок.ПотокВыходЗаГраницыБуфера(),
		"ru = 'Диапазон буфера выходит за допустимые границы';"
			+ "en = 'Buffer range is outside the allowed bounds'"
	);
	ДобавитьПравило(
		Правила,
		"stream.timeout_not_supported",
		СпособыСопоставленияНативныхОшибок.ТипИОкончание(),
		"System.InvalidOperationException",
		"",
		"Timeouts are not supported on this stream.",
		КодыНативныхОшибок.ПотокНеПоддерживаетТаймауты(),
		"ru = 'Поток не поддерживает таймауты'; en = 'Stream does not support timeouts'"
	);

КонецПроцедуры

Процедура ДобавитьПравилаJSON(Правила)

	ДобавитьПравило(
		Правила,
		"json.invalid_syntax.jobject",
		СпособыСопоставленияНативныхОшибок.ТипИФрагмент(),
		"Newtonsoft.Json.JsonReaderException",
		"Error reading JObject from JsonReader. Path '",
		"",
		КодыНативныхОшибок.JSONНекорректныйСинтаксис(),
		"ru = 'Некорректные данные JSON'; en = 'Invalid JSON data'"
	);
	ДобавитьПравило(
		Правила,
		"json.invalid_write_state",
		СпособыСопоставленияНативныхОшибок.ПоТипу(),
		"Newtonsoft.Json.JsonWriterException",
		"",
		"",
		КодыНативныхОшибок.JSONНекорректноеСостояниеЗаписи(),
		"ru = 'Недопустимая операция записи JSON'; en = 'Invalid JSON writing operation'"
	);
	ДобавитьПравило(
		Правила,
		"json.reader_not_open",
		СпособыСопоставленияНативныхОшибок.Точное(),
		"",
		"ru = 'Источник данных JSON не открыт'; en = 'JSON data source is not opened'",
		"",
		КодыНативныхОшибок.JSONЧтениеНеОткрыто(),
		"ru = 'Недопустимое состояние объекта JSON'; en = 'Invalid JSON object state'"
	);
	ДобавитьПравило(
		Правила,
		"json.writer_not_open",
		СпособыСопоставленияНативныхОшибок.Точное(),
		"",
		"ru = 'Приемник данных JSON не открыт'; en = 'JSON data target is not opened'",
		"",
		КодыНативныхОшибок.JSONЗаписьНеОткрыта(),
		"ru = 'Недопустимое состояние объекта JSON'; en = 'Invalid JSON object state'"
	);
	ДобавитьПравило(
		Правила,
		"json.current_value_unavailable",
		СпособыСопоставленияНативныхОшибок.Точное(),
		"",
		"ru = 'Текущее значение JSON не может быть получено'; en = 'Cannot get current JSON value'",
		"",
		КодыНативныхОшибок.JSONТекущееЗначениеНедоступно(),
		"ru = 'Недопустимое состояние объекта JSON'; en = 'Invalid JSON object state'"
	);
	ДобавитьПравило(
		Правила,
		"json.unsupported_date_format",
		СпособыСопоставленияНативныхОшибок.Точное(),
		"",
		"ru = 'Формат даты JavaScript не поддерживается.'; en = 'JavaScript date format is not supported'",
		"",
		КодыНативныхОшибок.JSONФорматДатыНеПоддерживается(),
		"ru = 'Выбранный формат даты не поддерживается'; en = 'Selected date format is not supported'"
	);
	ДобавитьПравило(
		Правила,
		"json.invalid_date_presentation",
		СпособыСопоставленияНативныхОшибок.Точное(),
		"",
		"ru = 'Представление даты имеет неверный формат.';"
			+ "en = 'Invalid date presentation format'",
		"",
		КодыНативныхОшибок.JSONНекорректноеПредставлениеДаты(),
		"ru = 'Представление даты JSON имеет неверный формат';"
			+ "en = 'JSON date presentation has an invalid format'"
	);
	ДобавитьПравило(
		Правила,
		"json.local_date.javascript",
		СпособыСопоставленияНативныхОшибок.Точное(),
		"",
		"ru = 'Невозможно сохранить локальную дату в формате JavaScript';"
			+ "en = 'Cannot save local date in JavaScript format'",
		"",
		КодыНативныхОшибок.JSONЛокальнаяДатаНеПоддерживается(),
		"ru = 'Выбранный формат даты требует UTC'; en = 'Selected date format requires UTC'"
	);
	ДобавитьПравило(
		Правила,
		"json.local_date.microsoft",
		СпособыСопоставленияНативныхОшибок.Точное(),
		"",
		"ru = 'Невозможно сохранить локальную дату в формате Microsoft';"
			+ "en = 'Cannot save local date in Microsoft format'",
		"",
		КодыНативныхОшибок.JSONЛокальнаяДатаНеПоддерживается(),
		"ru = 'Выбранный формат даты требует UTC'; en = 'Selected date format requires UTC'"
	);
	ДобавитьПравило(
		Правила,
		"json.unsupported_value_type",
		СпособыСопоставленияНативныхОшибок.ПрефиксОкончание(),
		"",
		"ru = 'Запись значения типа '; en = 'Cannot write value of type '",
		"ru = ' не поддерживается'; en = ''",
		КодыНативныхОшибок.JSONНеподдерживаемыйТипЗначения(),
		"ru = 'Тип значения не поддерживается ЗаписьюJSON';"
			+ "en = 'Value type is not supported by JSONWriter'"
	);
	ДобавитьПравило(
		Правила,
		"json.invalid_syntax.reader_state",
		СпособыСопоставленияНативныхОшибок.Префикс(),
		"",
		"ru = 'Недопустимое состояние потока чтения JSON в строке';"
			+ "en = 'Invalid JSON reader state at line'",
		"",
		КодыНативныхОшибок.JSONНекорректныйСинтаксис(),
		"ru = 'Некорректные данные JSON'; en = 'Invalid JSON data'"
	);
	ДобавитьПравило(
		Правила,
		"json.invalid_syntax.unexpected_symbol",
		СпособыСопоставленияНативныхОшибок.Точное(),
		"",
		"ru = 'Непредвиденный символ при чтении JSON';"
			+ "en = 'Unexpected symbol during JSON reading'",
		"",
		КодыНативныхОшибок.JSONНекорректныйСинтаксис(),
		"ru = 'Некорректные данные JSON'; en = 'Invalid JSON data'"
	);

КонецПроцедуры

Процедура ДобавитьПравилаXML(Правила)

	СообщениеСостоянияЗаписи = "ru = 'Нарушен порядок операций записи XML';"
		+ "en = 'Invalid order of XML writing operations'";
	СообщениеСинтаксиса = "ru = 'Некорректные данные XML'; en = 'Invalid XML data'";
	СообщениеПредставления = "ru = 'Некорректное XML-представление значения';"
		+ "en = 'Invalid XML value representation'";

	ДобавитьПравило(
		Правила,
		"xml.invalid_write_state.no_start_tag",
		СпособыСопоставленияНативныхОшибок.ТипИОкончание(),
		"System.InvalidOperationException",
		"",
		"There was no XML start tag open.",
		КодыНативныхОшибок.XMLНекорректноеСостояниеЗаписи(),
		СообщениеСостоянияЗаписи
	);
	ДобавитьПравило(
		Правила,
		"xml.invalid_write_state.end_attribute",
		СпособыСопоставленияНативныхОшибок.ТипИОкончание(),
		"System.InvalidOperationException",
		"",
		"Token EndAttribute in state Start would result in an invalid XML document.",
		КодыНативныхОшибок.XMLНекорректноеСостояниеЗаписи(),
		СообщениеСостоянияЗаписи
	);
	ДобавитьПравило(
		Правила,
		"xml.invalid_write_state.start_document",
		СпособыСопоставленияНативныхОшибок.ТипИОкончание(),
		"System.InvalidOperationException",
		"",
		"WriteStartDocument needs to be the first call.",
		КодыНативныхОшибок.XMLНекорректноеСостояниеЗаписи(),
		СообщениеСостоянияЗаписи
	);
	ДобавитьПравило(
		Правила,
		"xml.invalid_syntax.cdata",
		СпособыСопоставленияНативныхОшибок.ТипИОкончание(),
		"System.ArgumentException",
		"",
		"Cannot have ']]>' inside an XML CDATA block.",
		КодыНативныхОшибок.XMLНекорректныйСинтаксис(),
		СообщениеСинтаксиса
	);
	ДобавитьПравило(
		Правила,
		"xml.invalid_syntax.comment",
		СпособыСопоставленияНативныхОшибок.ТипИОкончание(),
		"System.ArgumentException",
		"",
		"An XML comment cannot contain '--', and '-' cannot be the last character.",
		КодыНативныхОшибок.XMLНекорректныйСинтаксис(),
		СообщениеСинтаксиса
	);
	ДобавитьПравило(
		Правила,
		"xml.invalid_value.boolean",
		СпособыСопоставленияНативныхОшибок.ТипИОбрамление(),
		"System.FormatException",
		"The string '",
		"' is not a valid Boolean value.",
		КодыНативныхОшибок.XMLНекорректноеПредставлениеЗначения(),
		СообщениеПредставления
	);
	ДобавитьПравило(
		Правила,
		"xml.invalid_value.date",
		СпособыСопоставленияНативныхОшибок.ТипИОбрамление(),
		"System.FormatException",
		"The string '",
		"' is not a valid AllXsd value.",
		КодыНативныхОшибок.XMLНекорректноеПредставлениеЗначения(),
		СообщениеПредставления
	);
	ДобавитьПравило(
		Правила,
		"xml.writer_not_open",
		СпособыСопоставленияНативныхОшибок.Точное(),
		"",
		"ru = 'Приемник данных XML не открыт'; en = 'XML data target is not opened'",
		"",
		КодыНативныхОшибок.XMLЗаписьНеОткрыта(),
		"ru = 'ЗаписьXML не открыта'; en = 'XMLWriter is not open'"
	);
	ДобавитьПравило(
		Правила,
		"xml.invalid_write_state.write_order",
		СпособыСопоставленияНативныхОшибок.Точное(),
		"",
		"ru = 'Ошибочный порядок записи XML'; en = 'Wrong order of XML record'",
		"",
		КодыНативныхОшибок.XMLНекорректноеСостояниеЗаписи(),
		СообщениеСостоянияЗаписи
	);
	ДобавитьПравило(
		Правила,
		"xml.system_id_missing",
		СпособыСопоставленияНативныхОшибок.Точное(),
		"",
		"ru = 'Отсутствует системный идентификатор'; en = 'System ID missing'",
		"",
		КодыНативныхОшибок.XMLСистемныйИдентификаторНеЗадан(),
		"ru = 'Системный идентификатор XML-документа не задан'; en = 'XML document system ID is missing'"
	);
	ДобавитьПравило(
		Правила,
		"xml.invalid_syntax.xml_exception",
		СпособыСопоставленияНативныхОшибок.ПоТипу(),
		"System.Xml.XmlException",
		"",
		"",
		КодыНативныхОшибок.XMLНекорректныйСинтаксис(),
		СообщениеСинтаксиса
	);
	ДобавитьПравило(
		Правила,
		"xml.schema_duplicate_element",
		СпособыСопоставленияНативныхОшибок.ПрефиксОкончание(),
		"",
		"The global element '",
		"' has already been declared.",
		КодыНативныхОшибок.XMLПовторноеОбъявлениеЭлементаВСхеме(),
		"ru = 'Глобальный элемент схемы XML объявлен повторно';"
			+ "en = 'XML schema global element is declared more than once'"
	);

КонецПроцедуры

Процедура ДобавитьПравилаZIP(Правила)

	ДобавитьПравило(
		Правила,
		"zip.not_open",
		СпособыСопоставленияНативныхОшибок.Точное(),
		"",
		"Архив не открыт",
		"",
		КодыНативныхОшибок.АрхивНеОткрыт(),
		"ru = 'ZIP-архив не открыт'; en = 'ZIP archive is not open'"
	);

КонецПроцедуры

Процедура ДобавитьПравилаТекста(Правила)

	ДобавитьПравило(
		Правила,
		"text.not_open",
		СпособыСопоставленияНативныхОшибок.Точное(),
		"",
		"ru = 'Файл не открыт'; en = 'File is not open'",
		"",
		КодыНативныхОшибок.ТекстовыйОбъектНеОткрыт(),
		"ru = 'Текстовый объект не открыт'; en = 'Text object is not open'"
	);
	ДобавитьПравило(
		Правила,
		"url.explicit_encoding_not_supported",
		СпособыСопоставленияНативныхОшибок.ТипИОкончание(),
		"System.NotSupportedException",
		"",
		"Явное указание кодировки в данной версии не поддерживается (только utf-8 согласно RFC 3986)",
		КодыНативныхОшибок.URLЯвнаяКодировкаНеПоддерживается(),
		"ru = 'Явная кодировка URL не поддерживается'; en = 'Explicit URL encoding is not supported'"
	);
	ДобавитьПравило(
		Правила,
		"text.unknown_encoding.onescript",
		СпособыСопоставленияНативныхОшибок.Префикс(),
		"",
		"ru = 'Неправильное имя кодировки'; en = 'Invalid encoding name'",
		"",
		КодыНативныхОшибок.ТекстоваяКодировкаНеизвестна(),
		"ru = 'Неизвестная кодировка текста'; en = 'Unknown text encoding'"
	);
	ДобавитьПравило(
		Правила,
		"text.unknown_encoding.dotnet",
		СпособыСопоставленияНативныхОшибок.ТипИОкончание(),
		"System.ArgumentException",
		"",
		"' is not a supported encoding name. For information on defining a custom encoding,"
			+ " see the documentation for the Encoding.RegisterProvider method. (Parameter 'name')",
		КодыНативныхОшибок.ТекстоваяКодировкаНеизвестна(),
		"ru = 'Неизвестная кодировка текста'; en = 'Unknown text encoding'"
	);

КонецПроцедуры

Процедура ДобавитьПравилаСтроковыхОпераций(Правила)

	ДобавитьПравило(
		Правила,
		"string.invalid_template",
		СпособыСопоставленияНативныхОшибок.Префикс(),
		"",
		"ru = 'Ошибка синтаксиса шаблона в позиции '; en = 'Template syntax error at position '",
		"",
		КодыНативныхОшибок.СтроковыйШаблонНекорректныйСинтаксис(),
		"ru = 'Некорректный синтаксис строкового шаблона'; en = 'Invalid string template syntax'"
	);

КонецПроцедуры

Процедура ДобавитьПравилаЛокали(Правила)

	ДобавитьПравило(
		Правила,
		"locale.invalid",
		СпособыСопоставленияНативныхОшибок.ПоТипу(),
		"System.Globalization.CultureNotFoundException",
		"",
		"",
		КодыНативныхОшибок.НекорректнаяЛокаль(),
		"ru = 'Некорректная локаль'; en = 'Invalid locale'"
	);

КонецПроцедуры

Процедура ДобавитьПравилаДвоичныхДанных(Правила)

	ДобавитьПравило(
		Правила,
		"binary.invalid_base64",
		СпособыСопоставленияНативныхОшибок.ТипИОкончание(),
		"System.FormatException",
		"",
		"The input is not a valid Base-64 string as it contains a non-base 64 character, "
			+ "more than two padding characters, or an illegal character among the padding characters.",
		КодыНативныхОшибок.ДвоичныеДанныеНекорректнаяBase64Строка(),
		"ru = 'Некорректная строка Base64'; en = 'Invalid Base64 string'"
	);
	ДобавитьПравило(
		Правила,
		"binary.invalid_hex",
		СпособыСопоставленияНативныхОшибок.ТипИОкончание(),
		"System.FormatException",
		"",
		"ru = 'Неверный формат шестнадцатеричной строки'; en = 'Invalid hexadecimal string format'",
		КодыНативныхОшибок.ДвоичныеДанныеНекорректнаяHexСтрока(),
		"ru = 'Некорректные шестнадцатеричные данные'; en = 'Invalid hexadecimal data'"
	);
	ДобавитьПравило(
		Правила,
		"binary.read_only",
		СпособыСопоставленияНативныхОшибок.Точное(),
		"",
		"ru = 'Буфер находится в режиме ""Только чтение""'; en = 'Buffer is read-only'",
		"",
		КодыНативныхОшибок.ДвоичныеДанныеТолькоДляЧтения(),
		"ru = 'Двоичный буфер доступен только для чтения'; en = 'Binary buffer is read-only'"
	);
	ДобавитьПравило(
		Правила,
		"binary.buffer_range.overflow",
		СпособыСопоставленияНативныхОшибок.ТипИОкончание(),
		"System.IndexOutOfRangeException",
		"",
		"ru = 'Переполнение при работе с буфером'; en = 'Buffer overflow'",
		КодыНативныхОшибок.ДвоичныеДанныеВыходЗаГраницыБуфера(),
		"ru = 'Операция выходит за границы двоичного буфера'; en = 'Operation exceeds binary buffer bounds'"
	);
	ДобавитьПравило(
		Правила,
		"binary.buffer_range.source",
		СпособыСопоставленияНативныхОшибок.ТипИОкончание(),
		"System.ArgumentException",
		"",
		"ru = 'Исходный массив недостаточно длинный.';"
			+ "en = 'Source array was not long enough. Check the source index, length, "
			+ "and the array''s lower bounds. (Parameter ''sourceArray'')'",
		КодыНативныхОшибок.ДвоичныеДанныеВыходЗаГраницыБуфера(),
		"ru = 'Операция выходит за границы двоичного буфера'; en = 'Operation exceeds binary buffer bounds'"
	);
	ДобавитьПравило(
		Правила,
		"binary.buffer_range.destination",
		СпособыСопоставленияНативныхОшибок.ТипИОкончание(),
		"System.ArgumentException",
		"",
		"ru = 'Конечный массив недостаточно длинный.';"
			+ "en = 'Destination array was not long enough. Check the destination index, length, "
			+ "and the array''s lower bounds. (Parameter ''destinationArray'')'",
		КодыНативныхОшибок.ДвоичныеДанныеВыходЗаГраницыБуфера(),
		"ru = 'Операция выходит за границы двоичного буфера'; en = 'Operation exceeds binary buffer bounds'"
	);

КонецПроцедуры

Процедура ДобавитьПравилаОбъектов(Правила)

	ДобавитьПравило(
		Правила,
		"operation.not_supported",
		СпособыСопоставленияНативныхОшибок.ТипИОкончание(),
		"System.NotSupportedException",
		"",
		"Specified method is not supported.",
		КодыНативныхОшибок.ОперацияНеПоддерживается(),
		"ru = 'Операция не поддерживается'; en = 'Operation is not supported'"
	);
	ДобавитьПравило(
		Правила,
		"operation.not_implemented",
		СпособыСопоставленияНативныхОшибок.ПоТипу(),
		"System.NotImplementedException",
		"",
		"",
		КодыНативныхОшибок.ОперацияНеРеализована(),
		"ru = 'Операция не реализована'; en = 'Operation is not implemented'"
	);
	ДобавитьПравило(
		Правила,
		"number.overflow",
		СпособыСопоставленияНативныхОшибок.ПоТипу(),
		"System.OverflowException",
		"",
		"",
		КодыНативныхОшибок.ПереполнениеЧисловогоЗначения(),
		"ru = 'Переполнение числового значения'; en = 'Numeric overflow'"
	);
	ДобавитьПравило(
		Правила,
		"number.division_by_zero",
		СпособыСопоставленияНативныхОшибок.Точное(),
		"",
		"ru = 'Деление на ноль'; en = 'Divide by zero'",
		"",
		КодыНативныхОшибок.ДелениеНаНоль(),
		"ru = 'Деление на ноль'; en = 'Division by zero'"
	);
	ДобавитьПравило(
		Правила,
		"type.conversion_failed.null_reference",
		СпособыСопоставленияНативныхОшибок.ПрефиксОкончание(),
		"",
		"ru = '(null) Преобразование к типу '''; en = '(null) Conversion to type '''",
		"ru = ' не поддерживается'; en = ' is not supported'",
		КодыНативныхОшибок.ОшибкаПреобразованияЗначения(),
		"ru = 'Не удалось преобразовать значение к требуемому типу';"
			+ "en = 'Failed to convert value to required type'"
	);
	ДобавитьПравило(
		Правила,
		"type.conversion_failed.value",
		СпособыСопоставленияНативныхОшибок.ПрефиксОкончание(),
		"",
		"ru = 'Преобразование к типу '''; en = 'Conversion to type '''",
		"ru = ' не поддерживается'; en = ' is not supported'",
		КодыНативныхОшибок.ОшибкаПреобразованияЗначения(),
		"ru = 'Не удалось преобразовать значение к требуемому типу';"
			+ "en = 'Failed to convert value to required type'"
	);
	ДобавитьПравило(
		Правила,
		"comparison.not_supported.ru",
		СпособыСопоставленияНативныхОшибок.ПрефиксОкончание(),
		"",
		"ru = 'Сравнение на больше/меньше'",
		"ru = ' не поддерживается'",
		КодыНативныхОшибок.СравнениеНеПоддерживается(),
		"ru = 'Сравнение значений не поддерживается'; en = 'Value comparison is not supported'"
	);
	ДобавитьПравило(
		Правила,
		"type.conversion_failed.undefined",
		СпособыСопоставленияНативныхОшибок.ПрефиксИФрагмент(),
		"",
		"ru = 'OneScript.Values.BslUndefinedValue:'; en = 'OneScript.Values.BslUndefinedValue:'",
		"",
		КодыНативныхОшибок.ОшибкаПреобразованияЗначения(),
		"ru = 'Не удалось преобразовать значение к требуемому типу';"
			+ "en = 'Failed to convert value to required type'",
		"ru = 'Преобразование к типу '''; en = 'Conversion to type '''"
	);
	ДобавитьПравило(
		Правила,
		"type.conversion_failed.null",
		СпособыСопоставленияНативныхОшибок.ПрефиксИФрагмент(),
		"",
		"ru = 'OneScript.Values.BslNullValue:'; en = 'OneScript.Values.BslNullValue:'",
		"",
		КодыНативныхОшибок.ОшибкаПреобразованияЗначения(),
		"ru = 'Не удалось преобразовать значение к требуемому типу';"
			+ "en = 'Failed to convert value to required type'",
		"ru = 'Преобразование к типу '''; en = 'Conversion to type '''"
	);
	ДобавитьПравило(
		Правила,
		"type.conversion_failed.type",
		СпособыСопоставленияНативныхОшибок.ПрефиксИФрагмент(),
		"",
		"ru = 'OneScript.Values.BslTypeValue:'; en = 'OneScript.Values.BslTypeValue:'",
		"",
		КодыНативныхОшибок.ОшибкаПреобразованияЗначения(),
		"ru = 'Не удалось преобразовать значение к требуемому типу';"
			+ "en = 'Failed to convert value to required type'",
		"ru = 'Преобразование к типу '''; en = 'Conversion to type '''"
	);
	ДобавитьПравило(
		Правила,
		"type.conversion_failed.date",
		СпособыСопоставленияНативныхОшибок.ПрефиксИФрагмент(),
		"",
		"ru = 'OneScript.Values.BslDateValue:'; en = 'OneScript.Values.BslDateValue:'",
		"",
		КодыНативныхОшибок.ОшибкаПреобразованияЗначения(),
		"ru = 'Не удалось преобразовать значение к требуемому типу';"
			+ "en = 'Failed to convert value to required type'",
		"ru = 'Преобразование к типу '''; en = 'Conversion to type '''"
	);
	ДобавитьПравило(
		Правила,
		"type.not_registered",
		СпособыСопоставленияНативныхОшибок.ПрефиксОкончание(),
		"",
		"ru = 'Тип не зарегистрирован ('; en = 'Type is not registered ('",
		")",
		КодыНативныхОшибок.ТипНеЗарегистрирован(),
		"ru = 'Тип не зарегистрирован'; en = 'Type is not registered'"
	);
	ДобавитьПравило(
		Правила,
		"type.already_registered",
		СпособыСопоставленияНативныхОшибок.ПрефиксОкончание(),
		"",
		"Type «",
		"» already registered",
		КодыНативныхОшибок.ТипУжеЗарегистрирован(),
		"ru = 'Тип уже зарегистрирован'; en = 'Type is already registered'"
	);
	ДобавитьПравило(
		Правила,
		"comparison.not_supported.en",
		СпособыСопоставленияНативныхОшибок.Префикс(),
		"",
		"en = 'Greater-than/Less-than comparison operations are not supported'",
		"",
		КодыНативныхОшибок.СравнениеНеПоддерживается(),
		"ru = 'Сравнение значений не поддерживается'; en = 'Value comparison is not supported'"
	);
	ДобавитьПравило(
		Правила,
		"type.conversion_failed.structure",
		СпособыСопоставленияНативныхОшибок.ПрефиксОкончание(),
		"",
		"ru = 'OneScript.StandardLibrary.Collections.StructureImpl: Структура Преобразование к типу ''';"
			+ "en = 'OneScript.StandardLibrary.Collections.StructureImpl: Структура Conversion to type '''",
		"ru = ' не поддерживается'; en = ' is not supported'",
		КодыНативныхОшибок.ОшибкаПреобразованияЗначения(),
		"ru = 'Не удалось преобразовать значение к требуемому типу';"
			+ "en = 'Failed to convert value to required type'"
	);
	ДобавитьПравило(
		Правила,
		"object.method_not_found",
		СпособыСопоставленияНативныхОшибок.ПрефиксОкончание(),
		"",
		"ru = 'Метод объекта не обнаружен ('; en = 'Method not found ('",
		")",
		КодыНативныхОшибок.МетодОбъектаНеНайден(),
		"ru = 'Метод объекта не найден'; en = 'Object method is not found'"
	);
	ДобавитьПравило(
		Правила,
		"object.value_required",
		СпособыСопоставленияНативныхОшибок.Точное(),
		"",
		"ru = 'Значение не является значением объектного типа'; en = 'Value is not of object type'",
		"",
		КодыНативныхОшибок.ТребуетсяОбъектноеЗначение(),
		"ru = 'Требуется значение объектного типа'; en = 'Object value is required'"
	);
	ДобавитьПравило(
		Правила,
		"argument.too_many",
		СпособыСопоставленияНативныхОшибок.Точное(),
		"",
		"ru = 'Слишком много фактических параметров'; en = 'Too many arguments were passed'",
		"",
		КодыНативныхОшибок.СлишкомМногоАргументовВызова(),
		"ru = 'Передано слишком много аргументов вызова'; en = 'Too many call arguments were passed'"
	);
	ДобавитьПравило(
		Правила,
		"argument.too_few",
		СпособыСопоставленияНативныхОшибок.Точное(),
		"",
		"ru = 'Недостаточно фактических параметров'; en = 'Too few arguments were passed'",
		"",
		КодыНативныхОшибок.НедостаточноАргументовВызова(),
		"ru = 'Передано недостаточно аргументов вызова'; en = 'Too few call arguments were passed'"
	);
	ДобавитьПравило(
		Правила,
		"argument.mandatory_missing",
		СпособыСопоставленияНативныхОшибок.Точное(),
		"",
		"ru = 'Пропущен обязательный параметр'; en = 'Missed mandatory argument'",
		"",
		КодыНативныхОшибок.НедостаточноАргументовВызова(),
		"ru = 'Передано недостаточно аргументов вызова'; en = 'Too few call arguments were passed'"
	);
	ДобавитьПравило(
		Правила,
		"argument.invalid_type.named",
		СпособыСопоставленияНативныхОшибок.Префикс(),
		"",
		"ru = 'Неверный тип аргумента '''; en = 'Invalid type of argument '''",
		"",
		КодыНативныхОшибок.НедопустимыйТипАргумента(),
		"ru = 'Недопустимый тип аргумента'; en = 'Invalid argument type'"
	);
	ДобавитьПравило(
		Правила,
		"argument.invalid_type.numbered",
		СпособыСопоставленияНативныхОшибок.Префикс(),
		"",
		"ru = 'Неверный тип аргумента номер '; en = 'Invalid type of argument number '",
		"",
		КодыНативныхОшибок.НедопустимыйТипАргумента(),
		"ru = 'Недопустимый тип аргумента'; en = 'Invalid argument type'"
	);
	ДобавитьПравило(
		Правила,
		"argument.invalid_value.generic",
		СпособыСопоставленияНативныхОшибок.Точное(),
		"",
		"ru = 'Неверное значение аргумента'; en = 'Invalid argument value'",
		"",
		КодыНативныхОшибок.НедопустимоеЗначениеАргумента(),
		"ru = 'Недопустимое значение аргумента'; en = 'Invalid argument value'"
	);
	ДобавитьПравило(
		Правила,
		"argument.invalid_value.stream_buffer_size",
		СпособыСопоставленияНативныхОшибок.ТипИОкончание(),
		"System.ArgumentOutOfRangeException",
		"",
		"Non-negative number required. (Parameter 'bufferSize')",
		КодыНативныхОшибок.НедопустимоеЗначениеАргумента(),
		"ru = 'Недопустимое значение аргумента'; en = 'Invalid argument value'"
	);
	ДобавитьПравило(
		Правила,
		"argument.invalid_value.xml_attribute_index",
		СпособыСопоставленияНативныхОшибок.ТипИФрагмент(),
		"System.ArgumentOutOfRangeException",
		"must be a non-negative value. (Parameter 'i')",
		"",
		КодыНативныхОшибок.НедопустимоеЗначениеАргумента(),
		"ru = 'Недопустимое значение аргумента'; en = 'Invalid argument value'"
	);
	ДобавитьПравило(
		Правила,
		"argument.invalid_value.format_index",
		СпособыСопоставленияНативныхОшибок.ТипИОкончание(),
		"System.ArgumentOutOfRangeException",
		"",
		"Specified argument was out of the range of valid values. (Parameter 'index')",
		КодыНативныхОшибок.НедопустимоеЗначениеАргумента(),
		"ru = 'Недопустимое значение аргумента'; en = 'Invalid argument value'"
	);
	ДобавитьПравило(
		Правила,
		"argument.invalid_value.context_parameter",
		СпособыСопоставленияНативныхОшибок.ПрефиксИФрагмент(),
		"",
		"ru = 'Ошибка при вызове метода контекста ('; en = 'Error calling context method ('",
		"",
		КодыНативныхОшибок.НедопустимоеЗначениеАргумента(),
		"ru = 'Недопустимое значение аргумента'; en = 'Invalid argument value'",
		"ru = '): Недопустимое значение параметра номер '''; en = '): Invalid parameter number '''"
	);
	ДобавитьПравило(
		Правила,
		"argument.invalid_value.named",
		СпособыСопоставленияНативныхОшибок.Префикс(),
		"",
		"ru = 'Неверное значение аргумента '; en = 'Invalid argument value '",
		"",
		КодыНативныхОшибок.НедопустимоеЗначениеАргумента(),
		"ru = 'Недопустимое значение аргумента'; en = 'Invalid argument value'"
	);
	ДобавитьПравило(
		Правила,
		"argument.invalid_value.named_en",
		СпособыСопоставленияНативныхОшибок.Префикс(),
		"",
		"en = 'Invalid value for argument '",
		"",
		КодыНативныхОшибок.НедопустимоеЗначениеАргумента(),
		"ru = 'Недопустимое значение аргумента'; en = 'Invalid argument value'"
	);
	ДобавитьПравило(
		Правила,
		"compilation.attached_script",
		СпособыСопоставленияНативныхОшибок.Префикс(),
		"",
		"ru = 'Ошибка компиляции подключаемого сценария:'; en = 'Error compiling attached script:'",
		"",
		КодыНативныхОшибок.ОшибкаКомпиляцииСценария(),
		"ru = 'Ошибка компиляции сценария'; en = 'Script compilation failed'"
	);
	ДобавитьПравило(
		Правила,
		"compilation.return_outside_method",
		СпособыСопоставленияНативныхОшибок.Точное(),
		"",
		"ru = 'Оператор ""Возврат"" может использоваться только внутри метода';"
			+ "en = 'Return operator may not be used outside procedure or function'",
		"",
		КодыНативныхОшибок.ОшибкаКомпиляцииСценария(),
		"ru = 'Ошибка компиляции сценария'; en = 'Script compilation failed'"
	);
	ДобавитьПравило(
		Правила,
		"compilation.module",
		СпособыСопоставленияНативныхОшибок.Префикс(),
		"",
		"ru = 'Ошибка комиляции модуля'; en = 'Module compilation error'",
		"",
		КодыНативныхОшибок.ОшибкаКомпиляцииСценария(),
		"ru = 'Ошибка компиляции сценария'; en = 'Script compilation failed'"
	);
	ДобавитьПравило(
		Правила,
		"argument.invalid_type.generic",
		СпособыСопоставленияНативныхОшибок.Точное(),
		"",
		"ru = 'Неверный тип аргумента'; en = 'Invalid type of argument'",
		"",
		КодыНативныхОшибок.НедопустимыйТипАргумента(),
		"ru = 'Недопустимый тип аргумента'; en = 'Invalid argument type'"
	);
	ДобавитьПравило(
		Правила,
		"background_tasks.failed",
		СпособыСопоставленияНативныхОшибок.Точное(),
		"",
		"ru = 'Задания завершились с ошибками'; en = 'Tasks are completed with errors'",
		"",
		КодыНативныхОшибок.ФоновыеЗадачиЗавершилисьСОшибками(),
		"ru = 'Фоновые задачи завершились с ошибками'; en = 'Background tasks failed'"
	);
	ДобавитьПравило(
		Правила,
		"constructor.type_not_defined",
		СпособыСопоставленияНативныхОшибок.ПрефиксОкончание(),
		"",
		"ru = 'Тип не определен. Конструктор не найден ('; en = 'Type is not defined ('",
		")",
		КодыНативныхОшибок.КонструкторТипаНеНайден(),
		"ru = 'Конструктор типа не найден'; en = 'Type constructor is not found'"
	);
	ДобавитьПравило(
		Правила,
		"constructor.not_defined_with_arguments",
		СпособыСопоставленияНативныхОшибок.Точное(),
		"",
		"ru = 'Конструктор не определен, но переданы параметры конструктора.';"
			+ "en = 'Constructor is not defined, but constructor parameters were passed.'",
		"",
		КодыНативныхОшибок.КонструкторТипаНеНайден(),
		"ru = 'Конструктор типа не найден'; en = 'Type constructor is not found'"
	);
	ДобавитьПравило(
		Правила,
		"constructor.invalid_argument_count",
		СпособыСопоставленияНативныхОшибок.Префикс(),
		"",
		"ru = 'Параметры конструктора: необходимых параметров:';"
			+ "en = 'Constructor parameters: required parameters:'",
		"",
		КодыНативныхОшибок.КонструкторНекорректноеКоличествоАргументов(),
		"ru = 'Некорректное количество аргументов конструктора';"
			+ "en = 'Invalid constructor argument count'"
	);
	ДобавитьПравило(
		Правила,
		"date.invalid_components",
		СпособыСопоставленияНативныхОшибок.ТипИОкончание(),
		"System.ArgumentOutOfRangeException",
		"",
		"Year, Month, and Day parameters describe an un-representable DateTime.",
		КодыНативныхОшибок.НекорректныеКомпонентыДаты(),
		"ru = 'Компоненты даты не образуют представимую дату'; "
			+ "en = 'Date components describe an un-representable DateTime'"
	);
	ДобавитьПравило(
		Правила,
		"collection.index_out_of_range",
		СпособыСопоставленияНативныхОшибок.Точное(),
		"",
		"ru = 'Значение индекса выходит за пределы диапазона'; en = 'Index is out of range'",
		"",
		КодыНативныхОшибок.ИндексКоллекцииВнеДиапазона(),
		"ru = 'Индекс коллекции вне диапазона'; en = 'Collection index is out of range'"
	);
	ДобавитьПравило(
		Правила,
		"collection.key_not_found",
		СпособыСопоставленияНативныхОшибок.Точное(),
		"",
		"Значение, соответствующее ключу, не задано",
		"",
		КодыНативныхОшибок.КлючКоллекцииНеНайден(),
		"ru = 'Значение по ключу коллекции не найдено'; en = 'Collection key value is not found'"
	);
	ДобавитьПравило(
		Правила,
		"collection.foreign_element.value_list",
		СпособыСопоставленияНативныхОшибок.Точное(),
		"",
		"ru = 'Элемент не принадлежит списку значений'; en = 'Element does not belong to values list'",
		"",
		КодыНативныхОшибок.ЭлементНеПринадлежитКоллекции(),
		"ru = 'Элемент не принадлежит коллекции'; en = 'Element does not belong to collection'"
	);
	ДобавитьПравило(
		Правила,
		"collection.foreign_element.value_table",
		СпособыСопоставленияНативныхОшибок.Точное(),
		"",
		"ru = 'Строка не принадлежит таблице значений'; en = 'Row does not belong to table'",
		"",
		КодыНативныхОшибок.ЭлементНеПринадлежитКоллекции(),
		"ru = 'Элемент не принадлежит коллекции'; en = 'Element does not belong to collection'"
	);
	ДобавитьПравило(
		Правила,
		"collection.indexed_value_read_only",
		СпособыСопоставленияНативныхОшибок.Точное(),
		"",
		"ru = 'Индексированное значение доступно только для чтения'; en = 'Indexed value is read-only'",
		"",
		КодыНативныхОшибок.ИндексированноеЗначениеКоллекцииТолькоДляЧтения(),
		"ru = 'Индексированное значение коллекции доступно только для чтения'; "
			+ "en = 'Indexed collection value is read-only'"
	);
	ДобавитьПравило(
		Правила,
		"collection.invalid_constructor_argument",
		СпособыСопоставленияНативныхОшибок.ПрефиксОкончание(),
		"",
		"В качестве параметра для конструктора можно передавать только ",
		" или Ключи и Значения",
		КодыНативныхОшибок.НекорректныйАргументКонструктораКоллекции(),
		"ru = 'Некорректный аргумент конструктора коллекции'; "
			+ "en = 'Invalid collection constructor argument'"
	);
	ДобавитьПравило(
		Правила,
		"table.invalid_offset",
		СпособыСопоставленияНативныхОшибок.Точное(),
		"",
		"ru = 'Неправильное смещение внутри коллекции'; en = 'Incorrect offset within collection'",
		"",
		КодыНативныхОшибок.ТаблицаНекорректноеСмещение(),
		"ru = 'Некорректное смещение таблицы'; en = 'Invalid table offset'"
	);
	ДобавитьПравило(
		Правила,
		"table.invalid_column_name",
		СпособыСопоставленияНативныхОшибок.ПрефиксОкончание(),
		"",
		"ru = 'Неверное имя колонки '''; en = 'Wrong column name '''",
		"ru = ''''; en = ''''",
		КодыНативныхОшибок.ТаблицаНекорректноеИмяКолонки(),
		"ru = 'Некорректное имя колонки таблицы'; en = 'Invalid table column name'"
	);
	ДобавитьПравило(
		Правила,
		"table.column_already_exists",
		СпособыСопоставленияНативныхОшибок.ПрефиксОкончание(),
		"",
		"ru = 'Колонка '; en = 'Column '",
		"ru = ' уже есть'; en = ' already exists'",
		КодыНативныхОшибок.ТаблицаКолонкаУжеСуществует(),
		"ru = 'Колонка таблицы уже существует'; en = 'Table column already exists'"
	);
	ДобавитьПравило(
		Правила,
		"table.column_role_conflict",
		СпособыСопоставленияНативныхОшибок.ПрефиксОкончание(),
		"",
		"ru = 'Колонка '; en = 'Column '",
		"ru = ' колонкой суммирования'; en = ' summation column'",
		КодыНативныхОшибок.ТаблицаКонфликтРолейКолонки(),
		"ru = 'Конфликт роли колонки таблицы'; en = 'Table column role conflict'"
	);
	ДобавитьПравило(
		Правила,
		"object.property_not_found",
		СпособыСопоставленияНативныхОшибок.ПрефиксОкончание(),
		"",
		"ru = 'Свойство объекта не обнаружено ('; en = 'Object property is not found ('",
		"ru = ')'; en = ')'",
		КодыНативныхОшибок.СвойствоОбъектаНеНайдено(),
		"ru = 'Свойство объекта не найдено'; en = 'Object property is not found'"
	);
	ДобавитьПравило(
		Правила,
		"object.property_not_writable",
		СпособыСопоставленияНативныхОшибок.ПрефиксОкончание(),
		"",
		"ru = 'Свойство '; en = 'Property '",
		"ru = ' недоступно для записи'; en = ' is not writable'",
		КодыНативныхОшибок.СвойствоОбъектаНедоступноДляЗаписи(),
		"ru = 'Свойство объекта недоступно для записи'; en = 'Object property is not writable'"
	);
	ДобавитьПравило(
		Правила,
		"object.property_not_readable",
		СпособыСопоставленияНативныхОшибок.ПрефиксОкончание(),
		"",
		"ru = 'Свойство '; en = 'Property '",
		"ru = ' недоступно для чтения'; en = ' is not readable'",
		КодыНативныхОшибок.СвойствоОбъектаНедоступноДляЧтения(),
		"ru = 'Свойство объекта недоступно для чтения'; en = 'Object property is not readable'"
	);
	ДобавитьПравило(
		Правила,
		"object.invalid_property_name",
		СпособыСопоставленияНативныхОшибок.Префикс(),
		"",
		"Задано неправильное имя атрибута структуры '",
		"",
		КодыНативныхОшибок.НекорректноеИмяСвойстваОбъекта(),
		"ru = 'Некорректное имя свойства структуры'; en = 'Invalid structure property name'"
	);

КонецПроцедуры

Процедура ДобавитьПравилаHTTP(Правила)

	ДобавитьПравило(
		Правила,
		"http.custom_certificate_not_supported",
		СпособыСопоставленияНативныхОшибок.Точное(),
		"",
		"Защищенное соединение по произвольным сертификатам не поддерживается."
			+ " Если необходим доступ по https, просто укажите протокол https в адресе хоста.",
		"",
		КодыНативныхОшибок.HTTPПользовательскийСертификатНеПоддерживается(),
		"ru = 'Пользовательские TLS-сертификаты не поддерживаются';"
			+ "en = 'Custom TLS certificates are not supported'"
	);
	ДобавитьПравило(
		Правила,
		"http.timeout",
		СпособыСопоставленияНативныхОшибок.ТипИОкончание(),
		"System.Net.WebException",
		"",
		"ru = 'Время ожидания операции истекло.'; en = 'The operation has timed out.'",
		КодыНативныхОшибок.HTTPТаймаутОперации(),
		"ru = 'Истекло время ожидания HTTP-операции'; en = 'HTTP operation timed out'"
	);
	ДобавитьПравило(
		Правила,
		"http.method_not_allowed",
		СпособыСопоставленияНативныхОшибок.ТипИФрагмент(),
		"System.Net.WebException",
		"The remote server returned an error: (405)",
		"",
		КодыНативныхОшибок.HTTPМетодНеРазрешен(),
		"ru = 'HTTP-метод не разрешен сервером'; en = 'HTTP method is not allowed by the server'"
	);
	ДобавитьПравило(
		Правила,
		"proxy.authentication_required",
		СпособыСопоставленияНативныхОшибок.ТипИФрагмент(),
		"System.Net.WebException",
		"failed with status code '407'",
		"",
		КодыНативныхОшибок.ПроксиТребуетАутентификации(),
		"ru = 'HTTPS-прокси требует аутентификацию'; en = 'HTTPS proxy authentication is required'"
	);
	ДобавитьПравило(
		Правила,
		"proxy.tunnel_failed",
		СпособыСопоставленияНативныхОшибок.ТипИФрагмент(),
		"System.Net.WebException",
		"The proxy tunnel request to proxy",
		"",
		КодыНативныхОшибок.ПроксиНеУстановилТуннель(),
		"ru = 'HTTPS-прокси не смог создать туннель'; en = 'HTTPS proxy failed to establish a tunnel'"
	);
	ДобавитьПравило(
		Правила,
		"network.tls_handshake_failed",
		СпособыСопоставленияНативныхОшибок.ТипИОкончание(),
		"System.Net.WebException",
		"",
		"The SSL connection could not be established, see inner exception.",
		КодыНативныхОшибок.СетьОшибкаСогласованияTLS(),
		"ru = 'Не удалось установить защищенное TLS-соединение';"
			+ "en = 'Failed to establish a secure TLS connection'"
	);

	ДобавитьПравилаНекорректногоHTTPОтвета(Правила);

	ДобавитьПравило(
		Правила,
		"network.address_in_use.socket",
		СпособыСопоставленияНативныхОшибок.ТипИОкончание(),
		"System.Net.Sockets.SocketException",
		"",
		"ru = 'Обычно разрешается только одно использование адреса сокета (протокол/сетевой адрес/порт).';"
			+ "en = 'Only one usage of each socket address (protocol/network address/port) is normally permitted.'",
		КодыНативныхОшибок.СетьАдресЗанят(),
		"ru = 'Сетевой адрес уже используется'; en = 'Network address is already in use'"
	);
	ДобавитьПравило(
		Правила,
		"network.address_in_use.socket_unix",
		СпособыСопоставленияНативныхОшибок.ТипИОкончание(),
		"System.Net.Sockets.SocketException",
		"",
		"en = 'Address already in use'",
		КодыНативныхОшибок.СетьАдресЗанят(),
		"ru = 'Сетевой адрес уже используется'; en = 'Network address is already in use'"
	);
	ДобавитьПравило(
		Правила,
		"network.host_not_found",
		СпособыСопоставленияНативныхОшибок.ТипИОкончание(),
		"System.Net.Sockets.SocketException",
		"",
		"ru = 'Этот хост неизвестен.'; en = 'No such host is known.'",
		КодыНативныхОшибок.СетьОшибкаРазрешенияИмениУзла(),
		"ru = 'Не удалось разрешить имя сетевого узла'; en = 'Network host name resolution failed'"
	);
	ДобавитьПравило(
		Правила,
		"network.host_not_found.web_exception_linux",
		СпособыСопоставленияНативныхОшибок.ТипИФрагмент(),
		"System.Net.WebException",
		"en = 'Name or service not known'",
		"",
		КодыНативныхОшибок.СетьОшибкаРазрешенияИмениУзла(),
		"ru = 'Не удалось разрешить имя сетевого узла'; en = 'Network host name resolution failed'"
	);
	ДобавитьПравило(
		Правила,
		"network.host_not_found.web_exception_macos",
		СпособыСопоставленияНативныхОшибок.ТипИФрагмент(),
		"System.Net.WebException",
		"en = 'nodename nor servname provided, or not known'",
		"",
		КодыНативныхОшибок.СетьОшибкаРазрешенияИмениУзла(),
		"ru = 'Не удалось разрешить имя сетевого узла'; en = 'Network host name resolution failed'"
	);
	ДобавитьПравило(
		Правила,
		"network.connection_refused",
		СпособыСопоставленияНативныхОшибок.ТипИОбрамление(),
		"System.Net.Sockets.SocketException",
		"ru = 'Подключение не установлено, т.к. конечный компьютер отверг запрос на подключение.';"
			+ "en = 'No connection could be made because the target machine actively refused it.'",
		"ru = ''; en = ''",
		КодыНативныхОшибок.СетьСоединениеОтклонено(),
		"ru = 'Сетевое соединение отклонено'; en = 'Network connection was refused'"
	);
	ДобавитьПравило(
		Правила,
		"network.connection_refused.web_exception",
		СпособыСопоставленияНативныхОшибок.ТипИФрагмент(),
		"System.Net.WebException",
		"en = 'Connection refused'",
		"",
		КодыНативныхОшибок.СетьСоединениеОтклонено(),
		"ru = 'Сетевое соединение отклонено'; en = 'Network connection was refused'"
	);
	ДобавитьПравило(
		Правила,
		"network.connection_reset",
		СпособыСопоставленияНативныхОшибок.ТипИОкончание(),
		"System.Net.Sockets.SocketException",
		"",
		"ru = 'Удаленный хост принудительно разорвал существующее подключение.';"
			+ "en = 'An existing connection was forcibly closed by the remote host.'",
		КодыНативныхОшибок.СетьСоединениеСброшено(),
		"ru = 'Сетевое соединение сброшено удаленным узлом';"
			+ "en = 'Network connection was reset by the remote host'"
	);
	ДобавитьПравило(
		Правила,
		"http.incomplete_response.content_length",
		СпособыСопоставленияНативныхОшибок.ТипИОбрамление(),
		"System.Net.Http.HttpIOException",
		"The response ended prematurely, with at least",
		"(ResponseEnded)",
		КодыНативныхОшибок.HTTPНеполныйОтвет(),
		"ru = 'Тело HTTP-ответа получено не полностью'; en = 'HTTP response body was incomplete'"
	);
	ДобавитьПравило(
		Правила,
		"http.incomplete_response.chunked",
		СпособыСопоставленияНативныхОшибок.ТипИОкончание(),
		"System.Net.Http.HttpIOException",
		"",
		"The response ended prematurely. (ResponseEnded)",
		КодыНативныхОшибок.HTTPНеполныйОтвет(),
		"ru = 'Тело HTTP-ответа получено не полностью'; en = 'HTTP response body was incomplete'"
	);
	ДобавитьПравило(
		Правила,
		"http.invalid_method",
		СпособыСопоставленияНативныхОшибок.ТипИОкончание(),
		"System.ArgumentException",
		"",
		"Cannot set null or blank methods on request. (Parameter 'value')",
		КодыНативныхОшибок.HTTPНекорректныйМетод(),
		"ru = 'Некорректный HTTP-метод'; en = 'Invalid HTTP method'"
	);

	ДобавитьПравилаHTTPЗаголовков(Правила);

КонецПроцедуры

Процедура ДобавитьПравилаВебСервера(Правила)

	ДобавитьПравило(
		Правила,
		"network.address_in_use.web_server",
		СпособыСопоставленияНативныхОшибок.ТипИОбрамление(),
		"System.IO.IOException",
		"Failed to bind to address ",
		": address already in use.",
		КодыНативныхОшибок.СетьАдресЗанят(),
		"ru = 'Сетевой адрес уже используется'; en = 'Network address is already in use'"
	);
	ДобавитьПравило(
		Правила,
		"network.invalid_port",
		СпособыСопоставленияНативныхОшибок.ТипИОкончание(),
		"System.ArgumentOutOfRangeException",
		"",
		"Specified argument was out of the range of valid values. (Parameter 'port')",
		КодыНативныхОшибок.СетьНекорректныйПорт(),
		"ru = 'Указан некорректный сетевой порт'; en = 'Invalid network port'"
	);
	ДобавитьПравило(
		Правила,
		"network.invalid_ip_address",
		СпособыСопоставленияНативныхОшибок.Префикс(),
		"",
		"ru = 'Ошибка разбора IP адреса: '; en = 'Failed to parse IP address: '",
		"",
		КодыНативныхОшибок.СетьНекорректныйIPАдрес(),
		"ru = 'Некорректный IP-адрес соединения'; en = 'Invalid connection IP address'"
	);

КонецПроцедуры

Процедура ДобавитьПравилаНекорректногоHTTPОтвета(Правила)

	КодОшибки = КодыНативныхОшибок.HTTPНекорректныйОтвет();
	Сообщение = "ru = 'Получен некорректный HTTP-ответ'; en = 'Invalid HTTP response received'";

	ДобавитьПравило(
		Правила,
		"http.invalid_response.status_line",
		СпособыСопоставленияНативныхОшибок.ТипИОбрамление(),
		"System.Net.WebException",
		"Received an invalid status line:",
		"",
		КодОшибки,
		Сообщение
	);
	ДобавитьПравило(
		Правила,
		"http.invalid_response.status_code",
		СпособыСопоставленияНативныхОшибок.ТипИОбрамление(),
		"System.Net.WebException",
		"Received an invalid status code:",
		"",
		КодОшибки,
		Сообщение
	);
	ДобавитьПравило(
		Правила,
		"http.invalid_response.header_name",
		СпособыСопоставленияНативныхОшибок.ТипИОбрамление(),
		"System.Net.WebException",
		"Received an invalid header name:",
		"",
		КодОшибки,
		Сообщение
	);
	ДобавитьПравило(
		Правила,
		"http.invalid_response.header_line",
		СпособыСопоставленияНативныхОшибок.ТипИОбрамление(),
		"System.Net.WebException",
		"Received an invalid header line:",
		"",
		КодОшибки,
		Сообщение
	);
	ДобавитьПравило(
		Правила,
		"http.invalid_response.chunk_length",
		СпособыСопоставленияНативныхОшибок.ТипИОбрамление(),
		"System.Net.Http.HttpIOException",
		"Received chunk header length could not be parsed:",
		"(InvalidResponse)",
		КодОшибки,
		Сообщение
	);
	ДобавитьПравило(
		Правила,
		"http.invalid_response.chunk_terminator",
		СпособыСопоставленияНативныхОшибок.ТипИОбрамление(),
		"System.Net.Http.HttpIOException",
		"Received an invalid chunk terminator:",
		"(InvalidResponse)",
		КодОшибки,
		Сообщение
	);

КонецПроцедуры

Процедура ДобавитьПравилаHTTPЗаголовков(Правила)

	КодОшибки = КодыНативныхОшибок.HTTPНекорректныйЗаголовок();
	Сообщение = "ru = 'Недопустимый HTTP-заголовок'; en = 'Invalid HTTP header'";

	ДобавитьПравило(
		Правила,
		"http.invalid_header.content_length",
		СпособыСопоставленияНативныхОшибок.Точное(),
		"",
		"ru = 'Заголовок Content-Length задан неправильно'; en = 'Header Content-Length is invalid'",
		"",
		КодОшибки,
		Сообщение
	);
	ДобавитьПравило(
		Правила,
		"http.invalid_header.date",
		СпособыСопоставленияНативныхОшибок.Точное(),
		"",
		"ru = 'Заголовок Date задан неправильно'; en = 'Header Date is invalid'",
		"",
		КодОшибки,
		Сообщение
	);
	ДобавитьПравило(
		Правила,
		"http.invalid_header.if_modified_since",
		СпособыСопоставленияНативныхОшибок.Точное(),
		"",
		"ru = 'Заголовок If-Modified-Since задан неправильно'; en = 'Header If-Modified-Since is invalid'",
		"",
		КодОшибки,
		Сообщение
	);
	ДобавитьПравило(
		Правила,
		"http.invalid_header.range",
		СпособыСопоставленияНативныхОшибок.Точное(),
		"",
		"ru = 'Заголовок Range задан неправильно'; en = 'Header Range is invalid'",
		"",
		КодОшибки,
		Сообщение
	);
	ДобавитьПравило(
		Правила,
		"http.invalid_header.transfer_encoding",
		СпособыСопоставленияНативныхОшибок.ТипИОкончание(),
		"System.ArgumentException",
		"",
		"Chunked encoding must be set via the SendChunked property. (Parameter 'value')",
		КодОшибки,
		Сообщение
	);
	ДобавитьПравило(
		Правила,
		"http.invalid_header.connection",
		СпособыСопоставленияНативныхОшибок.ТипИОкончание(),
		"System.ArgumentException",
		"",
		"Keep-Alive and Close may not be set using this property. (Parameter 'value')",
		КодОшибки,
		Сообщение
	);
	ДобавитьПравило(
		Правила,
		"http.invalid_header.host",
		СпособыСопоставленияНативныхОшибок.ТипИОкончание(),
		"System.ArgumentException",
		"",
		"The specified value is not a valid Host header string. (Parameter 'value')",
		КодОшибки,
		Сообщение
	);

КонецПроцедуры

Процедура ДобавитьПравилаCOM(Правила)

	ДобавитьПравило(
		Правила,
		"com.active_object_not_supported",
		СпособыСопоставленияНативныхОшибок.ТипИОкончание(),
		"System.NotSupportedException",
		"",
		"Getting object by classname not supported on net6+",
		КодыНативныхОшибок.COMПолучениеАктивногоОбъектаНеПоддерживается(),
		"ru = 'Получение активного COM-объекта не поддерживается';"
			+ "en = 'Getting an active COM object is not supported'"
	);

КонецПроцедуры

Процедура ДобавитьПравилаВнешнихКомпонент(Правила)

	ДобавитьПравило(
		Правила,
		"component.invalid_format",
		СпособыСопоставленияНативныхОшибок.ТипИФрагмент(),
		"System.BadImageFormatException",
		"Bad IL format. The format of the file",
		"",
		КодыНативныхОшибок.ВнешняяКомпонентаНекорректныйФормат(),
		"ru = 'Некорректный формат внешней компоненты';"
			+ "en = 'External component has an invalid format'"
	);
	ДобавитьПравило(
		Правила,
		"component.creation_failed",
		СпособыСопоставленияНативныхОшибок.ПрефиксИФрагмент(),
		"",
		"Не удалось создать объект `",
		"",
		КодыНативныхОшибок.ВнешняяКомпонентаОбъектНеСоздан(),
		"ru = 'Не удалось создать объект внешней компоненты';"
			+ "en = 'External component object could not be created'",
		" внешней компоненты `"
	);

КонецПроцедуры

Процедура ДобавитьПравило(
	Правила,
	Идентификатор,
	Способ,
	НативныйТип,
	Начало,
	Окончание,
	КодОшибки,
	Сообщение,
	Фрагмент = "")

	ШаблонСообщения = "";
	Префикс = "";
	Если Способ = СпособыСопоставленияНативныхОшибок.Точное() Тогда
		ШаблонСообщения = Начало;
	ИначеЕсли Способ = СпособыСопоставленияНативныхОшибок.Префикс()
		Или Способ = СпособыСопоставленияНативныхОшибок.ПрефиксОкончание()
		Или Способ = СпособыСопоставленияНативныхОшибок.ПрефиксИФрагмент() Тогда
		Префикс = Начало;
	ИначеЕсли Способ = СпособыСопоставленияНативныхОшибок.ТипИФрагмент()
		Или Способ = СпособыСопоставленияНативныхОшибок.ТипИОбрамление() Тогда
		Фрагмент = Начало;
	КонецЕсли;

	Правило = Новый ПравилоКлассификацииНативныхОшибок(
		Способ,
		КодОшибки,
		Сообщение,
		НативныйТип,
		ШаблонСообщения,
		Префикс,
		Фрагмент,
		Окончание,
		Идентификатор
	);

	Правила.Добавить(Правило);

КонецПроцедуры

#КонецОбласти
