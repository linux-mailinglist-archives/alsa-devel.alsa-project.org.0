Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE1322DB73
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Jul 2020 04:58:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEEA3169C;
	Sun, 26 Jul 2020 04:57:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEEA3169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595732329;
	bh=KgvYx79xmWVCL0lhRm4FO9UNiO4V87soEICrnYAG2GE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WmnE+ZxT6ShIRsdUGqBCREtASWyOL/NJJoEsLZ9KTnyvvMbzXiM+n6Y6XgZzBw31t
	 fpCVvgHOFusWirUul7pEDqUMkRl+net9fWi2r3XCFPBU/Pkk5c7w607vNwwYg3nS/H
	 vYY3zPzy5kBcs8B9y2EVwEUH2vj4Qt9DWzeE7UXY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B219F802E2;
	Sun, 26 Jul 2020 04:54:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30D9DF80256; Sun, 26 Jul 2020 04:53:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F75FF800DE
 for <alsa-devel@alsa-project.org>; Sun, 26 Jul 2020 04:53:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F75FF800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="k+91HlrU"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Yz+Vq2vO"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id D2043580507;
 Sat, 25 Jul 2020 22:53:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sat, 25 Jul 2020 22:53:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=MOrJ615q194DX
 kXl1mAThMKZ3keTG/kbxtIiMlFjtUU=; b=k+91HlrUArcRtkNKxwTcpmmHnDGtX
 sSHDnVrZMh3ZNV5DRr5sE5a/IZKpYfaZrDUukT4728qJmWa1k7vAP5rozKWqTfg9
 g1ujvxqiF1NL8PDtIcHkN9Nak2nY9/aBi+4Q7pQwh/97zT+TRTk1KRU1MguzKhwY
 M7JFu6GV/NrGqGD1HIxFmRxrVygD16HgU9VCGV1OX5r6G2hAkZkChA99gpfrYCXF
 iwkLhS52BjxDt4y7WChx/ZO6mHDG2jgUO82VT5D/88p6Iupt7M1fopRbWDoRyI/c
 XDuet38K/GWrLQ1UyfCsl6PjKkfHg0y6kQypgkxrNp0VFYfEz7lj5FJYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=MOrJ615q194DXkXl1mAThMKZ3keTG/kbxtIiMlFjtUU=; b=Yz+Vq2vO
 c2BSM1gIqjHe/iN2Cb2MoKDT/i41WeMYe6dZhOezCRPs/EQ0dOy2KS5njQylr03v
 mYhQEOGUSQJRbYeuJkZqtZcgFCM3jr21zqeDSn8RE8QuwPeSPGV+j3sZ8+yGUJwp
 ZEB61Kw7gABErNQAH+F2H/bV+maKTTTxSYbdov2mlXOPa5a0/+YicDLq0N1trgyH
 V5FlT9dpVUHTxtcpOHt3CwFSw3gJtvspLy9JIKrnWFji1j6G4dF5bA7nSGHvfyn6
 Nyd0ILUcJpK2oYA35lLxKrO2PpCh9BcnuMq0c2H1499zJtK6+ozPp+4yh1f/lRCx
 gBJ8DhFOiIeNNQ==
X-ME-Sender: <xms:MvAcX6Uygu26XKNm1-xaFlxAM90K78nbpojX1IhrphZ67WSdd6sUcw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrheeigdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
 grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
 jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
 rdhorhhg
X-ME-Proxy: <xmx:MvAcX2nqASgxphIm7at3XnLFFWyaPhMpNfLmo_SDzPyDaaDuHSIB5g>
 <xmx:MvAcX-Z8l9_VkGr37qmpMgR_UJf3suBrxniK8RwA-Zr9pQXrnwr01w>
 <xmx:MvAcXxU-oira9iMwhIeTW3odXblmaULPDe1W_nr1zlsW38-_6syhng>
 <xmx:MvAcX-XgTrY_rQPU4goukO5q66FIdWyTmKT2WkO5h951cHYpin--Zw>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3B71A328005E;
 Sat, 25 Jul 2020 22:53:38 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v2 7/8] ASoC: sun50i-codec-analog: Enable DAPM for line out
 switch
Date: Sat, 25 Jul 2020 21:53:33 -0500
Message-Id: <20200726025334.59931-8-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200726025334.59931-1-samuel@sholland.org>
References: <20200726025334.59931-1-samuel@sholland.org>
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

By including the line out mute switch in the DAPM graph, the
Mixer/DAC inputs can be powered off when the line output is muted.

The line outputs have an unusual routing scheme. The left side mute
switch is between the source selection and the amplifier, as usual.
The right side source selection comes *after* its amplifier (and
after the left side amplifier), and its mute switch controls
whichever source is currently selected. This matches the diagram in
the SoC manual.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
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
2.26.2

