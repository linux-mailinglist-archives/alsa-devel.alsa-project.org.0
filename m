Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA9587DCB7
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Mar 2024 10:04:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 533772368;
	Sun, 17 Mar 2024 10:04:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 533772368
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710666285;
	bh=xf2gnirs9NBtEZ1Xk3wbbzWcel2ZGkgx1esK1/Rn/mI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NZeIpM3u32U4nSsA9+WAGaBwinZmG4/QGPD0KJmxmwC2WOQEON3qq37gk2G6Fgeng
	 BzCRBBvGDw4CDNMR0RIbPtcve01eYVwM6mZn3Nk939H3PkvqLUih19V7JrlmCyLZvt
	 QBucL99ITBeqEJk/QbRZheDWpVKQteZHaDBrPjC0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96CF6F806A1; Sun, 17 Mar 2024 10:02:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94CF5F8069A;
	Sun, 17 Mar 2024 10:02:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7038AF80570; Fri, 15 Mar 2024 12:29:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3EA91F80093
	for <alsa-devel@alsa-project.org>; Fri, 15 Mar 2024 12:27:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EA91F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kTyKJc4y
Received: by mail.gandi.net (Postfix) with ESMTPA id 2E639E0006;
	Fri, 15 Mar 2024 11:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710502079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oS6/v1Kh5XV6ssrnHrgLVDsnztMrvT6ht6wxi9TnOcg=;
	b=kTyKJc4y0z+lIgkuSyNi01osbBGdO7ZLmmuvrb8zXyHQ90gw0aOZSI4oSB9yE09emHWDoY
	MisZ0sKNhK5wnsX/tn9A0gZAoMXMN3NOfujWFB9CACbamn37dSavFNnRu9xbjzbaQbX6i8
	ltUlnqKfBRI06fXUgBmfeVetBTydwntSgQEz7Aq3GBxEqx8LQnJ+XcJk/4Wqu8xb4qCrWH
	m+sAE96bTNbbLDcDCFXJ8227GRAvPXBewgxQNxK9cdEQySCYBFZgxkcdl2PtahmhLbX0T2
	9Z/UBf3J/LHX9belXvrDI95Qlx8RT9o5N2Fwwv09n6BjatqjcsXcvZzU9h/2qQ==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
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
Subject: [PATCH 03/13] ASoC: ti: davinci-i2s: Remove the unused clk_input_pin
 attribute
Date: Fri, 15 Mar 2024 12:27:35 +0100
Message-ID: <20240315112745.63230-4-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240315112745.63230-1-bastien.curutchet@bootlin.com>
References: <20240315112745.63230-1-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: bastien.curutchet@bootlin.com
X-MailFrom: bastien.curutchet@bootlin.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OXD63YDEXXAF54YF7W5PYMP3CYQNL6XP
X-Message-ID-Hash: OXD63YDEXXAF54YF7W5PYMP3CYQNL6XP
X-Mailman-Approved-At: Sun, 17 Mar 2024 08:56:28 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
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
2.43.2

