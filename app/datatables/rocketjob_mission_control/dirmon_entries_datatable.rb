module RocketjobMissionControl
  class DirmonEntriesDatatable < AbstractDatatable
    delegate :dirmon_entry_path, :state_icon, to: :@view

    private

    def map(dirmon)
      {
        "0"           => name_with_link(dirmon),
        "1"           => h(dirmon.job_class_name),
        "2"           => h(dirmon.pattern.try(:truncate, 80)),
        "DT_RowClass" => "card callout callout-#{dirmon.state}"
      }
    end

    def name_with_link(dirmon)
      <<-EOS
        <a href="#{dirmon_entry_path(dirmon.id)}">
          <i class="#{state_icon(dirmon.state)}" style="font-size: 75%" title="#{dirmon.state}"></i>
          #{dirmon.name}
        </a>
      EOS
    end
  end
end
