<template>
    <div class="col-11">
        <div class="row vh-90 d-flex align-items-center">
            <div class="col-6">
            </div>
            <div class="col-5 ">
                <h1 class="h2 mt-5">Seja bem vindo ao sistema de cadastro de funcionários</h1>
                <h1 class="h5 mt-5">Faça o seu cadastro</h1>
                <div>
                    <form>
                    <div>
                        <label>Login</label>
                        <input type="text" class="form-control mt-2" v-model="login">
                    </div>
                    <div>
                        <label>Email</label>
                        <input type="text" class="form-control mt-2" v-model="email">
                    </div>
                    <div>
                        <label>Senha</label>
                        <input type="text" class="form-control mt-2" v-model="password1">
                    </div>
                    <div>
                        <label>Confirme sua senha</label>
                        <input type="text" class="form-control mt-2" v-model="password2">
                    </div>
                    <div class="d-flex justify-content-center">
                    <div class="buttonSpace">
                        <button type="submit" class="btn btn-primary mt-2 buttonStyle" @click="exibirValor">Registrar</button>
                    </div>
                    <div class="buttonSpace">
                        <router-link to="/" class="btn btn-success mt-2 buttonStyle">Voltar ao Início</router-link>
                    </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: 'RegisterComponent',

        data() {
            return {
                login: '',
                email: '',
                password1: '',
                password2: ''
            }
        },

        methods: {
            exibirValor() {
            if(this.password1 != this.password2){
                alert("A confirmação de senha não é igual a senha")
            }
        },
        }
    }
</script>

<style>
.buttonSpace{
    margin: 10px;
}
.buttonStyle{
    width: 150px !important;
}
</style>