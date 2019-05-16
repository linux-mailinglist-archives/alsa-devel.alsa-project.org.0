Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1902044B
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2019 13:14:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 662EE16A3;
	Thu, 16 May 2019 13:13:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 662EE16A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558005251;
	bh=vn8DhpY/lua981PFcAN2nfUGnwm9b8ZAQKW8z1G8/oY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nOATYvnWuv4CiXzX2F65ex0fM9OBFcvBtOz3VwBZ+zQJdGwjIBqdPsmGXICXp/9lr
	 n+KwbEcWbUjL3HJ5Yfh0e0wSzE2ggw2jXyV21zVKNoK7oQrPYfmtFjKXxiw9oWus0a
	 Pf/JmVJy3McihP//ktFouOesz0m0z8HQ1R4FvkAI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E50B5F896B7;
	Thu, 16 May 2019 13:12:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21488F896B6; Thu, 16 May 2019 13:12:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS autolearn=disabled version=3.4.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 589A7F806E7
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 13:12:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 589A7F806E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="Cyo2TtYM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZgcY2xSbIvh4TkVUwwOe1HCrM2EGMqs4QHHYgTvcM3k=;
 b=Cyo2TtYMT7rRElnmkbm8e+mmqyvV0Z50p+u9uCCIS/fNNVHyj8wcFWA++GZQ6litktObVrpgHIFBzTH6E1OZhuduSWHaHqQADU+Gomq11kxNKfGQPkJ5/NESUlDLHp6NNVBdyt+GyA5iY120txna0lXq39l3K1R48KmwF6yNRBg=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.233.80) by
 VE1PR04MB6446.eurprd04.prod.outlook.com (20.179.232.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Thu, 16 May 2019 11:12:16 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::a5b5:13f5:f89c:9a30]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::a5b5:13f5:f89c:9a30%7]) with mapi id 15.20.1900.010; Thu, 16 May 2019
 11:12:16 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: "brian.austin@cirrus.com" <brian.austin@cirrus.com>,
 "Paul.Handrigan@cirrus.com" <Paul.Handrigan@cirrus.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com"
 <tiwai@suse.com>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Thread-Topic: [PATCH V3] ASoC: cs42xx8: Add reset gpio handling
