Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB21182AC97
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jan 2024 11:55:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A01BF55;
	Thu, 11 Jan 2024 11:55:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A01BF55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704970536;
	bh=t5/M/FDJlEol50qHM5SqsEKoXsNv1Vb4Pkp42aLqIa4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ealVLIEFP3vod6EhqzJxMiFU0mycvJvSTk+RjCyKl/GCiOul9MOO8leSghPP5KVpE
	 bSSgcFWvXsl7UoAGQG8OUHLALTYpV5N0ARktFOZanAMRRFLhNMJ7DESIbf9hm1Z8qX
	 nWwW0MpGek4J2eSOSyrpuBynvbfT4Mgyjb/fUv1c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD850F805A8; Thu, 11 Jan 2024 11:54:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E16BF805AE;
	Thu, 11 Jan 2024 11:54:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13AE7F804F1; Thu, 11 Jan 2024 11:53:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 41599F80246
	for <alsa-devel@alsa-project.org>; Thu, 11 Jan 2024 11:52:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41599F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=q4kLQ0pR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704970373;
	bh=t5/M/FDJlEol50qHM5SqsEKoXsNv1Vb4Pkp42aLqIa4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q4kLQ0pRzFTsf7+QSE8HGBiTkkbxto3GLyZ/YvnTZ3mYaGX8FfpVDoW/lCHeVEnrp
	 KDquhySZRSotQRrNpFz7IxcBhS8HRZql2vryLjMWnFXGTsPv1mm83U4LWKVWBbFh1n
	 kNp5Q0TsZ4yta0eBv1yrC3tqnJJTrn5uMX1BLsO1an4Om8eIsjITCVEyP2Ge9CLhXz
	 AVRGSiVkjnfVb9kpbBfTX9kERC6Xsl8c4gwQuOo2AF/PHqrXvKSWgPTtGbCs1Hs2qQ
	 Igi4DuQN7WY0gWzRwOnUKN+jHP27eSWNFbWSYz6lwKV+xDJIKIwqjyrKQ5zUgG2YPn
	 TBQ7/nNSxctcA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 65DF93781FCB;
	Thu, 11 Jan 2024 10:52:52 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lgirdwood@gmail.com
Cc: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ribalda@chromium.org,
	nicolas.ferre@microchip.com,
	u.kleine-koenig@pengutronix.de,
	kuninori.morimoto.gx@renesas.com,
	nfraprado@collabora.com,
	alsa-devel@alsa-project.org,
	trevor.wu@mediatek.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/7] ASoC: mediatek: mt8173-afe-pcm: Use
 devm_snd_soc_register_component()
Date: Thu, 11 Jan 2024 11:52:42 +0100
Message-ID: <20240111105247.117766-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240111105247.117766-1-angelogioacchino.delregno@collabora.com>
References: <20240111105247.117766-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XIMK2QHCP3VGMPPMLTCJCDSTXM4H3QKV
X-Message-ID-Hash: XIMK2QHCP3VGMPPMLTCJCDSTXM4H3QKV
X-MailFrom: angelogioacchino.delregno@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XIMK2QHCP3VGMPPMLTCJCDSTXM4H3QKV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Function devm_snd_soc_register_component() allocates a new struct
snd_soc_component, adds components and initializes them; since this
is also devm, it automatically unregisters components and frees
memory upon destruction.

That's exactly what we're doing in the probe function of this driver:
switch to that function instead, allowing to remove the last goto and
to discard the .remove_new() callback for this driver.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 58 +++-------------------
 1 file changed, 8 insertions(+), 50 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index ea611730de9c..b887e10635fe 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -1129,72 +1129,31 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe->runtime_resume = mt8173_afe_runtime_resume;
 	afe->runtime_suspend = mt8173_afe_runtime_suspend;
 
-	ret = devm_snd_soc_register_component(&pdev->dev,
-					 &mtk_afe_pcm_platform,
-					 NULL, 0);
+	ret = devm_snd_soc_register_component(&pdev->dev, &mtk_afe_pcm_platform, NULL, 0);
 	if (ret)
 		return ret;
 
-	comp_pcm = devm_kzalloc(&pdev->dev, sizeof(*comp_pcm), GFP_KERNEL);
-	if (!comp_pcm)
-		return -ENOMEM;
-
-	ret = snd_soc_component_initialize(comp_pcm,
-					   &mt8173_afe_pcm_dai_component,
-					   &pdev->dev);
+	ret = devm_snd_soc_register_component(&pdev->dev, &mt8173_afe_pcm_dai_component,
+					      mt8173_afe_pcm_dais,
+					      ARRAY_SIZE(mt8173_afe_pcm_dais));
 	if (ret)
 		return ret;
 
-#ifdef CONFIG_DEBUG_FS
-	comp_pcm->debugfs_prefix = "pcm";
-#endif
-
-	ret = snd_soc_add_component(comp_pcm,
-				    mt8173_afe_pcm_dais,
-				    ARRAY_SIZE(mt8173_afe_pcm_dais));
+	ret = devm_snd_soc_register_component(&pdev->dev, &mt8173_afe_hdmi_dai_component,
+					      mt8173_afe_hdmi_dais,
+					      ARRAY_SIZE(mt8173_afe_hdmi_dais));
 	if (ret)
 		return ret;
 
-	comp_hdmi = devm_kzalloc(&pdev->dev, sizeof(*comp_hdmi), GFP_KERNEL);
-	if (!comp_hdmi) {
-		ret = -ENOMEM;
-		goto err_cleanup_components;
-	}
-
-	ret = snd_soc_component_initialize(comp_hdmi,
-					   &mt8173_afe_hdmi_dai_component,
-					   &pdev->dev);
-	if (ret)
-		goto err_cleanup_components;
-
-#ifdef CONFIG_DEBUG_FS
-	comp_hdmi->debugfs_prefix = "hdmi";
-#endif
-
-	ret = snd_soc_add_component(comp_hdmi,
-				    mt8173_afe_hdmi_dais,
-				    ARRAY_SIZE(mt8173_afe_hdmi_dais));
-	if (ret)
-		goto err_cleanup_components;
-
 	ret = devm_request_irq(afe->dev, irq_id, mt8173_afe_irq_handler,
 			       0, "Afe_ISR_Handle", (void *)afe);
 	if (ret) {
 		dev_err(afe->dev, "could not request_irq\n");
-		goto err_cleanup_components;
+		return ret;
 	}
 
 	dev_info(&pdev->dev, "MT8173 AFE driver initialized.\n");
 	return 0;
-
-err_cleanup_components:
-	snd_soc_unregister_component(&pdev->dev);
-	return ret;
-}
-
-static void mt8173_afe_pcm_dev_remove(struct platform_device *pdev)
-{
-	snd_soc_unregister_component(&pdev->dev);
 }
 
 static const struct of_device_id mt8173_afe_pcm_dt_match[] = {
@@ -1215,7 +1174,6 @@ static struct platform_driver mt8173_afe_pcm_driver = {
 		   .pm = &mt8173_afe_pm_ops,
 	},
 	.probe = mt8173_afe_pcm_dev_probe,
-	.remove_new = mt8173_afe_pcm_dev_remove,
 };
 
 module_platform_driver(mt8173_afe_pcm_driver);
-- 
2.43.0

