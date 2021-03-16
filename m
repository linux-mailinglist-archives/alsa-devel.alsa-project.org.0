Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E62B33D141
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Mar 2021 10:57:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 935AE1798;
	Tue, 16 Mar 2021 10:56:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 935AE1798
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615888643;
	bh=m5mg+xXqlyEnfo2bPs3/yFKDzAHj9/GC91WHmU+tFwM=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LLKQ4jALAaFGV5blx3FKV440nMv7BLc6rywa3oLBPAKkxx4rbbzsyH5LmFlSW7rkE
	 UlaIgvM91GyH/CAyqqUm+iZe7atdA7L2dFfSqGd1qYbxWpeSJJ69SzUaLp7Fptwbh0
	 qLt6z5wY9Zls+2q5i1atVM9fmgSJVVQuPcZXKzBA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E902CF80156;
	Tue, 16 Mar 2021 10:55:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED7ECF80163; Tue, 16 Mar 2021 10:55:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C23AFF80148
 for <alsa-devel@alsa-project.org>; Tue, 16 Mar 2021 10:55:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C23AFF80148
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A33FD1A3FC1;
 Tue, 16 Mar 2021 10:55:35 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CDA631A3FAB;
 Tue, 16 Mar 2021 10:55:29 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id A0B3340291;
 Tue, 16 Mar 2021 10:55:22 +0100 (CET)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl_spdif: use snd_ctl_boolean_mono_info
Date: Tue, 16 Mar 2021 17:42:16 +0800
Message-Id: <1615887736-31217-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
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

From: Viorel Suman <viorel.suman@nxp.com>

Remove redundant code and use snd_ctl_boolean_mono_info
instead.

Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_spdif.c | 30 +++---------------------------
 1 file changed, 3 insertions(+), 27 deletions(-)

diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 174e558224d8..1cd3441d1c03 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -801,18 +801,6 @@ static int fsl_spdif_qget(struct snd_kcontrol *kcontrol,
 	return ret;
 }
 
-/* Valid bit information */
-static int fsl_spdif_vbit_info(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_info *uinfo)
-{
-	uinfo->type = SNDRV_CTL_ELEM_TYPE_BOOLEAN;
-	uinfo->count = 1;
-	uinfo->value.integer.min = 0;
-	uinfo->value.integer.max = 1;
-
-	return 0;
-}
-
 /* Get valid good bit from interrupt status register */
 static int fsl_spdif_rx_vbit_get(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
@@ -925,18 +913,6 @@ static int fsl_spdif_rxrate_get(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-/* User bit sync mode info */
-static int fsl_spdif_usync_info(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_info *uinfo)
-{
-	uinfo->type = SNDRV_CTL_ELEM_TYPE_BOOLEAN;
-	uinfo->count = 1;
-	uinfo->value.integer.min = 0;
-	uinfo->value.integer.max = 1;
-
-	return 0;
-}
-
 /*
  * User bit sync mode:
  * 1 CD User channel subcode
@@ -1018,7 +994,7 @@ static struct snd_kcontrol_new fsl_spdif_ctrls[] = {
 		.name = "IEC958 RX V-Bit Errors",
 		.access = SNDRV_CTL_ELEM_ACCESS_READ |
 			SNDRV_CTL_ELEM_ACCESS_VOLATILE,
-		.info = fsl_spdif_vbit_info,
+		.info = snd_ctl_boolean_mono_info,
 		.get = fsl_spdif_rx_vbit_get,
 	},
 	{
@@ -1027,7 +1003,7 @@ static struct snd_kcontrol_new fsl_spdif_ctrls[] = {
 		.access = SNDRV_CTL_ELEM_ACCESS_READ |
 			SNDRV_CTL_ELEM_ACCESS_WRITE |
 			SNDRV_CTL_ELEM_ACCESS_VOLATILE,
-		.info = fsl_spdif_vbit_info,
+		.info = snd_ctl_boolean_mono_info,
 		.get = fsl_spdif_tx_vbit_get,
 		.put = fsl_spdif_tx_vbit_put,
 	},
@@ -1047,7 +1023,7 @@ static struct snd_kcontrol_new fsl_spdif_ctrls[] = {
 		.access = SNDRV_CTL_ELEM_ACCESS_READ |
 			SNDRV_CTL_ELEM_ACCESS_WRITE |
 			SNDRV_CTL_ELEM_ACCESS_VOLATILE,
-		.info = fsl_spdif_usync_info,
+		.info = snd_ctl_boolean_mono_info,
 		.get = fsl_spdif_usync_get,
 		.put = fsl_spdif_usync_put,
 	},
-- 
2.27.0

