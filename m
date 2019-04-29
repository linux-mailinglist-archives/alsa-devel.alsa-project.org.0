Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BD8E0D2
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2019 12:48:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80B2B1660;
	Mon, 29 Apr 2019 12:47:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80B2B1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556534879;
	bh=VM+ZK7QYG6ZPYTnSbw6NGy3TEKu7xTW+GT1xyPrsE9Y=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tATaPq2VYDrcxXFHBqh8qcx8htAyg7hvGdsGp7k2expTOXYhyw2JBaOULqPh42Dfo
	 wJHUkyTfnMeQRbz8+EK3EF1KmifuiEeLBD21l0B6/qlpSEUKIjAHPIwH4aQVo4x49b
	 NKxkhgNevP8615OOrUxo32i6FIkyaGOfwbS66ZEI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7003F89693;
	Mon, 29 Apr 2019 12:46:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8172DF80CAB; Mon, 29 Apr 2019 12:46:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40049.outbound.protection.outlook.com [40.107.4.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83FACF80641
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 12:46:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83FACF80641
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="TL6z7dsA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQbO31yfxFT6lL6rn+MZuC6A6ieOqWs394MSxg3bnuI=;
 b=TL6z7dsAkr6xPY7KCTSQKRHD41cuEjo8DEYnQSvdwYLr6U7sMkSl7MWEGt2TI61lqY4GL+n4jXfD6zZy6vF1A6SapIYjSPSEBwnItkIJtiXUJt8mchguGMjvQwkmdHt/YNe3DxKrQpgbgnCup3F5cci/csN1EJon3/Feqvm4Cp8=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.233.80) by
 VE1PR04MB6621.eurprd04.prod.outlook.com (20.179.235.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Mon, 29 Apr 2019 10:46:03 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::6c03:86ad:729d:e311]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::6c03:86ad:729d:e311%7]) with mapi id 15.20.1835.016; Mon, 29 Apr 2019
 10:46:03 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: "brian.austin@cirrus.com" <brian.austin@cirrus.com>,
 "Paul.Handrigan@cirrus.com" <Paul.Handrigan@cirrus.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com"
 <tiwai@suse.com>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Thread-Topic: [PATCH] ASoC: cs42xx8: Add reset gpio handling
Thread-Index: AQHU/ni9Rn+K8AXUn0yC+rdeNT8NqA==
Date: Mon, 29 Apr 2019 10:46:03 +0000
Message-ID: <1556534756-15630-1-git-send-email-shengjiu.wang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 1.9.1
x-clientproxiedby: HK0PR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:203:36::25) To VE1PR04MB6479.eurprd04.prod.outlook.com
 (2603:10a6:803:11e::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f65234e8-3136-46d3-df82-08d6cc8fe00a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6621; 
x-ms-traffictypediagnostic: VE1PR04MB6621:
x-microsoft-antispam-prvs: <VE1PR04MB6621634807C3C613348D127BE3390@VE1PR04MB6621.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1122;
x-forefront-prvs: 0022134A87
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(39860400002)(376002)(136003)(346002)(189003)(199004)(478600001)(6486002)(2906002)(97736004)(68736007)(8676002)(66066001)(50226002)(6116002)(2501003)(14454004)(3846002)(5660300002)(6436002)(81166006)(81156014)(7736002)(486006)(71190400001)(305945005)(25786009)(71200400001)(2616005)(476003)(8936002)(110136005)(52116002)(66446008)(66476007)(66556008)(64756008)(66946007)(6512007)(186003)(256004)(4326008)(53936002)(2201001)(99286004)(36756003)(86362001)(316002)(26005)(6506007)(386003)(14444005)(102836004)(73956011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6621;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FSmBACjEB58XPR7Uh7JawEkzoEE/LOyzusGcHH1N2GEgNEfE4ppokRgBhZgdIaEOSbgQhbusRXmViiztyrt5J1F3ccHAe1I40tWcx1YrCJGIKA1Ee44fCR6Gq28ypcTWs2u7uCxL9NcBUcuTfLN7RsGW9BoFP7oCsy9Pz1CGm/y+IyHloZsyGaX3GpXWAAakRlFTZtwJPV4A1Pxu3mqlv1hNbYfrFM6nWHUvStSotfydLUcJZGFG9fX0ShPg2CsgHzDRLA+XlG0F4duMA10yLZkTJ7zeSe43P8E5qB2IkT8Oe0zLqQ7AN2x2qHfWK8ZG0/b2kIJ6DsJIeOfv+sgijWCZCMODzS3QVjDw84vizX0gClcou5OvQBTmS5FWPdLVkft/9x5y+HEfoXWeZKIrTEqDFQvcqLfdk7MJLeAKOUo=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f65234e8-3136-46d3-df82-08d6cc8fe00a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2019 10:46:03.5215 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6621
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [alsa-devel] [PATCH] ASoC: cs42xx8: Add reset gpio handling
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

Handle the reset GPIO and reset the device in
pm_runtime_resume

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/codecs/cs42xx8.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/sound/soc/codecs/cs42xx8.c b/sound/soc/codecs/cs42xx8.c
index ebb9e0cf8364..fc28e6d26c6d 100644
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
+	int gpio_reset;
 };
 
 /* -127.5dB to 0dB with step of 0.5dB */
@@ -467,6 +469,17 @@ int cs42xx8_probe(struct device *dev, struct regmap *regmap)
 		return -EINVAL;
 	}
 
+	cs42xx8->gpio_reset = of_get_named_gpio(dev->of_node, "gpio-reset", 0);
+	if (gpio_is_valid(cs42xx8->gpio_reset)) {
+		ret = devm_gpio_request_one(dev, cs42xx8->gpio_reset,
+				GPIOF_OUT_INIT_LOW, "cs42xx8 reset");
+		if (ret) {
+			dev_err(dev, "unable to get reset gpio\n");
+			return ret;
+		}
+		gpio_set_value_cansleep(cs42xx8->gpio_reset, 1);
+	}
+
 	cs42xx8->clk = devm_clk_get(dev, "mclk");
 	if (IS_ERR(cs42xx8->clk)) {
 		dev_err(dev, "failed to get the clock: %ld\n",
@@ -547,6 +560,11 @@ static int cs42xx8_runtime_resume(struct device *dev)
 		return ret;
 	}
 
+	if (gpio_is_valid(cs42xx8->gpio_reset)) {
+		gpio_set_value_cansleep(cs42xx8->gpio_reset, 0);
+		gpio_set_value_cansleep(cs42xx8->gpio_reset, 1);
+	}
+
 	ret = regulator_bulk_enable(ARRAY_SIZE(cs42xx8->supplies),
 				    cs42xx8->supplies);
 	if (ret) {
@@ -559,6 +577,7 @@ static int cs42xx8_runtime_resume(struct device *dev)
 
 	regcache_cache_only(cs42xx8->regmap, false);
 
+	regcache_mark_dirty(cs42xx8->regmap);
 	ret = regcache_sync(cs42xx8->regmap);
 	if (ret) {
 		dev_err(dev, "failed to sync regmap: %d\n", ret);
-- 
1.9.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
