Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4506D58227
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2019 14:05:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4258172E;
	Thu, 27 Jun 2019 14:04:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4258172E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561637140;
	bh=x5BGMvPkFGG7cHVHTzsJlbwj9+6zjAvO7uzXpAVvWz0=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=s/qj4m4gNfx+GmC+/8RsrR1372jQJ1byIvT5uXZtqwdRjorOgl9Zua6Iik2tQBLDN
	 5Q7n/qbeAjcHEkzD5GFqb7lx0GN39Xh8y7eq1JmHOWwOS7pRX+jp3UnAmw4Kkb7Mui
	 FvHbhiLbwSkd5ADUemIshphHVTMJpnTK83+aidEE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42513F896FD;
	Thu, 27 Jun 2019 14:03:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2356BF896F6; Thu, 27 Jun 2019 14:03:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa1.microchip.iphmx.com (esa1.microchip.iphmx.com
 [68.232.147.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8531F89678
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 14:03:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8531F89678
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
 Codrin.Ciubotariu@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Codrin.Ciubotariu@microchip.com";
 x-sender="Codrin.Ciubotariu@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Codrin.Ciubotariu@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=Pass smtp.mailfrom=Codrin.Ciubotariu@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.63,423,1557212400"; d="scan'208";a="40642956"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 27 Jun 2019 05:03:47 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex03.mchp-main.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 27 Jun 2019 05:03:47 -0700
Received: from rob-ult-m19940.microchip.com (10.10.85.251) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Thu, 27 Jun 2019 05:03:44 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 27 Jun 2019 15:02:07 +0300
Message-ID: <20190627120208.4661-1-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: lars@metafoo.de, tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: [alsa-devel] [PATCH 1/2] ASoC: codecs: ad193x: Group register
	initialization at probe
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

Create a structure with the register initialization values at probe and
use it to initialize all the registers at once.

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---

The order of the initialization is changed, but it doesn't seem to
matter.
There is one checkpatch warning, let me know if you want to remove it:
WARNING: line over 80 characters
#32: FILE: sound/soc/codecs/ad193x.c:425:
+		{  0, 0x99 },	/* PLL_CLK_CTRL0: pll input: mclki/xi 12.288Mhz */

 sound/soc/codecs/ad193x.c | 52 +++++++++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 19 deletions(-)

diff --git a/sound/soc/codecs/ad193x.c b/sound/soc/codecs/ad193x.c
index 3ebc0524f4b2..f944228f014e 100644
--- a/sound/soc/codecs/ad193x.c
+++ b/sound/soc/codecs/ad193x.c
@@ -413,6 +413,38 @@ static struct snd_soc_dai_driver ad193x_no_adc_dai = {
 	.ops = &ad193x_dai_ops,
 };
 
+struct ad193x_reg_default {
+	unsigned int reg;
+	unsigned int val;
+};
+
+/* codec register values to set after reset */
+static void ad193x_reg_default_init(struct ad193x_priv *ad193x)
+{
+	const struct ad193x_reg_default reg_init[] = {
+		{  0, 0x99 },	/* PLL_CLK_CTRL0: pll input: mclki/xi 12.288Mhz */
+		{  1, 0x04 },	/* PLL_CLK_CTRL1: no on-chip Vref */
+		{  2, 0x40 },	/* DAC_CTRL0: TDM mode */
+		{  4, 0x1A },	/* DAC_CTRL2: 48kHz de-emphasis, unmute dac */
+		{  5, 0x00 },	/* DAC_CHNL_MUTE: unmute DAC channels */
+	};
+	const struct ad193x_reg_default reg_adc_init[] = {
+		{ 14, 0x03 },	/* ADC_CTRL0: high-pass filter enable */
+		{ 15, 0x43 },	/* ADC_CTRL1: sata delay=1, adc aux mode */
+	};
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(reg_init); i++)
+		regmap_write(ad193x->regmap, reg_init[i].reg, reg_init[i].val);
+
+	if (ad193x_has_adc(ad193x)) {
+		for (i = 0; i < ARRAY_SIZE(reg_adc_init); i++) {
+			regmap_write(ad193x->regmap, reg_adc_init[i].reg,
+				     reg_adc_init[i].val);
+		}
+	}
+}
+
 static int ad193x_component_probe(struct snd_soc_component *component)
 {
 	struct ad193x_priv *ad193x = snd_soc_component_get_drvdata(component);
@@ -420,25 +452,7 @@ static int ad193x_component_probe(struct snd_soc_component *component)
 	int num, ret;
 
 	/* default setting for ad193x */
-
-	/* unmute dac channels */
-	regmap_write(ad193x->regmap, AD193X_DAC_CHNL_MUTE, 0x0);
-	/* de-emphasis: 48kHz, powedown dac */
-	regmap_write(ad193x->regmap, AD193X_DAC_CTRL2, 0x1A);
-	/* dac in tdm mode */
-	regmap_write(ad193x->regmap, AD193X_DAC_CTRL0, 0x40);
-
-	/* adc only */
-	if (ad193x_has_adc(ad193x)) {
-		/* high-pass filter enable */
-		regmap_write(ad193x->regmap, AD193X_ADC_CTRL0, 0x3);
-		/* sata delay=1, adc aux mode */
-		regmap_write(ad193x->regmap, AD193X_ADC_CTRL1, 0x43);
-	}
-
-	/* pll input: mclki/xi */
-	regmap_write(ad193x->regmap, AD193X_PLL_CLK_CTRL0, 0x99); /* mclk=24.576Mhz: 0x9D; mclk=12.288Mhz: 0x99 */
-	regmap_write(ad193x->regmap, AD193X_PLL_CLK_CTRL1, 0x04);
+	ad193x_reg_default_init(ad193x);
 
 	/* adc only */
 	if (ad193x_has_adc(ad193x)) {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
