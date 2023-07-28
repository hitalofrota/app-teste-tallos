<template>
    <div class="container mt-4">
        <div class="d-flex justify-content-between">
            <button class="btn btn-primary mb-3" @click="createModal()">Adicionar novo Usuário</button>
            <button class="btn btn-secondary mb-3" @click="logout">Sair da aplicação</button>
        </div>
      <table class="table table-bordered custom-table">
        <thead>
          <tr>
            <th>Índice</th>
            <th>ID</th>
            <th>Nome</th>
            <th>Email</th>
            <th>Ações</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(user, index) in users" :key="user.id">
            <td>{{ index + 1 }}</td>
            <td>{{ user._id }}</td>
            <td>{{ user.username }}</td>
            <td>{{ user.email }}</td>
            <td>{{ user.isAdmin ? 'Administrador' : 'Usuário' }}</td>
            <td>
              <button class="btn btn-primary btn-sm" @click="editModal(user)">Editar</button>
              <button class="btn btn-danger btn-sm" @click="removeModal(user)">Excluir</button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>

    <div class="container mt-4">
        <!-- Modal De Criação-->
    <div class="modal col-6" ref="createModal1">
      <div class="modal-content">
        <!-- Conteúdo do modal -->
        <div class="modal-header">
          <h5 class="modal-title">Cadastro de novo cliente</h5>
          <button type="button" class="close" data-dismiss="modal" @click="closeCreateModal" aria-label="Fechar">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="form-group">
            <label for="name">Nome:</label>
            <input type="text" class="form-control" id="name" v-model="nameCreateEmployee">
          </div>
          <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" class="form-control" id="email" v-model="emailCreateEmploye">
          </div>
          <div class="form-group">
            <label for="password">Senha:</label>
            <input type="password" class="form-control" id="password" v-model="passwordCreateEmploye">
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal" @click="closeCreateModal">Cancelar</button>
          <button type="button" class="btn btn-primary" @click="confirmCreateModal">Confirmar</button>
        </div>
      </div>
    </div>

    <!-- Modal de Edição-->
    <div class="modal col-6" ref="myModal">
      <div class="modal-content">
        <!-- Conteúdo do modal -->
        <div class="modal-header">
          <h5 class="modal-title">Cadastro</h5>
          <button type="button" class="close" data-dismiss="modal" @click="closeModal" aria-label="Fechar">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="form-group">
            <label for="name">Nome:</label>
            <input type="text" class="form-control" id="name" v-model="nameEdit">
          </div>
          <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" class="form-control" id="email" v-model="emailEdit">
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal" @click="closeModal">Cancelar</button>
          <button type="button" class="btn btn-primary" @click="confirmModal">Confirmar</button>
        </div>
      </div>
    </div>

    <!-- Modal de exclusão -->
    <div class="modal col-6" ref="removeModal">
      <div class="modal-content">
        <!-- Conteúdo do modal -->
        <div class="modal-header">
          <h5 class="modal-title">Remoção de usuário</h5>
          <button type="button" class="close" data-dismiss="modal" @click="closeRemoveModal" aria-label="Fechar">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
            <p class="ml-4">Você realmente deseja excluir este usuário?</p>
            <p>Essa ação pode ser irreversível</p>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal" @click="closeRemoveModal">Cancelar</button>
          <button type="button" class="btn btn-primary" @click="confirmRemoveModal">Confirmar</button>
        </div>
      </div>
    </div>

    <div>
  </div>
  </div>

  </template>

<script>
import axios from 'axios'

