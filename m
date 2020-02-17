Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F6F160823
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 03:27:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1250169F;
	Mon, 17 Feb 2020 03:27:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1250169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581906474;
	bh=twrsQEKABw6T8Hu2PGeHplq5YOg4j4R9D1rwybWK6yw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uuSH5aXZ8lQrdRJ11o1Q5RxxBYt6jDvvroW3huhbmvre4IcJhZMahcAZh0LqlVCa6
	 YDA9xHysTGIB1WdbEhI60qgOiyMyr4M/hQI/n0LppYje5vf0LBObBCSlnwfQ16S5Yh
	 iUajS2N/FPywk3ZbhSebYFrPd8V+hQx1o4XZbZhA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2E63F80278;
	Mon, 17 Feb 2020 03:18:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FEC4F80276; Mon, 17 Feb 2020 03:18:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CEE0EF8015C
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 03:18:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEE0EF8015C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="kXVdPznz"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="4B7ifKsN"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9553E6D4D;
 Sun, 16 Feb 2020 21:18:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sun, 16 Feb 2020 21:18:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=TvxGeKL95DUEQ
 FtJT5t25lbcU/132qB0xo3CocqSt+0=; b=kXVdPznzFcExN/SIIPqeU92BqSWcu
 fYcOm++/hOCmqc6VKvjM33Hn5n8SZmnZt9V0KTuZz85eyA+lBGEBcZ05pgjyYba/
 waAAbfqp3BhAPx6Cj2hLONRkfpCu3TeGhnZ+wqmA5oSIQyc8iulyJ8fZO909d5a8
 6l4aLHwOKPqV0HJauTuBRP/gTaG+NX1ePj1VVg/1zLR9BjiDahE/U8c8zhzbztGA
 8PdMERYSPU9sxBaVMPTED2JqxxkhGpVIDkd3jIG+XWNoqALLWnD52InSvmm8hFla
 Pu7y+Jl8ACPeBFeYsgIuiRi4zbmNqso+m/xC66KERzfAfbC617jbtRlIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=TvxGeKL95DUEQFtJT5t25lbcU/132qB0xo3CocqSt+0=; b=4B7ifKsN
 cTwfcy6VdxhutWRlhezhN1oOucwG+gGhJnIWjh4r1by44ClPxsuJZawvnL/GRzLx
 0P6HrZkug2ve8/YfgBaY8QG2J+i9pOAYX4WRpTNfEW818RkYWaPI5+E5beCcO9R6
 AJkAfp8rhCDIQqYqALRn2dCPmk0feudn6V5ZVTDqalZvI+1jTKJQTjIUfAZbkLGl
 2imNbes9Wn4VNBC2YluxjzjMjoyiBRqkE2fKB6uugeNprBY9j+ZNCgvDpgbi/vCn
 0FoEqeNiCyjQjZop8EIToLgO8U5Ozf3e2EX9Y/XX67+ln4MfQpbNZxhhnUsIMqAM
 DQUvz5Hz0nUCHA==
X-ME-Sender: <xms:6fdJXjkenJjPYb3qXX8a0yR3oCLWn8rrTYi1W8l0x21IFXdHi8sfXg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeehgdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppe
 ejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:6fdJXrEJUSmW8QlETiSnzzB3uuXI7TuvGLi6PUYlhTLIsLoQ9Z_Q0A>
 <xmx:6fdJXkoTDZWj53ml9iosylnncLSWGUQJZkvovKRMNsWqqwnn3RBb5w>
 <xmx:6fdJXv67HDkgq7Ox36kt3f2hBKw08N3zMkePhE8N0fAOiE-oJAVOjw>
 <xmx:6_dJXmX5XRlb6Zdz5tC8ZxP3gv-EVHrwLxYJ3IFSpRZ2iTPflDoK7g>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id A58203060F9B;
 Sun, 16 Feb 2020 21:18:16 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Luca Weiss <luca@z3ntu.xyz>
Date: Sun, 16 Feb 2020 20:18:10 -0600
Message-Id: <20200217021813.53266-6-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200217021813.53266-1-samuel@sholland.org>
References: <20200217021813.53266-1-samuel@sholland.org>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Samuel Holland <samuel@sholland.org>
Subject: [alsa-devel] [PATCH 5/8] ASoC: sun50i-codec-analog: Enable DAPM for
	headphone switch
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

