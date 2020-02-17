Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB0E16082E
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 03:30:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4603E1696;
	Mon, 17 Feb 2020 03:29:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4603E1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581906620;
	bh=+DaA+S2u4DR5d7fjq5jMBbATIbCWvRwoPp4jfno+VIU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GA16u+viuleDzEYGq492P2G60YXdLbjNG8+ICQjJ57m3dg9Q7mB0/W7TLRmLzqdQW
	 XKVFqCLZFBJups23dcr5nEmUqmthYBswPx8eOQjHq/kk5FJpwGYlxV00gdZfNs/H9f
	 rXsdMPfUsr1coJJhkUWyXEE2inzSKbKOuk4VWXpo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25543F80345;
	Mon, 17 Feb 2020 03:18:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E9D7F8015D; Mon, 17 Feb 2020 03:18:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4AE9F8015D
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 03:18:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4AE9F8015D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="AZYvXl5G"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Pz0iBWso"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 963FD6D60;
 Sun, 16 Feb 2020 21:18:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sun, 16 Feb 2020 21:18:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Xta2m6BWLN6wl
 eLae8H583Fhi6IaoW1biWy4wEHuQao=; b=AZYvXl5GzgNzpH5ntiIxRyMoMXf2t
 VGIKhCZOPhequCvRRQcGJIEPeVdonyoPNNf/HuFP2/RURpqerVp9nGxFG3Khl/Lc
 KFRdydKNUeI9xRSP5ybI1YK/1xQy2SdY17PHBROgpxMqzWMW21dQYbUY1KAqjNvE
 qZ9JMXkdtUIb719bu6KVfZZ+OPpMwL30GWTUVxlYzA7ga6HEo/OodRlfe9Ae6Pbv
 Lg4vPuRFD94t0LTOKxtWgX2yW6YxZs3H/8xDYqlBUhIv+ge9cdEqxWzw2lzK0ZrB
 CHBKMYK4PTSwok9VqchP6lLs0ZzAOeTuLgqp2L3clD0DfaWyCvp0OfDow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Xta2m6BWLN6wleLae8H583Fhi6IaoW1biWy4wEHuQao=; b=Pz0iBWso
 EKdiVL1QP34f55SzauLNu3+49uh04u+P/sCZJj4TdXg1XHt9Vtm1bO9pye7Gw8/t
 ify+l1xQnAFio0c0Z0K6QlGZdg9EJizCRuhlcyUNuy+FYc+RE6Jlox6GLJDgYSes
 cTwRvbtx2PWfxPljGaA+WWAGcT4KO3e94wQWHAlAy1mpBXGzzLFs9SatXSl3zC7n
 nZzY+be8cBTmoYwGXAT+6V2e+16IHPpkneH2u78YFEyAC69U7buTyhIdn52jhy6b
 VeMRmbxt9jFwbXljrNAY4gf2BmduQeujHvoq4I0TTfPgmS4Ovb+VwXWQAWCUS4OD
 wvDtN51blwRtgg==
X-ME-Sender: <xms:6PdJXgavXM386504ZcSySNlzSlNSS4CschW1e3VdGpQUcVF7boI_6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeehgdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppe
 ejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:6PdJXnQp-4tvATdtBMhROemLi7clmN6_PlUQ-Grvwv0gWUma6PtPNQ>
 <xmx:6PdJXjzv-oGEQSx7tRhBykyyUpYl4Ac6jww1_OuqwpyppNi1j6JnFQ>
 <xmx:6PdJXjcX4CzOh1Rm80bJ0iozCwY1slfmZlFC2t3VEEmSbERcWpjdAw>
 <xmx:6_dJXjuG6z4c-MnFfD3NmWFoWQEK8VxGWotgFN3ZijGj9D8Gpuja4Q>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2CE543060FCB;
 Sun, 16 Feb 2020 21:18:16 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Luca Weiss <luca@z3ntu.xyz>
Date: Sun, 16 Feb 2020 20:18:09 -0600
Message-Id: <20200217021813.53266-5-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200217021813.53266-1-samuel@sholland.org>
References: <20200217021813.53266-1-samuel@sholland.org>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Samuel Holland <samuel@sholland.org>
Subject: [alsa-devel] [PATCH 4/8] ASoC: sun50i-codec-analog: Make headphone
	routes stereo
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

This matches the hardware more accurately, and is necessary for
including the (stereo) headphone mute switch in the DAPM graph.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun50i-codec-analog.c | 28 +++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sunxi/sun50i-codec-analog.c b/sound/soc/sunxi/sun50i-codec-analog.c
index 17165f1ddb63..f98851067f97 100644
--- a/sound/soc/sunxi/sun50i-codec-analog.c
+++ b/sound/soc/sunxi/sun50i-codec-analog.c
@@ -311,9 +311,15 @@ static const struct snd_soc_dapm_widget sun50i_a64_codec_widgets[] = {
 	 */
 
 	SND_SOC_DAPM_REGULATOR_SUPPLY("cpvdd", 0, 0),
-	SND_SOC_DAPM_MUX("Headphone Source Playback Route",
+	SND_SOC_DAPM_MUX("Left Headphone Source",
 			 SND_SOC_NOPM, 0, 0, sun50i_codec_hp_src),
-	SND_SOC_DAPM_OUT_DRV("Headphone Amp", SUN50I_ADDA_HP_CTRL,
+	SND_SOC_DAPM_MUX("Right Headphone Source",
+			 SND_SOC_NOPM, 0, 0, sun50i_codec_hp_src),
+	SND_SOC_DAPM_OUT_DRV("Left Headphone Amp",
+			     SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_OUT_DRV("Right Headphone Amp",
+			     SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("Headphone Amp", SUN50I_ADDA_HP_CTRL,
 			     SUN50I_ADDA_HP_CTRL_HPPA_EN, 0, NULL, 0),
 	SND_SOC_DAPM_OUTPUT("HP"),
 
@@ -405,13 +411,19 @@ static const struct snd_soc_dapm_route sun50i_a64_codec_routes[] = {
 	{ "Right ADC", NULL, "Right ADC Mixer" },
 
 	/* Headphone Routes */
-	{ "Headphone Source Playback Route", "DAC", "Left DAC" },
-	{ "Headphone Source Playback Route", "DAC", "Right DAC" },
-	{ "Headphone Source Playback Route", "Mixer", "Left Mixer" },
-	{ "Headphone Source Playback Route", "Mixer", "Right Mixer" },
-	{ "Headphone Amp", NULL, "Headphone Source Playback Route" },
+	{ "Left Headphone Source", "DAC", "Left DAC" },
+	{ "Left Headphone Source", "Mixer", "Left Mixer" },
+	{ "Left Headphone Amp", NULL, "Left Headphone Source" },
+	{ "Left Headphone Amp", NULL, "Headphone Amp" },
+	{ "HP", NULL, "Left Headphone Amp" },
+
+	{ "Right Headphone Source", "DAC", "Right DAC" },
+	{ "Right Headphone Source", "Mixer", "Right Mixer" },
+	{ "Right Headphone Amp", NULL, "Right Headphone Source" },
+	{ "Right Headphone Amp", NULL, "Headphone Amp" },
+	{ "HP", NULL, "Right Headphone Amp" },
+
 	{ "Headphone Amp", NULL, "cpvdd" },
-	{ "HP", NULL, "Headphone Amp" },
 
 	/* Microphone Routes */
 	{ "Mic1 Amplifier", NULL, "MIC1"},
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
