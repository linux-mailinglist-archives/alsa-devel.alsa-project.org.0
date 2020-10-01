Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D2827F7EF
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 04:22:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F66D1877;
	Thu,  1 Oct 2020 04:21:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F66D1877
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601518937;
	bh=owf0VURVWEbefKysSLpewDpLqJ8HHZtpxk7fl31EAP8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qDbSZSksL3SBHveMqD8Eb6+sycHUlMBplfc7d1tSt9VlfQHOjdbqWfVTo3mk6F5bb
	 9DT4MmnSCz+Y1LlmRoXOteBqtVpdW0l6K3Ue5rVulfbh9ZV9BB5F0pKkq1OxCTb9Bu
	 Uz/vRDW/PhR5d2Q6dkbrjIK4Tp5XECagHY3FuyK0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78DFBF8036E;
	Thu,  1 Oct 2020 04:12:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF591F8033E; Thu,  1 Oct 2020 04:12:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FD1BF802E7
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 04:12:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FD1BF802E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="Zp+9l3F6"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="qwhAAlrK"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 10834580399;
 Wed, 30 Sep 2020 22:11:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 30 Sep 2020 22:11:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=/5PkmJdsATQhY
 tiJ6QitOB2ll2wdiEKavDMfs3UWCw0=; b=Zp+9l3F6zMpMJOrUaAatP1J1Qo9l3
 df+eLHw3+tuj1+Fi4wJ3bHGigyeyrl5hNFoGMWcu8jLIfswvLWgcFakTo799nlQe
 4+q9NSXG0mKJN+bkCyK4cAaSy6nqlowUxGxMl9YwHZjVg6XIEnA4r75SlbOkiArG
 pKRt3k0LDyaEknfFnDNRgzu2+JCQ7+9uc4/iHYUk40SITSirLIupGlX3zNSZJQgE
 8tQy+EEDbsvfLaNwly/CIntEfA9CXgGKRgpHd0bajKbYy6nwRIUOiFbVpj87Yevc
 2+5y4vSsm0g051dpZxY6CdUYsAJ/ICI7F5QKyQB/CS/ZrDTwLG+DC+EYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=/5PkmJdsATQhYtiJ6QitOB2ll2wdiEKavDMfs3UWCw0=; b=qwhAAlrK
 uoyDFlKLKJCgyf1UFR/fCWGBfO3jW+4cP/LoOBTx7aVRSLHmBAW7Wvp+HE6BAu2l
 4rQKFf4BKYWIS+daDjQKz8tKBqx7de/ugvpLVX3CPr1XAbWIQyMojKRDtnkSRAK/
 jFPSazpnXnUSJYR4NDvJlboocT3L8RiTMXBVcSGBoIbHZsIo8xq/IwNMtZiweqoX
 p1OdpWEjT0I1SyfDDa+H/fgmdy1ArlX+MlwZxnnKj9ikIi6vJK3zihDW9EWmKf/R
 4tbcCGPW8tkiNy+m1N0lWu+ZC7BehMdFUnN46N1nhCbaScHAiJl65VpGV2I0T2jD
 sVevq+RoSNv2Vw==
X-ME-Sender: <xms:7jp1X3Re49fTx0JBPykCZsXcPSaPTofdtbipRLOlERiegqNA1_a96Q>
 <xme:7jp1X4yLkSUCMsL-P69yD_ml70wtGXE_gbd78DhtKMGEDw51UH_fwBheZKnILa-aP
 VqOcwfIJ2_RqNkO7g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeefgdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
 grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
 jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
 gvpedujeenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
 ugdrohhrgh
