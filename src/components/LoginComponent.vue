<template>
    <div>
        <div class="col-11">
        
        <div class="row vh-100 d-flex align-items-center">
            <div class="col-1">   
            </div>
            <div class="col-5 imagem">
                <img src="../../public/img/imagem-quadrada.jpg" alt="Imagem de login" class="img-fluid">
            </div>
            <div class="col-1">   
            </div>
            <div class="login col-5 ml-5">
                <h1 class="h5 mt-5">Faça o seu login</h1>
                <div>
                    <form>
                    <div class="col-7">
                        <p v-if="badRequest" class="text-danger">Ops, seu login ou sua senha estão incorretos!!</p>
                        <input type="text" class="form-control mt-2" placeholder="Usuário"  v-model="username">
                        <p v-if="errorLogin" class="text-danger">O campo de login é obrigatório</p>
                    </div>
                    <div class="col-7">
                        <input type="password" class="form-control mt-2" placeholder="Senha" required v-model="password">
                        <p v-if="errorSenha" class="text-danger">O campo de senha é obrigatório</p>
                    </div>
                    </form>
                    <div>
                        <button class="btn btn-primary mt-3 buttonStyle" @click="loginApplication">Entrar</button>
                    </div>
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
    import axios from 'axios'

    export default {
        name: 'LoginComponent',

        data() {
            return {
                username: '',
                password: '',
                errorLogin: false,
                errorSenha: false,
                badRequest: false
            }
        },

        methods: {
        async loginApplication() {
            let config = {
                method: "post",
                maxBodyLength: Infinity,
                url: `http://localhost:3000/auth/login`,
                headers: {
                "Content-Type": "application/json",
            },
                data:{
                username: this.username,
                password: this.password
                },
            };

            

            if( !this.username || !this.password ){
                if(this.username === ''){
                    this.errorLogin = true
                    console.log("Entrou usuário")
                }
                if(this.password === ''){
                    this.errorSenha = true
                    console.log("Entrou senha")
                }
            } else {
            axios
            .request(config)
                .then((response) => {
                    const token = response.data.access_token;
                    this.token = token;
                    localStorage.setItem('token', token);
                    setTimeout(() => this.$router.push("/aplicationEmployee"), 1000)
                })
                .catch((error) => {
                    this.errorLogin = false;
                    this.errorSenha = false;
                    this.badRequest = true;
                console.log(error);
            });
            }
           
        },
    }
    }
</script>

<style>
.buttonStyle{
    width: 150px !important;
}


@media (max-width: 800px) {
  .imagem {
    display: none;
  }
}

</style>
