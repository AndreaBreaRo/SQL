--CONSULTA

select d.idcars ,c.model_name , b.brand_name, a.company, d.purchase, d.license, d.color, d.km, f.insurancenames, e.policynumber  
from andrea_brea_rodriguez.egroup as a
join andrea_brea_rodriguez.brand b on a.idgroup = b.idgroup 
join andrea_brea_rodriguez.model c on c.idbrand  = b.idbrand 
join andrea_brea_rodriguez.cars d  on d.idmodel = c.idmodel 
join andrea_brea_rodriguez.insurance e on e.idcars =d.idcars
join andrea_brea_rodriguez.insurancenames f on f.idinsurancenames = e.idinsurancenames
