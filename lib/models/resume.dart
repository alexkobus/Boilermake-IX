class Resume {
  late String id;

  late String name;
  late String studentEmail;

  late String w1Title;
  late String w1Company;
  late String w1Start;
  late String w1End;
  late String w1Desc;

  late String w2Title;
  late String w2Company;
  late String w2Start;
  late String w2End;
  late String w2Desc;

  late String e1Name;
  late String e1Start;
  late String e1Grad;
  late String e1Degree;
  late String e1Major;
  late String e1GPA;

  late String e2Name;
  late String e2Start;
  late String e2Grad;
  late String e2Degree;
  late String e2Major;
  late String e2GPA;

  late String skills;
  late String linkedInUrl;

  late Acceptance accepted;

  Resume(
    this.id,
    this.name,
    this.studentEmail,
    this.w1Title,
    this.w1Company,
    this.w1Start,
    this.w1End,
    this.w1Desc,
    this.w2Title,
    this.w2Company,
    this.w2Start,
    this.w2End,
    this.w2Desc,
    this.e1Name,
    this.e1Start,
    this.e1Grad,
    this.e1Degree,
    this.e1Major,
    this.e1GPA,
    this.e2Name,
    this.e2Start,
    this.e2Grad,
    this.e2Degree,
    this.e2Major,
    this.e2GPA,
    this.skills,
    this.linkedInUrl,
    this.accepted
  );
}

enum Acceptance {
  accepted, notAccepted, inReview
}