Feature: Deleting an entry

  Rules:
  - when receiving "mongo.delete", removes the entry with the given id and returns "mongo.deleted"


  Background:
    Given an ExoCom server
    And an instance of this service
    And the service contains the entries:
      | CONTENT   | OWNER_ID |
      | Monday    | 1        |
      | Tuesday   | 1        |
      | Wednesday | 1        |


  Scenario: deleting an existing entry
    When sending the message "mongo.delete" with the payload:
      """
      id: '<%= @id_of 'Tuesday' %>'
      """
    Then the service replies with "mongo.deleted" and the payload:
      """
      id: /.+/
      content: 'Tuesday'
      owner_id: '1'
      """
    And the service now contains the entries:
      | CONTENT   | OWNER_ID |
      | Monday    | 1        |
      | Wednesday | 1        |


  Scenario: trying to delete a non-existing entry
    When sending the message "mongo.delete" with the payload:
      """
      id: 'zonk'
      """
    Then the service replies with "mongo.not-found" and the payload:
      """
      id: 'zonk'
      """
    And the service now contains the entries:
      | CONTENT   | OWNER_ID |
      | Monday    | 1        |
      | Tuesday   | 1        |
      | Wednesday | 1        |
