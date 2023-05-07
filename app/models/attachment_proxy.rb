class AttachmentProxy < ApplicationRecord
  belongs_to :attachable, polymorphic: true
  belongs_to :attachment
end
