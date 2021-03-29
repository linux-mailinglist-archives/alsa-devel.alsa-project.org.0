Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 974E234C24D
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Mar 2021 05:50:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D8A01655;
	Mon, 29 Mar 2021 05:49:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D8A01655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616989849;
	bh=HFNamVLKea1Pduy0trDqKYLKorPU44Tx4mWBafmSltM=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lUAyXANwNAsCKuKcJojY/6a0VcQ24XXvoYcWBbwSoeYuilo/zAzcmw+5X27XXrh2m
	 WynkxSArd6x48VbfLBYoC069E5k+N21BiCxTtRU29ZiSzccFS21v80XoVG0tImJ/wr
	 bIH6MUhxyI9LIz8enu+JwPtaSTZ9Uq9N+fW1Og7s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C8AEF800B9;
	Mon, 29 Mar 2021 05:49:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B010F8015A; Mon, 29 Mar 2021 05:49:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25F50F800B9
 for <alsa-devel@alsa-project.org>; Mon, 29 Mar 2021 05:49:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25F50F800B9
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D2CD91A0E0D;
 Mon, 29 Mar 2021 05:49:00 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 70DEE1A0C82;
 Mon, 29 Mar 2021 05:48:56 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 8B5A140291;
 Mon, 29 Mar 2021 05:48:50 +0200 (CEST)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl_rpmsg: initialise pointers to NULL
Date: Mon, 29 Mar 2021 11:34:28 +0800
Message-Id: <1616988868-971-1-git-send-email-shengjiu.wang@nxp.com>
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

This fixes the following sparse warnings:

sound/soc/fsl/fsl_rpmsg.c:45:45: sparse: sparse: Using plain integer as NULL pointer
sound/soc/fsl/fsl_rpmsg.c:45:56: sparse: sparse: Using plain integer as NULL pointer

Fixes: b73d9e6225e8 ("ASoC: fsl_rpmsg: Add CPU DAI driver for audio base on rpmsg")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 sound/soc/fsl/fsl_rpmsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_rpmsg.c b/sound/soc/fsl/fsl_rpmsg.c
index 2d09d8850e2c..ea5c973e2e84 100644
--- a/sound/soc/fsl/fsl_rpmsg.c
+++ b/sound/soc/fsl/fsl_rpmsg.c
@@ -42,7 +42,7 @@ static int fsl_rpmsg_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
 {
 	struct fsl_rpmsg *rpmsg = snd_soc_dai_get_drvdata(dai);
-	struct clk *p = rpmsg->mclk, *pll = 0, *npll = 0;
+	struct clk *p = rpmsg->mclk, *pll = NULL, *npll = NULL;
 	u64 rate = params_rate(params);
 	int ret = 0;
 
-- 
2.17.1

