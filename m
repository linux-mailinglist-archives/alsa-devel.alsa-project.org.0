Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3529928D9F9
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Oct 2020 08:26:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB30D16C0;
	Wed, 14 Oct 2020 08:25:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB30D16C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602656762;
	bh=D6yKpLDF1EaT7X+OkpagAURqxI8AeQJuyNs0QGY7Klo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eO2F9Akq70Ac8paJCG+fvPliP2SpPp+LRlfpxuRIdIkpVZBYO/w8M3H5ZRfgryOln
	 Eq91X8/K+03KyRnqjS7VCI0rrjIme97G+KF4LmQJ6tNd7+BHhwvHPfLq5DPck1EmOo
	 OJR1hsW8G4mDOi4w28lUgUMypC21fo+KlM5qnTEw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2929F80315;
	Wed, 14 Oct 2020 08:20:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A26D3F80304; Wed, 14 Oct 2020 08:20:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0BE6F80260
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 08:19:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0BE6F80260
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="PKNjo07v"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="hrAaNuqs"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 33619D25;
 Wed, 14 Oct 2020 02:19:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 14 Oct 2020 02:19:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=bkCwaEE+cA0fb
 YTAvJE12TgxFGTL1eVGdQD3miac3Yc=; b=PKNjo07vkbg+gpPOX1eBAT/AtUUGz
 2y/2428rcy4PC+XFo52SZnFL0nZEoIl3toUlQn8MwH8Av55cAXqe8BeY0O54oAZz
 W7P8q/WHvlAcJE7CfXVfMbz90yvlhd1vI0Z7HXKM65xCa/7oiQv8QInsB61LVf70
 nGQDy07L132Tsiv405H89BTev3nItarZO7OiPOusjXhPM7umQiAJ59FligpVNSR/
 B+YYkisNR1VBn/SfVFEXolj07jIxDGH60GtveS40BPhO1uIuqYTT3AErX4yyjigG
 Qk7z5BwUeXtDgH6VwPM90XPh/SqYPc/IFlkXpz2kmyRcFs2cX2p1R34rA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=bkCwaEE+cA0fbYTAvJE12TgxFGTL1eVGdQD3miac3Yc=; b=hrAaNuqs
 LBUneUOUTzA1rXuTXZJln/UOvu9DUHhrzCnRg393kb5o8MeBm6slvJrX5sD+n6i9
 WgI6b5LV2mMwOpTPYIo9eR60/3Uaks0/LpNgskZGnmSchRzB/hC9Y18yP3M6w/JP
 YqgjClZYIYcLNOnWU7AW9w4W52EjLMq6HTt6KVAUVj3+XLUMw7eguaaQwZjlQM3u
 AIAWwYqFV3JWWeXmxO8Dvb7HMWtib5HtqfrmtwozpwHrdy5v9tDdpZ2nKS5zIqMR
 ge2nt4jtLwISLlyhrQOBe2BAubN0+M5GsKJbrgthgaCw0henQ2a8zndlC0rlEMYb
 znHqhirC9kwILA==
X-ME-Sender: <xms:g5iGX0e7Y8o0KQmJrg-T9Z6KOH3qAO2fXoZI4BjEweYCA7f-cZWFYg>
 <xme:g5iGX2OjIkY4a_XAWVvz-Um7H4MMOEBLWOZAuYft0e6CdI1zXTZdE_pTjlsfBccsl
 SG-KAXUEGumCU6N2g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedriedtgddutdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuih
 iivgepjeenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
 ugdrohhrgh
X-ME-Proxy: <xmx:g5iGX1jbLmzOTG6xKjp92ToIS7JbVlBDgK246_xmhGJXciSCQkguYA>
 <xmx:g5iGX5_gB_PupFN7mUkZv8VyoQzTQeK9tiZbXjkGXR27CBzgrimpJg>
 <xmx:g5iGXwtCAb_nfQUmmgz68nY3jblpWSdmqSWcfO6BR8rBpMDK3x1ZEw>
 <xmx:g5iGX-BJK3GPjy1ljWMaWoI0FhT5dZpubxsP5zpTlIBMcFQ8bUZ8k7-WRDw>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 12ACB3280063;
 Wed, 14 Oct 2020 02:19:47 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 11/17] ASoC: sun8i-codec: Constrain to compatible sample
 rates
Date: Wed, 14 Oct 2020 01:19:35 -0500
Message-Id: <20201014061941.4306-12-samuel@sholland.org>
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

While another stream is active, only allow userspace to use sample rates
that are compatible with the current SYSCLK frequency. This ensures the
actual sample rate will always match what is given in hw_params.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 57 ++++++++++++++++++++++++++++++++---
 1 file changed, 53 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 468fa5f71bd3..0e8b0ac31fed 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -121,16 +121,18 @@ struct sun8i_codec_quirks {
 	bool lrck_inversion	: 1;
 };
 
 struct sun8i_codec {
 	struct regmap			*regmap;
 	struct clk			*clk_module;
 	const struct sun8i_codec_quirks	*quirks;
 	struct sun8i_codec_aif		aifs[SUN8I_CODEC_NAIFS];
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
@@ -418,46 +461,52 @@ static int sun8i_codec_hw_params(struct snd_pcm_substream *substream,
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
 
+	if (!aif->open_streams)
+		scodec->sysclk_refcnt++;
+	scodec->sysclk_rate = sysclk_rate;
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
 		.id	= SUN8I_CODEC_AIF1,
-- 
2.26.2

