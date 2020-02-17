Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34619160B32
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 07:55:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4C3716B6;
	Mon, 17 Feb 2020 07:54:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4C3716B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581922540;
	bh=FOFYraOs9vWrihQIp1vvCOPtsDVrCPlP4XyMSK3TRYo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tqCFVS8+p+il0Y7j/aUHHai1J1ZRe4Q0LlSCjehAhcR8bXqb50v416q1LvgjbWfwQ
	 w2odXHkLj7o0rJBoM8WJXy6R+P7gFTGD0JY+Y1R7bxZaFvoO8wy+EKWp30l4yQMmzR
	 D3NIqhK5OnzEa30YgRXgamcQ1t6nM0ERTTZU/trU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DC3EF8033D;
	Mon, 17 Feb 2020 07:44:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72508F802F9; Mon, 17 Feb 2020 07:43:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4E44F8028F
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 07:43:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4E44F8028F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="kNIOJ+rf"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="vynmf9ZJ"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 07EAC53D5;
 Mon, 17 Feb 2020 01:43:03 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 17 Feb 2020 01:43:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=buZiaTnEqm5DH
 U8YzwhYJsnJNFjdJst45DN+p+GxpTc=; b=kNIOJ+rfmN1lPi0tn+TttrWHKN9L+
 L2bZVT62wMcFR4mz+K3SH0tPfI1MwpuYWTpri7Mbi9gCwihLBWmqw6SxuqQdTrxN
 t9b5oM9Agh8DNZ9VBjii219iQuJM7eoD23u3Ykc4GoyUuqCEqTNtk6MpOSOhFTli
 Xr6OMIyPBmQEjWQ7g8KfeyuTFqxgEGCrf4liMhjvbc0cqFCBBXk4hf6vN1cEmxVq
 zJ5xAH8JFVAHVXBusXcJsBFRJdzPppmrogb3PM9j6jbDy1Q8xriePcbffrpjFDaK
 5geWVYuQl2u8H0Hqfbd0kJZIECAjsfyRABsMA3DVteOsMxS5wEw57OnNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=buZiaTnEqm5DHU8YzwhYJsnJNFjdJst45DN+p+GxpTc=; b=vynmf9ZJ
 tbgAM9KDNydNd0H56cXFsSVp1aYVrV3map3U03rGp0vdUQf452wVPyLlgukvhwxN
 u2uFBAwNsN3nyRkC7LHn+lquFMrxelRS489PJvemEoFH4hgylwdRDcp/avYF7UuS
 5U8ZfVI8qRsGnE+Btr8kM5pRTnIO2grtOTw3k8A0Qkjp7OKWLez2Wm+540vpTyDx
 fFe7bolpakgdLN4FnEuVfz7zmPSx7HLd+Di7bOODELYIiyusXIZP+viPNbP537/J
 ZFICRpmFr1iC6Us/a5eULLO49tT6OZx++CJCr60vwgrOhoplBby1nd9rwMXYJidR
 VSdkDkA7pRn1sw==
X-ME-Sender: <xms:9jVKXoKLkxyCmdj47pjvko4CjxeZFYBGN1r0gPiqSPeAy8lnEJM7Xw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeehgdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppe
 ejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpedujeenucfrrghr
 rghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:9jVKXmpwh_GVvDt2Zjbo62aLRQjanGviCXCO7raOQ2V5zIYx8SJLrA>
 <xmx:9jVKXvg0XonRxLJc9HWPGk6_3Y69d1rqhhOfE3zufGIkXxKfgIW80g>
 <xmx:9jVKXlapudbBbQTDJ_whu2mpPmDJIwdsESuJ5Hrd510eXRumvvB5sA>
 <xmx:9zVKXicV6aP1V1KfsmtHCJ7paxetTOak3gbdthOLMykrsJwFHE9IHw>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 463C8328005E;
 Mon, 17 Feb 2020 01:43:02 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@free-electrons.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Date: Mon, 17 Feb 2020 00:42:35 -0600
Message-Id: <20200217064250.15516-20-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200217064250.15516-1-samuel@sholland.org>
References: <20200217064250.15516-1-samuel@sholland.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Samuel Holland <samuel@sholland.org>
Subject: [alsa-devel] [RFC PATCH 19/34] ASoC: sun8i-codec: Support mono DAI
	configurations
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

Calculate the correct clock rate for a mono configuration.

The AIFs have a bit that must be set for mono input/output.
Set the bit when the number of channels is 1.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index f8cde149a92b..2df899daec67 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -47,6 +47,7 @@
 #define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ		4
 #define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ_16		(1 << 4)
 #define SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT		2
+#define SUN8I_AIF1CLK_CTRL_AIF1_MONO_PCM		1
 #define SUN8I_AIF1_ADCDAT_CTRL				0x044
 #define SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0L_ENA		15
 #define SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0R_ENA		14
@@ -280,10 +281,11 @@ static const struct sun8i_codec_clk_div sun8i_codec_bclk_div[] = {
 
 static u8 sun8i_codec_get_bclk_div(struct sun8i_codec *scodec,
 				   unsigned int rate,
+				   unsigned int channels,
 				   unsigned int word_size)
 {
 	unsigned long clk_rate = clk_get_rate(scodec->clk_module);
-	unsigned int div = clk_rate / rate / word_size / 2;
+	unsigned int div = clk_rate / rate / word_size / channels;
 	unsigned int best_val = 0, best_diff = ~0;
 	int i;
 
@@ -316,8 +318,10 @@ static int sun8i_codec_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_soc_dai *dai)
 {
 	struct sun8i_codec *scodec = snd_soc_component_get_drvdata(dai->component);
+	unsigned int channels = params_channels(params);
 	int sample_rate, lrck_div;
 	u8 bclk_div;
+	u32 value;
 
 	/*
 	 * The CPU DAI handles only a sample of 16 bits. Configure the
@@ -327,12 +331,13 @@ static int sun8i_codec_hw_params(struct snd_pcm_substream *substream,
 			   SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ_MASK,
 			   SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ_16);
 
-	bclk_div = sun8i_codec_get_bclk_div(scodec, params_rate(params), 16);
+	bclk_div = sun8i_codec_get_bclk_div(scodec, params_rate(params),
+					    channels, 16);
 	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
 			   SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV_MASK,
 			   bclk_div << SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV);
 
-	lrck_div = sun8i_codec_get_lrck_div(params_channels(params),
+	lrck_div = sun8i_codec_get_lrck_div(channels,
 					    params_physical_width(params));
 	if (lrck_div < 0)
 		return lrck_div;
@@ -341,6 +346,11 @@ static int sun8i_codec_hw_params(struct snd_pcm_substream *substream,
 			   SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV_MASK,
 			   lrck_div << SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV);
 
+	value = channels == 1;
+	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
+			   BIT(SUN8I_AIF1CLK_CTRL_AIF1_MONO_PCM),
+			   value << SUN8I_AIF1CLK_CTRL_AIF1_MONO_PCM);
+
 	sample_rate = sun8i_codec_get_hw_rate(params);
 	if (sample_rate < 0)
 		return sample_rate;
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
