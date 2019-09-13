Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA52B2619
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2019 21:31:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D19F1689;
	Fri, 13 Sep 2019 21:31:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D19F1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568403113;
	bh=Bv06m/xkmmZPsgW0Mraqw18f2RHukONFQU/iJJceL2k=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EHwAJEP8VOZFwnjJpmpiZq/4cm5NPTzgWT71BvwvF+THVcLKD4fBkmiSuJ8kJngjF
	 YJ0AvTW067sSQ7WE6TZnQ0p+NVGOgKp7wKXk7vlP+YKNTFnynR6HYZbHFDHZMigmaF
	 x3Og04H/SVsPxNZuYVQtC2xs9lzezZWflOVcFNfo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72A9DF80600;
	Fri, 13 Sep 2019 21:28:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60514F805FE; Fri, 13 Sep 2019 21:28:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7236DF801EC
 for <alsa-devel@alsa-project.org>; Fri, 13 Sep 2019 21:28:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7236DF801EC
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6482E1A073C;
 Fri, 13 Sep 2019 21:28:12 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5730D1A0352;
 Fri, 13 Sep 2019 21:28:12 +0200 (CEST)
Received: from fsr-ub1864-103.ea.freescale.net
 (fsr-ub1864-103.ea.freescale.net [10.171.82.17])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id C9E43205DB;
 Fri, 13 Sep 2019 21:28:11 +0200 (CEST)
From: Daniel Baluta <daniel.baluta@nxp.com>
To: broonie@kernel.org
Date: Fri, 13 Sep 2019 22:28:07 +0300
Message-Id: <20190913192807.8423-4-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190913192807.8423-1-daniel.baluta@nxp.com>
References: <20190913192807.8423-1-daniel.baluta@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Daniel Baluta <daniel.baluta@nxp.com>, alsa-devel@alsa-project.org,
 timur@kernel.org, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, nicoleotsuka@gmail.com,
 NXP Linux Team <linux-imx@nxp.com>, festevam@gmail.com
Subject: [alsa-devel] [PATCH v2 3/3] ASoC: fsl_sai: Fix TCSR.TE/RCSR.RE in
	synchronous mode
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

The SAI transmitter and receiver can be configured to operate with
synchronous bit clock and frame sync.

When Tx is synchronous with receiver RCSR.RE should be set in playback
to enable the receiver which provides bit clock and frame sync.

When Rx is synchronous with transmitter TCSR.TE should be set in record
to enable the transmitter which provides bit clock and frame sync.

Cc: NXP Linux Team <linux-imx@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
Changes since v1: 
* new patch

 sound/soc/fsl/fsl_sai.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 6598a1ae0a2d..a59300e37549 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -539,8 +539,8 @@ static int fsl_sai_trigger(struct snd_pcm_substream *substream, int cmd,
 			   sai->synchronous[RX] ? FSL_SAI_CR2_SYNC : 0);
 
 	/*
-	 * It is recommended that the transmitter is the last enabled
-	 * and the first disabled.
+	 * it is recommended that the asynchronous block to be the last enabled
+	 * and the first disabled
 	 */
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -549,9 +549,11 @@ static int fsl_sai_trigger(struct snd_pcm_substream *substream, int cmd,
 		regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
 				   FSL_SAI_CSR_FRDE, FSL_SAI_CSR_FRDE);
 
-		regmap_update_bits(sai->regmap, FSL_SAI_RCSR(ofs),
-				   FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);
-		regmap_update_bits(sai->regmap, FSL_SAI_TCSR(ofs),
+		if (sai->synchronous[tx])
+			regmap_update_bits(sai->regmap, FSL_SAI_xCSR(!tx, ofs),
+					   FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);
+
+		regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
 				   FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);
 
 		regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
