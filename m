Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7052D51A19E
	for <lists+alsa-devel@lfdr.de>; Wed,  4 May 2022 15:58:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC8781607;
	Wed,  4 May 2022 15:57:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC8781607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651672712;
	bh=4PraZVzUl0qDj0Lj/5JylJqwOhhF7rKZCu1A92K5zPg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VfihASup3muQ7CG9cy2t2ZXlEj1yp1gknEHHQtRg8rKEjPayCENiZLrsbqeSX59Ns
	 j+2+DA3X1cHpP9QQGoUwBKddK4lhZzuwLfN1AQgOygw5FyNLK8x9ZNDiaa3HsXSEaa
	 B1jU6ET+eeeOXkUKzIGHPQCyYpHHsuugNNMlv2tA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F08BF80508;
	Wed,  4 May 2022 15:57:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E607F80508; Wed,  4 May 2022 15:57:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF7C1F80506
 for <alsa-devel@alsa-project.org>; Wed,  4 May 2022 15:57:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF7C1F80506
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="iPbnEZCg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651672638; x=1683208638;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=32DTrSFoB5STaJHIEVVCzkYM4SEkuLUEXAmueS3X3EM=;
 b=iPbnEZCgKhL9P3cRi71uBry68eZazSonRmiDq8ZTxMN0ks9KVnFOgMIP
 WLA9veoyiI6hJN8hIi0HKHnaJoFYdREmoZmomLarUQWzFMcyGKx3QuzeV
 3qYPcFW87evIiN/AaAwDKysuwnGdgsIUCj+VJwpYz7lF4pNd/L7YgUrtM 4=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 04 May 2022 06:57:13 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 06:57:12 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 4 May 2022 06:56:52 -0700
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 4 May 2022 06:56:46 -0700
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, 
 <broonie@kernel.org>, <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
 <bgoswami@quicinc.com>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <quic_rohkumar@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>, Linus Walleij
 <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH 2/2] pinctrl: qcom: sc7280: Add lpi pinctrl variant data
 structure for adsp based targets
Date: Wed, 4 May 2022 19:26:20 +0530
Message-ID: <1651672580-18952-3-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1651672580-18952-1-git-send-email-quic_srivasam@quicinc.com>
References: <1651672580-18952-1-git-send-email-quic_srivasam@quicinc.com>
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

Add compatible string and lpi pinctrl variant data structure for adsp enabled
sc7280 platforms.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
---
 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
index 2add9a4..c9e85d9 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
@@ -134,6 +134,16 @@ static const struct lpi_function sc7280_functions[] = {
 	LPI_FUNCTION(wsa_swr_data),
 };
 
+static const struct lpi_pinctrl_variant_data sc7280_adsp_lpi_data = {
+	.pins = sc7280_lpi_pins,
+	.npins = ARRAY_SIZE(sc7280_lpi_pins),
+	.groups = sc7280_groups,
+	.ngroups = ARRAY_SIZE(sc7280_groups),
+	.functions = sc7280_functions,
+	.nfunctions = ARRAY_SIZE(sc7280_functions),
+	.is_clk_optional = false,
+};
+
 static const struct lpi_pinctrl_variant_data sc7280_lpi_data = {
 	.pins = sc7280_lpi_pins,
 	.npins = ARRAY_SIZE(sc7280_lpi_pins),
@@ -149,6 +159,10 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
 	       .compatible = "qcom,sc7280-lpass-lpi-pinctrl",
 	       .data = &sc7280_lpi_data,
 	},
+	{
+		.compatible = "qcom,sc7280-lpass-adsp-lpi-pinctrl",
+		.data = &sc7280_adsp_lpi_data,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
-- 
2.7.4

