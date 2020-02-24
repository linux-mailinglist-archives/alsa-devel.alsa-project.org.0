Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F2616A785
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Feb 2020 14:44:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E4DC167C;
	Mon, 24 Feb 2020 14:43:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E4DC167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582551881;
	bh=JFOPdMiC6entIkTxbyo8ghyjVFdPt0mqYJqGB1xCFN0=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=BPhSXie4Joy/phO77CZZ/u6zSxGkMTguaVZ3tbpKxJG6F1lKmHRAqmu3dq5PNr5Gk
	 KzYb0Y3hZtOnbHMPZMZy2l6g+5ukCIqhqlDVsF1HQumr9NJ0RnrEZRHu5I9iJFjPGZ
	 RLUFjNu8nj/bLZhMkqCyFFkElV85k+c7So8gKd/s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1686DF80213;
	Mon, 24 Feb 2020 14:42:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8132F8027D; Mon, 24 Feb 2020 14:42:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 82979F80213
 for <alsa-devel@alsa-project.org>; Mon, 24 Feb 2020 14:41:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82979F80213
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 591F831B;
 Mon, 24 Feb 2020 05:41:55 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D28513F534;
 Mon, 24 Feb 2020 05:41:54 -0800 (PST)
Date: Mon, 24 Feb 2020 13:41:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Applied "ASoC: tlv320adcx140: Add decimation filter support" to the
 asoc tree
In-Reply-To: <20200221181358.22526-2-dmurphy@ti.com>
Message-Id: <applied-20200221181358.22526-2-dmurphy@ti.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, Mark Brown <broonie@kernel.org>
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

The patch

   ASoC: tlv320adcx140: Add decimation filter support

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 8101d76253f6d1032ca79e937e45b837cb4bf0e0 Mon Sep 17 00:00:00 2001
From: Dan Murphy <dmurphy@ti.com>
Date: Fri, 21 Feb 2020 12:13:58 -0600
Subject: [PATCH] ASoC: tlv320adcx140: Add decimation filter support

Add decimation filter selection support.
Per Section 8.3.6.7 the Digital Decimation Filter is selectable between
a Linear Phase, Low Latency, and Ultra Low Latency filer.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
Link: https://lore.kernel.org/r/20200221181358.22526-2-dmurphy@ti.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tlv320adcx140.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index 105e51be6fe6..93a0cb8e662c 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -169,6 +169,17 @@ static DECLARE_TLV_DB_SCALE(agc_thresh_tlv, -3600, 200, 0);
 /* AGC Max Gain. From 3 dB to 42 dB in 3 dB steps */
 static DECLARE_TLV_DB_SCALE(agc_gain_tlv, 300, 300, 0);
 
+static const char * const decimation_filter_text[] = {
+	"Linear Phase", "Low Latency", "Ultra-low Latency"
+};
+
+static SOC_ENUM_SINGLE_DECL(decimation_filter_enum, ADCX140_DSP_CFG0, 4,
+			    decimation_filter_text);
+
+static const struct snd_kcontrol_new decimation_filter_controls[] = {
+	SOC_DAPM_ENUM("Decimation Filter", decimation_filter_enum),
+};
+
 static const char * const resistor_text[] = {
 	"2.5 kOhm", "10 kOhm", "20 kOhm"
 };
@@ -404,6 +415,9 @@ static const struct snd_soc_dapm_widget adcx140_dapm_widgets[] = {
 			in3_resistor_controls),
 	SND_SOC_DAPM_MUX("IN4 Analog Mic Resistor", SND_SOC_NOPM, 0, 0,
 			in4_resistor_controls),
+
+	SND_SOC_DAPM_MUX("Decimation Filter", SND_SOC_NOPM, 0, 0,
+			decimation_filter_controls),
 };
 
 static const struct snd_soc_dapm_route adcx140_audio_map[] = {
@@ -418,6 +432,10 @@ static const struct snd_soc_dapm_route adcx140_audio_map[] = {
 	{"CH3_ASI_EN", "Switch", "CH3_ADC"},
 	{"CH4_ASI_EN", "Switch", "CH4_ADC"},
 
+	{"Decimation Filter", "Linear Phase", "DRE_ENABLE"},
+	{"Decimation Filter", "Low Latency", "DRE_ENABLE"},
+	{"Decimation Filter", "Ultra-low Latency", "DRE_ENABLE"},
+
 	{"DRE_ENABLE", "Switch", "CH1_DRE_EN"},
 	{"DRE_ENABLE", "Switch", "CH2_DRE_EN"},
 	{"DRE_ENABLE", "Switch", "CH3_DRE_EN"},
-- 
2.20.1

