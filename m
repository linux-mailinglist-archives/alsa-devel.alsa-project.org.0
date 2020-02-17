Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CCC160824
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 03:28:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8348828;
	Mon, 17 Feb 2020 03:27:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8348828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581906509;
	bh=KgHlyw3+tWcwDG8w0BM72DMtKKO5pXtNrB6zyUeqePs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nXXNKMtas3g7pL75lfF7LgdM9kBOLzlf7zOEqMhKFhWfHCegBcO5BfJAAE4b7iFWu
	 VK2bvC3CMMWrNHtRytJKqoWy8p75MCBO0JhUzTR/kOYDIiE6XmF+h4Xkx6/azcLaT3
	 YXFs49uF3pE57HCbFNe2wlenpKJzgSmckVcPfyNU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 888F9F80233;
	Mon, 17 Feb 2020 03:18:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 470D9F80336; Mon, 17 Feb 2020 03:18:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0A23F8015E
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 03:18:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0A23F8015E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="b6SQ2nVC"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="akmZViRe"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 91033666A;
 Sun, 16 Feb 2020 21:18:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sun, 16 Feb 2020 21:18:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=qsy1olLBe7as5
 13jXbvPlPLSJ8oPCY+55e5kCL9aFBc=; b=b6SQ2nVCdAGXiW9y+9JCfTj61yzof
 BsdKnBMclrlZ5LSBO4XaXN/X1IjCaGmQ9zuLWRorE0e0dwaUWdQ/RfBHXYw+ePry
 nVOWXzlRZD4qJ2sBfLd8L0VbzydYjZAdIk+M/xorMfU0o+zIpk3Qnc0DgPzTIdzv
 OfaQZUaYfqruMVPSQjLKKmF2CY/AjinLZSpIvnBPaiai4FDRJ5xG/GuK2uZfM0lC
 +I6ukiOUnGmrBRoB82qZ6En9LIkUKRXZcGDhRgpuFNBNazN1lzsUlyCuA8BJTg92
 l198Cr5p2fN3jZhsKP5WVUUF+jEY5Qh/ZfUYAwL9OyEAEgXlUe+i7XSHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=qsy1olLBe7as513jXbvPlPLSJ8oPCY+55e5kCL9aFBc=; b=akmZViRe
 8jfrq4bo6xVnqId4t5uIT65xVV0DUY2n714c4Ts1gpt8Eru5mAG2/xsqVHVekON3
 mW5RrZnwe7LtLSXEpla4zRuPEa+QmT/N9fzJbKSQ36hAqmX6ccuMUG7z4yds1plM
 +m/fdKDOhY7nWPddfC2HUbIJa4O/6BSXzPhfcA01TI1Hp1VaiFPQz9+YCs0zWi9z
 p4so3aI8avmrMr9Fw4xNA/LdGuKC4NqbRk4J939Oo/0UtI/xoA5rCFDsL78sSiaP
 A434Feysq4wF0RaO2ezTNqMaxlmZmZZ7smgdl9jKiz91ywKqXSfWrrelCihiIm3W
 mpL5YayWwnWwZA==
X-ME-Sender: <xms:5_dJXgpeghBmR5hz0Lamkv6wJoOeDT-Uo6jdiKmB0Xjy28Sias-gEA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeehgdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppe
 ejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:5_dJXt4PFp13T5qT4SZP7sk8J3KGMXb6xlrCaw3CC6HiOKZbZYvpCA>
 <xmx:5_dJXp60Va8uiVJyYeQw0oF_GdMcdL6Ugr9pbBNJ4V0LkukmtcgyHA>
 <xmx:5_dJXkm7x9YpN_FvZ6UtWtsYTDR7tjlgu5e3OJvHtdUbxPjSym2_IQ>
 <xmx:6_dJXrTcF6Hpa9dByCpIsLqOSwsmdI11lKAz088JzSbuzt0SPTCc4A>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 315413060EF2;
 Sun, 16 Feb 2020 21:18:15 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Luca Weiss <luca@z3ntu.xyz>
Date: Sun, 16 Feb 2020 20:18:07 -0600
Message-Id: <20200217021813.53266-3-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200217021813.53266-1-samuel@sholland.org>
References: <20200217021813.53266-1-samuel@sholland.org>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Samuel Holland <samuel@sholland.org>
Subject: [alsa-devel] [PATCH 2/8] ASoC: sun50i-codec-analog: Gate the
	amplifier clock during suspend
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

The clock must be running for the zero-crossing mute functionality.
However, it must be gated for VDD-SYS to be turned off during system
suspend. Disable it in the suspend callback, after everything has
already been muted, to avoid pops when muting/unmuting outputs.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun50i-codec-analog.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/sunxi/sun50i-codec-analog.c b/sound/soc/sunxi/sun50i-codec-analog.c
index cbdb31c3b7bd..4ad262c2e59b 100644
--- a/sound/soc/sunxi/sun50i-codec-analog.c
+++ b/sound/soc/sunxi/sun50i-codec-analog.c
@@ -438,6 +438,19 @@ static const struct snd_soc_dapm_route sun50i_a64_codec_routes[] = {
 	{ "EARPIECE", NULL, "Earpiece Amp" },
 };
 
+static int sun50i_a64_codec_suspend(struct snd_soc_component *component)
+{
+	return regmap_update_bits(component->regmap, SUN50I_ADDA_HP_CTRL,
+				  BIT(SUN50I_ADDA_HP_CTRL_PA_CLK_GATE),
+				  BIT(SUN50I_ADDA_HP_CTRL_PA_CLK_GATE));
+}
+
+static int sun50i_a64_codec_resume(struct snd_soc_component *component)
+{
+	return regmap_update_bits(component->regmap, SUN50I_ADDA_HP_CTRL,
+				  BIT(SUN50I_ADDA_HP_CTRL_PA_CLK_GATE), 0);
+}
+
 static const struct snd_soc_component_driver sun50i_codec_analog_cmpnt_drv = {
 	.controls		= sun50i_a64_codec_controls,
 	.num_controls		= ARRAY_SIZE(sun50i_a64_codec_controls),
@@ -445,6 +458,8 @@ static const struct snd_soc_component_driver sun50i_codec_analog_cmpnt_drv = {
 	.num_dapm_widgets	= ARRAY_SIZE(sun50i_a64_codec_widgets),
 	.dapm_routes		= sun50i_a64_codec_routes,
 	.num_dapm_routes	= ARRAY_SIZE(sun50i_a64_codec_routes),
+	.suspend		= sun50i_a64_codec_suspend,
+	.resume			= sun50i_a64_codec_resume,
 };
 
 static const struct of_device_id sun50i_codec_analog_of_match[] = {
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
