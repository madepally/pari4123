<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Update_ownership</fullName>
        <field>OwnerId</field>
        <lookupValue>Health_Insurance</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Update ownership</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>New Lead Creation</fullName>
        <actions>
            <name>Follow_Up</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Rating</field>
            <operation>equals</operation>
            <value>Hot</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Lead Ownership</fullName>
        <actions>
            <name>Update_ownership</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Type_of_Insurance__c</field>
            <operation>equals</operation>
            <value>Health</value>
        </criteriaItems>
        <description>if the lead type is health, update the ownership of the lead to health queue</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <tasks>
        <fullName>Follow_Up</fullName>
        <assignedToType>owner</assignedToType>
        <description>Follow Up</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Follow Up</subject>
    </tasks>
</Workflow>
