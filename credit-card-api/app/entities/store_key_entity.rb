class StoreKeyEntity
  def self.create(store)
    store_key = StoreKey.new

    store_key.key = SecureRandom.hex(32)
    store_key.store_id = store.id
    store_key.save

    store_key
  end
end
