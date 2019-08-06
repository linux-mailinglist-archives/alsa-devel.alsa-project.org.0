Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC744834DD
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 17:15:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 535F415F2;
	Tue,  6 Aug 2019 17:15:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 535F415F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565104555;
	bh=ENm23VVd/RJA4hj/QzQksnoc8NVfgaeQPlZ8StTGOOQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QObmg65XAvA9Q6uZVnXADAVSlnzrCilIBMtN7iAn9Z+HIiMnlMOjM/l/tmwX82wUJ
	 kELqzSs6Nebv8taI3JXTkt3LkY5YhhDE0mE5/Jj/5MoYwddqxgPj3aZCnp9R2WU5eq
	 cVYRpF+3CRF0ihPiYSSi+XPcy2xvMQ2eANEugWN8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BE57F805AF;
	Tue,  6 Aug 2019 17:12:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D31D3F80534; Tue,  6 Aug 2019 17:12:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A658F80290
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 17:12:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A658F80290
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 10D5D1A01FF;
 Tue,  6 Aug 2019 17:12:31 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 03B091A01F6;
 Tue,  6 Aug 2019 17:12:31 +0200 (CEST)
Received: from fsr-ub1864-103.ea.freescale.net
 (fsr-ub1864-103.ea.freescale.net [10.171.82.17])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 1AE24205DD;
 Tue,  6 Aug 2019 17:12:30 +0200 (CEST)
From: Daniel Baluta <daniel.baluta@nxp.com>
To: broonie@kernel.org
Date: Tue,  6 Aug 2019 18:12:11 +0300
Message-Id: <20190806151214.6783-3-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190806151214.6783-1-daniel.baluta@nxp.com>
References: <20190806151214.6783-1-daniel.baluta@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, timur@kernel.org,
 robh@kernel.org, Daniel Baluta <daniel.baluta@nxp.com>, shengjiu.wang@nxp.com,
 angus@akkea.ca, tiwai@suse.com, linux-kernel@vger.kernel.org,
 nicoleotsuka@gmail.com, linux-imx@nxp.com, kernel@pengutronix.de,
 festevam@gmail.com, mihai.serban@gmail.com, l.stach@pengutronix.de
Subject: [alsa-devel] [PATCH v3 2/5] ASoC: fsl_sai: Update Tx/Rx channel
	enable mask
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

Tx channel enable (TCE) / Rx channel enable (RCE) bits
enable corresponding data channel for Tx/Rx operation.

Because SAI supports up the 8 channels TCE/RCE occupy
up the 8 bits inside TCR3/RCR3 registers we need to extend
the mask to reflect this.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 6 ++++--
 sound/soc/fsl/fsl_sai.h | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 17b0aff4ee8b..637b1d12a575 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -599,7 +599,8 @@ static int fsl_sai_startup(struct snd_pcm_substream *substream,
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 	int ret;
 
-	regmap_update_bits(sai->regmap, FSL_SAI_xCR3(tx), FSL_SAI_CR3_TRCE,
+	regmap_update_bits(sai->regmap, FSL_SAI_xCR3(tx),
+			   FSL_SAI_CR3_TRCE_MASK,
 			   FSL_SAI_CR3_TRCE);
 
 	ret = snd_pcm_hw_constraint_list(substream->runtime, 0,
@@ -614,7 +615,8 @@ static void fsl_sai_shutdown(struct snd_pcm_substream *substream,
 	struct fsl_sai *sai = snd_soc_dai_get_drvdata(cpu_dai);
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 
-	regmap_update_bits(sai->regmap, FSL_SAI_xCR3(tx), FSL_SAI_CR3_TRCE, 0);
+	regmap_update_bits(sai->regmap, FSL_SAI_xCR3(tx),
+			   FSL_SAI_CR3_TRCE_MASK, 0);
 }
 
 static const struct snd_soc_dai_ops fsl_sai_pcm_dai_ops = {
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 4bb478041d67..20c5b9b1e8bc 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -110,6 +110,7 @@
 
 /* SAI Transmit and Receive Configuration 3 Register */
 #define FSL_SAI_CR3_TRCE	BIT(16)
+#define FSL_SAI_CR3_TRCE_MASK	GENMASK(23, 16)
 #define FSL_SAI_CR3_WDFL(x)	(x)
 #define FSL_SAI_CR3_WDFL_MASK	0x1f
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
