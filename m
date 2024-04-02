Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3605789AF0E
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Apr 2024 09:19:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2071299A;
	Sun,  7 Apr 2024 09:18:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2071299A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712474346;
	bh=IwfrzWFQMK5aKYIP+JpJjBWSv5PRYRdxAqXqTNhqjec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=geHsPCUzghMet5Og2l+iQVZK7Z2KQSvt/YpL2MAVSk/9CH7i2yDqs0nTP+naixEWh
	 CNcy6E64ZT2N25Rp4oAlJdgy+0pjROMV0ZlgNA1e/nqW92nmcxxbLFF97Z2YTV6bvM
	 4udfqOd9ptVCHRLgT+duBX8+1dl7mm8+YzjHkIcs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A715F8065B; Sun,  7 Apr 2024 09:17:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C45E7F8065A;
	Sun,  7 Apr 2024 09:17:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 076A2F8057D; Tue,  2 Apr 2024 09:12:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B6F3DF80578
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 09:12:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6F3DF80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CPrylJLU
Received: by mail.gandi.net (Postfix) with ESMTPA id 7AAF9FF804;
	Tue,  2 Apr 2024 07:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712041942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vZrZE1ws3fDn3UjdBfQcUrpkUXJj9Z/9NRZDie5wy+o=;
	b=CPrylJLUBe2LjtOjTJqNfF63pOpEETI40X7AVNJgQVyg5/snrSg/QajeSN9AWOYL+YfiXY
	lS72zKUZR85ox7BIXLEEcyRr46tfLkXlJOHhdUaQrM6BzNN478KlNNsGIF1nVj1igT9xgo
	UYRWpP1fxuMRznvqMXV2qUijf7LmJ4/9Aw6EadDrecBlsALOEGXbiCFNvDIQd06UYpdhBG
	AeH++YErAudKjhK6Q/nyLwK0ZLNX/xc6neo3KUA9Xr9X/bhYBVjOH/sbTr7j7JBIGrtndZ
	KfCWJledjZlxR4rkBrDyp5BmUlQAVJk02P6LKwN8L3pipWyQ5UtxWoWLLHjeTw==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	herve.codina@bootlin.com,
	christophercordahi@nanometrics.ca
Subject: [PATCH v2 03/13] ASoC: ti: davinci-i2s: Remove the unused
 clk_input_pin attribute
Date: Tue,  2 Apr 2024 09:12:03 +0200
Message-ID: <20240402071213.11671-4-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240402071213.11671-1-bastien.curutchet@bootlin.com>
References: <20240402071213.11671-1-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: bastien.curutchet@bootlin.com
X-MailFrom: bastien.curutchet@bootlin.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: B6LPXFIOWCWFPJICZJIX5U5GT2YZFJ7W
X-Message-ID-Hash: B6LPXFIOWCWFPJICZJIX5U5GT2YZFJ7W
X-Mailman-Approved-At: Sun, 07 Apr 2024 07:14:06 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B6LPXFIOWCWFPJICZJIX5U5GT2YZFJ7W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The clk_input_pin attribute of davinci_mcbsp_dev struct is not set since
commit 257ade78b601 ("ASoC: davinci-i2s: Convert to use edma-pcm").

Remove the attribute.
Keep the behaviour of the MCBSP_CLKR case as MCBSP_CLKR == 0.
I can't test the BC_FP format so I added back the initial comment that
was removed by commit ec6375533748 ("ASoC: DaVinci: Added selection of
clk input pin for McBSP"). This was the last dependency to
linux/platform_data/davinci_asp.h so it is not included anymore.

Remove the enum mcbsp_clk_input_pin from davinci_asp.h as it is not used
anywhere else.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 include/linux/platform_data/davinci_asp.h | 15 --------------
 sound/soc/ti/davinci-i2s.c                | 24 ++++-------------------
 2 files changed, 4 insertions(+), 35 deletions(-)

diff --git a/include/linux/platform_data/davinci_asp.h b/include/linux/platform_data/davinci_asp.h
index c8645b2ed3c0..b9c8520b4bd3 100644
--- a/include/linux/platform_data/davinci_asp.h
+++ b/include/linux/platform_data/davinci_asp.h
@@ -25,16 +25,6 @@ struct davinci_mcasp_pdata {
 	unsigned sram_size_capture;
 	struct gen_pool *sram_pool;
 
-	/*
-	 * If McBSP peripheral gets the clock from an external pin,
-	 * there are three chooses, that are MCBSP_CLKX, MCBSP_CLKR
-	 * and MCBSP_CLKS.
-	 * Depending on different hardware connections it is possible
-	 * to use this setting to change the behaviour of McBSP
-	 * driver.
-	 */
-	int clk_input_pin;
-
 	/*
 	 * This flag works when both clock and FS are outputs for the cpu
 	 * and makes clock more accurate (FS is not symmetrical and the
@@ -91,11 +81,6 @@ enum {
 	MCASP_VERSION_OMAP,	/* OMAP4/5 */
 };
 
-enum mcbsp_clk_input_pin {
-	MCBSP_CLKR = 0,		/* as in DM365 */
-	MCBSP_CLKS,
-};
-
 #define INACTIVE_MODE	0
 #define TX_MODE		1
 #define RX_MODE		2
diff --git a/sound/soc/ti/davinci-i2s.c b/sound/soc/ti/davinci-i2s.c
index 07c8b2259208..5c906641640e 100644
--- a/sound/soc/ti/davinci-i2s.c
+++ b/sound/soc/ti/davinci-i2s.c
@@ -19,7 +19,6 @@
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/clk.h>
-#include <linux/platform_data/davinci_asp.h>
 
 #include <sound/core.h>
 #include <sound/pcm.h>
@@ -159,7 +158,6 @@ struct davinci_mcbsp_dev {
 
 	unsigned int fmt;
 	int clk_div;
-	int clk_input_pin;
 	bool i2s_accurate_sck;
 };
 
@@ -239,26 +237,12 @@ static int davinci_i2s_set_dai_fmt(struct snd_soc_dai *cpu_dai,
 			DAVINCI_MCBSP_PCR_CLKRM;
 		break;
 	case SND_SOC_DAIFMT_BC_FP:
-		pcr = DAVINCI_MCBSP_PCR_FSRM | DAVINCI_MCBSP_PCR_FSXM;
 		/*
-		 * Selection of the clock input pin that is the
-		 * input for the Sample Rate Generator.
-		 * McBSP FSR and FSX are driven by the Sample Rate
-		 * Generator.
+		 * McBSP CLKR pin is the input for the Sample Rate Generator.
+		 * McBSP FSR and FSX are driven by the Sample Rate Generator.
 		 */
-		switch (dev->clk_input_pin) {
-		case MCBSP_CLKS:
-			pcr |= DAVINCI_MCBSP_PCR_CLKXM |
-				DAVINCI_MCBSP_PCR_CLKRM;
-			break;
-		case MCBSP_CLKR:
-			pcr |= DAVINCI_MCBSP_PCR_SCLKME;
-			break;
-		default:
-			dev_err(dev->dev, "bad clk_input_pin\n");
-			return -EINVAL;
-		}
-
+		pcr = DAVINCI_MCBSP_PCR_FSRM | DAVINCI_MCBSP_PCR_FSXM;
+		pcr |= DAVINCI_MCBSP_PCR_SCLKME;
 		break;
 	case SND_SOC_DAIFMT_BC_FC:
 		/* codec is master */
-- 
2.44.0

