class OperationsController < ApplicationController
  def index
    # 必要に応じてデータを取得
    @operations = Operation.all
  end
end
