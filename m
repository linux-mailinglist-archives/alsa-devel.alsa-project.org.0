Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC27A28D9F7
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Oct 2020 08:25:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C99F16C6;
	Wed, 14 Oct 2020 08:24:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C99F16C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602656706;
	bh=ZCOUK25KOl0D9VhqDNrdjv6RC5KEw3s0HzHAUj+BiYQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jX8LnQbzEFFiOwlHRMicLRyvqHFVhFMmSSqbWp3QQJw8JuOribe6acO0J8wwGmHyk
	 AXibNAf5C3rGvCGf7Qa/gVZBLlHK9mt8LXhjviTg5/iJoEty0UB6EWxKg5r4u8t+ji
	 3Gcarp3iQTWO/+8SM/9o5Wqwp3MZe2AbIx/cNstk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14E8EF802FB;
	Wed, 14 Oct 2020 08:20:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D93F6F802FD; Wed, 14 Oct 2020 08:20:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD684F80217
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 08:19:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD684F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="DJEuNCgx"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="eDyP7a24"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 432B7CC4;
 Wed, 14 Oct 2020 02:19:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 14 Oct 2020 02:19:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=MZVZH3gnQoFwO
 t0xoqeNhspb3gmAXVdz0kpX7WcBWco=; b=DJEuNCgxktR48F5ayRgVaXOYfldT9
 wxo3IRe7oK6unpzg+Z85LITiQGOBML38VPWOA7bwI462FjVke+Ota9WE2gSPfX4V
 U4U9YJBzIgsxu83Alk5VDw7ZqCi4tCh96cuwgro0g0RkYOBF1hUSZHEow6tGKL+q
 qEZShGsGpDvxZjDp2CEklfq+UQ6WD/tNMn6UZ5nBiz5KE3wUNa84GoK2HeIlK0Km
 0yrsvwKobInBicF+eqeowYa6FvI7Nb8fgfnY+VOvhMaiqQNleXqaMzn1LYeFkx1b
 dpXUEk6dCHfdpaPp4JnJhJMq2qr2kd0OWJ5cV55zIbio/mODtcThzRmwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=MZVZH3gnQoFwOt0xoqeNhspb3gmAXVdz0kpX7WcBWco=; b=eDyP7a24
 YahGllPeHVl9B9CZXs96HvJpAdJGpZannWchk3PmwT/NWckQ/utqGQo2QtoLi1NS
 4C7/R+RwRaOb+Lo9pHvEecgZ+Xcd2QtdPq9UDV7c1YW7eJ+nDeHGMKmigJq68Bft
 uPNlaigTS0Gh3H9a9Lu+scvFuVAuJu6h4GYwuseQh1Pw1AnHRfeou9OwxA3KTEw2
 5JHNTMdiheLr7fA0Un/CFKvqwYrZ2zHbRfqALxeUhs/MdQ1q5MRsx9Ar2riTosKw
 ehVLFW1mBK/qG/YShSpvHJPnjsBi1pp1crqnktsUUukuRvak+sNRp4tsgPuPEKEB
 qt6cJNLV1m2Zeg==
X-ME-Sender: <xms:gZiGX_capqC6aZBS4izn-8MedAwNYPtqiQ8hReQTePRMZ9STpCpHPQ>
 <xme:gZiGX1OBnfgOyCVwXyBnywWhQOZPmxigR93C64OKVF7bF7MJd9y463G9LtJetcKum
 Wkp9hAiXXiwTFeA0A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedriedtgddutdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
 ugdrohhrgh
X-ME-Proxy: <xmx:gZiGX4j6JIdirYC73Zcag2Lgxa9hx7-XoVDAGaslnr6pZhqqYfoh3A>
 <xmx:gZiGXw9IGO6BgiASVnYGhcz8mUfJjN6gHPTMS8rcpUrCcVul-cUyxQ>
 <xmx:gZiGX7vsK93zwEVVg14oZDkZMrl22LXJtrLewPR8DPh6wwaOA5nWaQ>
 <xmx:gZiGXxCVp1fxAr6bOWP2Smb16nSlAiJncGEEdLZPA0xhcwD00MLXmcfL__w>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2C2AB3280060;
 Wed, 14 Oct 2020 02:19:45 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 07/17] ASoC: sun8i-codec: Support the TDM slot binding
