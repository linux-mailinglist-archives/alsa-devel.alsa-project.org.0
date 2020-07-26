Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 172CB22DB77
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Jul 2020 04:59:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B38431660;
	Sun, 26 Jul 2020 04:59:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B38431660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595732396;
	bh=6tnB6oJgj6Fu2Ca8YEaAlbtrA6l3q+cPDW9zopfo1cU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tq/8f6fM4JMxOhAV5B4bFVfitXqWY/eYNXgqBOxmoOfUE6ncCak/Z7HNcCo/OivLe
	 VgfzCPdu8SDvuJxYV79/ukgIF6kpOAfmkkIr23R/jQCuzISZRApzm6qJXRhQHWAExG
	 2Z8cf5ic01DgO4jnydobW/0cnueGyyyZJDPPTTyM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFA72F802FD;
	Sun, 26 Jul 2020 04:54:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7523FF8020B; Sun, 26 Jul 2020 04:53:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 716C7F80246
 for <alsa-devel@alsa-project.org>; Sun, 26 Jul 2020 04:53:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 716C7F80246
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="UCMep3/v"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="jl1VQu+F"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5B0A4580500;
 Sat, 25 Jul 2020 22:53:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sat, 25 Jul 2020 22:53:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=ERAIJp5xBaLI/
 ZcZmq1IesLhocpBhAj61ykp0NYJOa4=; b=UCMep3/vYhc63V/s/TI9Js1vSx2DE
 wRutsQ8k4Uwx39LHKb6utjKHql8UEPM+E/T4iA9/xprafe3lel9+ZWVSTGLov8KW
 6sBV8N5dWpqprIhBo8XCzlJkDCzppVyIa81GTu6A5lxPnLGBldivEolU1TezY/At
 4F7w4DLP6D81KXnBhpXMM12WRkCrvzDYrczmsi9jSk6RKR008kbL9hCIfUTGaOOz
 R8knBzMu7DDzTeC+NxQ0cdiWKYou5Dz3JALjrw/oSWe0lfx01vpCFVmOK5bGQIuq
 cfnX9fc7LUEq31oquqcClhFZVrweE+HYBnvBxcyppFF8cMo1hEVdqdT/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=ERAIJp5xBaLI/ZcZmq1IesLhocpBhAj61ykp0NYJOa4=; b=jl1VQu+F
 6eC4RDrWGnfpzVg8Z+3kTTJKelnwKTyk2gdQbqsfpPTAKFgm8A3dr8f5Zg4CC9Ko
 kOHHONqtcweYl4JkYVs4AyGQg3M0WBE2W0vrOVShy+ikuiELow6+l0PbP/RseI3d
 n2C28Tm0OjgsW2wibPbgzUlS9A2cllBkwgVfNfj2JAdTFXKva49AQL2ThKbQsnJS
 8pcy/B1/HZk9B51bvaDL5wwKESJp1+swLrjrD5HCaKpr4gnhbjk5lW7B9DZw9Jqk
 usiOyiKtCHDimxRlbv80XEWmJ2zCEHusb51w/aQvoXra11S73mgW/4Ljf3gMViL7
 mAPp8i1pNiKvHA==
X-ME-Sender: <xms:MvAcX6DsMRJEbHu-tG6j_cJONnfTqptWihe_N7yD_iXrJze5h0SxLw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrheeigdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
 grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
 jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
 rdhorhhg
X-ME-Proxy: <xmx:MvAcX0icT8X4aSilTgKNJP4MYWPk4I_-JkqFhoXghFaz9jTS4HgxyA>
 <xmx:MvAcX9mSDgMFEyP5y5EKbgiapmBSFmj-jy9aqG1-_pgEjvG5LjgW9A>
 <xmx:MvAcX4zoEjj547Zps2EmhjB3F2NxztkHst2FskU2A1_yjcEffGZssw>
 <xmx:MvAcX4TIeHuMtIr86JYcNuPfnHKIB7sXCxu-DIF9M9Jgjsxft2qvmA>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id BA55F328005A;
 Sat, 25 Jul 2020 22:53:37 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v2 6/8] ASoC: sun50i-codec-analog: Make line out routes stereo
Date: Sat, 25 Jul 2020 21:53:32 -0500
Message-Id: <20200726025334.59931-7-samuel@sholland.org>
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
including the (stereo) line out mute switch in the DAPM graph.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun50i-codec-analog.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sunxi/sun50i-codec-analog.c b/sound/soc/sunxi/sun50i-codec-analog.c
index 176d6658d099..df39f6ffe25a 100644
--- a/sound/soc/sunxi/sun50i-codec-analog.c
+++ b/sound/soc/sunxi/sun50i-codec-analog.c
@@ -328,7 +328,9 @@ static const struct snd_soc_dapm_widget sun50i_a64_codec_widgets[] = {
 			     SUN50I_ADDA_HP_CTRL_HPPA_EN, 0, NULL, 0),
 	SND_SOC_DAPM_OUTPUT("HP"),
 
-	SND_SOC_DAPM_MUX("Line Out Source Playback Route",
+	SND_SOC_DAPM_MUX("Left Line Out Source",
+			 SND_SOC_NOPM, 0, 0, sun50i_codec_lineout_src),
+	SND_SOC_DAPM_MUX("Right Line Out Source",
 			 SND_SOC_NOPM, 0, 0, sun50i_codec_lineout_src),
 	SND_SOC_DAPM_OUTPUT("LINEOUT"),
 
@@ -439,12 +441,14 @@ static const struct snd_soc_dapm_route sun50i_a64_codec_routes[] = {
 	{ "Mic2 Amplifier", NULL, "MIC2"},
 
 	/* Line-out Routes */
-	{ "Line Out Source Playback Route", "Stereo", "Left Mixer" },
-	{ "Line Out Source Playback Route", "Stereo", "Right Mixer" },
-	{ "Line Out Source Playback Route", "Mono Differential", "Left Mixer" },
-	{ "Line Out Source Playback Route", "Mono Differential",
-		"Right Mixer" },
-	{ "LINEOUT", NULL, "Line Out Source Playback Route" },
+	{ "Left Line Out Source", "Stereo", "Left Mixer" },
+	{ "Left Line Out Source", "Mono Differential", "Left Mixer" },
+	{ "Left Line Out Source", "Mono Differential", "Right Mixer" },
+	{ "LINEOUT", NULL, "Left Line Out Source" },
+
+	{ "Right Line Out Source", "Stereo", "Right Mixer" },
+	{ "Right Line Out Source", "Mono Differential", "Left Line Out Source" },
+	{ "LINEOUT", NULL, "Right Line Out Source" },
 
 	/* Earpiece Routes */
 	{ "Earpiece Source Playback Route", "DACL", "Left DAC" },
-- 
2.26.2

