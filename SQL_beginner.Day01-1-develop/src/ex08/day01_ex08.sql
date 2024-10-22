select order_date,
    CONCAT(
        person.name, 
        ' (age:', person.age,
        ')'
    ) AS person_information
from person_order
natural join person
order by order_date,person_information