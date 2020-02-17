Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E79716082F
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 03:30:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5A8B1671;
	Mon, 17 Feb 2020 03:30:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5A8B1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581906653;
	bh=4yqJNdqAVXAXjYAoIzFuiPRRaas5iaBD+EaxETzCGfg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bb5U83/fa2Z6k5UyCe/jGRuXNetGt39EMMMcwRgLpejd3C8/aaAd0MmK0xARykAt/
	 owK2PiSfeJnjm9zqd0JSo8A44Jzv/0oqLYxu0fvn6reyBGiCuNk/y6y2m89XA5S2+v
	 S1MLpuBALOFoKGSHkBA0DnjSX8iauFiI3IJvXILE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0893F8034E;
	Mon, 17 Feb 2020 03:18:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEA19F80337; Mon, 17 Feb 2020 03:18:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0BB82F80333
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 03:18:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BB82F80333
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="AZW+oQc5"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="BIPCmFZS"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id B79BA6D7E;
 Sun, 16 Feb 2020 21:18:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sun, 16 Feb 2020 21:18:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=zYX2qLatCNdpd
 Bo0QvRl91j/VbKbgJTqwWqJS1iqsak=; b=AZW+oQc5nfwi2kgFo4CgjayWx9kbs
 MYgu22ULF5nRmT+lYBNF+F3jDpmpn6eaWsOV3tMZleMnK2SbcOTUGf+OikWXNtfq
 wbkEatGPM+aMJXu4gSQR2mz03rloKZRSLbcAyjz14z74vZPIDsGFnFLx06FfmBkL
 iwODOFQBq/ipv8dx+jvtpFb2f1q/6PVk3PlUaVP2CVd5K+/26p6n3bC8tAzoiDQY
 gNIjXDdWIdr4FoxTCcg3WcaxRfC6ZmuhNwby8de9/Tnc9/jEH/fmlKbfUUtKWfyt
 qHhyDaQzLie3mzkDP9bACnLsQLFrIHHqX4H0r4zRu1eS0+/kUn+ru7+Xg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=zYX2qLatCNdpdBo0QvRl91j/VbKbgJTqwWqJS1iqsak=; b=BIPCmFZS
 XYN7h6H76LULXxcJByy9dkq0jKfRjPLAORsMawqpORc1dxwWcZVcA90DN1KjgDpo
 9C3D7JDM0mHSlFQ8+pHb3DfMWsI8pgkQMC9Y50Eo1CASuWj4NJoclClCISsb7OT0
 0g0HLz8tam/yfNjldwT/qmb4tYH53HJZ7XJAmr3UFD78tulUwXSAvvbEeYTLIPeC
 mpFP/RNUn857s4oX7fDpG7eNp7IAJNF/tLzea37KzPaZCtT/S7wDsheWYwstwj9t
 A5D8Q+GY0WclecNuBjbyaTe02aWt9N12D6IP8DqhHlk5Hqkd3DTw0XUen3/xHyvJ
 B9LQuxmfNHBK/w==
X-ME-Sender: <xms:5_dJXrnb5_XxFkxr4SQtji45JG1wPKYpXhqZeZfVggsckIoaxtUTIg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeehgdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppe
 ejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:5_dJXkrWBUVsDJ57evoxkFp8L4C5WxtNRIiKeEVUuQNLYoZ6Xw5NMg>
 <xmx:5_dJXm_zuqEYOMJOgklZOXR29zZvQl8HtWsKrEYpO7Lvm3EyEsTd4w>
 <xmx:5_dJXt6lfkJpmjcD2Jj0CzBdE8DKXDK5uQ0ULXgDerz2LBqL40SwXg>
 <xmx:6_dJXrQvgWei-xVhcM1pqr2CT0Sm4e1cLMMAKDfcdF2aEOHMmS5AzA>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id A6BA73060EF5;
 Sun, 16 Feb 2020 21:18:14 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Luca Weiss <luca@z3ntu.xyz>
Date: Sun, 16 Feb 2020 20:18:06 -0600
Message-Id: <20200217021813.53266-2-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200217021813.53266-1-samuel@sholland.org>
References: <20200217021813.53266-1-samuel@sholland.org>
MIME-Version: 1.0
Cc: Ondrej Jirman <megous@megous.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Samuel Holland <samuel@sholland.org>
Subject: [alsa-devel] [PATCH 1/8] ASoC: sun50i-codec-analog: Fix duplicate
	use of ADC enable bits
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

The same enable bits are currently used for both the "Left/Right ADC"
and the "Left/Right ADC Mixer" widgets. This happens to work in practice
because the widgets are always enabled/disabled at the same time, but
each register bit should only be associated with a single widget.

To keep symmetry with the DAC widgets, keep the bits on the ADC widgets,
and remove them from the ADC Mixer widgets.

Fixes: 42371f327df0 ("ASoC: sunxi: Add new driver for Allwinner A64 codec's analog path controls")
Reported-by: Ondrej Jirman <megous@megous.com>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun50i-codec-analog.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sunxi/sun50i-codec-analog.c b/sound/soc/sunxi/sun50i-codec-analog.c
index f5b7069bcca2..cbdb31c3b7bd 100644
--- a/sound/soc/sunxi/sun50i-codec-analog.c
+++ b/sound/soc/sunxi/sun50i-codec-analog.c
@@ -363,12 +363,10 @@ static const struct snd_soc_dapm_widget sun50i_a64_codec_widgets[] = {
 			   SUN50I_ADDA_MIX_DAC_CTRL_RMIXEN, 0,
 			   sun50i_a64_codec_mixer_controls,
 			   ARRAY_SIZE(sun50i_a64_codec_mixer_controls)),
-	SND_SOC_DAPM_MIXER("Left ADC Mixer", SUN50I_ADDA_ADC_CTRL,
-			   SUN50I_ADDA_ADC_CTRL_ADCLEN, 0,
+	SND_SOC_DAPM_MIXER("Left ADC Mixer", SND_SOC_NOPM, 0, 0,
 			   sun50i_codec_adc_mixer_controls,
 			   ARRAY_SIZE(sun50i_codec_adc_mixer_controls)),
-	SND_SOC_DAPM_MIXER("Right ADC Mixer", SUN50I_ADDA_ADC_CTRL,
-			   SUN50I_ADDA_ADC_CTRL_ADCREN, 0,
+	SND_SOC_DAPM_MIXER("Right ADC Mixer", SND_SOC_NOPM, 0, 0,
 			   sun50i_codec_adc_mixer_controls,
 			   ARRAY_SIZE(sun50i_codec_adc_mixer_controls)),
 };
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
