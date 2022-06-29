Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC1255F9A0
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 09:56:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED183163C;
	Wed, 29 Jun 2022 09:55:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED183163C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656489389;
	bh=rfcK1uKoaPMS0CuOJTXVwcSN+OK+AtV4TU/iYWBhWak=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=s2zJIfzQoD6a2fM6P4UP11Bm2lO7NL9nEJ8lXY/1+BEn0zgsXEwGgciw5qIy1OZeL
	 hZAYsSmB/fLv9/Vfbi/UNvS4MxyXSKYxsj629n7HuGbu0pQEHFbS7dSGnyFMS9dTSI
	 sxoDeh+aBRIuimG8is7UY4s6tIEiO+bzTbGp9ymY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C530F80107;
	Wed, 29 Jun 2022 09:55:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DDF4F8020D; Wed, 29 Jun 2022 09:55:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7E7FF80107
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 09:55:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7E7FF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="DJUBMuHO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1656489323; x=1688025323;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=QH2e8YbYNE2n6mUVI4ZdSzcrVKNaUgrSOCe7/29sjP4=;
 b=DJUBMuHOnkA0ZxMV9OOd/NymEQ6g7ZOQ/0GetWHSzZ1qs6wYNIyj6lmY
 XN4xqr6CFN8GOHWR1NI1/ZSyY01gTLXmVuQw4E3gNAMq1cFNS8rCeQINV
 RVJLCzazuYvyfg0nbQWeIZa/QeOMSWc+lFFFy4JnRRVHo8X4G4Zbe8u3f I=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 29 Jun 2022 00:55:13 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 00:55:12 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 29 Jun 2022 00:55:12 -0700
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 29 Jun 2022 00:55:05 -0700
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, 
 <broonie@kernel.org>, <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
 <bgoswami@quicinc.com>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <quic_rohkumar@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>, Linus Walleij
 <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH v2] pinctrl: qcom: sc7280: Fix compile bug
Date: Wed, 29 Jun 2022 13:24:50 +0530
Message-ID: <1656489290-20881-1-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
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

Fix the compilation error, caused by updating constant variable.
Hence remove redundant constant variable, which is no more useful
as per new design.

The issue is due to some unstaged changes. Fix it up.

Fixes: 36fe26843d6d ("pinctrl: qcom: sc7280: Add clock optional check for ADSP bypass targets")

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
Changes Since V1:
    -- Fix typo errors in commit message.

 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 5 +----
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h | 1 -
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index b5d1b99..e97ce45 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -388,9 +388,6 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
 	pctrl->data = data;
 	pctrl->dev = &pdev->dev;
 
-	data->is_clk_optional = of_property_read_bool(dev->of_node,
-						      "qcom,adsp-bypass-mode");
-
 	pctrl->clks[0].id = "core";
 	pctrl->clks[1].id = "audio";
 
@@ -404,7 +401,7 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(pctrl->slew_base),
 				     "Slew resource not provided\n");
 
-	if (data->is_clk_optional)
+	if (of_property_read_bool(dev->of_node, "qcom,adsp-bypass-mode"))
 		ret = devm_clk_bulk_get_optional(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
 	else
 		ret = devm_clk_bulk_get(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
index 759d5d8..afbac2a 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
@@ -77,7 +77,6 @@ struct lpi_pinctrl_variant_data {
 	int ngroups;
 	const struct lpi_function *functions;
 	int nfunctions;
-	bool is_clk_optional;
 };
 
 int lpi_pinctrl_probe(struct platform_device *pdev);
-- 
2.7.4

