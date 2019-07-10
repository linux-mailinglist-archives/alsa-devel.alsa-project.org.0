Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7E56456E
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jul 2019 12:53:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F72C1694;
	Wed, 10 Jul 2019 12:52:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F72C1694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562756018;
	bh=gYuUvnbXd4BTgyAwdPnUzcaU2EJftSlwgTfXWDxLtz0=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UPBAmvtQJ8uf96q5JIOhQvzB7cg0Oecvcq+v8RpLaQwj43iZxFPPEGH6RYOdDtFtH
	 LG0aHXfWyAzz6eVaBLrNTa/z8jVNxCDE+WjiQ6VJvmG44nxNoliX/jMe/m+x9IYBgj
	 k6EMO/vxHkKGc24Io1ag99REaVnbnHtHEne734uI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2721DF802A1;
	Wed, 10 Jul 2019 12:51:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A00BF802A0; Wed, 10 Jul 2019 12:51:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=RCVD_IN_DNSWL_MED,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from esa6.microchip.iphmx.com (esa6.microchip.iphmx.com
 [216.71.154.253])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F03DDF800DE
 for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2019 12:51:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F03DDF800DE
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
 Codrin.Ciubotariu@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Codrin.Ciubotariu@microchip.com";
 x-sender="Codrin.Ciubotariu@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Codrin.Ciubotariu@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa6.microchip.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=Pass smtp.mailfrom=Codrin.Ciubotariu@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: ykMk+mAJO8ioHV8LJM8Fq6OabviCLQQPIWM+wFtiZOyTHASTsqQvDQ4UHJ1jD325ogv0nZjctL
 4a7XCno7CNOUkOfei/SLl418omfbWsxRbiPmYC1/mTovnbSV8l/lyhtph8SWS2DxIxhFLLjtF2
 QjlpUih/0Jaza8fpyy6xgJsTOHoy0UzbTMaU+WmwjD0RCKUTTB5yLJaaWTwXsjX//z0e0bmglq
 qTM3sUukGF1VxAqTrtfq9/x8FoLrhNt1oi+AAr1929UjvlqD3bjdvXyqMtvQlI6dWFsZZg+8gW
 w/s=
X-IronPort-AV: E=Sophos;i="5.63,474,1557212400"; d="scan'208";a="37641144"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 10 Jul 2019 03:51:44 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 10 Jul 2019 03:51:43 -0700
Received: from rob-ult-m19940.microchip.com (10.10.85.251) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Wed, 10 Jul 2019 03:51:41 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>
Date: Wed, 10 Jul 2019 13:51:19 +0300
Message-ID: <20190710105119.22987-1-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: lars@metafoo.de, tiwai@suse.com, lgirdwood@gmail.com,
 Tzung-Bi Shih <tzungbi@google.com>, broonie@kernel.org,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: [alsa-devel] [PATCH] ASoC: codecs: ad193x: Use
	regmap_multi_reg_write() when initializing
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

Using regmap_multi_reg_write() when we set the default values for our
registers makes the code smaller and easier to read.

Suggested-by: Tzung-Bi Shih <tzungbi@google.com>
Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---
 sound/soc/codecs/ad193x.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/ad193x.c b/sound/soc/codecs/ad193x.c
index 80dab5df9633..fb04c9379b71 100644
--- a/sound/soc/codecs/ad193x.c
+++ b/sound/soc/codecs/ad193x.c
@@ -413,15 +413,10 @@ static struct snd_soc_dai_driver ad193x_no_adc_dai = {
 	.ops = &ad193x_dai_ops,
 };
 
-struct ad193x_reg_default {
-	unsigned int reg;
-	unsigned int val;
-};
-
 /* codec register values to set after reset */
 static void ad193x_reg_default_init(struct ad193x_priv *ad193x)
 {
-	const struct ad193x_reg_default reg_init[] = {
+	const struct reg_sequence reg_init[] = {
 		{  0, 0x99 },	/* PLL_CLK_CTRL0: pll input: mclki/xi 12.288Mhz */
 		{  1, 0x04 },	/* PLL_CLK_CTRL1: no on-chip Vref */
 		{  2, 0x40 },	/* DAC_CTRL0: TDM mode */
@@ -437,21 +432,17 @@ static void ad193x_reg_default_init(struct ad193x_priv *ad193x)
 		{ 12, 0x00 },	/* DAC_L4_VOL: no attenuation */
 		{ 13, 0x00 },	/* DAC_R4_VOL: no attenuation */
 	};
-	const struct ad193x_reg_default reg_adc_init[] = {
+	const struct reg_sequence reg_adc_init[] = {
 		{ 14, 0x03 },	/* ADC_CTRL0: high-pass filter enable */
 		{ 15, 0x43 },	/* ADC_CTRL1: sata delay=1, adc aux mode */
 		{ 16, 0x00 },	/* ADC_CTRL2: reset */
 	};
-	int i;
 
-	for (i = 0; i < ARRAY_SIZE(reg_init); i++)
-		regmap_write(ad193x->regmap, reg_init[i].reg, reg_init[i].val);
+	regmap_multi_reg_write(ad193x->regmap, reg_init, ARRAY_SIZE(reg_init));
 
 	if (ad193x_has_adc(ad193x)) {
-		for (i = 0; i < ARRAY_SIZE(reg_adc_init); i++) {
-			regmap_write(ad193x->regmap, reg_adc_init[i].reg,
-				     reg_adc_init[i].val);
-		}
+		regmap_multi_reg_write(ad193x->regmap, reg_adc_init,
+				       ARRAY_SIZE(reg_adc_init));
 	}
 }
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
