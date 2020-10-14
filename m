Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6134328D9F8
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Oct 2020 08:25:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 075DA16EC;
	Wed, 14 Oct 2020 08:24:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 075DA16EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602656731;
	bh=i1KAmA875XCvmnP42bOuwXWSzK4aQf33WbTzxPmv59o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ryWfBsHorsGmCGvNaZgl9faQukC3C6PGrPi4EgcKoWVXIeq6lJ8LYWCviOm0NgpfB
	 pou5E9yPFrXzAq6HkUwZATw5u1LpfYV5fNTd8LfGbDOWLxX8gQtI6j67wHwgasZ9j1
	 wgpvqwDERrP2U1B7rKhUATS3vXGLwI17S4MbVab8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1690F8020D;
	Wed, 14 Oct 2020 08:20:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFB05F802FF; Wed, 14 Oct 2020 08:20:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA812F8026C
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 08:19:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA812F8026C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="hxN/6skx"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="avQ4at27"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id BA7A3CCB;
 Wed, 14 Oct 2020 02:19:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 14 Oct 2020 02:19:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=LN5zX8x0oYRPA
 3K2KebUoPRWmEhMAjw/BGGgrzH9RoM=; b=hxN/6skxCcX3eaSKXlAb9PX8BiuJZ
 Pg8g0oKR1iCyulKjUfb7LmSILNtaUjj17g/SjzeiP0TDAsOaXHcHYM9j3Mf1CsBH
 ipn5zMrYLuArxhaCV2qhvGfYnZO3tISOU0pDZSlp1IXewwh/geAWXzX27r7ZHFSJ
 VTcFYB2zpnRQYTsjJ0fHPiZFZBrSRlTJGvKGyzhiJBJ/KHTSki0vfqTOgbQN30eH
 JhyqnRYDDA0eFpUbIergomKapnRCJfOeXF7/wF6a/HDtUpeHFJ3z4PILg06wSfGu
 m3XJzGH1DA4HfaGvVSRUXw52bGwRmKQ411muSkhklDwxNn3At2aI7h3hg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=LN5zX8x0oYRPA3K2KebUoPRWmEhMAjw/BGGgrzH9RoM=; b=avQ4at27
 KtGag1i0prK26qQWK5l7VI/LZbqpHWBRBe90bWBySAtfMvmiheCkmn5HZidP/0mL
 I/OFQ6H6V9b3uAk7KFrH7p9VzGQxHTyBr3teONlt/zUectgOypd/OJcT5phWPPKe
 b8Pu/WqmwJ0HXpuARZ4fSOJ7X/Fhh7063X+lorFmbWMqEVBhI+hhdzWbbAl2YFFq
 X3Qve57b0+Sl8S97ClTOzZAkgzI+Jv4ARAvuxpf3mV3/voqni95qHM8aqLn/hgaa
 eeB69J6ql3yIeQUKEm62sXzoYJOyPbNp6VUJevh5R/RE/Wp7jw81XyDyQr2fdMq5
 zxHdYZ6IEnRnNQ==
X-ME-Sender: <xms:g5iGX5WRxadj5ydFtN0ar0dbj7REEqgeNUProlMs0QTt2a7375XXGg>
 <xme:g5iGX5n2PKOQcCjOOqFL5D7SpXROliLKD9ZKFpHQNccDpl9zQhroSy0bT2LpAsmD9
 ORiwUXgvV4UWSye-g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedriedtgddutdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuih
 iivgepjeenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
 ugdrohhrgh
X-ME-Proxy: <xmx:g5iGX1bN7kBGTRVnxQRfAGA3Ibqxyf3-hKpl295LlqYj8siIVpgg3w>
 <xmx:g5iGX8UdVFbdU0BWwfN5mmZaOlOUAI3IolIzz5KjdMNwt-IGEAwsjA>
 <xmx:g5iGXzlvb9hG8bUHz4zhL3ANdCurUc-YZ7E2V38MFb5e7MK3Q3IOwg>
 <xmx:g5iGX16349xqJNb-Gj9Lgw_fbQ3XUB-SMbtAQj6pWSSwIAneQ3aKbB_TH0U>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 93BA0328005D;
 Wed, 14 Oct 2020 02:19:46 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 10/17] ASoC: sun8i-codec: Automatically set the system
 sample rate
