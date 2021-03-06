require 'sqlite3'

db = SQLite3::Database.new("maniak.db")

sql = <<SQL
insert into persons (id, name) values (1, 'Чарльз Мэнсон');
insert into persons (id, name) values (2, 'Александр Пичушкин');
insert into persons (id, name) values (3, 'Андрей Чикатило');
insert into persons (id, name) values (4, 'Альберт Фиш');
insert into persons (id, name) values (5, 'Анатолий Оноприенко');
insert into persons (id, name) values (6, 'Дэвид Берковиц');
insert into persons (id, name) values (7, 'Генри Ли Лукас');
insert into persons (id, name) values (8, 'Джеффри Дамер');
insert into persons (id, name) values (9, 'Зодиак');
insert into persons (id, name) values (10, 'Ричард Рамирез');
insert into persons (id, name) values (11, 'Тед Банди');


insert into quotes (person_id, body) values (1, 'Вам давно пора оглянуться на самих себя. Вы живете лишь ради денег. Но ваш конец близок. Вы сами убиваете себя…');
insert into quotes (person_id, body) values (1, 'Когда вы в детстве катались на велосипеде, я сидел в построенной вами камере и смотрел в окно. Я разглядывал картинки в журналах и мечтал о том, что и я мог бы ходить в школу и на вечеринки, мечтал делать все то, что делали вы. Но все напрасно. А теперь я так рад, так рад, братья и сестры, что я — это я!');
insert into quotes (person_id, body) values (1, 'Я и так уже мертв. Я был мертвецом всю свою жизнь. Я жил в гробу, который вы сколотили для меня. Я отсидел 7 лет за чек на 37 с половиной долларов. Я отсидел 12 лет за то, что у меня не было родителей…');
insert into quotes (person_id, body) values (1, 'Чтобы не попасть в тюрьму, мне приходилось искать себе пищу у вас на помойках. Мне приходилось донашивать ваши обноски. Я сделал все, что мог, чтобы приспособиться к вашему миру, а вы теперь хотите убить меня…');
insert into quotes (person_id, body) values (1, 'Я оставался глупым ребенком, наблюдавшим за тем, как развивался мир, в котором жили вы…');
insert into quotes (person_id, body) values (1, 'Я еще не решил, кто я или что я. Мне дали имя и номер и посадили в камеру. Я жил в камере с именем и номером… Я никогда не ходил в школу, поэтому так и не научился уважать грамоту, не научился ни грамотно писать, ни хорошо читать. Поэтому я и остался в тюрьме.');
insert into quotes (person_id, body) values (1, 'Мы должны осознать, что мы не лучше, чем ЖИВОТНЫЕ.
Мы не лучше, чем зоопарк.');
insert into quotes (person_id, body) values (1, 'Воздух, Деревья и Вода — это наш дух.
Без Воды и Деревьев не может быть спасения.');
insert into quotes (person_id, body) values (1, 'Воздух — это Бог, потому что без Воздуха мы не существуем.');
insert into quotes (person_id, body) values (1, 'Не обращайтесь с собаками подобно людям. Обращайтесь с собаками подобно собакам. Они лучше чем люди.');
insert into quotes (person_id, body) values (1, 'Вы ждете, что я сломаюсь? Это невозможно. Вы сломали меня много лет назад. Вы убили меня много лет назад…');
insert into quotes (person_id, body) values (1, 'Люди большей частью уже мертвы в своих пронизанных материнским сознанием страхах, сомнениях и смятениях.');
insert into quotes (person_id, body) values (1, 'Дерьмо — всё равно что сахар для мух. Когда они не могут пить вашу кровь, они едят дерьмо, чтобы жить. Вы плодите слишком много людей, которые живут приятно и легко, не видят и не знают реальности. Те, кто выдвигал лозунг «Убей свинью и разрушь систему», играли всего лишь роль пугала для центров управления этой системой, и они теперь оказались переодетыми в вашу униформу, пересажены в ваши суды и в ваши комитеты, но страх опутывает ваше сознание и не даст вам расслабиться.');
insert into quotes (person_id, body) values (1, 'Я — никто. Я бомж, бродяга. Я окна автомобиля. Кувшин с вином. Острая бритва, если ко мне подойти слишком близко.');
insert into quotes (person_id, body) values (1, 'Рабы денег — вообще не люди.');
insert into quotes (person_id, body) values (1, '— Все пытаются обвинять. Потому что не хотят смотреть внутрь себя.
— А что вы видите, смотря в себя?
— Внутрь себя? Я вижу всё… Всё подряд. Я вижу хорошее, плохое, зло. Вижу всю картину.
— И сколько же зла вы увидели?
— Столько, сколько и вы.
— Так что вы видите?
— Всех вас. Вижу мир, который вы не завоевали. Разум бесконечен. Бросьте меня в глухую темницу, для вас — это был бы конец… а для меня — это всего лишь начало. Там целый мир, где я свободен. Мир, который вы не завоевали!');
insert into quotes (person_id, body) values (1, 'Я знаю, что я дурак. Я признаю. Я — жалкий… неважно. Я не достиг успеха ни в чем. Я не достиг того уровня, когда уже не хочу быть успешным. А что такое успех? Что это значит? Деньги? У меня трижды были деньги всего мира… и я их отдал. Это — маленькая глупая игра.');
insert into quotes (person_id, body) values (1, 'Музыка рождается и льется из души. Это наш Бог, наша религия. Внутри их душ нет истинной музыки. Они выеживаются и делают джаз за чьи-то баксы или за прелести смазливой бабенки.');
insert into quotes (person_id, body) values (1, 'Знаете ли вы, что значит иметь своё собственное мнение в мире запрограмированных типовых роботов? Иметь своё собственное мнение означает тотальную свободу, а это безумие. Вы обращаетесь к врачу и сообщаете ему, что вы — Бог, он смотрит на вас, как будто бы вы сумасшедший. Он и в Бога-то не верит, вот поэтому он и психиатр.');
insert into quotes (person_id, body) values (1, 'Ваше общество так извращено, что нормальный человек в нём предстанет безумцем.');
insert into quotes (person_id, body) values (1, 'Посмотрите на меня сверху вниз — и увидите дурака. Посмотрите на меня снизу вверх — и увидите господина. Посмотрите мне прямо в лицо — и увидите себя!');
insert into quotes (person_id, body) values (1, 'Я вычеркнул себя из вашего мира.');
insert into quotes (person_id, body) values (1, 'Я таков, каким вы меня сделали, и если вы называете меня бешеной собакой, дьяволом, убийцей, то учтите, что я — зеркальное отражение вашего общества.');
insert into quotes (person_id, body) values (1, 'Я король в моем королевстве, даже если это — королевство помойных ям…');
insert into quotes (person_id, body) values (1, 'Если бы я захотел, я смог бы убить любого из вас.');
insert into quotes (person_id, body) values (1, '— Мое племя — это люди из вашего общества, — вы их выбросили, а я подобрал. Это вы народили своих детей. Это вы сделали из них то, чем они стали… Вам давно пора оглянуться на самих себя. Вы живете лишь ради денег. Но ваш конец близок. Вы сами убиваете себя…');
insert into quotes (person_id, body) values (2, 'Я не могу убивать на скорую руку. Мне нужно порезвиться, побегать, попугать…');
insert into quotes (person_id, body) values (2, 'Он сбежал. И попал ко мне в руки. Если бы не сбежал – жил бы. И, может быть, не пил… Хотя он и сейчас не пьет…');
insert into quotes (person_id, body) values (2, 'К каждому у меня был персональный подход… Например, в случае с Климовым я выяснил, что его интересует. А он хотел бросить пить. Обещаю, говорю ему, что ты с сегодняшнего дня перестанешь. И он перестал.');
insert into quotes (person_id, body) values (2, 'Я их не рассматривал. Они для меня были потенциально мертвы. И вообще, гражданин судья! Меня утомляют эти рассказы. Они, конечно, романтичны, но выматывают. А надо вспомнить всех. Мы же христиане. Покойники имеют на это право.');
insert into quotes (person_id, body) values (2, 'Вот уже 500 дней я нахожусь под арестом, и все эти дни огромное количество народа решает мою судьбу – менты, следаки, судьи, прокуроры, присяжные, эксперты… Сотни людей решают судьбу одного человека, тогда как я один решил судьбы 63-х человек! Нет, пожалуй, шестидесяти, троих можно не считать… Я один был для них прокурором, присяжным, судьей и палачом. Выполнил все ваши функции. Я был почти что Бог! Почувствуйте разницу.');
insert into quotes (person_id, body) values (3, 'Конечно, я мог бы стать алкашом, заглушать свои жизненные потребности. Но не для этого я изучал философские воззрения всех времен и народов, проходил университеты — жизненные и учебные, чтобы затравить свое сознание.');
insert into quotes (person_id, body) values (3, 'Я делал это не ради сексуального удовлетворения. Скорее, это меня несколько умиротворяло.');
insert into quotes (person_id, body) values (4, 'Какой восторг — умереть на электрическом стуле! Это будет высшее наслаждение — единственное, которого я еще не испытывал!');
insert into quotes (person_id, body) values (4, 'У меня нет особого желания жить. У меня нет особого желания умереть. Для меня это безразлично.');
insert into quotes (person_id, body) values (4, 'Мне всегда хотелось причинять боль другим, и заставлять других причинять боль мне.');
insert into quotes (person_id, body) values (4, 'Счастлив тот, кто берет малых сих и разбивает головы их о камни.');
insert into quotes (person_id, body) values (4, 'Блажен человек, направляющий своего сына на путь истинный, в коем он будет восхищен бичеванием.');
insert into quotes (person_id, body) values (5, 'Если совершается несколько одинаковых убийств, то потом люди начнут бояться, отдадут все сами и еще укажут, кого можно ограбить.');
insert into quotes (person_id, body) values (5, 'Людей мне не было жалко и сейчас не жалко. Просто я по-другому воспринимаю эту жизнь, все по-другому воспринимаю.');
insert into quotes (person_id, body) values (5, 'Я наводил ужас на людей, я даже не прятался.');
insert into quotes (person_id, body) values (5, 'Я часто вижу сон, будто я очень больших размеров, и лечу над землей, меня поддерживают какие-то люди из Запада, а восточники внизу становятся на колени и просят меня…');
insert into quotes (person_id, body) values (5, 'Я хотел показать бессилие людей, чтобы они боялись выходить на улицу.');
insert into quotes (person_id, body) values (5, 'Нет такой тюрьмы, из которой нельзя было бы сбежать, есть сверхъестественные силы, которые помогут мне в этом.');
insert into quotes (person_id, body) values (5, 'Люди сейчас не ценят жизнь, они по мелочам начинают выбрасывать какие-то свои националистические, шовинистические, фашистские такие вот всплески. А чтобы им мозги вставить, они должны видеть все эти ужасы сами: генералы должны видеть эти ужасы, политики, тогда им сразу перехочется драться…');
insert into quotes (person_id, body) values (5, 'Если вам много раз снится, что вы совершаете убийство, а потом, хорошенечко не проснувшись, делаете наяву то же самое — то делать это не страшно.');
insert into quotes (person_id, body) values (5, 'Вижу — по дороге идет мужчина. Я догнал его и сказал: «Давай деньги!». Он «послал» меня подальше. Тогда я решил, что убью его.');
insert into quotes (person_id, body) values (5, 'Я не просто убивал людей, я охотился на них, как зверь на зверей.');
insert into quotes (person_id, body) values (5, 'Паспорта у меня не было, зато я постоянно носил с собой обрез. Он был у меня вместо паспорта. Если бы кто попросил предъявить паспорт, я бы достал обрез, я бы стрелял.');
insert into quotes (person_id, body) values (5, 'Подбежав к ним на расстояние пять-семь метров, крикнул: «Деньги!» и выстрелил в мужчину.');
insert into quotes (person_id, body) values (5, 'Смотрю: в одной комнате спит девочка, в другой — молодая женщина лет 25. У нормального человека могла бы появиться мысль: связать и изнасиловать.');
insert into quotes (person_id, body) values (5, 'Когда я жил в Днепрорудном, у меня возле кровати всегда стояла заряженная винтовка. Попробовал бы меня кто-нибудь ограбить!');
insert into quotes (person_id, body) values (5, 'Это я делал не как человек, а как зверь. Зверство содеянного стояло на первом плане.');
insert into quotes (person_id, body) values (5, 'Я хотел, чтобы люди боялись спать, боялись жить.');
insert into quotes (person_id, body) values (5, 'Сегодня открытая жизнь, какой-нибудь бизнесмен или спортсмен — это голимая мишень, за которой постоянно кто-то охотится.');
insert into quotes (person_id, body) values (6, 'Я чувствую себя посторонним. Я не на той волне, что и все остальные — запрограммирован на убийство.');
insert into quotes (person_id, body) values (6, 'Я не хотел причинять им боль. Я просто хотел их убить.');
insert into quotes (person_id, body) values (6, 'Меня всегда возбуждали убийства и смерть.');
insert into quotes (person_id, body) values (7, 'Убить кого-нибудь — так же просто, как выйти за дверь. Когда мне хотелось убить, я просто шел и находил жертву.');
insert into quotes (person_id, body) values (7, 'Я не чувствую, что со мной что-то не так, я это знаю!');
insert into quotes (person_id, body) values (7, 'Мне было горько смотреть на этот мир. Я ненавидел все. Мне ничего не нравилось. Я испытывал такую горечь и злость, какие только могут существовать на свете.');

SQL

db.execute_batch( sql )