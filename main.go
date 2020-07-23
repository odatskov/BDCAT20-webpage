package main

import (
	"flag"
	"fmt"
	"html/template"
	"log"
	"net/http"
	"os"
	"strings"
	"path/filepath"
)

func renderTemplate(w http.ResponseWriter, r *http.Request) {
	var upath string

	// For default location send to home page
	if r.URL.Path == "/" {
		upath = "templates/home.html"
	} else {
		upath = fmt.Sprintf("templates%s.html", r.URL.Path)
	}

	// If requested path is unknown, send to the not found page
	if _, err := os.Stat(upath); os.IsNotExist(err) {
		upath = "templates/404.html"
	}

	// Parse the requested template along with helper components
	tmpl, err := template.ParseFiles(upath, "templates/_helpers.tpl")
	if err != nil {
		log.Fatal(err)
	}

	t := template.Must(tmpl, err)

	// Render the requested template
	err = t.Execute(w, upath)
	if err != nil {
		log.Fatalf("Failed to execute template: %s", err)
	}
}

func outputTemplate(out string) {

	// When output folder is requested, make sure it exists
	if len(out) > 0 {
		_, err := os.Stat(out)
		if os.IsNotExist(err) {
			os.Mkdir(out, 0755)
			log.Printf("Folder %s created", out)
		}
	}

	// Iterate through all the files inside the templates folder
	err := filepath.Walk("templates", func(path string, info os.FileInfo, err error) error {
		if err != nil {
			log.Fatal(err)
		}

		// Render only html files available in the templates folder
		matched, _ := filepath.Match(`*.html`, info.Name())
		if matched {
			tmpl, err := template.ParseFiles(fmt.Sprintf("templates/%s", info.Name()), "templates/_helpers.tpl")
			if err != nil {
				log.Fatal(err)
			}

			// If output folder was specified, write files into folder. Otherwise, render to stdout
			if len(out) > 0 {
				f, err := os.Create(fmt.Sprintf("%s/%s", out, info.Name()))
				if err != nil {
					log.Fatal("Failed to create %s/%s: %s", out, info.Name(), err)
				}

				log.Printf("Rendering template: templates/%s",info.Name())

				err = tmpl.Execute(f, nil)
				if err != nil {
					log.Fatal("Execute failed: %s", err)
				}
			} else {

				fmt.Printf("\n\n%s\n[Template] %s\n%s\n\n",strings.Repeat("-",25),info.Name(),strings.Repeat("-",25))
				err = tmpl.Execute(os.Stdout, nil)
				if err != nil {
					log.Fatal("Execute failed: %s", err)
				}
			}
		}
		return nil

	})
	if err != nil {
		log.Fatalf("Failed to walk through the files: %s", err)
	}
}

func main() {

	var host, port, out, style string
	var render bool

	flag.StringVar(&host, "h", "localhost", "Hostname of the webserver.")
	flag.StringVar(&port, "p", "8080", "Port to run the webserver on.")
	flag.BoolVar(&render, "r", false, "Render the web pages instead of running the web server")
	flag.StringVar(&out, "o", "", "Folder to render the html templates into. Use empty string for stdout output only.")
	flag.StringVar(&style, "s", "default", "CSS style to use. Available: default.")

	flag.Parse()

	// Render all the templates instead of running the web server
	if render {
		outputTemplate(out)
		os.Exit(0)
	}

	log.Printf("Starting webserver on http://%s:%s", host, port)

	mux := http.NewServeMux()

	files := http.FileServer(http.Dir("./static"))
	mux.Handle("/static/", http.StripPrefix("/static/", files))

	mux.HandleFunc("/", renderTemplate)

	server := &http.Server{
		Addr:    fmt.Sprintf("%s:%s", host, port),
		Handler: mux,
	}

	//log.Fatal(server.ListenAndServeTLS("cert.pem","key.pem"))
	log.Fatal(server.ListenAndServe())
}
