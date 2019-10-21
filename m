Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BD9DF4B3
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2019 20:05:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A46E5166C;
	Mon, 21 Oct 2019 20:04:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A46E5166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571681112;
	bh=hQwlSWSBgWeXH8Zt2oD+Rup9s8fTceWdt+8EYvfo7I0=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=rFzdrhyo9k8JRvqOxd6SCi9Kw6SfTgrX5o8DXhbdoUD9yM6gkHTafb/6MlSGTimKe
	 VGNVLxFLK3UpBdSIESxv1ibCiA0OvsMwxMcNQpog5mJa8SAr8m855lk94vfaRensSO
	 /33GEzEZmphVjd0bvfnxx/YiezaYTYjSUu1kyzFM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 623B9F80633;
	Mon, 21 Oct 2019 20:01:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62326F8036F; Mon, 21 Oct 2019 20:00:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EEEE8F80393
 for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2019 20:00:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEEE8F80393
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="EUgOYGF+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=xPyRRoetFVp+xgqkSIDKATLWjAboLeoEpl+LnasuBUc=; b=EUgOYGF+Beig
 LtjRDnYCg+5Mfa7q7ooruOuORlo7LS+SnHXol54R3dVvuuZ44lcqy9B1H3r8MPEJldRZI2hmgN05N
 Bj1wjoQsGkTWVd2672CJRkZlrPyq2+WW7Vzs5AD/e6xok1BqG85JmZ3bSf3z3uqntrsglxhwV07gh
 SzE1o=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iMbz4-0004bb-UV; Mon, 21 Oct 2019 18:00:47 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 3D5772743267; Mon, 21 Oct 2019 19:00:46 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
In-Reply-To: <20191020153007.206070-2-stephan@gerhold.net>
X-Patchwork-Hint: ignore
Message-Id: <20191021180046.3D5772743267@ypsilon.sirena.org.uk>
Date: Mon, 21 Oct 2019 19:00:46 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] Applied "ASoC: msm8916-wcd-analog: Add earpiece" to
	the asoc tree
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

   ASoC: msm8916-wcd-analog: Add earpiece

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From 7d2f70f248ab0e4251591cf7b36cc43281941f56 Mon Sep 17 00:00:00 2001
From: Stephan Gerhold <stephan@gerhold.net>
Date: Sun, 20 Oct 2019 17:30:07 +0200
Subject: [PATCH] ASoC: msm8916-wcd-analog: Add earpiece

PM8916 supports an earpiece as another (small) speaker.
The earpiece is routed through RX MIX1 similarly to
the headphones, except that RDAC2 MUX is set to RX1.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Link: https://lore.kernel.org/r/20191020153007.206070-2-stephan@gerhold.net
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/msm8916-wcd-analog.c | 54 ++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
index 667e9f73aba3..4168b0a0aafb 100644
--- a/sound/soc/codecs/msm8916-wcd-analog.c
+++ b/sound/soc/codecs/msm8916-wcd-analog.c
@@ -228,6 +228,10 @@
 #define CDC_A_RX_EAR_CTL			(0xf19E)
 #define RX_EAR_CTL_SPK_VBAT_LDO_EN_MASK		BIT(0)
 #define RX_EAR_CTL_SPK_VBAT_LDO_EN_ENABLE	BIT(0)
+#define RX_EAR_CTL_PA_EAR_PA_EN_MASK		BIT(6)
+#define RX_EAR_CTL_PA_EAR_PA_EN_ENABLE		BIT(6)
+#define RX_EAR_CTL_PA_SEL_MASK			BIT(7)
+#define RX_EAR_CTL_PA_SEL			BIT(7)
 
 #define CDC_A_SPKR_DAC_CTL		(0xf1B0)
 #define SPKR_DAC_CTL_DAC_RESET_MASK	BIT(4)
@@ -312,6 +316,7 @@ static const char *const hph_text[] = { "ZERO", "Switch", };
 static const struct soc_enum hph_enum = SOC_ENUM_SINGLE_VIRT(
 					ARRAY_SIZE(hph_text), hph_text);
 
+static const struct snd_kcontrol_new ear_mux = SOC_DAPM_ENUM("EAR_S", hph_enum);
 static const struct snd_kcontrol_new hphl_mux = SOC_DAPM_ENUM("HPHL", hph_enum);
 static const struct snd_kcontrol_new hphr_mux = SOC_DAPM_ENUM("HPHR", hph_enum);
 
