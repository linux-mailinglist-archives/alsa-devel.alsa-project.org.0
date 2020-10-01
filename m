Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D230127F7F8
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 04:26:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 752CD184C;
	Thu,  1 Oct 2020 04:25:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 752CD184C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601519195;
	bh=Te4K4uN74M3XQE9UuvZfOWl3dor0mfAToHRCt7xPjwM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U5hIaPhZnFAqtkEuFhJG7lcF9b/jJZvI2CFArXttIDYazM4S5OzO3I1tlXLUlLwnK
	 /Nc99Cad+RYTXmk6lVYHC3TKie4xE9AFYbRk9WZCGyWCsmNluEPRQoBvinay/nGyLF
	 hjBURGitVkYt7r+m5qU31HGYilfBPcY8XLhrPFhQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29850F803DE;
	Thu,  1 Oct 2020 04:12:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99133F8034B; Thu,  1 Oct 2020 04:12:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,UPPERCASE_50_75,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DB35F802EB
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 04:12:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DB35F802EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="a6zxn42D"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="dJfU7dh5"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6E73B5803AC;
 Wed, 30 Sep 2020 22:12:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 30 Sep 2020 22:12:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=ppKX6agETJPcN
 UXp17GunuO5bcnC4sDbqa/3/4yDRvo=; b=a6zxn42Dt0KS6SE4bCmJ0NfxER2e0
 YodfyHDv71dsOLU3RBPwtzG6fjaHSA8x6BNQCixglnjoZDuXLe7xyu56j0Ea20sV
 1/2ESw3dMbpmE13BGD+Qj6beHrNYmaQ7svvNduxM20+D8EF/t8V90tF2sYQ8CnbG
 fVWprjbuNZeMrOgYlGddq2bC0t3OJfA35T95azLI2YE3ZOlonhFIT5kgnDERgZuw
 Kg0nAPxqP7DlA/lkPRX3lAh7T+Owy0LL94pvCeETGzJHZtoyH3ISEMXz4Lj5LBqr
 7kuRvc1z4HCXYWbI/6FY94s71l+4KwaUvQQIcFrJQJKAj+/NVjXccUNzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=ppKX6agETJPcNUXp17GunuO5bcnC4sDbqa/3/4yDRvo=; b=dJfU7dh5
 2LHrUFRW+JK1JumhCnm+FqccFFPR4iHvYt5BmeckH2Ghw0pmf0UI08jmrTuGryz2
 lSAOl79mHk67CnYxHvWTMcQ2qpjaWsosTHejbmYd+fgig0RQ8cUsZvgFWGgX6k53
 6KmdgPkLWMqNkmJUh9vx9BIUw54jxMpOYlsSpjY0gbjs8nYmRDl6z+omnvAAi6kr
 iwDZ7uxVfdBqiExshyefzyfnUzY9SuDfTskcpZ1nrHNH/rzVWxm8//CDHxC7AW/L
 6X5xtxkD821/iiRXBx9w+UvTynHg2B9CY3Ig73ewktHjXwMTAspp5Tfj66bLif0Y
 eRbcEwB3mXWlHQ==
X-ME-Sender: <xms:8Tp1Xw5jFUsPpqhwFkAj0gD99bGtB9kI99W_YGfop3gwj36wwJZUXQ>
 <xme:8Tp1Xx7d9-v-oIM6fcDmuVYJ_j5zrIx1QoSSCbYgJN8maOGfa3iH_YyXR-6lWGQhg
 7AEkEi26WVD6y5wDQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeefgdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
 grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
 jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
 gvpedujeenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
 ugdrohhrgh
X-ME-Proxy: <xmx:8Tp1X_dxOvwHN7lPrywLAHvzJtjfJEEGXurJ4ezA3mJns16UzTreIw>
 <xmx:8Tp1X1Lc3W2KT9p2xrsSnMSPqOaaeO42YfgxIAnW6syBYAz95ZpRJg>
 <xmx:8Tp1X0I_RI-w_2ih5IKIeZ_GXxJaiUy8s6IWVWB6nn2Xkk6wS8MWPg>
 <xmx:8Tp1Xz_GVftB8h13sVf4-WpL3TUChdMuRz-DsWEacW68fLXZ_J6gwA>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9AB213064680;
 Wed, 30 Sep 2020 22:12:00 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 24/25] ASoC: sun8i-codec: Add a DAI, widgets,
 and routes for AIF2
Date: Wed, 30 Sep 2020 21:11:47 -0500
Message-Id: <20201001021148.15852-25-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201001021148.15852-1-samuel@sholland.org>
References: <20201001021148.15852-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ondrej Jirman <megous@megous.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Samuel Holland <samuel@sholland.org>
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

