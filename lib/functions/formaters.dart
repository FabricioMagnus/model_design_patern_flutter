class Formaters {
  String captionFormater(String text) {
    return text
        .replaceAllMapped(
          RegExp(r"(^\w{1})|(\s+\w{1})"),
          (match) => match.group(0)!.toUpperCase(),
        )
        .toLowerCase();
  }
}
