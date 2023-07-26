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
                        <label>Nome</label>
                        <input type="text" class="form-control mt-2" v-model="name">
                    </div>
                    <div>
                        <label>Email</label>
                        <input type="text" class="form-control mt-2" v-model="email">
                    </div>
                    <div>
                        <label>Senha</label>
                        <input type="text" class="form-control mt-2" v-model="password">
                    </div>
                    <div>
                        <label>Confirme sua senha</label>
                        <input type="text" class="form-control mt-2" v-model="password2">
                    </div>
                    </form>
                        <div class="d-flex justify-content-center">
                        <div class="buttonSpace">
                            <button type="submit" class="btn btn-primary mt-2 buttonStyle" @click="registerUser">Registrar</button>
                        </div>
                        <div class="buttonSpace">
                            <router-link to="/" class="btn btn-success mt-2 buttonStyle">Voltar ao Início</router-link>
                        </div>
                        </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios'

    export default {
        name: 'RegisterComponent',

        data() {
            return {
                name: '',
                email: '',
                password: '',
                password2: ''
            }
        },

        methods: {
      async registerUser() {
        const data = {
            name: this.name,
            email: this.email,
            password: this.password
        };

        const url = 'http://localhost:3000/users';

        await axios.post(url, data)
            .then(response => {
            console.log('Resposta do servidor:', response.data);
            this.name = "", this.email = "",this.password = "",this.password2 = ""
            })
            .catch(error => {
            console.error('Erro na requisição:', error);
            });
        }
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