# Lightning Dynamic Sobject Lookup
This can be used in Lightning Component for sObject lookup 

## Lookup to Account object search in All
```
<c:cmp_sObjectLookup sObjectAPIName="Account" sObjectLabelName="Accounts"/>
```

## Lookup to Account object search Accounts where Name starts with "Edge"
``` 
<c:cmp_sObjectLookup sObjectAPIName="Account" sObjectLabelName="Accounts" whereClause="WHERE Name like 'Edge%'"/>
```

<a href="https://githubsfdeploy.herokuapp.com">
  <img alt="Deploy to Salesforce"
       src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">
</a>
