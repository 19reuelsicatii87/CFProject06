/**
 * I am a new service
 */
component singleton {

	// DI
	 property name = "dao" inject = "DAO";

	/**
	 * Constructor
	 */
	MessageService function init(){
		
		return this;
	}

	/**
	 * list
	 */
	function list(){

		return messages = dao.list();

	}

	/**
	 * get
	 */
	function get(required message){	

		return dao.getById(message);

	}

	/**
	 * save
	 */
	function save(required message){	

		dao.save(message);

		//writeDump(message);
		//writeOutput("Message Service");
		//writeDump(rc);
		//abort;


	}

	/**
	 * update
	 */
	function update(required message){	

		dao.update(message);

	}


	/**
	 * delete
	 */
	function delete(required message){

		dao.deleteById(message);

	}


}