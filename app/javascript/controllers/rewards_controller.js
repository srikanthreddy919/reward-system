import { Controller } from "stimulus";
import Rails from "@rails/ujs";

export default class extends Controller {
  static targets = ["rewardSource", "result", "errors"];

  calculate() {
    const f = this.rewardSourceTarget.files[0];
    const resultTarget = this.resultTarget;
    const errorsTarget = this.errorsTarget;
    if (f) {
      const send = this.sendData;
      const reader = new FileReader();
      reader.onload = function (e) {
        // binary data
        send(
          { reward: { binary_data: reader.result } },
          resultTarget,
          errorsTarget
        );
      };
      reader.readAsBinaryString(f);
    }
  }

  sendData(data, resultTarget, errorsTarget) {
    Rails.ajax({
      type: "POST",
      url: "/rewards",
      beforeSend(xhr, options) {
        xhr.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
        options.data = JSON.stringify(data);
        return true;
      },
      data: data,
      success: (response) => {
        errorsTarget.innerHTML = "";
        resultTarget.innerHTML = `<h4>Result</h4> ${JSON.stringify(response)}`;
      },
      error: (error) => {
        resultTarget.innerHTML = "";
        errorsTarget.innerHTML = `<div class="alert alert-danger">Issue noticed in data file</div>`;
      },
    });
  }
}
