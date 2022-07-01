Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 705E8562C78
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Jul 2022 09:19:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13D9716BF;
	Fri,  1 Jul 2022 09:18:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13D9716BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656659949;
	bh=si7m5IZcr5q2q9MlmmPkP6QDkoXLmXxVzghc6WIBtM0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G2E5BfRfhlaKbZsjBlnNsoExh8EwntvVYrP7wjsyT/Db71rQilSPe92fysdg/6Lvw
	 WcMR9e44bRnYsse4YzSNfHk+myijH68DaQAv6kEkzZcR9Bu96bTdX1r+CYtM1AsYtP
	 5pRfyTtJEscqHKJ7c0iOAYCFFaV63985xz9SmC2Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74084F8052E;
	Fri,  1 Jul 2022 09:17:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35CDDF804E2; Fri,  1 Jul 2022 09:17:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 928A1F8014E
 for <alsa-devel@alsa-project.org>; Fri,  1 Jul 2022 09:17:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 928A1F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="RUusuBp3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1656659857; x=1688195857;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=GBB5iuEgmhph9RjzbVLlUF6rwOvV59YvfcO8hpiv5V4=;
 b=RUusuBp3jmIyh3Go/0ZyEH/DQd6zrME9Sw+ViETE1gHEQo2wP5euacmV
 9IdNwMQTXveYzpkUY3ubhyCtbG+2EeZ70OihIoYQ7k3zpOfLZWovjJtlC
 +J+IufkLzADe29wnLhTrD5DNoRl2ak0F18eNEyOF44DZUFIwvQQ+o6IB6 E=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 01 Jul 2022 00:17:33 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2022 00:17:32 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 1 Jul 2022 00:17:32 -0700
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 1 Jul 2022 00:17:26 -0700
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, 
 <broonie@kernel.org>, <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
 <bgoswami@quicinc.com>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <quic_rohkumar@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>, <vkoul@kernel.org>
Subject: [RESEND v5 1/2] soundwire: qcom: Add flag for software clock gating
 check
Date: Fri, 1 Jul 2022 12:47:06 +0530
Message-ID: <1656659827-27450-2-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1656659827-27450-1-git-send-email-quic_srivasam@quicinc.com>
References: <1656659827-27450-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Cc: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Validate software clock gating required or not and do software
clock gating on hclk if soundwire is operational and keep it
running by adding flag in private data structure.
This is to avoid conflict between older architectures,
where software clock gating is not required and on latest
architectures, where software clock gating is mandatory.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 22b7063..5baceda 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -179,6 +179,7 @@ struct qcom_swrm_ctrl {
 struct qcom_swrm_data {
 	u32 default_cols;
 	u32 default_rows;
+	bool sw_clk_gate_required;
 };
 
 static const struct qcom_swrm_data swrm_v1_3_data = {
@@ -1307,6 +1308,15 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 			return PTR_ERR(ctrl->mmio);
 	}
 
+	if (data->sw_clk_gate_required) {
+		ctrl->audio_cgcr = devm_reset_control_get_exclusive(dev, "swr_audio_cgcr");
+		if (IS_ERR_OR_NULL(ctrl->audio_cgcr)) {
+			dev_err(dev, "Failed to get cgcr reset ctrl required for SW gating\n");
+			ret = PTR_ERR(ctrl->audio_cgcr);
+			goto err_init;
+		}
+	}
+
 	ctrl->irq = of_irq_get(dev->of_node, 0);
 	if (ctrl->irq < 0) {
 		ret = ctrl->irq;
-- 
2.7.4

