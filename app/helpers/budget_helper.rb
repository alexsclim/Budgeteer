module BudgetHelper

  def allocated_balance(attributes)
    new_hash = attributes.select{ |key, value| key.to_s.match(/^allocated+/) }
    new_hash.except('allocated_balance').values.inject(:+)
  end

  def real_balance(attributes)
    new_hash = attributes.select{ |key, value| key.to_s.match(/^spent+/) }
    new_hash.except('spent_balance').values.inject(:+)
  end

  def allocated_hash(attributes)
    attributes.select{ |key, value| key.to_s.match(/^allocated+/) }
  end

  def user_balance(balance)
    total_spent_balance = 0
    Budget.all.each do |budget|
      total_spent_balance += real_balance(budget.attributes)
    end
    if balance.nil?
      return 0
    else
      balance - total_spent_balance
    end
  end

  def get_categories(attributes)
    allocated = attributes.select{ |key, value| key.to_s.match(/^allocated+/) }
    spent = attributes.select{ |key, value| key.to_s.match(/^spent+/) }
    categories_hash = allocated.merge(spent)
  end
end