By including the headphone mute switch to the DAPM graph, both the
headphone amplifier and the Mixer/DAC inputs can be powered off when
the headphones are muted.

The mute switch is between the source selection and the amplifier,
as per the diagram in the SoC manual.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun50i-codec-analog.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sunxi/sun50i-codec-analog.c b/sound/soc/sunxi/sun50i-codec-analog.c
index f98851067f97..176d6658d099 100644
--- a/sound/soc/sunxi/sun50i-codec-analog.c
+++ b/sound/soc/sunxi/sun50i-codec-analog.c
@@ -193,11 +193,6 @@ static const struct snd_kcontrol_new sun50i_a64_codec_controls[] = {
 		       SUN50I_ADDA_HP_CTRL_HPVOL, 0x3f, 0,
 		       sun50i_codec_hp_vol_scale),
 
-	SOC_DOUBLE("Headphone Playback Switch",
-		   SUN50I_ADDA_MIX_DAC_CTRL,
-		   SUN50I_ADDA_MIX_DAC_CTRL_LHPPAMUTE,
-		   SUN50I_ADDA_MIX_DAC_CTRL_RHPPAMUTE, 1, 0),
-
 	/* Mixer pre-gain */
 	SOC_SINGLE_TLV("Mic1 Playback Volume", SUN50I_ADDA_MIC1_CTRL,
 		       SUN50I_ADDA_MIC1_CTRL_MIC1G,
@@ -264,6 +259,12 @@ static const struct snd_kcontrol_new sun50i_codec_hp_src[] = {
 		      sun50i_codec_hp_src_enum),
 };
 
+static const struct snd_kcontrol_new sun50i_codec_hp_switch =
+	SOC_DAPM_DOUBLE("Headphone Playback Switch",
+			SUN50I_ADDA_MIX_DAC_CTRL,
+			SUN50I_ADDA_MIX_DAC_CTRL_LHPPAMUTE,
+			SUN50I_ADDA_MIX_DAC_CTRL_RHPPAMUTE, 1, 0);
+
 static const char * const sun50i_codec_lineout_src_enum_text[] = {
 	"Stereo", "Mono Differential",
 };
@@ -315,6 +316,10 @@ static const struct snd_soc_dapm_widget sun50i_a64_codec_widgets[] = {
 			 SND_SOC_NOPM, 0, 0, sun50i_codec_hp_src),
 	SND_SOC_DAPM_MUX("Right Headphone Source",
 			 SND_SOC_NOPM, 0, 0, sun50i_codec_hp_src),
+	SND_SOC_DAPM_SWITCH("Left Headphone Switch",
+			    SND_SOC_NOPM, 0, 0, &sun50i_codec_hp_switch),
+	SND_SOC_DAPM_SWITCH("Right Headphone Switch",
+			    SND_SOC_NOPM, 0, 0, &sun50i_codec_hp_switch),
 	SND_SOC_DAPM_OUT_DRV("Left Headphone Amp",
 			     SND_SOC_NOPM, 0, 0, NULL, 0),
 	SND_SOC_DAPM_OUT_DRV("Right Headphone Amp",
@@ -413,13 +418,15 @@ static const struct snd_soc_dapm_route sun50i_a64_codec_routes[] = {
 	/* Headphone Routes */
 	{ "Left Headphone Source", "DAC", "Left DAC" },
 	{ "Left Headphone Source", "Mixer", "Left Mixer" },
-	{ "Left Headphone Amp", NULL, "Left Headphone Source" },
+	{ "Left Headphone Switch", "Headphone Playback Switch", "Left Headphone Source" },
+	{ "Left Headphone Amp", NULL, "Left Headphone Switch" },
 	{ "Left Headphone Amp", NULL, "Headphone Amp" },
 	{ "HP", NULL, "Left Headphone Amp" },
 
 	{ "Right Headphone Source", "DAC", "Right DAC" },
 	{ "Right Headphone Source", "Mixer", "Right Mixer" },
-	{ "Right Headphone Amp", NULL, "Right Headphone Source" },
+	{ "Right Headphone Switch", "Headphone Playback Switch", "Right Headphone Source" },
+	{ "Right Headphone Amp", NULL, "Right Headphone Switch" },
 	{ "Right Headphone Amp", NULL, "Headphone Amp" },
 	{ "HP", NULL, "Right Headphone Amp" },
 
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
