## Robot Framework
- https://robotframework.org/
- https://github.com/robotframework/robotframework

### This test validate that following browsers are working.
- Firefox
- Chrome
- MS Edge

Specific Browser can be provided with `BROWSER` environment variable.  
Test can be executed like below.
```
BROWSER=Firefox robot 000-robotframework-test.robot

BROWSER=Chrome robot 000-robotframework-test.robot

BROWSER=Edge robot 000-robotframework-test.robot
```
