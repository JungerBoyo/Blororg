User.create!([
  {email: "email@example.com", encrypted_password: "$2a$12$K8gDt/1FL0Vj1pcvrtGmnuOhNyd1hn3xH1USyq.yBKRGHGpaWqqKy", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, nick: "user01010", role: "admin", description: "Hello I'm user01010 contact me at 👇", post_password_digest: ""},
  {email: "lll@mm.com", encrypted_password: "$2a$12$xR5kOlL19gX62DxnAq/wr.sNWSDxwyB9kWuDvRuC6AccORs7Aygoa", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, nick: "madzia1", role: "user", description: nil, post_password_digest: nil},
  {email: "nn@mm.com", encrypted_password: "$2a$12$gMSio4FNQHcgL4dI4O71qeWwudPN7KqDIDwuGtclY5ktI541q63C6", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, nick: "user666", role: "user", description: "czesc jestem user666", post_password_digest: "Darmo123"}
])
Category.create!([
  {name: "all"},
  {name: "Programming"},
  {name: "Farming"},
  {name: "LARPing"},
  {name: "vibing"},
  {name: "travel"},
  {name: "Cooking"},
  {name: "Digging"}
])
Comment.create!([
  {post_id: 1, user_id: 5, contents: "Ok boomer, sorryy"},
  {post_id: 1, user_id: 5, contents: "I have been working with Ruby on Rails for a couple of years now, and I must say it has been an amazing experience. Rails is a powerful web development framework that provides a lot of conventions and abstractions, making it a breeze to build robust and scalable web applications.\n\nOne of the things I love about Rails is its emphasis on convention over configuration. With sensible defaults and a consistent structure, Rails allows developers to focus more on building the actual application logic rather than worrying about boilerplate code. The convention-driven approach helps maintain code consistency and speeds up the development process.\n"},
  {post_id: 1, user_id: 6, contents: "mmm"}
])
Post.create!([
  {title: "Introduction to Ruby on Rails", contents: "Ruby on Rails, often referred to as Rails, is a powerful web application framework that has gained immense popularity among developers worldwide. With its elegant syntax, convention-over-configuration principle, and vast ecosystem of libraries and tools, Rails enables rapid development and encourages the adoption of best practices.\r\n\r\nAt its core, Ruby on Rails follows the Model-View-Controller (MVC) architectural pattern, providing a structured approach to building web applications. This framework emphasizes the separation of concerns, making it easier to manage complex applications and collaborate among team members.\r\n\r\nOne of the key strengths of Ruby on Rails is its emphasis on developer productivity. Rails leverages a principle called \"Convention over Configuration,\" which means that the framework makes assumptions about the best practices and conventions, reducing the need for explicit configuration. By adhering to these conventions, developers can focus on building the application's unique logic rather than spending excessive time on setup and configuration.\r\n\r\nActive Record, the object-relational mapping (ORM) component of Rails, simplifies database interactions by mapping database tables to Ruby objects. With Active Record, developers can perform database operations using familiar object-oriented syntax, making data manipulation intuitive and efficient.\r\n\r\nRails also incorporates powerful scaffolding features that generate boilerplate code for various aspects of an application, such as models, controllers, and views. This scaffolding significantly speeds up the initial development process and provides a starting point for customization.\r\n\r\nFurthermore, Ruby on Rails embraces the concept of \"Gems,\" which are pre-packaged libraries that extend the functionality of the framework. Gems offer ready-made solutions for common tasks, such as authentication, authorization, file uploads, and more. This extensive ecosystem of Gems enables developers to leverage existing code and focus on building unique features rather than reinventing the wheel.\r\n\r\nThe Rails community is vibrant and supportive, with numerous online resources, forums, and meetups available for learning and collaboration. This active community contributes to the continuous improvement and evolution of the framework, ensuring its relevance and responsiveness to the changing needs of developers.\r\n\r\nIn conclusion, Ruby on Rails provides a robust and efficient platform for developing web applications. Its simplicity, convention-based approach, and extensive ecosystem make it an ideal choice for startups, small businesses, and enterprise-level projects alike. Whether you are a seasoned developer or just starting your programming journey, exploring Ruby on Rails opens up a world of possibilities for building modern, scalable, and feature-rich web applications.", is_private: false, user_id: 5, category_id: 1}
])
Tag.create!([
  {name: "Ruby"},
  {name: ""},
  {name: "Rails"}
])
TagBinding.create!([
  {post_id: 1, tag_id: 40},
  {post_id: 1, tag_id: 41},
  {post_id: 1, tag_id: 42},
  {post_id: 1, tag_id: 41}
])
ActiveStorage::Attachment.create!([
  {name: "avatar", record_type: "User", record_id: 5, blob_id: 8},
  {name: "avatar", record_type: "User", record_id: 7, blob_id: 9},
  {name: "title_image", record_type: "Post", record_id: 1, blob_id: 10}
])
ActiveStorage::Blob.create!([
  {key: "u0pw8x26xsiwbp8u1w22kh9sv8q9", filename: "74600205.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "analyzed"=>true}, service_name: "local", byte_size: 4833, checksum: "kn4BmcTXveXV+rOavPbVpg=="},
  {key: "267taun4a59nh8eaxlguzmcqr1sm", filename: "74600205.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "analyzed"=>true}, service_name: "local", byte_size: 4833, checksum: "kn4BmcTXveXV+rOavPbVpg=="},
  {key: "rms0otnlmz2rnw98sw4u0xtkw1hg", filename: "th-2126124110.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "analyzed"=>true}, service_name: "local", byte_size: 21404, checksum: "qXovvdngBN22m2/Iu223HA=="}
])
