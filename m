Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 356C887DCAE
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Mar 2024 10:02:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6A3A23E0;
	Sun, 17 Mar 2024 10:02:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6A3A23E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710666158;
	bh=q/HkeRlpaieA7+S1Zq4RKJ57Symb70E/kyVvENJqJ7w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q19hSCFvmLEDKVXpR1p0RbRljuVpRjDPAeaUK0iJpmJm3uDBGdvn1GMCITcsKdOXL
	 SWxfY+IPfopqDJaTdiLhBwwLgYDHuX6OkX/SOKgiN+MjPX8j97cCplkPpPSM8AgPER
	 AT4xvjFvKEACeilBP3k4YhDVWjRiUHyzKb8BM0DU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06531F8057F; Sun, 17 Mar 2024 10:02:02 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D290F8057D;
	Sun, 17 Mar 2024 10:02:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5581BF8014B; Fri, 15 Mar 2024 12:28:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 007B0F80563
	for <alsa-devel@alsa-project.org>; Fri, 15 Mar 2024 12:28:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 007B0F80563
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZHaKolmq
Received: by mail.gandi.net (Postfix) with ESMTPA id F24ECE0010;
	Fri, 15 Mar 2024 11:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710502085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=COu6rizlcU/iAlgPx7V2opJGGo26BYauVb3ba1eZNgM=;
	b=ZHaKolmqERDtyC6GBThHLDu9kWPdkP3m/vJAdQgUzgqrX/8nxn+NRPnnYnib71RMRVqW+I
	0MGJXKjKMYCJqI1uI0Kbl58bDLyuDkjfEqDQ8M7bXCG5ug4d94RbIQXGBWVqMDLGGQIYB2
	Jy7RGIiBMDRNFyF5xT/XUg7yEh0O2ztpBaNHcSVsZliV9AHazDamAU40cqPOlyQtNmz/iH
	AWoRWqR6AGH2pHwRnrcQqLkPSxMMCnovypu9yffAweyAcXDYJmu52ydff/JtCD2aabL9Vs
	riU1JJKtaWs5P1/KpB3Lrhdn2dB3f2BddsZHnndhmkQSmDgJAXw1rKII0RvGNQ==
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
Subject: [PATCH 08/13] ASoC: ti: davinci-i2s: Add handling of BP_FC format
Date: Fri, 15 Mar 2024 12:27:40 +0100
Message-ID: <20240315112745.63230-9-bastien.curutchet@bootlin.com>
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
Message-ID-Hash: DU7BYL4B6XSUHNVDHLTGNKW7XW5N56XO
X-Message-ID-Hash: DU7BYL4B6XSUHNVDHLTGNKW7XW5N56XO
X-Mailman-Approved-At: Sun, 17 Mar 2024 08:56:01 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DU7BYL4B6XSUHNVDHLTGNKW7XW5N56XO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

McBSP is able to drive bit clock and consume frame clock but BP_FC
format is not handled by McBSP driver.

Add BP_FC format support.
When BP_FC is selected:
  - CLKX and CLKR are configured as outputs
  - The sample rate generator is configured to be able to provide bit
    clock.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 sound/soc/ti/davinci-i2s.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/sound/soc/ti/davinci-i2s.c b/sound/soc/ti/davinci-i2s.c
index 4adaed010700..7cdd86f47ead 100644
--- a/sound/soc/ti/davinci-i2s.c
+++ b/sound/soc/ti/davinci-i2s.c
@@ -306,6 +306,12 @@ static int davinci_i2s_set_dai_fmt(struct snd_soc_dai *cpu_dai,
 		pcr = DAVINCI_MCBSP_PCR_FSRM | DAVINCI_MCBSP_PCR_FSXM;
 		pcr |= DAVINCI_MCBSP_PCR_SCLKME;
 		break;
+	case SND_SOC_DAIFMT_BP_FC:
+		/* cpu is bitclock provider */
+		pcr = DAVINCI_MCBSP_PCR_CLKXM |
+			DAVINCI_MCBSP_PCR_CLKRM;
+		break;
+
 	case SND_SOC_DAIFMT_BC_FC:
 		/* codec is master */
 		pcr = 0;
@@ -491,6 +497,23 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
 		clk_div &= 0xFF;
 		srgr |= clk_div;
 		break;
+	case SND_SOC_DAIFMT_BP_FC:
+		if (dev->ext_clk) {
+			freq = clk_get_rate(dev->ext_clk);
+		} else {
+			freq = clk_get_rate(dev->clk);
+			srgr = DAVINCI_MCBSP_SRGR_CLKSM;
+		}
+		if (dev->tdm_slots && dev->slot_width) {
+			clk_div = freq / (params->rate_num * params->rate_den)
+				 / (dev->tdm_slots * dev->slot_width) - 1;
+		} else {
+			clk_div = freq / (mcbsp_word_length * 16) /
+				  params->rate_num * params->rate_den;
+		}
+		clk_div &= 0xFF;
+		srgr |= clk_div;
+		break;
 	case SND_SOC_DAIFMT_BC_FC:
 		/* Clock and frame sync given from external sources */
 		i = hw_param_interval(params, SNDRV_PCM_HW_PARAM_SAMPLE_BITS);
-- 
2.43.2

