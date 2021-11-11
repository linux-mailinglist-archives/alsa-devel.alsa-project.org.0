Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF6244D9F9
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Nov 2021 17:12:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B6641662;
	Thu, 11 Nov 2021 17:11:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B6641662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636647164;
	bh=CX9YgOE2Dnl9sKFDhi/Vy7+Gru9qmfIxKp+CcNPPD7Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BK+Nr5sJpkocAs1P/XHCiXSeRB2cvuXRJGvLEGtgD3v7ztP7oMon1EsYPYB5WKYu4
	 jXoGU4zqF3IJMZ92aojfdSrMsc8uImJaf+IuOSWRtoNGh4pdOaAcrjXBqHsc1odp+T
	 rtdDOlPve1Gpkd40h4z5wb+llsnXk1BRriYi9QG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78D39F802E3;
	Thu, 11 Nov 2021 17:11:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C9C7F802D2; Thu, 11 Nov 2021 17:11:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91FB2F80054
 for <alsa-devel@alsa-project.org>; Thu, 11 Nov 2021 17:11:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91FB2F80054
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=collabora.com header.i=@collabora.com header.b="FjXHacYd"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B98A31F45F06
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1636647073; bh=CX9YgOE2Dnl9sKFDhi/Vy7+Gru9qmfIxKp+CcNPPD7Q=;
 h=From:To:Cc:Subject:Date:From;
 b=FjXHacYdhUiv7pCF1M1W4pYSynoz4Psg8PiUe06ETK6zxbWP3QXSJZoSbOQ9Asgvc
 YcIQps0YO+BNiIyw9fzQXVQVKxNlt2mIgbfglgk062leoi+Zh4VaRD2Il83WyySaVr
 gxaf0n1XioYQVMycUpa4im8Pux9mnGx2AAFeN9VsqBEs7wOx4+qXkaYUHrQ3uUNZsq
 IMKmAGOuN68o8zTY72Ics+AZiPAmv+N2Owr6Rxxuvgr89fUXCMYah3sEbK0AsrkiYD
 3hSA7EQn+f57d2b1odZBgYEKAZ0WQTf1zQ3koKhQf9ar58FPJyDyUa36remrWGvZAQ
 7HXWBLVsygu0A==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lgirdwood@gmail.com
Subject: [PATCH] ASoC: mediatek: mt8173: Fix debugfs registration for
 components
Date: Thu, 11 Nov 2021 17:11:08 +0100
Message-Id: <20211111161108.502344-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 dafna.hirschfeld@collabora.com, kuninori.morimoto.gx@renesas.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
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

When registering the mt8173-afe-pcm driver, we are also adding two
components: one is for the PCM DAIs and one is for the HDMI DAIs, but
when debugfs is enabled, we're getting the following issue:

[   17.279176] debugfs: Directory '11220000.audio-controller' with parent 'mtk-rt5650' already present!
[   17.288345] debugfs: Directory '11220000.audio-controller' with parent 'mtk-rt5650' already present!

To overcome to that without any potentially big rewrite of this driver,
similarly to what was done in mt8195-afe-pcm, add a debugfs_prefix to
the components before actually adding them.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 51 ++++++++++++++++++----
 1 file changed, 43 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index 6350390414d4..31494930433f 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -1054,6 +1054,7 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 	int irq_id;
 	struct mtk_base_afe *afe;
 	struct mt8173_afe_private *afe_priv;
+	struct snd_soc_component *comp_pcm, *comp_hdmi;
 
 	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(33));
 	if (ret)
@@ -1142,23 +1143,55 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_pm_disable;
 
-	ret = devm_snd_soc_register_component(&pdev->dev,
-					 &mt8173_afe_pcm_dai_component,
-					 mt8173_afe_pcm_dais,
-					 ARRAY_SIZE(mt8173_afe_pcm_dais));
+	comp_pcm = devm_kzalloc(&pdev->dev, sizeof(*comp_pcm), GFP_KERNEL);
+	if (!comp_pcm) {
+		ret = -ENOMEM;
+		goto err_pm_disable;
+	}
+
+	ret = snd_soc_component_initialize(comp_pcm,
+					   &mt8173_afe_pcm_dai_component,
+					   &pdev->dev);
 	if (ret)
 		goto err_pm_disable;
 
-	ret = devm_snd_soc_register_component(&pdev->dev,
-					 &mt8173_afe_hdmi_dai_component,
-					 mt8173_afe_hdmi_dais,
-					 ARRAY_SIZE(mt8173_afe_hdmi_dais));
+#ifdef CONFIG_DEBUG_FS
+	comp_pcm->debugfs_prefix = "pcm";
+#endif
+
+	ret = snd_soc_add_component(comp_pcm,
+				    mt8173_afe_pcm_dais,
+				    ARRAY_SIZE(mt8173_afe_pcm_dais));
+	if (ret)
+		goto err_pm_disable;
+
+	comp_hdmi = devm_kzalloc(&pdev->dev, sizeof(*comp_hdmi), GFP_KERNEL);
+	if (!comp_hdmi) {
+		ret = -ENOMEM;
+		goto err_pm_disable;
+	}
+
+	ret = snd_soc_component_initialize(comp_hdmi,
+					   &mt8173_afe_hdmi_dai_component,
+					   &pdev->dev);
 	if (ret)
 		goto err_pm_disable;
 
+#ifdef CONFIG_DEBUG_FS
+	comp_hdmi->debugfs_prefix = "hdmi";
+#endif
+
+	ret = snd_soc_add_component(comp_hdmi,
+				    mt8173_afe_hdmi_dais,
+				    ARRAY_SIZE(mt8173_afe_hdmi_dais));
+	if (ret)
+		goto err_cleanup_components;
+
 	dev_info(&pdev->dev, "MT8173 AFE driver initialized.\n");
 	return 0;
 
+err_cleanup_components:
+	snd_soc_unregister_component(&pdev->dev);
 err_pm_disable:
 	pm_runtime_disable(&pdev->dev);
 	return ret;
@@ -1166,6 +1199,8 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 
 static int mt8173_afe_pcm_dev_remove(struct platform_device *pdev)
 {
+	snd_soc_unregister_component(&pdev->dev);
+
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		mt8173_afe_runtime_suspend(&pdev->dev);
-- 
2.33.1

