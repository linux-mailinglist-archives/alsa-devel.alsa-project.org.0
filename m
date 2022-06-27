Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0EA55B85D
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 09:54:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F2F715CC;
	Mon, 27 Jun 2022 09:53:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F2F715CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656316477;
	bh=1DMoCsrswDyCg7zUSSkAoaUgSpMNiJfrMu8y9ohUyWQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bjyyCyX+ffH+cK0ydT+5nansyGPu6A6su+EJX4m3pZvn8VgM51EQHBB/O/HewOAoi
	 GHJY+uHaIav1UoFvWiTo4wW40EYXsNMCMixtgx0e45UkfDSoIzA/7tZmX0d9hxcrfR
	 gj+cNK2BFzIYBA/9S9iPhJ75PCdJfjht4l7acuR8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF509F800E9;
	Mon, 27 Jun 2022 09:53:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9090DF804FA; Mon, 27 Jun 2022 09:53:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E30BF800E9
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 09:53:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E30BF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="VGG9AAQT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1656316382; x=1687852382;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=h/AoKKoXNc3Rq8V2c3hlG/7uD1Te+5Trb9BH8fj762M=;
 b=VGG9AAQTDZc5oG6fWmLh+RtY79WRNfdPr3asxm4rPYjIzBvdu6x1OfcS
 o+Y1JWfZ1ZnfCH+tHTX2AccgW3HWYmn23RN4Pd/auQ2kmPZIWsJJwK6hA
 CC/4syGDBtsfTPVzvDAUZhyvG6NUyiEbjv3v9eK7aPYsv7HxBCdFgSByz g=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 27 Jun 2022 00:50:01 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 00:50:00 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 27 Jun 2022 00:50:00 -0700
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 27 Jun 2022 00:49:54 -0700
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, 
 <broonie@kernel.org>, <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
 <bgoswami@quicinc.com>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <quic_rohkumar@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>, Linus Walleij
 <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH v5 2/2] pinctrl: qcom: sc7280: Add clock optional check for
 ADSP bypass targets
Date: Mon, 27 Jun 2022 13:19:24 +0530
Message-ID: <1656316164-28666-3-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1656316164-28666-1-git-send-email-quic_srivasam@quicinc.com>
References: <1656316164-28666-1-git-send-email-quic_srivasam@quicinc.com>
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

Update lpass lpi pin control driver, with clock optional check for ADSP
disabled platforms. This check required for distingushing ADSP based
platforms and ADSP bypass platforms.
In case of ADSP enabled platforms, where audio is routed through ADSP
macro and decodec GDSC Switches are triggered as clocks by pinctrl
driver and ADSP firmware controls them. So It's mandatory to enable
them in ADSP based solutions.
In case of ADSP bypass platforms clock voting is optional as these macro
and dcodec GDSC switches are maintained as power domains and operated from
lpass clock drivers.
Remove redundant private data variable is_clk_optional.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c        | 2 +-
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h        | 1 -
 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 74810ec..e97ce45 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -401,7 +401,7 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
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
diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
index 2add9a4..d615b6c5 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
@@ -141,7 +141,6 @@ static const struct lpi_pinctrl_variant_data sc7280_lpi_data = {
 	.ngroups = ARRAY_SIZE(sc7280_groups),
 	.functions = sc7280_functions,
 	.nfunctions = ARRAY_SIZE(sc7280_functions),
-	.is_clk_optional = true,
 };
 
 static const struct of_device_id lpi_pinctrl_of_match[] = {
-- 
2.7.4

