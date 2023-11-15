Feature: Practica Data-Driven Testing


  Background:
    * def response =  call read('classpath:examples/users/login.feature@login') {"email": "eve.holt@reqres.in", "password": "12345678"}
    * def token = response.authToken
    * url urlBase
    * header Autorization = "Bearer "+token

  Scenario: Creando usuario con token
    Given path "/api/users"
    And request {"name": "morpheus","job": "leader"}
    When method post
    Then status 201

  Scenario Outline:  Crear usuario  con CSV
    Given path "/api/users"
    And request {name: '#(name)',job: '#(job)'}
    When method post
    Then status 201
    Examples:
      | read('users.csv') |

  Scenario Outline:  Crear usuario  con CSV - <id> - <name>
    Given path "/api/users"
    And request { name: '#(name)', job: '#(job)' }
    When method post
    Then status 201
    Examples:
      | read('users1.csv') |


