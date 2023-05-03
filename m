Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A73996F573B
	for <lists+alsa-devel@lfdr.de>; Wed,  3 May 2023 13:37:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B57B7118E;
	Wed,  3 May 2023 13:36:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B57B7118E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683113822;
	bh=Q8pMDSsF9Xq13eVyTUnJq6+q7ZON3uD2hqLFfrS3fNw=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=Qy8GPSmePLJBOZeWJM0YzSNPqSsT74UlPpmGhoCZkBeXpitcG7JId2iDA7GKMQKuq
	 mgCdm1BDWTkiXNHtJh37XKRw7risX2+2nf6TVpRUd1rX7xXhodYCNwkSZ3wDvRSmgU
	 7kloGtps9dUISrIfmQUk2gNnrv7BYwqzD4OBfPJg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 397BBF8049E;
	Wed,  3 May 2023 13:36:12 +0200 (CEST)
To: lgirdwood@gmail.com
Subject: [PATCH 3/5] ASoC: mediatek: mt8195-afe-pcm: Simplify runtime PM
 during probe
Date: Wed,  3 May 2023 13:34:11 +0200
In-Reply-To: <20230503113413.149235-1-angelogioacchino.delregno@collabora.com>
References: <20230503113413.149235-1-angelogioacchino.delregno@collabora.com>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JHZP7RB4FICY4XDD4OQJCVKDC5CUHX2S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168311377075.26.14919941665402646886@mailman-core.alsa-project.org>
From: AngeloGioacchino Del Regno via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: broonie@kernel.org, tiwai@suse.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com,
 pierre-louis.bossart@linux.intel.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, daniel.baluta@nxp.com,
 nicolas.ferre@microchip.com, u.kleine-koenig@pengutronix.de,
 chunxu.li@mediatek.com, tinghan.shen@mediatek.com, error27@gmail.com,
 ribalda@chromium.org, yc.hung@mediatek.com, Allen-KH.Cheng@mediatek.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 sound-open-firmware@alsa-project.org, kernel@collabora.com
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE3D3F8051B; Wed,  3 May 2023 13:36:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE8B1F804B1;
	Wed,  3 May 2023 13:34:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE8B1F804B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=HSzFx8Gb
Received: from IcarusMOD.eternityproject.eu (unknown
 [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2552766056D2;
	Wed,  3 May 2023 12:34:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1683113665;
	bh=lJinXQ8uqP7CnqlUjGVARURr70ufEO+/YnYRE0JoVQw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HSzFx8GbrJ8qs8mBrbeP+h7EcY1pogSEhyzSPpiZVHTaiFRSXaGbp5P86Vt16B/07
	 c7V+Xj5slpef3GSmiz/Pf9bnkDA025Mw3wy8GD8HVuedzDpHs1REkrHXWHXaQs8nYw
	 /J5brCacAgQ3HeDaNVMLMDpgZ4lkPe+LCU+SB0SksECniQJvf0vdahY0Yx7//fAURU
	 +GvoQmfEw4XOQawfFSXrCABO/+LpP1qxWI3y1jQiPDuCe0ey0iPu9Y/FJmCXAqzLTy
	 oh2aaralDRQaWp++iEIUJHa+6Lm4w+kgiByyia77GGEm8NnOE4N083/yLbzxO3FkNI
	 2+9iNKO5hHbrA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lgirdwood@gmail.com
Subject: [PATCH 3/5] ASoC: mediatek: mt8195-afe-pcm: Simplify runtime PM
 during probe
Date: Wed,  3 May 2023 13:34:11 +0200
Message-Id: <20230503113413.149235-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230503113413.149235-1-angelogioacchino.delregno@collabora.com>
References: <20230503113413.149235-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JHZP7RB4FICY4XDD4OQJCVKDC5CUHX2S
X-Message-ID-Hash: JHZP7RB4FICY4XDD4OQJCVKDC5CUHX2S
X-MailFrom: angelogioacchino.delregno@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: broonie@kernel.org, tiwai@suse.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com,
 pierre-louis.bossart@linux.intel.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, daniel.baluta@nxp.com,
 nicolas.ferre@microchip.com, u.kleine-koenig@pengutronix.de,
 chunxu.li@mediatek.com, tinghan.shen@mediatek.com, error27@gmail.com,
 ribalda@chromium.org, yc.hung@mediatek.com, Allen-KH.Cheng@mediatek.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 sound-open-firmware@alsa-project.org, kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JHZP7RB4FICY4XDD4OQJCVKDC5CUHX2S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use devm_pm_runtime_enable() and pm_runtime_resume_and_get() to
to simplify the probe function.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 9e45efeada55..a54c16e0aa05 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3179,16 +3179,16 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	mt8195_afe_parse_of(afe, pdev->dev.of_node);
 
-	pm_runtime_enable(dev);
-	if (!pm_runtime_enabled(dev)) {
-		ret = mt8195_afe_runtime_resume(dev);
-		if (ret)
-			return ret;
-	}
-
 	/* enable clock for regcache get default value from hw */
 	afe_priv->pm_runtime_bypass_reg_ctl = true;
-	pm_runtime_get_sync(dev);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to resume device\n");
 
 	afe->regmap = devm_regmap_init_mmio(&pdev->dev, afe->base_addr,
 					    &mt8195_afe_regmap_config);
@@ -3238,7 +3238,10 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	mt8195_afe_init_registers(afe);
 
-	pm_runtime_put_sync(dev);
+	ret = pm_runtime_put_sync(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to suspend device\n");
+
 	afe_priv->pm_runtime_bypass_reg_ctl = false;
 
 	regcache_cache_only(afe->regmap, true);
@@ -3248,7 +3251,6 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 
 err_pm_put:
 	pm_runtime_put_sync(dev);
-	pm_runtime_disable(dev);
 
 	return ret;
 }
-- 
2.40.1

