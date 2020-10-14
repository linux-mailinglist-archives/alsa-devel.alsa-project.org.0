Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA0C28D9FC
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Oct 2020 08:27:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 005D8172A;
	Wed, 14 Oct 2020 08:26:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 005D8172A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602656840;
	bh=SEld9Jqaxyi60LULYFdZ5N5Ye3jsj5hOQZa4fyYfzyQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZqmVmrofXLp3ggpCQbYzT4ZeV6ICAX5eMpcR0f01V+nfON8DoeUjdHY0D/LoMimQf
	 5L1kOxyniMNbFZTUf3BB+XSvaWY6P5qPSHQkInlB8O+WMLB94ZXQ1KttleKjMG/Dxm
	 m02wR5i58sBNZHGdZnopTjFCp+GP2T/mW+o4wU/Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ACAF3F8032A;
	Wed, 14 Oct 2020 08:20:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 470E6F80303; Wed, 14 Oct 2020 08:20:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE61EF8026B
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 08:19:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE61EF8026B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="T79lwkAi"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="iqDB9nTI"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 246E5D2E;
 Wed, 14 Oct 2020 02:19:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 14 Oct 2020 02:19:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=BTR+ryKE7DtdE
 KIrngfPXNIZoaFIzP9vUOerOx2ZUdM=; b=T79lwkAiV9zQ4HOMg6cb+b+zYAIzS
 nYEol/onIrTkWvDwST0Yb1F8EYa+aUlKsSZZ+yEdJLWNVaykDgk9EmDmTYZpigSR
 hS6mhfV+07QJqnao56+FhwS8bsETq708d+09Hpe7VJx8DhnqvnwwWz0uBShMStFt
 rNEMn3FMcHJrb2p8DVeOAQwK9Vc1SrC2VW9ao5GitVkNWRUCzQg8IzoegUNZtMpZ
 HTn+H0J+iuRU1UVK9hoXsuQyLDZNgjSqDOVBOZzuXFppFMw1Xks0OPfldI/XPlah
 Kw8WIg25jkoaJdnWYNQJB7I4FWK8TyIx2uGdPU6M1zAiRRD6ocOn/75Rg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=BTR+ryKE7DtdEKIrngfPXNIZoaFIzP9vUOerOx2ZUdM=; b=iqDB9nTI
 iCWsoQaZL1C97LcVi6qYJK96qv5jYWu7C7Eh+XEop/YOoKPxY7rcEXOVVnzet8x6
 1XEonQpdfvBF/aesk9zTlkL34zNaGjX09gtfYCrNQZWWWRAiflJNpDM+mEpCdqU/
 jBQaik/PVCcnOz10Pvym0YW1oQ7ZxSsu8EiaQUjXKjFR33kYOmAxHg71G0Toz3Bc
 5uyVWnRC8jxa9F7ZqihUCoEZPvUXKNtsXicKVCnzsko6x9nQmbY+TECoxgCStjJk
 unrzt0aflg1GjLEZGR94eWBoojFSZQ8HmH3ZkKC2jtSto8EY33ZK1MimleHqufpF
 9vqn1nt1+k8QjQ==
X-ME-Sender: <xms:hJiGX-f6KTsyUmoniDJvo9jhUV3nszT8WprUinwC7LCHcxVjORMTyg>
 <xme:hJiGX4N6Nc_UcazdGoUT75IF-itQumUuWynL8xmoqK-KFS4pTxze9v78BmyYi35-1
 avnjwS87bqfPZ4BHQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedriedtgddutdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuih
 iivgepjeenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
 ugdrohhrgh
X-ME-Proxy: <xmx:hJiGX_gz-8edLpuUh9IaltdfYSd5h2ZXEFSEBBeEmE09xcerGpQjYA>
 <xmx:hJiGX79cKRTiEcJuC3WqeIsL_c3mRHp84ZBblM5rf2oUpewBmHbVLQ>
 <xmx:hJiGX6vbRx3bNUc6k-XByEm25Ycx_bRWk5fABLR6-UiQhOI25aCJ5A>
 <xmx:hJiGX4AKP4HUps67_o62Ap7DRGXt3KlYvCFWRu4sLrIRWPG8lwEUHqlgacA>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 05995328005A;
 Wed, 14 Oct 2020 02:19:47 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 13/17] ASoC: sun8i-codec: Require an exact BCLK divisor
 match
