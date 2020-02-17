Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1D9160825
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 03:29:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EF911679;
	Mon, 17 Feb 2020 03:28:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EF911679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581906543;
	bh=1URfFrYMkQ8mMNozULoe4UkACsLkHa3OIRJmd2CBxHo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q2agHEfHiTYfzxP5wzEfOjGdCf4tiourlZGPRuqcHWzXT6ASyhYTmWwX5uzNu3+Wu
	 aS85dJ9jfWbtIjLnY0KwlgEy6Hjsasulus+/cUQ+g0fSSwPjCn2LCR+iY/+fF2xhGr
	 nMc/PeGOmTX0TQ0Upx1j6Rf3sZ7JCaH14RFdGxEk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69B16F8033F;
	Mon, 17 Feb 2020 03:18:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B64CF80337; Mon, 17 Feb 2020 03:18:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB757F80150
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 03:18:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB757F80150
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="QeRTUMZ0"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ZDFixzOL"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 934CA6D42;
 Sun, 16 Feb 2020 21:18:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sun, 16 Feb 2020 21:18:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Hc4JR0Vl78E8a
 ni0afny2xMSor6ZCyoJcVsg+yk/Wis=; b=QeRTUMZ07ZEApmelrmz7vpOmTRFLA
 tI3932e8vmi7MJE7crDUdVfHHub6kT7f5fOBTL4oKGJGCaQX2XaNMA6lrmGRQwSl
 1fzXFFY9fVKZMgzTwOerZuWiECT0lGE8sS03MynXwQS01I45/6NHddpBQlHpPhRe
 9IbXhS+h54oYAdw3XtxgwLenXo0Az3njGiNuJG4/juZyf7MCxNRGMIybIicTjY66
 3OgKKr9HhQ6JX5L5JXfpCEMKNExMczwEtQ3t60uFo46dOI3lRZ8BcRuIozlD5zhv
 AJlDoe3cy7pbjOJ1pEoLi31sxEduSq+8FS9UyliRvGOuuKMwovwlczAcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Hc4JR0Vl78E8ani0afny2xMSor6ZCyoJcVsg+yk/Wis=; b=ZDFixzOL
 kPq4zqwnsiwyDrOzaVrvVo3u/qcvUbBkD7qNQHybrWxtIy9SC69p1a1Vy+5ToT06
 URMvxRDyOm+U4AbHrpTKu+MnlMm+YQ1cIykQ1mDRH6IOosAd8SD6mPj3du5MOwWp
 fLllac5cAKrxbv0E64M7IXOrt/xp4JyDU2vxTI5g7DqV+9ZKaQkWBtGYaETiloso
 HYNxoy1lzCZl+mdH0lYDrjsnkiFlD4ejMmTjEEavJVZvlDrSJ1qVNRMAFwIF39WH
 v1NXapdkjlTb5dLx3RGsIWTifu+RqofW8antvKfQxlQO2/zNenkhDY0rBBXP9Fzh
 GxkLN3azMql1/w==
X-ME-Sender: <xms:6vdJXjj0kCro0mL0AtACyL-ATto5XXVrE48MmDMtGfXPSu5C3Zse9w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeehgdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppe
 ejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:6vdJXhX9k6xXa7mD_nwzVpRdwNIhdBJucoEdanYDj9OZsFfdLQ4a9g>
 <xmx:6vdJXnuk7pAHBMS_3ZcFu9CoFfWe5ChOkzFHvGpSjBd3nscpRC_ZUA>
 <xmx:6vdJXi8yghNBOP7c5NbOsFwQlmHnaYHzOdvaIB1LJBrz5Ze6RDoASQ>
 <xmx:6_dJXj7eRppNl7P-yBTmko10P0b0Wa_CUB0r3WOsB3DibVXNvAHHOg>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id A5D3C3060FDD;
 Sun, 16 Feb 2020 21:18:17 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Luca Weiss <luca@z3ntu.xyz>
Date: Sun, 16 Feb 2020 20:18:12 -0600
Message-Id: <20200217021813.53266-8-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200217021813.53266-1-samuel@sholland.org>
References: <20200217021813.53266-1-samuel@sholland.org>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Samuel Holland <samuel@sholland.org>
Subject: [alsa-devel] [PATCH 7/8] ASoC: sun50i-codec-analog: Enable DAPM for
	line out switch
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

