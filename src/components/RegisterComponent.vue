<template>
    <div class="col-11">
        <div class="row vh-100 d-flex align-items-center">
            <div class="col-1">
            </div>
            <div class="col-5">
                <h1 class="h2 mt-5">Seja bem vindo ao sistema de cadastro de funcionários</h1>
                <h1 class="h5 mt-5">Faça o seu cadastro</h1>
                <div>
                    <form>
                    <div>
                        <label>Nome</label>
                        <input type="text" class="form-control mt-2" v-model="username">
                    </div>
                    <div>
                        <label>Email</label>
                        <input type="text" class="form-control mt-2" v-model="email">
                    </div>
                    <div>
                        <label>Senha</label>
                        <input type="password" class="form-control mt-2" v-model="password">
                    </div>
                    <div>
                        <label>Confirme sua senha</label>
                        <input type="password" class="form-control mt-2" v-model="password2">
                    </div>
                    </form>
                        <div class="d-flex justify-content-center">
                        <div class="buttonSpace">
                            <router-link to="/" class="btn btn-success mt-2 buttonStyle">Voltar ao Início</router-link>
                        </div>
                        <div class="buttonSpace">
                            <button type="submit" class="btn btn-primary mt-2 buttonStyle" @click="registerUser">Registrar</button>
                        </div>
                        </div>
                </div>
            </div>
            <div class="col-5 imagem">
                <img src="../../public/img/imagem-quadrada.jpg" alt="Imagem de login" class="img-fluid">
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
                username: '',
                email: '',
                password: '',
                password2: ''
            }
        },

        methods: {
      async registerUser() {
        let config = {
            method: "post",
            maxBodyLength: Infinity,
            url: `http://localhost:3000/auth/register`,
            headers: {
            "Content-Type": "application/json",
        },
            data:{
            username: this.username,
            email: this.email,
            password: this.password
            },
        };

        if(this.username == '' || this.email == '' || this.password == '' || this.password2 == ''){
            alert("Preencha todos os campos")
        } else if(this.password.length < 6){
            alert("A senha deve conter no mínimo 6 caracteres")
        } else if(this.password2.length < 6){
            alert("A senha deve conter no mínimo 6 caracteres")
        }

        if(this.password != this.password2){
            alert("As senhas não conferem")
        } else {
            
        axios
        .request(config)
            .then((response) => {
            console.log(JSON.stringify(response.data));
            this.username = ''; this.email = ''; this.password = ''; this.password2 = '';
            })
            .catch((error) => {
            console.log(error);
            });
        }
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

.imagem {
    display: block; /* Mostrar a div normalmente */
  }

@media (max-width: 800px) {
  .imagem {
    display: none;
    visibility: hidden;
  }
}
</style>