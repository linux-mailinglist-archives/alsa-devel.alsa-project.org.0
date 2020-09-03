Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2461525B915
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 05:17:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A54FE18B2;
	Thu,  3 Sep 2020 05:16:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A54FE18B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599103038;
	bh=UhGZPrOkOSfA8AA6JMk2OKPT9mtTH7McWaiXXvwEPYk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=StY8Sz2qXP+79dJjY2aHS4BoiIAF8wR2ZE1FcQjG7+UppYFkCH9ikc6Foh9Z9qBng
	 M99Az0ihWH2WaojoqylWwckZOWWEYaLCQLGtg4VgmkY+HJbPtBOop56/gXwvALo4q6
	 pQGh08RlamNNx0T4rFyRSpomZE0kIwzt8FdHyXcM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD355F8020D;
	Thu,  3 Sep 2020 05:15:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9BE2F800F0; Thu,  3 Sep 2020 05:15:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0377F800F0
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 05:15:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0377F800F0
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B02C91A028C;
 Thu,  3 Sep 2020 05:15:25 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 321811A028B;
 Thu,  3 Sep 2020 05:15:21 +0200 (CEST)
Received: from 10.192.242.69 (shlinux2.ap.freescale.net [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 56C2840249;
 Thu,  3 Sep 2020 05:15:15 +0200 (CEST)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com
Subject: [PATCH] ASoC: fsl_sai: Set SAI Channel Mode to Output Mode
Date: Thu,  3 Sep 2020 11:09:15 +0800
Message-Id: <1599102555-17178-1-git-send-email-shengjiu.wang@nxp.com>
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

Transmit data pins will output zero when slots are masked or channels
are disabled. In CHMOD TDM mode, transmit data pins are tri-stated when
slots are masked or channels are disabled. When data pins are tri-stated,
there is noise on some channels when FS clock value is high and data is
read while fsclk is transitioning from high to low.

Signed-off-by: Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 12 ++++++++++--
 sound/soc/fsl/fsl_sai.h |  2 ++
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 62c5fdb678fc..33b194a5c1dc 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -486,6 +486,12 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 
 	val_cr4 |= FSL_SAI_CR4_FRSZ(slots);
 
+	/* Output Mode - data pins transmit 0 when slots are masked
+	 * or channels are disabled
+	 */
+	if (tx)
+		val_cr4 |= FSL_SAI_CR4_CHMOD;
+
 	/*
 	 * For SAI master mode, when Tx(Rx) sync with Rx(Tx) clock, Rx(Tx) will
 	 * generate bclk and frame clock for Tx(Rx), we should set RCR4(TCR4),
@@ -494,7 +500,8 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 
 	if (!sai->is_slave_mode && fsl_sai_dir_is_synced(sai, adir)) {
 		regmap_update_bits(sai->regmap, FSL_SAI_xCR4(!tx, ofs),
-				   FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK,
+				   FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK |
+				   FSL_SAI_CR4_CHMOD_MASK,
 				   val_cr4);
 		regmap_update_bits(sai->regmap, FSL_SAI_xCR5(!tx, ofs),
 				   FSL_SAI_CR5_WNW_MASK | FSL_SAI_CR5_W0W_MASK |
@@ -502,7 +509,8 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx, ofs),
-			   FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK,
+			   FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK |
+			   FSL_SAI_CR4_CHMOD_MASK,
 			   val_cr4);
 	regmap_update_bits(sai->regmap, FSL_SAI_xCR5(tx, ofs),
 			   FSL_SAI_CR5_WNW_MASK | FSL_SAI_CR5_W0W_MASK |
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 6aba7d28f5f3..19cd4e1bbff9 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -119,6 +119,8 @@
 #define FSL_SAI_CR4_FRSZ_MASK	(0x1f << 16)
 #define FSL_SAI_CR4_SYWD(x)	(((x) - 1) << 8)
 #define FSL_SAI_CR4_SYWD_MASK	(0x1f << 8)
+#define FSL_SAI_CR4_CHMOD       BIT(5)
+#define FSL_SAI_CR4_CHMOD_MASK  BIT(5)
 #define FSL_SAI_CR4_MF		BIT(4)
 #define FSL_SAI_CR4_FSE		BIT(3)
 #define FSL_SAI_CR4_FSP		BIT(1)
-- 
2.27.0

