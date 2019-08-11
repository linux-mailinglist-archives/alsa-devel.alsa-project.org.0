Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F9289360
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Aug 2019 21:47:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98AEF1663;
	Sun, 11 Aug 2019 21:46:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98AEF1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565552830;
	bh=AI0F6TNOfcXnOkXosX6vapGJ0x/Mhskm+KUjA+Q8cDk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tghsEDks+a1xD6YXl1AFRfQpxGWp+lkwZZKfbK/Aitds70HTUm6NJlRXpCEc21k6V
	 5+mAIX5wp5PA0KvYaFEPbtHOp+nzfIqenLuV+DttckiGJjpQNtuLmgP4G551ZAObDI
	 hgyv/qzuySR6+zSqJFN+ojWVSOHpzSp2ArZo42Qg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAB26F80274;
	Sun, 11 Aug 2019 21:45:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34276F80273; Sun, 11 Aug 2019 21:45:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A34F4F8015B
 for <alsa-devel@alsa-project.org>; Sun, 11 Aug 2019 21:45:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A34F4F8015B
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id E6C6520010F;
 Sun, 11 Aug 2019 21:45:19 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id CFE9C20003D;
 Sun, 11 Aug 2019 21:45:19 +0200 (CEST)
Received: from fsr-ub1864-103.ea.freescale.net
 (fsr-ub1864-103.ea.freescale.net [10.171.82.17])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 72AE520600;
 Sun, 11 Aug 2019 21:45:19 +0200 (CEST)
From: Daniel Baluta <daniel.baluta@nxp.com>
To: nicoleotsuka@gmail.com,
	broonie@kernel.org
Date: Sun, 11 Aug 2019 22:45:17 +0300
Message-Id: <20190811194517.19314-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: alsa-devel@alsa-project.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org, linux-imx@nxp.com,
 Viorel Suman <viorel.suman@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
Subject: [alsa-devel] [PATCH] ASoC: fsl_sai: Handle slave mode per TX/RX
	direction
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Viorel Suman <viorel.suman@nxp.com>

The SAI interface can be a clock supplier or consumer
as a function of stream direction. e.g SAI can be master
for Tx and slave for Rx.

Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 18 +++++++++---------
 sound/soc/fsl/fsl_sai.h |  2 +-
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 4a346fcb5630..69cf3678c859 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -273,18 +273,18 @@ static int fsl_sai_set_dai_fmt_tr(struct snd_soc_dai *cpu_dai,
 	case SND_SOC_DAIFMT_CBS_CFS:
 		val_cr2 |= FSL_SAI_CR2_BCD_MSTR;
 		val_cr4 |= FSL_SAI_CR4_FSD_MSTR;
-		sai->is_slave_mode = false;
+		sai->is_slave_mode[tx] = false;
 		break;
 	case SND_SOC_DAIFMT_CBM_CFM:
-		sai->is_slave_mode = true;
+		sai->is_slave_mode[tx] = true;
 		break;
 	case SND_SOC_DAIFMT_CBS_CFM:
 		val_cr2 |= FSL_SAI_CR2_BCD_MSTR;
-		sai->is_slave_mode = false;
+		sai->is_slave_mode[tx] = false;
 		break;
 	case SND_SOC_DAIFMT_CBM_CFS:
 		val_cr4 |= FSL_SAI_CR4_FSD_MSTR;
-		sai->is_slave_mode = true;
+		sai->is_slave_mode[tx] = true;
 		break;
 	default:
 		return -EINVAL;
@@ -326,7 +326,7 @@ static int fsl_sai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
 	int ret = 0;
 
 	/* Don't apply to slave mode */
-	if (sai->is_slave_mode)
+	if (sai->is_slave_mode[tx])
 		return 0;
 
 	for (id = 0; id < FSL_SAI_MCLK_MAX; id++) {
@@ -422,7 +422,7 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 	if (sai->slot_width)
 		slot_width = sai->slot_width;
 
-	if (!sai->is_slave_mode) {
+	if (!sai->is_slave_mode[tx]) {
 		ret = fsl_sai_set_bclk(cpu_dai, tx,
 				slots * slot_width * params_rate(params));
 		if (ret)
@@ -458,7 +458,7 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 	 * error.
 	 */
 
-	if (!sai->is_slave_mode) {
+	if (!sai->is_slave_mode[tx]) {
 		if (!sai->synchronous[TX] && sai->synchronous[RX] && !tx) {
 			regmap_update_bits(sai->regmap, FSL_SAI_TCR4(ofs),
 				FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK,
@@ -497,7 +497,7 @@ static int fsl_sai_hw_free(struct snd_pcm_substream *substream,
 	struct fsl_sai *sai = snd_soc_dai_get_drvdata(cpu_dai);
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 
-	if (!sai->is_slave_mode &&
+	if (!sai->is_slave_mode[tx] &&
 			sai->mclk_streams & BIT(substream->stream)) {
 		clk_disable_unprepare(sai->mclk_clk[sai->mclk_id[tx]]);
 		sai->mclk_streams &= ~BIT(substream->stream);
@@ -581,7 +581,7 @@ static int fsl_sai_trigger(struct snd_pcm_substream *substream, int cmd,
 			 * This is a hardware bug, and will be fix in the
 			 * next sai version.
 			 */
-			if (!sai->is_slave_mode) {
+			if (!sai->is_slave_mode[tx]) {
 				/* Software Reset for both Tx and Rx */
 				regmap_write(sai->regmap, FSL_SAI_TCSR(ofs),
 					     FSL_SAI_CSR_SR);
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index b89b0ca26053..c2c43a7d9ba1 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -167,7 +167,7 @@ struct fsl_sai {
 	struct clk *bus_clk;
 	struct clk *mclk_clk[FSL_SAI_MCLK_MAX];
 
-	bool is_slave_mode;
+	bool is_slave_mode[2];
 	bool is_lsb_first;
 	bool is_dsp_mode;
 	bool synchronous[2];
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
