<template>
    <div>
        <div>
                <h1>Login</h1>
            <form>
                <label>Qual o seu login?</label>
                <input type="text"/>
                <!-- <input type="text" v-model="login" /> -->
                <label>Qual a sua senha?</label>
                <input type="text"/>
                <!-- <input type="password" v-model="password" /> -->
                <button type="submit">Entrar</button>
            </form>
        </div>
        <div>
            <p>Ainda não possui cadastro?</p>
            <button>Cadastre-se</button>
        </div>
    </div>
</template>

<script>
    export default {
        name: 'LoginComponent'
    }
</script>