Date: Wed, 14 Oct 2020 01:19:34 -0500
Message-Id: <20201014061941.4306-11-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201014061941.4306-1-samuel@sholland.org>
References: <20201014061941.4306-1-samuel@sholland.org>
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

The sun8i codec has three clock/sample rate domains:
 - The AIF1 domain, with a sample rate equal to AIF1 LRCK
 - The AIF2 domain, with a sample rate equal to AIF2 LRCK
 - The SYSCLK domain, containing the ADC, DAC, and effects (AGC/DRC),
   with a sample rate given by a divisor from SYSCLK. The divisor is
   controlled by the AIF1_FS or AIF2_FS field in SYS_SR_CTRL, depending
   on if SYSCLK's source is AIF1CLK or AIF2CLK, respectively. The exact
   sample rate depends on if SYSCLK is running at 22.6 MHz or 24.6 MHz.

When an AIF (currently only AIF1) is active, the ADC and DAC should run
at that sample rate to avoid artifacting. Sample rate conversion is only
available when multiple AIFs are active and are routed to each other;
this means the sample rate conversion hardware usually cannot be used.

Only attach the event hook to the channel 0 AIF widgets, since we only
need one event when a DAI stream starts or stops. Channel 0 is always
brought up with a DAI stream, regardless of the number of channels in
the stream.

The ADC and DAC (along with their effects blocks) can be used even if
no AIFs are in use. In that case, we should select an appropriate sample
rate divisor, instead of keeping the last-used AIF sample rate.
44.1/48 kHz was chosen to balance audio quality and power consumption.

Since the sample rate is tied to active AIF paths, disabling pmdown_time
allows switching to the optimal sample rate immediately, instead of
after a 5 second delay.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 103 +++++++++++++++++++++++++++-------
 1 file changed, 84 insertions(+), 19 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 38349d85fb17..468fa5f71bd3 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -89,31 +89,36 @@
 #define SUN8I_SYS_SR_CTRL_AIF1_FS_MASK		GENMASK(15, 12)
 #define SUN8I_SYS_SR_CTRL_AIF2_FS_MASK		GENMASK(11, 8)
 #define SUN8I_AIF1CLK_CTRL_AIF1_CLK_INV_MASK	GENMASK(14, 13)
 #define SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV_MASK	GENMASK(12, 9)
 #define SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV_MASK	GENMASK(8, 6)
 #define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ_MASK	GENMASK(5, 4)
 #define SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT_MASK	GENMASK(3, 2)
 
+#define SUN8I_CODEC_PASSTHROUGH_SAMPLE_RATE 48000
+
 #define SUN8I_CODEC_PCM_RATES	(SNDRV_PCM_RATE_8000_48000|\
 				 SNDRV_PCM_RATE_88200     |\
 				 SNDRV_PCM_RATE_96000     |\
 				 SNDRV_PCM_RATE_176400    |\
 				 SNDRV_PCM_RATE_192000    |\
 				 SNDRV_PCM_RATE_KNOT)
 
 enum {
 	SUN8I_CODEC_AIF1,
 	SUN8I_CODEC_NAIFS
 };
 
 struct sun8i_codec_aif {
+	unsigned int	sample_rate;
 	unsigned int	slots;
 	unsigned int	slot_width;
+	unsigned int	active_streams	: 2;
+	unsigned int	open_streams	: 2;
 };
 
 struct sun8i_codec_quirks {
 	bool legacy_widgets	: 1;
 	bool lrck_inversion	: 1;
 };
 
 struct sun8i_codec {
@@ -144,21 +149,19 @@ static int sun8i_codec_runtime_suspend(struct device *dev)
 	struct sun8i_codec *scodec = dev_get_drvdata(dev);
 
 	regcache_cache_only(scodec->regmap, true);
 	regcache_mark_dirty(scodec->regmap);
 
 	return 0;
 }
 
