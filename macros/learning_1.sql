{%- set foods = ['chicken nugget','radish','cucumber','tomatoes','pepper'] -%}

{%- for food in foods -%}
    {%- if food == 'chicken nugget' -%}
        {%- set food_type = 'snack' -%}
    {% else %}
        {%- set food_type = 'vegetable' -%}
    {%- endif -%}
    The food is {{ food_type }}

{% endfor %}