export default {
        name: 'ListEmployees',

        data() {
    return {
        username: '',
        email: '',
        password: '',
        users: [],
        nameCreateEmployee: '',
        emailCreateEmploye: '',
        passwordCreateEmploye: '',
        nameEdit: '',
        emailEdit: '',
        userId: null,
    };
  },

  mounted() {
    const validator = localStorage.getItem('token');
    if (validator == null) {
        this.$router.push("/");
    } else {
        this.getUsers()
    }

    const token = localStorage.getItem('token'); 
    if (token) {
        try {
        const decodedToken = JSON.parse(atob(token.split('.')[1]));
        this.isAdmin = decodedToken.isAdmin;
        this.userName = decodedToken.username;
    } catch (error) {
        console.error('Erro ao decodificar o token:', error.message);
  }}
},

  methods: {
    //Request Usuário
    async getUsers() {
            const tokenJWT = await localStorage.getItem('token')
            let config = {
            method: "get",
            maxBodyLength: Infinity,
            url: "http://localhost:3000/users",
            headers: {
                Authorization: `Bearer ${tokenJWT}`,
            },
         };
        await axios
        .request(config)
        .then((response) => {
          console.log(response.data)
          this.users = response.data
        })
        .catch((error) => {
          console.log(error);
        });
    },

    async getOneUser(params) {
            const tokenJWT = await localStorage.getItem('token')
            let config = {
            method: "get",
            maxBodyLength: Infinity,
            url: `http://localhost:3000/users/${params}`,
            headers: {
                Authorization: `Bearer ${tokenJWT}`,
            },
         };
        await axios
        .request(config)
        .then((response) => {
          console.log(response.data)
          this.users = response.data
        })
        .catch((error) => {
          console.log(error);
        });
    },
    
    //Modal de Criação
    createModal() {
        this.$refs.createModal1.style.display = 'block';
        document.body.style.overflow = 'hidden'; 
    },
    closeCreateModal() {
        this.$refs.createModal1.style.display = 'none';
        document.body.style.overflow = 'auto'; 
    },
    confirmCreateModal() {
        this.registerUser()
        this.closeCreateModal();
    },

  //criar um usuário
  async registerUser() {
        const data = {
            username: this.nameCreateEmployee,
            email:  this.emailCreateEmploye,
            password: this.passwordCreateEmploye
        };

        const url = 'http://localhost:3000/users';

        await axios.post(url, data)
            .then(response => {
            console.log("Cliente adicionado", response)
            this.getUsers()
            this.username = "", this.email = "", this.password = ""
            })
            .catch(error => {
            console.error('Erro na requisição:', error);
            });
        },

        //Modal de Edição
    editModal(user) {
        this.$refs.myModal.style.display = 'block';
        document.body.style.overflow = 'hidden'; 
        this.nameEdit = user.username
        this.emailEdit = user.email
        this.idEdit = user._id
    },
    closeModal() {
        this.$refs.myModal.style.display = 'none';
        document.body.style.overflow = 'auto'; 
    },

    confirmModal() {
        const params = this.idEdit
        this.editUser(params)
        this.closeModal();
    },

    //editar um usuário
    async editUser(params) {
        const tokenJWT = await localStorage.getItem('token')
        let config = {
                method: "patch",
                maxBodyLength: Infinity,
                headers: {
                    Authorization: `Bearer ${tokenJWT}`,
        },
                url: `http://localhost:3000/users/${params}`,
                data:{
                    username: this.nameEdit,
                    email: this.emailEdit
                },
            };

            console.log("data", this.username, this.password)
            axios
            .request(config)
                .then((response) => {
                    console.log(response)
                    this.getUsers()
                })
                .catch((error) => {
                console.log(error);
        });
    },

    //Modal de Remoção
    removeModal(user) {
        this.idRemove = user._id
        this.$refs.removeModal.style.display = 'block';
        document.body.style.overflow = 'hidden'; 
    },
    closeRemoveModal() {
        this.$refs.removeModal.style.display = 'none';
        document.body.style.overflow = 'auto'; 
    },
    confirmRemoveModal() {
        const params = this.idRemove
        this.removeUser(params)
        this.closeRemoveModal();
  },

  logout() {
    localStorage.removeItem('token');
    setTimeout(() => this.$router.push("/"), 1000)
  },

    //remover um usuário
    async removeUser(params) {
            const tokenJWT = await localStorage.getItem('token')
            let config = {
                method: "delete",
                maxBodyLength: Infinity,
                headers: {
                    Authorization: `Bearer ${tokenJWT}`,
            },
                url: `http://localhost:3000/users/${params}`,
            };

            console.log("data", this.username, this.password)
            axios
            .request(config)
                .then((response) => {
                    console.log(response)
                    this.getUsers()
                })
                .catch((error) => {
                console.log(error);
            });
        },
}

}
</script>

<style>
.modal {
  /* Estilos do modal */
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 9999;
  border-radius: 4px;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
}

.modal::before {
  /* Efeito de desfoque no fundo */
  content: '';
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5); /* Cor de fundo desfocado */
  backdrop-filter: blur(5px); /* Desfoque */
}

.modal-content {
  margin-top: 10%;
  margin-left: 30%;
  width: 600px;
  position: relative;
  z-index: 1;
}
</style>