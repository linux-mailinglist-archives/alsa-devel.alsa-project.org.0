Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1508527F7ED
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 04:21:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A30AF17CA;
	Thu,  1 Oct 2020 04:20:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A30AF17CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601518880;
	bh=X3ivLNj6svVlCMlKmYCJcwFIKJE9GKeci9J+RjK8mTc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VszpSfFzha4xl0weRTCAWIBj4nA3Errxt4lGwQ1l/fCoqZIj0adMV3+2nLv9hVNkB
	 Hmq+CkdV1WNgBQ6SXRqdLLDg6+/kKW00irfN9hED6UJso7arG/Loz3OuGDEJlqyuNW
	 pz2mi/LZabnY3C3UGoXgrU8+yo/Lyq31MEoByp5U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D57A0F80363;
	Thu,  1 Oct 2020 04:12:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44692F8033D; Thu,  1 Oct 2020 04:12:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26EFDF802DF
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 04:11:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26EFDF802DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="J8lHt3/s"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="h7Hl3RpQ"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9F77D580376;
 Wed, 30 Sep 2020 22:11:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 30 Sep 2020 22:11:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=Bc9jbqPoO+UOz
 OZy0yDCeB3vfWInF0AILJdWon8Sumw=; b=J8lHt3/s9pV7XscFWB2nUVSFP2p+o
 wrFfOw98jCXw+H1mM84nRPIiTUl07W6mSlyzgHweatRySBKkSa0DI0gRezZr73xE
 W8JQp5RQCK53vE9NDoPW8GKAtWpvRRP3T5KlT2GOdhQV+8QlO7pNFItpUv29md6d
 QUVnWGufsCfpB0ERDipJvIeHU/8noGIvg881eiwEdSNvUri3iWrQnM0MXzN0sxqW
 wnPxJDlpmNOsGrE5+IqsxDWWHSquUxQvk8pHVs5Cj5vTGH9URnaVFPse14k1dNTP
 X2KWdcaASm6Y9Q4vKs3GDGW+kXw7tiIuzrVGlTOYNws6x8Vd1bbMzIO5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=Bc9jbqPoO+UOzOZy0yDCeB3vfWInF0AILJdWon8Sumw=; b=h7Hl3RpQ
 cYrzvj2leMIlAwWYgce2U49yG0swLsfYmYrUlueApJkQCTMzgYXMbcN49KO5tj/N
 PlOBT+o2xCZzUTifN2t212hNee42DlnImr210FwaN6BJr1hafB3lL0Ghw6O585hI
 HIN/tqQuQFYBBWYVWX/9OYwg5cpYKVqsPzL6X4r2JUmePEkrNRnVDCfpsVScdGwC
 Mz2rPN7Qqmc2rS10onJTVXFF19CX+PPngNe65i/8xWhhRW4+8QG5bf5uBvL0fQia
 WUaWrXiw2/x7kyVBNfkUF4WdIrERHRve7XZzHGsN3df7k2Y/fkbKdKMPLJ/yd7CT
 KvJDcEc4vaAZ2Q==
X-ME-Sender: <xms:7Dp1X9Trc4VuFjbVQy396OoLLi4jurj0A4If8iGpJUoxoX44KSPeHw>
 <xme:7Dp1X2z9oX8b4ySWV7gt6Wt-ml63YgtkMU44CcEM1QGT4xGlEBLaO1UNLzU5pERK3
 XbEMEuJBK7MSbzWwQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeefgdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
 grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
 jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
 gvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
 rdhorhhg
X-ME-Proxy: <xmx:7Dp1Xy1HmCD1oxvLoFifX9smU6ceu2nt1q4tpTogxuMQcZND4shusw>
 <xmx:7Dp1X1AoKJljpTgr4QEizh7FdH29bwkSW4d2ZQMH1xg3T8uZCpIxgQ>
 <xmx:7Dp1X2jOVBA--JoQuNmjRcaThwC1TsEEwiVaLnIua18wSF_ooX4wkA>
 <xmx:7Dp1X_VUS893Lg05kOtyg6Crm09ZJgjB_V3-r_58ADnkNqGUyIPn5A>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id E6BF23064682;
 Wed, 30 Sep 2020 22:11:55 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 14/25] ASoC: sun8i-codec: Correct the BCLK divisor calculation
Date: Wed, 30 Sep 2020 21:11:37 -0500
Message-Id: <20201001021148.15852-15-samuel@sholland.org>
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

Previously, the BCLK divisor calculation assumed a power-of-two slot
width and exactly two slots. In order to support the TDM slot binding
and 20/24-bit word sizes, those assumptions must be removed.

Due to hardware limitations, the BCLK/LRCK ratio is not as simple as
"slot_width * slots". However, the correct value is already calculated
elsewhere in this function, since it must also be programmed into the
hardware. Reuse that value to calculate the correct SYSCLK/BCLK divisor.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 779853d023fe..78feed37aa42 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -279,21 +279,21 @@ static const struct sun8i_codec_clk_div sun8i_codec_bclk_div[] = {
 	{ .div = 48,	.val = 9 },
 	{ .div = 64,	.val = 10 },
 	{ .div = 96,	.val = 11 },
 	{ .div = 128,	.val = 12 },
 	{ .div = 192,	.val = 13 },
 };
 
 static u8 sun8i_codec_get_bclk_div(struct sun8i_codec *scodec,
-				   unsigned int rate,
-				   unsigned int word_size)
+				   unsigned int lrck_div_order,
+				   unsigned int sample_rate)
 {
 	unsigned long clk_rate = clk_get_rate(scodec->clk_module);
-	unsigned int div = clk_rate / rate / word_size / 2;
+	unsigned int div = clk_rate / sample_rate >> lrck_div_order;
 	unsigned int best_val = 0, best_diff = ~0;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(sun8i_codec_bclk_div); i++) {
 		const struct sun8i_codec_clk_div *bdiv = &sun8i_codec_bclk_div[i];
 		unsigned int diff = abs(bdiv->div - div);
 
 		if (diff < best_diff) {
@@ -343,30 +343,31 @@ static int sun8i_codec_hw_params(struct snd_pcm_substream *substream,
 	default:
 		return -EINVAL;
 	}
 
 	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
 			   SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ_MASK,
 			   word_size << SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ);
 
-	bclk_div = sun8i_codec_get_bclk_div(scodec, params_rate(params), 16);
-	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
-			   SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV_MASK,
-			   bclk_div << SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV);
-
 	/* LRCK divider (BCLK/LRCK ratio) */
 	lrck_div_order = sun8i_codec_get_lrck_div_order(slots, slot_width);
 	if (lrck_div_order < 0)
 		return lrck_div_order;
 
 	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
 			   SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV_MASK,
 			   (lrck_div_order - 4) << SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV);
 
+	/* BCLK divider (SYSCLK/BCLK ratio) */
+	bclk_div = sun8i_codec_get_bclk_div(scodec, lrck_div_order, params_rate(params));
+	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
+			   SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV_MASK,
+			   bclk_div << SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV);
+
 	sample_rate = sun8i_codec_get_hw_rate(params);
 	if (sample_rate < 0)
 		return sample_rate;
 
 	regmap_update_bits(scodec->regmap, SUN8I_SYS_SR_CTRL,
 			   SUN8I_SYS_SR_CTRL_AIF1_FS_MASK,
 			   sample_rate << SUN8I_SYS_SR_CTRL_AIF1_FS);
 
-- 
2.26.2

