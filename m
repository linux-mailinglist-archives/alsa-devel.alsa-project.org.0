Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C656722AE
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 17:12:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48ED27944;
	Wed, 18 Jan 2023 17:11:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48ED27944
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674058337;
	bh=9lsf4Rm2C5XkHcvH4f3NT1A03Z7ddyEqH7Ndpj9WVgQ=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=t/icdiUxVi4L0py9OSqnn4Kps2RkUAXfoYUHwRS1G+KjfxYLbTr8wMiTwVEGeQcCz
	 t5L/NZ3RheC9v6hWL/JWAOjJMzeCi+rqLmhFzRPj7TIu/tU0acZKgTv5ipziCyCR5t
	 6t0erS/LYLrys8DB95kmbfvipOErp43jGxtiJsb8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BC40F80520;
	Wed, 18 Jan 2023 17:11:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45C47F804BC; Wed, 18 Jan 2023 17:11:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90E3BF8024D
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 17:11:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90E3BF8024D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=i3OjmvfJ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A7CC2618C2;
 Wed, 18 Jan 2023 16:11:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52746C433F0;
 Wed, 18 Jan 2023 16:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674058276;
 bh=9lsf4Rm2C5XkHcvH4f3NT1A03Z7ddyEqH7Ndpj9WVgQ=;
 h=From:To:Cc:Subject:Date:From;
 b=i3OjmvfJjrkOXSvvqNgnEwsRYksBPCnCC9hmz2oWHToSKf12DPIRywVZxRy+j/S5z
 3UpnDj96kUM//uubhRWA83wDFKzQ8D2oRtbnlrIzemF9jOsmWR0BGdp3k9ZzZsuhmg
 Yq8DpJzAYze99A9hkmYg1qhWdaOB6/SBEV8eByE5FbhiowKat4fvsgW4hFlPUss2ic
 /e3pvEr/xwE810fWpINZiNBGJSmd8RXe48GQrdqGjv4hg7SO8PX1n/Dt0N+tiwu1NK
 sScI5I2xKUlSFd5C5+zdqam1QkrXPaB/oIKMc1+o88EKQGORcT4N2IFL+ZNr5ZOPWR
 3q34Q2PIOJklA==
From: Arnd Bergmann <arnd@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/5] ASoC: samsung: remove DMA filter function and data
Date: Wed, 18 Jan 2023 17:10:45 +0100
Message-Id: <20230118161110.521504-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Arnd Bergmann <arnd@arndb.de>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Arnd Bergmann <arnd@arndb.de>

This data is no longer passed by the platform code, so
there is no point passing it down at all.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/platform_data/asoc-s3c.h |  6 ------
 sound/soc/samsung/dma.h                |  2 +-
 sound/soc/samsung/dmaengine.c          |  3 +--
 sound/soc/samsung/i2s.c                | 21 +++------------------
 sound/soc/samsung/pcm.c                | 11 +----------
 sound/soc/samsung/spdif.c              |  9 +--------
 6 files changed, 7 insertions(+), 45 deletions(-)

diff --git a/include/linux/platform_data/asoc-s3c.h b/include/linux/platform_data/asoc-s3c.h
index f9c00f839e9f..84874433cf21 100644
--- a/include/linux/platform_data/asoc-s3c.h
+++ b/include/linux/platform_data/asoc-s3c.h
@@ -30,7 +30,6 @@ struct samsung_i2s_type {
 #define QUIRK_SUPPORTS_IDMA	(1 << 5)
 	/* Quirks of the I2S controller */
 	u32 quirks;
-	dma_addr_t idma_addr;
 };
 
 /**
@@ -39,10 +38,5 @@ struct samsung_i2s_type {
  */
 struct s3c_audio_pdata {
 	int (*cfg_gpio)(struct platform_device *);
-	dma_filter_fn dma_filter;
-	void *dma_playback;
-	void *dma_capture;
-	void *dma_play_sec;
-	void *dma_capture_mic;
 	struct samsung_i2s_type type;
 };
diff --git a/sound/soc/samsung/dma.h b/sound/soc/samsung/dma.h
index 7b5d4556e0fd..bd0faf84972e 100644
--- a/sound/soc/samsung/dma.h
+++ b/sound/soc/samsung/dma.h
@@ -12,7 +12,7 @@
  * @tx, @rx arguments can be NULL if the DMA channel names are "tx", "rx",
  * otherwise actual DMA channel names must be passed to this function.
  */
