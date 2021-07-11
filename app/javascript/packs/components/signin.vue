<template>
  <section>
    <header>
      <h2>Sign In</h2>
    </header>
    <form>
      <label for="email">Email:</label>
      <input type="text" id="email" name="email" size="20" placeholder="email@example.com">
      <label for="password">Password:</label>
      <input type="password" id="password" name="password" size="20" placeholder="password">
      <button type="submit">Submit</button>
      <p class="ask-account">
        Do you want to share video? Register <router-link to="/signup">here.</router-link>
      </p>
    </form>
  </section>
</template>
