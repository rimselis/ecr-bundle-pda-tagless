<script src="http://quickshift-kc-sales-demo.lab.entando.org/auth/js/keycloak.js"></script>
<script>
 const keycloak = Keycloak('/entando-de-app/keycloak.json');
  function createKcDispatcher(payload) {
    return () =>
      window.dispatchEvent(new CustomEvent("keycloak", { detail: payload }));
  }
  keycloak.onReady = createKcDispatcher({ eventType: "onReady" });
  keycloak.onAuthSuccess = createKcDispatcher({
    eventType: "onAuthSuccess"
  });
  keycloak.onAuthError = createKcDispatcher({
    eventType: "onAuthError"
  });
  keycloak.onAuthRefreshSuccess = createKcDispatcher({
    eventType: "onAuthRefreshSuccess"
  });
  keycloak.onAuthRefreshError = createKcDispatcher({
    eventType: "onAuthRefreshError"
  });
  keycloak.onAuthLogout = createKcDispatcher({
    eventType: "onAuthLogout"
  });
  keycloak.onTokenExpired = createKcDispatcher({
    eventType: "onTokenExpired"
  });
  const onInit = createKcDispatcher({ eventType: 'onInit' });
  window.entando = {
    ...(window.entando || {}),
    keycloak
  };
  window.entando.keycloak.init({ onLoad: "check-sso" }).success(onInit);
</script>
