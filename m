Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF63D5B235B
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 18:15:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DF891745;
	Thu,  8 Sep 2022 18:14:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DF891745
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662653737;
	bh=jIUdtkT4ddNfSHRyN+v/gxKe5FoYLf2qnOUA50l2MJs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S5haVYHjPLY+hB/bRlW8T+RnYXNEi19e5UhA6RJXye5+whpCx9jShF+xj3f0383mj
	 Pyu4lg5VZc1WblyqlOnVdN66CKk4W0+guSxiBS5LCtYlKE3oEGLLynOa2WBMgK3njw
	 U4fZstJNGXaHwtffl6cxES/fGr6VROlEwoORW7BY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FB53F8057D;
	Thu,  8 Sep 2022 18:12:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A442F80552; Thu,  8 Sep 2022 18:12:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46C19F80553
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 18:12:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46C19F80553
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="jtWMhA7r"
Received: from notapiano.myfiosgateway.com (unknown [70.107.189.129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 888606601FBA;
 Thu,  8 Sep 2022 17:12:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1662653537;
 bh=jIUdtkT4ddNfSHRyN+v/gxKe5FoYLf2qnOUA50l2MJs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jtWMhA7rx+v6qQhy1Em7Y3pjtbUzQj8/i1otNHUbCYCcSaCUyEfcrU2ep2jWw7n+c
 Vi7Kw2+2ZrR9iKeic1dCieNkmsEanp0Dae2wZImJZrWNi7UyhFIG2bX6hvCUjh6S2R
 My48lMeVEcfu0JzQXZKVWZrHkuDftmfZ9BCePITcAodyj2OABTO2xo4MCuJfO08ZWc
 meiQP8R/jUvThecyTUbwOfNjOtkQl1GbPtCf1/xoIJwKQu8WwzWVdkHKF8OrnjPS1B
 uELc+YqiumTjSPxbkalPp1hg7QzjL51eJyZyiKGo2/hawSfVf94nhOdPd+hpTPOI/M
 VeILSfFXCcBRQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 10/10] ASoC: mediatek: mt8186: Remove clock share parsing from
 DT
Date: Thu,  8 Sep 2022 12:11:54 -0400
Message-Id: <20220908161154.648557-11-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220908161154.648557-1-nfraprado@collabora.com>
References: <20220908161154.648557-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Chunxu Li <chunxu.li@mediatek.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 Dan Carpenter <dan.carpenter@oracle.com>,
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

 sound/soc/mediatek/mt8186/mt8186-dai-i2s.c | 30 ----------------------
 1 file changed, 30 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-i2s.c b/sound/soc/mediatek/mt8186/mt8186-dai-i2s.c
index 7e8cad682c83..f07181be4370 100644
--- a/sound/soc/mediatek/mt8186/mt8186-dai-i2s.c
+++ b/sound/soc/mediatek/mt8186/mt8186-dai-i2s.c
@@ -44,7 +44,6 @@ struct mtk_afe_i2s_priv {
 	int low_jitter_en;
 	int master; /* only i2s0 has slave mode*/
 
-	const char *share_property_name;
 	int share_i2s_id;
 
 	int mclk_id;
@@ -1140,50 +1139,26 @@ static const struct mtk_afe_i2s_priv mt8186_i2s_priv[DAI_I2S_NUM] = {
 	[DAI_I2S0] = {
 		.id = MT8186_DAI_I2S_0,
 		.mclk_id = MT8186_I2S0_MCK,
-		.share_property_name = "i2s0-share",
 		.share_i2s_id = -1,
 	},
 	[DAI_I2S1] = {
 		.id = MT8186_DAI_I2S_1,
 		.mclk_id = MT8186_I2S1_MCK,
-		.share_property_name = "i2s1-share",
 		.share_i2s_id = -1,
 	},
 	[DAI_I2S2] = {
 		.id = MT8186_DAI_I2S_2,
 		.mclk_id = MT8186_I2S2_MCK,
-		.share_property_name = "i2s2-share",
 		.share_i2s_id = -1,
 	},
 	[DAI_I2S3] = {
 		.id = MT8186_DAI_I2S_3,
 		/*  clock gate naming is hf_faud_i2s4_m_ck*/
 		.mclk_id = MT8186_I2S4_MCK,
-		.share_property_name = "i2s3-share",
 		.share_i2s_id = -1,
 	}
 };
 
-static int mt8186_dai_i2s_get_share(struct mtk_base_afe *afe)
-{
-	struct mt8186_afe_private *afe_priv = afe->platform_priv;
-	const struct device_node *of_node = afe->dev->of_node;
-	const char *of_str;
-	const char *property_name;
-	struct mtk_afe_i2s_priv *i2s_priv;
-	int i;
-
-	for (i = 0; i < DAI_I2S_NUM; i++) {
-		i2s_priv = afe_priv->dai_priv[mt8186_i2s_priv[i].id];
-		property_name = mt8186_i2s_priv[i].share_property_name;
-		if (of_property_read_string(of_node, property_name, &of_str))
-			continue;
-		i2s_priv->share_i2s_id = get_i2s_id_by_name(afe, of_str);
-	}
-
-	return 0;
-}
-
 /**
  * mt8186_dai_i2s_set_share() - Set up I2S ports to share a single clock.
  * @afe: Pointer to &struct mtk_base_afe
@@ -1252,10 +1227,5 @@ int mt8186_dai_i2s_register(struct mtk_base_afe *afe)
 	if (ret)
 		return ret;
 
-	/* parse share i2s */
-	ret = mt8186_dai_i2s_get_share(afe);
-	if (ret)
-		return ret;
-
 	return 0;
 }
-- 
2.37.3