Date: Wed, 14 Oct 2020 01:19:37 -0500
Message-Id: <20201014061941.4306-14-samuel@sholland.org>
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

Now that we guarantee that SYSCLK is running at the optimal rate when
hw_params succeeds, and that it will continue running at that rate,
SYSCLK will always be an integer multiple of BCLK. So we can always
pick the exact divider, not just the closest divider.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 253857e66f6f..a530e58018b7 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -384,35 +384,31 @@ static const struct sun8i_codec_clk_div sun8i_codec_bclk_div[] = {
 	{ .div = 32,	.val = 8 },
 	{ .div = 48,	.val = 9 },
 	{ .div = 64,	.val = 10 },
 	{ .div = 96,	.val = 11 },
 	{ .div = 128,	.val = 12 },
 	{ .div = 192,	.val = 13 },
 };
 
-static u8 sun8i_codec_get_bclk_div(unsigned int sysclk_rate,
-				   unsigned int lrck_div_order,
-				   unsigned int sample_rate)
+static int sun8i_codec_get_bclk_div(unsigned int sysclk_rate,
+				    unsigned int lrck_div_order,
+				    unsigned int sample_rate)
 {
 	unsigned int div = sysclk_rate / sample_rate >> lrck_div_order;
-	unsigned int best_val = 0, best_diff = ~0;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(sun8i_codec_bclk_div); i++) {
 		const struct sun8i_codec_clk_div *bdiv = &sun8i_codec_bclk_div[i];
-		unsigned int diff = abs(bdiv->div - div);
 
-		if (diff < best_diff) {
-			best_diff = diff;
-			best_val = bdiv->val;
-		}
+		if (bdiv->div == div)
+			return bdiv->val;
 	}
 
-	return best_val;
+	return -EINVAL;
 }
 
 static int sun8i_codec_get_lrck_div_order(unsigned int slots,
 					  unsigned int slot_width)
 {
 	unsigned int div = slots * slot_width;
 
 	if (div < 16 || div > 256)
@@ -431,18 +427,17 @@ static int sun8i_codec_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_soc_dai *dai)
 {
 	struct sun8i_codec *scodec = snd_soc_dai_get_drvdata(dai);
 	struct sun8i_codec_aif *aif = &scodec->aifs[dai->id];
 	unsigned int sample_rate = params_rate(params);
 	unsigned int slots = aif->slots ?: params_channels(params);
 	unsigned int slot_width = aif->slot_width ?: params_width(params);
 	unsigned int sysclk_rate = sun8i_codec_get_sysclk_rate(sample_rate);
-	int lrck_div_order, ret, word_size;
-	u8 bclk_div;
+	int bclk_div, lrck_div_order, ret, word_size;
 
 	/* word size */
 	switch (params_width(params)) {
 	case 8:
 		word_size = 0x0;
 		break;
 	case 16:
 		word_size = 0x1;
@@ -467,16 +462,19 @@ static int sun8i_codec_hw_params(struct snd_pcm_substream *substream,
 		return lrck_div_order;
 
 	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
 			   SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV_MASK,
 			   (lrck_div_order - 4) << SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV);
 
 	/* BCLK divider (SYSCLK/BCLK ratio) */
 	bclk_div = sun8i_codec_get_bclk_div(sysclk_rate, lrck_div_order, sample_rate);
+	if (bclk_div < 0)
+		return bclk_div;
+
 	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
 			   SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV_MASK,
 			   bclk_div << SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV);
 
 	/*
 	 * SYSCLK rate
 	 *
 	 * Clock rate protection is reference counted; but hw_params may be
-- 
2.26.2

