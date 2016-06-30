# classifier-manager

Мини-проект
Система управления деревом классификатора
=====================

 Ничего особенного, тем не менее перед вами веб-система создания и управления произвольным классификатором. Создано и работает на **Python/Django**. Интерфейс основан на **Twitter Bootstrap**. Создано как побочный продукт большого контентного проекта, наспех и без претензий на серьёзность. Тем не менее работает исправно, имеет удобный интерфейс и, возможно, кому-нибудь пригодится.

 # Что умеет система?

* **Добавлять разделы** дерева _(в корень и по одному)_ и подразделы _(в произвольное место и целым списком)_.
* **Переименовывать разделы и подразделы**.
* **Удалять разделы и подразделы**. Удаление раздела-родителя вызывает удаление всех его подразделов.
* **Назначать и удалять Alias-ы**. Система Alias-ов необходима из-за того, что некоторые разделы (с их подразделами) необходимо отображать одновременно в нескольких местах. Например, _«Детские велосипеды»_ хотелось бы отобразить и в разделе _«Товары для детей»_, и в разделе _«Спорт и отдых»_. Чтобы не плодить сущности — и поддерживать только одну ветку дерева подкатегорий для нескольких надкатегорий —  и созданы Alias-ы. Alias можно назначать как через выпадающие меню (с autocomplete-подсказками) так и с помощью Drag&Drop перетаскивания.
* **Переносить дерево-категорий** вместе со всеми своими подкатегориями от одной надкатегории в произвольное место дерева. Перенос осуществляется как с помощью выпадающего меню (с autocomplete-подсказками), так Drag&Drop перетаскиванием.

# Ограничения

* Вложенность дерева категорий зависит от количества этих категорий. Чем больше категорий, тем меньше уровней вложения поддерживает система. Так например, если в дереве-классиификаторе 100 тыс. категорий, то поддерживается вложенность до 32–34 уровней. Если дерево категорий менее тысячи — можно организовать уже до 50 уровней вложенности. Для 100 категорий -- вложенность может быть — 65 уровней.
* Перенос поддерева категорий в корень не предусмотрен. Можете сами дописать этот функционал.

------
Данная микросистема управление деревьями работает во внутренних интерфейсах [Торгово-логистического портала CargоToGo] (http://cargotogo.com) и [Маркет-плейс агрегатора окон «Онардия»] (http://oknardia.ru). Надеюсь, что проделанная работа пригодится и вам. Успехов в работе!