Thread-Index: AQHVC9g4NI4lM/q29kOkqW7xk8swjQ==
Date: Thu, 16 May 2019 11:12:15 +0000
Message-ID: <ae2e50f838ad1990b1ae20a75cfc573d29369cff.1558004881.git.shengjiu.wang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: HK2PR0302CA0019.apcprd03.prod.outlook.com
 (2603:1096:202::29) To VE1PR04MB6479.eurprd04.prod.outlook.com
 (2603:10a6:803:11e::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c5f2ac8-3f19-4000-91fa-08d6d9ef5a6e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6446; 
x-ms-traffictypediagnostic: VE1PR04MB6446:
x-microsoft-antispam-prvs: <VE1PR04MB6446C29F6A773A8C87A5FEAAE30A0@VE1PR04MB6446.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0039C6E5C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(396003)(136003)(39860400002)(366004)(199004)(189003)(66556008)(64756008)(66446008)(68736007)(66476007)(305945005)(7736002)(81166006)(102836004)(8676002)(81156014)(2616005)(36756003)(66066001)(476003)(6116002)(3846002)(66946007)(4326008)(256004)(186003)(25786009)(6506007)(386003)(14444005)(26005)(486006)(71200400001)(71190400001)(52116002)(110136005)(14454004)(2501003)(73956011)(316002)(99286004)(118296001)(2201001)(6436002)(53936002)(2906002)(86362001)(478600001)(5660300002)(8936002)(50226002)(6512007)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6446;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7qIVbRYiu6Ru2+MQIbadY2FnFp7XMkJC7VduGS5U+R2e3tz+I0xOHJEfbQ4pkqX83e+EN3B1PRLPN2W+8BbXKTM279NsKQmZF1uM/ENPXK4eDU4tCuKWueepznLocER6byvFYQBzKcdhsX60kxJTHYFuvnB614sOhaj/2/oHDTGPI7IDeFbIYTxFTTYg9nd9ZxE/rBFhIG+nxUGczPpwtgqhGDpaowAyRH4+JZgIerWkmfptDqF12kOQdsj4mcSAeEHTkHM0yLvFK9yIaiEdVtU2k4J0KmjNko6qkSvPRiTotxm3NVkHaX7mF4dKwOouv+Bzh8Th9tKbnOCuPLFCQya8DGcbtNpzR10jViTEiZ5D7MKwQSsPJ/W9hwC1Vw9xkwa1YT2Vodq1eIW5Kx0xmH/bnPvz/5Ro3oBv9R4+aIQ=
Content-ID: <77F5604BA7571D4DB7E6178C79B79A9F@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c5f2ac8-3f19-4000-91fa-08d6d9ef5a6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2019 11:12:15.9679 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6446
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [alsa-devel] [PATCH V3] ASoC: cs42xx8: Add reset gpio handling
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Handle the reset GPIO and reset the device every time we
start it.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
Changes in v3
- update binding document.

Changes in v2
- use devm_gpiod_get_optional instead of of_get_named_gpio

 Documentation/devicetree/bindings/sound/cs42xx8.txt |  6 ++++++
 sound/soc/codecs/cs42xx8.c                          | 13 +++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cs42xx8.txt b/Documentation/devicetree/bindings/sound/cs42xx8.txt
index 8619a156d038..ab8f54095269 100644
--- a/Documentation/devicetree/bindings/sound/cs42xx8.txt
+++ b/Documentation/devicetree/bindings/sound/cs42xx8.txt
@@ -14,6 +14,11 @@ Required properties:
   - VA-supply, VD-supply, VLS-supply, VLC-supply: power supplies for the device,
     as covered in Documentation/devicetree/bindings/regulator/regulator.txt
 
+Optional properties:
+
+  - reset-gpio : a GPIO spec to define which pin is connected to the chip's
+    !RESET pin
+
 Example:
 
 cs42888: codec@48 {
@@ -25,4 +30,5 @@ cs42888: codec@48 {
 	VD-supply = <&reg_audio>;
 	VLS-supply = <&reg_audio>;
 	VLC-supply = <&reg_audio>;
+	reset-gpio = <&pca9557_b 1 1>;
 };
diff --git a/sound/soc/codecs/cs42xx8.c b/sound/soc/codecs/cs42xx8.c
index 28a4ac36c4f8..b377cddaf2e6 100644
--- a/sound/soc/codecs/cs42xx8.c
+++ b/sound/soc/codecs/cs42xx8.c
@@ -14,6 +14,7 @@
 #include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/of_gpio.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <sound/pcm_params.h>
@@ -45,6 +46,7 @@ struct cs42xx8_priv {
 	bool slave_mode;
 	unsigned long sysclk;
 	u32 tx_channels;
+	struct gpio_desc *gpiod_reset;
 };
 
 /* -127.5dB to 0dB with step of 0.5dB */
@@ -467,6 +469,13 @@ int cs42xx8_probe(struct device *dev, struct regmap *regmap)
 		return -EINVAL;
 	}
 
+	cs42xx8->gpiod_reset = devm_gpiod_get_optional(dev, "reset",
+							GPIOD_OUT_HIGH);
+	if (IS_ERR(cs42xx8->gpiod_reset))
+		return PTR_ERR(cs42xx8->gpiod_reset);
+
+	gpiod_set_value_cansleep(cs42xx8->gpiod_reset, 0);
+
 	cs42xx8->clk = devm_clk_get(dev, "mclk");
 	if (IS_ERR(cs42xx8->clk)) {
 		dev_err(dev, "failed to get the clock: %ld\n",
@@ -547,6 +556,8 @@ static int cs42xx8_runtime_resume(struct device *dev)
 		return ret;
 	}
 
+	gpiod_set_value_cansleep(cs42xx8->gpiod_reset, 0);
+
 	ret = regulator_bulk_enable(ARRAY_SIZE(cs42xx8->supplies),
 				    cs42xx8->supplies);
 	if (ret) {
@@ -586,6 +597,8 @@ static int cs42xx8_runtime_suspend(struct device *dev)
 	regulator_bulk_disable(ARRAY_SIZE(cs42xx8->supplies),
 			       cs42xx8->supplies);
 
+	gpiod_set_value_cansleep(cs42xx8->gpiod_reset, 1);
+
 	clk_disable_unprepare(cs42xx8->clk);
 
 	return 0;
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
