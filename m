Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D49F96230C8
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 17:56:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C83B1651;
	Wed,  9 Nov 2022 17:55:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C83B1651
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668012984;
	bh=K2KlKDIBuHsWNz6q0lKTqmG6JpQ8YzaIBSto60HStVA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lgDGtMdmV2ShFo82EHFXJqcKI7+KfXWAFtihn2XEtHWae9xV1VzDIaHXMrSGtdhNO
	 dIqTr99scesAH+4kiI2cTasP4pjhFTHi7qZyugkCfdngXcdXYKDOogGJJRRRyA0/1O
	 UDj4w3yDt68KnKuCENAsLyMh3pKZabUj05ojmomA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1BB9F80121;
	Wed,  9 Nov 2022 17:54:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC4CEF80580; Wed,  9 Nov 2022 17:53:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20AD4F80548
 for <alsa-devel@alsa-project.org>; Wed,  9 Nov 2022 17:53:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20AD4F80548
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="hwQoy/ji"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A9EDNjX027347; Wed, 9 Nov 2022 10:53:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=7U2hym3PhMYqBCChlIWoRSTMF7ZHOcUZRXT6D8RO+p0=;
 b=hwQoy/jis+57XFlEISXXFo0MN+KcCsu44zAvmmg2WV4/+xvPK5zXV1guZqKgFS8z3n7x
 lqZTf2qxHwfu+9cAPiY3ZZFIBUa6TixjS9X4cPP12sjPmTytt4oV5bZAY74CHUy+wN1H
 BynWWTor+KSNn43X3iTabtKif4eGbwu0cEcAtZMMY3MeD+IW2+efRXsC2eLkswIojyeE
 U6t7Vymd7n7iC2QAS4SOcJqy4LhHD94KPgj+DR5WHwIbNvsc2INKBnzOaIqNM5qgl+Zy
 9yDWOoe1R/NAD0Id+mSR69fu8IGe3hT7dFpOcKwG6o0gg7wbsAQZaMJ93AEPIz3jJAsz JQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3knm8pde7v-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Nov 2022 10:53:39 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.15; Wed, 9 Nov
 2022 10:53:36 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.15 via
 Frontend Transport; Wed, 9 Nov 2022 10:53:36 -0600
Received: from debianA11184.ad.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.92])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 130E7468;
 Wed,  9 Nov 2022 16:53:36 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <lee@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <linus.walleij@linaro.org>,
 <broonie@kernel.org>, <tglx@linutronix.de>, <maz@kernel.org>
Subject: [PATCH 08/12] regulator: arizona-micsupp: Support Cirrus Logic
 CS48L31/32/33
Date: Wed, 9 Nov 2022 16:53:27 +0000
Message-ID: <20221109165331.29332-9-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221109165331.29332-1-rf@opensource.cirrus.com>
References: <20221109165331.29332-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: fYDF8kqs5RQSNj7ODaY7winktvXz4zTy
X-Proofpoint-GUID: fYDF8kqs5RQSNj7ODaY7winktvXz4zTy
X-Proofpoint-Spam-Reason: safe
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>
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

This adds a new driver identity "cs48l32-micsupp" and probe function
so that this driver can be used to control the micsupp regulator on
Cirrus Logic CS48L31/32/33 audio codecs.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/regulator/Kconfig           |  8 ++--
 drivers/regulator/arizona-micsupp.c | 58 +++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 070e4403c6c2..1d6813b24f85 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -139,12 +139,12 @@ config REGULATOR_ARIZONA_LDO1
 
 config REGULATOR_ARIZONA_MICSUPP
 	tristate "Cirrus Madera and Wolfson Arizona class devices MICSUPP"
-	depends on MFD_ARIZONA || MFD_MADERA
+	depends on MFD_ARIZONA || MFD_MADERA || MFD_CS48L32
 	depends on SND_SOC
 	help
-	  Support for the MICSUPP regulators found on Cirrus Logic Madera codecs
-	  and Wolfson Microelectronic Arizona codecs
-	  devices.
+	  Support for the MICSUPP regulators found on Cirrus Logic Madera,
+	  Cirrus Logic CS48L31/32/33, and on Wolfson Microelectronic
+	  Arizona codecs.
 
 config REGULATOR_ARM_SCMI
 	tristate "SCMI based regulator driver"
