;; Example Java Setting.
;; See emacs-configuration.org #"LSP Java" Section.

(defvar my/java-vmargs
  '("-Xmx1G"       ;; Increase max heap size to 1GB
    "-XX:+UseG1GC" ;; aggressive JIT compile, minimize STW; for lower latency
    ;; Remove string duplication(only supported in g1gc). More GC pause, less memory footpring.
    "-XX:+UseStringDeduplication"
    ))

(defconst my/lombok-path
  "/home/murry/.m2/repository/org/projectlombok/lombok/1.18.18/lombok-1.18.18.jar")
(setcdr (last my/java-vmargs)
        (list
         (concat "-javaagent:" my/lombok-path)))
;; See 'trouble shooting' section in:
;; http://www.skybert.net/emacs/enterprise-java-development-in-emacs/
;;         (concat "-Xbootclasspath/a:" my/lombok-path)))