By including the line out mute switch in the DAPM graph, the
Mixer/DAC inputs can be powered off when the line output is muted.

The line outputs have an unusual routing scheme. The left side mute
switch is between the source selection and the amplifier, as usual.
The right side source selection comes *after* its amplifier (and
after the left side amplifier), and its mute switch controls
whichever source is currently selected. This matches the diagram in
the SoC manual.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun50i-codec-analog.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sunxi/sun50i-codec-analog.c b/sound/soc/sunxi/sun50i-codec-analog.c
index df39f6ffe25a..84bb76cad74f 100644
--- a/sound/soc/sunxi/sun50i-codec-analog.c
+++ b/sound/soc/sunxi/sun50i-codec-analog.c
@@ -228,11 +228,6 @@ static const struct snd_kcontrol_new sun50i_a64_codec_controls[] = {
 		       SUN50I_ADDA_LINEOUT_CTRL1_VOL, 0x1f, 0,
 		       sun50i_codec_lineout_vol_scale),
 
-	SOC_DOUBLE("Line Out Playback Switch",
-		   SUN50I_ADDA_LINEOUT_CTRL0,
-		   SUN50I_ADDA_LINEOUT_CTRL0_LEN,
-		   SUN50I_ADDA_LINEOUT_CTRL0_REN, 1, 0),
-
 	SOC_SINGLE_TLV("Earpiece Playback Volume",
 		       SUN50I_ADDA_EARPIECE_CTRL1,
 		       SUN50I_ADDA_EARPIECE_CTRL1_ESP_VOL, 0x1f, 0,
@@ -280,6 +275,12 @@ static const struct snd_kcontrol_new sun50i_codec_lineout_src[] = {
 		      sun50i_codec_lineout_src_enum),
 };
 
+static const struct snd_kcontrol_new sun50i_codec_lineout_switch =
+	SOC_DAPM_DOUBLE("Line Out Playback Switch",
+			SUN50I_ADDA_LINEOUT_CTRL0,
+			SUN50I_ADDA_LINEOUT_CTRL0_LEN,
+			SUN50I_ADDA_LINEOUT_CTRL0_REN, 1, 0);
+
 static const char * const sun50i_codec_earpiece_src_enum_text[] = {
 	"DACR", "DACL", "Right Mixer", "Left Mixer",
 };
@@ -332,6 +333,10 @@ static const struct snd_soc_dapm_widget sun50i_a64_codec_widgets[] = {
 			 SND_SOC_NOPM, 0, 0, sun50i_codec_lineout_src),
 	SND_SOC_DAPM_MUX("Right Line Out Source",
 			 SND_SOC_NOPM, 0, 0, sun50i_codec_lineout_src),
+	SND_SOC_DAPM_SWITCH("Left Line Out Switch",
+			    SND_SOC_NOPM, 0, 0, &sun50i_codec_lineout_switch),
+	SND_SOC_DAPM_SWITCH("Right Line Out Switch",
+			    SND_SOC_NOPM, 0, 0, &sun50i_codec_lineout_switch),
 	SND_SOC_DAPM_OUTPUT("LINEOUT"),
 
 	SND_SOC_DAPM_MUX("Earpiece Source Playback Route",
@@ -444,10 +449,12 @@ static const struct snd_soc_dapm_route sun50i_a64_codec_routes[] = {
 	{ "Left Line Out Source", "Stereo", "Left Mixer" },
 	{ "Left Line Out Source", "Mono Differential", "Left Mixer" },
 	{ "Left Line Out Source", "Mono Differential", "Right Mixer" },
-	{ "LINEOUT", NULL, "Left Line Out Source" },
+	{ "Left Line Out Switch", "Line Out Playback Switch", "Left Line Out Source" },
+	{ "LINEOUT", NULL, "Left Line Out Switch" },
 
-	{ "Right Line Out Source", "Stereo", "Right Mixer" },
-	{ "Right Line Out Source", "Mono Differential", "Left Line Out Source" },
+	{ "Right Line Out Switch", "Line Out Playback Switch", "Right Mixer" },
+	{ "Right Line Out Source", "Stereo", "Right Line Out Switch" },
+	{ "Right Line Out Source", "Mono Differential", "Left Line Out Switch" },
 	{ "LINEOUT", NULL, "Right Line Out Source" },
 
 	/* Earpiece Routes */
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
