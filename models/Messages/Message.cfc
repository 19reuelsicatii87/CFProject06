component accessors="true" {

    property name="id" type="numeric";
    property name="fullname" type="string" default="";
    property name="email" type="string" default="";
    property name="number" type="string" default="";
    property name="message" type="string" default="";
    property name="timestamp" type="date";

    function init() {
        if (!isDefined("variables.timestamp")) {
            variables.timestamp = now();
        }
        return this;
    }

}
