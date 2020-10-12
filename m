Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D009B28B0E9
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Oct 2020 10:56:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 753FB167D;
	Mon, 12 Oct 2020 10:55:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 753FB167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602492976;
	bh=r13WDld+WZFux9ClPLm4VaS1CGr8nylJ0PGqNonc878=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rHsGrSEjYpknpS4/wOUS13QCvQNlZbzoalPDs8ichAgQEsFZ4bFT3TpIcLSxV0hGb
	 gsMjgpaXn1kRVn8fO7V2/wE+Y994edIT+CJWhg2Z8MfkZAObWgYsRBBv+pVD3GpA8K
	 MtJHmdiaO9kdGq5TI69jREuVOTWLF1C/PNgF0Ki0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10770F80141;
	Mon, 12 Oct 2020 10:54:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DE33F80217; Mon, 12 Oct 2020 10:54:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CFCCF80141
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 10:54:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CFCCF80141
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id AF2B11A0EFE;
 Mon, 12 Oct 2020 10:54:27 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 676E11A0F14;
 Mon, 12 Oct 2020 10:54:23 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 28325402AA;
 Mon, 12 Oct 2020 10:54:18 +0200 (CEST)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: fsl_spdif: Add support for higher sample rates
Date: Mon, 12 Oct 2020 16:49:42 +0800
Message-Id: <1602492582-3558-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

Add 88200Hz and 176400Hz sample rates support for TX.
Add 88200Hz, 176400Hz, 192000Hz sample rates support for RX.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
---
 sound/soc/fsl/fsl_spdif.c | 16 +++++++++++++---
 sound/soc/fsl/fsl_spdif.h |  9 ++++++++-
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index b0f643fefe1e..f41496cf5b63 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -429,10 +429,18 @@ static int spdif_set_sample_rate(struct snd_pcm_substream *substream,
 		rate = SPDIF_TXRATE_48000;
 		csfs = IEC958_AES3_CON_FS_48000;
 		break;
+	case 88200:
+		rate = SPDIF_TXRATE_88200;
+		csfs = IEC958_AES3_CON_FS_88200;
+		break;
 	case 96000:
 		rate = SPDIF_TXRATE_96000;
 		csfs = IEC958_AES3_CON_FS_96000;
 		break;
+	case 176400:
+		rate = SPDIF_TXRATE_176400;
+		csfs = IEC958_AES3_CON_FS_176400;
+		break;
 	case 192000:
 		rate = SPDIF_TXRATE_192000;
 		csfs = IEC958_AES3_CON_FS_192000;
@@ -827,7 +835,7 @@ static int fsl_spdif_rxrate_info(struct snd_kcontrol *kcontrol,
 	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
 	uinfo->count = 1;
 	uinfo->value.integer.min = 16000;
-	uinfo->value.integer.max = 96000;
+	uinfo->value.integer.max = 192000;
 
 	return 0;
 }
@@ -1145,7 +1153,8 @@ static u32 fsl_spdif_txclk_caldiv(struct fsl_spdif_priv *spdif_priv,
 				struct clk *clk, u64 savesub,
 				enum spdif_txrate index, bool round)
 {
-	static const u32 rate[] = { 32000, 44100, 48000, 96000, 192000 };
+	static const u32 rate[] = { 32000, 44100, 48000, 88200, 96000, 176400,
+				    192000, };
 	bool is_sysclk = clk_is_match(clk, spdif_priv->sysclk);
 	u64 rate_ideal, rate_actual, sub;
 	u32 arate;
@@ -1205,7 +1214,8 @@ static u32 fsl_spdif_txclk_caldiv(struct fsl_spdif_priv *spdif_priv,
 static int fsl_spdif_probe_txclk(struct fsl_spdif_priv *spdif_priv,
 				enum spdif_txrate index)
 {
-	static const u32 rate[] = { 32000, 44100, 48000, 96000, 192000 };
+	static const u32 rate[] = { 32000, 44100, 48000, 88200, 96000, 176400,
+				    192000, };
 	struct platform_device *pdev = spdif_priv->pdev;
 	struct device *dev = &pdev->dev;
 	u64 savesub = 100000, ret;
diff --git a/sound/soc/fsl/fsl_spdif.h b/sound/soc/fsl/fsl_spdif.h
index e6c61e07bc1a..d5f1dfd58740 100644
--- a/sound/soc/fsl/fsl_spdif.h
+++ b/sound/soc/fsl/fsl_spdif.h
@@ -163,7 +163,9 @@ enum spdif_txrate {
 	SPDIF_TXRATE_32000 = 0,
 	SPDIF_TXRATE_44100,
 	SPDIF_TXRATE_48000,
+	SPDIF_TXRATE_88200,
 	SPDIF_TXRATE_96000,
+	SPDIF_TXRATE_176400,
 	SPDIF_TXRATE_192000,
 };
 #define SPDIF_TXRATE_MAX		(SPDIF_TXRATE_192000 + 1)
@@ -177,15 +179,20 @@ enum spdif_txrate {
 #define FSL_SPDIF_RATES_PLAYBACK	(SNDRV_PCM_RATE_32000 |	\
 					 SNDRV_PCM_RATE_44100 |	\
 					 SNDRV_PCM_RATE_48000 |	\
+					 SNDRV_PCM_RATE_88200 | \
 					 SNDRV_PCM_RATE_96000 |	\
+					 SNDRV_PCM_RATE_176400 | \
 					 SNDRV_PCM_RATE_192000)
 
 #define FSL_SPDIF_RATES_CAPTURE		(SNDRV_PCM_RATE_16000 | \
 					 SNDRV_PCM_RATE_32000 |	\
 					 SNDRV_PCM_RATE_44100 | \
 					 SNDRV_PCM_RATE_48000 |	\
+					 SNDRV_PCM_RATE_88200 | \
 					 SNDRV_PCM_RATE_64000 | \
-					 SNDRV_PCM_RATE_96000)
+					 SNDRV_PCM_RATE_96000 | \
+					 SNDRV_PCM_RATE_176400 | \
+					 SNDRV_PCM_RATE_192000)
 
 #define FSL_SPDIF_FORMATS_PLAYBACK	(SNDRV_PCM_FMTBIT_S16_LE | \
 					 SNDRV_PCM_FMTBIT_S20_3LE | \
-- 
2.27.0

