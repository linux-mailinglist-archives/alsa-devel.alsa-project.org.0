Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 662102B5436
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Nov 2020 23:22:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA77D1730;
	Mon, 16 Nov 2020 23:21:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA77D1730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605565359;
	bh=W5a7oziZ4QRSPZfmieb5/mkNpBxfMGHsBwfBJb1cTIo=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=liBU5GpPF3V/NevST09cGVAyzxEeEl1Lw08RF/mDtlixov6eoAdJARJuXb/jK57VI
	 VbII/HOA4i0/3Whypnf1jZgMYk3j0bKGtlYHed69LQNis1vdPEgJLIp3xZnPGPOkuZ
	 7/IxLAhKQ4IRuMVZQuvylERq1ZaFFYdvTAcbHl6c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 557BDF8016C;
	Mon, 16 Nov 2020 23:21:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A311F80168; Mon, 16 Nov 2020 23:21:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70052.outbound.protection.outlook.com [40.107.7.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E08AF8014A
 for <alsa-devel@alsa-project.org>; Mon, 16 Nov 2020 23:20:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E08AF8014A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="HOJGN5Zr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hfy6XHT9VoB4l625+abuHLEFICYJH2EsCNoPgMOjIXdcR3c3TaQDA0lG9Sg+ksaFnmWt64A/r58t/F2ZWssFywGJ7EK9EEZTelgsfkqg20oOVTxWgNsuVm9mIXDfUywwz3xy23TA/XCq3+4+h1IfzCUtXa+hPIHJdfpffNzWpstyvOjz4barKsG8BdSSAJ3Uu+vPVAj8tRrHpAmk5n/fW0rZ3OP4/TXYyx6Bmp0PSMH1XGD53TIVcdabybvdsfU/MFhyrF5A90tryKRdobztvLPPU1GKH1T+EA73ABmP1F6uOWfoa32GcZVRfddcgYlSXxyURI9k4F7qwINqvyVJgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Svg+OUiCOdKVqpbsWIV6d4KZXwkXvpizTE7BNQp8IoI=;
 b=O2e6m5ytLPyskfKcTyWDiZp4C6fNqwskwH39JHy2DCmRXxwhpfnczBWLD2lWnMG9xhArH7oDw33nEe+bq6+X1W6bmwsIiBuaLhd+Bxlew5o80OorqN2RVIazQ8mB64JsA78vf+Cr22DC/Kk2SOIUrRDXiYvUYWTH+Z5PRi6riEHs4k2XYg31g50i+ilfSAa5/85QhRK/RPnUJ3QL7xYYwrowO46hXS0Uex3ORE5ozWqr3NzL2/Uw7WOY+SCNLNhJ0J9BZGfdpGSJpmAX8QfHXOnLy4rW/UqX9VOBsq9oJQ4lkXdg4e8vq86Pp+4VxaFw98cl9m3/BDCK1xCDf8JR/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Svg+OUiCOdKVqpbsWIV6d4KZXwkXvpizTE7BNQp8IoI=;
 b=HOJGN5ZrKfII/LC7MEnOqxK2imr8F9BGGALGWeAvPaDPyNJoI6ei8AfieG4D2X7ZOGWTGa6l/kXdez9ZhivEU3CqTs2m3jLKyfAZMr87c34F/alEuvV3FKu9ldyqyGLoQ1h5+Z/eoWmCIqHUQfRARCR2mpZlmPew07gspIzAtZU=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 (2603:10a6:800:31::12) by VI1PR04MB4078.eurprd04.prod.outlook.com
 (2603:10a6:803:4e::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Mon, 16 Nov
 2020 22:20:54 +0000
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::91f8:d96b:f238:7962]) by VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::91f8:d96b:f238:7962%8]) with mapi id 15.20.3564.028; Mon, 16 Nov 2020
 22:20:54 +0000
