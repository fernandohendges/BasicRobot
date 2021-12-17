# Basic-Robot
This is a basic project for automating web tests with
Robot Framework.
<br>
<br>
## Applications

**Web:** [Automation Practice](http://automationpractice.com/index.php)
<br>
<br>
## Robot Framework
- Enables easy-to-use **tabular syntax** for creating test cases in a uniform way
- Provides ability to create **reusable higher-level keywords** from the existing keywords
- Is **platform and application independent**
- Provides a simple library API for **creating customized test libraries** which can be implemented natively with either **Python or Java**
- Provides easy-to-read **result reports and logs** in **HTML format**
- Supports creating **data-driven test cases**
<br>
<br>
##  Installation
### Install Robot Framework 
- `pip install robotframework`
- Verify if it was installed: `robot --version` or `pip show robotframework`
<br>
<br>
### Install the Libraries    
- Install SeleniumLibrary: `pip install --upgrade robotframework-seleniumlibrary`
- Install HTTP RequestsLibrary: `pip install --upgrade robotframework-requests`
- Install Faker: `pip install --upgrade robotframework-faker`
- Check the list of installed libraries: `pip list`
<br>
<br>
### Web Drivers (for web testing)
Download and extract the executable files of correspondent Operational System:
- Firefox (select the latest version): https://github.com/mozilla/geckodriver/releases
- Chrome (select the version according to chrome browser's version): https://chromedriver.chromium.org/downloads
<br>
<br>
### Extensions for Visual Studio Code
- **Robot Framework Intellisense** *by Tomi Turtiainen* supports Robot Framework development
<br>
<br>
## Usage

**Run all tests:**
`robot Tests`
<br>
<br>
## References
- [Robot Framework User Guide](https://robotframework.org/robotframework/2.8.7/RobotFrameworkUserGuide.html)
- [BuiltIn Library](http://robotframework.org/robotframework/latest/libraries/BuiltIn.html)
- [Selenium Library](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html)
- [Collections Library](http://robotframework.org/robotframework/latest/libraries/Collections.html)
- [Faker Library](https://guykisel.github.io/robotframework-faker/)
- [Requests Library](https://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html)

## License
[MIT](https://choosealicense.com/licenses/mit/)