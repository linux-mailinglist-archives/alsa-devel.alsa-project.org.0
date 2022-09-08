Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F26F5B233F
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 18:13:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBDB91704;
	Thu,  8 Sep 2022 18:12:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBDB91704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662653627;
	bh=1WqDXB6TtMeZzZFF3fs3733gWICaFEYhBDZ7cjhR2OA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mujvgv9IJCtIAVSqF0vzjhIRPKTUI1DIcgJXIWh+ej43t1z+6MEv1LkHpfAuVzk8j
	 RLCkUdI4HlDBuclt2TcbSZr5q7gx4aa3qjuU/K1CwYKrhrjcNyE92dS0tq8efHibgU
	 4lEhfECyCUMi+JNEznCFhKQypPr5iGd9TsfD1etc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F611F80533;
	Thu,  8 Sep 2022 18:12:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08BF8F800CB; Thu,  8 Sep 2022 18:12:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1657BF800CB
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 18:12:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1657BF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="Ud2KDDIO"
Received: from notapiano.myfiosgateway.com (unknown [70.107.189.129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id DF1B46601FAB;
 Thu,  8 Sep 2022 17:12:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1662653522;
 bh=1WqDXB6TtMeZzZFF3fs3733gWICaFEYhBDZ7cjhR2OA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ud2KDDIOyNnhmTMC9QXzaAgg+/iyYCs8GWhqGH7L139TirmExcqzaQPID3SD88/pq
 JbOZbqjrA9uDtl99WJpvwrP8Oztap+Z1qt5e3YO85H9/iCAtsJU+kiKpBUiZuEQnwZ
 wMbZK0oAAYiopT6Dxo6FiSj2Kou3dLPhv9owaoaySS5P6SPTDOf918+6WxOe8PPW5J
 29YYUqM9+RzCosGHrbJMeSvPC3ugl5x37rIKUhCGx3AFJTgemtE2jHY4DKqZWmjEDL
 E0sdWpcyAQ3x2UiMF7xBBUZtjw6QiYysOe3qUql4mPiEwf0eeT/UC3uu4ASl2RAh12
 kUK0UlJdhVIdA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 01/10] ASoC: mediatek: mt8192: Allow setting shared clocks
 from machine driver
Date: Thu,  8 Sep 2022 12:11:45 -0400
Message-Id: <20220908161154.648557-2-nfraprado@collabora.com>
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

 sound/soc/mediatek/mt8192/mt8192-afe-common.h |  3 +++
 sound/soc/mediatek/mt8192/mt8192-dai-i2s.c    | 26 +++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-common.h b/sound/soc/mediatek/mt8192/mt8192-afe-common.h
index d55eff46cc7f..ad461dcb6ee1 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-common.h
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-common.h
@@ -159,6 +159,9 @@ int mt8192_dai_src_register(struct mtk_base_afe *afe);
 int mt8192_dai_pcm_register(struct mtk_base_afe *afe);
 int mt8192_dai_tdm_register(struct mtk_base_afe *afe);
 
+int mt8192_dai_i2s_set_share(struct mtk_base_afe *afe, const char *main_i2s_name,
+			     const char *secondary_i2s_name);
+
 unsigned int mt8192_general_rate_transform(struct device *dev,
 					   unsigned int rate);
 unsigned int mt8192_rate_transform(struct device *dev,
diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c b/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
index 5b29340f9516..630ed7261fc3 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
@@ -2057,6 +2057,32 @@ static int mt8192_dai_i2s_get_share(struct mtk_base_afe *afe)
 	return 0;
 }
 
+/**
+ * mt8192_dai_i2s_set_share() - Set up I2S ports to share a single clock.
+ * @afe: Pointer to &struct mtk_base_afe
+ * @main_i2s_name: The name of the I2S port that will provide the clock
+ * @secondary_i2s_name: The name of the I2S port that will use this clock
+ */
+int mt8192_dai_i2s_set_share(struct mtk_base_afe *afe, const char *main_i2s_name,
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
+EXPORT_SYMBOL_GPL(mt8192_dai_i2s_set_share);
+
 static int mt8192_dai_i2s_set_priv(struct mtk_base_afe *afe)
 {
 	int i;
-- 
2.37.3

