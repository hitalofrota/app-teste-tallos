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
                        <input type="text" class="form-control mt-2" placeholder="Usuário" v-model="username">
                    </div>
                    <div class="col-5">
                        <input type="text" class="form-control mt-2" placeholder="Senha" v-model="password">
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
                password: ''
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

            console.log("data", this.username, this.password)
            axios
            .request(config)
                .then((response) => {
                    console.log(response)
                const token = response.data.access_token;
                this.token = token;
                localStorage.setItem('token', token);
                setTimeout(() => this.$router.push("/aplicationEmployee"), 1000)
                })
                .catch((error) => {
                console.log(error);
            });
        },
    }
    }
</script>

<style>
.buttonStyle{
    width: 150px !important;
}
</style>
