/**
 * Notify Me
 */
component {

	remote void function addNotification(Numeric id,String name,String email){
		var q = new Query(datasource="notifyme");
		q.setSQL("
			INSERT INTO notifications
			(pid,name,email,dateCreated,exported)
			VALUES
			(:pid,:name,:email,#now()#,0);
		");

		q.addParam(name="pid",value="#arguments.id#",cfsqltype="integer");
		q.addParam(name="name",value="#arguments.name#",cfsqltype="varchar");
		q.addParam(name="email",value="#arguments.email#",cfsqltype="varchar");

		try {
			q.execute();
		} catch(any e){
			// error handling
		}
		
	}

}