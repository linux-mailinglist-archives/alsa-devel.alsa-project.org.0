Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EB982AC9A
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jan 2024 11:55:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B38B6EC1;
	Thu, 11 Jan 2024 11:55:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B38B6EC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704970556;
	bh=AMVfzvbVKztx/7y6kdCGWvpZXOG+ZdfCsQ9HsmGMSIw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Yp/iiAHyTl3KaWpEhyZrQYgikNOpC7p39CMOoSuX91l3/NAxuIT0N0cA5WWyElx36
	 aTfz//aAHnsBa/BRQ5rrLggpizK+kWp/Hpo1Drr6G1mwZHMPUp44HJAACaaxKy5XQT
	 TYDvPGoaPMHElHDGb1Ose6AopJFzrn3bsd4/1SYE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34F69F805E7; Thu, 11 Jan 2024 11:54:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B04DF805EE;
	Thu, 11 Jan 2024 11:54:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0B8DF804F1; Thu, 11 Jan 2024 11:53:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67877F800F5
	for <alsa-devel@alsa-project.org>; Thu, 11 Jan 2024 11:52:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67877F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=qk+I+0Dx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704970372;
	bh=AMVfzvbVKztx/7y6kdCGWvpZXOG+ZdfCsQ9HsmGMSIw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qk+I+0DxAYUMmqa4SXs2yQNDEr8U9KFs2met++sPRrAGr9Sv8ukwt5HOmrMslZ1b/
	 C8gok5VsWBPtXV+T38iN7/ogRpLsVSWbXRN7Lb7Ut714tTRoLCRRlpfMw9GtJvcqTj
	 fwUvnljf4hrlDGINcL0v6lLnfJ22gP2G1iYV94ya+8jhgU5a0UzBweWPJ+QGF+R7TN
	 XJkTvLgVkz+XLA6MV/Bb5fHToJfW0gNcJysA9P0lCXXFl2enyOS3rrUltQ5JFXEXX0
	 s4N1UbVY+stgZdg4nG7rRkiyFH/TO78m1+9AWXJOXqsb4164xAbxlZBQ/3c0JFsvDH
	 LidQhyG5J8XVQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 21F8E3781F8E;
	Thu, 11 Jan 2024 10:52:51 +0000 (UTC)
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
Subject: [PATCH 1/7] ASoC: mediatek: mt8173-afe-pcm: Convert to
 devm_pm_runtime_enable()
Date: Thu, 11 Jan 2024 11:52:41 +0100
Message-ID: <20240111105247.117766-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240111105247.117766-1-angelogioacchino.delregno@collabora.com>
References: <20240111105247.117766-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 57KJ2MVEXPLVX72YKOPJIH2Q53RDPXCE
X-Message-ID-Hash: 57KJ2MVEXPLVX72YKOPJIH2Q53RDPXCE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/57KJ2MVEXPLVX72YKOPJIH2Q53RDPXCE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Switch from pm_runtime_enable() to devm_pm_runtime_enable() to simplify
the probe function.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 24 ++++++++--------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index b6291b7c811e..ea611730de9c 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -1117,11 +1117,11 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, afe);
 
-	pm_runtime_enable(&pdev->dev);
-	if (!pm_runtime_enabled(&pdev->dev)) {
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret) {
 		ret = mt8173_afe_runtime_resume(&pdev->dev);
 		if (ret)
-			goto err_pm_disable;
+			return ret;
 	}
 
 	afe->reg_back_up_list = mt8173_afe_backup_list;
@@ -1133,19 +1133,17 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 					 &mtk_afe_pcm_platform,
 					 NULL, 0);
 	if (ret)
-		goto err_pm_disable;
+		return ret;
 
 	comp_pcm = devm_kzalloc(&pdev->dev, sizeof(*comp_pcm), GFP_KERNEL);
-	if (!comp_pcm) {
-		ret = -ENOMEM;
-		goto err_pm_disable;
-	}
+	if (!comp_pcm)
+		return -ENOMEM;
 
 	ret = snd_soc_component_initialize(comp_pcm,
 					   &mt8173_afe_pcm_dai_component,
 					   &pdev->dev);
 	if (ret)
-		goto err_pm_disable;
+		return ret;
 
 #ifdef CONFIG_DEBUG_FS
 	comp_pcm->debugfs_prefix = "pcm";
@@ -1155,7 +1153,7 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 				    mt8173_afe_pcm_dais,
 				    ARRAY_SIZE(mt8173_afe_pcm_dais));
 	if (ret)
-		goto err_pm_disable;
+		return ret;
 
 	comp_hdmi = devm_kzalloc(&pdev->dev, sizeof(*comp_hdmi), GFP_KERNEL);
 	if (!comp_hdmi) {
@@ -1191,18 +1189,12 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 
 err_cleanup_components:
 	snd_soc_unregister_component(&pdev->dev);
-err_pm_disable:
-	pm_runtime_disable(&pdev->dev);
 	return ret;
 }
 
 static void mt8173_afe_pcm_dev_remove(struct platform_device *pdev)
 {
 	snd_soc_unregister_component(&pdev->dev);
-
-	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		mt8173_afe_runtime_suspend(&pdev->dev);
 }
 
 static const struct of_device_id mt8173_afe_pcm_dt_match[] = {
-- 
2.43.0

