Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 643C528C764
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Oct 2020 04:56:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED793168A;
	Tue, 13 Oct 2020 04:55:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED793168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602557763;
	bh=uXUMo9hKY5vCVMNYDdz3BLk8RO1ZMJWWwefWN6Y9EZs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=R1c4o9ieylGkH9JTiEsungp1iYg49B5oPh+4f3hnEQ4Win9MlYjSgO0CoIuISViMa
	 wk6/nssr3hW3AMt0+x8j1Gr5hxoLlFmWehe8su+K4fLX9em6i5RQEib+ZDaT3YqQzP
	 diWQZsULpEwpA61KomNjN9XjctKBFreJtQNbEfjI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BD28F8012C;
	Tue, 13 Oct 2020 04:54:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E002F801A3; Tue, 13 Oct 2020 04:54:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F3D2F800F6
 for <alsa-devel@alsa-project.org>; Tue, 13 Oct 2020 04:54:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F3D2F800F6
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A759C1A1507;
 Tue, 13 Oct 2020 04:54:09 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 69EA91A1516;
 Tue, 13 Oct 2020 04:54:05 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 19B7F40332;
 Tue, 13 Oct 2020 04:53:58 +0200 (CEST)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
Subject: [PATCH v2] ASoC: fsl_spdif: Add support for higher sample rates
Date: Tue, 13 Oct 2020 10:49:20 +0800
Message-Id: <1602557360-18795-1-git-send-email-shengjiu.wang@nxp.com>
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

Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
changes in v2
- reorder the signed-off
- add acked-by Nicolin

 sound/soc/fsl/fsl_spdif.c | 16 +++++++++++++---
 sound/soc/fsl/fsl_spdif.h |  9 ++++++++-
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 4d14f4076ead..1c030142556a 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -459,10 +459,18 @@ static int spdif_set_sample_rate(struct snd_pcm_substream *substream,
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
@@ -857,7 +865,7 @@ static int fsl_spdif_rxrate_info(struct snd_kcontrol *kcontrol,
 	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
 	uinfo->count = 1;
 	uinfo->value.integer.min = 16000;
-	uinfo->value.integer.max = 96000;
+	uinfo->value.integer.max = 192000;
 
 	return 0;
 }
@@ -1175,7 +1183,8 @@ static u32 fsl_spdif_txclk_caldiv(struct fsl_spdif_priv *spdif_priv,
 				struct clk *clk, u64 savesub,
 				enum spdif_txrate index, bool round)
 {
-	static const u32 rate[] = { 32000, 44100, 48000, 96000, 192000 };
+	static const u32 rate[] = { 32000, 44100, 48000, 88200, 96000, 176400,
+				    192000, };
 	bool is_sysclk = clk_is_match(clk, spdif_priv->sysclk);
 	u64 rate_ideal, rate_actual, sub;
 	u32 arate;
@@ -1235,7 +1244,8 @@ static u32 fsl_spdif_txclk_caldiv(struct fsl_spdif_priv *spdif_priv,
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

