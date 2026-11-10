```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%
    String email = (String) session.getAttribute("studentEmail");

    if (email == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String name = (String) session.getAttribute("studentName");

    if (name == null) {
        name = "Student";
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>LearnHub | Student Dashboard</title>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: "Segoe UI", Arial, sans-serif;
    background: #f3f6fc;
    color: #172554;
}

.app {
    display: flex;
    min-height: 100vh;
}

/* SIDEBAR */
.sidebar {
    width: 245px;
    flex-shrink: 0;
    background: #111c35;
    color: white;
    padding: 26px 15px;
}

.logo {
    font-size: 25px;
    font-weight: 800;
    padding: 5px 12px 35px;
}

.logo span {
    color: #50a5ff;
}

.menu-label {
    color: #98a7c5;
    font-size: 11px;
    letter-spacing: 1.5px;
    margin: 15px 12px;
}

.nav-link {
    display: block;
    width: 100%;
    padding: 14px;
    margin-bottom: 7px;
    color: #dbe5f7;
    background: transparent;
    border: none;
    border-radius: 9px;
    text-align: left;
    font-size: 14px;
    cursor: pointer;
    transition: background .2s;
}

.nav-link:hover,
.nav-link.active {
    background: #245de0;
    color: white;
}

.sidebar a {
    text-decoration: none;
}

.sidebar .pdf-link {
    display: block;
    color: #dbe5f7;
    padding: 14px;
    font-size: 14px;
    border-radius: 9px;
}

.sidebar .pdf-link:hover {
    background: #253657;
}

.sidebar .logout {
    color: #ffb7b7;
}

/* MAIN AREA */
.main {
    flex: 1;
    min-width: 0;
}

.topbar {
    background: white;
    min-height: 76px;
    padding: 20px 32px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 15px;
    border-bottom: 1px solid #e5eaf3;
}

.topbar h2 {
    font-size: 21px;
}

.user {
    font-size: 14px;
    color: #64748b;
    overflow-wrap: anywhere;
}

.content {
    max-width: 1600px;
    margin: auto;
    padding: 30px;
}

.welcome {
    padding: 30px;
    margin-bottom: 25px;
    border-radius: 15px;
    background: linear-gradient(110deg, #dceeff, #f0eaff);
    border: 1px solid #d9e7ff;
}

.welcome h1 {
    font-size: 28px;
    margin-bottom: 10px;
}

.welcome p {
    color: #52658a;
    line-height: 1.7;
    overflow-wrap: anywhere;
}

.welcome .email {
    margin-top: 8px;
    font-size: 13px;
}

/* SUMMARY CARDS */
.stats {
    display: grid;
    grid-template-columns: repeat(3, minmax(0, 1fr));
    gap: 18px;
    margin-bottom: 28px;
}

.stat {
    background: white;
    padding: 23px;
    border: 1px solid #e5ebf5;
    border-radius: 13px;
    box-shadow: 0 4px 14px rgba(30, 64, 120, .04);
}

.stat-icon {
    font-size: 25px;
    margin-bottom: 15px;
}

.stat p {
    color: #71809a;
    font-size: 14px;
    margin-bottom: 9px;
}

.stat h2 {
    font-size: 29px;
}

/* SECTIONS */
.section {
    display: none;
}

.section.active {
    display: block;
}

.section-title {
    margin: 26px 0 17px;
}

.section-title h2 {
    font-size: 21px;
    margin-bottom: 6px;
}

.section-title p {
    font-size: 13px;
    color: #71809a;
}

/* COURSE CARDS */
.course-grid {
    display: grid;
    grid-template-columns: repeat(3, minmax(0, 1fr));
    gap: 17px;
}

.course {
    background: white;
    border: 1px solid #e5ebf5;
    border-radius: 13px;
    padding: 21px;
    transition: transform .2s, box-shadow .2s;
}

.course:hover {
    transform: translateY(-4px);
    box-shadow: 0 9px 25px rgba(30, 64, 120, .1);
}

.course-icon {
    width: 48px;
    height: 48px;
    display: grid;
    place-items: center;
    border-radius: 12px;
    background: #e8efff;
    font-size: 24px;
    margin-bottom: 16px;
}

.course h3 {
    font-size: 16px;
    margin-bottom: 9px;
}

.course p {
    color: #71809a;
    font-size: 13px;
    line-height: 1.6;
}

.progress {
    height: 7px;
    background: #e8edf7;
    border-radius: 20px;
    margin: 14px 0;
    overflow: hidden;
}

.progress span {
    display: block;
    height: 100%;
    background: linear-gradient(90deg, #3987ff, #7959ef);
    border-radius: 20px;
}

.course button {
    width: 100%;
    border: none;
    border-radius: 7px;
    background: #edf4ff;
    color: #2457c5;
    padding: 10px;
    cursor: pointer;
    font-weight: 600;
}

.course button:hover {
    background: #dce9ff;
}

/* TABLES */
.table-box {
    background: white;
    border: 1px solid #e5ebf5;
    border-radius: 13px;
    padding: 22px;
    margin-top: 20px;
    overflow-x: auto;
}

table {
    width: 100%;
    border-collapse: collapse;
    min-width: 450px;
}

th, td {
    padding: 14px 12px;
    text-align: left;
    border-bottom: 1px solid #edf1f7;
    font-size: 13px;
}

th {
    background: #f5f8ff;
    color: #52658a;
}

tr:last-child td {
    border-bottom: none;
}

.status {
    background: #e1f7eb;
    color: #18864b;
    padding: 5px 10px;
    border-radius: 20px;
    font-size: 12px;
}

/* PDF DOWNLOAD */
.pdf-box {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 20px;
    flex-wrap: wrap;
    background: linear-gradient(100deg, #e9edff, #f4efff);
    padding: 23px;
    border-radius: 13px;
    margin-top: 28px;
}

.pdf-box p {
    color: #71809a;
    margin-top: 7px;
    font-size: 13px;
}

.download-btn {
    display: inline-block;
    background: #245de0;
    color: white;
    padding: 12px 18px;
    border-radius: 8px;
    text-decoration: none;
    font-size: 13px;
    font-weight: bold;
}

.download-btn:hover {
    background: #1947b8;
}

.footer {
    padding: 22px 30px;
    color: #8995aa;
    font-size: 12px;
}

@media (max-width: 1050px) {
    .course-grid {
        grid-template-columns: repeat(2, minmax(0, 1fr));
    }

    .stats {
        grid-template-columns: repeat(2, minmax(0, 1fr));
    }
}

@media (max-width: 700px) {
    .app {
        display: block;
    }

    .sidebar {
        width: 100%;
        padding: 15px;
    }

    .logo {
        padding: 10px 8px 20px;
    }

    .nav-link {
        width: auto;
        display: inline-block;
        padding: 10px;
    }

    .topbar {
        padding: 18px;
        flex-wrap: wrap;
    }

    .content {
        padding: 17px;
    }

    .welcome {
        padding: 22px;
    }

    .welcome h1 {
        font-size: 23px;
    }

    .course-grid,
    .stats {
        grid-template-columns: 1fr;
    }
}
</style>
</head>

<body>
<div class="app">

    <aside class="sidebar">
        <div class="logo">🎓 Learn<span>Hub</span></div>

        <div class="menu-label">MAIN MENU</div>

        <button class="nav-link active"
                onclick="openSection('dashboard', this)">
            🏠 Dashboard
        </button>

        <button class="nav-link"
                onclick="openSection('courses', this)">
            📚 My Courses
        </button>

        <button class="nav-link"
                onclick="openSection('attendance', this)">
            📅 Attendance
        </button>

        <button class="nav-link"
                onclick="openSection('marks', this)">
            📊 Marks
        </button>

        <div class="menu-label">QUICK ACCESS</div>

        <a class="pdf-link"
           href="<%= request.getContextPath() %>/StudentPDFServlet">
            📄 Download PDF
        </a>

        <a class="pdf-link logout"
           href="<%= request.getContextPath() %>/login.jsp">
            ↪ Logout
        </a>
    </aside>

    <main class="main">

        <header class="topbar">
            <h2 id="pageTitle">Student Dashboard</h2>
            <div class="user">👤 <%= name %></div>
        </header>

        <div class="content">

            <!-- DASHBOARD -->
            <section id="dashboard" class="section active">

                <div class="welcome">
                    <h1>Welcome back, <%= name %>! 👋</h1>
                    <p>Keep learning, keep growing. Your future starts today.</p>
                    <p class="email">✉ <%= email %></p>
                </div>

                <div class="stats">
                    <div class="stat">
                        <div class="stat-icon">📚</div>
                        <p>Total Courses</p>
                        <h2>6</h2>
                    </div>

                    <div class="stat">
                        <div class="stat-icon">📅</div>
                        <p>Attendance</p>
                        <h2>87%</h2>
                    </div>

                    <div class="stat">
                        <div class="stat-icon">📊</div>
                        <p>Average Marks</p>
                        <h2>82%</h2>
                    </div>
                </div>

                <div class="section-title">
                    <h2>My Courses</h2>
                    <p>Continue learning your subjects.</p>
                </div>

                <div class="course-grid">
                    <div class="course">
                        <div class="course-icon">☕</div>
                        <h3>Java Programming</h3>
                        <p>Learn Java and object-oriented programming.</p>
                        <div class="progress"><span style="width:80%"></span></div>
                        <button onclick="openSection('courses')">View Courses</button>
                    </div>

                    <div class="course">
                        <div class="course-icon">💻</div>
                        <h3>Web Development</h3>
                        <p>Learn HTML, CSS, JavaScript and JSP.</p>
                        <div class="progress"><span style="width:70%"></span></div>
                        <button onclick="openSection('courses')">View Courses</button>
                    </div>

                    <div class="course">
                        <div class="course-icon">🗄️</div>
                        <h3>Database Management</h3>
                        <p>Learn SQL and database connectivity.</p>
                        <div class="progress"><span style="width:75%"></span></div>
                        <button onclick="openSection('courses')">View Courses</button>
                    </div>

                    <div class="course">
                        <div class="course-icon">🐍</div>
                        <h3>Python Programming</h3>
                        <p>Learn Python programming fundamentals.</p>
                        <div class="progress"><span style="width:60%"></span></div>
                        <button onclick="openSection('courses')">View Courses</button>
                    </div>

                    <div class="course">
                        <div class="course-icon">📈</div>
                        <h3>Data Analytics</h3>
                        <p>Explore data analysis concepts.</p>
                        <div class="progress"><span style="width:50%"></span></div>
                        <button onclick="openSection('courses')">View Courses</button>
                    </div>

                    <div class="course">
                        <div class="course-icon">🧠</div>
                        <h3>Artificial Intelligence</h3>
                        <p>Discover AI and machine learning.</p>
                        <div class="progress"><span style="width:40%"></span></div>
                        <button onclick="openSection('courses')">View Courses</button>
                    </div>
                </div>

                <div class="pdf-box">
                    <div>
                        <h3>📄 Student Documents</h3>
                        <p>Download your registered student details as a PDF.</p>
                    </div>

                    <a class="download-btn"
                       href="<%= request.getContextPath() %>/StudentPDFServlet">
                        ⬇ Download My PDF
                    </a>
                </div>
            </section>

            <!-- COURSES -->
            <section id="courses" class="section">
                <div class="welcome">
                    <h1>📚 My Courses</h1>
                    <p>Explore the subjects available in your learning portal.</p>
                </div>

                <div class="course-grid">
                    <div class="course">
                        <div class="course-icon">☕</div>
                        <h3>Java Programming</h3>
                        <p>Core Java, OOP, JDBC and collections.</p>
                    </div>

                    <div class="course">
                        <div class="course-icon">💻</div>
                        <h3>Web Development</h3>
                        <p>HTML, CSS, JavaScript, JSP and Servlets.</p>
                    </div>

                    <div class="course">
                        <div class="course-icon">🗄️</div>
                        <h3>Database Management</h3>
                        <p>SQL queries, tables and database integration.</p>
                    </div>

                    <div class="course">
                        <div class="course-icon">🐍</div>
                        <h3>Python Programming</h3>
                        <p>Python syntax, functions and programming.</p>
                    </div>

                    <div class="course">
                        <div class="course-icon">📈</div>
                        <h3>Data Analytics</h3>
                        <p>Data analysis and reporting fundamentals.</p>
                    </div>

                    <div class="course">
                        <div class="course-icon">🧠</div>
                        <h3>Artificial Intelligence</h3>
                        <p>AI and machine learning introduction.</p>
                    </div>
                </div>
            </section>

            <!-- ATTENDANCE -->
            <section id="attendance" class="section">
                <div class="welcome">
                    <h1>📅 Attendance</h1>
                    <p>Your subject-wise attendance overview.</p>
                </div>

                <div class="stats">
                    <div class="stat">
                        <p>Overall Attendance</p>
                        <h2>87%</h2>
                    </div>
                    <div class="stat">
                        <p>Present Days</p>
                        <h2>87</h2>
                    </div>
                    <div class="stat">
                        <p>Absent Days</p>
                        <h2>13</h2>
                    </div>
                </div>

                <div class="table-box">
                    <table>
                        <thead>
                            <tr>
                                <th>Subject</th>
                                <th>Total Classes</th>
                                <th>Present</th>
                                <th>Attendance</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Java Programming</td>
                                <td>40</td>
                                <td>36</td>
                                <td>90%</td>
                                <td><span class="status">Good</span></td>
                            </tr>
                            <tr>
                                <td>Web Development</td>
                                <td>40</td>
                                <td>34</td>
                                <td>85%</td>
                                <td><span class="status">Good</span></td>
                            </tr>
                            <tr>
                                <td>Database Management</td>
                                <td>40</td>
                                <td>34</td>
                                <td>85%</td>
                                <td><span class="status">Good</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>

            <!-- MARKS -->
            <section id="marks" class="section">
                <div class="welcome">
                    <h1>📊 My Marks</h1>
                    <p>Your subject-wise academic performance.</p>
                </div>

                <div class="stats">
                    <div class="stat">
                        <p>Average Marks</p>
                        <h2>82%</h2>
                    </div>
                    <div class="stat">
                        <p>Highest Marks</p>
                        <h2>90</h2>
                    </div>
                    <div class="stat">
                        <p>Subjects</p>
                        <h2>3</h2>
                    </div>
                </div>

                <div class="table-box">
                    <table>
                        <thead>
                            <tr>
                                <th>Subject</th>
                                <th>Marks Obtained</th>
                                <th>Maximum Marks</th>
                                <th>Result</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Java Programming</td>
                                <td>90</td>
                                <td>100</td>
                                <td><span class="status">Pass</span></td>
                            </tr>
                            <tr>
                                <td>Web Development</td>
                                <td>82</td>
                                <td>100</td>
                                <td><span class="status">Pass</span></td>
                            </tr>
                            <tr>
                                <td>Database Management</td>
                                <td>74</td>
                                <td>100</td>
                                <td><span class="status">Pass</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>

        </div>

        <footer class="footer">
            © 2026 LearnHub | Educational Portal
        </footer>

    </main>
</div>

<script>
function openSection(sectionId, clickedButton) {
    document.querySelectorAll(".section").forEach(function(section) {
        section.classList.remove("active");
    });

    const selected = document.getElementById(sectionId);

    if (selected) {
        selected.classList.add("active");
    }

    document.querySelectorAll(".nav-link").forEach(function(button) {
        button.classList.remove("active");
    });

    if (clickedButton) {
        clickedButton.classList.add("active");
    } else {
        document.querySelectorAll(".nav-link").forEach(function(button) {
            if (button.getAttribute("onclick").includes("'" + sectionId + "'")) {
                button.classList.add("active");
            }
        });
    }

    const titles = {
        dashboard: "Student Dashboard",
        courses: "My Courses",
        attendance: "Attendance",
        marks: "My Marks"
    };

    document.getElementById("pageTitle").textContent =
        titles[sectionId] || "Student Dashboard";

    window.scrollTo({ top: 0, behavior: "smooth" });
}
</script>

</body>
</html>
