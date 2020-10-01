Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADE427F7DB
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 04:14:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0C9A1805;
	Thu,  1 Oct 2020 04:13:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0C9A1805
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601518477;
	bh=Bsb8n4v/b0sUQ5d2UHjkfMRRItBNb3pqgzNqYwQYVJY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EK3MTu70mXm+ytFgoUL9uvMAhF8yX/EyBwTQ1djRdsSsC6JVS7oRt9rK6FWhuUx+3
	 fP2LIo65yTprMv63fo9+G9lgziHzRomGbNvL3B1JV/z8KTcOVX8D4CWMJaGjZ3fIim
	 h020z8Ru6x51jDZqzRaBfZLkooHk0rdW+lDipGuY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3DABF8027D;
	Thu,  1 Oct 2020 04:12:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9611CF80304; Thu,  1 Oct 2020 04:12:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C503FF802C4
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 04:11:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C503FF802C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="ao27fuuK"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="IiW/LLxg"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id DF307580286;
 Wed, 30 Sep 2020 22:11:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 30 Sep 2020 22:11:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=9H7p1rK8kVC/k
 +RZkn4ztHf0kPRd9BHXRVzfHYUG/MY=; b=ao27fuuKrtgFl9c/nYUNd4SksnGsM
 4/Y+crUekjqT/hPoKtDTPTNp9LHLTKp2Pu5QCHuyZgcKnYxO6/FhEC7710H0lmJd
 6+B9vVer8YUzAUrbyKsanUPmPDWLIdazIBhIIOFu5gycU/N960l3eGh6MK+MCs9v
 27ftWG4MFkHSUxJKNxYjUnSqJpE3llV47tbD5LZUoh37uQHJnx5hhFXC3pOwnphh
 7uBWW7bzU5zHTn9pLC0iHP1SZwOHDr6nefxu/Fr6cIRuimUKDnGA3KYBgGBH74Au
 hibzEkA+hZKzn9R7873FNwZBPG7hREC4a5zDYS2cZw0FRyWL8ABIfz4iQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=9H7p1rK8kVC/k+RZkn4ztHf0kPRd9BHXRVzfHYUG/MY=; b=IiW/LLxg
 WNcwFZPJrPQfExzNu25m6M8J5B/JsD9l14/Yi5WXr1ONunKTChuEUkhtqfHH39tX
 wAoWVtm/mesQ/SKOzcBmN5NcHRJz+TVh/1Oqt9qTe40f1vR9M9mCxE1OEeXhjMe1
 vmOXuhnZemtQTUXHmey0m4hvTuHhdFSUR9UrcLgIfDHiE4sCLA8jbAgfHufadkEF
 Y03DwKWgc/wq/504m5l0ew0HQ79MI2bc3TtJgcDos8+elmzUlTVEIeSfoEKR2t0B
 DmbbdN/OvPhabFo32L3VaRl4+pK/j0M3KvbYD7p30+qakzWANXVB+qJzVse3xWo5
 g7lbjQjqoocOQA==
X-ME-Sender: <xms:6Dp1X6zukDhYsJjJxjt430oMYQIYFOnHy1BaLeWZy9h7R4K6GVaxrw>
 <xme:6Dp1X2RDqsLeL8iN7VnBWDHg8rVqqDWrp-ne1bvFccnS2XmJl-eREUNG2ebqBQ0MC
 -cvfVeZpJVkkv3nqA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeefgdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
 grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
 jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
 gvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
 rdhorhhg
X-ME-Proxy: <xmx:6Dp1X8Xhmqo2kokoywfgo1DlER49BcujJvpalil2sGg6ySstTruIsA>
 <xmx:6Dp1XwiLSAeELrCMOnvb3xLnv6LMTcNXzOqnUb5rDWlvHRz8RftlpA>
 <xmx:6Dp1X8AmcJ65twXfEfdUspgOi559RaXtheLs6DebBYPed0_G3F8l8Q>
 <xmx:6Dp1X43FCew4KWkRKq43Xdr4XM5f14XaZHfmnxbD6xF-drVQN1UX3w>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2AA89306468C;
 Wed, 30 Sep 2020 22:11:52 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 06/25] ASoC: sun8i-codec: Fix AIF widget channel references
Date: Wed, 30 Sep 2020 21:11:29 -0500
Message-Id: <20201001021148.15852-7-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201001021148.15852-1-samuel@sholland.org>
References: <20201001021148.15852-1-samuel@sholland.org>
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

Both the left and right side widgets referenced channel 0. This would
unnecessarily power on the right side widget (and its associated path)
when a mono stream was active.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index d0028883950c..2c89974243e1 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -408,31 +408,31 @@ static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
 	SND_SOC_DAPM_SUPPLY("DAC",
 			    SUN8I_DAC_DIG_CTRL,
 			    SUN8I_DAC_DIG_CTRL_ENDA, 0, NULL, 0),
 
 	/* AIF "ADC" Outputs */
 	SND_SOC_DAPM_AIF_OUT("AIF1 AD0L", "Capture", 0,
 			     SUN8I_AIF1_ADCDAT_CTRL,
 			     SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0L_ENA, 0),
-	SND_SOC_DAPM_AIF_OUT("AIF1 AD0R", "Capture", 0,
+	SND_SOC_DAPM_AIF_OUT("AIF1 AD0R", "Capture", 1,
 			     SUN8I_AIF1_ADCDAT_CTRL,
 			     SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0R_ENA, 0),
 
 	/* AIF "ADC" Mixers */
 	SOC_MIXER_ARRAY("AIF1 AD0L Mixer", SND_SOC_NOPM, 0, 0,
 			sun8i_aif1_ad0_mixer_controls),
 	SOC_MIXER_ARRAY("AIF1 AD0R Mixer", SND_SOC_NOPM, 0, 0,
 			sun8i_aif1_ad0_mixer_controls),
 
 	/* AIF "DAC" Inputs */
 	SND_SOC_DAPM_AIF_IN("AIF1 DA0L", "Playback", 0,
 			    SUN8I_AIF1_DACDAT_CTRL,
 			    SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0L_ENA, 0),
-	SND_SOC_DAPM_AIF_IN("AIF1 DA0R", "Playback", 0,
+	SND_SOC_DAPM_AIF_IN("AIF1 DA0R", "Playback", 1,
 			    SUN8I_AIF1_DACDAT_CTRL,
 			    SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0R_ENA, 0),
 
 	/* ADC Inputs (connected to analog codec DAPM context) */
 	SND_SOC_DAPM_ADC("ADCL", NULL, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_ADC("ADCR", NULL, SND_SOC_NOPM, 0, 0),
 
 	/* DAC Outputs (connected to analog codec DAPM context) */
-- 
2.26.2

