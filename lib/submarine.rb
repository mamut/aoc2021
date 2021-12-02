class Submarine
  def run(state, commands)
    commands.inject(state) do |acc, command|
      self.next(acc, command)
    end
  end

  def next(state, command)
    new_state = case command
      in [:forward, x]
      do_forward(state, x)
      in [:up, x]
      do_up(state, x)
      in [:down, x]
      do_down(state, x)
    end

    update_metadata(new_state)
  end

  private

  def do_forward(state, x)
    state.merge(horizontal: state[:horizontal] + x)
  end

  def do_up(state, x)
    state.merge(depth: state[:depth] - x)
  end

  def do_down(state, x)
    state.merge(depth: state[:depth] + x)
  end

  def update_metadata(state)
    state.merge(multiplied: state[:horizontal] * state[:depth])
  end
end
