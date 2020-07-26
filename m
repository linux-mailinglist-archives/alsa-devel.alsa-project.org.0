Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 946C022DB72
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Jul 2020 04:58:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 421F71682;
	Sun, 26 Jul 2020 04:57:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 421F71682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595732296;
	bh=Mf513qq4uV5yDAv0b5IVOSiXpkcHWUGdmpsKK6fefVk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cBUL1uuMSrpEtuhznT+YoA1Q1fGvQKRkEyoBpH61lj3lAnMQ7i8xgUvMF+6KMKSgt
	 zQubZXO+ghpfE/ci472jDyi3hpdf9H2HiaSQj1J0x9l4KZ+7KOyz/78OKeOR89JwmC
	 PwV9zRuZQ9b0g5VqabUF7YrQfQaX33C9bdQnDSHA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D864F802E1;
	Sun, 26 Jul 2020 04:54:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E102FF80256; Sun, 26 Jul 2020 04:53:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 797B1F80227
 for <alsa-devel@alsa-project.org>; Sun, 26 Jul 2020 04:53:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 797B1F80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="WNTqREg2"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="SuQ5Ms0U"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 50F0458050B;
 Sat, 25 Jul 2020 22:53:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sat, 25 Jul 2020 22:53:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=mJuPaeFZ/TtUC
 wF3A6FAm7Kyf5fli2VKl5DI4MtgM7E=; b=WNTqREg2V1HmtJOPrziyiFG10Nzyr
 IH/X0U81dmphQGcSn4/JwMdSTqferhALQlOr+H5Yu7zyRiI+2hrtsvQs13ZAd00E
 pqSSnQ9jhpneaahWSa3bapwe/OEYDetDKy0RMxR4QQQOl6L/v/wwZf/QQ4Lz406K
 XUYZNDl83RpiDKTasC77vgzerLXtiIk6Y2ifMFtURIgvhcNsrE6RfLqusr7I/3oH
 EJyMO4cxAfRK7F8MAhz6TaicQyLVgjU2FrDaTArkE8XyLAfcKmhLmsn0NzK0yIGL
 m9HZsnSjGBrXv2onSu41wZermPlFrKWxKlm2RgG4YN+qGwjioxT+kom0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=mJuPaeFZ/TtUCwF3A6FAm7Kyf5fli2VKl5DI4MtgM7E=; b=SuQ5Ms0U
 i9ozBbJUnIazU6JZ/2zoCAvoYyiJhDTg6bgWd2ugh0fWw3RsgU1TsaDRDkt0UICw
 PCGQ3nONZKPD4XhCG6qnpR6cL09LG9B2AuFGouzVZ9rHHe1S09BNouXNWpFkV27y
 LpY4KFIXssStn5bVvKXAcYYPWFhy7EtRgKKmsksZaFwXbo7kXG8agS+uoNqB1Z0i
 Ja98j2k5dr9azwgi8Hiq2I2mFUsSlk6EuNDimRGNelmPypBlWH+VXTa/PiZ+7HsQ
 VZLZLa54IxDeLio3L9tu7bgcRE8Zvx7pJmNSgdBf7l1XAlcBpCKkgLlwlP8vfI6Y
 iDIsBqweyXDuWg==
X-ME-Sender: <xms:M_AcX7TNm4SmwFX-l60DrJIIQ03UC7muRrmsLB-Ckqvvn7O2QbM8uQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrheeigdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
 grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
 jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
 rdhorhhg
X-ME-Proxy: <xmx:M_AcX8xpDHMvdqSCfdlLtf5tzXmvXmZ_Cifq5xn4W5qCsQohHlHf9w>
 <xmx:M_AcXw2sxoolvxZmJcpu_W4XHsWtDq2IhuHJQSTaP2_jI1VEm1hrtw>
 <xmx:M_AcX7BbCryvX-sM5ZZc2Ev4xRoCTraFxTWNYT29qKQDBNOKFmgL_Q>
 <xmx:M_AcXwj_07HdimxH3-lEYAPYrc5qQC9oFnap59VWldwT7ln-EqXfTA>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id AF3A3328005A;
 Sat, 25 Jul 2020 22:53:38 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v2 8/8] ASoC: sun50i-codec-analog: Enable DAPM for earpiece
 switch
