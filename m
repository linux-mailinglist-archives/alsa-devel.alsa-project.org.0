Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CEA4D15A3
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 12:06:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C3791779;
	Tue,  8 Mar 2022 12:05:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C3791779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646737577;
	bh=6iQENZeT3ipNPqj7b5FaTx+/tfgl/UUECr+CUvKOoaE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LWL53SoPIcyJ/bXYqVJsK5HtTL+cEGb4qdEcQSdtwWfyw8GPP+WWWIVAmItniVHbh
	 Ig0MDb0EiQqEZuFPyiYi9Cmb14ePzIzjYkqTgbJzI6dQRI8ZY/0YyHPclP5k1/EDRx
	 8QijPlFGyDNDDxAo/vtVw21fOymIzMYvOY/1EUOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CADAF80526;
	Tue,  8 Mar 2022 12:04:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F27AF80520; Tue,  8 Mar 2022 12:04:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE995F80520
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 12:04:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE995F80520
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="MMxc0vN8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1646737445; x=1678273445;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=YpjfEbvehiXe8e4XM4EUc1DJ9S6Xucnc90uQamt5Q2Q=;
 b=MMxc0vN87WPPjODMiS7uXrfiQmXSkipCVKmK/gnvv5ciAb2HOQtXwFWX
 2GbMG1VI1Tlhhh4olmMmTEK3uPVfxJFffYlhMSJmbuFaxdF8QM6e88RZO
 8eGOGzBrpT5fHQeCQgxzGSUbrvMJZR4M28G7PNeoKdtPm59GAFkP1kNgJ E=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 08 Mar 2022 03:04:00 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 03:03:59 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 8 Mar 2022 03:03:58 -0800
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 8 Mar 2022 03:03:52 -0800
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, 
 <broonie@kernel.org>, <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
 <bgoswami@codeaurora.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <rohitkr@codeaurora.org>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>, Linus Walleij
 <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH v10 4/7] pinctrl: qcom: Update lpi pin group structure
Date: Tue, 8 Mar 2022 16:33:11 +0530
Message-ID: <1646737394-4740-5-git-send-email-quic_srivasam@quicinc.com>
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

Update lpi group structure with core group_desc structure
to avoid redundant struct params.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
---
 drivers/pinctrl/qcom/Kconfig             |  1 +
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 44 +++++++++++++++-----------------
 2 files changed, 22 insertions(+), 23 deletions(-)

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
index 3c15f80..54750ba 100644
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
@@ -262,7 +260,7 @@ static const char *lpi_gpio_get_group_name(struct pinctrl_dev *pctldev,
 {
 	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 
-	return pctrl->data->groups[group].name;
+	return pctrl->data->groups[group].group.name;
 }
 
 static int lpi_gpio_get_group_pins(struct pinctrl_dev *pctldev,
@@ -272,8 +270,8 @@ static int lpi_gpio_get_group_pins(struct pinctrl_dev *pctldev,
 {
 	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 
-	*pins = pctrl->data->groups[group].pins;
-	*num_pins = pctrl->data->groups[group].npins;
+	*pins = pctrl->data->groups[group].group.pins;
+	*num_pins = pctrl->data->groups[group].group.num_pins;
 
 	return 0;
 }
-- 
2.7.4

