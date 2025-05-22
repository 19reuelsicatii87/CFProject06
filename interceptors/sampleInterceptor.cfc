component
{

    // Fires when ColdBox starts up
    
    function preProcess(event, interceptData)
    {
        // Get information about the event
        var rc = event.getCollection();
        //writeLog(file="myAppLog", text="Executing event: " & event.getCurrentEvent());
        writeOutput("<br>");
        writeOutput("Interceptor: preProcess: " & event.getCurrentEvent());
        //abort;
    }
    
    function preEvent(event, interceptData)
    {
        // Log post-processing details
        //writeLog(file="myAppLog", text="Finished executing event: " & event.getCurrentEvent());
        writeOutput("<br>");
        writeOutput("Interceptor: preEvent: " & event.getCurrentEvent());
    }
    
    function postEvent(event, interceptData)
    {
        // Log post-processing details
        //writeLog(file="myAppLog", text="Finished executing event: " & event.getCurrentEvent());
        writeOutput("<br>");
        writeOutput("Interceptor: postEvent: " & event.getCurrentEvent());
    }
    
    function preLayoutRender(event, interceptData)
    {
        // Log post-processing details
        //writeLog(file="myAppLog", text="Finished executing event: " & event.getCurrentEvent());
        writeOutput("<br>");
        writeOutput("Interceptor: preLayoutRender: " & event.getCurrentEvent());
    }
    
    function postLayoutRender(event, interceptData)
    {
        // Log post-processing details
        //writeLog(file="myAppLog", text="Finished executing event: " & event.getCurrentEvent());
        writeOutput("<br>");
        writeOutput("Interceptor: postLayoutRender: " & event.getCurrentEvent());
    }
    
    // This occurs after the layout+view is rendered and this event receives the produced content
    function preRender(event, interceptData)
    {
        // Log post-processing details
        //writeLog(file="myAppLog", text="Finished executing event: " & event.getCurrentEvent());
        writeOutput("<br>");
        writeOutput("Interceptor: preRender: " & event.getCurrentEvent());
    }

    
    // This occurs before any view is rendered
    function preViewRender(event, interceptData)
    {
        // Log post-processing details
        //writeLog(file="myAppLog", text="Finished executing event: " & event.getCurrentEvent());
        writeOutput("<br>");
        writeOutput("Interceptor: preViewRender: " & event.getCurrentEvent());
    }
    

    
    function preReinit(event, interceptData)
    {
        // Log post-processing details
        //writeLog(file="myAppLog", text="Finished executing event: " & event.getCurrentEvent());
        writeOutput("<br>");
        writeOutput("Interceptor: preReinit: " & event.getCurrentEvent());
    }
    

    
    function postViewRender(event, interceptData)
    {
        // Log post-processing details
        //writeLog(file="myAppLog", text="Finished executing event: " & event.getCurrentEvent());
        writeOutput("<br>");
        writeOutput("Interceptor: postViewRender: " & event.getCurrentEvent());
    }

    // This occurs after the content has been rendered to the buffer output
    function postRender(event, interceptData)
    {
        // Log post-processing details
        //writeLog(file="myAppLog", text="Finished executing event: " & event.getCurrentEvent());
        writeOutput("<br>");
        writeOutput("Interceptor: postRender: " & event.getCurrentEvent());
    }


    function postProcess(event, interceptData)
    {
        // Log post-processing details
        //writeLog(file="myAppLog", text="Finished executing event: " & event.getCurrentEvent());
        writeOutput("<br>");
        writeOutput("Interceptor: postProcess: " & event.getCurrentEvent());
    }


    // Interceptor: preProcess: main.index

    //     Interceptor: preEvent: main.index
    //             PreHandler triggered before action
    //             PostHandler triggered after action
    //     Interceptor: postEvent: main.index

    //         Interceptor: preLayoutRender: main.index
    //         Interceptor: postLayoutRender: main.index

    //             Interceptor: preRender: main.index

    //                 Multiple Calls based on # of views/components
    //                 ============================================== 
    //                 Interceptor: preViewRender: main.index
    //                 Interceptor: postViewRender: main.index


    //             Interceptor: postRender: main.index

    // Interceptor: postProcess: main.index
    
}