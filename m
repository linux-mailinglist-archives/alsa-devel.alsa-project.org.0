Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E66B27F7F2
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 04:23:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 155B81881;
	Thu,  1 Oct 2020 04:23:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 155B81881
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601519038;
	bh=kguEGEbN4GgXOdtQy8VFm8AItllI3HwB21YecBTE5A0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=im2WTNfb8W4YHrpJJjaPESqNaTGXwDs42w9KneXBHEFqi4jgTLE1uD/pDWTv0pwPm
	 DM4m1W9WPdv6LgSlc4oXEXVIt1fIqniklQY66SG+HwaiKEWD3OdAQn0saVH61ytpvU
	 TrdHV9hvwwT3FZApPtcZmEvsB09YJXcyqD9Lut34=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7801AF80391;
	Thu,  1 Oct 2020 04:12:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7034EF80343; Thu,  1 Oct 2020 04:12:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F047F802E3
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 04:12:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F047F802E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="qSqUd1+j"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Z0VGN5Ah"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 008A2580380;
 Wed, 30 Sep 2020 22:11:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 30 Sep 2020 22:11:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=wTl9sckAKM0xv
 p0u0bCj2SQl0uxAhs6YnPzCMhVRDYk=; b=qSqUd1+jLlEB5/mcpESVyOgbPs2e6
 RoyOcKqryG29SVIf/bwTlO7Y5H3SnLFiwjdOMf6yajhb8hvLCckvegIy1NpLSU0C
 00gSIzxJy+26q9opNKjRyg3ljtXVMYcU1vBom6yPmnz8UhHQBS3BGv/Tiu4P2tdb
 8R/LcOD62LUXOpSfvDXgcfdo4KihdUOQ5ecQ1A0aIl5Y1q9FGkkQy6vqOpJNp3Rt
 9RKV/YUIYLd3G7V2wlRPP1N4BID1+T5E7ZH2UZQlLFqubHQcG9h8quHOhrT57SWu
 0RsGbcnGh74R+QgDHPvbDVPLNk6z1WM205faFgzFqZCyl6SHzZ6qZkFPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=wTl9sckAKM0xvp0u0bCj2SQl0uxAhs6YnPzCMhVRDYk=; b=Z0VGN5Ah
 KMtW+XCWC6anGBx5UX/0wk5TFdKeDnn/8eCerZNmyfwFYlFzPPwCvYroBJtZ4492
 JHMGpqe1YmT6pzTW4XsyA+MvQ1v1FFuPg1tunZzv3aLHir696thKwxZzca6NwXFh
 cVPq2igneNjGWn9uKxTZXEss1tQx+h7lKIdQQl4YaQ98cGnseCu5lAWhasQ1AECu
 IKIsD8b0t48dDvES1Q7B6oftHlY104PUyiRY+xoi/w8f+Fv3iqcOtGqprOofgsKj
 uvHbu/4btPMPn3sjkWufBbejOc0TJARXTf6XJnIE+Sx8WbqNs4/4zBWuSVuhiva5
 zOVaPoRr3sDh8w==
X-ME-Sender: <xms:7Tp1X0j80MCTYTXyrSKFSG2PoT30CAWddry3hA46Oy7j1nvUtpGRKQ>
 <xme:7Tp1X9A2-iVsZOdCDEV0qXep8aeNPUDpqNVqOTCPLWhLQLzNoDubVwAwraqBPvL2X
 tLalrQwdI782ExDeQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeefgdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
 grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
 jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
 gvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
 rdhorhhg
X-ME-Proxy: <xmx:7Tp1X8GO6NexOWkHcqb8tpj0IFhZURefps3B918g6qF4sLxaO9F4FA>
 <xmx:7Tp1X1SaFRvcRlyaqKeCGEdShwWpWA5OBv76HyxpLOxn-koQrAwWHA>
 <xmx:7Tp1XxzyjUp8YyDnHFk548Y5kpZaBOGXDuERAUtxE2hdJMzk83TL-w>
 <xmx:7Tp1X4mpTOpPTNRmJRqTNom9Qto_ajgJzbB9bWui5Ck_6wmlrFpV6Q>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 557B83064684;
 Wed, 30 Sep 2020 22:11:57 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 17/25] ASoC: sun8i-codec: Enable all supported sample rates
