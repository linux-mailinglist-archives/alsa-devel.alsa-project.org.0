Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFADD23C381
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Aug 2020 04:31:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2AE01663;
	Wed,  5 Aug 2020 04:30:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2AE01663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596594703;
	bh=Td6vZiaKJcXkJAxQj32XgSa7C/3s4lZBDlU7uKCWOds=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QtJQPJ+vDP1qAK7ew8bLPLIqbRT6dzWeUTI8SDPPKGPj46/B0DVVfOCpYHshT+dGH
	 g3bYr6J5KReeG05OjDdIwaeLIzJV5Ph/IZqjGWvolbg0eNXjUXKoTD7Dy1MLKEJNHm
	 Epc1N4I7Y3fkcHkdHcSu3X2UhreMuR/Hqs4kthU4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAEFEF801F7;
	Wed,  5 Aug 2020 04:28:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C334F802C2; Wed,  5 Aug 2020 04:28:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CF4EF801F7
 for <alsa-devel@alsa-project.org>; Wed,  5 Aug 2020 04:28:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CF4EF801F7
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 257AD20138C;
 Wed,  5 Aug 2020 04:28:37 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4741320019A;
 Wed,  5 Aug 2020 04:28:32 +0200 (CEST)
Received: from 10.192.242.69 (shlinux2.ap.freescale.net [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 5AF1640302;
 Wed,  5 Aug 2020 04:28:26 +0200 (CEST)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] ASoC: fsl_sai: Refine enable and disable sequence for
 synchronous mode
Date: Wed,  5 Aug 2020 10:23:53 +0800
Message-Id: <1596594233-13489-3-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596594233-13489-1-git-send-email-shengjiu.wang@nxp.com>
References: <1596594233-13489-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
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

Tx synchronous with Rx:
The TCSR.TE is no need to enabled when only Rx is going to be enabled.
Check if need to disable RSCR.RE before disabling TCSR.TE.

Rx synchronous with Tx:
The RCSR.RE is no need to enabled when only Tx is going to be enabled.
Check if need to disable TSCR.RE before disabling RCSR.TE.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 126 +++++++++++++++++++++++++++-------------
 1 file changed, 85 insertions(+), 41 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 84714fe7144c..f30c4e7b5221 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -517,6 +517,56 @@ static int fsl_sai_hw_free(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+/**
+ * fsl_sai_dir_is_synced - Check if stream is synced by the opposite stream
+ *
+ * SAI supports synchronous mode using bit/frame clocks of either Transmitter's
+ * or Receiver's for both streams. This function is used to check if clocks of
+ * the stream's are synced by the opposite stream.
+ *
+ * @sai: SAI context
+ * @dir: stream direction
+ */
+static inline bool fsl_sai_dir_is_synced(struct fsl_sai *sai, int dir)
+{
+	int adir = (dir == TX) ? RX : TX;
+
+	/* current dir in async mode while opposite dir in sync mode */
+	return !sai->synchronous[dir] && sai->synchronous[adir];
+}
+
+static void fsl_sai_config_disable(struct fsl_sai *sai, int dir)
+{
+	unsigned int ofs = sai->soc_data->reg_offset;
+	bool tx = dir == TX;
+	u32 xcsr, count = 100;
+
+	regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
+			   FSL_SAI_CSR_TERE, 0);
+
+	/* TERE will remain set till the end of current frame */
+	do {
+		udelay(10);
+		regmap_read(sai->regmap, FSL_SAI_xCSR(tx, ofs), &xcsr);
+	} while (--count && xcsr & FSL_SAI_CSR_TERE);
+
+	regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
+			   FSL_SAI_CSR_FR, FSL_SAI_CSR_FR);
+
+	/*
+	 * For sai master mode, after several open/close sai,
+	 * there will be no frame clock, and can't recover
+	 * anymore. Add software reset to fix this issue.
+	 * This is a hardware bug, and will be fix in the
+	 * next sai version.
+	 */
+	if (!sai->is_slave_mode) {
+		/* Software Reset */
+		regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs), FSL_SAI_CSR_SR);
+		/* Clear SR bit to finish the reset */
+		regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs), 0);
+	}
+}
 
 static int fsl_sai_trigger(struct snd_pcm_substream *substream, int cmd,
 		struct snd_soc_dai *cpu_dai)