This adds support for AIF2, which is stereo and has full clocking
capability, making it very similar to AIF1.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 215 ++++++++++++++++++++++++++++++++++
 1 file changed, 215 insertions(+)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 1c34502ac47a..9fa4eca501df 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -28,20 +28,22 @@
 #define SUN8I_SYSCLK_CTL_AIF2CLK_ENA			7
 #define SUN8I_SYSCLK_CTL_AIF2CLK_SRC_PLL		(0x2 << 4)
 #define SUN8I_SYSCLK_CTL_SYSCLK_ENA			3
 #define SUN8I_SYSCLK_CTL_SYSCLK_SRC			0
 #define SUN8I_SYSCLK_CTL_SYSCLK_SRC_AIF1CLK		(0x0 << 0)
 #define SUN8I_SYSCLK_CTL_SYSCLK_SRC_AIF2CLK		(0x1 << 0)
 #define SUN8I_MOD_CLK_ENA				0x010
 #define SUN8I_MOD_CLK_ENA_AIF1				15
+#define SUN8I_MOD_CLK_ENA_AIF2				14
 #define SUN8I_MOD_CLK_ENA_ADC				3
 #define SUN8I_MOD_CLK_ENA_DAC				2
 #define SUN8I_MOD_RST_CTL				0x014
 #define SUN8I_MOD_RST_CTL_AIF1				15
+#define SUN8I_MOD_RST_CTL_AIF2				14
 #define SUN8I_MOD_RST_CTL_ADC				3
 #define SUN8I_MOD_RST_CTL_DAC				2
 #define SUN8I_SYS_SR_CTRL				0x018
 #define SUN8I_SYS_SR_CTRL_AIF1_FS			12
 #define SUN8I_SYS_SR_CTRL_AIF2_FS			8
 #define SUN8I_AIF_CLK_CTRL(n)				(0x040 * (1 + (n)))
 #define SUN8I_AIF_CLK_CTRL_MSTR_MOD			15
 #define SUN8I_AIF_CLK_CTRL_CLK_INV			13
@@ -63,16 +65,39 @@
 #define SUN8I_AIF1_MXR_SRC_AD0L_MXR_SRC_AIF1DA0L	15
 #define SUN8I_AIF1_MXR_SRC_AD0L_MXR_SRC_AIF2DACL	14
 #define SUN8I_AIF1_MXR_SRC_AD0L_MXR_SRC_ADCL		13
 #define SUN8I_AIF1_MXR_SRC_AD0L_MXR_SRC_AIF2DACR	12
 #define SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_AIF1DA0R	11
 #define SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_AIF2DACR	10
 #define SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_ADCR		9
 #define SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_AIF2DACL	8
+#define SUN8I_AIF2_ADCDAT_CTRL				0x084
+#define SUN8I_AIF2_ADCDAT_CTRL_AIF2_ADCL_ENA		15
+#define SUN8I_AIF2_ADCDAT_CTRL_AIF2_ADCR_ENA		14
+#define SUN8I_AIF2_ADCDAT_CTRL_AIF2_ADCL_SRC		10
+#define SUN8I_AIF2_ADCDAT_CTRL_AIF2_ADCR_SRC		8
+#define SUN8I_AIF2_DACDAT_CTRL				0x088
+#define SUN8I_AIF2_DACDAT_CTRL_AIF2_DACL_ENA		15
+#define SUN8I_AIF2_DACDAT_CTRL_AIF2_DACR_ENA		14
+#define SUN8I_AIF2_DACDAT_CTRL_AIF2_DACL_SRC		10
+#define SUN8I_AIF2_DACDAT_CTRL_AIF2_DACR_SRC		8
+#define SUN8I_AIF2_MXR_SRC				0x08c
+#define SUN8I_AIF2_MXR_SRC_ADCL_MXR_SRC_AIF1DA0L	15
+#define SUN8I_AIF2_MXR_SRC_ADCL_MXR_SRC_AIF1DA1L	14
+#define SUN8I_AIF2_MXR_SRC_ADCL_MXR_SRC_AIF2DACR	13
+#define SUN8I_AIF2_MXR_SRC_ADCL_MXR_SRC_ADCL		12
+#define SUN8I_AIF2_MXR_SRC_ADCR_MXR_SRC_AIF1DA0R	11
+#define SUN8I_AIF2_MXR_SRC_ADCR_MXR_SRC_AIF1DA1R	10
+#define SUN8I_AIF2_MXR_SRC_ADCR_MXR_SRC_AIF2DACL	9
+#define SUN8I_AIF2_MXR_SRC_ADCR_MXR_SRC_ADCR		8
+#define SUN8I_AIF3_PATH_CTRL				0x0cc
+#define SUN8I_AIF3_PATH_CTRL_AIF3_ADC_SRC		10
+#define SUN8I_AIF3_PATH_CTRL_AIF2_DAC_SRC		8
+#define SUN8I_AIF3_PATH_CTRL_AIF3_PINS_TRI		7
 #define SUN8I_ADC_DIG_CTRL				0x100
 #define SUN8I_ADC_DIG_CTRL_ENAD				15
 #define SUN8I_ADC_DIG_CTRL_ADOUT_DTS			2
 #define SUN8I_ADC_DIG_CTRL_ADOUT_DLY			1
 #define SUN8I_DAC_DIG_CTRL				0x120
 #define SUN8I_DAC_DIG_CTRL_ENDA				15
 #define SUN8I_DAC_MXR_SRC				0x130
 #define SUN8I_DAC_MXR_SRC_DACL_MXR_SRC_AIF1DA0L		15
