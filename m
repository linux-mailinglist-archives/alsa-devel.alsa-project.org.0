Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DC35F89F
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2019 14:56:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFE7216B4;
	Thu,  4 Jul 2019 14:55:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFE7216B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562244989;
	bh=3GAd4IqgdyJDMYZ0Lq5ifU2/YElQhV3dxooRtFSCYSI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qFnDcFJ4SGwI2+Eoigmy0rVr3Ne7z/4/GG+brK00ecvpM7e824DIxaiFSw4bZXOim
	 fIrOqrukdW3u0e4WdDRg3mZHnFoHYgXq/QvBJ/yfOQL+htT2kLZszc6jRGOpq5E2pB
	 f0KO+GS0DhBBxucLNm8+neBj/TzZEpdMjSql8cGI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 418E6F80111;
	Thu,  4 Jul 2019 14:54:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96957F800C9; Tue,  2 Jul 2019 21:17:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
 by alsa1.perex.cz (Postfix) with ESMTP id 1297DF800C5
 for <alsa-devel@alsa-project.org>; Tue,  2 Jul 2019 21:17:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1297DF800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz
 header.b="BRAP3Wus"
Received: from localhost.localdomain (80-110-121-20.cgn.dynamic.surfer.at
 [80.110.121.20])
 by mail.z3ntu.xyz (Postfix) with ESMTPSA id 8C205C17FF;
 Tue,  2 Jul 2019 19:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
 t=1562095044; bh=LdmS3OrP/bxdcMJGIVgeCmZ4Bf2uPWVpuLOJwOPC3Dw=;
 h=From:To:Cc:Subject:Date;
 b=BRAP3WusRqPGjDGJhJFN5WgvTVSnPJVrugFixO2C+d30SdpQDZh6FOVS3TJHJMQ8K
 jGaZ8Vr1Xg5KDyjp6zrvCEC9FxXUyX7rfM/khSqZNbZKBd4ReWLj/keej5XoamEbN8
 kH5L3VY/TeopDnPgHiRctetd4hagP0nR68glOi1g=
From: Luca Weiss <luca@z3ntu.xyz>
To: alsa-devel@alsa-project.org
Date: Tue,  2 Jul 2019 21:16:09 +0200
Message-Id: <20190702191613.11084-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 04 Jul 2019 14:54:42 +0200
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 ~martijnbraam/pmos-upstream@lists.sr.ht, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Luca Weiss <luca@z3ntu.xyz>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH] ASoC: sunxi: sun50i-codec-analog: Add earpiece
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

This adds the necessary registers and audio routes to play audio using
the Earpiece, that's supported on the A64.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
So, first of all: This is my first audio patch and I hope I didn't make
too many mistakes :) , especially with the routes at the bottom of
the patch.

