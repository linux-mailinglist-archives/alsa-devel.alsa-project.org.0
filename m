Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 639BA54668C
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 14:25:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01C621AE4;
	Fri, 10 Jun 2022 14:25:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01C621AE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654863950;
	bh=u11TtPvn6ZGBP5EJm4i1E8GtrWVfSFlv/d6s0M4HFHc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nN909xnAMgyK4y5MWnVsfU/RvGQV841BG8a6DZ3MZMtd+Bt6u4U1m9LK6Ib61Vri6
	 mlmRCUZuu4suH3lglK7A6iL0WggkIky2eZesQD9xmdPu6ajI3LSH7Zb48m289B45fW
	 YgbaCDgqRKlJq2zR3wIW405+AhQs9Bbm4inRqOyk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCC17F80520;
	Fri, 10 Jun 2022 14:24:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7EACF804DA; Fri, 10 Jun 2022 14:24:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7511BF804DA
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 14:24:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7511BF804DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="NKbabWuy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1654863860; x=1686399860;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=iZU00wPd4VsQLMsMnl3IznLqoeJoDA5gPsj07qh4nJs=;
 b=NKbabWuydQ7sNGASgiEQWdN2d4XbXgahmy0BYJepl/rpnTOhp1O6ureT
 3ZTCPwthEQzfJFQtBLbjxQArl8BtWJ7WpIU7O+0RjYm9lH6UcF6CbVlbb
 AgRNIIm4WgCclVtkYBYEFKftys941TCMcsglAFXYb18l9JBcuk3otoTU4 c=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 10 Jun 2022 05:24:14 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 05:24:14 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 10 Jun 2022 05:24:14 -0700
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 10 Jun 2022 05:24:08 -0700
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, 
 <broonie@kernel.org>, <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
 <bgoswami@quicinc.com>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <quic_rohkumar@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>, <vkoul@kernel.org>
Subject: [PATCH v5 1/2] soundwire: qcom: Add flag for software clock gating
 check
Date: Fri, 10 Jun 2022 17:53:34 +0530
Message-ID: <1654863815-3970-2-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1654863815-3970-1-git-send-email-quic_srivasam@quicinc.com>
References: <1654863815-3970-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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
 drivers/soundwire/qcom.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index a3fccf0..eb3c66e 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -181,6 +181,7 @@ struct qcom_swrm_ctrl {
 struct qcom_swrm_data {
 	u32 default_cols;
 	u32 default_rows;
+	bool sw_clk_gate_required;
 };
 
 static const struct qcom_swrm_data swrm_v1_3_data = {
@@ -1311,6 +1312,15 @@ static int qcom_swrm_probe(struct platform_device *pdev)
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
@@ -1336,10 +1346,6 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	ctrl->bus.compute_params = &qcom_swrm_compute_params;
 	ctrl->bus.clk_stop_timeout = 300;
 
-	ctrl->audio_cgcr = devm_reset_control_get_exclusive(dev, "swr_audio_cgcr");
-	if (IS_ERR(ctrl->audio_cgcr))
-		dev_err(dev, "Failed to get audio_cgcr reset required for soundwire-v1.6.0\n");
-
 	ret = qcom_swrm_get_port_config(ctrl);
 	if (ret)
 		goto err_clk;
-- 
2.7.4