-static int sun8i_codec_get_hw_rate(struct snd_pcm_hw_params *params)
+static int sun8i_codec_get_hw_rate(unsigned int sample_rate)
 {
-	unsigned int rate = params_rate(params);
-
-	switch (rate) {
+	switch (sample_rate) {
 	case 7350:
 	case 8000:
 		return 0x0;
 	case 11025:
 		return 0x1;
 	case 12000:
 		return 0x2;
 	case 14700:
@@ -181,16 +184,43 @@ static int sun8i_codec_get_hw_rate(struct snd_pcm_hw_params *params)
 	case 176400:
 	case 192000:
 		return 0xa;
 	default:
 		return -EINVAL;
 	}
 }
 
+static int sun8i_codec_update_sample_rate(struct sun8i_codec *scodec)
+{
+	unsigned int max_rate = 0;
+	int hw_rate, i;
+
+	for (i = SUN8I_CODEC_AIF1; i < SUN8I_CODEC_NAIFS; ++i) {
+		struct sun8i_codec_aif *aif = &scodec->aifs[i];
+
+		if (aif->active_streams)
+			max_rate = max(max_rate, aif->sample_rate);
+	}
+
+	/* Set the sample rate for ADC->DAC passthrough when no AIF is active. */
+	if (!max_rate)
+		max_rate = SUN8I_CODEC_PASSTHROUGH_SAMPLE_RATE;
+
+	hw_rate = sun8i_codec_get_hw_rate(max_rate);
+	if (hw_rate < 0)
+		return hw_rate;
+
+	regmap_update_bits(scodec->regmap, SUN8I_SYS_SR_CTRL,
+			   SUN8I_SYS_SR_CTRL_AIF1_FS_MASK,
+			   hw_rate << SUN8I_SYS_SR_CTRL_AIF1_FS);
+
+	return 0;
+}
+
 static int sun8i_codec_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct sun8i_codec *scodec = snd_soc_dai_get_drvdata(dai);
 	u32 dsp_format, format, invert, value;
 
 	/* clock masters */
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
 	case SND_SOC_DAIFMT_CBS_CFS: /* Codec slave, DAI master */
@@ -350,19 +380,20 @@ static int sun8i_codec_get_lrck_div_order(unsigned int slots,
 }
 
 static int sun8i_codec_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *params,
 				 struct snd_soc_dai *dai)
 {
 	struct sun8i_codec *scodec = snd_soc_dai_get_drvdata(dai);
 	struct sun8i_codec_aif *aif = &scodec->aifs[dai->id];
+	unsigned int sample_rate = params_rate(params);
 	unsigned int slots = aif->slots ?: params_channels(params);
 	unsigned int slot_width = aif->slot_width ?: params_width(params);
-	int lrck_div_order, sample_rate, word_size;
+	int lrck_div_order, word_size;
 	u8 bclk_div;
 
 	/* word size */
 	switch (params_width(params)) {
 	case 8:
 		word_size = 0x0;
 		break;
 	case 16:
@@ -387,36 +418,48 @@ static int sun8i_codec_hw_params(struct snd_pcm_substream *substream,
 	if (lrck_div_order < 0)
 		return lrck_div_order;
 
 	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
 			   SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV_MASK,
 			   (lrck_div_order - 4) << SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV);
 
 	/* BCLK divider (SYSCLK/BCLK ratio) */
-	bclk_div = sun8i_codec_get_bclk_div(scodec, lrck_div_order, params_rate(params));
+	bclk_div = sun8i_codec_get_bclk_div(scodec, lrck_div_order, sample_rate);
 	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
 			   SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV_MASK,
 			   bclk_div << SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV);
 
-	sample_rate = sun8i_codec_get_hw_rate(params);
-	if (sample_rate < 0)
-		return sample_rate;
+	aif->sample_rate = sample_rate;
+	aif->open_streams |= BIT(substream->stream);
 
-	regmap_update_bits(scodec->regmap, SUN8I_SYS_SR_CTRL,
-			   SUN8I_SYS_SR_CTRL_AIF1_FS_MASK,
-			   sample_rate << SUN8I_SYS_SR_CTRL_AIF1_FS);
+	return sun8i_codec_update_sample_rate(scodec);
+}
+
+static int sun8i_codec_hw_free(struct snd_pcm_substream *substream,
+			       struct snd_soc_dai *dai)
+{
+	struct sun8i_codec *scodec = snd_soc_dai_get_drvdata(dai);
+	struct sun8i_codec_aif *aif = &scodec->aifs[dai->id];
+
+	if (aif->open_streams != BIT(substream->stream))
+		goto done;
 
+	aif->sample_rate = 0;
+
+done:
+	aif->open_streams &= ~BIT(substream->stream);
 	return 0;
 }
 
 static const struct snd_soc_dai_ops sun8i_codec_dai_ops = {
 	.set_fmt	= sun8i_codec_set_fmt,
 	.set_tdm_slot	= sun8i_codec_set_tdm_slot,
 	.hw_params	= sun8i_codec_hw_params,
+	.hw_free	= sun8i_codec_hw_free,
 };
 
 static struct snd_soc_dai_driver sun8i_codec_dais[] = {
 	{
 		.name	= "sun8i-codec-aif1",
 		.id	= SUN8I_CODEC_AIF1,
 		.ops	= &sun8i_codec_dai_ops,
 		/* capture capabilities */
@@ -437,16 +480,32 @@ static struct snd_soc_dai_driver sun8i_codec_dais[] = {
 			.formats	= SNDRV_PCM_FMTBIT_S16_LE,
 		},
 		.symmetric_rates	= true,
 		.symmetric_channels	= true,
 		.symmetric_samplebits	= true,
 	},
 };
 
