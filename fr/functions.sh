#$1: IP
#$2: USER
#$3: PASSWORD
#$4: COMMAND

#sshpass -p "raspberry" ssh -o StrictHostKeyChecking=no pi@10.0.0.4 'export DISPLAY=:0 && chromium-browser --app="facebook.fr"'

jv_plugin_ssh_execute () {
    sshpass -p "$3" ssh -o StrictHostKeyChecking=no "$2"@"$1" 'export DISPLAY=:0 && '$4
    retour=$?
    if [[ $retour -ne 0 ]]; then
        jv_error "jarvis-ssh: Erreur code : $#"
        say "La commande ssh a rencotrée une erreur, le code interne est $#"
    fi
}
