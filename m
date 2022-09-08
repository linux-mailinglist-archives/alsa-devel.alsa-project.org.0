Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9328F5B2343
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 18:14:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2418F172E;
	Thu,  8 Sep 2022 18:13:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2418F172E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662653662;
	bh=1m8CobNwZn4GhVwZE+bnolPPFRG5PI3OCAmyya1eAAI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q2CV3iGujJzwEYDbi7b3g+Q1TI6hTzR+RXyJkwRm32ZZThl4AlWDBD+BVvy1f4haE
	 LVGHK5bYjnka8Ygj52EL1bSbiCtZ2E5x6DbguVCy7SiQeH9QacEtQezJFOeSco9Fp1
	 2Yfh26T9ytbmFlqU3rqEaIm1VbAr82A07UcAsPCM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F08F1F80553;
	Thu,  8 Sep 2022 18:12:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CDF4F80558; Thu,  8 Sep 2022 18:12:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D20F9F80535
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 18:12:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D20F9F80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="ZXi4qRc1"
Received: from notapiano.myfiosgateway.com (unknown [70.107.189.129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BA9846601FB3;
 Thu,  8 Sep 2022 17:12:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1662653526;
 bh=1m8CobNwZn4GhVwZE+bnolPPFRG5PI3OCAmyya1eAAI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZXi4qRc1Z4CqK2vX59XBgyqXt/EKvwcoMQvhBcNRm9auQetdppCb3o1TMd26hhmQk
 5ByJWTReYOHoFECKSxGvFHHj08WqNjQkpkJTvS3pfWc9rMjaH//yttXpb938dSlwpz
 PAsM/6AZRxa/a3DNTokHEoZi2C3UGwmu13IQ4nND6pqiNVDjNaG0Pam3Hg4NvEH1Mv
 a3GF4G8PJ3SizXkExy6WEgzRT5xxTcPy3BRg2Xz44nzWegMw2KyOxnCoB9vuxy5KK1
 +ojlAq2aBAlL3a7xHdFQ61ozPaeeN1sQbjGMW0GEz7kp9S8C/JwpnkaCm5FA5+Olj1
 CBtlDEE0q1FHA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 04/10] ASoC: mediatek: mt8183: Allow setting shared clocks
 from machine driver
Date: Thu,  8 Sep 2022 12:11:48 -0400
Message-Id: <20220908161154.648557-5-nfraprado@collabora.com>
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

Add a new function to configure the shared clock between two i2s ports,
and export it. This will allow the clock sharing to be set from the
machine driver instead of the devicetree.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

 sound/soc/mediatek/mt8183/mt8183-afe-common.h |  3 +++
 sound/soc/mediatek/mt8183/mt8183-dai-i2s.c    | 26 +++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-common.h b/sound/soc/mediatek/mt8183/mt8183-afe-common.h
index b220e7a7db7e..40ab48c1566c 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-common.h
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-common.h
@@ -99,6 +99,9 @@ unsigned int mt8183_general_rate_transform(struct device *dev,
 unsigned int mt8183_rate_transform(struct device *dev,
 				   unsigned int rate, int aud_blk);
 
+int mt8183_dai_i2s_set_share(struct mtk_base_afe *afe, const char *main_i2s_name,
+			     const char *secondary_i2s_name);
+
 /* dai register */
 int mt8183_dai_adda_register(struct mtk_base_afe *afe);
 int mt8183_dai_pcm_register(struct mtk_base_afe *afe);
diff --git a/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c b/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
index 138591d71ebd..8902ff608d26 100644
--- a/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
+++ b/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
@@ -1026,6 +1026,32 @@ static int mt8183_dai_i2s_get_share(struct mtk_base_afe *afe)
 	return 0;
 }
 
+/**
+ * mt8183_dai_i2s_set_share() - Set up I2S ports to share a single clock.
+ * @afe: Pointer to &struct mtk_base_afe
+ * @main_i2s_name: The name of the I2S port that will provide the clock
+ * @secondary_i2s_name: The name of the I2S port that will use this clock
+ */
+int mt8183_dai_i2s_set_share(struct mtk_base_afe *afe, const char *main_i2s_name,
+			     const char *secondary_i2s_name)
+{
+	struct mtk_afe_i2s_priv *secondary_i2s_priv;
+	int main_i2s_id;
+
+	secondary_i2s_priv = get_i2s_priv_by_name(afe, secondary_i2s_name);
+	if (!secondary_i2s_priv)
+		return -EINVAL;
+
+	main_i2s_id = get_i2s_id_by_name(afe, main_i2s_name);
+	if (main_i2s_id < 0)
+		return main_i2s_id;
+
+	secondary_i2s_priv->share_i2s_id = main_i2s_id;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mt8183_dai_i2s_set_share);
+
 static int mt8183_dai_i2s_set_priv(struct mtk_base_afe *afe)
 {
 	struct mt8183_afe_private *afe_priv = afe->platform_priv;
-- 
2.37.3

