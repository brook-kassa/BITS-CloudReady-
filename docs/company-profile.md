




| Element                    | What to decide                                                                                                                                           | Why it matters technically                      |
| -------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------- |
| **Company name & brand**   | BluePort Cargo, logo, "On Time. Every Time."                                                                                                             | Makes the project feel like a real client       |
| **Industry**               | Logistics & Freight                                                                                                                                      | Industry compliance/security needs              |
| **Size**                   | 250 employees, 3 main offices (Nairobi, Djibouti City, Cairo) and 1 satellite office (Addis Ababa)                                                       | Affects scale of architecture                   |
| **Locations**              | Offices in Nairobi, Djibouti City, Cairo, and Addis Ababa (satellite)                                                                                    | Influences region/AZ choice, latency planning   |
| **Business goals**         | Provide a public shipment tracking portal, secure internal business applications, and a hybrid cloud deployment for both on-premise and cloud operations | Determines public/private subnet design         |
| **Pain points**            | High latency, unreliable hosting, costly IT                                                                                                              | Helps justify design choices                    |
| **Technical requirements** | PostgreSQL database for shipment tracking, VPN for office connectivity, IAM roles for regional staff access                                              | Defines AWS services used                       |
| **Compliance needs**       | GDPR, PCI-DSS, ISO 27001, and data protection best practices                                                                                             | Impacts encryption, logging, and access control |
