Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E836927F7E9
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 04:18:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08703185D;
	Thu,  1 Oct 2020 04:18:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08703185D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601518735;
	bh=/ELA6Qtv3sEf3uW/B6wjUhvNmqf0uecMu1r2BzjhQH0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N4QO8xQ1tdGCDWJZ7mI2KmDXuBPRsSZcXlV2GPkNEx/BBLvFUJd7GQ8OjuQIvx3eG
	 eS4kAvtHvV6qISu3Ucj65OrpGfAsiz4eF+rhuxzvKhwEgiw5hesnUgOYLZrOof0Uq0
	 IpMLu5Qwg1VlUTRb4eEcr8g34bNU06HPiR6mRJ5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B76AF802E3;
	Thu,  1 Oct 2020 04:12:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3443F80273; Thu,  1 Oct 2020 04:12:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E93A7F802DB
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 04:11:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E93A7F802DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="St/fhDda"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Yfsk/4z3"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4D14E580366;
 Wed, 30 Sep 2020 22:11:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 30 Sep 2020 22:11:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=v4nxbZWm9jVw4
 1hD7CaBzWhTO3igpvEqqo4GdTdUyW0=; b=St/fhDda74+KWLFR0Br7+Gz5ryx09
 GVkSCBNcaY3Q49mA9l1k5m0ao6ldUvHE9bxIacqJ+xE3TvAxQaSCE6F3sHmydm8C
 pU+br1SaHRbLI5eYDS1J6aogdYPwimEjjZqAf4MMfhP2pOslxpYqaMQwUwnKOJEZ
 inp0N502TkowGpI0w7F1+fcfVY/F3EIHg5sktmznljepvNCnXs54+08V5K06iVmZ
 c11kD4hQh7RjeMzDhB2Bft+VmFTqCJJ/68KaJ/Tp3T7qbbqQ0gO8sO64DEIVwzXZ
 ILOWrxvQWwKnD53w1fETCTtABCjGNLFXvpRkoYgF1xsVFGo46PE9qcKbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=v4nxbZWm9jVw41hD7CaBzWhTO3igpvEqqo4GdTdUyW0=; b=Yfsk/4z3
 XuL3ncoDH1HRGrur+FJDcZET9jHry1pgjghh9+hglzigrY+3+Tfb6uqrNbcT3axn
 yFi7aEIr9WJ6iqpJFXzxuIyXrns3OgaIfQy6UDfQAzJwwCwEn7QsBdMr0B0QmvJq
 /flsz1abaHlSWcfReBg2872oRsrrfFRN9hJgVibo0B8vBHjTtDuUk1oBerSb18Mz
 OkndWXGHIQw5LM+EGajEKGeQVTead40vM0XFH2DudYY1yBjoqgUdNt7OPxPhFrL7
 G1WAr7w5c+YWiNnBnZFRHCMG1uTy7C8rlExjEgMVI6SdGydwAhAc5B7wh/p8RLhK
 /JkUFdBD3i8Mjg==
X-ME-Sender: <xms:6jp1X6_S-6h8RBcvS4Lrf_KNO2jT8gcsFo_GDbtRTBfRgNoz-ED9lg>
 <xme:6jp1X6sKzHUTDhTtN33wRGja-8Wc6hEp6Ig8saowu1FSFEDLBj9IO175iLDHlVi4F
 VNeZ7n1MxZTM50DrQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeefgdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
 grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
 jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
 gvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
 rdhorhhg
X-ME-Proxy: <xmx:6zp1XwCFepBxuPtipNrHHOS6AK18cVl7tivBFcU5U0-ffWnqxHOddQ>
 <xmx:6zp1XycNjHiyBcyKZNnZEcX-5Rsj_vyoe7MrUvWkopPYpdIl2n7fTA>
 <xmx:6zp1X_NnqlW4FONip4PLjK9ng54Ss5JTxXrN6WU_vaoOWhv068mqIw>
 <xmx:6zp1X4it1B-aYke6SD4fYd8w8WhnYbHQ5o9UT_FRHOQs4B9SAuEyqQ>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 82C97306467E;
 Wed, 30 Sep 2020 22:11:54 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 11/25] ASoC: sun8i-codec: Enable all supported clock inversions
Date: Wed, 30 Sep 2020 21:11:34 -0500
Message-Id: <20201001021148.15852-12-samuel@sholland.org>
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

When using the I2S, LEFT_J, or RIGHT_J format, the hardware supports
independent BCLK and LRCK inversion control. When using DSP_A or DSP_B,
LRCK inversion is not supported. The register bit is repurposed to
select between DSP_A and DSP_B. Extend the driver to support this.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 57 +++++++++++++++++++++++------------
 1 file changed, 37 insertions(+), 20 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 0b713b2a2028..506420fb355c 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -39,18 +39,17 @@
 #define SUN8I_MOD_RST_CTL_AIF1				15
 #define SUN8I_MOD_RST_CTL_ADC				3
 #define SUN8I_MOD_RST_CTL_DAC				2
 #define SUN8I_SYS_SR_CTRL				0x018
 #define SUN8I_SYS_SR_CTRL_AIF1_FS			12
 #define SUN8I_SYS_SR_CTRL_AIF2_FS			8
 #define SUN8I_AIF1CLK_CTRL				0x040
 #define SUN8I_AIF1CLK_CTRL_AIF1_MSTR_MOD		15
