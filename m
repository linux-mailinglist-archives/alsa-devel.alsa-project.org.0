Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDC71CF28D
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 12:34:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DDAC168E;
	Tue, 12 May 2020 12:33:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DDAC168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589279668;
	bh=tQV12XdmmxRAYTNYU/a528g3IbaAYoF0XV7RuSDqvfg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pC2KSjDYvgul9/gh7QPLkuVRa84qIHASElIxSW/L+ewCVlRnYTw3w0ndLXeQqG6c9
	 00ol0G1Y/cLNLHQPdStG/kME+D8CbzmK+3j9GCftrOmT55cNwuG5o2Bnttge7p8tXo
	 ZO//YxUOVqt7w00xrJLqrCnaDIKfHzTMu2X5zPyM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 291F4F80158;
	Tue, 12 May 2020 12:32:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADAA2F8014C; Tue, 12 May 2020 12:32:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA3A7F800E3
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 12:32:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA3A7F800E3
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 72DE0200F2E;
 Tue, 12 May 2020 12:32:37 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id E6ABC200F8B;
 Tue, 12 May 2020 12:32:32 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 0D4E9402BC;
 Tue, 12 May 2020 18:32:26 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH] ASoC: fsl_asrc: Set ASR76K and ASR56K based on processing
 clock
Date: Tue, 12 May 2020 18:22:59 +0800
Message-Id: <1589278979-31008-1-git-send-email-shengjiu.wang@nxp.com>
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

The processing clock is different for platforms, so it is better
to set ASR76K and ASR56K based on processing clock, rather than
hard coding the value for them.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Mihai Serban <mihai.serban@nxp.com>
---
 sound/soc/fsl/fsl_asrc.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 067a54ab554f..ca926915068f 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -858,6 +858,8 @@ static const struct regmap_config fsl_asrc_regmap_config = {
  */
 static int fsl_asrc_init(struct fsl_asrc *asrc)
 {
+	unsigned long ipg_rate;
+
 	/* Halt ASRC internal FP when input FIFO needs data for pair A, B, C */
 	regmap_write(asrc->regmap, REG_ASRCTR, ASRCTR_ASRCEN);
 
@@ -875,11 +877,14 @@ static int fsl_asrc_init(struct fsl_asrc *asrc)
 	regmap_update_bits(asrc->regmap, REG_ASRTFR1,
 			   ASRTFR1_TF_BASE_MASK, ASRTFR1_TF_BASE(0xfc));
 
-	/* Set the processing clock for 76KHz to 133M */
-	regmap_write(asrc->regmap, REG_ASR76K, 0x06D6);
-
-	/* Set the processing clock for 56KHz to 133M */
-	return regmap_write(asrc->regmap, REG_ASR56K, 0x0947);
+	/*
+	 * Set the period of the 76KHz and 56KHz sampling clocks based on
+	 * the ASRC processing clock.
+	 * On iMX6, ipg_clk = 133MHz, REG_ASR76K = 0x06D6, REG_ASR56K = 0x0947
+	 */
+	ipg_rate = clk_get_rate(asrc->ipg_clk);
+	regmap_write(asrc->regmap, REG_ASR76K, ipg_rate / 76000);
+	return regmap_write(asrc->regmap, REG_ASR56K, ipg_rate / 56000);
 }
 
 /**
-- 
2.21.0

