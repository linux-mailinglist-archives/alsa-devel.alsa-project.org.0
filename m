Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD4A117570
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 20:15:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7103616BF;
	Mon,  9 Dec 2019 20:14:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7103616BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575918924;
	bh=M5TpFlIPr4OjJjyVsT9/DsAd19wEN0vFpDbacIWEdto=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ta2jh6M74cNLI4RspOP+DEEO0adlIUauMMKDIX/u6prbA29pMiUcin/lnkVY2Asol
	 EVBbiLKqg6uivs/2XxmMG8qXghofiTqGBtvPEwNSsxZ8NB6mQd9dxEUM5sN4ckzlX2
	 PEmRGsAxZ1EbxA98LjtfLh3q5XndefEXrrqOSImA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECAE4F8036B;
	Mon,  9 Dec 2019 19:59:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A95DF80338; Mon,  9 Dec 2019 19:59:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 19BC9F80328
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 19:59:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19BC9F80328
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F495113E;
 Mon,  9 Dec 2019 10:59:31 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E36B93F6CF;
 Mon,  9 Dec 2019 10:59:30 -0800 (PST)
Date: Mon, 09 Dec 2019 18:59:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <20191128135447.26458-1-nikita.yoush@cogentembedded.com>
Message-Id: <applied-20191128135447.26458-1-nikita.yoush@cogentembedded.com>
X-Patchwork-Hint: ignore
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, "Andrew F. Davis" <afd@ti.com>,
 Chris Healy <cphealy@gmail.com>, Lucas Stach <l.stach@pengutronix.de>
Subject: [alsa-devel] Applied "ASoC: tlv320aic31xx: Add HP output driver pop
	reduction controls" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: tlv320aic31xx: Add HP output driver pop reduction controls

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

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

From 0bb1306f22fb8da72f3d1ba63854489cc8cfe0dd Mon Sep 17 00:00:00 2001
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Date: Thu, 28 Nov 2019 16:54:47 +0300
Subject: [PATCH] ASoC: tlv320aic31xx: Add HP output driver pop reduction
 controls

HP output driver has two parameters that can be configured to reduce
pop noise: power-on delay and ramp-up step time. Two new kcontrols
have been added to set these parameters.

Also have to alter timeout in aic31xx_dapm_power_event() because default
timeout does fire when higher supported power-on delay are configured.

Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Link: https://lore.kernel.org/r/20191128135447.26458-1-nikita.yoush@cogentembedded.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tlv320aic31xx.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic31xx.c b/sound/soc/codecs/tlv320aic31xx.c
index f6f19fdc72f5..d6c462f21370 100644
--- a/sound/soc/codecs/tlv320aic31xx.c
+++ b/sound/soc/codecs/tlv320aic31xx.c
@@ -262,6 +262,19 @@ static SOC_ENUM_SINGLE_DECL(mic1lm_p_enum, AIC31XX_MICPGAPI, 2,
 static SOC_ENUM_SINGLE_DECL(mic1lm_m_enum, AIC31XX_MICPGAMI, 4,
 	mic_select_text);
 
+static const char * const hp_poweron_time_text[] = {
+	"0us", "15.3us", "153us", "1.53ms", "15.3ms", "76.2ms",
+	"153ms", "304ms", "610ms", "1.22s", "3.04s", "6.1s" };
+
+static SOC_ENUM_SINGLE_DECL(hp_poweron_time_enum, AIC31XX_HPPOP, 3,
+	hp_poweron_time_text);
+
+static const char * const hp_rampup_step_text[] = {
+	"0ms", "0.98ms", "1.95ms", "3.9ms" };
+
+static SOC_ENUM_SINGLE_DECL(hp_rampup_step_enum, AIC31XX_HPPOP, 1,
+	hp_rampup_step_text);
+
 static const DECLARE_TLV_DB_SCALE(dac_vol_tlv, -6350, 50, 0);
 static const DECLARE_TLV_DB_SCALE(adc_fgain_tlv, 0, 10, 0);
 static const DECLARE_TLV_DB_SCALE(adc_cgain_tlv, -2000, 50, 0);
@@ -285,6 +298,14 @@ static const struct snd_kcontrol_new common31xx_snd_controls[] = {
 
 	SOC_DOUBLE_R_TLV("HP Analog Playback Volume", AIC31XX_LANALOGHPL,
 			 AIC31XX_RANALOGHPR, 0, 0x7F, 1, hp_vol_tlv),
+
+	/* HP de-pop control: apply power not immediately but via ramp
+	 * function with these psarameters. Note that power up sequence
+	 * has to wait for this to complete; this is implemented by
+	 * polling HP driver status in aic31xx_dapm_power_event()
+	 */
+	SOC_ENUM("HP Output Driver Power-On time", hp_poweron_time_enum),
+	SOC_ENUM("HP Output Driver Ramp-up step", hp_rampup_step_enum),
 };
 
 static const struct snd_kcontrol_new aic31xx_snd_controls[] = {
@@ -357,6 +378,7 @@ static int aic31xx_dapm_power_event(struct snd_soc_dapm_widget *w,
 	struct aic31xx_priv *aic31xx = snd_soc_component_get_drvdata(component);
 	unsigned int reg = AIC31XX_DACFLAG1;
 	unsigned int mask;
+	unsigned int timeout = 500 * USEC_PER_MSEC;
 
 	switch (WIDGET_BIT(w->reg, w->shift)) {
 	case WIDGET_BIT(AIC31XX_DACSETUP, 7):
@@ -367,9 +389,13 @@ static int aic31xx_dapm_power_event(struct snd_soc_dapm_widget *w,
 		break;
 	case WIDGET_BIT(AIC31XX_HPDRIVER, 7):
 		mask = AIC31XX_HPLDRVPWRSTATUS_MASK;
+		if (event == SND_SOC_DAPM_POST_PMU)
+			timeout = 7 * USEC_PER_SEC;
 		break;
 	case WIDGET_BIT(AIC31XX_HPDRIVER, 6):
 		mask = AIC31XX_HPRDRVPWRSTATUS_MASK;
+		if (event == SND_SOC_DAPM_POST_PMU)
+			timeout = 7 * USEC_PER_SEC;
 		break;
 	case WIDGET_BIT(AIC31XX_SPKAMP, 7):
 		mask = AIC31XX_SPLDRVPWRSTATUS_MASK;
@@ -389,9 +415,11 @@ static int aic31xx_dapm_power_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		return aic31xx_wait_bits(aic31xx, reg, mask, mask, 5000, 100);
+		return aic31xx_wait_bits(aic31xx, reg, mask, mask,
+				5000, timeout / 5000);
 	case SND_SOC_DAPM_POST_PMD:
-		return aic31xx_wait_bits(aic31xx, reg, mask, 0, 5000, 100);
+		return aic31xx_wait_bits(aic31xx, reg, mask, 0,
+				5000, timeout / 5000);
 	default:
 		dev_dbg(component->dev,
 			"Unhandled dapm widget event %d from %s\n",
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
