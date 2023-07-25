<template>
    <div>
        <div>
                <h1>Faça o seu cadastro</h1>
            <form>
                <label>Login</label>
                <input type="text"/>
                <!-- <input type="text" v-model="login" /> -->
                <label>Email</label>
                <input type="text"/>
                <!-- <input type="password" v-model="password" /> -->
                <label>Senha</label>
                <input type="text"/>
                <!-- <input type="password" v-model="password" /> -->
                <label>Confirme sua senha</label>
                <input type="text"/>
                <!-- <input type="password" v-model="password" /> -->
                <button type="submit">Registrar</button>
            </form>
        </div>
    </div>
</template>

<script>
    export default {
        name: 'RegisterComponent'
    }
</script>