Date: Sat, 25 Jul 2020 21:53:34 -0500
Message-Id: <20200726025334.59931-9-samuel@sholland.org>
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

By including the earpiece mute switch in the DAPM graph, both the
earpiece amplifier and the Mixer/DAC inputs can be powered off when
the earpiece is muted.

While the widget is really just a simple switch, it is represented
as a "mixer with named controls" to avoid including the widget name
in the kcontrol name. Otherwise, it is not possible to give the widget
an accurate, descriptive name without changing the kcontrol name
seen by userspace (which should be stable).

The mute switch is between the source selection and the amplifier,
as per the diagram in the SoC manual.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun50i-codec-analog.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sunxi/sun50i-codec-analog.c b/sound/soc/sunxi/sun50i-codec-analog.c
index 84bb76cad74f..a41e25ad0aaf 100644
--- a/sound/soc/sunxi/sun50i-codec-analog.c
+++ b/sound/soc/sunxi/sun50i-codec-analog.c
@@ -232,11 +232,6 @@ static const struct snd_kcontrol_new sun50i_a64_codec_controls[] = {
 		       SUN50I_ADDA_EARPIECE_CTRL1,
 		       SUN50I_ADDA_EARPIECE_CTRL1_ESP_VOL, 0x1f, 0,
 		       sun50i_codec_earpiece_vol_scale),
-
-	SOC_SINGLE("Earpiece Playback Switch",
-		   SUN50I_ADDA_EARPIECE_CTRL1,
-		   SUN50I_ADDA_EARPIECE_CTRL1_ESPPA_MUTE, 1, 0),
-
 };
 
 static const char * const sun50i_codec_hp_src_enum_text[] = {
@@ -295,6 +290,12 @@ static const struct snd_kcontrol_new sun50i_codec_earpiece_src[] = {
 		      sun50i_codec_earpiece_src_enum),
 };
 
+static const struct snd_kcontrol_new sun50i_codec_earpiece_switch[] = {
+	SOC_DAPM_SINGLE("Earpiece Playback Switch",
+			SUN50I_ADDA_EARPIECE_CTRL1,
+			SUN50I_ADDA_EARPIECE_CTRL1_ESPPA_MUTE, 1, 0),
+};
+
 static const struct snd_soc_dapm_widget sun50i_a64_codec_widgets[] = {
 	/* DAC */
 	SND_SOC_DAPM_DAC("Left DAC", NULL, SUN50I_ADDA_MIX_DAC_CTRL,
@@ -341,6 +342,9 @@ static const struct snd_soc_dapm_widget sun50i_a64_codec_widgets[] = {
 
 	SND_SOC_DAPM_MUX("Earpiece Source Playback Route",
 			 SND_SOC_NOPM, 0, 0, sun50i_codec_earpiece_src),
+	SOC_MIXER_NAMED_CTL_ARRAY("Earpiece Switch",
+				  SND_SOC_NOPM, 0, 0,
+				  sun50i_codec_earpiece_switch),
 	SND_SOC_DAPM_OUT_DRV("Earpiece Amp", SUN50I_ADDA_EARPIECE_CTRL1,
 			     SUN50I_ADDA_EARPIECE_CTRL1_ESPPA_EN, 0, NULL, 0),
 	SND_SOC_DAPM_OUTPUT("EARPIECE"),
@@ -462,7 +466,8 @@ static const struct snd_soc_dapm_route sun50i_a64_codec_routes[] = {
 	{ "Earpiece Source Playback Route", "DACR", "Right DAC" },
 	{ "Earpiece Source Playback Route", "Left Mixer", "Left Mixer" },
 	{ "Earpiece Source Playback Route", "Right Mixer", "Right Mixer" },
-	{ "Earpiece Amp", NULL, "Earpiece Source Playback Route" },
+	{ "Earpiece Switch", "Earpiece Playback Switch", "Earpiece Source Playback Route" },
+	{ "Earpiece Amp", NULL, "Earpiece Switch" },
 	{ "EARPIECE", NULL, "Earpiece Amp" },
 };
 
-- 
2.26.2

