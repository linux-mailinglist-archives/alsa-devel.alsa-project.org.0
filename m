Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4429C5B0671
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 16:24:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF9251669;
	Wed,  7 Sep 2022 16:23:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF9251669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662560673;
	bh=y56zi/60F5ITxynDT2hlctMP4NfN49y+o3mIImmH3Dg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qk9816F5ruC4KSyo0mLoQ2oC21qqLopXfoxd+fdYTOCaea3Ave8vO+Un5iAu+ippA
	 j6p2iVwRjK/P5T0P6SknCpwhDKJhqRRKn2QiTCuLBNTJjYHmGhoaJgYpzq+vVXnnDf
	 ctDIYJ7t7cI5yvwttB/9EG0hUf/WsG1B88cBrWlU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0D03F80542;
	Wed,  7 Sep 2022 16:22:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1DBBF80558; Wed,  7 Sep 2022 16:22:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C853F80533
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 16:22:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C853F80533
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.b="AhbVgluw"
Received: from booty.fritz.box (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id E8775200007;
 Wed,  7 Sep 2022 14:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1662560531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hkh90Imkp9wad8yz7UhVbHvGQ7u2lRuqcdvVsAUHVf8=;
 b=AhbVgluwrJrNd+ZcBjQHaMqV4FSxpzqM601IbJNxKfAAmIIxy0f7OssfjbEkcOVea1pjUp
 x9+sKrwzlELO7L2QhPqkQUch8GB+iaLgzb2anM0ZWHYKcZvvlVXl0BswKpbCHHdAdRVZKj
 eeJSIh3wpoQSYe2zUOJ5pFiPxRzziImWfq/Lrmp7q250f4fjQ27YcAQXNEc9NV1YTQHgSc
 znSI++2sdpd3VvbPLBGfzGoLHHPPZaL74RMmlCHFlqzVg0cGQvYu9PoBu+eC03ViSVvMWp
 RgL1VH4yIBqgkvwHlTxzGMgOkA2GqBen4Y6L8q2ls4dMgJM98UA+78b/DHmvxw==
From: luca.ceresoli@bootlin.com
To: alsa-devel@alsa-project.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 5/8] ASoC: rockchip: i2s-tdm: Fix clk_id usage in .set_sysclk()
Date: Wed,  7 Sep 2022 16:21:21 +0200
Message-Id: <20220907142124.2532620-6-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220907142124.2532620-1-luca.ceresoli@bootlin.com>
References: <20220907142124.2532620-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 Takashi Iwai <tiwai@suse.com>, Chris Morgan <macromorgan@hotmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Johan Jonker <jbx6244@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
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

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

There are two problems with the second parameter of
rockchip_i2s_tdm_set_sysclk():

 1. The second argument to a .set_sysclk() op is a clk_id, not a stream
    index, so it is incorrect to compare it with SNDRV_PCM_STREAM_PLAYBACK.

    Technically this code works correctly anyway because
    SNDRV_PCM_STREAM_PLAYBACK is defined as 0, which is also the clk_id for
    the mclk_tx as enforced by the device tree bindings. So this is a
    formal error, not triggering incorrect behaviour.

 2. The else branch will consider any nonzero value as "rx", while only
    value 1 should be allowed for the mclk_rx clock. This does trigger
    incorrect behaviour if passing clk_id not equal to 0 or 1.

Fix problem 1 by adding a new enum for the clock indexes as enforced in
device tree and replace accordingly:

 * stream -> clk_id
 * SNDRV_PCM_STREAM_PLAYBACK -> CLK_MCLK_TX (value 0)

Fix problem 2 by adding an 'else if' and returning error if clk_id is not 0
or 1.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 sound/soc/rockchip/rockchip_i2s_tdm.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index 2550bd2a5e78..4aa80fedb996 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -34,6 +34,9 @@
 #define TRCM_TX 1
 #define TRCM_RX 2
 
+/* Clock indexes as enforced by the DT bindings */
+enum { CLK_IDX_MCLK_TX, CLK_IDX_MCLK_RX };
+
 struct txrx_config {
 	u32 addr;
 	u32 reg;
@@ -969,7 +972,7 @@ static int rockchip_i2s_tdm_trigger(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int rockchip_i2s_tdm_set_sysclk(struct snd_soc_dai *cpu_dai, int stream,
+static int rockchip_i2s_tdm_set_sysclk(struct snd_soc_dai *cpu_dai, int clk_id,
 				       unsigned int freq, int dir)
 {
 	struct rk_i2s_tdm_dev *i2s_tdm = to_info(cpu_dai);
@@ -978,15 +981,18 @@ static int rockchip_i2s_tdm_set_sysclk(struct snd_soc_dai *cpu_dai, int stream,
 	if (i2s_tdm->clk_trcm) {
 		i2s_tdm->mclk_tx_freq = freq;
 		i2s_tdm->mclk_rx_freq = freq;
+
+		dev_dbg(i2s_tdm->dev, "mclk freq: %u", freq);
 	} else {
-		if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (clk_id == CLK_IDX_MCLK_TX)
 			i2s_tdm->mclk_tx_freq = freq;
-		else
+		else if (clk_id == CLK_IDX_MCLK_RX)
 			i2s_tdm->mclk_rx_freq = freq;
-	}
+		else
+			return -ENOTSUPP;
 
-	dev_dbg(i2s_tdm->dev, "The target mclk_%s freq is: %d\n",
-		stream ? "rx" : "tx", freq);
+		dev_dbg(i2s_tdm->dev, "mclk[%d] freq: %u", clk_id, freq);
+	}
 
 	return 0;
 }
-- 
2.34.1

