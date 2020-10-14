Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CE728D9FA
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Oct 2020 08:26:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E669116D0;
	Wed, 14 Oct 2020 08:25:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E669116D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602656790;
	bh=iRG6iNM26ZiSutda5KIrrOBgwQCGNFsM4xx/hZaF6Io=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qkT7uBmenYQ8jNOBxCpW+9FFc5O/Q7Mo7bdVPmaPudTSPHnVaNRZFjy5j6I9DCby0
	 j2W651MMxRH1PoLsn2R45lqoOX3sipUtisx2zNOdBaew3QFZ1dD7y7w295McRYMV56
	 Z2VxISm8zfcubQYtgGbb+G3BtqSEcl+0aP7m/TT0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2986DF80287;
	Wed, 14 Oct 2020 08:20:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA88EF8012B; Wed, 14 Oct 2020 08:20:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11E3CF8012B
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 08:19:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11E3CF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="PB/n1MLS"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="rMxt61sl"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id DA9CCCC1;
 Wed, 14 Oct 2020 02:19:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 14 Oct 2020 02:19:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=qMXbxDcWIkpCk
 9GYPIWt4LUbNz6aTD869ZMOsfwd1OY=; b=PB/n1MLSPTpW4i3XAJczC41JlBf/e
 /p1NsFKR81LQcyaUrZLUL397PY1zBwsRopDSP//YWcsoqEhHX/x7VPCSqQprKB69
 YJu8AMidHvIpRX+iy5U0RpmvL8x5h9nZm1WXN7UHyljGpdQOl6Xh5UMdTM8HiUku
 gV5zHCv9iSRkRk28/3rSV+RvWGwkkh+BASzO11+wCCkz90oHGYj6lkswBcUQgEa9
 l2dlrQB6J1hTewOPR6Qwksd6F0PWo8HUTRFTlLe/KOn01fSGSw/TgvtYzERKv5I6
 /3JhrFHzOYxO8JjwYokgCB0fjng3+2Szn70+14cVI5e3Z2sVplDyFyfeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=qMXbxDcWIkpCk9GYPIWt4LUbNz6aTD869ZMOsfwd1OY=; b=rMxt61sl
 QT9eHGzNDA6H0YbHi2xqUr22vXlfzxmDo4lPN4dZ7GBrrtNozECI2q7FD9MD2own
 4mZfOlCpSDwPkNLk9qcwm/iedQkWPax2V2sHYRJCDD6ad5ZiiVl9eqj9pUMnEWcD
 79XU6laMiOUb7KohekQbgx+JP4mS6M96DQnGXIWivKajo/7eDlXzLLtX5zCXfDQ/
 dirHapxcUuJataI9nwQlxC5rwrlyf1SNqm4zb6vZEyd8m/J+bwT8K/6FuT65RKUs
 qX3RHET9Xj3zesiEkU5F4/tqm6AMth6NqhSLsBcp+4Z65cPUOc4CgbsFxeOFie3r
 UW+CCvVvLw57gw==
X-ME-Sender: <xms:gJiGXycIEtOS2kjBa-kwkcD8Cp3WDADr8fWU8twC0S7YUc-wDcilmw>
 <xme:gJiGX8Oe6q83EO0eYxWih7I_i_C5YJNO4ZFdtDAs3Ead73UyJLYj1jyLWj49A9m12
 PjDWeLcFL9iAb0Y4Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedriedtgddutdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
 ugdrohhrgh
X-ME-Proxy: <xmx:gJiGXzgjrR60AmitZfhkA6K-e6iQrxWk7r1OlPvWfMdUdN9SxcETCQ>
 <xmx:gJiGX_-63-mxfFsemlhELLEIvvvUKnOsfaxqPtrLr8789bW0GeEE-A>
 <xmx:gJiGX-t8m1dyBTswyYsZWZEP7KNLnphPsxTvkjZELqtlxaeJhQ3zhA>
 <xmx:gJiGX8BJS1HCWWJoSWHTk5GBQw45dVYNtfgfjg7pHW0JvCc5fQLEvbEu6iI>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id BADD63280068;
 Wed, 14 Oct 2020 02:19:43 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 04/17] ASoC: sun8i-codec: Use the provided word size
Date: Wed, 14 Oct 2020 01:19:28 -0500
Message-Id: <20201014061941.4306-5-samuel@sholland.org>
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

The hardware supports 8 to 24-bit word sizes on all three of its DAIs,
only one of which is connected to the CPU DAI. Program the word size
based on the actual selected format, instead of assuming limitations
from another driver (which, incedentally, has patches pending to remove
that limitation).

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 77eb0fd01e3d..82576066c249 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -43,17 +43,16 @@
 #define SUN8I_SYS_SR_CTRL_AIF1_FS			12
 #define SUN8I_SYS_SR_CTRL_AIF2_FS			8
 #define SUN8I_AIF1CLK_CTRL				0x040
 #define SUN8I_AIF1CLK_CTRL_AIF1_MSTR_MOD		15
 #define SUN8I_AIF1CLK_CTRL_AIF1_CLK_INV			13
 #define SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV		9
 #define SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV		6
 #define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ		4
-#define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ_16		(1 << 4)
 #define SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT		2
 #define SUN8I_AIF1_ADCDAT_CTRL				0x044
 #define SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0L_ENA		15
 #define SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0R_ENA		14
 #define SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0L_SRC		10
 #define SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0R_SRC		8
 #define SUN8I_AIF1_DACDAT_CTRL				0x048
 #define SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0L_ENA		15
@@ -317,26 +316,40 @@ static int sun8i_codec_get_lrck_div(unsigned int channels,
 	return ilog2(div) - 4;
 }
 
 static int sun8i_codec_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *params,
 				 struct snd_soc_dai *dai)
 {
 	struct sun8i_codec *scodec = snd_soc_dai_get_drvdata(dai);
-	int sample_rate, lrck_div;
+	int lrck_div, sample_rate, word_size;
 	u8 bclk_div;
 
-	/*
-	 * The CPU DAI handles only a sample of 16 bits. Configure the
-	 * codec to handle this type of sample resolution.
-	 */
+	/* word size */
+	switch (params_width(params)) {
+	case 8:
+		word_size = 0x0;
+		break;
+	case 16:
+		word_size = 0x1;
+		break;
+	case 20:
+		word_size = 0x2;
+		break;
+	case 24:
+		word_size = 0x3;
+		break;
+	default:
+		return -EINVAL;
+	}
+
 	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
 			   SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ_MASK,
-			   SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ_16);
+			   word_size << SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ);
 
 	bclk_div = sun8i_codec_get_bclk_div(scodec, params_rate(params), 16);
 	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
 			   SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV_MASK,
 			   bclk_div << SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV);
 
 	lrck_div = sun8i_codec_get_lrck_div(params_channels(params),
 					    params_physical_width(params));
-- 
2.26.2

