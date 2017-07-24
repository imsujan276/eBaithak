eBaithak - a simple video chat application made in JAVA SPRING

FEATURES
1. User register/signin
2. Chat chat group (baithak)
3. Add friends to the chat group ( Working on it)
4. Chat with friends 
5. Create a video call

NOTE:
1. create a database : ebaithak
2. change in webapp/WEB-INF/spring/appServlet/servlet-context.xml
	        <property name="hibernateProperties">
            <props>
                <prop key="hibernate.dialect">org.hibernate.dialect.MySQLDialect</prop>
                <prop key="hibernate.show_sql">true</prop>
                <prop key="hibernate.hbm2ddl.auto">create</prop> // to create fresh tables
                AND
                <prop key="hibernate.hbm2ddl.auto">Validate</prop> // after creating the tables in database
            </props>
        </property>