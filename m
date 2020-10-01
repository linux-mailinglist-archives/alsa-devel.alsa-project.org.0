Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F35A527F7E6
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 04:17:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8227817CE;
	Thu,  1 Oct 2020 04:17:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8227817CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601518679;
	bh=BUpjoEE8jsmjqob4dVOwZi8FqX0y2wUZyF+0+BMt308=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KDK+shH8PnFF2cn1Id4UNCGmdnNzGT/v8X2BDj7OyF4woiASwuT44GCQagmaRt3Zc
	 U6nTqShEPcH8W+FU8FXB2c5zTF8l4Hrq+DHq74C+GJzZJfxQ7vHBXeYYFPPhtHj+/G
	 GzKcsBhf00UTDj2lpF4qfUqCQVHHtXouMLD2Jz+c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5531F802E1;
	Thu,  1 Oct 2020 04:12:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55735F80328; Thu,  1 Oct 2020 04:12:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0240F80273
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 04:11:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0240F80273
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="CCC8KhxY"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="MS/NrYrr"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 67021580284;
 Wed, 30 Sep 2020 22:11:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 30 Sep 2020 22:11:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=Sm5u7CMOgbrIx
 C1iyJeUaxfEc37bLjTcg3iQXcDbUIE=; b=CCC8KhxYP31G9lXee7yhZgqNndMbE
 uZnxL98Im/S4OauEv+IT+YK6CnLvWyeQYaQ8ASfMnRoOWhbpjjiMpSZltGm+wmG5
 wuQ7+fu8Zx0SNlSrsVGAyHlGCR0AWOygyeNIHxjjH3U2zEycwTVG1/QtAcQAfkYa
 D6UV6F+H7/UT4rbTJgDPuqbPLLT2m7a2g7zNJDId5TAjwBa8EG13jyYpBoMRiHZu
 1YBYN8MIkY4wXOHVPMqzTLc29q2u5aPFZerY1ZRj7H5Cy9ClCntV8+xXGoFuqUL4
 vnaiCLl+BQljdDEs4QCnPeS6Polm9GKnITGWjPJgBFRSoUpdH8hb2xDsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=Sm5u7CMOgbrIxC1iyJeUaxfEc37bLjTcg3iQXcDbUIE=; b=MS/NrYrr
 i9ILnigednY9YVqzkZs7/KK//3nSSe+4sWlEd3AdNTIdYbdS5Kp+aOP1vUnpzGau
 Zyt9KlFpomKphi4Il+8E4NZP1W018qLiK7MYSauOKTebYDsyLzeFMajUBqh+U997
 FwNAv0r8iE9EP/PeA4HwtoHjjb1ZfHegVpGIcq91GDF600gXIEQ3CFGh816Vypr1
 tlBmRuBVLKKcuX2DGK4GzSGbEQJ4g55fLRZZ0Iy2Iz1BihupYTa2OQw2SifPa5Pa
 br8XQR2qSkvEFT4s+iBq3WlU5DECHfIYz+yCIURV5LAESPGjmKC8nVEUtj8jpSjn
 xUtgY2A05fKlrA==
X-ME-Sender: <xms:6Dp1X33jNWQDDtH62y8leBIguHGSjoUBZu4QSYIKr8q36Eq_tKMi7A>
 <xme:6Dp1X2FGhnr3FSjveDXsRrT-7Q6BvOLaWwJfeU7EeNFMn7y51XJad1FP2fVeMQPas
 i0YJJra1zmc6ss5bw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeefgdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
 grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
 jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
 gvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
 rdhorhhg
X-ME-Proxy: <xmx:6Dp1X351M8VTP2Qtj7TEVH0NIXseHS0qK32tD7eXqwxnVMK9X0nI_g>
 <xmx:6Dp1X82mgwu6SyC40P8Z6zqFZBlrIdqZYtee4SAjcZSV2bQcfZEZeA>
 <xmx:6Dp1X6H3KfblxsyA9B-IinOn1bJDStUnURca8nW4V0x0ToSTEU7fkw>
 <xmx:6Dp1X4a5wi09f-jQi6Irk1YpWkGYAr0RR8LzqlC9JeMFaHgqqroO0g>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id ABE1A3064680;
 Wed, 30 Sep 2020 22:11:51 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 05/25] ASoC: sun8i-codec: Correct DAPM widget types
Date: Wed, 30 Sep 2020 21:11:28 -0500
Message-Id: <20201001021148.15852-6-samuel@sholland.org>
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

Whie the aif_in and aif_out widget types are handled exactly the same in
the core DAPM code, a future widget event hook will need the correct
widget type to derive the associated substream. Clean up the widget type
for that reason, and so these widgets will match newly-added widgets for
the other AIFs.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 30fe27648254..d0028883950c 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -405,22 +405,22 @@ static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
 	SND_SOC_DAPM_SUPPLY("ADC",
 			    SUN8I_ADC_DIG_CTRL,
 			    SUN8I_ADC_DIG_CTRL_ENAD, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("DAC",
 			    SUN8I_DAC_DIG_CTRL,
 			    SUN8I_DAC_DIG_CTRL_ENDA, 0, NULL, 0),
 
 	/* AIF "ADC" Outputs */
-	SND_SOC_DAPM_AIF_IN("AIF1 AD0L", "Capture", 0,
-			    SUN8I_AIF1_ADCDAT_CTRL,
-			    SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0L_ENA, 0),
-	SND_SOC_DAPM_AIF_IN("AIF1 AD0R", "Capture", 0,
-			    SUN8I_AIF1_ADCDAT_CTRL,
-			    SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0R_ENA, 0),
+	SND_SOC_DAPM_AIF_OUT("AIF1 AD0L", "Capture", 0,
+			     SUN8I_AIF1_ADCDAT_CTRL,
+			     SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0L_ENA, 0),
+	SND_SOC_DAPM_AIF_OUT("AIF1 AD0R", "Capture", 0,
+			     SUN8I_AIF1_ADCDAT_CTRL,
+			     SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0R_ENA, 0),
 
 	/* AIF "ADC" Mixers */
 	SOC_MIXER_ARRAY("AIF1 AD0L Mixer", SND_SOC_NOPM, 0, 0,
 			sun8i_aif1_ad0_mixer_controls),
 	SOC_MIXER_ARRAY("AIF1 AD0R Mixer", SND_SOC_NOPM, 0, 0,
 			sun8i_aif1_ad0_mixer_controls),
 
 	/* AIF "DAC" Inputs */
-- 
2.26.2

