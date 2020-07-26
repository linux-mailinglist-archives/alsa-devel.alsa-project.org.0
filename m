Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4656922DB70
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Jul 2020 04:57:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB2B31685;
	Sun, 26 Jul 2020 04:56:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB2B31685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595732229;
	bh=yYIBeQFmh8i35q6KyzVV7E7bMgwEkiJYykDLmLwRhvI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LF+vEM/AHMpSzsKsYd/kdR3NNd3HOfFFltYupqQNVLQLhuJ5LpN5DTXUC52WHLgbP
	 Qjxi+odgYlL6ndZ1+C6Ic4UWivx614djXlM7gwboZB+prvpm9xZT6m63EuONqr1twf
	 Ctpby5osN6LyeBDlAZ7hUTozsBhVGfYGzHUhbq8I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8071CF802C3;
	Sun, 26 Jul 2020 04:53:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B881CF8021E; Sun, 26 Jul 2020 04:53:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA519F8020B
 for <alsa-devel@alsa-project.org>; Sun, 26 Jul 2020 04:53:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA519F8020B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="pfFh4ueo"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="h+TZ/BQh"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id A171B5804F6;
 Sat, 25 Jul 2020 22:53:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sat, 25 Jul 2020 22:53:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=R4wOLyBerCdsk
 WWpBq4a90wQHWbcAHkrC0l6Mao/Ahc=; b=pfFh4ueo3eQ97wv/M33CDFMLNvTXN
 sNsWRNnqcU6xA5BD/s4MJYSY0pamEMJcmicvBxiLczN90Z+J0QDVtqVXDCdaFDRR
 IGP7IciQXWA7zx8c6XMpp/wNAFqknPoOvTnQlczdTuSbPS5hHGmIlc549tV+2Av0
 TB/3bS9SjDHhuKtENIRKEuBCobwnCzlkNlT25tzP0ifNk36ZSSWYoqAu5uns4M6Q
 /403tUTIVILzKRNnpwGqEndxvVEb2Ctr2m5chiUscJJBple7zF7f+q9b4lXNbEgu
 vcGO664oBU6ThMHRZ1yGkZg1L7muWQx+inG2uiw0/nrOKKiMjS+cGFMpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=R4wOLyBerCdskWWpBq4a90wQHWbcAHkrC0l6Mao/Ahc=; b=h+TZ/BQh
 T+DEQnIuzPsLYxDDD82DlW3G5+cGHKgrK7HF9zZk7aSVEXRRZDENyi80UEQsrBfB
 8ohqznERdaKg9cFGLRrGrVJr2bSOS9yTNsjpP1YAbkcgYAiLUVsAdNwbxfUQZjth
 R7xiuWktV9zOTe3QdBRaJB0aqFTM5ypCW4pm34yAwRYB5KTaQBzRW2EG2dbOh7FZ
 cJ1lwsA1yhzric4njx7mBMBSuLTiD0A5hbMub03srVeuyhjteM01GBSM42ledXy4
 lQmhOghTfdjHTcMuIiSHVYj19CbaywjzMujHAiMjVlYJn9y2lEKYF9cPpKOicoyz
 rR51HhHFRE0s2A==
X-ME-Sender: <xms:L_AcX5cLYckrxRkVQV0p-8eoD466hk_aWtP5wuFZguZyLQExNthPPw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrheeigdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
 grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
 jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
 rdhorhhg
X-ME-Proxy: <xmx:L_AcX3O15dfNRy7Evs61vTshyzGsa4swMkJljV18r4rdh-ZcQCOE-g>
 <xmx:L_AcXyjsN0Xwtwk8US6WQ3a9QgjqjyqY5srWuhqw_gHcPiZRtXwn4w>
 <xmx:L_AcXy_pvmDSXwTFP4mwTWhO7GbHtvAoABkJ3xlRJUx1_DRN9hhjDw>
 <xmx:MPAcX2-CQ-eBqOxhmggjIfET7yx0wmkUkPuIb_hjqMzsMmiUfJDbEA>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 58D9D3280060;
 Sat, 25 Jul 2020 22:53:35 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v2 1/8] ASoC: sun50i-codec-analog: Fix duplicate use of ADC
 enable bits
Date: Sat, 25 Jul 2020 21:53:27 -0500
Message-Id: <20200726025334.59931-2-samuel@sholland.org>
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

The same enable bits are currently used for both the "Left/Right ADC"
and the "Left/Right ADC Mixer" widgets. This happens to work in practice
because the widgets are always enabled/disabled at the same time, but
each register bit should only be associated with a single widget.

To keep symmetry with the DAC widgets, keep the bits on the ADC widgets,
and remove them from the ADC Mixer widgets.

Fixes: 42371f327df0 ("ASoC: sunxi: Add new driver for Allwinner A64 codec's analog path controls")
Reported-by: Ondrej Jirman <megous@megous.com>
Acked-by: Chen-Yu Tsai <wens@csie.org>
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
2.26.2

