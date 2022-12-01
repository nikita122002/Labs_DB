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
  + Выбрать подходящий филиал автосалона
  + Купить необходимый товар
  + Сделать заказ товара в необходимый филиал
  
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

## 4. Схематично изобразить не нормальзованную схему БД:
![image](https://github.com/nikita122002/Labs_DB/blob/main/l1.png)
## 5. Описать каждую сущность:
-Клиент (связь с сущностями "Cart" типа one-to-one, "PurshaseOrder" типа one to many)
| Имя поля | Тип    | Описание  | Ограничения   |
|----------|---------|---------|---------------|
|CustomerID |smallserial |первичный ключ |PRIMARY KEY |
|Name |text |имя клиента |NOT NULL |
|Surname|text |фамилия клиента |NOT NULL |
|Patronymic |text |отчество клиента |NOT NULL |
|Phone |numeric|номер телефона |UNIQUE |
|PassportNumber |numeric |номер паспорта |UNIQUE |
|BranchID |smallserial |внешний ключ к автосалону в котором находится пользователь |FOREIGN KEY |

-Работник(связь с сущностями "PurshaseOrder" типа one-to-many)
| Имя поля | Тип    | Описание  | Ограничения   |
|----------|---------|---------|---------------|
|EmployeeID |smallserial |первичный ключ |PRIMARY KEY |
|Name |text |имя сотрудника |NOT NULL |
|Surname|text |фамилия сотрудника |NOT NULL |
|Patronymic |text |отчество сотрудника |NOT NULL |
|DateOfBirth |date |дата рождения |NOT NULL  |
|WorkExperience |smallint |стаж работы |NOT NULL |
|Position |text |занимаемая должность |NOT NULL |
|BranchID |smallserial |внешний ключ к автосалону в котором работает сотрудник |FOREIGN KEY |

-Поставщик(связь с сущностями "PurshaseOrder" и "Delivery" типа one-to-many)
| Имя поля | Тип    | Описание  | Ограничения   |
|----------|---------|---------|---------------|
|ProviderID |smallserial |первичный ключ |PRIMARY KEY |
|Name |text |имя поставщика |NOT NULL |
|Phone |numeric|номер телефона |UNIQUE|
|Email |text |почта поставщика |NOT NULL | 
 
-Поставки
| Имя поля | Тип    | Описание  | Ограничения   |
|----------|---------|---------|---------------|
|DeliveryID|smallserial |первичный ключ |PRIMARY KEY |
|Date|date |дата поставки |NOT NULL  |
|Method|text|способ доставки|NOT NULL|
|Price|money|сумма поставки|NOT NULL|
|ProviderID|smallserial|внешний ключ к поставщику осуществляющему поставки|FOREIGN KEY|
|CarID|smallserial|внешний ключ к товарам в поставке|FOREIGN KEY|
|BranchID|smallserial|внешний ключ к автосалону в который осуществляется поставка|FOREIGN KEY|

-Филиал автосалона(связь с сущностями "Car", "Customer", "Car", "Delivery" типа one-to-many)
| Имя поля | Тип    | Описание  | Ограничения   |
|----------|---------|---------|---------------|
|BranchID|smallserial|первичный ключ|PRIMARY KEY|
|Adress|text|адрес автосалона|NOT NULL|
|Name|text|название автосалона|NOT NULL|

-Заказ (связь с сущностями "Employee", "Branch", "Customer", "Car","Provider" типа one-to-many)
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

-Список товаров корзины()
| Имя поля | Тип    | Описание  | Ограничения   |
|----------|---------|---------|---------------|
|CartProductID|smallserial|первичный ключ|PRIMARY KEY|
|CartID|smallserial|внешний ключ на корзину в которой хранятся товары|FOREIGN KEY|
|CarID|smallserial|внешний ключ на товары|FOREIGN KEY|

-Машина(товар)(связь с сущностями "Delivery","CartProduct", "PurchaseOrder" типа one-to-many)
| Имя поля | Тип    | Описание  | Ограничения   |
|----------|---------|---------|---------------|
|CarID|smallserial|первичный ключ|PRIMARY KEY|
|Brand|text|марка машины|NOT NULL |
|ReleaseYear|date|год выпуска|NOT NULL |
|Color|text|цвет машины|NOT NULL |
|Price|money|цена машины|NOT NULL |
|body type|text|тип кузова|NOT NULL |
|CountryOfAssembly|text|страна сборки|NOT NULL |
|BranchID|smallserial|внешний ключ на филиал которому принадлежит машина|FOREIGN KEY|