From: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Viorel Suman <viorel.suman@nxp.com>, Lee Jones <lee.jones@linaro.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH] ASoC: ak4458: use reset control instead of reset gpio
Date: Tue, 17 Nov 2020 00:20:36 +0200
Message-Id: <20201116222036.343635-1-viorel.suman@oss.nxp.com>
X-Mailer: git-send-email 2.26.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [5.12.106.221]
X-ClientProxiedBy: VI1PR06CA0153.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::46) To VI1PR0401MB2272.eurprd04.prod.outlook.com
 (2603:10a6:800:31::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (5.12.106.221) by
 VI1PR06CA0153.eurprd06.prod.outlook.com (2603:10a6:803:a0::46) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.28 via Frontend Transport; Mon, 16 Nov 2020 22:20:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 24e95f2a-c16d-4548-c890-08d88a7de1fa
X-MS-TrafficTypeDiagnostic: VI1PR04MB4078:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4078EF7B905B4B1E927F8A3ED3E30@VI1PR04MB4078.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: erX24j4WvyZdMls+NbNFhCc2kXsbDXjqU85L9AJawXsBVgD1dDagtc5SvlZbIi/wGhdWnQAYwUL07IglvokQeUQWxOZIEsNmezH6U6j1I1pf195lrXUBa/MGftvaKjzEgxHzzrJpsveAEDK52zJS6s8jEML6+CRMezlas+6xmmVzGsABVfIMOIWOEJelmP+XAh+esMGPICNfAX1na/3Do/heLPqA2Ds168/gosxOmjAb0z0vTK+E1w2vnblkCtz6yPmedti8RmK3i+iVnS0OTwPHxnGyZ0nZ9XnDEsw9hcd4Vzf62pF5JZkMcmHkJnsIeoSYL45C+hkfWqWKnjy5oTntd1OhzzYGW1ildM7MxbwgvLc9RT01Wo+qENkOdS2ZY+SrMqwPW6Ejgx6c4ycH5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2272.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(6506007)(69590400008)(1076003)(316002)(8936002)(478600001)(6486002)(7416002)(26005)(6512007)(16526019)(8676002)(186003)(86362001)(66946007)(956004)(66476007)(921005)(83380400001)(110136005)(5660300002)(52116002)(66556008)(6666004)(2906002)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: L15sXvWvzBsfL1agA5Lo2haK78XTMFjsc00DPpKT1oNjGhyodUWFxfs2dm+WuT/5sNo8GIRTJoZR8QRSFQp12/Dmq7E4kGYRA9x4Fxhz+KuI7N9vPEIxj3CXf7uiWezuVA3ViGg2jq1neYLNhROloRScvgVUFncxcv56DHdlu4NiueT5MJYT2wjPoXpHOTkZ4yxXqlrvEuVMmkKznFcaz7dKw40bWdXCUQwwjqyNS34WVRuOUTMRORvqI6BgZXzLznUxSCkbmOyCIz5oJcE6lsjazR3F+pO3ymxeUOIgwhaUMoQCRN0wmgFd3P8UvCJxi8WLDrYV1h1j/etMs8sktmo8msuxMa6pIqwcnkjRtWvjU5qrpElhggq0j2SFZLVFL/zWQLl3NQDE3i93GVnD4NiKxfrtO6Jf2oSJAHgkKEtTgfR1GOCocQ/7oSe/Te/4gNK5skjwkVlStq9S337yb2a4C43J/DAL1D0f1mOfbt6QtU5Ty++UaecLVnmEgUP77Q5GTVAcSwTbFl4eQTl5/7FzEzlORhRyW9aSx85/bgeOmeD0rYjcoveoV0UEYlzue/ZG9MYrEjRGpx0S+rfAUb+j+93xncROPvrZNaDPDk2ylKTkC77bPqSjOrvzNFTDAWj8pgSesV1METVwro5JpQ==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24e95f2a-c16d-4548-c890-08d88a7de1fa
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2272.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2020 22:20:54.4767 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: niCvRBlwyKVr1M9/MiHd+6rbMhHUe5B0cgFcNdOq9gOkzkSU4hii6QJMEpYNS7nG0hw7QotMiyazpamvVOSY7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4078
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

From: Viorel Suman <viorel.suman@nxp.com>

Using GPIO API seems not a way to go for the case
when the same reset GPIO is used to control several codecs.
For a such case we can use the "gpio-reset" driver
and the "shared" reset API to manage the reset GPIO -
to deassert the reset when the first codec is powered up
and assert it when there is no codec in use.
DTS is supposed to look as follows:

/ {
    ak4458_reset: gpio-reset {
       compatible = "gpio-reset";
       reset-gpios = <&pca6416 4 GPIO_ACTIVE_LOW>;
       #reset-cells = <0>;
       initially-in-reset;
    };
};

&i2c3 {
    pca6416: gpio@20 {
       compatible = "ti,tca6416";
       reg = <0x20>;
       gpio-controller;
       #gpio-cells = <2>;
    };

    ak4458_1: ak4458@10 {
       compatible = "asahi-kasei,ak4458";
       reg = <0x10>;
       resets = <&ak4458_reset>;
    };

    ak4458_2: ak4458@11 {
       compatible = "asahi-kasei,ak4458";
       reg = <0x11>;
       resets = <&ak4458_reset>;
    };

    ak4458_3: ak4458@12 {
       compatible = "asahi-kasei,ak4458";
       reg = <0x12>;
       resets = <&ak4458_reset>;
    };
};

Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
---
 sound/soc/codecs/ak4458.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/ak4458.c b/sound/soc/codecs/ak4458.c
index 1010c9ee2e83..f27727cb1382 100644
--- a/sound/soc/codecs/ak4458.c
+++ b/sound/soc/codecs/ak4458.c
@@ -13,6 +13,7 @@
 #include <linux/of_gpio.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <sound/initval.h>
 #include <sound/pcm_params.h>
@@ -45,7 +46,7 @@ struct ak4458_priv {
 	const struct ak4458_drvdata *drvdata;
 	struct device *dev;
 	struct regmap *regmap;
-	struct gpio_desc *reset_gpiod;
+	struct reset_control *reset;
 	struct gpio_desc *mute_gpiod;
 	int digfil;	/* SSLOW, SD, SLOW bits */
 	int fs;		/* sampling rate */
@@ -597,17 +598,17 @@ static struct snd_soc_dai_driver ak4497_dai = {
 
 static void ak4458_power_off(struct ak4458_priv *ak4458)
 {
-	if (ak4458->reset_gpiod) {
-		gpiod_set_value_cansleep(ak4458->reset_gpiod, 0);
-		usleep_range(1000, 2000);
+	if (ak4458->reset) {
+		reset_control_assert(ak4458->reset);
+		msleep(20);
 	}
 }
 
 static void ak4458_power_on(struct ak4458_priv *ak4458)
 {
-	if (ak4458->reset_gpiod) {
-		gpiod_set_value_cansleep(ak4458->reset_gpiod, 1);
-		usleep_range(1000, 2000);
+	if (ak4458->reset) {
+		reset_control_deassert(ak4458->reset);
+		msleep(20);
 	}
 }
 
@@ -685,7 +686,6 @@ static int __maybe_unused ak4458_runtime_resume(struct device *dev)
 	if (ak4458->mute_gpiod)
 		gpiod_set_value_cansleep(ak4458->mute_gpiod, 1);
 
-	ak4458_power_off(ak4458);
 	ak4458_power_on(ak4458);
 
 	regcache_cache_only(ak4458->regmap, false);
@@ -771,10 +771,9 @@ static int ak4458_i2c_probe(struct i2c_client *i2c)
 
 	ak4458->drvdata = of_device_get_match_data(&i2c->dev);
 
-	ak4458->reset_gpiod = devm_gpiod_get_optional(ak4458->dev, "reset",
-						      GPIOD_OUT_LOW);
-	if (IS_ERR(ak4458->reset_gpiod))
-		return PTR_ERR(ak4458->reset_gpiod);
+	ak4458->reset = devm_reset_control_get_optional_shared(ak4458->dev, NULL);
+	if (IS_ERR(ak4458->reset))
+		return PTR_ERR(ak4458->reset);
 
 	ak4458->mute_gpiod = devm_gpiod_get_optional(ak4458->dev, "mute",
 						     GPIOD_OUT_LOW);
-- 
2.26.2