@@ -685,6 +690,34 @@ static int pm8916_wcd_analog_enable_spk_pa(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+static int pm8916_wcd_analog_enable_ear_pa(struct snd_soc_dapm_widget *w,
+					    struct snd_kcontrol *kcontrol,
+					    int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		snd_soc_component_update_bits(component, CDC_A_RX_EAR_CTL,
+				    RX_EAR_CTL_PA_SEL_MASK, RX_EAR_CTL_PA_SEL);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		snd_soc_component_update_bits(component, CDC_A_RX_EAR_CTL,
+				    RX_EAR_CTL_PA_EAR_PA_EN_MASK,
+				    RX_EAR_CTL_PA_EAR_PA_EN_ENABLE);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		snd_soc_component_update_bits(component, CDC_A_RX_EAR_CTL,
+				    RX_EAR_CTL_PA_EAR_PA_EN_MASK, 0);
+		/* Delay to reduce ear turn off pop */
+		usleep_range(7000, 7100);
+		snd_soc_component_update_bits(component, CDC_A_RX_EAR_CTL,
+				    RX_EAR_CTL_PA_SEL_MASK, 0);
+		break;
+	}
+	return 0;
+}
+
 static const struct reg_default wcd_reg_defaults_2_0[] = {
 	{CDC_A_RX_COM_OCP_CTL, 0xD1},
 	{CDC_A_RX_COM_OCP_COUNT, 0xFF},
@@ -801,12 +834,20 @@ static const struct snd_soc_dapm_route pm8916_wcd_analog_audio_map[] = {
 	{"PDM_TX", NULL, "A_MCLK2"},
 	{"A_MCLK2", NULL, "A_MCLK"},
 
+	/* Earpiece (RX MIX1) */
+	{"EAR", NULL, "EAR_S"},
+	{"EAR_S", "Switch", "EAR PA"},
+	{"EAR PA", NULL, "RX_BIAS"},
+	{"EAR PA", NULL, "HPHL DAC"},
+	{"EAR PA", NULL, "HPHR DAC"},
+	{"EAR PA", NULL, "EAR CP"},
+
 	/* Headset (RX MIX1 and RX MIX2) */
 	{"HEADPHONE", NULL, "HPHL PA"},
 	{"HEADPHONE", NULL, "HPHR PA"},
 
-	{"HPHL PA", NULL, "EAR_HPHL_CLK"},
-	{"HPHR PA", NULL, "EAR_HPHR_CLK"},
+	{"HPHL DAC", NULL, "EAR_HPHL_CLK"},
+	{"HPHR DAC", NULL, "EAR_HPHR_CLK"},
 
 	{"CP", NULL, "NCP_CLK"},
 
@@ -847,11 +888,20 @@ static const struct snd_soc_dapm_widget pm8916_wcd_analog_dapm_widgets[] = {
 	SND_SOC_DAPM_INPUT("AMIC1"),
 	SND_SOC_DAPM_INPUT("AMIC3"),
 	SND_SOC_DAPM_INPUT("AMIC2"),
+	SND_SOC_DAPM_OUTPUT("EAR"),
 	SND_SOC_DAPM_OUTPUT("HEADPHONE"),
 
 	/* RX stuff */
 	SND_SOC_DAPM_SUPPLY("INT_LDO_H", SND_SOC_NOPM, 1, 0, NULL, 0),
 
+	SND_SOC_DAPM_PGA_E("EAR PA", SND_SOC_NOPM,
+			   0, 0, NULL, 0,
+			   pm8916_wcd_analog_enable_ear_pa,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX("EAR_S", SND_SOC_NOPM, 0, 0, &ear_mux),
+	SND_SOC_DAPM_SUPPLY("EAR CP", CDC_A_NCP_EN, 4, 0, NULL, 0),
+
 	SND_SOC_DAPM_PGA("HPHL PA", CDC_A_RX_HPH_CNP_EN, 5, 0, NULL, 0),
 	SND_SOC_DAPM_MUX("HPHL", SND_SOC_NOPM, 0, 0, &hphl_mux),
 	SND_SOC_DAPM_MIXER("HPHL DAC", CDC_A_RX_HPH_L_PA_DAC_CTL, 3, 0, NULL,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