X-ME-Proxy: <xmx:7jp1X82KyMaI4CfK7Nz2bHxd5utCKKVxV2lJhtDF7EqaTlXxbTdGiQ>
 <xmx:7jp1X3Cz9s8lFAGAMnq6u01H7mA7AbuLA9ibV8AYu5lSbJYyxuUuNA>
 <xmx:7jp1XwjLxPhU8ObbV-Mf48iQS1_ZfnhOrv3Nh14coAXmTsBU3cknOw>
 <xmx:7zp1X5XAkwbSUb2Hmvqj6SikI1-iMm_isqzi_fKjvkGc_Lj-hVBRig>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 46BCA3064688;
 Wed, 30 Sep 2020 22:11:58 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 19/25] ASoC: sun8i-codec: Constrain to compatible sample rates
Date: Wed, 30 Sep 2020 21:11:42 -0500
Message-Id: <20201001021148.15852-20-samuel@sholland.org>
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

While another stream is active, only allow userspace to use sample rates
that are compatible with the current SYSCLK frequency. This ensures the
actual sample rate will always match what is given in hw_params.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 59 ++++++++++++++++++++++++++++++++---
 1 file changed, 55 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 43b4319e3d84..501af64d43a0 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -121,16 +121,18 @@ struct sun8i_codec_quirks {
 	bool lrck_inversion	: 1;
 };
 
 struct sun8i_codec {
 	struct regmap			*regmap;
 	struct clk			*clk_module;
 	const struct sun8i_codec_quirks	*quirks;
 	struct sun8i_codec_aif		aifs[NAIFS];
+	unsigned int			sysclk_rate;
+	int				sysclk_refcnt;
 };
 
 static int sun8i_codec_runtime_resume(struct device *dev)
 {
 	struct sun8i_codec *scodec = dev_get_drvdata(dev);
 	int ret;
 
 	regcache_cache_only(scodec->regmap, false);
@@ -319,16 +321,57 @@ static int sun8i_codec_set_tdm_slot(struct snd_soc_dai *dai,
 		return -EINVAL;
 
 	aif->slots = slots;
 	aif->slot_width = slot_width;
 
 	return 0;
 }
 
+static const unsigned int sun8i_codec_rates[] = {
+	  7350,   8000,  11025,  12000,  14700,  16000,  22050,  24000,
+	 29400,  32000,  44100,  48000,  88200,  96000, 176400, 192000,
+};
+
+static const struct snd_pcm_hw_constraint_list sun8i_codec_all_rates = {
+	.list	= sun8i_codec_rates,
+	.count	= ARRAY_SIZE(sun8i_codec_rates),
+};
+
+static const struct snd_pcm_hw_constraint_list sun8i_codec_22M_rates = {
+	.list	= sun8i_codec_rates,
+	.count	= ARRAY_SIZE(sun8i_codec_rates),
+	.mask	= 0x5555,
+};
+
+static const struct snd_pcm_hw_constraint_list sun8i_codec_24M_rates = {
+	.list	= sun8i_codec_rates,
+	.count	= ARRAY_SIZE(sun8i_codec_rates),
+	.mask	= 0xaaaa,
+};
+
+static int sun8i_codec_startup(struct snd_pcm_substream *substream,
+			       struct snd_soc_dai *dai)
+{
+	struct sun8i_codec *scodec = snd_soc_dai_get_drvdata(dai);
+	const struct snd_pcm_hw_constraint_list *list;
+
+	if (!scodec->sysclk_refcnt)
+		list = &sun8i_codec_all_rates;
+	else if (scodec->sysclk_rate == 22579200)
+		list = &sun8i_codec_22M_rates;
+	else if (scodec->sysclk_rate == 24576000)
+		list = &sun8i_codec_24M_rates;
+	else
+		return -EINVAL;
+
+	return snd_pcm_hw_constraint_list(substream->runtime, 0,
+					  SNDRV_PCM_HW_PARAM_RATE, list);
+}
+
 struct sun8i_codec_clk_div {
 	u8	div;
 	u8	val;
 };
 
 static const struct sun8i_codec_clk_div sun8i_codec_bclk_div[] = {
 	{ .div = 1,	.val = 0 },
 	{ .div = 2,	.val = 1 },
@@ -341,22 +384,21 @@ static const struct sun8i_codec_clk_div sun8i_codec_bclk_div[] = {
 	{ .div = 32,	.val = 8 },
 	{ .div = 48,	.val = 9 },
 	{ .div = 64,	.val = 10 },
 	{ .div = 96,	.val = 11 },
 	{ .div = 128,	.val = 12 },
 	{ .div = 192,	.val = 13 },
 };
 
-static u8 sun8i_codec_get_bclk_div(struct sun8i_codec *scodec,
+static u8 sun8i_codec_get_bclk_div(unsigned int sysclk_rate,
 				   unsigned int lrck_div_order,
 				   unsigned int sample_rate)
 {
-	unsigned long clk_rate = clk_get_rate(scodec->clk_module);
-	unsigned int div = clk_rate / sample_rate >> lrck_div_order;
+	unsigned int div = sysclk_rate / sample_rate >> lrck_div_order;
 	unsigned int best_val = 0, best_diff = ~0;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(sun8i_codec_bclk_div); i++) {
 		const struct sun8i_codec_clk_div *bdiv = &sun8i_codec_bclk_div[i];
 		unsigned int diff = abs(bdiv->div - div);
 
 		if (diff < best_diff) {
@@ -383,16 +425,17 @@ static int sun8i_codec_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *params,
 				 struct snd_soc_dai *dai)
 {
 	struct sun8i_codec *scodec = snd_soc_dai_get_drvdata(dai);
 	struct sun8i_codec_aif *aif = &scodec->aifs[dai->id];
 	unsigned int sample_rate = params_rate(params);
 	unsigned int slots = aif->slots ?: params_channels(params);
 	unsigned int slot_width = aif->slot_width ?: params_width(params);
+	unsigned int sysclk_rate = clk_get_rate(scodec->clk_module);
 	int lrck_div_order, word_size;
 	u8 bclk_div;
 
 	/* word size */
 	switch (params_width(params)) {
 	case 8:
 		word_size = 0x0;
 		break;
@@ -418,46 +461,54 @@ static int sun8i_codec_hw_params(struct snd_pcm_substream *substream,
 	if (lrck_div_order < 0)
 		return lrck_div_order;
 
 	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
 			   SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV_MASK,
 			   (lrck_div_order - 4) << SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV);
 
 	/* BCLK divider (SYSCLK/BCLK ratio) */
-	bclk_div = sun8i_codec_get_bclk_div(scodec, lrck_div_order, sample_rate);
+	bclk_div = sun8i_codec_get_bclk_div(sysclk_rate, lrck_div_order, sample_rate);
 	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
 			   SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV_MASK,
 			   bclk_div << SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV);
 
+	if (!aif->open_streams) {
+		scodec->sysclk_rate = sysclk_rate;
+		scodec->sysclk_refcnt++;
+	}
+
 	aif->sample_rate = sample_rate;
 	aif->open_streams |= BIT(substream->stream);
 
 	return sun8i_codec_update_sample_rate(scodec);
 }
 
 static int sun8i_codec_hw_free(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
 {
 	struct sun8i_codec *scodec = snd_soc_dai_get_drvdata(dai);
 	struct sun8i_codec_aif *aif = &scodec->aifs[dai->id];
 
 	if (aif->open_streams != BIT(substream->stream))
 		goto done;
 
+	scodec->sysclk_refcnt--;
+
 	aif->sample_rate = 0;
 
 done:
 	aif->open_streams &= ~BIT(substream->stream);
 	return 0;
 }
 
 static const struct snd_soc_dai_ops sun8i_codec_dai_ops = {
 	.set_fmt	= sun8i_codec_set_fmt,
 	.set_tdm_slot	= sun8i_codec_set_tdm_slot,
+	.startup	= sun8i_codec_startup,
 	.hw_params	= sun8i_codec_hw_params,
 	.hw_free	= sun8i_codec_hw_free,
 };
 
 static struct snd_soc_dai_driver sun8i_codec_dais[] = {
 	{
 		.name	= "sun8i-codec-aif1",
 		.id	= AIF1,
-- 
2.26.2

