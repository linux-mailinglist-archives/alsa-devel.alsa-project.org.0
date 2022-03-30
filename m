Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 093F94EC0A1
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 13:50:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C3B41828;
	Wed, 30 Mar 2022 13:50:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C3B41828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648641057;
	bh=bF8a6Emkq3gGLNP8ZkwyAhhn/XpyikbfTHyhhlYcDH4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mJAKYrnpHd+s/7eL4QmeQsp+RagSlYLvKvA9nrEJn6x5MFJd63azQi+1A4K3wE2Qa
	 gLT71YzYwQu6XaqFMlcSTUn4+FNHYWKhkTzmb9/BtC0e+UlXVW2U+dkkoeTzGoDUPQ
	 d7+ZfbjD8GUAeE6sOXNRu4jNeFg0NdL2f/8xkpec=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05D6BF80542;
	Wed, 30 Mar 2022 13:48:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C223F80253; Wed, 30 Mar 2022 13:48:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 699B0F80253
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 13:47:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 699B0F80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YMZZIoFa"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D34A5615E7;
 Wed, 30 Mar 2022 11:47:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31B0BC340EE;
 Wed, 30 Mar 2022 11:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648640877;
 bh=bF8a6Emkq3gGLNP8ZkwyAhhn/XpyikbfTHyhhlYcDH4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YMZZIoFaf11R663MONoDlcQgEOMUH4ZzzkK8X8CRYpoguPpyCAuM5Wj3sbXERrJeA
 6Dq73O4rZ01PDOcz5kqx3bW2n8gW5osA4RpHI3F5cd7YQceuse9XJ9TbN2OBo+7zDH
 K28I60afK0LGJpNr6tIVGFuqibfQF4uGT1iLsUQGVnD8YuWozuamAFZjWNWYNkNtGO
 IFuoI9rsNzFfbw+Z96Bo5cge2ElCV+E2ZPZ2CZumPqXAOC4oSGjMHMZG8TCkW3MKNR
 BP5/t934nxVWH7qlKSGv5hTUK7zkieoo7JJJlk+0Zmops4ZwMIRhT4zdxRHF73R9tB
 aR2M60u/fmCuQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 45/66] ASoC: amd: vg: fix for pm resume callback
 sequence
Date: Wed, 30 Mar 2022 07:46:24 -0400
Message-Id: <20220330114646.1669334-45-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330114646.1669334-1-sashal@kernel.org>
References: <20220330114646.1669334-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 kernel test robot <lkp@intel.com>, tiwai@suse.com, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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

From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

[ Upstream commit 83b713619ee1b15e09eae11a92a7f3305534223d ]

The previous condition is used to cross check only the active
stream status for I2S HS instance playback and capture use cases.

Modified logic to invoke sequence for two i2s controller instances.

