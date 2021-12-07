Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 286D046BFA3
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 16:39:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 971262532;
	Tue,  7 Dec 2021 16:38:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 971262532
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638891544;
	bh=jYnzQU+8sUH+fCjEetSp/FiI/6kjU0IDqtGzShSd1JI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=onGC4aQdR5pJhEb7RAxT6c8Nl9tZEeaG5laGsKnl8cmdxHx6fGLil9w9lXxEuEg4q
	 gIkGmy7fonuj7BwaQKuR3HPOfBYbgHEVY9/yQUcR0AG9/mGjuMQXf+Wir0yQI3ngbo
	 cm6/5g1DkSPMOPVks1SJ2k8fTHP2kVkiq4DS/iBU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FD49F80526;
	Tue,  7 Dec 2021 16:36:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECA49F80519; Tue,  7 Dec 2021 16:36:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5794F8028D
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 16:36:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5794F8028D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="q2ZopS6j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1638891398; x=1670427398;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=RYB5MkQu17Es82e4gF91FzoGJGpZTyWyZdc6PsO+lsQ=;
 b=q2ZopS6jCSTYOrg0hcCeWlRwMMvWaLguQpeBDmIz4gYa3KyFfmqTxpu0
 1kEZ88Zsg571n7IvPCK8kgsgRB9uVw+sr3QuL5SOUO1F/xlGomY9sIqM0
 lJ1Sp6h0QtIjVRzon0iSfky0BOwB85bCdBGADpsKQjh79zum2q9vahZyW 0=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 07 Dec 2021 07:36:34 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 07:36:34 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 7 Dec 2021 07:36:34 -0800
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 7 Dec 2021 07:36:27 -0800
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, 
 <broonie@kernel.org>, <robh+dt@kernel.org>, <plai@codeaurora.org>,
 <bgoswami@codeaurora.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <rohitkr@codeaurora.org>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>, Linus Walleij
 <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH v5 5/5] pinctrl: qcom: Update clock voting as optional
Date: Tue, 7 Dec 2021 21:05:39 +0530
Message-ID: <1638891339-21806-6-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1638891339-21806-1-git-send-email-quic_srivasam@quicinc.com>
References: <1638891339-21806-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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

Update bulk clock voting to optional voting as ADSP bypass platform doesn't
need macro and decodec clocks, these are maintained as power domains and
operated from lpass audio core cc.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c        | 16 +++++++++-------
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h        |  1 +
 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c |  1 +
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 23cf133..bc288ed 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -408,13 +408,15 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(pctrl->slew_base),
 				     "Slew resource not provided\n");
 
-	ret = devm_clk_bulk_get(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
-	if (ret)
-		return dev_err_probe(dev, ret, "Can't get clocks\n");
-
-	ret = clk_bulk_prepare_enable(MAX_LPI_NUM_CLKS, pctrl->clks);
-	if (ret)
-		return dev_err_probe(dev, ret, "Can't enable clocks\n");
+	if (!data->is_clk_optional) {
+		ret = devm_clk_bulk_get(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
+		if (ret)
+			return dev_err_probe(dev, ret, "Can't get clocks\n");
+
+		ret = clk_bulk_prepare_enable(MAX_LPI_NUM_CLKS, pctrl->clks);
+		if (ret)
+			return dev_err_probe(dev, ret, "Can't enable clocks\n");
+	}
 
 	pctrl->desc.pctlops = &lpi_gpio_pinctrl_ops;
 	pctrl->desc.pmxops = &lpi_gpio_pinmux_ops;
diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
index 99c5e4b..5908c27 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
@@ -75,6 +75,7 @@ struct lpi_pinctrl_variant_data {
 	int ngroups;
 	const struct lpi_function *functions;
 	int nfunctions;
+	int is_clk_optional;
 };
 
 int lpi_pinctrl_probe(struct platform_device *pdev);
diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
index 94bec15..d9e404b 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
@@ -143,6 +143,7 @@ static const struct lpi_pinctrl_variant_data sc7280_lpi_data = {
 	.ngroups = ARRAY_SIZE(sc7280_groups),
 	.functions = sc7280_functions,
 	.nfunctions = ARRAY_SIZE(sc7280_functions),
+	.is_clk_optional = 1,
 };
 
 static const struct of_device_id lpi_pinctrl_of_match[] = {
-- 
2.7.4

