# Flutter_SoftwareDesign

## 1. Numbers Mason, what do they mean?
* Create 'Calculator' app.
* Application should have two modes: basic and scientific (see, well, any calculator for reference).
* Modes can be toggled via interface button.
* Each set of functions (numbers + basic functions and scientific functions) should be in separate fragments.
* For landscape device orientation app should always be in scientific mode.
* Create a 'demo' build flavor with only basic functions available for both screen orientations. User should be able to have both 'demo' and 'full' versions on device at the same time.
* Topics to cover: activities, fragments, views, controls, basic app architecture, product flavors.

## 2. Gotta note them all!
* Create 'Notes' application. (see Google Keep for reference).
* App should show a list or a grid of created notes depending on screen orientation (list for portrait and grid for landscape).
* Each note should consist of title, body and tag list. Title may not be empty. If user left it out empty, a current date should be used * instead. Tag list may be empty.
* List or grid may be sorted by date or note title. User can also browse notes by particular tag.
* Any data storage option may be used. Note list should be persisted across app launches.
* Try to use components from google material design. Take a look at android app architecture guides across internet to avoid common pitfalls.
* Topics to cover: activity lifecycle, fragment lifecycle, data storage, app architecture.

## 3. Yet another feed
* Create RSS reader application (see Flipboard for reference).
* On first launch app asks user to type in RSS feed URL. This can be changed later.
* RSS entities are displayed within list view. EAch entity should contain date, title, preview of content and an image (if provided by feed source).
* When user taps on list item, a WebView with full entity should be displayed.
* 10 recently fetched news should be cached and available to user even if no network is available.
* App should track and display network state (icon, snackbar, etc). User should be aware when app goes offline and online.
* All network operations should not block user interface and should have loading indicator if necessary.
Topics to cover: images, network, storage.
