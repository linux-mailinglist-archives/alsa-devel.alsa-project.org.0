Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED4189AF11
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Apr 2024 09:19:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A6542999;
	Sun,  7 Apr 2024 09:19:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A6542999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712474395;
	bh=GJaodrsvsUKepJh5HOvgM3By9lC7drwoFVmPzzyuZSg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bupDr5HohgWr7qHTxCg9DrOTK1vHlb9iFIps/IGtJdm6uFF4lIbpS0GBsu51J/Dzw
	 EIINxL9RwEpH0DrPyNhH6qfgl1y828YxxZ+qvVMciHe1fJqAmTopgKGsQ5aXScoOel
	 jDRv+xoZNVcQ9tXjT7UISFvLxweFaRRvaa3DP2p0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C997DF806D8; Sun,  7 Apr 2024 09:17:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 37E49F806C5;
	Sun,  7 Apr 2024 09:17:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 071F0F8057A; Tue,  2 Apr 2024 09:13:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1D810F8057F
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 09:12:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D810F8057F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eollKoDn
Received: by mail.gandi.net (Postfix) with ESMTPA id 6FD7BFF80B;
	Tue,  2 Apr 2024 07:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712041949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B8mmblUe82t+hx13yGYU8qdAec50yUQsVghOvUGSIMk=;
	b=eollKoDn3KuG4KvaXPrltRHFBIsN36vPdK3DJkycbYXA+vraNbsfDEX9Yj6Z8BE6AvfK/a
	PhSP4VEgcmO09RYy7UQPwQPmg01KsFtKCzzp2JykNFDdd2XYeOVbVkMGU7j2eLXqbmzP82
	n4U9dFbj/BT4O289prGUTXXguyYsQ0B56MsM2sicYKtf+WyErz+lSIKTmZxxpXreqX7fSp
	jvECNCfqj6pzCBueS//S9/kKK8JcNOoxqq4i6dUnh9IxL+VR45OsNcBHt3QuClB+G8fLoS
	t9dTLg4iWF6odauJGkBQPsUU6wuWcJgqUwEgMLy5YX7SV+nGQ4nTdNANDcPtkg==
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
Subject: [PATCH v2 08/13] ASoC: ti: davinci-i2s: Add handling of BP_FC format
Date: Tue,  2 Apr 2024 09:12:08 +0200
Message-ID: <20240402071213.11671-9-bastien.curutchet@bootlin.com>
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
Message-ID-Hash: FONJZQJBKYBO3FFXANPTRRIMCYA6Q7AB
X-Message-ID-Hash: FONJZQJBKYBO3FFXANPTRRIMCYA6Q7AB
X-Mailman-Approved-At: Sun, 07 Apr 2024 07:14:07 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FONJZQJBKYBO3FFXANPTRRIMCYA6Q7AB/>
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
index f9a67c2bc2f5..e51f05cda941 100644
--- a/sound/soc/ti/davinci-i2s.c
+++ b/sound/soc/ti/davinci-i2s.c
@@ -310,6 +310,12 @@ static int davinci_i2s_set_dai_fmt(struct snd_soc_dai *cpu_dai,
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
 		if (dev->tdm_slots || dev->slot_width) {
 			dev_err(dev->dev, "TDM is not supported for BC_FC format\n");
@@ -500,6 +506,23 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
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
2.44.0

