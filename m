Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB78227F7E8
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 04:18:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 645BB17F4;
	Thu,  1 Oct 2020 04:17:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 645BB17F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601518720;
	bh=8z9UAZVoSJW1KrPw2I7hUOF591RWzlr4s9OQk+wc+w0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AWdqMAuEUYKmqpKxI8Sc9eahox++HdWExbbYNtXtL7Sw/5waN2bA70Mjkp03yYK9w
	 JTCK8V/83LFPYV8pD7RZtuDHkyhyAapjuRi6PXaE1Qnnga/u8u7gvxI1Zu6iQuAXca
	 CBcS9cV1Hrt8hiYywyFHfoQLAv+89curBVpkGzoQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 516C0F8033F;
	Thu,  1 Oct 2020 04:12:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E22AF80322; Thu,  1 Oct 2020 04:12:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9C00F801D8
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 04:11:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9C00F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="MNzbT5ol"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="PagI+vuI"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id BFDD6580359;
 Wed, 30 Sep 2020 22:11:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 30 Sep 2020 22:11:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=xDYcSsELdJxr3
 +M7rPO7pYNtFkrb0e0+PLQ5ly0ReRw=; b=MNzbT5oluml3NL0iZGvzlGh5g2rhu
 +4CnuT2bLZSYBmW8q2gYKpI20JBR7rTWqUAcoGrJbZGPMYRgZF9ocbmrAM2Za9j9
 5d1mTf+mfm06exb8v0GdDO9gkEwt+p5RiXxXtjJmI40U7a4lo95GbEo9Qgh7ygHU
 TAkYXn/ISpeg9khQv/2dmSsNTHe5yYkREKiHJNgDG/V9x34jaX/nnANmQUwhU8Zu
 RN81tuNL969EUXk/1tw91DnJIPphaSqiD1qvHMQQrHBLcj2Ue/wJOUC6F/7/TLp3
 EnzqUtX2SKxapn9mlt304OtEgD0MiIvFnFfsJW279zx4XzwezA5wc49uQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=xDYcSsELdJxr3+M7rPO7pYNtFkrb0e0+PLQ5ly0ReRw=; b=PagI+vuI
 8eTqVw79e5g60iqupOUJrWdTaUfyr8rgpiFBVoB+wvJ02RJTkycUFyFXmbtohQEg
 eeBWWBVlYhWuNnOaBgaCfwo9NX9fkqh4vxc5NBc2lq1jNQ2kisReG3fKS1DkjgT+
 EP8mNL3VlQd6LiA9c+ZYBLGI7PhYdlpKbZRZjTRWEYpuUYcxOHq7qFrQyxIe1XkE
 Et4nM7vzGsi3HLZZxyBj6IpG4dTEepQvJzLJmKxPJoGO/G+/iD3ad5TkDBYe+bfx
 GbjciLzla4OBfquNiodCLvvadQ5EayO7ItvNhuuEFJWD6tOywUxLebTHly9CHqsW
 j9/lMCn7iD5lgg==
X-ME-Sender: <xms:6jp1X3VbK5J-Q_fl6Rcpgguw1N_CZni1tmEZNm1TJd6K7PrzWv9vZg>
 <xme:6jp1X_kqcz66JPbFzRj85PqFPfeu70f8-KisVSTO1CvMJzhsgJ7JHuOFrHHZGZl3t
 W-C5ByJgkhZghR_Uw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeefgdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
 grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
 jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
 gvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
 rdhorhhg
X-ME-Proxy: <xmx:6jp1XzZakZIhFGp4fS0GIy_j1PVDPy5-GPQhXnKuLByQpBUp3jQ7IA>
 <xmx:6jp1XyVZm0FjcWJwSColOoQWy9ryPpkr--YPLU8h4TiIjVXj2_DDJA>
 <xmx:6jp1Xxn3mwFbGpC8YgQD-WOXILpHcyRNkoj6O8OHpb7L9rGf9FPA3Q>
 <xmx:6jp1Xz48w7EixpaFw3hPojpZ0PsFKO79CThgcuB6oBObscXsKPeKfw>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0D8493064610;
 Wed, 30 Sep 2020 22:11:54 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 10/25] ASoC: sun8i-codec: Program format before clock inversion
Date: Wed, 30 Sep 2020 21:11:33 -0500
Message-Id: <20201001021148.15852-11-samuel@sholland.org>
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

The LRCK inversion bit has a different meaning in DSP mode: it selects
between DSP A and DSP B formats. To support this, we need to know if
the selected format is a DSP format. One easy way to do this is to set
the format field before the inversion fields.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 46 +++++++++++++++++------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 346f699c2e86..0b713b2a2028 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -168,33 +168,55 @@ static int sun8i_codec_get_hw_rate(struct snd_pcm_hw_params *params)
 	default:
 		return -EINVAL;
 	}
 }
 
 static int sun8i_codec_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct sun8i_codec *scodec = snd_soc_dai_get_drvdata(dai);
-	u32 value;
+	u32 format, value;
 
 	/* clock masters */
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
 	case SND_SOC_DAIFMT_CBS_CFS: /* Codec slave, DAI master */
 		value = 0x1;
 		break;
 	case SND_SOC_DAIFMT_CBM_CFM: /* Codec Master, DAI slave */
 		value = 0x0;
 		break;
 	default:
 		return -EINVAL;
 	}
 	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
 			   BIT(SUN8I_AIF1CLK_CTRL_AIF1_MSTR_MOD),
 			   value << SUN8I_AIF1CLK_CTRL_AIF1_MSTR_MOD);
 
+	/* DAI format */
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+		format = 0x0;
+		break;
+	case SND_SOC_DAIFMT_LEFT_J:
+		format = 0x1;
+		break;
+	case SND_SOC_DAIFMT_RIGHT_J:
+		format = 0x2;
+		break;
+	case SND_SOC_DAIFMT_DSP_A:
+	case SND_SOC_DAIFMT_DSP_B:
+		format = 0x3;
+		break;
+	default:
+		return -EINVAL;
+	}
+	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
+			   SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT_MASK,
+			   format << SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT);
+
 	/* clock inversion */
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
 	case SND_SOC_DAIFMT_NB_NF: /* Normal */
 		value = 0x0;
 		break;
 	case SND_SOC_DAIFMT_IB_IF: /* Inversion */
 		value = 0x1;
 		break;
@@ -215,38 +237,16 @@ static int sun8i_codec_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	 * that the codec probably gets it backward, and we have to
 	 * invert the value here.
 	 */
 	value ^= scodec->quirks->lrck_inversion;
 	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
 			   BIT(SUN8I_AIF1CLK_CTRL_AIF1_LRCK_INV),
 			   value << SUN8I_AIF1CLK_CTRL_AIF1_LRCK_INV);
 
-	/* DAI format */
-	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
-	case SND_SOC_DAIFMT_I2S:
-		value = 0x0;
-		break;
-	case SND_SOC_DAIFMT_LEFT_J:
-		value = 0x1;
-		break;
-	case SND_SOC_DAIFMT_RIGHT_J:
-		value = 0x2;
-		break;
-	case SND_SOC_DAIFMT_DSP_A:
-	case SND_SOC_DAIFMT_DSP_B:
-		value = 0x3;
-		break;
-	default:
-		return -EINVAL;
-	}
-	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
-			   SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT_MASK,
-			   value << SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT);
-
 	return 0;
 }
 
 struct sun8i_codec_clk_div {
 	u8	div;
 	u8	val;
 };
 
-- 
2.26.2

