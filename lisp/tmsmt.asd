(asdf:defsystem tmsmt
  :description "SMT-based planner"
  :depends-on ("alexandria" "cl-ppcre" "sycamore" "motion-grammar-kit" "cffi" "amino" "robray")
  :components ((:file "package")
               (:file "util" :depends-on ("package"))
               (:file "smtlib" :depends-on ("util"))
               (:file "expression" :depends-on ("util"))
               (:file "pddl" :depends-on ("util"))
               (:file "dumpsig" :depends-on ("util"))
               (:file "placement-graph" :depends-on ("pddl"))
               (:file "planner" :depends-on ("util" "expression" "pddl" "smtlib"))
               (:file "ros/ros-loadlib" :depends-on ("util" "dumpsig"))
               (:file "sig-unblock" :depends-on ("dumpsig" "ros/ros-loadlib"))
               (:file "ros/ros-defs" :depends-on ("sig-unblock"))
               (:file "ros/ros-cros" :depends-on ("ros/ros-defs"))
               (:file "ros/ros-container" :depends-on ("ros/ros-defs"))
               (:file "ros/ros-scene" :depends-on ("ros/ros-defs"))
               (:file "moveit" :depends-on ("ros/ros-scene" "ros/ros-container"))
               (:file "m-actions" :depends-on ("moveit"))
               (:file "itmp-rec" :depends-on ("moveit" "m-actions"))
               (:file "planvis" :depends-on ("moveit"))
               ))
