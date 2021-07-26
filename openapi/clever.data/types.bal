public type DistrictAdmin record {
    string district?;
    string email?;
    string id?;
    Name name?;
    string? title?;
};

public type SchoolAdminResponse record {
    SchoolAdmin data?;
};

public type SchoolAdmin record {
    Credentials credentials?;
    string district?;
    string email?;
    string id?;
    Name name?;
    string[] schools?;
    string staff_id?;
    string? title?;
};

public type SchoolResponse record {
    School data?;
};

public type DistrictStatusResponses record {
    DistrictStatusResponse[] data?;
};

public type SectionResponse record {
    Section data?;
};

public type SectionsResponse record {
    SectionResponse[] data?;
};

public type Name record {
    string? first?;
    string? last?;
    string? middle?;
};

public type School record {
    string created?;
    string district?;
    string? high_grade?;
    string id?;
    string last_modified?;
    Location location?;
    string? low_grade?;
    string? mdr_number?;
    string name?;
    string? nces_id?;
    string? phone?;
    Principal principal?;
    string school_number?;
    string sis_id?;
    string? state_id?;
};

public type DistrictStatusResponse record {
    DistrictStatus data?;
};

public type DistrictAdminsResponse record {
    DistrictAdmin[] data?;
};

public type SchoolsResponse record {
    SchoolResponse[] data?;
};

public type TeachersResponse record {
    TeacherResponse[] data?;
};

public type StudentContact record {
    string district?;
    string? email?;
    string id?;
    string name?;
    string? phone?;
    string? phone_type?;
    string? relationship?;
    string? sis_id?;
    string student?;
    string 'type?;
};

public type DistrictsResponse record {
    DistrictResponse[] data?;
};

public type StudentContactsForStudentResponse record {
    StudentContact[] data?;
};

public type TeacherResponse record {
    Teacher data?;
};

public type Teacher record {
    string created?;
    Credentials credentials?;
    string district?;
    string? email?;
    string id?;
    string last_modified?;
    Name name?;
    string school?;
    string[] schools?;
    string sis_id?;
    string? state_id?;
    string? teacher_number?;
    string? title?;
};

public type Term record {
    string? end_date?;
    string? name?;
    string? start_date?;
};

public type Student record {
    string created?;
    Credentials credentials?;
    string district?;
    string? dob?;
    string? ell_status?;
    string? email?;
    string? gender?;
    string? grade?;
    string? graduation_year?;
    string? hispanic_ethnicity?;
    string id?;
    string last_modified?;
    Location location?;
    Name name?;
    string? race?;
    string school?;
    string[] schools?;
    string sis_id?;
    string? state_id?;
    string? student_number?;
};

public type Section record {
    string? course_description?;
    string? course_name?;
    string? course_number?;
    string created?;
    string district?;
    string? grade?;
    string id?;
    string last_modified?;
    string name?;
    string? period?;
    string school?;
    string? section_number?;
    string sis_id?;
    string[] students?;
    string subject?;
    string? teacher?;
    string[] teachers?;
    Term term?;
};

public type StudentsResponse record {
    StudentResponse[] data?;
};

public type DistrictResponse record {
    District data?;
};

public type StudentContactsResponse record {
    StudentContactResponse[] data?;
};

public type BadRequest record {
    string message?;
};

public type DistrictStatus record {
    string _error?;
    string id?;
    boolean instant_login?;
    string? last_sync?;
    string launch_date?;
    string? pause_end?;
    string? pause_start?;
    string sis_type?;
    string state?;
};

public type GradeLevelsResponse record {
    string[] data?;
};

public type DistrictAdminResponse record {
    DistrictAdmin data?;
};

public type StudentResponse record {
    Student data?;
};

public type InternalError record {
    string message?;
};

public type District record {
    string id?;
    string? mdr_number?;
    string name?;
};

public type SchoolAdminsResponse record {
    SchoolAdminResponse[] data?;
};

public type Credentials record {
    string district_username?;
};

public type Principal record {
    string? email?;
    string? name?;
};

public type Location record {
    string? address?;
    string? city?;
    string? lat?;
    string? lon?;
    string? state?;
    string? zip?;
};

public type NotFound record {
    string message?;
};

public type StudentContactResponse record {
    StudentContact data?;
};
