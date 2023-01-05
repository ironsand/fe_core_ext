# frozen_string_literal: true

require 'bigdecimal'
require 'bigdecimal/util'

module FeCoreExt::CoreExt
end

module FeCoreExt::CoreExt::Array
  def median
    return if empty?
    sorted = sort
    len = sorted.length
    (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
  end

  def mean
    return if empty?
    sum.to_d / size
  end

  # remove, remove_at, remove_if はこちらのものを使わせてもらっています。
  # https://gist.github.com/nekoTheShadow/2de8a324f445bdde8a67
  def remove(val)
    # ブロックが渡されており、かつvalと等しい要素が見つからなかった場合
    return yield if block_given? && !self.include?(val)

    temp = self.dup
    temp.delete(val)
    temp
  end

  def remove_at(pos)
    temp = self.dup
    temp.delete_at(pos)
    temp
  end

  def remove_if
    temp = self.dup
    # ブロックを持たない場合
    return temp.delete_if unless block_given?

    self.each{|val| temp.delete(val) if yield(val)}
    temp
  end

end

class Array
  include FeCoreExt::CoreExt::Array
end
