Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 297504D15AD
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 12:07:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE9BF17B2;
	Tue,  8 Mar 2022 12:06:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE9BF17B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646737627;
	bh=LcpmTmCTYtCcvNzkq4geoDZvsuePiP7uz7NBz/vvWgY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o3GHpMB6Ur6Ko5isBHA38zGhJsVsBjvFFj6AMF12Fa55E+1cMbBxvRFOdaLAujVGC
	 CmffFptIs2HmG9oNH0yuzAvtL75D7HlkzbRcKynS4w/SdMzRc/lEbMtN/LN++q1dqz
	 CpYuq6l9wp2CeWhYKMdYPH/snSx9QQDeGGkVNx44=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9173DF80528;
	Tue,  8 Mar 2022 12:04:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E6A0F8053B; Tue,  8 Mar 2022 12:04:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4389F80528
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 12:04:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4389F80528
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="hYYgsxHE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1646737462; x=1678273462;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=E08tgNQeQ9Ef3DLQks66FyP1PMu959mkmFifh3k8TxU=;
 b=hYYgsxHE8iWpeGtfV+4Dpm95SR9vfRhq6M3iZHXT7oP+MOv8isIHg1Px
 We12vrPsDfiIQVFz5klq9Ujd34lo4g5FVFLJ8nnqn7BQJ0JpqkkSpIUbJ
 rhoEaYr/Trr7mA7n+uR694RhGhKGdhyBRnuOvYmlj9XJ474PJeVJg9w+D 4=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 08 Mar 2022 03:04:18 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 03:04:18 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 8 Mar 2022 03:04:18 -0800
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 8 Mar 2022 03:04:11 -0800
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, 
 <broonie@kernel.org>, <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
 <bgoswami@codeaurora.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <rohitkr@codeaurora.org>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>, Linus Walleij
 <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH v10 7/7] pinctrl: qcom: Update clock voting as optional
Date: Tue, 8 Mar 2022 16:33:14 +0530
Message-ID: <1646737394-4740-8-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1646737394-4740-1-git-send-email-quic_srivasam@quicinc.com>
References: <1646737394-4740-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c        | 12 +++++++++---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h        |  1 +
 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c |  1 +
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 1ab572f..c618b74 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -407,9 +407,15 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(pctrl->slew_base),
 				     "Slew resource not provided\n");
 
-	ret = devm_clk_bulk_get(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
-	if (ret)
-		return dev_err_probe(dev, ret, "Can't get clocks\n");
+	if (data->is_clk_optional) {
+		ret = devm_clk_bulk_get_optional(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
+		if (ret)
+			return dev_err_probe(dev, ret, "Can't get clocks\n");
+	} else {
+		ret = devm_clk_bulk_get(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
+		if (ret)
+			return dev_err_probe(dev, ret, "Can't get clocks\n");
+	}
 
 	ret = clk_bulk_prepare_enable(MAX_LPI_NUM_CLKS, pctrl->clks);
 	if (ret)
diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
index afbac2a..3bcede6 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
@@ -77,6 +77,7 @@ struct lpi_pinctrl_variant_data {
 	int ngroups;
 	const struct lpi_function *functions;
 	int nfunctions;
+	int is_clk_optional;
 };
 
 int lpi_pinctrl_probe(struct platform_device *pdev);
diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
index d67ff25..304d8a2 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
@@ -142,6 +142,7 @@ static const struct lpi_pinctrl_variant_data sc7280_lpi_data = {
 	.ngroups = ARRAY_SIZE(sc7280_groups),
 	.functions = sc7280_functions,
 	.nfunctions = ARRAY_SIZE(sc7280_functions),
+	.is_clk_optional = 1,
 };
 
 static const struct of_device_id lpi_pinctrl_of_match[] = {
-- 
2.7.4

