Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0250528D9F6
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Oct 2020 08:24:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CF8C170B;
	Wed, 14 Oct 2020 08:23:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CF8C170B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602656680;
	bh=6Q8UENdewkrZXp5AqSpy2KjgmbghJB5XVbNswwMnnp8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CwRk5nzdsm3TMj9yQ9HKnrB342xr8+ZA1TJi2EDrYMfqOikkA/PzaNCaVAlK71GVR
	 byYYazRGueUBwxB0X41SEIWRnUNcup8rB4nMPpvP0SdYL5am4BmgopKRfCXA40nmpZ
	 hCzOZQx8WSK/WfRkDsXhIPBS+wu+ROCoYhfd+OXQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7363EF802F9;
	Wed, 14 Oct 2020 08:20:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FA05F802D9; Wed, 14 Oct 2020 08:20:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAE26F8026A
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 08:19:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAE26F8026A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="QLrYS6P7"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="BYl6MjZ3"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 456BAD20;
 Wed, 14 Oct 2020 02:19:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 14 Oct 2020 02:19:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=Lj3pEPl9l+qac
 wSOkupJk1RfIasfPSZrv63/vzssk1Y=; b=QLrYS6P7pxZrRNjY7rXPmnz17Agyr
 AIaC9erYSxaR77x0HhNPQZgpIrFApuDG7pFlTTz0ruSIspsJzjIN2AwTKcXM5l43
 j6z74hTNw6j7BInRL3vGtUJoi9alC9MWoiYzhAL1j7n0b4OVVk3D/yaBkwM+32JU
 hrHLJEH/KqOS9f9Jx9Ks5rf+08Spl5yPjxaqyIyIjJvqWJzUCUDfr1gaD4o03YQ2
 v4nK1SAE4pOqwdlR1d4cr3fWvE9ONxgAPZZUZNwNiWyI0LlZGibOFG1e7opCiWZ4
 /PHVch4Tcb8WUHDngVQZ3yPWozfT3BHJeCXGBWOWpaQqw+cuG3LuJjpTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=Lj3pEPl9l+qacwSOkupJk1RfIasfPSZrv63/vzssk1Y=; b=BYl6MjZ3
 dmMInirvQU6/hDOp2OlVULA+4OSV0R6n5gaQF0KbwARxDEtr4EzMlz3uZBtR3h9F
 ft5E87O5/MPCci/6pZjlzDgARBGqDZqtxqgdUzBcLg/EPdO6sd0hjAZ5XMTJ+gZu
 NwxmNlpqEE+7IkQhI8y8VNdAFS8yE4s85/ue2alcZPxYiSj8qttmEjB7PQ6c8xMU
 0XuyuamINx5J9vRfQ6kZ20QW7VFHan3VliigCnXpWxg/3D8Ffffo1tHwHNYt0+Ru
 NqzR6W4s1e5fG+oNq8KVrDiNL5rJBwHKPmaj7i9fHK1Abk/TVWTYJsPQlXbsKswq
 OcCVnWRgXg58Yw==
X-ME-Sender: <xms:gpiGX8pwJBcfOnveyvgzccZzYz4b-h84wuJofMRsmtVnqADDfDFQjA>
 <xme:gpiGXyqeBwZJyPqd1JSWpn1RX-oAAHN-2_rrDYgJRuc3BfHIjC9e2qFYOJ-UslpzV
 Q5MhfJQgFBD-j5CXg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedriedtgddutdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuih
 iivgepjeenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
 ugdrohhrgh
X-ME-Proxy: <xmx:gpiGXxNscJt_hgJdBIfcEqEW92Udw4eMJ2yJK2qTYcIGupaVc2MYzw>
 <xmx:gpiGXz6CXpCFEOwUCN2Fz26xvlP_egF7zvxxTCZOPWTVwmpOWge2Tw>
 <xmx:gpiGX77srHI9kWWdtF4klOeKuRjyj8mv0HClDGN8htMhhnfHaCzOFg>
 <xmx:gpiGX1t_rqh2K3wpj6nhNL9S-G7cvEenfxDAeNbWPusf-fRYQY72XpMuA4g>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1EAAF328005E;
 Wed, 14 Oct 2020 02:19:46 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 09/17] ASoC: sun8i-codec: Enable all supported sample rates
Date: Wed, 14 Oct 2020 01:19:33 -0500
Message-Id: <20201014061941.4306-10-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201014061941.4306-1-samuel@sholland.org>
References: <20201014061941.4306-1-samuel@sholland.org>
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

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 21104e6e8892..38349d85fb17 100644
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
 	SUN8I_CODEC_AIF1,
 	SUN8I_CODEC_NAIFS
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
 		.id	= SUN8I_CODEC_AIF1,
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