+static int sun8i_codec_aif_event(struct snd_soc_dapm_widget *w,
+				 struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct sun8i_codec *scodec = snd_soc_component_get_drvdata(component);
+	struct sun8i_codec_aif *aif = &scodec->aifs[w->sname[3] - '1'];
+	int stream = w->id == snd_soc_dapm_aif_out;
+
+	if (SND_SOC_DAPM_EVENT_ON(event))
+		aif->active_streams |= BIT(stream);
+	else
+		aif->active_streams &= ~BIT(stream);
+
+	return sun8i_codec_update_sample_rate(scodec);
+}
+
 static const char *const sun8i_aif_stereo_mux_enum_values[] = {
 	"Stereo", "Reverse Stereo", "Sum Mono", "Mix Mono"
 };
 
 static SOC_ENUM_DOUBLE_DECL(sun8i_aif1_ad0_stereo_mux_enum,
 			    SUN8I_AIF1_ADCDAT_CTRL,
 			    SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0L_SRC,
 			    SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0R_SRC,
@@ -539,19 +598,21 @@ static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
 	SND_SOC_DAPM_SUPPLY("ADC",
 			    SUN8I_ADC_DIG_CTRL,
 			    SUN8I_ADC_DIG_CTRL_ENAD, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("DAC",
 			    SUN8I_DAC_DIG_CTRL,
 			    SUN8I_DAC_DIG_CTRL_ENDA, 0, NULL, 0),
 
 	/* AIF "ADC" Outputs */
-	SND_SOC_DAPM_AIF_OUT("AIF1 AD0L", "AIF1 Capture", 0,
-			     SUN8I_AIF1_ADCDAT_CTRL,
-			     SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0L_ENA, 0),
+	SND_SOC_DAPM_AIF_OUT_E("AIF1 AD0L", "AIF1 Capture", 0,
+			       SUN8I_AIF1_ADCDAT_CTRL,
+			       SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0L_ENA, 0,
+			       sun8i_codec_aif_event,
+			       SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_AIF_OUT("AIF1 AD0R", "AIF1 Capture", 1,
 			     SUN8I_AIF1_ADCDAT_CTRL,
 			     SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0R_ENA, 0),
 
 	/* AIF "ADC" Mono/Stereo Muxes */
 	SND_SOC_DAPM_MUX("AIF1 AD0L Stereo Mux", SND_SOC_NOPM, 0, 0,
 			 &sun8i_aif1_ad0_stereo_mux_control),
 	SND_SOC_DAPM_MUX("AIF1 AD0R Stereo Mux", SND_SOC_NOPM, 0, 0,
@@ -565,19 +626,21 @@ static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
 
 	/* AIF "DAC" Mono/Stereo Muxes */
 	SND_SOC_DAPM_MUX("AIF1 DA0L Stereo Mux", SND_SOC_NOPM, 0, 0,
 			 &sun8i_aif1_da0_stereo_mux_control),
 	SND_SOC_DAPM_MUX("AIF1 DA0R Stereo Mux", SND_SOC_NOPM, 0, 0,
 			 &sun8i_aif1_da0_stereo_mux_control),
 
 	/* AIF "DAC" Inputs */
-	SND_SOC_DAPM_AIF_IN("AIF1 DA0L", "AIF1 Playback", 0,
-			    SUN8I_AIF1_DACDAT_CTRL,
-			    SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0L_ENA, 0),
+	SND_SOC_DAPM_AIF_IN_E("AIF1 DA0L", "AIF1 Playback", 0,
+			      SUN8I_AIF1_DACDAT_CTRL,
+			      SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0L_ENA, 0,
+			      sun8i_codec_aif_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_AIF_IN("AIF1 DA0R", "AIF1 Playback", 1,
 			    SUN8I_AIF1_DACDAT_CTRL,
 			    SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0R_ENA, 0),
 
 	/* ADC Inputs (connected to analog codec DAPM context) */
 	SND_SOC_DAPM_ADC("ADCL", NULL, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_ADC("ADCR", NULL, SND_SOC_NOPM, 0, 0),
 
@@ -722,27 +785,29 @@ static int sun8i_codec_component_probe(struct snd_soc_component *component)
 			   SUN8I_SYSCLK_CTL_AIF1CLK_SRC_PLL |
 			   SUN8I_SYSCLK_CTL_AIF2CLK_SRC_PLL);
 
 	/* Use AIF1CLK as the SYSCLK parent since AIF1 is used most often. */
 	regmap_update_bits(scodec->regmap, SUN8I_SYSCLK_CTL,
 			   BIT(SUN8I_SYSCLK_CTL_SYSCLK_SRC),
 			   SUN8I_SYSCLK_CTL_SYSCLK_SRC_AIF1CLK);
 
+	/* Program the default sample rate. */
+	sun8i_codec_update_sample_rate(scodec);
+
 	return 0;
 }
 
 static const struct snd_soc_component_driver sun8i_soc_component = {
 	.dapm_widgets		= sun8i_codec_dapm_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(sun8i_codec_dapm_widgets),
 	.dapm_routes		= sun8i_codec_dapm_routes,
 	.num_dapm_routes	= ARRAY_SIZE(sun8i_codec_dapm_routes),
 	.probe			= sun8i_codec_component_probe,
 	.idle_bias_on		= 1,
-	.use_pmdown_time	= 1,
 	.endianness		= 1,
 	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config sun8i_codec_regmap_config = {
 	.reg_bits	= 32,
 	.reg_stride	= 4,
 	.val_bits	= 32,
-- 
2.26.2

