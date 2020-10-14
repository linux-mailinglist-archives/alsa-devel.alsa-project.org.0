Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCC628D9EF
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Oct 2020 08:22:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1940D16E6;
	Wed, 14 Oct 2020 08:21:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1940D16E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602656543;
	bh=0BsgaIXHuxCuDUonj0jkjSJ5bR3/SHVx0JNsx/GdovQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q0kD9Xg90WFyoZEZ3i42Q8uSmeZ/RGVkgEc6aO7Zgvea/Rt6y9aBK6vyQTymhhVeH
	 0v3C83ktqoR4Sv6iJNe/QJcTuE1yxyMvI5Unt9QaSPv8RlF/7WfeI74XUenelkvQBP
	 7xwQnzarbbJ3HHigzQZEF6ipYzs68hNp7PB7a8Z4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D221F8028F;
	Wed, 14 Oct 2020 08:20:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 063AAF80296; Wed, 14 Oct 2020 08:20:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 255B7F80118
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 08:19:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 255B7F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="Ev1RzPhR"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Lm+ahW0D"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 6BC88CC9;
 Wed, 14 Oct 2020 02:19:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 14 Oct 2020 02:19:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=GJr9Qrw5bSCnV
 QEj7VhdEcD6zyBfcvSKyI44Pq4WwGs=; b=Ev1RzPhRtWg7CoRMGq066yx2iQXC6
 UJx5cWHcPcZuhXmVo9z3Fa90pNEcf3BdhYjMdjrO5P4Z79ZN/C7HlrfBGken+o/j
 gz4/Wm4nAw4MWpDNtMnMsLU0G+PBBZWlFycq9/3Sq6B3eUxOFDbdPrwFKW+geMq+
 6RufDuLPrGK8SpAaaS+PdGESVjkLgJb31TxCL0C9sMpGo+WZ7Mgp8gWFQlzgcAU8
 Qy/I3vQFZ0SOuVGhyy86i5ovCd+ILh92nLVNHwxfxOSvO7AEv2sg6Jv44wF1llcT
 wl/NksFHKj+rLOf24GGiicTyi1KyAatl2zz4K5u6NHx0JlgP7bzgwgIGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=GJr9Qrw5bSCnVQEj7VhdEcD6zyBfcvSKyI44Pq4WwGs=; b=Lm+ahW0D
 SZ8K026Mms8YNa7Uz2Zh2OHVtmT96BEKvlPuJuHO9HCU2OIHv1jJrTj35ojirF0N
 Ib2dIWgsr4D8TF5BBF3bCbewSSOEbwstU8SrBmxXtwT98XtP/UpwEo7cz5TeK2QS
 PYo5gklB1QF6GLnl1+9LqrTzRFf+zQYdF0XO59VWLlhz3BPllPvuALUWtj1vhZuY
 E2iZIcrEsf6cJYKj91MZ60MTz0PqorOa++FB1wOuoVygFhxKGnswWVsXcRoNUaGB
 0SVyTzHpe+Ye2O22kmvRj7TyvdDxhmG9cCFWIzAxTyqje1Z1zBiJT09CDkFklln2
 ZeMC4dTh1mVBlQ==
X-ME-Sender: <xms:f5iGX5Rb27D6rhXp8rSEx7axAoZK-q6ZWTfMDQxD8mvJabuaBE-zJw>
 <xme:f5iGXywSE266igCrlYDsF5DO61KgKZhZADHOh6n2worC1ZUs9YVzH1vBKTywCe7gf
 C7vM-M3ifcmT9ctwg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedriedtgddutdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
 ugdrohhrgh
X-ME-Proxy: <xmx:f5iGX-2cYuAdmUvL8lq-dOJSi9O4qO3r6hsBzUkQv33P_FaVi6oi1w>
 <xmx:f5iGXxArWZiURHbbmH5aIbZbALb70Mgr4CbBjTJrkQKeuO1TbaNI5w>
 <xmx:f5iGXyh6q8ndWvI8SEcww3HNH2OyC3A5GV4fnisgaW3a0OCSsT_PaA>
 <xmx:f5iGX7WaVvFyEB7KyI_PfmO0jHVfF-gt_C3IsT0PaR5WSwDzuAEeSCB-Gkw>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id C73E8328005E;
 Wed, 14 Oct 2020 02:19:42 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 02/17] ASoC: sun8i-codec: Program DAI format before clock
 inversion
Date: Wed, 14 Oct 2020 01:19:26 -0500
Message-Id: <20201014061941.4306-3-samuel@sholland.org>
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

The LRCK inversion bit has a different meaning in DSP mode: it selects
between the DSP A and DSP B formats. To support this, we need to know if
the selected format is a DSP format. One easy way to do this is to set
the format field before the clock inversion fields.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 46 +++++++++++++++++------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 6413873a0584..53c9289a4249 100644
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