@@ -107,16 +132,17 @@
 				 SNDRV_PCM_RATE_88200     |\
 				 SNDRV_PCM_RATE_96000     |\
 				 SNDRV_PCM_RATE_176400    |\
 				 SNDRV_PCM_RATE_192000    |\
 				 SNDRV_PCM_RATE_KNOT)
 
 enum {
 	AIF1,
+	AIF2,
 	NAIFS
 };
 
 struct sun8i_codec_aif {
 	unsigned int	sample_rate;
 	unsigned int	slots;
 	unsigned int	slot_width;
 	unsigned int	active_streams	: 2;
@@ -359,16 +385,20 @@ static const struct snd_pcm_hw_constraint_list sun8i_codec_24M_rates = {
 };
 
 static int sun8i_codec_startup(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
 {
 	struct sun8i_codec *scodec = snd_soc_dai_get_drvdata(dai);
 	const struct snd_pcm_hw_constraint_list *list;
 
+	/* hw_constraints is not relevant for codec2codec DAIs. */
+	if (dai->id != AIF1)
+		return 0;
+
 	if (!scodec->sysclk_refcnt)
 		list = &sun8i_codec_all_rates;
 	else if (scodec->sysclk_rate == 22579200)
 		list = &sun8i_codec_22M_rates;
 	else if (scodec->sysclk_rate == 24576000)
 		list = &sun8i_codec_24M_rates;
 	else
 		return -EINVAL;
@@ -557,16 +587,41 @@ static struct snd_soc_dai_driver sun8i_codec_dais[] = {
 			.channels_max	= 2,
 			.rates		= SUN8I_CODEC_PCM_RATES,
 			.formats	= SUN8I_CODEC_PCM_FORMATS,
 		},
 		.symmetric_rates	= true,
 		.symmetric_channels	= true,
 		.symmetric_samplebits	= true,
 	},
+	{
+		.name	= "sun8i-codec-aif2",
+		.id	= AIF2,
+		.ops	= &sun8i_codec_dai_ops,
+		/* capture capabilities */
+		.capture = {
+			.stream_name	= "AIF2 Capture",
+			.channels_min	= 1,
+			.channels_max	= 2,
+			.rates		= SUN8I_CODEC_PCM_RATES,
+			.formats	= SUN8I_CODEC_PCM_FORMATS,
+			.sig_bits	= 24,
+		},
+		/* playback capabilities */
+		.playback = {
+			.stream_name	= "AIF2 Playback",
+			.channels_min	= 1,
+			.channels_max	= 2,
+			.rates		= SUN8I_CODEC_PCM_RATES,
+			.formats	= SUN8I_CODEC_PCM_FORMATS,
+		},
+		.symmetric_rates	= true,
+		.symmetric_channels	= true,
+		.symmetric_samplebits	= true,
+	},
 };
 
 static int sun8i_codec_aif_event(struct snd_soc_dapm_widget *w,
 				 struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct sun8i_codec *scodec = snd_soc_component_get_drvdata(component);
 	struct sun8i_codec_aif *aif = &scodec->aifs[w->sname[3] - '1'];
@@ -589,16 +644,26 @@ static SOC_ENUM_DOUBLE_DECL(sun8i_aif1_ad0_stereo_mux_enum,
 			    SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0L_SRC,
 			    SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0R_SRC,
 			    sun8i_aif_stereo_mux_enum_values);
 
 static const struct snd_kcontrol_new sun8i_aif1_ad0_stereo_mux_control =
 	SOC_DAPM_ENUM("AIF1 AD0 Stereo Capture Route",
 		      sun8i_aif1_ad0_stereo_mux_enum);
 
+static SOC_ENUM_DOUBLE_DECL(sun8i_aif2_adc_stereo_mux_enum,
+			    SUN8I_AIF2_ADCDAT_CTRL,
+			    SUN8I_AIF2_ADCDAT_CTRL_AIF2_ADCL_SRC,
+			    SUN8I_AIF2_ADCDAT_CTRL_AIF2_ADCR_SRC,
+			    sun8i_aif_stereo_mux_enum_values);
+
+static const struct snd_kcontrol_new sun8i_aif2_adc_stereo_mux_control =
+	SOC_DAPM_ENUM("AIF2 ADC Stereo Capture Route",
+		      sun8i_aif2_adc_stereo_mux_enum);
+
 static const struct snd_kcontrol_new sun8i_aif1_ad0_mixer_controls[] = {
 	SOC_DAPM_DOUBLE("AIF1 Slot 0 Digital ADC Capture Switch",
 			SUN8I_AIF1_MXR_SRC,
 			SUN8I_AIF1_MXR_SRC_AD0L_MXR_SRC_AIF1DA0L,
 			SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_AIF1DA0R, 1, 0),
 	SOC_DAPM_DOUBLE("AIF2 Digital ADC Capture Switch",
 			SUN8I_AIF1_MXR_SRC,
 			SUN8I_AIF1_MXR_SRC_AD0L_MXR_SRC_AIF2DACL,
@@ -608,26 +673,68 @@ static const struct snd_kcontrol_new sun8i_aif1_ad0_mixer_controls[] = {
 			SUN8I_AIF1_MXR_SRC_AD0L_MXR_SRC_ADCL,
 			SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_ADCR, 1, 0),
 	SOC_DAPM_DOUBLE("AIF2 Inv Digital ADC Capture Switch",
 			SUN8I_AIF1_MXR_SRC,
 			SUN8I_AIF1_MXR_SRC_AD0L_MXR_SRC_AIF2DACR,
 			SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_AIF2DACL, 1, 0),
 };
 
+static const struct snd_kcontrol_new sun8i_aif2_adc_mixer_controls[] = {
+	SOC_DAPM_DOUBLE("AIF2 ADC Mixer AIF1 DA0 Capture Switch",
+			SUN8I_AIF2_MXR_SRC,
+			SUN8I_AIF2_MXR_SRC_ADCL_MXR_SRC_AIF1DA0L,
+			SUN8I_AIF2_MXR_SRC_ADCR_MXR_SRC_AIF1DA0R, 1, 0),
+	SOC_DAPM_DOUBLE("AIF2 ADC Mixer AIF1 DA1 Capture Switch",
+			SUN8I_AIF2_MXR_SRC,
+			SUN8I_AIF2_MXR_SRC_ADCL_MXR_SRC_AIF1DA1L,
+			SUN8I_AIF2_MXR_SRC_ADCR_MXR_SRC_AIF1DA1R, 1, 0),
+	SOC_DAPM_DOUBLE("AIF2 ADC Mixer AIF2 DAC Rev Capture Switch",
+			SUN8I_AIF2_MXR_SRC,
+			SUN8I_AIF2_MXR_SRC_ADCL_MXR_SRC_AIF2DACR,
+			SUN8I_AIF2_MXR_SRC_ADCR_MXR_SRC_AIF2DACL, 1, 0),
+	SOC_DAPM_DOUBLE("AIF2 ADC Mixer ADC Capture Switch",
+			SUN8I_AIF2_MXR_SRC,
+			SUN8I_AIF2_MXR_SRC_ADCL_MXR_SRC_ADCL,
+			SUN8I_AIF2_MXR_SRC_ADCR_MXR_SRC_ADCR, 1, 0),
+};
+
+static const char *const sun8i_aif2_dac_mux_enum_values[] = {
+	"AIF2", "AIF3+2", "AIF2+3"
+};
+
+static SOC_ENUM_SINGLE_DECL(sun8i_aif2_dac_mux_enum,
+			    SUN8I_AIF3_PATH_CTRL,
+			    SUN8I_AIF3_PATH_CTRL_AIF2_DAC_SRC,
+			    sun8i_aif2_dac_mux_enum_values);
+
+static const struct snd_kcontrol_new sun8i_aif2_dac_mux_control =
+	SOC_DAPM_ENUM("AIF2 DAC Source Playback Route",
+		      sun8i_aif2_dac_mux_enum);
+
 static SOC_ENUM_DOUBLE_DECL(sun8i_aif1_da0_stereo_mux_enum,
 			    SUN8I_AIF1_DACDAT_CTRL,
 			    SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0L_SRC,
 			    SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0R_SRC,
 			    sun8i_aif_stereo_mux_enum_values);
 
 static const struct snd_kcontrol_new sun8i_aif1_da0_stereo_mux_control =
 	SOC_DAPM_ENUM("AIF1 DA0 Stereo Playback Route",
 		      sun8i_aif1_da0_stereo_mux_enum);
 
+static SOC_ENUM_DOUBLE_DECL(sun8i_aif2_dac_stereo_mux_enum,
+			    SUN8I_AIF2_DACDAT_CTRL,
+			    SUN8I_AIF2_DACDAT_CTRL_AIF2_DACL_SRC,
+			    SUN8I_AIF2_DACDAT_CTRL_AIF2_DACR_SRC,
+			    sun8i_aif_stereo_mux_enum_values);
+
+static const struct snd_kcontrol_new sun8i_aif2_dac_stereo_mux_control =
+	SOC_DAPM_ENUM("AIF2 DAC Stereo Playback Route",
+		      sun8i_aif2_dac_stereo_mux_enum);
+
 static const struct snd_kcontrol_new sun8i_dac_mixer_controls[] = {
 	SOC_DAPM_DOUBLE("AIF1 Slot 0 Digital DAC Playback Switch",
 			SUN8I_DAC_MXR_SRC,
 			SUN8I_DAC_MXR_SRC_DACL_MXR_SRC_AIF1DA0L,
 			SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_AIF1DA0R, 1, 0),
 	SOC_DAPM_DOUBLE("AIF1 Slot 1 Digital DAC Playback Switch",
 			SUN8I_DAC_MXR_SRC,
 			SUN8I_DAC_MXR_SRC_DACL_MXR_SRC_AIF1DA1L,
@@ -642,35 +749,44 @@ static const struct snd_kcontrol_new sun8i_dac_mixer_controls[] = {
 
 static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
 	/* System Clocks */
 	SND_SOC_DAPM_CLOCK_SUPPLY("mod"),
 
 	SND_SOC_DAPM_SUPPLY("AIF1CLK",
 			    SUN8I_SYSCLK_CTL,
 			    SUN8I_SYSCLK_CTL_AIF1CLK_ENA, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("AIF2CLK",
+			    SUN8I_SYSCLK_CTL,
+			    SUN8I_SYSCLK_CTL_AIF2CLK_ENA, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("SYSCLK",
 			    SUN8I_SYSCLK_CTL,
 			    SUN8I_SYSCLK_CTL_SYSCLK_ENA, 0, NULL, 0),
 
 	/* Module Clocks */
 	SND_SOC_DAPM_SUPPLY("CLK AIF1",
 			    SUN8I_MOD_CLK_ENA,
 			    SUN8I_MOD_CLK_ENA_AIF1, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("CLK AIF2",
+			    SUN8I_MOD_CLK_ENA,
+			    SUN8I_MOD_CLK_ENA_AIF2, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("CLK ADC",
 			    SUN8I_MOD_CLK_ENA,
 			    SUN8I_MOD_CLK_ENA_ADC, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("CLK DAC",
 			    SUN8I_MOD_CLK_ENA,
 			    SUN8I_MOD_CLK_ENA_DAC, 0, NULL, 0),
 
 	/* Module Resets */
 	SND_SOC_DAPM_SUPPLY("RST AIF1",
 			    SUN8I_MOD_RST_CTL,
 			    SUN8I_MOD_RST_CTL_AIF1, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("RST AIF2",
+			    SUN8I_MOD_RST_CTL,
+			    SUN8I_MOD_RST_CTL_AIF2, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("RST ADC",
 			    SUN8I_MOD_RST_CTL,
 			    SUN8I_MOD_RST_CTL_ADC, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("RST DAC",
 			    SUN8I_MOD_RST_CTL,
 			    SUN8I_MOD_RST_CTL_DAC, 0, NULL, 0),
 
 	/* Module Supplies */
@@ -686,44 +802,83 @@ static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
 			       SUN8I_AIF1_ADCDAT_CTRL,
 			       SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0L_ENA, 0,
 			       sun8i_codec_aif_event,
 			       SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_AIF_OUT("AIF1 AD0R", "AIF1 Capture", 1,
 			     SUN8I_AIF1_ADCDAT_CTRL,
 			     SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0R_ENA, 0),
 
+	SND_SOC_DAPM_AIF_OUT_E("AIF2 ADCL", "AIF2 Capture", 0,
+			       SUN8I_AIF2_ADCDAT_CTRL,
+			       SUN8I_AIF2_ADCDAT_CTRL_AIF2_ADCL_ENA, 0,
+			       sun8i_codec_aif_event,
+			       SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_AIF_OUT("AIF2 ADCR", "AIF2 Capture", 1,
+			     SUN8I_AIF2_ADCDAT_CTRL,
+			     SUN8I_AIF2_ADCDAT_CTRL_AIF2_ADCR_ENA, 0),
+
 	/* AIF "ADC" Mono/Stereo Muxes */
 	SND_SOC_DAPM_MUX("AIF1 AD0L Stereo Mux", SND_SOC_NOPM, 0, 0,
 			 &sun8i_aif1_ad0_stereo_mux_control),
 	SND_SOC_DAPM_MUX("AIF1 AD0R Stereo Mux", SND_SOC_NOPM, 0, 0,
 			 &sun8i_aif1_ad0_stereo_mux_control),
 
+	SND_SOC_DAPM_MUX("AIF2 ADCL Stereo Mux", SND_SOC_NOPM, 0, 0,
+			 &sun8i_aif2_adc_stereo_mux_control),
+	SND_SOC_DAPM_MUX("AIF2 ADCR Stereo Mux", SND_SOC_NOPM, 0, 0,
+			 &sun8i_aif2_adc_stereo_mux_control),
+
 	/* AIF "ADC" Mixers */
 	SOC_MIXER_ARRAY("AIF1 AD0L Mixer", SND_SOC_NOPM, 0, 0,
 			sun8i_aif1_ad0_mixer_controls),
 	SOC_MIXER_ARRAY("AIF1 AD0R Mixer", SND_SOC_NOPM, 0, 0,
 			sun8i_aif1_ad0_mixer_controls),
 
+	SOC_MIXER_ARRAY("AIF2 ADCL Mixer", SND_SOC_NOPM, 0, 0,
+			sun8i_aif2_adc_mixer_controls),
+	SOC_MIXER_ARRAY("AIF2 ADCR Mixer", SND_SOC_NOPM, 0, 0,
+			sun8i_aif2_adc_mixer_controls),
+
+	/* AIF "DAC" Input Muxes */
+	SND_SOC_DAPM_MUX("AIF2 DACL Source", SND_SOC_NOPM, 0, 0,
+			 &sun8i_aif2_dac_mux_control),
+	SND_SOC_DAPM_MUX("AIF2 DACR Source", SND_SOC_NOPM, 0, 0,
+			 &sun8i_aif2_dac_mux_control),
+
 	/* AIF "DAC" Mono/Stereo Muxes */
 	SND_SOC_DAPM_MUX("AIF1 DA0L Stereo Mux", SND_SOC_NOPM, 0, 0,
 			 &sun8i_aif1_da0_stereo_mux_control),
 	SND_SOC_DAPM_MUX("AIF1 DA0R Stereo Mux", SND_SOC_NOPM, 0, 0,
 			 &sun8i_aif1_da0_stereo_mux_control),
 
+	SND_SOC_DAPM_MUX("AIF2 DACL Stereo Mux", SND_SOC_NOPM, 0, 0,
+			 &sun8i_aif2_dac_stereo_mux_control),
+	SND_SOC_DAPM_MUX("AIF2 DACR Stereo Mux", SND_SOC_NOPM, 0, 0,
+			 &sun8i_aif2_dac_stereo_mux_control),
+
 	/* AIF "DAC" Inputs */
 	SND_SOC_DAPM_AIF_IN_E("AIF1 DA0L", "AIF1 Playback", 0,
 			      SUN8I_AIF1_DACDAT_CTRL,
 			      SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0L_ENA, 0,
 			      sun8i_codec_aif_event,
 			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_AIF_IN("AIF1 DA0R", "AIF1 Playback", 1,
 			    SUN8I_AIF1_DACDAT_CTRL,
 			    SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0R_ENA, 0),
 
+	SND_SOC_DAPM_AIF_IN_E("AIF2 DACL", "AIF2 Playback", 0,
+			      SUN8I_AIF2_DACDAT_CTRL,
+			      SUN8I_AIF2_DACDAT_CTRL_AIF2_DACL_ENA, 0,
+			      sun8i_codec_aif_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_AIF_IN("AIF2 DACR", "AIF2 Playback", 1,
+			    SUN8I_AIF2_DACDAT_CTRL,
+			    SUN8I_AIF2_DACDAT_CTRL_AIF2_DACR_ENA, 0),
+
 	/* ADC Inputs (connected to analog codec DAPM context) */
 	SND_SOC_DAPM_ADC("ADCL", NULL, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_ADC("ADCR", NULL, SND_SOC_NOPM, 0, 0),
 
 	/* DAC Outputs (connected to analog codec DAPM context) */
 	SND_SOC_DAPM_DAC("DACL", NULL, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_DAC("DACR", NULL, SND_SOC_NOPM, 0, 0),
 
@@ -743,78 +898,138 @@ static const struct snd_soc_dapm_route sun8i_codec_dapm_routes[] = {
 	{ "CLK AIF1", NULL, "AIF1CLK" },
 	{ "CLK AIF1", NULL, "SYSCLK" },
 	{ "RST AIF1", NULL, "CLK AIF1" },
 	{ "AIF1 AD0L", NULL, "RST AIF1" },
 	{ "AIF1 AD0R", NULL, "RST AIF1" },
 	{ "AIF1 DA0L", NULL, "RST AIF1" },
 	{ "AIF1 DA0R", NULL, "RST AIF1" },
 
+	{ "CLK AIF2", NULL, "AIF2CLK" },
+	{ "CLK AIF2", NULL, "SYSCLK" },
+	{ "RST AIF2", NULL, "CLK AIF2" },
+	{ "AIF2 ADCL", NULL, "RST AIF2" },
+	{ "AIF2 ADCR", NULL, "RST AIF2" },
+	{ "AIF2 DACL", NULL, "RST AIF2" },
+	{ "AIF2 DACR", NULL, "RST AIF2" },
+
 	{ "CLK ADC", NULL, "SYSCLK" },
 	{ "RST ADC", NULL, "CLK ADC" },
 	{ "ADC", NULL, "RST ADC" },
 	{ "ADCL", NULL, "ADC" },
 	{ "ADCR", NULL, "ADC" },
 
 	{ "CLK DAC", NULL, "SYSCLK" },
 	{ "RST DAC", NULL, "CLK DAC" },
 	{ "DAC", NULL, "RST DAC" },
 	{ "DACL", NULL, "DAC" },
 	{ "DACR", NULL, "DAC" },
 
 	/* AIF "ADC" Output Routes */
 	{ "AIF1 AD0L", NULL, "AIF1 AD0L Stereo Mux" },
 	{ "AIF1 AD0R", NULL, "AIF1 AD0R Stereo Mux" },
 
+	{ "AIF2 ADCL", NULL, "AIF2 ADCL Stereo Mux" },
+	{ "AIF2 ADCR", NULL, "AIF2 ADCR Stereo Mux" },
+
 	/* AIF "ADC" Mono/Stereo Mux Routes */
 	{ "AIF1 AD0L Stereo Mux", "Stereo", "AIF1 AD0L Mixer" },
 	{ "AIF1 AD0L Stereo Mux", "Reverse Stereo", "AIF1 AD0R Mixer" },
 	{ "AIF1 AD0L Stereo Mux", "Sum Mono", "AIF1 AD0L Mixer" },
 	{ "AIF1 AD0L Stereo Mux", "Sum Mono", "AIF1 AD0R Mixer" },
 	{ "AIF1 AD0L Stereo Mux", "Mix Mono", "AIF1 AD0L Mixer" },
 	{ "AIF1 AD0L Stereo Mux", "Mix Mono", "AIF1 AD0R Mixer" },
 
 	{ "AIF1 AD0R Stereo Mux", "Stereo", "AIF1 AD0R Mixer" },
 	{ "AIF1 AD0R Stereo Mux", "Reverse Stereo", "AIF1 AD0L Mixer" },
 	{ "AIF1 AD0R Stereo Mux", "Sum Mono", "AIF1 AD0L Mixer" },
 	{ "AIF1 AD0R Stereo Mux", "Sum Mono", "AIF1 AD0R Mixer" },
 	{ "AIF1 AD0R Stereo Mux", "Mix Mono", "AIF1 AD0L Mixer" },
 	{ "AIF1 AD0R Stereo Mux", "Mix Mono", "AIF1 AD0R Mixer" },
 
+	{ "AIF2 ADCL Stereo Mux", "Stereo", "AIF2 ADCL Mixer" },
+	{ "AIF2 ADCL Stereo Mux", "Reverse Stereo", "AIF2 ADCR Mixer" },
+	{ "AIF2 ADCL Stereo Mux", "Sum Mono", "AIF2 ADCL Mixer" },
+	{ "AIF2 ADCL Stereo Mux", "Sum Mono", "AIF2 ADCR Mixer" },
+	{ "AIF2 ADCL Stereo Mux", "Mix Mono", "AIF2 ADCL Mixer" },
+	{ "AIF2 ADCL Stereo Mux", "Mix Mono", "AIF2 ADCR Mixer" },
+
+	{ "AIF2 ADCR Stereo Mux", "Stereo", "AIF2 ADCR Mixer" },
+	{ "AIF2 ADCR Stereo Mux", "Reverse Stereo", "AIF2 ADCL Mixer" },
+	{ "AIF2 ADCR Stereo Mux", "Sum Mono", "AIF2 ADCL Mixer" },
+	{ "AIF2 ADCR Stereo Mux", "Sum Mono", "AIF2 ADCR Mixer" },
+	{ "AIF2 ADCR Stereo Mux", "Mix Mono", "AIF2 ADCL Mixer" },
+	{ "AIF2 ADCR Stereo Mux", "Mix Mono", "AIF2 ADCR Mixer" },
+
 	/* AIF "ADC" Mixer Routes */
 	{ "AIF1 AD0L Mixer", "AIF1 Slot 0 Digital ADC Capture Switch", "AIF1 DA0L Stereo Mux" },
+	{ "AIF1 AD0L Mixer", "AIF2 Digital ADC Capture Switch", "AIF2 DACL Source" },
 	{ "AIF1 AD0L Mixer", "AIF1 Data Digital ADC Capture Switch", "ADCL" },
+	{ "AIF1 AD0L Mixer", "AIF2 Inv Digital ADC Capture Switch", "AIF2 DACR Source" },
 
 	{ "AIF1 AD0R Mixer", "AIF1 Slot 0 Digital ADC Capture Switch", "AIF1 DA0R Stereo Mux" },
+	{ "AIF1 AD0R Mixer", "AIF2 Digital ADC Capture Switch", "AIF2 DACR Source" },
 	{ "AIF1 AD0R Mixer", "AIF1 Data Digital ADC Capture Switch", "ADCR" },
+	{ "AIF1 AD0R Mixer", "AIF2 Inv Digital ADC Capture Switch", "AIF2 DACL Source" },
+
+	{ "AIF2 ADCL Mixer", "AIF2 ADC Mixer AIF1 DA0 Capture Switch", "AIF1 DA0L Stereo Mux" },
+	{ "AIF2 ADCL Mixer", "AIF2 ADC Mixer AIF2 DAC Rev Capture Switch", "AIF2 DACR Source" },
+	{ "AIF2 ADCL Mixer", "AIF2 ADC Mixer ADC Capture Switch", "ADCL" },
+
+	{ "AIF2 ADCR Mixer", "AIF2 ADC Mixer AIF1 DA0 Capture Switch", "AIF1 DA0R Stereo Mux" },
+	{ "AIF2 ADCR Mixer", "AIF2 ADC Mixer AIF2 DAC Rev Capture Switch", "AIF2 DACL Source" },
+	{ "AIF2 ADCR Mixer", "AIF2 ADC Mixer ADC Capture Switch", "ADCR" },
+
+	/* AIF "DAC" Input Mux Routes */
+	{ "AIF2 DACL Source", "AIF2", "AIF2 DACL Stereo Mux" },
+	{ "AIF2 DACL Source", "AIF2+3", "AIF2 DACL Stereo Mux" },
+
+	{ "AIF2 DACR Source", "AIF2", "AIF2 DACR Stereo Mux" },
+	{ "AIF2 DACR Source", "AIF3+2", "AIF2 DACR Stereo Mux" },
 
 	/* AIF "DAC" Mono/Stereo Mux Routes */
 	{ "AIF1 DA0L Stereo Mux", "Stereo", "AIF1 DA0L" },
 	{ "AIF1 DA0L Stereo Mux", "Reverse Stereo", "AIF1 DA0R" },
 	{ "AIF1 DA0L Stereo Mux", "Sum Mono", "AIF1 DA0L" },
 	{ "AIF1 DA0L Stereo Mux", "Sum Mono", "AIF1 DA0R" },
 	{ "AIF1 DA0L Stereo Mux", "Mix Mono", "AIF1 DA0L" },
 	{ "AIF1 DA0L Stereo Mux", "Mix Mono", "AIF1 DA0R" },
 
 	{ "AIF1 DA0R Stereo Mux", "Stereo", "AIF1 DA0R" },
 	{ "AIF1 DA0R Stereo Mux", "Reverse Stereo", "AIF1 DA0L" },
 	{ "AIF1 DA0R Stereo Mux", "Sum Mono", "AIF1 DA0L" },
 	{ "AIF1 DA0R Stereo Mux", "Sum Mono", "AIF1 DA0R" },
 	{ "AIF1 DA0R Stereo Mux", "Mix Mono", "AIF1 DA0L" },
 	{ "AIF1 DA0R Stereo Mux", "Mix Mono", "AIF1 DA0R" },
 
+	{ "AIF2 DACL Stereo Mux", "Stereo", "AIF2 DACL" },
+	{ "AIF2 DACL Stereo Mux", "Reverse Stereo", "AIF2 DACR" },
+	{ "AIF2 DACL Stereo Mux", "Sum Mono", "AIF2 DACL" },
+	{ "AIF2 DACL Stereo Mux", "Sum Mono", "AIF2 DACR" },
+	{ "AIF2 DACL Stereo Mux", "Mix Mono", "AIF2 DACL" },
+	{ "AIF2 DACL Stereo Mux", "Mix Mono", "AIF2 DACR" },
+
+	{ "AIF2 DACR Stereo Mux", "Stereo", "AIF2 DACR" },
+	{ "AIF2 DACR Stereo Mux", "Reverse Stereo", "AIF2 DACL" },
+	{ "AIF2 DACR Stereo Mux", "Sum Mono", "AIF2 DACL" },
+	{ "AIF2 DACR Stereo Mux", "Sum Mono", "AIF2 DACR" },
+	{ "AIF2 DACR Stereo Mux", "Mix Mono", "AIF2 DACL" },
+	{ "AIF2 DACR Stereo Mux", "Mix Mono", "AIF2 DACR" },
+
 	/* DAC Output Routes */
 	{ "DACL", NULL, "DACL Mixer" },
 	{ "DACR", NULL, "DACR Mixer" },
 
 	/* DAC Mixer Routes */
 	{ "DACL Mixer", "AIF1 Slot 0 Digital DAC Playback Switch", "AIF1 DA0L Stereo Mux" },
+	{ "DACL Mixer", "AIF2 Digital DAC Playback Switch", "AIF2 DACL Source" },
 	{ "DACL Mixer", "ADC Digital DAC Playback Switch", "ADCL" },
 
 	{ "DACR Mixer", "AIF1 Slot 0 Digital DAC Playback Switch", "AIF1 DA0R Stereo Mux" },
+	{ "DACR Mixer", "AIF2 Digital DAC Playback Switch", "AIF2 DACR Source" },
 	{ "DACR Mixer", "ADC Digital DAC Playback Switch", "ADCR" },
 };
 
 static const struct snd_soc_dapm_widget sun8i_codec_legacy_widgets[] = {
 	/* Legacy ADC Inputs (connected to analog codec DAPM context) */
 	SND_SOC_DAPM_ADC("AIF1 Slot 0 Left ADC", NULL, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_ADC("AIF1 Slot 0 Right ADC", NULL, SND_SOC_NOPM, 0, 0),
 
-- 
2.26.2