Date: Wed, 14 Oct 2020 01:19:31 -0500
Message-Id: <20201014061941.4306-8-samuel@sholland.org>
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

Now that BCLK and LRCK rate calculations in the driver can handle any
hardware-supported slot width and number of slots, allow overriding
those parameters from the device tree.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index ae885774c877..49e763d1891b 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -94,25 +94,31 @@
 #define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ_MASK	GENMASK(5, 4)
 #define SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT_MASK	GENMASK(3, 2)
 
 enum {
 	SUN8I_CODEC_AIF1,
 	SUN8I_CODEC_NAIFS
 };
 
+struct sun8i_codec_aif {
+	unsigned int	slots;
+	unsigned int	slot_width;
+};
+
 struct sun8i_codec_quirks {
 	bool legacy_widgets	: 1;
 	bool lrck_inversion	: 1;
 };
 
 struct sun8i_codec {
 	struct regmap			*regmap;
 	struct clk			*clk_module;
 	const struct sun8i_codec_quirks	*quirks;
+	struct sun8i_codec_aif		aifs[SUN8I_CODEC_NAIFS];
 };
 
 static int sun8i_codec_runtime_resume(struct device *dev)
 {
 	struct sun8i_codec *scodec = dev_get_drvdata(dev);
 	int ret;
 
 	regcache_cache_only(scodec->regmap, false);
@@ -256,16 +262,32 @@ static int sun8i_codec_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 
 	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
 			   SUN8I_AIF1CLK_CTRL_AIF1_CLK_INV_MASK,
 			   invert << SUN8I_AIF1CLK_CTRL_AIF1_CLK_INV);
 
 	return 0;
 }
 
+static int sun8i_codec_set_tdm_slot(struct snd_soc_dai *dai,
+				    unsigned int tx_mask, unsigned int rx_mask,
+				    int slots, int slot_width)
+{
+	struct sun8i_codec *scodec = snd_soc_dai_get_drvdata(dai);
+	struct sun8i_codec_aif *aif = &scodec->aifs[dai->id];
+
+	if (slot_width && !is_power_of_2(slot_width))
+		return -EINVAL;
+
+	aif->slots = slots;
+	aif->slot_width = slot_width;
+
+	return 0;
+}
+
 struct sun8i_codec_clk_div {
 	u8	div;
 	u8	val;
 };
 
 static const struct sun8i_codec_clk_div sun8i_codec_bclk_div[] = {
 	{ .div = 1,	.val = 0 },
 	{ .div = 2,	.val = 1 },
@@ -316,18 +338,19 @@ static int sun8i_codec_get_lrck_div_order(unsigned int slots,
 	return order_base_2(div);
 }
 
 static int sun8i_codec_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *params,
 				 struct snd_soc_dai *dai)
 {
 	struct sun8i_codec *scodec = snd_soc_dai_get_drvdata(dai);
-	unsigned int slots = params_channels(params);
-	unsigned int slot_width = params_width(params);
+	struct sun8i_codec_aif *aif = &scodec->aifs[dai->id];
+	unsigned int slots = aif->slots ?: params_channels(params);
+	unsigned int slot_width = aif->slot_width ?: params_width(params);
 	int lrck_div_order, sample_rate, word_size;
 	u8 bclk_div;
 
 	/* word size */
 	switch (params_width(params)) {
 	case 8:
 		word_size = 0x0;
 		break;
@@ -371,16 +394,17 @@ static int sun8i_codec_hw_params(struct snd_pcm_substream *substream,
 			   SUN8I_SYS_SR_CTRL_AIF1_FS_MASK,
 			   sample_rate << SUN8I_SYS_SR_CTRL_AIF1_FS);
 
 	return 0;
 }
 
 static const struct snd_soc_dai_ops sun8i_codec_dai_ops = {
 	.set_fmt	= sun8i_codec_set_fmt,
+	.set_tdm_slot	= sun8i_codec_set_tdm_slot,
 	.hw_params	= sun8i_codec_hw_params,
 };
 
 static struct snd_soc_dai_driver sun8i_codec_dais[] = {
 	{
 		.name	= "sun8i-codec-aif1",
 		.id	= SUN8I_CODEC_AIF1,
 		.ops	= &sun8i_codec_dai_ops,
-- 
2.26.2

