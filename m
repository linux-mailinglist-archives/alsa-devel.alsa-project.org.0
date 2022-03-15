Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EA74D9F5E
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Mar 2022 16:53:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 739CB18E7;
	Tue, 15 Mar 2022 16:53:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 739CB18E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647359639;
	bh=xCum871LsBxXeh3WaotiBgOH7+sqMNk0amVwRG+WYrE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sBNo1jRqosO9T6dvq6qfUcIpKrUBHo+n6VxWcOR952eqs/rkrkDpAcLBGZU6gmrgQ
	 E46FLRxYEj5p67MC4DwwlqHsoX1vvPulYNU8YEW8aARFnPtv0jUxrdw08yPN06OnQR
	 jhzXBlEfghaVcdmEfR5lVz8NPOmBgwHKah/2cxFY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97440F80537;
	Tue, 15 Mar 2022 16:51:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D608F8051D; Tue, 15 Mar 2022 16:51:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3EFE2F8051D
 for <alsa-devel@alsa-project.org>; Tue, 15 Mar 2022 16:51:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EFE2F8051D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="PAzV5naF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647359482; x=1678895482;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=Gj2Kq1ZHJ6x7GZTWmwzIUIYQqVwN6T63tmpAvJkyQNg=;
 b=PAzV5naF0TP1w5mMZBw80cq7spoeyotEW8uDFG0bGLV0qKxeLQwXMp9H
 c8Lohsqc9gbutQUQqMiuzcuvrWfQiX548dreyThCT0E+QP6UsjrQE+2OX
 R3tT78n1VJXW3AK8yacLZ9UGHAGHO+xWwHMVPYYHO1OVXEKubjzIdGr55 E=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 15 Mar 2022 08:51:16 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 08:51:15 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 15 Mar 2022 08:50:58 -0700
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 15 Mar 2022 08:50:51 -0700
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, 
 <broonie@kernel.org>, <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
 <bgoswami@codeaurora.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <rohitkr@codeaurora.org>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>, Linus Walleij
 <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH v11 4/7] pinctrl: qcom: Update lpi pin group custiom functions
 with framework generic functions
Date: Tue, 15 Mar 2022 21:20:10 +0530
Message-ID: <1647359413-31662-5-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1647359413-31662-1-git-send-email-quic_srivasam@quicinc.com>
References: <1647359413-31662-1-git-send-email-quic_srivasam@quicinc.com>
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

Update custom pin group structure members with framework generic group_desc structure
and replace the driver's custom pinctrl_ops with framework provided generic pin control
group functions to avoid redundant code written in lpass lpi driver.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
---
 drivers/pinctrl/qcom/Kconfig             |  1 +
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 98 +++++++++++++++-----------------
 2 files changed, 48 insertions(+), 51 deletions(-)

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index ca6f68a..31c4aa6 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -351,6 +351,7 @@ config PINCTRL_LPASS_LPI
 	select PINMUX
 	select PINCONF
 	select GENERIC_PINCONF
