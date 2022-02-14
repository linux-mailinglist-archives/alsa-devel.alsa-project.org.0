Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 237854B5481
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Feb 2022 16:22:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B46F18D8;
	Mon, 14 Feb 2022 16:21:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B46F18D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644852121;
	bh=sf9HVST5mktgIpvoJ1djIwG3oOrEeqymQ7eKnd3pJkw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sad04gIA5njIk2ZTHpFNrEmqaKYtSumobWL2fmTO0GnlKI+7BXGJqwvQcqjWkSGNM
	 2OAeiXlMNSoD8Bps+lHPSHYGAa1TwvEQXJcnj6Z9eboq3iqTxilHYQISOj8tuvimlN
	 5TNZa8i2KF3017NI16/rN3ZSw/k2GebxhHlafwv4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20C4FF80515;
	Mon, 14 Feb 2022 16:21:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1C46F804D1; Mon, 14 Feb 2022 16:21:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0E52F80430
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 16:21:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0E52F80430
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="Xk9+GFmb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644852066; x=1676388066;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=uHYs5i5tsOn7AC9eTjApEogxg8S/6QrNxF6kUCTkTSE=;
 b=Xk9+GFmb2kmPNHT7XWJydDuZcWf5Pj6zXs2cwU5D7O/x/N+y6ejW0Gpm
 lhkTN5SvnpX+jk+EPpslFYTMZEzrJrLOC44MAeVqAVTZqUVl7x/hZ9cJi
 OSvuhfIJwFrjX4OUsdsVTAxLrblZW3ZUWmEIF9krbtN9hR+1Pf4oQvnNW s=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 14 Feb 2022 07:21:03 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 07:21:02 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 14 Feb 2022 07:20:42 -0800
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 14 Feb 2022 07:20:35 -0800
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, 
 <broonie@kernel.org>, <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
 <bgoswami@codeaurora.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <rohitkr@codeaurora.org>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>, Linus Walleij
 <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH v6 4/7] pinctrl: qcom: Update lpi pin group structure
Date: Mon, 14 Feb 2022 20:49:51 +0530
Message-ID: <1644851994-22732-5-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644851994-22732-1-git-send-email-quic_srivasam@quicinc.com>
References: <1644851994-22732-1-git-send-email-quic_srivasam@quicinc.com>
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
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 44 +++++++++++++++-----------------
 1 file changed, 21 insertions(+), 23 deletions(-)

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

