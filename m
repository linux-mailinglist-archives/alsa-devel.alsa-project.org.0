Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 897864C1393
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 14:07:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0345E1AA5;
	Wed, 23 Feb 2022 14:06:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0345E1AA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645621665;
	bh=rt8BVSbvJLHOD2qHVsI2GseDgVagNFfnWZZ6udJPg+U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JNO7vz74zzjsgAra5U34heNAX026oVTYdKIsaY9gmureuT0Xw3Q4D9afAI5dCpmVo
	 QHgrB2ATrLrEkikF8q85/hn3JWWm1kKWUX7XvJZNvHgmYTQe4Iqdd157wm389DDq0u
	 8dvmSfy5p7OC8kXMBBYGrgX+wTSwySl6HM5R+wFA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 513A4F8025D;
	Wed, 23 Feb 2022 14:06:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15522F80237; Wed, 23 Feb 2022 14:06:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8B1AF800B6
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 14:06:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8B1AF800B6
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nMrLf-0005EE-U0; Wed, 23 Feb 2022 14:06:27 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nMrLf-00EOWI-6k; Wed, 23 Feb 2022 14:06:27 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: fsl: Drop unused argument from imx_pcm_dma_init()
Date: Wed, 23 Feb 2022 14:06:25 +0100
Message-Id: <20220223130625.3430589-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: Nicolin Chen <nicoleotsuka@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Mark Brown <broonie@kernel.org>,
 kernel@pengutronix.de, Xiubo Li <Xiubo.Lee@gmail.com>
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

Since 70d435ba1cd ("ASoC: imx-pcm-dma: simplify pcm_config") the size
argument to imx_pcm_dma_init() is unused, so drop it. Also remove the
now unused defines that the users of imx_pcm_dma_init() used to pass the
size argument

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 sound/soc/fsl/fsl_aud2htx.c | 2 +-
 sound/soc/fsl/fsl_esai.c    | 2 +-
 sound/soc/fsl/fsl_sai.c     | 2 +-
 sound/soc/fsl/fsl_spdif.c   | 2 +-
 sound/soc/fsl/fsl_ssi.c     | 2 +-
 sound/soc/fsl/imx-pcm-dma.c | 2 +-
 sound/soc/fsl/imx-pcm.h     | 7 ++-----
 7 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/sound/soc/fsl/fsl_aud2htx.c b/sound/soc/fsl/fsl_aud2htx.c
index 99ab7f0241cf3..422922146f2a5 100644
--- a/sound/soc/fsl/fsl_aud2htx.c
+++ b/sound/soc/fsl/fsl_aud2htx.c
@@ -241,7 +241,7 @@ static int fsl_aud2htx_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = imx_pcm_dma_init(pdev, IMX_DEFAULT_DMABUF_SIZE);
+	ret = imx_pcm_dma_init(pdev);
 	if (ret)
 		dev_err(&pdev->dev, "failed to init imx pcm dma: %d\n", ret);
 
diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index 3a9e2df4e16f6..ed444e8f1d6bf 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -1077,7 +1077,7 @@ static int fsl_esai_probe(struct platform_device *pdev)
 	 * Register platform component before registering cpu dai for there
 	 * is not defer probe for platform component in snd_soc_add_pcm_runtime().
 	 */
-	ret = imx_pcm_dma_init(pdev, IMX_ESAI_DMABUF_SIZE);
+	ret = imx_pcm_dma_init(pdev);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to init imx pcm dma: %d\n", ret);
 		goto err_pm_get_sync;
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 10544fa27dc0b..d7b990c6429ab 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1157,7 +1157,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	 * is not defer probe for platform component in snd_soc_add_pcm_runtime().
 	 */
 	if (sai->soc_data->use_imx_pcm) {
-		ret = imx_pcm_dma_init(pdev, IMX_SAI_DMABUF_SIZE);
+		ret = imx_pcm_dma_init(pdev);
 		if (ret)
 			goto err_pm_get_sync;
 	} else {
diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index d178b479c8bd4..57c41b2f7d177 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -1522,7 +1522,7 @@ static int fsl_spdif_probe(struct platform_device *pdev)
 	 * Register platform component before registering cpu dai for there
 	 * is not defer probe for platform component in snd_soc_add_pcm_runtime().
 	 */
-	ret = imx_pcm_dma_init(pdev, IMX_SPDIF_DMABUF_SIZE);
+	ret = imx_pcm_dma_init(pdev);
 	if (ret) {
 		dev_err_probe(&pdev->dev, ret, "imx_pcm_dma_init failed\n");
 		goto err_pm_disable;
diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index 1169d1104b9e8..ca30a4ede076e 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -1372,7 +1372,7 @@ static int fsl_ssi_imx_probe(struct platform_device *pdev,
 		if (ret)
 			goto error_pcm;
 	} else {
-		ret = imx_pcm_dma_init(pdev, IMX_SSI_DMABUF_SIZE);
+		ret = imx_pcm_dma_init(pdev);
 		if (ret)
 			goto error_pcm;
 	}
diff --git a/sound/soc/fsl/imx-pcm-dma.c b/sound/soc/fsl/imx-pcm-dma.c
index 04a9bc749016d..14e94270911cf 100644
--- a/sound/soc/fsl/imx-pcm-dma.c
+++ b/sound/soc/fsl/imx-pcm-dma.c
@@ -34,7 +34,7 @@ static const struct snd_dmaengine_pcm_config imx_dmaengine_pcm_config = {
 	.compat_filter_fn = filter,
 };
 
-int imx_pcm_dma_init(struct platform_device *pdev, size_t size)
+int imx_pcm_dma_init(struct platform_device *pdev)
 {
 	struct snd_dmaengine_pcm_config *config;
 
diff --git a/sound/soc/fsl/imx-pcm.h b/sound/soc/fsl/imx-pcm.h
index 5dd406774d3ea..5c6cf1ca8c8ab 100644
--- a/sound/soc/fsl/imx-pcm.h
+++ b/sound/soc/fsl/imx-pcm.h
@@ -17,9 +17,6 @@
 #define IMX_SSI_DMABUF_SIZE	(64 * 1024)
 
 #define IMX_DEFAULT_DMABUF_SIZE	(64 * 1024)
-#define IMX_SAI_DMABUF_SIZE	(64 * 1024)
-#define IMX_SPDIF_DMABUF_SIZE	(64 * 1024)
-#define IMX_ESAI_DMABUF_SIZE	(256 * 1024)
 
 static inline void
 imx_pcm_dma_params_init_data(struct imx_dma_data *dma_data,
@@ -40,9 +37,9 @@ struct imx_pcm_fiq_params {
 };
 
 #if IS_ENABLED(CONFIG_SND_SOC_IMX_PCM_DMA)
-int imx_pcm_dma_init(struct platform_device *pdev, size_t size);
+int imx_pcm_dma_init(struct platform_device *pdev);
 #else
-static inline int imx_pcm_dma_init(struct platform_device *pdev, size_t size)
+static inline int imx_pcm_dma_init(struct platform_device *pdev)
 {
 	return -ENODEV;
 }
-- 
2.30.2

