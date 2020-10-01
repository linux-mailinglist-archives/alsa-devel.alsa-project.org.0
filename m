Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B6C27F7EC
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 04:20:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AFD4185E;
	Thu,  1 Oct 2020 04:19:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AFD4185E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601518844;
	bh=Bo9bgtPJBh3GXujvj66fbwVze7lSU8c/0q4MYKAq+nY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jduqmPy5Vhjrq7DyDxCSrl9yoA64HLDWjj5z2FXHmlVAtY3jHAn6bOJnsnI2ZSVNo
	 afsZasKnKpSpa/jS4cmLCdROYSpeutpf9tEAzmOmQMvxUDLwfFrjuMFWvsWaOzPm/8
	 ptkIdTw+XN04rf4icGbFbSF2xg1+sVyNXeJPo7wQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F23FEF80350;
	Thu,  1 Oct 2020 04:12:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FB74F80339; Thu,  1 Oct 2020 04:12:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11176F802DD
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 04:11:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11176F802DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="DPMTZy1J"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="CbXfEYTo"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2DA4A580375;
 Wed, 30 Sep 2020 22:11:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 30 Sep 2020 22:11:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=/bhxd1svwQTQK
 rVdAoO4naAM8pRc9Q0oebJmrLNI+Go=; b=DPMTZy1JTuNp8bGdp0k6tmWkm0J3L
 FNrdCXvI7DRMTwKyqoPpr0nziwdZxwXPRH3ICXfa5TRd0gSh/oQZwREwld7r1iLd
 r4h5U+TvOScX7uGmgeVqY2sj7dhyD8+bOK3OaAJior/yA2rFp5U2W6IAx4DAmlDS
 ZmoAegZ/pUzjSE/bLmvZ00t8gxQUWEF7NPm8FfReKdCYABww2zgNrEvVIFWYZOv5
 jrVEGMUJAoZ+eALLXENwlnwguU8WSyZ8PYNyn6bowSo+sRIC6vUCUS/T2lgS/NqV
 JojF+Hr388pZLDcBWRETR03fAyIJCt5FVY65GSv23fsYuP6oPH5D9KaVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=/bhxd1svwQTQKrVdAoO4naAM8pRc9Q0oebJmrLNI+Go=; b=CbXfEYTo
 Rdshd2dv9TwKsrbIqXmDAKxdUmZKK8NUMg5QsH7XhsTrHh8Knji5JEK4Ywaapcma
 ItReHHUQrv+hjw2JNLl4iJVyQKH6yKxpUZAM0ybZIv1fgFlDcw74qnq/UuDa3V52
 6bmYqKOkh0lUObdOeWUvk8i0lRXHdEbOZ536ulA31eamp5JGGGBkQ4d1FxNQq8l5
 MW+26yky67HznwQwR1sTBNXwa/NEkj4t0RbCKjyjQO7zkw0bnysSxipnQoemlQ5N
 H8887GxvSIpryzeqQ+NskD10HeZDzOLfFQ590+NWSXlmrbSvhVyQXGmM5iHvKdKW
 UyEXhgfQBIKzjQ==
X-ME-Sender: <xms:6zp1X2DdJx-yFCZPoSTazb1RTcxzvpPYfl2c3q-oBH3LjCSi9BVHWQ>
 <xme:6zp1XwieU7EqJ92VB-X224Fl-yEkEY1t1cryU4qyvTqEJo2lomgEQT73YvxVYp8sB
 Xjz9oMO8uNFZ6ZFEQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeefgdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
 grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
 jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
 gvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
 rdhorhhg
X-ME-Proxy: <xmx:6zp1X5nRVTfNZB5inus4rpU-gRuY1Pb6xJ4TYS67QD0YJEC-2oNCkg>
 <xmx:6zp1X0wgydVP_i0CfFIsYZit6c5iAT-7qE5U6PfKps9w89xALsUAQA>
 <xmx:6zp1X7TM-qPshAjt3DQaD5VdPP6Onddf3SPmSacIbWqR428CvdMQ6Q>
 <xmx:7Dp1X2FScEnp1mLXIiCiyjT4JaUvyu53fZ0kHdqEBjruimiFp8Zwpg>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 750E5306467E;
 Wed, 30 Sep 2020 22:11:55 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 13/25] ASoC: sun8i-codec: Round up the LRCK divisor
Date: Wed, 30 Sep 2020 21:11:36 -0500
Message-Id: <20201001021148.15852-14-samuel@sholland.org>
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

The codec supports only power-of-two BCLK/LRCK divisors. If either the
slot width or the number of slots is not a power of two, the LRCK
divisor must be rounded up to provide enough space. To do that, use
order_base_2 (instead of ilog2, which rounds down).

Since the rounded divisor is also needed for setting the SYSCLK/BCLK
divisor, return the order base 2 instead of fully calculating the
hardware register encoding.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index e7f01a4b4001..779853d023fe 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -300,33 +300,35 @@ static u8 sun8i_codec_get_bclk_div(struct sun8i_codec *scodec,
 			best_diff = diff;
 			best_val = bdiv->val;
 		}
 	}
 
 	return best_val;
 }
 
-static int sun8i_codec_get_lrck_div(unsigned int channels,
-				    unsigned int word_size)
+static int sun8i_codec_get_lrck_div_order(unsigned int slots,
+					  unsigned int slot_width)
 {
-	unsigned int div = word_size * channels;
+	unsigned int div = slots * slot_width;
 
 	if (div < 16 || div > 256)
 		return -EINVAL;
 
-	return ilog2(div) - 4;
+	return order_base_2(div);
 }
 
 static int sun8i_codec_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *params,
 				 struct snd_soc_dai *dai)
 {
 	struct sun8i_codec *scodec = snd_soc_dai_get_drvdata(dai);
-	int lrck_div, sample_rate, word_size;
+	unsigned int slots = params_channels(params);
+	unsigned int slot_width = params_width(params);
+	int lrck_div_order, sample_rate, word_size;
 	u8 bclk_div;
 
 	/* word size */
 	switch (params_width(params)) {
 	case 8:
 		word_size = 0x0;
 		break;
 	case 16:
@@ -346,24 +348,24 @@ static int sun8i_codec_hw_params(struct snd_pcm_substream *substream,
 			   SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ_MASK,
 			   word_size << SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ);
 
 	bclk_div = sun8i_codec_get_bclk_div(scodec, params_rate(params), 16);
 	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
 			   SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV_MASK,
 			   bclk_div << SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV);
 
-	lrck_div = sun8i_codec_get_lrck_div(params_channels(params),
-					    params_physical_width(params));
-	if (lrck_div < 0)
-		return lrck_div;
+	/* LRCK divider (BCLK/LRCK ratio) */
+	lrck_div_order = sun8i_codec_get_lrck_div_order(slots, slot_width);
+	if (lrck_div_order < 0)
+		return lrck_div_order;
 
 	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
 			   SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV_MASK,
-			   lrck_div << SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV);
+			   (lrck_div_order - 4) << SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV);
 
 	sample_rate = sun8i_codec_get_hw_rate(params);
 	if (sample_rate < 0)
 		return sample_rate;
 
 	regmap_update_bits(scodec->regmap, SUN8I_SYS_SR_CTRL,
 			   SUN8I_SYS_SR_CTRL_AIF1_FS_MASK,
 			   sample_rate << SUN8I_SYS_SR_CTRL_AIF1_FS);
-- 
2.26.2

