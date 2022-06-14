Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B081C54A81C
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 06:27:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E50B18CA;
	Tue, 14 Jun 2022 06:26:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E50B18CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655180827;
	bh=BbyXxlWq3TqAErV0Y8GNiAe4UdpZlX77AUTUjKWi/GE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AcOnbxGaRXRRN+qnkD1d1u21Nxc50t0+s1BhLNSJ+QAYjpg/jaS7J1ChEXiPvsqmh
	 o26FAQ/XZ/GoKiJE8UaHEt4Qe74La/wXwqhSmXAVY8Ytypfh5pxOjHDrAfAuIc+eTz
	 FPkTvhohlCU0Icjs6GoK+tuR8ihyIWKtpGNKX9+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4724F80529;
	Tue, 14 Jun 2022 06:25:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B390CF80527; Tue, 14 Jun 2022 06:25:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 739C6F8012B
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 06:25:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 739C6F8012B
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3DB13202719;
 Tue, 14 Jun 2022 06:25:30 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id E85B8202718;
 Tue, 14 Jun 2022 06:25:29 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 0E88B180219B;
 Tue, 14 Jun 2022 12:25:27 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/7] ASoC: fsl_sai: Add PDM daifmt support
Date: Tue, 14 Jun 2022 12:11:18 +0800
Message-Id: <1655179884-12278-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1655179884-12278-1-git-send-email-shengjiu.wang@nxp.com>
References: <1655179884-12278-1-git-send-email-shengjiu.wang@nxp.com>
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

PDM format is used for 1-bit stream, so clear the FBT and SYWD,
and the each dataline only has one channel data.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 17 +++++++++++++++--
 sound/soc/fsl/fsl_sai.h |  1 +
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 4f5bd9597c74..d11ee3b6f163 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -224,6 +224,7 @@ static int fsl_sai_set_dai_fmt_tr(struct snd_soc_dai *cpu_dai,
 	if (!sai->is_lsb_first)
 		val_cr4 |= FSL_SAI_CR4_MF;
 
+	sai->is_pdm_mode = false;
 	/* DAI mode */
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
@@ -262,6 +263,11 @@ static int fsl_sai_set_dai_fmt_tr(struct snd_soc_dai *cpu_dai,
 		val_cr2 |= FSL_SAI_CR2_BCP;
 		sai->is_dsp_mode = true;
 		break;
+	case SND_SOC_DAIFMT_PDM:
+		val_cr2 |= FSL_SAI_CR2_BCP;
+		val_cr4 &= ~FSL_SAI_CR4_MF;
+		sai->is_pdm_mode = true;
+		break;
 	case SND_SOC_DAIFMT_RIGHT_J:
 		/* To be done */
 	default:
@@ -470,6 +476,13 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 
 	pins = DIV_ROUND_UP(channels, slots);
 
+	/*
+	 * PDM mode, channels are independent
+	 * each channels are on one dataline/FIFO.
+	 */
+	if (sai->is_pdm_mode)
+		pins = channels;
+
 	if (!sai->is_consumer_mode) {
 		if (sai->bclk_ratio)
 			ret = fsl_sai_set_bclk(cpu_dai, tx,
@@ -492,13 +505,13 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 		}
 	}
 
-	if (!sai->is_dsp_mode)
+	if (!sai->is_dsp_mode && !sai->is_pdm_mode)
 		val_cr4 |= FSL_SAI_CR4_SYWD(slot_width);
 
 	val_cr5 |= FSL_SAI_CR5_WNW(slot_width);
 	val_cr5 |= FSL_SAI_CR5_W0W(slot_width);
 
-	if (sai->is_lsb_first)
+	if (sai->is_lsb_first || sai->is_pdm_mode)
 		val_cr5 |= FSL_SAI_CR5_FBT(0);
 	else
 		val_cr5 |= FSL_SAI_CR5_FBT(word_width - 1);
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 1c8f5ca07f9d..bc2a86a413e1 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -259,6 +259,7 @@ struct fsl_sai {
 	bool is_consumer_mode;
 	bool is_lsb_first;
 	bool is_dsp_mode;
+	bool is_pdm_mode;
 	bool synchronous[2];
 
 	unsigned int mclk_id[2];
-- 
2.17.1