+	select GENERIC_PINCTRL_GROUPS
 	depends on GPIOLIB
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 3c15f80..5e27a38 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -51,11 +51,11 @@
 
 #define LPI_PINGROUP(id, soff, f1, f2, f3, f4)		\
 	{						\
-		.name = "gpio" #id,			\
-		.pins = gpio##id##_pins,		\
+		.group.name = "gpio" #id,			\
+		.group.pins = gpio##id##_pins,		\
 		.pin = id,				\
 		.slew_offset = soff,			\
-		.npins = ARRAY_SIZE(gpio##id##_pins),	\
+		.group.num_pins = ARRAY_SIZE(gpio##id##_pins),	\
 		.funcs = (int[]){			\
 			LPI_MUX_gpio,			\
 			LPI_MUX_##f1,			\
@@ -67,9 +67,7 @@
 	}
 
 struct lpi_pingroup {
-	const char *name;
-	const unsigned int *pins;
-	unsigned int npins;
+	struct group_desc group;
 	unsigned int pin;
 	/* Bit offset in slew register for SoundWire pins only */
 	int slew_offset;
@@ -150,20 +148,20 @@ enum sm8250_lpi_functions {
 	LPI_MUX__,
 };
 
-static const unsigned int gpio0_pins[] = { 0 };
-static const unsigned int gpio1_pins[] = { 1 };
-static const unsigned int gpio2_pins[] = { 2 };
-static const unsigned int gpio3_pins[] = { 3 };
-static const unsigned int gpio4_pins[] = { 4 };
-static const unsigned int gpio5_pins[] = { 5 };
-static const unsigned int gpio6_pins[] = { 6 };
-static const unsigned int gpio7_pins[] = { 7 };
-static const unsigned int gpio8_pins[] = { 8 };
-static const unsigned int gpio9_pins[] = { 9 };
-static const unsigned int gpio10_pins[] = { 10 };
-static const unsigned int gpio11_pins[] = { 11 };
-static const unsigned int gpio12_pins[] = { 12 };
-static const unsigned int gpio13_pins[] = { 13 };
+static int gpio0_pins[] = { 0 };
+static int gpio1_pins[] = { 1 };
+static int gpio2_pins[] = { 2 };
+static int gpio3_pins[] = { 3 };
+static int gpio4_pins[] = { 4 };
+static int gpio5_pins[] = { 5 };
+static int gpio6_pins[] = { 6 };
+static int gpio7_pins[] = { 7 };
+static int gpio8_pins[] = { 8 };
+static int gpio9_pins[] = { 9 };
+static int gpio10_pins[] = { 10 };
+static int gpio11_pins[] = { 11 };
+static int gpio12_pins[] = { 12 };
+static int gpio13_pins[] = { 13 };
 static const char * const swr_tx_clk_groups[] = { "gpio0" };
 static const char * const swr_tx_data_groups[] = { "gpio1", "gpio2", "gpio5" };
 static const char * const swr_rx_clk_groups[] = { "gpio3" };
@@ -250,38 +248,10 @@ static int lpi_gpio_write(struct lpi_pinctrl *state, unsigned int pin,
 	return 0;
 }
 
-static int lpi_gpio_get_groups_count(struct pinctrl_dev *pctldev)
-{
-	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-
-	return pctrl->data->ngroups;
-}
-
-static const char *lpi_gpio_get_group_name(struct pinctrl_dev *pctldev,
-					   unsigned int group)
-{
-	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-
-	return pctrl->data->groups[group].name;
-}
-
-static int lpi_gpio_get_group_pins(struct pinctrl_dev *pctldev,
-				   unsigned int group,
-				   const unsigned int **pins,
-				   unsigned int *num_pins)
-{
-	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-
-	*pins = pctrl->data->groups[group].pins;
-	*num_pins = pctrl->data->groups[group].npins;
-
-	return 0;
-}
-
 static const struct pinctrl_ops lpi_gpio_pinctrl_ops = {
-	.get_groups_count	= lpi_gpio_get_groups_count,
-	.get_group_name		= lpi_gpio_get_group_name,
-	.get_group_pins		= lpi_gpio_get_group_pins,
+	.get_groups_count	= pinctrl_generic_get_group_count,
+	.get_group_name		= pinctrl_generic_get_group_name,
+	.get_group_pins		= pinctrl_generic_get_group_pins,
 	.dt_node_to_map		= pinconf_generic_dt_node_to_map_group,
 	.dt_free_map		= pinctrl_utils_free_map,
 };
@@ -582,6 +552,28 @@ static const struct gpio_chip lpi_gpio_template = {
 	.dbg_show		= lpi_gpio_dbg_show,
 };
 
+static int lpi_build_pin_desc_groups(struct lpi_pinctrl *pctrl)
+{
+	struct group_desc *lpi_groups;
+	int i;
+
+	lpi_groups = devm_kcalloc(pctrl->dev, pctrl->data->npins,
+					 sizeof(*lpi_groups), GFP_KERNEL);
+	if (!lpi_groups)
+		return -ENOMEM;
+
+	for (i = 0; i < pctrl->data->npins; i++) {
+		const struct pinctrl_pin_desc *pin_info = pctrl->desc.pins + i;
+		struct group_desc *group = lpi_groups + i;
+
+		group->name = pin_info->name;
+		group->pins = (int *)&pin_info->number;
+		pinctrl_generic_add_group(pctrl->ctrl, group->name, group->pins, 1, NULL);
+	}
+
+	return 0;
+}
+
 static int lpi_pinctrl_probe(struct platform_device *pdev)
 {
 	const struct lpi_pinctrl_variant_data *data;
@@ -647,6 +639,10 @@ static int lpi_pinctrl_probe(struct platform_device *pdev)
 		goto err_pinctrl;
 	}
 
+	ret = lpi_build_pin_desc_groups(pctrl);
+	if (ret)
+		return ret;
+
 	ret = devm_gpiochip_add_data(dev, &pctrl->chip, pctrl);
 	if (ret) {
 		dev_err(pctrl->dev, "can't add gpio chip\n");
-- 
2.7.4

