({
    doInit : function(component, event, helper) {
        var searchString = component.get("v.searchString");

        if(searchString) {
			var lookupPill = component.find("lookup-pill");
            $A.util.removeClass(lookupPill, 'slds-hide');
            // Lookup Div has selection
            var inputElement = component.find('lookup-div');
            $A.util.addClass(inputElement, 'slds-has-selection');            
        }
    },
	//Search an SObject for a match
    search : function(component, event, helper) {
        helper.doSearch(component);    
        helper.hideLookup(component);
    },
    //Select an SObject from a list
    select: function(component, event, helper) {
        // Resolve the Object Id from the events Element Id (this will be the <a> tag)
        var objectId = helper.resolveId(event.currentTarget.id);
        // The Object label is the inner text)
        var objectLabel = event.currentTarget.innerText;
        helper.handleSelection(component, event, objectId, objectLabel);
        
    },
    //Clear the currently selected SObject
    clear: function(component, event, helper) {
        helper.clearSelection(component);    
    },
    // Hide the Lookup List
    hideLookupList : function(component, event, helper) {
        var lookupList = component.find("lookuplist");
        $A.util.addClass(lookupList, "slds-hide");
        helper.hideLookup(component);
    }
})