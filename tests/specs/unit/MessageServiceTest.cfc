/**
 * The base model test case will use the 'model' annotation as the instantiation path
 * and then create it, prepare it for mocking and then place it in the variables scope as 'model'. It is your
 * responsibility to update the model annotation instantiation path and init your model.
 */
component
	extends="coldbox.system.testing.BaseModelTest"
	model="MessageService"
{

	/*********************************** LIFE CYCLE Methods ***********************************/

	function beforeAll(){
		super.beforeAll();

		// setup the model
		super.setup();

		// init the model object
		model.init();
	}

	function afterAll(){
		super.afterAll();
	}

	/*********************************** BDD SUITES ***********************************/

	function run(){

		describe( "MessageService Suite", function(){

			it( "can be created", function(){
				expect( model ).toBeComponent();
			} );

			it( "should list", function(){
				expect( false ).toBeTrue();
			});

			it( "should save", function(){
				expect( false ).toBeTrue();
			});

			it( "should update", function(){
				expect( false ).toBeTrue();
			});


		});

	}

}

