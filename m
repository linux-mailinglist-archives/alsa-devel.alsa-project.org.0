Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C7922DB6E
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Jul 2020 04:56:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91EB21698;
	Sun, 26 Jul 2020 04:55:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91EB21698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595732175;
	bh=CMBpmTeQtOqRjQ5RNPf3pVPdb8PMX/csHTzoYKweOhQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SeRhjhmMfKEgRnzCpvQMvnmeOX9I02CGIZIBIUFjHZlq6M/iSQjvR4yUdaiGKPaIO
	 XHAH+5akVrwHM6B18XdTr09zgD4p019fvvUs3SoqAsIrm5eaQkaWjTY7rtU6Nf9twR
	 Yj+EkWtlmaHHzDh2nUZgqlKzQhXUqp+7TJLzg+Ks=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35194F802BD;
	Sun, 26 Jul 2020 04:53:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44951F802BE; Sun, 26 Jul 2020 04:53:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFCACF8021E
 for <alsa-devel@alsa-project.org>; Sun, 26 Jul 2020 04:53:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFCACF8021E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="UPc74rNY"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="bIvw+fvT"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 634E85804FE;
 Sat, 25 Jul 2020 22:53:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sat, 25 Jul 2020 22:53:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=o4vewBk05R45o
 M+OvTaQj/HGmu35Pzpji2XDJh8Je4Y=; b=UPc74rNYonRFihpEhI/SoPPoE2OLf
 3AOMXp57DIeOVPYCX1WlM6gRAbVqx482EFpKwuLQnkEPg1Q8sCLVh6wBtvL1IX7p
 8CbK2M9oTbaKvPYj8ihWdZJDDtH6Hv16i3JKDz6EYQ6ZTWsPNo7UO915I2Ipasl8
 8coU1Md4Vs4WaF8FhUbDYPCp7TjxxKD/DLzAyweVtvD6QWYnT0dBL9VG5MD5AXPk
 rcwfDN/NphKNy7elFheXhBe8mL8dr6WXk3qxB0wMqIyFqNVbl0bkRz01QfFsipxA
 CF4C3uKShZwtGQkkH4Z4HkmklBe47fVwZ65kg8Bn79dpop7UymuuAMH+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=o4vewBk05R45oM+OvTaQj/HGmu35Pzpji2XDJh8Je4Y=; b=bIvw+fvT
 AVF01DPo42q4U6Z1YHQipuXJnLaKpINLoBkHu9xurylnZ3lf1hMsJSgRgWi4HHQ0
 2zUz+DdJ3kMjdePz+Roc1526vPYlW1oQbAfnT2oAJmWiIk2GXvqgkvtmK6tHEPMi
 9CQYp5O0R/ZjStagw6nj8kqe00hKokFHHLCeZBmqeufBXXLOxgN5MZSC2cDsKS/U
 oELJu8UepEySMo0I3Qu7TC2gcvYoZ3IN60qJKvPN01wqEn8hAvQ2GdpfeNGzZoq/
 WZfQWHb8WWn74+bRCcDGM/RxYOtDRz7XReBNZ32oj8ZYc/+Julj0xLlgH7+hiUUF
 jBq8+tPG5T7yvg==
X-ME-Sender: <xms:MfAcX5MXasn16JIcM4KEI_ovjZw-Wu3Fz1zHGNQUkkmccC93jp6n4Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrheeigdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
 grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
 jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
 rdhorhhg
X-ME-Proxy: <xmx:MfAcX7831JAwFG5oi6PRXaNtG3NV3hrkzo1aMnn2oFHstkrSLtx0vw>
 <xmx:MfAcX4Su5VHXbtv8y43oph__249XTC9PPBdcVTcQDu1JJemabgvo9w>
 <xmx:MfAcX1tSKdhcZatclbPDREhdkeeEmOVfRZPtW2NzAsca-X7Dpvq7pA>
 <xmx:MfAcX7svR0O5hB8tv9GJHLAH9qVg6dsKCT1o8dzmAWMLExLjYD11iQ>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id C357C328005A;
 Sat, 25 Jul 2020 22:53:36 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v2 4/8] ASoC: sun50i-codec-analog: Make headphone routes stereo
Date: Sat, 25 Jul 2020 21:53:30 -0500
Message-Id: <20200726025334.59931-5-samuel@sholland.org>
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

This matches the hardware more accurately, and is necessary for
including the (stereo) headphone mute switch in the DAPM graph.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
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
2.26.2

