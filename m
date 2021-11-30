Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE45463852
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Nov 2021 15:56:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2647821B5;
	Tue, 30 Nov 2021 15:55:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2647821B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638284201;
	bh=rciJuTE6DGsaNP2VDDiRHUBLpuiwr4thrV766TIgig4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oQ6D3T5qmMFwiMupvQD7XG7znXfuvO/EH9MKkEZDShzlnLgh0ZkH/Z48xQ8CIub0l
	 8kICnpEU8AQ9z9HF3Rz9SyIB55/gcbnFsdorPKWSxkD2PfhZkHPSRGAuCT395ZRgFu
	 8a1f/LXT2rr2qjt0hLOZcJmHgsOGA+2VTzdDEVF0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5C99F80566;
	Tue, 30 Nov 2021 15:50:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 845A8F80566; Tue, 30 Nov 2021 15:50:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E762F8055B
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 15:50:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E762F8055B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZgrD3Mcv"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D7344B81A4F;
 Tue, 30 Nov 2021 14:50:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AA05C53FC1;
 Tue, 30 Nov 2021 14:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638283848;
 bh=rciJuTE6DGsaNP2VDDiRHUBLpuiwr4thrV766TIgig4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZgrD3McvH2umJ/+zAtdMSUK0zl6i3fZ+6cOWM71nIlAGeH+h1/nCbg8iTUt9igHj5
 g25b02K+HQC9q8gm5IYS60hSuhjwUiSEnqim7J18b45m/9idHX67sKx55+0o4fiNe8
 DpkULZKbgbbu/8wCqoO+X0pOnW8kVr0VDnJawusm7z2gI3RiXlfEVYCcYjnriSQhG+
 0z29f1wORS3DmKmvI1TRj+mIh5/v/y2+OKptsR7yEPuoQKiU1/AlGmafeRwJxXD+mi
 YbYzlIQK5p5hoyOQ76cU+k9vYRE8mcOKjDMVNK+aUlMPq9toq6gkAK7lokcAF78kr5
 KRATerID7xFOg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 08/43] ASoC: mediatek: mt8173: Fix debugfs
 registration for components
Date: Tue, 30 Nov 2021 09:49:45 -0500
Message-Id: <20211130145022.945517-8-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211130145022.945517-1-sashal@kernel.org>
References: <20211130145022.945517-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 lgirdwood@gmail.com, tiwai@suse.com, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
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

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

[ Upstream commit 8c32984bc7da29828260ac514d5d4967f7e8f62d ]

When registering the mt8173-afe-pcm driver, we are also adding two
components: one is for the PCM DAIs and one is for the HDMI DAIs, but
when debugfs is enabled, we're getting the following issue:

[   17.279176] debugfs: Directory '11220000.audio-controller' with parent 'mtk-rt5650' already present!
[   17.288345] debugfs: Directory '11220000.audio-controller' with parent 'mtk-rt5650' already present!

To overcome to that without any potentially big rewrite of this driver,
similarly to what was done in mt8195-afe-pcm, add a debugfs_prefix to
the components before actually adding them.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Link: https://lore.kernel.org/r/20211111161108.502344-1-angelogioacchino.delregno@collabora.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 51 ++++++++++++++++++----
 1 file changed, 43 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index 7e7bda70d12e9..a8c7617978a66 100644
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
2.33.0

