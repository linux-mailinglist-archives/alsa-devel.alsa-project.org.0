Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB59F160B17
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 07:50:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A9AA4E;
	Mon, 17 Feb 2020 07:49:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A9AA4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581922229;
	bh=bgdc0WvWGKmOQ7ozLMC6j7vIm2YzNY2lJcoSneIx/Xg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LWat/ViGplDZtftPm2m1K14y1/ZIy1vXGXQORvE4be/v8ydQJKu2IdlckV3dRsZHZ
	 ZEYxEz3zZjgBrORxa3LDN4rUX56ioaC23OtmK1XPTy8bzfWFWOE7fcF9yiou0Lzpkw
	 nZgNn2fdueM5+FLDrfyWY0rqWz7ACLLAh59BL7O4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D89EBF80299;
	Mon, 17 Feb 2020 07:43:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19FB2F802E1; Mon, 17 Feb 2020 07:43:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65D27F80246
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 07:42:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65D27F80246
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="pjGLBhX2"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="t5mJfYrP"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 88656522A;
 Mon, 17 Feb 2020 01:42:57 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 17 Feb 2020 01:42:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=eKD/+XfScmpnS
 qlhCFWsXWiucNFzH6aj/knZgkkVSvg=; b=pjGLBhX2W4qKJ0ycJ8/5clEZvnbtD
 zYrp6sc7tE96elJ+GDWEEW9S6HjPLn8s0Wwy8yjsCD0G5Z4u12T3Ts/zlpYpW8TR
 DTJ4c1+t3CxrGEo+mSKJXWa/UHpcqbpWuDM75hzYPXW+cymYlI+8/+bqEmIVknUj
 +vuZxtxzrqThyO5i9Lrnk0kWPYMjkO/yuiVMMqK4K1pgGI1cDRHNCQK4BSO6RezT
 /YUGOFpKI1S/A/SE3hxOilsD9p1EYLdpkGNmHtdYRrEvLSrPB7drWDm2ocSF9OyP
 pZBf3vjGF3DvB3s0M8H/e/KILWQW8cmqRddfvcuy14r7w9+LOyGm+Mdlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=eKD/+XfScmpnSqlhCFWsXWiucNFzH6aj/knZgkkVSvg=; b=t5mJfYrP
 C1ac6eWjB+ssvZHhw5Y31KCY/YMC8QB35p4Pb3C4Upn4Az7UMoHAqzqTv8x8pPar
 q2FVGZwG+zt1qJviFpwvAKQo5N9BuFgiW9oliChFOuLiYsUqCvKAcLbVoHFvFP9A
 KbUKSd6RZQjbesK2YN3d1/SDY+nQ1TBxax34dcoGVXu5UYvF4aytk4ll9Assledj
 dlZf5PjdeqVIjebFf/arlZKyiTgXMpdxpzlK0f3vnQ4aIgGOabyZZA5JEkGsL0l6
 GL4nQUdQsGyDrQ1IAmjimJnz5aOcg25Q1nGR5R6YpV5YJpdCD3Fg4kNhgrUVl7g1
 IEQ1le0hq9ctSA==
X-ME-Sender: <xms:8TVKXnZkH370LRVYVjpEQGFA3gHUs08guuRy8DFCbMj1S-pnTYETuA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeehgdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppe
 ejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:8TVKXmULydfE0Y8aU_T76vjTNZpd-wo4htiuzHC6emp-t8jii-Gm5g>
 <xmx:8TVKXli286flikrxgFtDAwZkEhnWdrgGnjP83yGFvomsajdS2PU33w>
 <xmx:8TVKXikIgD6BoNClFg_itC-BJZfXiL_t0mPekxGEi63PZBFdNc1wlA>
 <xmx:8TVKXvmstRxWwOZdnT6J8wz7HbnjF5SWjq-vOPRpgafdBy27mktaeA>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id C3585328005D;
 Mon, 17 Feb 2020 01:42:56 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@free-electrons.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Date: Mon, 17 Feb 2020 00:42:26 -0600
Message-Id: <20200217064250.15516-11-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200217064250.15516-1-samuel@sholland.org>
References: <20200217064250.15516-1-samuel@sholland.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 stable@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [RFC PATCH 10/34] ASoC: sun8i-codec: Advertise only
	hardware-supported rates
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

The hardware does not support 64kHz, 88.2kHz, or 176.4kHz sample rates,
so the driver should not advertise them. The hardware can handle two
additional non-standard sample rates: 12kHz and 24kHz, so declare
support for them via SNDRV_PCM_RATE_KNOT.

Cc: stable@kernel.org
Fixes: 36c684936fae ("ASoC: Add sun8i digital audio codec")
Fixes: eda85d1fee05 ("ASoC: sun8i-codec: Add ADC support for a33")
Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index dca6f4b9d4b8..bf12f5199e96 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -86,6 +86,11 @@
 #define SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV_MASK	GENMASK(8, 6)
 #define SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV_MASK	GENMASK(12, 9)
 
+#define SUN8I_AIF_PCM_RATES (SNDRV_PCM_RATE_8000_48000|\
+			     SNDRV_PCM_RATE_96000|\
+			     SNDRV_PCM_RATE_192000|\
+			     SNDRV_PCM_RATE_KNOT)
+
 struct sun8i_codec {
 	struct regmap	*regmap;
 	struct clk	*clk_module;
@@ -515,7 +520,7 @@ static struct snd_soc_dai_driver sun8i_codec_dai = {
 		.stream_name = "Playback",
 		.channels_min = 1,
 		.channels_max = 2,
-		.rates = SNDRV_PCM_RATE_8000_192000,
+		.rates = SUN8I_AIF_PCM_RATES,
 		.formats = SNDRV_PCM_FMTBIT_S16_LE,
 	},
 	/* capture capabilities */
@@ -523,7 +528,7 @@ static struct snd_soc_dai_driver sun8i_codec_dai = {
 		.stream_name = "Capture",
 		.channels_min = 1,
 		.channels_max = 2,
-		.rates = SNDRV_PCM_RATE_8000_192000,
+		.rates = SUN8I_AIF_PCM_RATES,
 		.formats = SNDRV_PCM_FMTBIT_S16_LE,
 		.sig_bits = 24,
 	},
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
