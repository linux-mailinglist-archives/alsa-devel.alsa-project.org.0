Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC5F27F7F5
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 04:25:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B00D717CB;
	Thu,  1 Oct 2020 04:24:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B00D717CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601519105;
	bh=D3RNjOcEkYrUkUjoD9mDRVw1+TXaoNaaGM/fk5QJChU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vD2EVZ3Fg9c2Nz30UaVpHNAIEGelV3XjxdMT8gUG9Th7FcoBpaA4WqxsiQvae4ozm
	 qcMlelrZG+ZO8IOIdbYTfwX4eIzT71m1Sut6+qTD1YMCNSIvVjBAKq6pmU4z9ysRmH
	 NEP1V/2PeAeeS2vA9epPYBIN4qdX6Fs3kWSJGDp0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 809CCF803C9;
	Thu,  1 Oct 2020 04:12:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70337F80341; Thu,  1 Oct 2020 04:12:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 295E2F8020C
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 04:12:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 295E2F8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="bU5via5L"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="bF2CGdFP"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6053D5803A5;
 Wed, 30 Sep 2020 22:12:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 30 Sep 2020 22:12:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=dzVr8TUYYufuG
 Z55x/cuWx14x/WrGzXTpsfi12FdIuQ=; b=bU5via5LhVT6E8Kd9QO2zetm9GbF/
 6BPvwmEHUyXJ1tGdneKRDTubhK5BZqaJGQQVnWQMbb55TXANtdbEMPQuIwK8ItXd
 KHN02YpvYvhB7cp9HWDPhU1eAqFNpcG+bx6vRnGxKvox8VffyPo4KY+in1Qe8eyS
 ddvgltTlXxg4+qLFRg/dbn9H2jvIV3pXPVnEvUx/+xhZvgcMywZOwXTuHrielwds
 +K6CwVtFlougSYAK3koIX6i7k6mVodxC/XPwKbFZrN6kmwxH90zzMNXtrwG9ndrP
 65j41u+C+5SCG2v3dPjyIp5/wzZsY5oSyBnP4MiZV8wtjv4cBVhXSBRtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=dzVr8TUYYufuGZ55x/cuWx14x/WrGzXTpsfi12FdIuQ=; b=bF2CGdFP
 BkIQJx/nt3Itqh4AHzqnofuFusol0FZdSnO9xkit/AyXptja81Toqe4EiVyXzq1W
 VHTThEez1YC/1ahXqlh6Bq7IsSzV/+I3/KqStDWUeSXrSJBRtJXKEcOP0LdKxpyZ
 j/JE1Ndw2KJCXDQnpHS5gr0G+vtrK8KkaXIqUi7NTQ3Z+g//SA+giW3cuIAVN5KW
 1KVQqWw+oJeeV3TRr3jAfa0a0AYjQV9GW7R92CjmpWhzs3MsJ3SUswXYJOL/90EM
 u0PL0fNPpZpOUWANxwadaz1/50H5812ZUGcddQmKUlUtJ5ieb+d3OUslj8PEEEQZ
 OcJh7z+JGdomNA==
X-ME-Sender: <xms:8Dp1X-N-84Ryg6A7acqTyQa8Am3j3YiKkv-f_Z9PH_86O0zJnjnbHg>
 <xme:8Dp1X88U53roPGyzlgyYm1ZNDlyNlpo1b6ixt15Y-c1DbvauArWyG9hDXdeemtPw4
 i7agykDRmE8n2t5vQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeefgdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
 grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
 jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
 gvpedujeenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
 ugdrohhrgh
X-ME-Proxy: <xmx:8Dp1X1QuSpm5HQUUpqilKs9vXudxkchjZNgBe44eQ5S4pSbXgIy5sQ>
 <xmx:8Dp1X-udiLzW8MITtxzf8VY5YBrGgvQ4ngTmK8b8d4L2ywR39yBgvQ>
 <xmx:8Dp1X2cj9J4d4L4lCSw0U_4mGf_Ny2lFkh1j6Cf6Nj9Xh2UHDw18ug>
 <xmx:8Dp1X9xT8TXF0WqCRQcHt8eEa6xu0mI2sVGQ7fbuOkOxoSrrhOORVw>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id A84A53064684;
 Wed, 30 Sep 2020 22:11:59 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 22/25] ASoC: sun8i-codec: Enable all supported PCM formats
Date: Wed, 30 Sep 2020 21:11:45 -0500
Message-Id: <20201001021148.15852-23-samuel@sholland.org>
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

Now that the DAI clock setup is correct for all hardware-supported PCM
formats, we can enable them in the driver. With the appropriate support
in the CPU DAI driver, this allows userspace to access the additional
formats.

Since this codec is connected to the CPU via a DAI, not directly, we do
not care if the CPU DAI is using 3-byte or 4-byte formats, so we can
support them both.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index d8ce84533ddb..032a3f714dbb 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -91,16 +91,23 @@
 #define SUN8I_AIF1CLK_CTRL_AIF1_CLK_INV_MASK	GENMASK(14, 13)
 #define SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV_MASK	GENMASK(12, 9)
 #define SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV_MASK	GENMASK(8, 6)
 #define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ_MASK	GENMASK(5, 4)
 #define SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT_MASK	GENMASK(3, 2)
 
 #define SUN8I_CODEC_PASSTHROUGH_SAMPLE_RATE 48000
 
+#define SUN8I_CODEC_PCM_FORMATS	(SNDRV_PCM_FMTBIT_S8     |\
+				 SNDRV_PCM_FMTBIT_S16_LE |\
+				 SNDRV_PCM_FMTBIT_S20_LE |\
+				 SNDRV_PCM_FMTBIT_S24_LE |\
+				 SNDRV_PCM_FMTBIT_S20_3LE|\
+				 SNDRV_PCM_FMTBIT_S24_3LE)
+
 #define SUN8I_CODEC_PCM_RATES	(SNDRV_PCM_RATE_8000_48000|\
 				 SNDRV_PCM_RATE_88200     |\
 				 SNDRV_PCM_RATE_96000     |\
 				 SNDRV_PCM_RATE_176400    |\
 				 SNDRV_PCM_RATE_192000    |\
 				 SNDRV_PCM_RATE_KNOT)
 
 enum {
@@ -531,26 +538,26 @@ static struct snd_soc_dai_driver sun8i_codec_dais[] = {
 		.id	= AIF1,
 		.ops	= &sun8i_codec_dai_ops,
 		/* capture capabilities */
 		.capture = {
 			.stream_name	= "AIF1 Capture",
 			.channels_min	= 1,
 			.channels_max	= 2,
 			.rates		= SUN8I_CODEC_PCM_RATES,
-			.formats	= SNDRV_PCM_FMTBIT_S16_LE,
+			.formats	= SUN8I_CODEC_PCM_FORMATS,
 			.sig_bits	= 24,
 		},
 		/* playback capabilities */
 		.playback = {
 			.stream_name	= "AIF1 Playback",
 			.channels_min	= 1,
 			.channels_max	= 2,
 			.rates		= SUN8I_CODEC_PCM_RATES,
-			.formats	= SNDRV_PCM_FMTBIT_S16_LE,
+			.formats	= SUN8I_CODEC_PCM_FORMATS,
 		},
 		.symmetric_rates	= true,
 		.symmetric_channels	= true,
 		.symmetric_samplebits	= true,
 	},
 };
 
 static int sun8i_codec_aif_event(struct snd_soc_dapm_widget *w,
-- 
2.26.2

