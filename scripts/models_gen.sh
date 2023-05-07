#!/bin/sh

gen_post_model() {
    rails generate model Post \
        title:string{128} \
        contents:string \
        category:references \
        is_private:boolean \
        author:references
}

gen_category_model() {
    rails generate model Category \
        name:string
}

gen_tag_model() {
    rails generate model Tag \
        name:string \
        post:references
}

gen_comment_model() {
    rails generate model Comment \
        contents:string \
        post:references \
        user:references
}

gen_user_model() {
    rails generate model User \
        nick:string{50}:uniq \
        emial:string{50}:uniq \
        description:string \
        password_hash:string \
        private_context_password_hash:string \
        admin:boolean:index
}

gen_attachment_models() {
    # rails generate model Attachment data:binary

    rails generate model AttachmentProxy \
        name:string \
        type:integer \
        attachable:references{polymorphic}:index \
        attachment:references
}

# gen_user_model
gen_post_model
# gen_comment_model
# gen_tag_model
# gen_category_model
gen_attachment_models