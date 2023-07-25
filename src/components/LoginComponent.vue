<template>
    <div>
        <div class="col-11">
        <div class="row vh-100 d-flex align-items-center">
            <div class="col-7">
            </div>
            <div class="col-5">
                <h1 class="h5 mt-5">Faça o seu login</h1>
                <div>
                    <form>
                    <div class="col-5">
                        <input type="text" class="form-control mt-2" placeholder="Login" v-model="login">
                    </div>
                    <div class="col-5">
                        <input type="text" class="form-control mt-2" placeholder="Senha" v-model="password">
                    </div>
                    <div>
                        <button type="submit" class="btn btn-primary mt-3 buttonStyle" @click="exibirValor">Entrar</button>
                    </div>
                    </form>
                </div>
                <div>
                    <p class="mt-5">Você ainda não possui cadastro?</p>
                    <div>
                        <router-link to="/register" class="btn btn-success buttonStyle">Cadastro</router-link>
                    </div>
                </div>
            </div>
        </div>
    </div>
        
    </div>
</template>

<script>

    export default {
        name: 'LoginComponent',

        data() {
            return {
                login: '',
                password: ''
            }
        },

        methods: {
            exibirValor() {
            console.log(this.login)
            console.log(this.password)
        },
  },
    }
</script>

<style>
.buttonStyle{
    width: 150px !important;
}
</style>
