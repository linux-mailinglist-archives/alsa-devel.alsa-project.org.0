Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B58CA27F7EB
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 04:20:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DB441865;
	Thu,  1 Oct 2020 04:19:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DB441865
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601518816;
	bh=F5on1ukjx6UtDuGSsWQWqBU9dAQl0sQKwR/rMM/78DI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dw3rAK9uqzgDlPkTNkpQvxh/z4qXdK+ouaYeT9A0+vx8CmksxKOkVjJmsFy6bMja2
	 iXOY3c8GVsAdkSH9/VfNGgWucFR7Z1LLUHgDIXNBKqJbUtWL1O/KCSOAiK+hopqd95
	 Uwjs5VTOnO33yu44L+1Q9nY5N8mdG9p6s3EdbWzU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88664F802F8;
	Thu,  1 Oct 2020 04:12:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5660F80323; Thu,  1 Oct 2020 04:12:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08E10F802D2
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 04:11:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08E10F802D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="BruWlpCq"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="T9S8OTJI"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id BAE4D580367;
 Wed, 30 Sep 2020 22:11:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 30 Sep 2020 22:11:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=kZVStbkfKqbNP
 xilWM9qpPf362smVG2Yvi+DiA3j29E=; b=BruWlpCqNIJKzEG9opycH5aNmftv5
 O9xlRc8r7huTmVDhHO1IjDbecXtOrSiHDIaEpwkUKUJnE51cCznegVWnJPl7G1Lv
 LU/vmidkssHH116ktx2mwUQWwBgeodhsvoSMUUbuAY8xIC338WygUxMhM5rzIq1B
 AHC2jlmZ6A0RIU5KorA6EnY4w+wbUtmlQsPRSfUQqH/whJCZ0JqiAr48VXKPWhpi
 iK5hWShS4EPS13X8bdsqm/oabboJ/9resl57PwAb6h9ZI7O5f1sB4zdDr3TtWNuG
 ut0INtO7z50hLdAd/thEhZQBAviWFkq8vPqBk7hLPM36OATSuwGcsREaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=kZVStbkfKqbNPxilWM9qpPf362smVG2Yvi+DiA3j29E=; b=T9S8OTJI
 193OZWp0iTTTGiNq1OUNpSG9RbQRtkzLo8Afe/iOo49NDtowYWIkj0ZHektW3oIW
 2h8LehY+Ock2EGbbCo+CKFof0+WFTj+ln65OvYT0GtktKwYQVQk7V4vRlkcPzefC
 ostb7UFNoL3ECB5QqPV01CsMZXDpXvrGJRdnJaOTgyQ3giDJT2bjF69jWq5hfoP4
 pnDTZ4xXQsB4aOQLJSrBecmGoU7wnSo/lYWxERgFytT+TG1vmyZ7D9+wXA3K+dWa
 7dIgXrU1g7AvFzIKeNhApaiGYFf5uLJIjB0BmHTQepyDLVsrUGYpyIeQDP2bJjop
 /3LX1iv33H3VJg==
X-ME-Sender: <xms:6zp1X-9LZGoDV0gbYlcA4CamVRw0ePxI31yYcUeCyzz7QMTLiolstQ>
 <xme:6zp1X-sqN_NSN3p8IdRBmOrzVpYU9ERxhRXLjiNkU4HCACL1J4LLr60Wn8fA7FtZ7
 XPvloZfRL08wbfjbg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeefgdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
 grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
 jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
 gvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
 rdhorhhg
X-ME-Proxy: <xmx:6zp1X0DAEHE0BZOJiC2VO0nBQ1LtoGq0ZZYnCJQ6XMvZ9-ys2mcwhg>
 <xmx:6zp1X2fHvjDtLkHCGhfKuXPICFvrBYFe5BhvHtkXs0Uj5IpLUeWXuA>
 <xmx:6zp1XzM1mYl7PoXMyIP9uHCUvdGRbWK0qiuR6YQ8QFfc3pV5AFj5fg>
 <xmx:6zp1X8g4cCu_mw51FWZVj-Ox72vk0fWPn2SpDi7JVrml56WmCITuJg>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 014C13064610;
 Wed, 30 Sep 2020 22:11:54 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 12/25] ASoC: sun8i-codec: Program the correct word size
Date: Wed, 30 Sep 2020 21:11:35 -0500
Message-Id: <20201001021148.15852-13-samuel@sholland.org>
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

The hardware supports 8 to 24-bit word sizes on all three of its DAIs,
only one of which is connected to the CPU DAI. Program the word size
based on the actual selected format, instead of relying on limitations
in another driver (which, incedentally, has patches pending to remove
that limitation).

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 506420fb355c..e7f01a4b4001 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -43,17 +43,16 @@
 #define SUN8I_SYS_SR_CTRL_AIF1_FS			12
 #define SUN8I_SYS_SR_CTRL_AIF2_FS			8
 #define SUN8I_AIF1CLK_CTRL				0x040
 #define SUN8I_AIF1CLK_CTRL_AIF1_MSTR_MOD		15
 #define SUN8I_AIF1CLK_CTRL_AIF1_CLK_INV			13
 #define SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV		9
 #define SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV		6
 #define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ		4
-#define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ_16		(1 << 4)
 #define SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT		2
 #define SUN8I_AIF1_ADCDAT_CTRL				0x044
 #define SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0L_ENA		15
 #define SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0R_ENA		14
 #define SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0L_SRC		10
 #define SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0R_SRC		8
 #define SUN8I_AIF1_DACDAT_CTRL				0x048
 #define SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0L_ENA		15
@@ -317,26 +316,40 @@ static int sun8i_codec_get_lrck_div(unsigned int channels,
 	return ilog2(div) - 4;
 }
 
 static int sun8i_codec_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *params,
 				 struct snd_soc_dai *dai)
 {
 	struct sun8i_codec *scodec = snd_soc_dai_get_drvdata(dai);
-	int sample_rate, lrck_div;
+	int lrck_div, sample_rate, word_size;
 	u8 bclk_div;
 
-	/*
-	 * The CPU DAI handles only a sample of 16 bits. Configure the
-	 * codec to handle this type of sample resolution.
-	 */
+	/* word size */
+	switch (params_width(params)) {
+	case 8:
+		word_size = 0x0;
+		break;
+	case 16:
+		word_size = 0x1;
+		break;
+	case 20:
+		word_size = 0x2;
+		break;
+	case 24:
+		word_size = 0x3;
+		break;
+	default:
+		return -EINVAL;
+	}
+
 	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
 			   SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ_MASK,
-			   SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ_16);
+			   word_size << SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ);
 
 	bclk_div = sun8i_codec_get_bclk_div(scodec, params_rate(params), 16);
 	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
 			   SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV_MASK,
 			   bclk_div << SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV);
 
 	lrck_div = sun8i_codec_get_lrck_div(params_channels(params),
 					    params_physical_width(params));
-- 
2.26.2