diff --git a/drivers/regulator/arizona-micsupp.c b/drivers/regulator/arizona-micsupp.c
index 596ecd8041cd..bf154067ed34 100644
--- a/drivers/regulator/arizona-micsupp.c
+++ b/drivers/regulator/arizona-micsupp.c
@@ -24,6 +24,9 @@
 #include <linux/mfd/arizona/pdata.h>
 #include <linux/mfd/arizona/registers.h>
 
+#include <linux/mfd/cs48l32/core.h>
+#include <linux/mfd/cs48l32/registers.h>
+
 #include <linux/mfd/madera/core.h>
 #include <linux/mfd/madera/pdata.h>
 #include <linux/mfd/madera/registers.h>
@@ -225,6 +228,28 @@ static const struct regulator_desc madera_micsupp = {
 	.owner = THIS_MODULE,
 };
 
+static const struct regulator_desc cs48l32_micsupp = {
+	.name = "VOUT_MIC",
+	.supply_name = "VDD_CP",
+	.type = REGULATOR_VOLTAGE,
+	.n_voltages = 40,
+	.ops = &arizona_micsupp_ops,
+
+	.vsel_reg = CS48L32_LDO2_CTRL1,
+	.vsel_mask = CS48L32_LDO2_VSEL_MASK,
+	.enable_reg = CS48L32_CHARGE_PUMP1,
+	.enable_mask = CS48L32_CP2_EN_MASK,
+	.bypass_reg = CS48L32_CHARGE_PUMP1,
+	.bypass_mask = CS48L32_CP2_BYPASS_MASK,
+
+	.linear_ranges = arizona_micsupp_ext_ranges,
+	.n_linear_ranges = ARRAY_SIZE(arizona_micsupp_ext_ranges),
+
+	.enable_time = 3000,
+
+	.owner = THIS_MODULE,
+};
+
 static int arizona_micsupp_of_get_pdata(struct arizona_micsupp_pdata *pdata,
 					struct regulator_config *config,
 					const struct regulator_desc *desc)
@@ -361,6 +386,29 @@ static int madera_micsupp_probe(struct platform_device *pdev)
 					   &madera->pdata.micvdd);
 }
 
+static int cs48l32_micsupp_probe(struct platform_device *pdev)
+{
+	struct cs48l32_mfd *mfd = dev_get_drvdata(pdev->dev.parent);
+	struct arizona_micsupp *micsupp;
+	struct arizona_micsupp_pdata *pdata;
+
+	micsupp = devm_kzalloc(&pdev->dev, sizeof(*micsupp), GFP_KERNEL);
+	if (!micsupp)
+		return -ENOMEM;
+
+	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return -ENOMEM;
+
+	micsupp->regmap = mfd->regmap;
+	micsupp->dapm = &mfd->dapm;
+	micsupp->dev = mfd->dev;
+	micsupp->init_data = arizona_micsupp_ext_default;
+	micsupp->supply.supply = "VOUT_MIC";
+
+	return arizona_micsupp_common_init(pdev, micsupp, &cs48l32_micsupp, pdata);
+}
+
 static struct platform_driver arizona_micsupp_driver = {
 	.probe = arizona_micsupp_probe,
 	.driver		= {
@@ -375,9 +423,17 @@ static struct platform_driver madera_micsupp_driver = {
 	},
 };
 
+static struct platform_driver cs48l32_micsupp_driver = {
+	.probe = cs48l32_micsupp_probe,
+	.driver		= {
+		.name	= "cs48l32-micsupp",
+	},
+};
+
 static struct platform_driver * const arizona_micsupp_drivers[] = {
 	&arizona_micsupp_driver,
 	&madera_micsupp_driver,
+	&cs48l32_micsupp_driver,
 };
 
 static int __init arizona_micsupp_init(void)
@@ -396,7 +452,9 @@ module_exit(arizona_micsupp_exit);
 
 /* Module information */
 MODULE_AUTHOR("Mark Brown <broonie@opensource.wolfsonmicro.com>");
+MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
 MODULE_DESCRIPTION("Arizona microphone supply driver");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:arizona-micsupp");
+MODULE_ALIAS("platform:cs48l32-micsupp");
 MODULE_ALIAS("platform:madera-micsupp");
-- 
2.30.2