Date: Wed, 30 Sep 2020 21:11:40 -0500
Message-Id: <20201001021148.15852-18-samuel@sholland.org>
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

The system sample rate programmed into the hardware is really a clock
divider from SYSCLK to the ADC and DAC. Since we support two SYSCLK
frequencies, we can use all sample rates corresponding to one of those
frequencies divided by any available divisor.

This commit enables support for those sample rates. It also stops
advertising support for a 64 kHz sample rate, which is not supported.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index f21274530a0e..f4b2a7cc9810 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -89,16 +89,23 @@
 #define SUN8I_SYS_SR_CTRL_AIF1_FS_MASK		GENMASK(15, 12)
 #define SUN8I_SYS_SR_CTRL_AIF2_FS_MASK		GENMASK(11, 8)
 #define SUN8I_AIF1CLK_CTRL_AIF1_CLK_INV_MASK	GENMASK(14, 13)
 #define SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV_MASK	GENMASK(12, 9)
 #define SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV_MASK	GENMASK(8, 6)
 #define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ_MASK	GENMASK(5, 4)
 #define SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT_MASK	GENMASK(3, 2)
 
+#define SUN8I_CODEC_PCM_RATES	(SNDRV_PCM_RATE_8000_48000|\
+				 SNDRV_PCM_RATE_88200     |\
+				 SNDRV_PCM_RATE_96000     |\
+				 SNDRV_PCM_RATE_176400    |\
+				 SNDRV_PCM_RATE_192000    |\
+				 SNDRV_PCM_RATE_KNOT)
+
 enum {
 	AIF1,
 	NAIFS
 };
 
 struct sun8i_codec_aif {
 	unsigned int	slots;
 	unsigned int	slot_width;
@@ -142,37 +149,41 @@ static int sun8i_codec_runtime_suspend(struct device *dev)
 	return 0;
 }
 
 static int sun8i_codec_get_hw_rate(struct snd_pcm_hw_params *params)
 {
 	unsigned int rate = params_rate(params);
 
 	switch (rate) {
-	case 8000:
 	case 7350:
+	case 8000:
 		return 0x0;
 	case 11025:
 		return 0x1;
 	case 12000:
 		return 0x2;
+	case 14700:
 	case 16000:
 		return 0x3;
 	case 22050:
 		return 0x4;
 	case 24000:
 		return 0x5;
+	case 29400:
 	case 32000:
 		return 0x6;
 	case 44100:
 		return 0x7;
 	case 48000:
 		return 0x8;
+	case 88200:
 	case 96000:
 		return 0x9;
+	case 176400:
 	case 192000:
 		return 0xa;
 	default:
 		return -EINVAL;
 	}
 }
 
 static int sun8i_codec_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
@@ -408,26 +419,26 @@ static struct snd_soc_dai_driver sun8i_codec_dais[] = {
 		.name	= "sun8i-codec-aif1",
 		.id	= AIF1,
 		.ops	= &sun8i_codec_dai_ops,
 		/* capture capabilities */
 		.capture = {
 			.stream_name	= "AIF1 Capture",
 			.channels_min	= 1,
 			.channels_max	= 2,
-			.rates		= SNDRV_PCM_RATE_8000_192000,
+			.rates		= SUN8I_CODEC_PCM_RATES,
 			.formats	= SNDRV_PCM_FMTBIT_S16_LE,
 			.sig_bits	= 24,
 		},
 		/* playback capabilities */
 		.playback = {
 			.stream_name	= "AIF1 Playback",
 			.channels_min	= 1,
 			.channels_max	= 2,
-			.rates		= SNDRV_PCM_RATE_8000_192000,
+			.rates		= SUN8I_CODEC_PCM_RATES,
 			.formats	= SNDRV_PCM_FMTBIT_S16_LE,
 		},
 		.symmetric_rates	= true,
 		.symmetric_channels	= true,
 		.symmetric_samplebits	= true,
 	},
 };
 
-- 
2.26.2

