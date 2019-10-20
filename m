Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1D5DDF2B
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Oct 2019 17:35:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 240CC1670;
	Sun, 20 Oct 2019 17:34:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 240CC1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571585719;
	bh=hVrRpn+t73PPb3QTi9bqmgKcDVXNu7+Eog8AQk3E8U4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fZ3k8MI6Y/ISlBrAgthyd3ElVSA3/29hwxU6RPBqP0nITP5dBqZNDgtOwjdbL1DWE
	 tyIVUfo3hj5okLlJEV3U22Id+Ib9sLT6lldMsxl6gyyIGb3jzn827tloevh6Lg8w1D
	 VZUWQ5Cw86F8iOK7dUBUR7cLivFqEtU61/WoJQOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3277EF80394;
	Sun, 20 Oct 2019 17:32:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78B32F802FB; Sun, 20 Oct 2019 17:32:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BF52F802BE
 for <alsa-devel@alsa-project.org>; Sun, 20 Oct 2019 17:32:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BF52F802BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="n9i3MniQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1571585559;
 s=strato-dkim-0002; d=gerhold.net;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=W+TWmeg1wsk/oAGTCOiJVndVJYDY5b8/wkGA5hgWhjA=;
 b=n9i3MniQaQJ4K0LWLQjSw2kczbjxOyVXe4KQlQEQX1jCh7qmwVdjptHhsljnSy2ixE
 WfdjPJGQ5WXrbN0ytNIYXQGD5jFFN8OelYYJYfKIT7NIwvD8d9b0DFD6Zyjt6ct1D68j
 VuIM1H9FqRBU9OXHu4r2gwr53edpPGuYriGX5HNPQ8N72zHf7COf2EUkMkYusN6iXXWy
 14om3Hb6OVlB1byIbrOf/Pj7vAc2v1hNeUMlgdkmO6jqg+Y5k+jz9iQWYu7hdRdokvHQ
 X8XLywglRDc3KWcXOGinUYuINNyaYvL6OMIpBeEl/nUpF5uOIgs1gUUUcDs/UZK3TICE
 QQjA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQr4OGUPX+1NiWA3IrA=="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
 by smtp.strato.de (RZmta 44.28.1 DYNA|AUTH)
 with ESMTPSA id 409989v9KFWXK6c
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Sun, 20 Oct 2019 17:32:33 +0200 (CEST)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Date: Sun, 20 Oct 2019 17:30:07 +0200
Message-Id: <20191020153007.206070-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191020153007.206070-1-stephan@gerhold.net>
References: <20191020153007.206070-1-stephan@gerhold.net>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Stephan Gerhold <stephan@gerhold.net>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH 2/2] ASoC: msm8916-wcd-analog: Add earpiece
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

PM8916 supports an earpiece as another (small) speaker.
The earpiece is routed through RX MIX1 similarly to
the headphones, except that RDAC2 MUX is set to RX1.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
This patch is based on code from the downstream driver
(msm8x16-wcd.c, [1]) with some cleanup.

This enables the earpiece on the Samsung Galaxy A5 (2015),
which has recently gained mainline support in [2].

[1]: https://source.codeaurora.org/quic/la/kernel/msm-3.10/tree/sound/soc/codecs/msm8x16-wcd.c?h=LA.BR.1.2.9.1-02310-8x16.0
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1329c1ab0730b521e6cd3051c56a2ff3d55f21e6
---
 sound/soc/codecs/msm8916-wcd-analog.c | 54 ++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
index e3d311fb510e..f53235be77d9 100644
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
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