This also fixes warnings reported by kernel robot:
"warning: variable 'frmt_val' set but not used"
"warning: variable 'reg_val' set but not used"

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Link: https://lore.kernel.org/r/20220225193054.24916-1-Vijendar.Mukunda@amd.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/amd/vangogh/acp5x-pcm-dma.c | 66 +++++++++++++--------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/sound/soc/amd/vangogh/acp5x-pcm-dma.c b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
index f10de38976cb..3aa2d9a36880 100644
--- a/sound/soc/amd/vangogh/acp5x-pcm-dma.c
+++ b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
@@ -426,51 +426,51 @@ static int acp5x_audio_remove(struct platform_device *pdev)
 static int __maybe_unused acp5x_pcm_resume(struct device *dev)
 {
 	struct i2s_dev_data *adata;
-	u32 val, reg_val, frmt_val;
+	struct i2s_stream_instance *rtd;
+	u32 val;
 
-	reg_val = 0;
-	frmt_val = 0;
 	adata = dev_get_drvdata(dev);
 
 	if (adata->play_stream && adata->play_stream->runtime) {
-		struct i2s_stream_instance *rtd =
-			adata->play_stream->runtime->private_data;
+		rtd = adata->play_stream->runtime->private_data;
 		config_acp5x_dma(rtd, SNDRV_PCM_STREAM_PLAYBACK);
-		switch (rtd->i2s_instance) {
-		case I2S_HS_INSTANCE:
-			reg_val = ACP_HSTDM_ITER;
-			frmt_val = ACP_HSTDM_TXFRMT;
-			break;
-		case I2S_SP_INSTANCE:
-		default:
-			reg_val = ACP_I2STDM_ITER;
-			frmt_val = ACP_I2STDM_TXFRMT;
+		acp_writel((rtd->xfer_resolution  << 3), rtd->acp5x_base + ACP_HSTDM_ITER);
+		if (adata->tdm_mode == TDM_ENABLE) {
+			acp_writel(adata->tdm_fmt, adata->acp5x_base + ACP_HSTDM_TXFRMT);
+			val = acp_readl(adata->acp5x_base + ACP_HSTDM_ITER);
+			acp_writel(val | 0x2, adata->acp5x_base + ACP_HSTDM_ITER);
+		}
+	}
+	if (adata->i2ssp_play_stream && adata->i2ssp_play_stream->runtime) {
+		rtd = adata->i2ssp_play_stream->runtime->private_data;
+		config_acp5x_dma(rtd, SNDRV_PCM_STREAM_PLAYBACK);
+		acp_writel((rtd->xfer_resolution  << 3), rtd->acp5x_base + ACP_I2STDM_ITER);
+		if (adata->tdm_mode == TDM_ENABLE) {
+			acp_writel(adata->tdm_fmt, adata->acp5x_base + ACP_I2STDM_TXFRMT);
+			val = acp_readl(adata->acp5x_base + ACP_I2STDM_ITER);
+			acp_writel(val | 0x2, adata->acp5x_base + ACP_I2STDM_ITER);
 		}
-		acp_writel((rtd->xfer_resolution  << 3),
-			   rtd->acp5x_base + reg_val);
 	}
 
 	if (adata->capture_stream && adata->capture_stream->runtime) {
-		struct i2s_stream_instance *rtd =
-			adata->capture_stream->runtime->private_data;
+		rtd = adata->capture_stream->runtime->private_data;
 		config_acp5x_dma(rtd, SNDRV_PCM_STREAM_CAPTURE);
-		switch (rtd->i2s_instance) {
-		case I2S_HS_INSTANCE:
-			reg_val = ACP_HSTDM_IRER;
-			frmt_val = ACP_HSTDM_RXFRMT;
-			break;
-		case I2S_SP_INSTANCE:
-		default:
-			reg_val = ACP_I2STDM_IRER;
-			frmt_val = ACP_I2STDM_RXFRMT;
+		acp_writel((rtd->xfer_resolution  << 3), rtd->acp5x_base + ACP_HSTDM_IRER);
+		if (adata->tdm_mode == TDM_ENABLE) {
+			acp_writel(adata->tdm_fmt, adata->acp5x_base + ACP_HSTDM_RXFRMT);
+			val = acp_readl(adata->acp5x_base + ACP_HSTDM_IRER);
+			acp_writel(val | 0x2, adata->acp5x_base + ACP_HSTDM_IRER);
 		}
-		acp_writel((rtd->xfer_resolution  << 3),
-			   rtd->acp5x_base + reg_val);
 	}
-	if (adata->tdm_mode == TDM_ENABLE) {
-		acp_writel(adata->tdm_fmt, adata->acp5x_base + frmt_val);
-		val = acp_readl(adata->acp5x_base + reg_val);
-		acp_writel(val | 0x2, adata->acp5x_base + reg_val);
+	if (adata->i2ssp_capture_stream && adata->i2ssp_capture_stream->runtime) {
+		rtd = adata->i2ssp_capture_stream->runtime->private_data;
+		config_acp5x_dma(rtd, SNDRV_PCM_STREAM_CAPTURE);
+		acp_writel((rtd->xfer_resolution  << 3), rtd->acp5x_base + ACP_I2STDM_IRER);
+		if (adata->tdm_mode == TDM_ENABLE) {
+			acp_writel(adata->tdm_fmt, adata->acp5x_base + ACP_I2STDM_RXFRMT);
+			val = acp_readl(adata->acp5x_base + ACP_I2STDM_IRER);
+			acp_writel(val | 0x2, adata->acp5x_base + ACP_I2STDM_IRER);
+		}
 	}
 	acp_writel(1, adata->acp5x_base + ACP_EXTERNAL_INTR_ENB);
 	return 0;
-- 
2.34.1

