<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Send_an_email_to_all_employees_alerting_about_the_new_position</fullName>
        <ccEmails>konduru.sruthi888@gmail.com</ccEmails>
        <description>Send an email to all employees alerting about the new position</description>
        <protected>false</protected>
        <recipients>
            <recipient>pari41231@gmail.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>pari4123@gmail.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/New_Position_Alert</template>
    </alerts>
    <fieldUpdates>
        <fullName>Update_Position_Status1</fullName>
        <field>Status__c</field>
        <literalValue>Closed - Not Approved</literalValue>
        <name>Update Position Status1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Status_of_Position</fullName>
        <field>Status__c</field>
        <literalValue>Open - Approved</literalValue>
        <name>Update Status of Position</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_close_date</fullName>
        <description>Update close date to current date</description>
        <field>Close_Date__c</field>
        <formula>TODAY()</formula>
        <name>Update close date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <outboundMessages>
        <fullName>Send_position_info_to_partner</fullName>
        <apiVersion>41.0</apiVersion>
        <endpointUrl>http://56.90.112.80:8080/admin/inbound</endpointUrl>
        <fields>C_Sharp__c</fields>
        <fields>C__c</fields>
        <fields>Close_Date__c</fields>
        <fields>CreatedById</fields>
        <fields>CreatedDate</fields>
        <fields>Educational_Qualifications__c</fields>
        <fields>Full_time__c</fields>
        <fields>Functional_Area__c</fields>
        <fields>Hiring_Manager__c</fields>
        <fields>Id</fields>
        <fields>JavaScript__c</fields>
        <fields>Job_Level__c</fields>
        <fields>Job_Responsibilities__c</fields>
        <fields>Maximum_Pay__c</fields>
        <fields>Minimum_Pay__c</fields>
        <fields>Name</fields>
        <fields>No_of_days_open__c</fields>
        <fields>Open_Date__c</fields>
        <fields>Ruby__c</fields>
        <fields>Status__c</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>pari4123@gmail.com</integrationUser>
        <name>Send position info to partner</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>New Position Alert</fullName>
        <actions>
            <name>Send_position_info_to_partner</name>
            <type>OutboundMessage</type>
        </actions>
        <actions>
            <name>Advertise_the_position</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Position__c.Status__c</field>
            <operation>equals</operation>
            <value>Open - Approved</value>
        </criteriaItems>
        <description>When a new position is created in the Org and when the status is updated to &quot;Open-Approved&quot; send out an email to all employees in the company &amp; assign task to the recruiter to advertise the position on a job portal</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Send_an_email_to_all_employees_alerting_about_the_new_position</name>
                <type>Alert</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Update close date</fullName>
        <actions>
            <name>Update_close_date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Position__c.Status__c</field>
            <operation>equals</operation>
            <value>Closed - Filled,Closed - Not Approved,Closed - Cancelled</value>
        </criteriaItems>
        <description>When the status is changed to Closed-filled or closed-cancelled or closed-not approved, update the close date to the field to the current date.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <tasks>
        <fullName>Advertise_the_position</fullName>
        <assignedTo>pari41231@gmail.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Please advertise the position with all details including educational qualifications.</description>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Advertise the position</subject>
    </tasks>
</Workflow>
