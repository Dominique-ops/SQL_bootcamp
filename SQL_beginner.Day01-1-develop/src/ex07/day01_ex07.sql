select order_date,
    CONCAT(
        person.name, 
        ' (age:', person.age,
        ')'
    ) AS person_information
from person_order
join person on person_order.person_id=person.id
order by order_date,person_information