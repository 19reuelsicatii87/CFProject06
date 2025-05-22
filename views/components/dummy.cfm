<cfoutput>

<section id="dummy">
    <div class='container py-3 px-2'>

        <div class="row my-5">

            <!--- event.buildLink(): queryString is String --->
            <h5>Sample 1 - event.buildLink()</h5>
            <ul class="list-group mb-5">

                <cfloop array="#prc.models#" index="model">
                    <a href="#event.buildLink(to='voge-dummy', queryString=model.chasis)#">
                        <li class="list-group-item" >#model.name# -- #model.price# -- #model.engine#</li>
                    </a>                    
                </cfloop>

            </ul>   

        

            <!--- event.buildLink(): queryString is Struct --->
            <h5>Sample 2 - event.buildLink()</h5>
            <ul class="list-group mb-5">

                <cfloop array="#prc.models#" index="model">
                    <a href="#event.buildLink(to='voge-dummy', queryString={"chasis":model.chasis})#">
                        <li class="list-group-item" >#model.name# -- #model.price# -- #model.engine#</li>
                    </a>                    
                </cfloop>

            </ul>  

            
        </div>

        <div class="row my-5">  

            <!--- event.route(): queryString is Struct --->
            <h5>Sample 1 - event.route()</h5>
            <ul class="list-group">

                <cfloop array="#prc.models#" index="model">              
                    <a href="#event.route(name='voge-dummy', params={"chasis":model.chasis})#">
                        <li class="list-group-item" >#model.name# -- #model.price# -- #model.engine#</li>
                    </a>                   
                </cfloop>

            </ul>  
            
        </div>

    </div>
</section>


</cfoutput>