-int samsung_asoc_dma_platform_register(struct device *dev, dma_filter_fn filter,
+int samsung_asoc_dma_platform_register(struct device *dev,
 				       const char *tx, const char *rx,
 				       struct device *dma_dev);
 #endif /* _SAMSUNG_DMA_H */
diff --git a/sound/soc/samsung/dmaengine.c b/sound/soc/samsung/dmaengine.c
index 2802789a323e..900953ee3786 100644
--- a/sound/soc/samsung/dmaengine.c
+++ b/sound/soc/samsung/dmaengine.c
@@ -14,7 +14,7 @@
 
 #include "dma.h"
 
-int samsung_asoc_dma_platform_register(struct device *dev, dma_filter_fn filter,
+int samsung_asoc_dma_platform_register(struct device *dev,
 				       const char *tx, const char *rx,
 				       struct device *dma_dev)
 {
@@ -25,7 +25,6 @@ int samsung_asoc_dma_platform_register(struct device *dev, dma_filter_fn filter,
 		return -ENOMEM;
 
 	pcm_conf->prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config;
-	pcm_conf->compat_filter_fn = filter;
 	pcm_conf->dma_dev = dma_dev;
 
 	pcm_conf->chan_names[SNDRV_PCM_STREAM_PLAYBACK] = tx;
diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 9505200f3d11..052c263c126a 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -79,7 +79,6 @@ struct i2s_dai {
 	struct snd_dmaengine_dai_dma_data dma_playback;
 	struct snd_dmaengine_dai_dma_data dma_capture;
 	struct snd_dmaengine_dai_dma_data idma_playback;
-	dma_filter_fn filter;
 
 	struct samsung_i2s_priv *priv;
 };
@@ -1431,13 +1430,7 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 	spin_lock_init(&priv->lock);
 	spin_lock_init(&priv->pcm_lock);
 
-	if (!np) {
-		pri_dai->dma_playback.filter_data = i2s_pdata->dma_playback;
-		pri_dai->dma_capture.filter_data = i2s_pdata->dma_capture;
-		pri_dai->filter = i2s_pdata->dma_filter;
-
-		idma_addr = i2s_pdata->type.idma_addr;
-	} else {
+	if (np) {
 		if (of_property_read_u32(np, "samsung,idma-addr",
 					 &idma_addr)) {
 			if (priv->quirks & QUIRK_SUPPORTS_IDMA) {
@@ -1475,8 +1468,7 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 	if (priv->quirks & QUIRK_PRI_6CHAN)
 		pri_dai->drv->playback.channels_max = 6;
 
-	ret = samsung_asoc_dma_platform_register(&pdev->dev, pri_dai->filter,
-						 "tx", "rx", NULL);
+	ret = samsung_asoc_dma_platform_register(&pdev->dev, "tx", "rx", NULL);
 	if (ret < 0)
 		goto err_disable_clk;
 
@@ -1485,12 +1477,6 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 
 		sec_dai->dma_playback.addr = regs_base + I2STXDS;
 		sec_dai->dma_playback.chan_name = "tx-sec";
-
-		if (!np) {
-			sec_dai->dma_playback.filter_data = i2s_pdata->dma_play_sec;
-			sec_dai->filter = i2s_pdata->dma_filter;
-		}
-
 		sec_dai->dma_playback.addr_width = 4;
 		sec_dai->idma_playback.addr = idma_addr;
 		sec_dai->pri_dai = pri_dai;
@@ -1502,8 +1488,7 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 			goto err_disable_clk;
 
 		ret = samsung_asoc_dma_platform_register(&priv->pdev_sec->dev,
-						sec_dai->filter, "tx-sec", NULL,
-						&pdev->dev);
+						"tx-sec", NULL, &pdev->dev);
 		if (ret < 0)
 			goto err_del_sec;
 
diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
index e859252ae5e6..2f3a99de6434 100644
--- a/sound/soc/samsung/pcm.c
+++ b/sound/soc/samsung/pcm.c
@@ -489,7 +489,6 @@ static int s3c_pcm_dev_probe(struct platform_device *pdev)
 	struct s3c_pcm_info *pcm;
 	struct resource *mem_res;
 	struct s3c_audio_pdata *pcm_pdata;
-	dma_filter_fn filter;
 	int ret;
 
 	/* Check for valid device index */
@@ -542,18 +541,10 @@ static int s3c_pcm_dev_probe(struct platform_device *pdev)
 	s3c_pcm_stereo_in[pdev->id].addr = mem_res->start + S3C_PCM_RXFIFO;
 	s3c_pcm_stereo_out[pdev->id].addr = mem_res->start + S3C_PCM_TXFIFO;
 
-	filter = NULL;
-	if (pcm_pdata) {
-		s3c_pcm_stereo_in[pdev->id].filter_data = pcm_pdata->dma_capture;
-		s3c_pcm_stereo_out[pdev->id].filter_data = pcm_pdata->dma_playback;
-		filter = pcm_pdata->dma_filter;
-	}
-
 	pcm->dma_capture = &s3c_pcm_stereo_in[pdev->id];
 	pcm->dma_playback = &s3c_pcm_stereo_out[pdev->id];
 
-	ret = samsung_asoc_dma_platform_register(&pdev->dev, filter,
-						 NULL, NULL, NULL);
+	ret = samsung_asoc_dma_platform_register(&pdev->dev, NULL, NULL, NULL);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to get register DMA: %d\n", ret);
 		goto err_dis_pclk;
diff --git a/sound/soc/samsung/spdif.c b/sound/soc/samsung/spdif.c
index 7d815e237e5c..beabcadd7d1d 100644
--- a/sound/soc/samsung/spdif.c
+++ b/sound/soc/samsung/spdif.c
@@ -363,7 +363,6 @@ static int spdif_probe(struct platform_device *pdev)
 	struct s3c_audio_pdata *spdif_pdata;
 	struct resource *mem_res;
 	struct samsung_spdif_info *spdif;
-	dma_filter_fn filter;
 	int ret;
 
 	spdif_pdata = pdev->dev.platform_data;
@@ -424,15 +423,9 @@ static int spdif_probe(struct platform_device *pdev)
 
 	spdif_stereo_out.addr_width = 2;
 	spdif_stereo_out.addr = mem_res->start + DATA_OUTBUF;
-	filter = NULL;
-	if (spdif_pdata) {
-		spdif_stereo_out.filter_data = spdif_pdata->dma_playback;
-		filter = spdif_pdata->dma_filter;
-	}
 	spdif->dma_playback = &spdif_stereo_out;
 
-	ret = samsung_asoc_dma_platform_register(&pdev->dev, filter,
-						 NULL, NULL, NULL);
+	ret = samsung_asoc_dma_platform_register(&pdev->dev, NULL, NULL, NULL);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register DMA: %d\n", ret);
 		goto err4;
-- 
2.39.0

