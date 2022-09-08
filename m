Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD815B233D
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 18:13:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11EBC1733;
	Thu,  8 Sep 2022 18:12:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11EBC1733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662653614;
	bh=xEF1CQNN9sntlz4PLeIKwVS7wPU/B5aUiicOkcoBGNg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ENwgEi2vUD/mWvzDA2bxRLJn5rwf7rNorVbj+HiYyC97mmPuSZuCWB/UTXPpyexEi
	 TGKCyo099mHr6Y/hulovPL9osSXPSzzPPWUc5zGl7gJ/FuZdpF8m+hOvGA41iuwzfY
	 m+EGlsLWoMxv1EINDjgOkxPR2jYhByhoeRkr0gVA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72E02F804B3;
	Thu,  8 Sep 2022 18:12:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA405F80538; Thu,  8 Sep 2022 18:12:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8522FF804B3
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 18:12:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8522FF804B3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="QXzUjpAT"
Received: from notapiano.myfiosgateway.com (unknown [70.107.189.129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3BB776601FAE;
 Thu,  8 Sep 2022 17:12:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1662653525;
 bh=xEF1CQNN9sntlz4PLeIKwVS7wPU/B5aUiicOkcoBGNg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QXzUjpATw+vcXLt0B57A1UD38hGGFrLsbi95cKwhFYv3CQXtwc9z5UYGoAk7R3PQm
 +aOQYa5FmFd/ZPJQxPkX8zzaoLUmPWnM2Ug6OpNeg3uGC/tMJsiD+t4+5785ji7krJ
 PL61L7za3JIHWSPBXc6MHI2FXEPftMtfPUDdJLIUEsl0aSgT9cCFsJkes4LWxIkMcN
 n927BxS+qUE8l9+MUb8VjVSX/AGhEuEi8nUhs7+EblODXeJmLF8orSUZTSjJBsmHOh
 X8v/Vz9NKqibPmFBXHT6TAyjaZTT2VoZPA+116upf1o3NWenVJ3Pt7DiZALn0LtU3T
 JGnXnqOuh+ItQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 03/10] ASoC: mediatek: mt8192: Remove clock share parsing from
 DT
Date: Thu,  8 Sep 2022 12:11:47 -0400
Message-Id: <20220908161154.648557-4-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220908161154.648557-1-nfraprado@collabora.com>
References: <20220908161154.648557-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

Now that the clock sharing for i2s ports can be configured from the
sound machine driver, remove the logic that was used to parse the
properties from the devicetree.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

 sound/soc/mediatek/mt8192/mt8192-dai-i2s.c | 35 ----------------------
 1 file changed, 35 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c b/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
index 630ed7261fc3..ea516d63d94d 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
@@ -45,7 +45,6 @@ struct mtk_afe_i2s_priv {
 	int rate; /* for determine which apll to use */
 	int low_jitter_en;
 
-	const char *share_property_name;
 	int share_i2s_id;
 
 	int mclk_id;
@@ -1984,79 +1983,50 @@ static const struct mtk_afe_i2s_priv mt8192_i2s_priv[DAI_I2S_NUM] = {
 	[DAI_I2S0] = {
 		.id = MT8192_DAI_I2S_0,
 		.mclk_id = MT8192_I2S0_MCK,
-		.share_property_name = "i2s0-share",
 		.share_i2s_id = -1,
 	},
 	[DAI_I2S1] = {
 		.id = MT8192_DAI_I2S_1,
 		.mclk_id = MT8192_I2S1_MCK,
-		.share_property_name = "i2s1-share",
 		.share_i2s_id = -1,
 	},
 	[DAI_I2S2] = {
 		.id = MT8192_DAI_I2S_2,
 		.mclk_id = MT8192_I2S2_MCK,
-		.share_property_name = "i2s2-share",
 		.share_i2s_id = -1,
 	},
 	[DAI_I2S3] = {
 		.id = MT8192_DAI_I2S_3,
 		.mclk_id = MT8192_I2S3_MCK,
-		.share_property_name = "i2s3-share",
 		.share_i2s_id = -1,
 	},
 	[DAI_I2S5] = {
 		.id = MT8192_DAI_I2S_5,
 		.mclk_id = MT8192_I2S5_MCK,
-		.share_property_name = "i2s5-share",
 		.share_i2s_id = -1,
 	},
 	[DAI_I2S6] = {
 		.id = MT8192_DAI_I2S_6,
 		.mclk_id = MT8192_I2S6_MCK,
-		.share_property_name = "i2s6-share",
 		.share_i2s_id = -1,
 	},
 	[DAI_I2S7] = {
 		.id = MT8192_DAI_I2S_7,
 		.mclk_id = MT8192_I2S7_MCK,
-		.share_property_name = "i2s7-share",
 		.share_i2s_id = -1,
 	},
 	[DAI_I2S8] = {
 		.id = MT8192_DAI_I2S_8,
 		.mclk_id = MT8192_I2S8_MCK,
-		.share_property_name = "i2s8-share",
 		.share_i2s_id = -1,
 	},
 	[DAI_I2S9] = {
 		.id = MT8192_DAI_I2S_9,
 		.mclk_id = MT8192_I2S9_MCK,
-		.share_property_name = "i2s9-share",
 		.share_i2s_id = -1,
 	},
 };
 
-static int mt8192_dai_i2s_get_share(struct mtk_base_afe *afe)
-{
-	struct mt8192_afe_private *afe_priv = afe->platform_priv;
-	const struct device_node *of_node = afe->dev->of_node;
-	const char *of_str;
-	const char *property_name;
-	struct mtk_afe_i2s_priv *i2s_priv;
-	int i;
-
-	for (i = 0; i < DAI_I2S_NUM; i++) {
-		i2s_priv = afe_priv->dai_priv[mt8192_i2s_priv[i].id];
-		property_name = mt8192_i2s_priv[i].share_property_name;
-		if (of_property_read_string(of_node, property_name, &of_str))
-			continue;
-		i2s_priv->share_i2s_id = get_i2s_id_by_name(afe, of_str);
-	}
-
-	return 0;
-}
-
 /**
  * mt8192_dai_i2s_set_share() - Set up I2S ports to share a single clock.
  * @afe: Pointer to &struct mtk_base_afe
@@ -2127,10 +2097,5 @@ int mt8192_dai_i2s_register(struct mtk_base_afe *afe)
 	if (ret)
 		return ret;
 
-	/* parse share i2s */
-	ret = mt8192_dai_i2s_get_share(afe);
-	if (ret)
-		return ret;
-
 	return 0;
 }
-- 
2.37.3

