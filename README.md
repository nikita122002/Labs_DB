# Labs_DB
# Харлап Никита гр053505 
## 1.Тема: Автосалон
## 2. Функциональные требования к проекту:
### Роли пользователей:
1. Клиент
2. Поставщик
3. Работник автосалона
### Возможности пользователей
- Клиент
  + Просмотреть филиалы и машины в них
  + Купить необходимый товар
  + Сделать заказ товара в необходимый филиал
  + добавить товар в корзину
  
- Поставщик
  + Осуществить поставку заказанных товаров в нужные филиалы.
  + Просматривать заказы от филиалов
  
- Работник  автосалона
  + Оформить продажу товара
  + Оформить заказ товара
  
## 3. Список сущностей БД: 
- Клиент
- Работник
- Поставщик
- Поставки
- Филиал автосалона
- Заказ
- Корзина
- Список товаров корзины
- Машина(товар)
- Продажа(товара)
- Лог пользователя
- Данные пользователей


## 4. Схематично изобразить не нормальзованную схему БД:
![image](https://github.com/nikita122002/Labs_DB/blob/main/lab2true.png)
## 5. Описать каждую сущность
-Клиент (связь с сущностями "Cart" типа one-to-one, "PurshaseOrder" ,"Sale" типа one to many , )
| Имя поля | Тип    | Описание  | Ограничения   |
|----------|---------|---------|---------------|
|CustomerID |smallserial |первичный ключ |PRIMARY KEY |
|PersonalDataID|smallserial |внешний ключ к данным  пользователя |FOREIGN KEY |
|PassportNumber |numeric |номер паспорта |UNIQUE |
|BranchID |smallserial |внешний ключ к автосалону в котором находится пользователь |FOREIGN KEY |

-Работник(связь с сущностями "PurshaseOrder" типа one-to-many , "Sale" тип one to many)
| Имя поля | Тип    | Описание  | Ограничения   |
|----------|---------|---------|---------------|
|EmployeeID |smallserial |первичный ключ |PRIMARY KEY |
|PersonalDataID|smallserial |внешний ключ к данным  пользователя |FOREIGN KEY |
|DateOfBirth |date |дата рождения |NOT NULL  |
|WorkExperience |smallint |стаж работы |NOT NULL |
|Position |varchar(50) |занимаемая должность |NOT NULL |
|BranchID |smallserial |внешний ключ к автосалону в котором работает сотрудник |FOREIGN KEY |

-Поставщик(связь с сущностями "PurshaseOrder" и "Delivery" типа one-to-many)
| Имя поля | Тип    | Описание  | Ограничения   |
|----------|---------|---------|---------------|
|ProviderID |smallserial |первичный ключ |PRIMARY KEY |
|PersonalDataID|smallserial |внешний ключ к данным  пользователя |FOREIGN KEY |
|Email |varchar(50) |почта поставщика |NOT NULL,UNIQUE | 
 
-Поставки
| Имя поля | Тип    | Описание  | Ограничения   |
|----------|---------|---------|---------------|
|DeliveryID|smallserial |первичный ключ |PRIMARY KEY |
|Date|date |дата поставки |NOT NULL  |
|Method|varchar(60)|способ доставки|NOT NULL|
|DeliveryPrice|money|сумма поставки|NOT NULL|
|ProviderID|smallserial|внешний ключ к поставщику осуществляющему поставки|FOREIGN KEY|
|CarID|smallserial|внешний ключ к товарам в поставке|FOREIGN KEY|
|BranchID|smallserial|внешний ключ к автосалону в который осуществляется поставка|FOREIGN KEY|

-Филиал автосалона(связь с сущностями "Car", "Customer", "Sale", "Delivery", "PurchaseOrder" типа one-to-many)
| Имя поля | Тип    | Описание  | Ограничения   |
|----------|---------|---------|---------------|
|BranchID|smallserial|первичный ключ|PRIMARY KEY|
|BranchAdress|varchar(60)|адрес автосалона|NOT NULL,UNIQUE|
|BranchName|varchar(30)|название автосалона|NOT NULL|

-Заказ 
| Имя поля | Тип    | Описание  | Ограничения   |
|----------|---------|---------|---------------|
|PurchaseOrderID|smallserial|первичный ключ|PRIMARY KEY|
|PlacementDate|date |дата отправки заказа |NOT NULL  |
|CompletionDate|date |дата получения заказа |  |
|EmployeeID|smallserial|внешний ключ на сотрудника оформившего заказ|FOREIGN KEY|
|BranchID|smallserial|внешний ключ на филиал в котором был оформлен заказ|FOREIGN KEY|
|CustomerID|smallserial|внешний ключ на клиента заказавший товар|FOREIGN KEY|
|CarID|smallserial|внешний ключ на заказанный товар|FOREIGN KEY|
|ProviderID|smallserial|внешний ключ на поставщика для заказа|FOREIGN KEY|

-Корзина(связь с сущностью "CartProduct" типа one-to-many)
| Имя поля | Тип    | Описание  | Ограничения   |
|----------|---------|---------|---------------|
|CartID|smallserial|первичный ключ|PRIMARY KEY|
|CustomerID|smallserial|внешний ключ на владельца корзины|FOREIGN KEY, UNIQUE|

-Список товаров корзины
| Имя поля | Тип    | Описание  | Ограничения   |
|----------|---------|---------|---------------|
|CartProductID|smallserial|первичный ключ|PRIMARY KEY|
|CartID|smallserial|внешний ключ на корзину в которой хранятся товары|FOREIGN KEY|
|CarID|smallserial|внешний ключ на товары|FOREIGN KEY|

-Машина(товар)(связь с сущностями "Delivery","CartProduct", "PurchaseOrder","Sale", типа one-to-many)
| Имя поля | Тип    | Описание  | Ограничения   |
|----------|---------|---------|---------------|
|CarID|smallserial|первичный ключ|PRIMARY KEY|
|Brand|varchar(30)|марка машины|NOT NULL |
|ReleaseYear|date|год выпуска|NOT NULL |
|Color|varchar(30)|цвет машины|NOT NULL |
|CarPrice|numeric|цена машины|NOT NULL |
|body type|varchar(30)|тип кузова|NOT NULL |
|CountryOfAssembly|varchar(30)|страна сборки|NOT NULL |
|BranchID|smallserial|внешний ключ на филиал которому принадлежит машина|FOREIGN KEY|
|IsBought|boolean|товар можно добавлять и удалять из корзины||

-Продажа(товара)
| Имя поля | Тип    | Описание  | Ограничения   |
|----------|---------|---------|---------------|
|SaleID|smallserial|первичный ключ|PRIMARY KEY|
|CarID|smallserial|внешний ключ на машину которую покупают|FOREIGN KEY|
|SalePrice|numeric|сумма покупки||
|CustomerID|smallserial|внешний ключ на покупателя|FOREIGN KEY|
|BranchID|smallserial|внешний ключ на филиал в котором осуществляется покупка|FOREIGN KEY|
|EmployeeID |smallserial |внешний ключ на сотрудника оформившего покупку|FOREIGN KEY |

- Лог пользователя 

| Имя поля | Тип    | Описание  | Ограничения   |
|----------|---------|---------|---------------|
|LogID |smallserial  | Первичный ключ    |PRIMARY KEY |
|PersonalDataID |smallserial |Внешний ключ для просмотра кем было сделано изменение  |FOREIGN KEY | 
|LogType | varchar(60)| Вывод типа действия |NOT NULL | 
|LogMsg |varchar(60) | Вывод информации о действии |NOT NULL|

-Данные пользователя
| Имя поля | Тип    | Описание  | Ограничения   |
|----------|---------|---------|---------------|
|PersonalDataID|smallserial  | Первичный ключ    |PRIMARY KEY |
|Name |varchar(30) |имя сотрудника |NOT NULL |
|Surname|varchar(30) |фамилия сотрудника |NOT NULL |
|Patronymic |varchar(30)|отчество сотрудника |NOT NULL |
|Phone |numeric|номер телефона |UNIQUE |

