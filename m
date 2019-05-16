Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6301FF56
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2019 08:07:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F39D216BA;
	Thu, 16 May 2019 08:06:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F39D216BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557986822;
	bh=aChh5fdMG6oiZBWL1kMql1fvDto7KA5HKXJo6KCEHso=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Og8cI6fVNdWSc3PCwQyuN3MmQFrMbdo2IULk+jYwBzreautnnxt+y2mogrhZ6xs25
	 q74SK6ePJYxxb0ZTlSQcIfmn1mSI+5ZXzET3lCLcReQ8/R/IhX4cfJ/pRlMyQ5JdrI
	 6n3SSglBG0wcnMa8Ie5gYu9RnyGJNaTpnpTh4LNI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC508F89700;
	Thu, 16 May 2019 08:05:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD3DDF896E0; Thu, 16 May 2019 08:05:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS autolearn=disabled version=3.4.0
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe08::61a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9119F896B7
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 08:05:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9119F896B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="Ulk9bfY7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2MAy5eo3bGHMOg2hSSx1wM2H1An+ZYpEP5i/LbwuS80=;
 b=Ulk9bfY7yXqN4SosgerduqXLSveJAvoHIOtldzNm47LM50a/VHQgzpRfPch6iP7b9xLJao7AAzPD7rNhTuN8WLJzfrnKeABz5PhZqHvzCcyqtkcMnQNa/WNLSq6k5/OLgjTDcJoSjEQGp2xq446Ves4vQ35XOu3cI55KzdLAx3k=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.233.80) by
 VE1PR04MB6445.eurprd04.prod.outlook.com (20.179.232.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Thu, 16 May 2019 06:04:59 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::a5b5:13f5:f89c:9a30]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::a5b5:13f5:f89c:9a30%7]) with mapi id 15.20.1900.010; Thu, 16 May 2019
 06:04:59 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: "brian.austin@cirrus.com" <brian.austin@cirrus.com>,
 "Paul.Handrigan@cirrus.com" <Paul.Handrigan@cirrus.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com"
 <tiwai@suse.com>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Thread-Topic: [PATCH V2] ASoC: cs42xx8: Add reset gpio handling
Thread-Index: AQHVC61KhRK4yyHpKUmTOTQMt0NP7g==
Date: Thu, 16 May 2019 06:04:58 +0000
Message-ID: <95eb314ef6d47ee6581094a406516a6069278d56.1557986457.git.shengjiu.wang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: HK0PR03CA0051.apcprd03.prod.outlook.com
 (2603:1096:203:52::15) To VE1PR04MB6479.eurprd04.prod.outlook.com
 (2603:10a6:803:11e::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 10cd056f-3263-45ef-033c-08d6d9c46d27
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6445; 
x-ms-traffictypediagnostic: VE1PR04MB6445:
x-microsoft-antispam-prvs: <VE1PR04MB64458F2562FDADADF7C19B88E30A0@VE1PR04MB6445.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0039C6E5C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(396003)(39860400002)(366004)(136003)(199004)(189003)(52116002)(86362001)(53936002)(36756003)(305945005)(7736002)(99286004)(4326008)(6512007)(50226002)(66066001)(5660300002)(8936002)(2201001)(71200400001)(71190400001)(81166006)(102836004)(118296001)(110136005)(8676002)(81156014)(316002)(2906002)(2616005)(66556008)(66946007)(73956011)(66476007)(64756008)(6116002)(6436002)(3846002)(6506007)(68736007)(386003)(186003)(478600001)(25786009)(14444005)(256004)(14454004)(6486002)(66446008)(476003)(26005)(486006)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6445;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PkhA9fBjphzzHpxRdGEkGO6zTns9MrUmtSkI1gC9S4fXNZM5VIFT9dYpNLBUxLGDNZ046pshtpflLjB4H7OD7LnNKI+/fXBkcl1gAH1GoNXkirnwbfudp2tRZ4TzGKjWNsRpUBlfSt6GTR8JOJPJgarcvtFwwVBgbD612MKMKUP0T5NdU96NtcH7dGoD/UhJ2ug9D0DxMePPBbpM6o5Irj+cROfN2IiIN8HN1p4FChTXui84KWDvXMw3mdsNKRtNx6z72MXWgaXQHH1zYntAYP2EMvfgBS+aOzOKegaxSNahT7YE8C8RBQv0/T+KRxzo2qBoXEH+0ftPS9XKAKztthSV/ozN+xPUeaQjvnsGxPdevUF/xUlK34IYITTz4eHMkVh0KxAr0aIv+6gKw5PxBRGCqsIpNhvithGx7Lz2ZHY=
Content-ID: <C63C6422A1A4D4419D9E44128DAF2612@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10cd056f-3263-45ef-033c-08d6d9c46d27
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2019 06:04:59.0542 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6445
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [alsa-devel] [PATCH V2] ASoC: cs42xx8: Add reset gpio handling
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
Changes in v2
- use devm_gpiod_get_optional instead of of_get_named_gpio

 sound/soc/codecs/cs42xx8.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

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
