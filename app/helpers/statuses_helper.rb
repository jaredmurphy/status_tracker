module StatusesHelper
  def fields_for_status(status, field)
    {
       value: status.send(field),
       label: :field,
       data: { reflex: "change->StatusReflex#update_form", status: status }
     }
  end
end