What I'm really unsure about, is how the enable & mute registers should
be handled. Should I put both registers into a SOC_DOUBLE("Earpiece
Playback Switch",...)?

 sound/soc/sunxi/sun50i-codec-analog.c | 51 +++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/sound/soc/sunxi/sun50i-codec-analog.c b/sound/soc/sunxi/sun50i-codec-analog.c
index d105c90c3706..6c19fea992c5 100644
--- a/sound/soc/sunxi/sun50i-codec-analog.c
+++ b/sound/soc/sunxi/sun50i-codec-analog.c
@@ -49,6 +49,15 @@
 #define SUN50I_ADDA_OR_MIX_CTRL_DACR		1
 #define SUN50I_ADDA_OR_MIX_CTRL_DACL		0
 
+#define SUN50I_ADDA_EARPIECE_CTRL0	0x03
+#define SUN50I_ADDA_EARPIECE_CTRL0_EAR_RAMP_TIME	4
+#define SUN50I_ADDA_EARPIECE_CTRL0_ESPSR		0
+
+#define SUN50I_ADDA_EARPIECE_CTRL1	0x04
+#define SUN50I_ADDA_EARPIECE_CTRL1_ESPPA_EN	7
+#define SUN50I_ADDA_EARPIECE_CTRL1_ESPPA_MUTE	6
+#define SUN50I_ADDA_EARPIECE_CTRL1_ESP_VOL	0
+
 #define SUN50I_ADDA_LINEOUT_CTRL0	0x05
 #define SUN50I_ADDA_LINEOUT_CTRL0_LEN		7
 #define SUN50I_ADDA_LINEOUT_CTRL0_REN		6
@@ -172,6 +181,10 @@ static const DECLARE_TLV_DB_RANGE(sun50i_codec_lineout_vol_scale,
 	2, 31, TLV_DB_SCALE_ITEM(-4350, 150, 0),
 );
 
+static const DECLARE_TLV_DB_RANGE(sun50i_codec_earpiece_vol_scale,
+	0, 1, TLV_DB_SCALE_ITEM(TLV_DB_GAIN_MUTE, 0, 1),
+	2, 31, TLV_DB_SCALE_ITEM(-4350, 150, 0),
+);
 
 /* volume / mute controls */
 static const struct snd_kcontrol_new sun50i_a64_codec_controls[] = {
@@ -225,6 +238,19 @@ static const struct snd_kcontrol_new sun50i_a64_codec_controls[] = {
 		   SUN50I_ADDA_LINEOUT_CTRL0_LEN,
 		   SUN50I_ADDA_LINEOUT_CTRL0_REN, 1, 0),
 
+	SOC_SINGLE_TLV("Earpiece Playback Volume",
+		       SUN50I_ADDA_EARPIECE_CTRL1,
+		       SUN50I_ADDA_EARPIECE_CTRL1_ESP_VOL, 0x1f, 0,
+		       sun50i_codec_earpiece_vol_scale),
+
+	SOC_SINGLE("Earpiece Playback Switch (enable)",
+		   SUN50I_ADDA_EARPIECE_CTRL1,
+		   SUN50I_ADDA_EARPIECE_CTRL1_ESPPA_EN, 1, 0),
+
+	SOC_SINGLE("Earpiece Playback Switch",
+		   SUN50I_ADDA_EARPIECE_CTRL1,
+		   SUN50I_ADDA_EARPIECE_CTRL1_ESPPA_MUTE, 1, 0),
+
 };
 
 static const char * const sun50i_codec_hp_src_enum_text[] = {
@@ -257,6 +283,20 @@ static const struct snd_kcontrol_new sun50i_codec_lineout_src[] = {
 		      sun50i_codec_lineout_src_enum),
 };
 
+static const char * const sun50i_codec_earpiece_src_enum_text[] = {
+	"DACR", "DACL", "Right Analog Mixer", "Left Analog Mixer",
+};
+
+static SOC_ENUM_SINGLE_DECL(sun50i_codec_earpiece_src_enum,
+			    SUN50I_ADDA_EARPIECE_CTRL0,
+			    SUN50I_ADDA_EARPIECE_CTRL0_ESPSR,
+			    sun50i_codec_earpiece_src_enum_text);
+
+static const struct snd_kcontrol_new sun50i_codec_earpiece_src[] = {
+	SOC_DAPM_ENUM("Earpiece Source Playback Route",
+		      sun50i_codec_earpiece_src_enum),
+};
+
 static const struct snd_soc_dapm_widget sun50i_a64_codec_widgets[] = {
 	/* DAC */
 	SND_SOC_DAPM_DAC("Left DAC", NULL, SUN50I_ADDA_MIX_DAC_CTRL,
@@ -285,6 +325,10 @@ static const struct snd_soc_dapm_widget sun50i_a64_codec_widgets[] = {
 			 SND_SOC_NOPM, 0, 0, sun50i_codec_lineout_src),
 	SND_SOC_DAPM_OUTPUT("LINEOUT"),
 
+	SND_SOC_DAPM_MUX("Earpiece Source Playback Route",
+			 SND_SOC_NOPM, 0, 0, sun50i_codec_earpiece_src),
+	SND_SOC_DAPM_OUTPUT("EARPIECE"),
+
 	/* Microphone inputs */
 	SND_SOC_DAPM_INPUT("MIC1"),
 
@@ -388,6 +432,13 @@ static const struct snd_soc_dapm_route sun50i_a64_codec_routes[] = {
 	{ "Line Out Source Playback Route", "Mono Differential",
 		"Right Mixer" },
 	{ "LINEOUT", NULL, "Line Out Source Playback Route" },
+
+	/* Earpiece Routes */
+	{ "Earpiece Source Playback Route", "DACL", "Left DAC" },
+	{ "Earpiece Source Playback Route", "DACR", "Right DAC" },
+	{ "Earpiece Source Playback Route", "Left Analog Mixer", "Left Mixer" },
+	{ "Earpiece Source Playback Route", "Right Analog Mixer", "Right Mixer" },
+	{ "EARPIECE", NULL, "Earpiece Source Playback Route" },
 };
 
 static const struct snd_soc_component_driver sun50i_codec_analog_cmpnt_drv = {
-- 
2.22.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
