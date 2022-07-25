using MyCalendar.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace MyCalendar.Controllers
{
    public class CalendarActionResponseModel
    {
        public String Status;
        public Int64 Source_id;
        public Int64 Target_id;

        public CalendarActionResponseModel(String status, Int64 source_id, Int64 target_id)
        {
            Status = status;
            Source_id = source_id;
            Target_id = target_id;
        }
    }

    public class CalendarController : Controller
    {
        //
        // GET: /Calendar/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Data()
        {
            MyEventsDataContext data = new MyEventsDataContext();
            return View(data.Events);
        }

		public ActionResult Save(Event changedEvent, FormCollection actionValues)
		{
			String action_type = actionValues["!nativeeditor_status"];
			Int64 source_id = Int64.Parse(actionValues["id"]);
			Int64 target_id = source_id;
				
	
			MyEventsDataContext data = new MyEventsDataContext();
			try{
				switch (action_type)
				{
					case "inserted":
                        data.Events.InsertOnSubmit(changedEvent);
						break;
					case "deleted":
                        changedEvent = data.Events.SingleOrDefault(ev => ev.id == source_id);
                        data.Events.DeleteOnSubmit(changedEvent);
						break;
					default: // "updated"
                        changedEvent = data.Events.SingleOrDefault(ev => ev.id == source_id);
                        UpdateModel(changedEvent);
						break;
				}
				data.SubmitChanges();
                target_id = changedEvent.id;
			}
			catch
			{
				action_type = "error";
			}
	
			return View(new CalendarActionResponseModel(action_type, source_id, target_id));
		}
	}
}