@@ -525,7 +575,9 @@ static int fsl_sai_trigger(struct snd_pcm_substream *substream, int cmd,
 	unsigned int ofs = sai->soc_data->reg_offset;
 
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
-	u32 xcsr, count = 100;
+	int adir = tx ? RX : TX;
+	int dir = tx ? TX : RX;
+	u32 xcsr;
 
 	/*
 	 * Asynchronous mode: Clear SYNC for both Tx and Rx.
@@ -548,10 +600,22 @@ static int fsl_sai_trigger(struct snd_pcm_substream *substream, int cmd,
 		regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
 				   FSL_SAI_CSR_FRDE, FSL_SAI_CSR_FRDE);
 
-		regmap_update_bits(sai->regmap, FSL_SAI_RCSR(ofs),
-				   FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);
-		regmap_update_bits(sai->regmap, FSL_SAI_TCSR(ofs),
+		regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
 				   FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);
+		/*
+		 * Enable the opposite direction for synchronous mode
+		 * 1. Tx sync with Rx: only set RE for Rx; set TE & RE for Tx
+		 * 2. Rx sync with Tx: only set TE for Tx; set RE & TE for Rx
+		 *
+		 * RM recommends to enable RE after TE for case 1 and to enable
+		 * TE after RE for case 2, but we here may not always guarantee
+		 * that happens: "arecord 1.wav; aplay 2.wav" in case 1 enables
+		 * TE after RE, which is against what RM recommends but should
+		 * be safe to do, judging by years of testing results.
+		 */
+		if (fsl_sai_dir_is_synced(sai, adir))
+			regmap_update_bits(sai->regmap, FSL_SAI_xCSR((!tx), ofs),
+					   FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);
 
 		regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
 				   FSL_SAI_CSR_xIE_MASK, FSL_SAI_FLAGS);
@@ -566,43 +630,23 @@ static int fsl_sai_trigger(struct snd_pcm_substream *substream, int cmd,
 
 		/* Check if the opposite FRDE is also disabled */
 		regmap_read(sai->regmap, FSL_SAI_xCSR(!tx, ofs), &xcsr);
-		if (!(xcsr & FSL_SAI_CSR_FRDE)) {
-			/* Disable both directions and reset their FIFOs */
-			regmap_update_bits(sai->regmap, FSL_SAI_TCSR(ofs),
-					   FSL_SAI_CSR_TERE, 0);
-			regmap_update_bits(sai->regmap, FSL_SAI_RCSR(ofs),
-					   FSL_SAI_CSR_TERE, 0);
-
-			/* TERE will remain set till the end of current frame */
-			do {
-				udelay(10);
-				regmap_read(sai->regmap,
-					    FSL_SAI_xCSR(tx, ofs), &xcsr);
-			} while (--count && xcsr & FSL_SAI_CSR_TERE);
-
-			regmap_update_bits(sai->regmap, FSL_SAI_TCSR(ofs),
-					   FSL_SAI_CSR_FR, FSL_SAI_CSR_FR);
-			regmap_update_bits(sai->regmap, FSL_SAI_RCSR(ofs),
-					   FSL_SAI_CSR_FR, FSL_SAI_CSR_FR);
-
-			/*
-			 * For sai master mode, after several open/close sai,
-			 * there will be no frame clock, and can't recover
-			 * anymore. Add software reset to fix this issue.
-			 * This is a hardware bug, and will be fix in the
-			 * next sai version.
-			 */
-			if (!sai->is_slave_mode) {
-				/* Software Reset for both Tx and Rx */
-				regmap_write(sai->regmap, FSL_SAI_TCSR(ofs),
-					     FSL_SAI_CSR_SR);
-				regmap_write(sai->regmap, FSL_SAI_RCSR(ofs),
-					     FSL_SAI_CSR_SR);
-				/* Clear SR bit to finish the reset */
-				regmap_write(sai->regmap, FSL_SAI_TCSR(ofs), 0);
-				regmap_write(sai->regmap, FSL_SAI_RCSR(ofs), 0);
-			}
-		}
+
+		/*
+		 * If opposite stream provides clocks for synchronous mode and
+		 * it is inactive, disable it before disabling the current one
+		 */
+		if (fsl_sai_dir_is_synced(sai, adir) && !(xcsr & FSL_SAI_CSR_FRDE))
+			fsl_sai_config_disable(sai, adir);
+
+		/*
+		 * Disable current stream if either of:
+		 * 1. current stream doesn't provide clocks for synchronous mode
+		 * 2. current stream provides clocks for synchronous mode but no
+		 *    more stream is active.
+		 */
+		if (!fsl_sai_dir_is_synced(sai, dir) || !(xcsr & FSL_SAI_CSR_FRDE))
+			fsl_sai_config_disable(sai, dir);
+
 		break;
 	default:
 		return -EINVAL;
-- 
2.27.0