-#define SUN8I_AIF1CLK_CTRL_AIF1_BCLK_INV		14
-#define SUN8I_AIF1CLK_CTRL_AIF1_LRCK_INV		13
+#define SUN8I_AIF1CLK_CTRL_AIF1_CLK_INV			13
 #define SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV		9
 #define SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV		6
 #define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ		4
 #define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ_16		(1 << 4)
 #define SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT		2
 #define SUN8I_AIF1_ADCDAT_CTRL				0x044
 #define SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0L_ENA		15
 #define SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0R_ENA		14
@@ -85,16 +84,17 @@
 #define SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_AIF1DA1R		10
 #define SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_AIF2DACR		9
 #define SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_ADCR		8
 
 #define SUN8I_SYSCLK_CTL_AIF1CLK_SRC_MASK	GENMASK(9, 8)
 #define SUN8I_SYSCLK_CTL_AIF2CLK_SRC_MASK	GENMASK(5, 4)
 #define SUN8I_SYS_SR_CTRL_AIF1_FS_MASK		GENMASK(15, 12)
 #define SUN8I_SYS_SR_CTRL_AIF2_FS_MASK		GENMASK(11, 8)
+#define SUN8I_AIF1CLK_CTRL_AIF1_CLK_INV_MASK	GENMASK(14, 13)
 #define SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV_MASK	GENMASK(12, 9)
 #define SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV_MASK	GENMASK(8, 6)
 #define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ_MASK	GENMASK(5, 4)
 #define SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT_MASK	GENMASK(3, 2)
 
 enum {
 	AIF1,
 	NAIFS
@@ -168,17 +168,17 @@ static int sun8i_codec_get_hw_rate(struct snd_pcm_hw_params *params)
 	default:
 		return -EINVAL;
 	}
 }
 
 static int sun8i_codec_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct sun8i_codec *scodec = snd_soc_dai_get_drvdata(dai);
-	u32 format, value;
+	u32 format, invert, value;
 
 	/* clock masters */
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
 	case SND_SOC_DAIFMT_CBS_CFS: /* Codec slave, DAI master */
 		value = 0x1;
 		break;
 	case SND_SOC_DAIFMT_CBM_CFM: /* Codec Master, DAI slave */
 		value = 0x0;
@@ -197,55 +197,72 @@ static int sun8i_codec_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		break;
 	case SND_SOC_DAIFMT_LEFT_J:
 		format = 0x1;
 		break;
 	case SND_SOC_DAIFMT_RIGHT_J:
 		format = 0x2;
 		break;
 	case SND_SOC_DAIFMT_DSP_A:
+		format = 0x3;
+		invert = 0x0; /* Set LRCK_INV to 0 */
+		break;
 	case SND_SOC_DAIFMT_DSP_B:
 		format = 0x3;
+		invert = 0x1; /* Set LRCK_INV to 1 */
 		break;
 	default:
 		return -EINVAL;
 	}
 	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
 			   SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT_MASK,
 			   format << SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT);
 
 	/* clock inversion */
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
 	case SND_SOC_DAIFMT_NB_NF: /* Normal */
 		value = 0x0;
 		break;
-	case SND_SOC_DAIFMT_IB_IF: /* Inversion */
+	case SND_SOC_DAIFMT_NB_IF: /* Inverted LRCK */
 		value = 0x1;
 		break;
+	case SND_SOC_DAIFMT_IB_NF: /* Inverted BCLK */
+		value = 0x2;
+		break;
+	case SND_SOC_DAIFMT_IB_IF: /* Both inverted */
+		value = 0x3;
+		break;
 	default:
 		return -EINVAL;
 	}
-	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
-			   BIT(SUN8I_AIF1CLK_CTRL_AIF1_BCLK_INV),
-			   value << SUN8I_AIF1CLK_CTRL_AIF1_BCLK_INV);
 
-	/*
-	 * It appears that the DAI and the codec in the A33 SoC don't
-	 * share the same polarity for the LRCK signal when they mean
-	 * 'normal' and 'inverted' in the datasheet.
-	 *
-	 * Since the DAI here is our regular i2s driver that have been
-	 * tested with way more codecs than just this one, it means
-	 * that the codec probably gets it backward, and we have to
-	 * invert the value here.
-	 */
-	value ^= scodec->quirks->lrck_inversion;
+	if (format == 0x3) {
+		/* Inverted LRCK is not available in DSP mode. */
+		if (value & BIT(0))
+			return -EINVAL;
+
+		/* Instead, the bit selects between DSP A/B formats. */
+		value |= invert;
+	} else {
+		/*
+		 * It appears that the DAI and the codec in the A33 SoC don't
+		 * share the same polarity for the LRCK signal when they mean
+		 * 'normal' and 'inverted' in the datasheet.
+		 *
+		 * Since the DAI here is our regular i2s driver that have been
+		 * tested with way more codecs than just this one, it means
+		 * that the codec probably gets it backward, and we have to
+		 * invert the value here.
+		 */
+		value ^= scodec->quirks->lrck_inversion;
+	}
+
 	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
-			   BIT(SUN8I_AIF1CLK_CTRL_AIF1_LRCK_INV),
-			   value << SUN8I_AIF1CLK_CTRL_AIF1_LRCK_INV);
+			   SUN8I_AIF1CLK_CTRL_AIF1_CLK_INV_MASK,
+			   value << SUN8I_AIF1CLK_CTRL_AIF1_CLK_INV);
 
 	return 0;
 }
 
 struct sun8i_codec_clk_div {
 	u8	div;
 	u8	val;
 };
-- 
2.26.2

