pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Replace 'your-repo' with your repository URL
               git branch: 'main', url: 'git@github.com:aymn-mbrk/DEMO_ANSIBLE.git'
            }
        }

        stage('Run Ansible') {
            steps {
                script {
                    // Replace 'your-playbook.yml' with your playbook file
                    // And replace 'your-inventory.ini' with your inventory file
                    sh 'ansible-playbook -i inventory/gcp.yaml playbook-test1.yml'
                }
            }
        }

        
    
    }
}

