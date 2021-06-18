Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E973ACB85
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Jun 2021 14:58:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57F821712;
	Fri, 18 Jun 2021 14:57:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57F821712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624021126;
	bh=s/73pZ6odDD6VHFRe5nMak3Ev3diZXpEc4a798nugzs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cz5WUZjq6FmFzVU+dDNeRumBbGyyPQfpS7MeVN0ihrn0TRWbj7kZs/Ho1QFmHkRqu
	 yqF+joZLroQQi6hjwg4Mf3wlNGu5iLihjezgqsGOFjJvkMcZi0pkMFMCDF/FE5dbq3
	 bLxEL35ZUrpQ9rygSqKlwE6QBdqkqdr4BiC4uzcI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFA56F80084;
	Fri, 18 Jun 2021 14:57:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D58CF8032D; Fri, 18 Jun 2021 14:57:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADF05F800E1
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 14:57:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADF05F800E1
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 140BF1A0CF8;
 Fri, 18 Jun 2021 14:57:07 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D87C01A20D8;
 Fri, 18 Jun 2021 14:57:02 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 7A3FB402B6;
 Fri, 18 Jun 2021 20:56:57 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
Subject: [PATCH v2] ASoC: fsl_xcvr: disable all interrupts when suspend happens
Date: Fri, 18 Jun 2021 20:38:33 +0800
Message-Id: <1624019913-3380-1-git-send-email-shengjiu.wang@nxp.com>
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

There is an unhandled interrupt after suspend, which cause endless
interrupt when system resume, so system may hang.

Disable all interrupts in runtime suspend callback to avoid above
issue.

Fixes: 28564486866f ("ASoC: fsl_xcvr: Add XCVR ASoC CPU DAI driver")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
changes in v2:
- Add Fixes tag
- Add comments for the change

 sound/soc/fsl/fsl_xcvr.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index df7c189d97dd..92dd99258edf 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -1233,6 +1233,16 @@ static __maybe_unused int fsl_xcvr_runtime_suspend(struct device *dev)
 	struct fsl_xcvr *xcvr = dev_get_drvdata(dev);
 	int ret;
 
+	/*
+	 * Clear interrupts, when streams starts or resumes after
+	 * suspend, interrupts are enabled in prepare(), so no need
+	 * to enable interrupts in resume().
+	 */
+	ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_IER0,
+				 FSL_XCVR_IRQ_EARC_ALL, 0);
+	if (ret < 0)
+		dev_err(dev, "Failed to clear IER0: %d\n", ret);
+
 	/* Assert M0+ reset */
 	ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL,
 				 FSL_XCVR_EXT_CTRL_CORE_RESET,
-- 
2.27.0

