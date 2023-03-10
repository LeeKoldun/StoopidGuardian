using System;
using System.Net.Http;
using GuardianProCore.Tables;
using GuardianProWebServices.Views;
using Newtonsoft.Json;
using ReactiveUI;
using System.Collections.Generic;
using System.Linq;
using SF2022UserLib;

namespace GuardianProWebServices.ViewModels;

public class SingleRequestVM : ViewModelBase
{
    public SingleRequestVM() => Setup();

    private async void Setup()
    {
        // string url = "http://localhost:5153/Api/";
        // HttpClient client = new HttpClient();
        //
        // var subdiv = await client.GetAsync(url + "Subdivision/GetAll");
        // SubdivList = JsonConvert.DeserializeObject<List<Subdivision>>(await subdiv.Content.ReadAsStringAsync());
        //
        // var subStaff = await client.GetAsync(url + "SubdivStaff/GetAll");
        // SubStaffList = JsonConvert.DeserializeObject<List<SubdivStaff>>(await subStaff.Content.ReadAsStringAsync());
        //
        // var visitType = await client.GetAsync(url + "VisitType/GetAll");
        // VisitTypeList = JsonConvert.DeserializeObject<List<VisitType>>(await visitType.Content.ReadAsStringAsync());
    }
    public DateTime DateFrom { get; set; } = DateTime.Now;
    public DateTime DateTo { get; set; } = DateTime.Now;
    public VisitType SelectedVisitType { get; set; }

    public List<VisitType> VisitTypeList { get; set; }
    public List<Subdivision> SubdivList { get; set; }
    public List<SubdivStaff> SubStaffList { get; set; }
    public List<SubdivStaff> FilteredStaff { get; set; }

    private Subdivision selectedSubdiv;
    public Subdivision SelectedSubdiv
    {
        get => selectedSubdiv;

        set
        {
            this.RaiseAndSetIfChanged(ref selectedSubdiv, value);
            FilteredStaff = SubStaffList.Where(s => s.IdSubdivision == selectedSubdiv.IdSubdivision).ToList();
        }
    }
    public SubdivStaff SelectedSubdivStaff { get; set; }
    
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string Patronymic { get; set; }
    public DateTime BirthDate { get; set; }
    public string PassportSerial { get; set; }
    public string PassportNumber { get; set; }
    public string Phone { get; set; }
    public string Email { get; set; }
    public string Organization { get; set; }
    public string Note { get; set; }
    
    public void SendRequset()
    {
        ResetError();
        if (!ValidateRequest())
            return;
    }

    private bool ValidateRequest()
    {
        if (string.IsNullOrWhiteSpace(FirstName) || 
            string.IsNullOrWhiteSpace(LastName) || 
            BirthDate == null || 
            string.IsNullOrWhiteSpace(PassportSerial) || 
            string.IsNullOrWhiteSpace(PassportNumber) || 
            string.IsNullOrWhiteSpace(Email) || 
            string.IsNullOrWhiteSpace(Note) ||
            selectedSubdiv == null || 
            SelectedSubdivStaff == null ||
            SelectedVisitType == null || 
            DateFrom == null || 
            DateTo == null)
        {
            ErrorMsg = "?????????????? ?????? ???????????? ????????????, ???????????????????? *!";
            return false;
        }

        if (DateTo < DateFrom || 
            DateFrom < DateTime.Now.AddDays(1d) ||
            DateFrom > DateTime.Now.AddDays(15d) ||
            
            DateTo > DateFrom.AddDays(15d))
        {
            ErrorMsg = "???????????????? ???????????????????? ??????????????????!\n1. ???????? ???????????? ???????????? ???????? ?????????????? ???? ???????????????????? ?????? ?? ???????????????? ???? 15 ???????? ???????????? ?? ???????????????? ????????.\n2. ???????? ?????????????????? ?????????????? ?? ?? ???????? ???????????? ?? ???????????????? ???? 15 ?????? ???????????? ?? ???????? ????????????";
            return false;
        }

        return true;
    }

    private void ResetError() => ErrorMsg = null;

    private void ClearForm()
    {
        new SinglePassRequestWindow().Show();
        CurWindow.Close();
    }

    private string errorMsg;
    public string ErrorMsg
    {
        get => errorMsg;
        set => this.RaiseAndSetIfChanged(ref errorMsg, value);
    }
}