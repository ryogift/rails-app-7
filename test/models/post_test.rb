require "test_helper"

class PostTest < ActiveSupport::TestCase
  def setup
    @post = posts(:one)
  end

  test "有効であること" do
    assert @post.valid?
  end

  test "投稿内容が必須であること" do
    @post.content = ""
    @post.valid?
    assert_includes @post.errors[:content], I18n.t("errors.messages.blank")
  end

  test "投稿内容が1000文字いないであること" do
    @post.content = "a" * 1001
    @post.valid?
    assert_includes @post.errors[:content], I18n.t("errors.messages.too_long", count: 1000)
  end
end
