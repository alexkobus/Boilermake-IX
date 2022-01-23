class Resume {
  late String id;

  late String name;
  late String studentEmail;

  late String latestJobTitle;
  late String latestCompany;
  late String latestWorkStartDate;
  late String latestWorkEndDate;

  late String allWork;

  late String latestSchoolName;
  late String latestSchoolStart;
  late String latestSchoolGradDate;
  late String latestSchoolDegree;
  late String latestSchoolMajor;
  late String latestSchoolGPA;

  late String allEducation;

  late String skills;
  late String linkedInUrl;

  late int numJobs;
  late int numSchools;

  late Acceptance accepted;

  Resume(
      this.id,
      this.name,
      this.studentEmail,
      this.latestJobTitle,
      this.latestCompany,
      this.latestWorkStartDate,
      this.latestWorkEndDate,
      this.allWork,
      this.latestSchoolName,
      this.latestSchoolStart,
      this.latestSchoolGradDate,
      this.latestSchoolDegree,
      this.latestSchoolMajor,
      this.latestSchoolGPA,
      this.allEducation,
      this.skills,
      this.linkedInUrl,
      this.numJobs,
      this.numSchools
  );
}

enum Acceptance {
  accepted, notAccepted, inReview
}