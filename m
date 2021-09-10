Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C1A40693B
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Sep 2021 11:43:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2ECA1698;
	Fri, 10 Sep 2021 11:42:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2ECA1698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631266989;
	bh=WrfB2zltshoJJvb/6X9wNanMzI074T/nSZ+v//ivJ1o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=h9fSAgDK1JEv9pe5jgV0dPZB4oUkAAj6HPkMVgtqQyv6IV6cB+ZjkzyAct6mhXE0F
	 WSMgtIyWQxDdjylDAyvdYhTMajzrneAADdgHDpqsfOyAAbGwAqPsZUElah3gHWg82u
	 HBiIagE2e93CmymXkMPAZs1CX/VLq+W4p36V0IMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B3A1F8049C;
	Fri, 10 Sep 2021 11:41:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E110BF802E7; Fri, 10 Sep 2021 11:41:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4716F800FC
 for <alsa-devel@alsa-project.org>; Fri, 10 Sep 2021 11:41:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4716F800FC
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 1D5311A258D;
 Fri, 10 Sep 2021 11:41:39 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D95DA1A2591;
 Fri, 10 Sep 2021 11:41:38 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 649AB183AD26;
 Fri, 10 Sep 2021 17:41:37 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: fsl_xcvr: Fix channel swap issue with ARC
Date: Fri, 10 Sep 2021 17:18:30 +0800
Message-Id: <1631265510-27384-1-git-send-email-shengjiu.wang@nxp.com>
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

With pause and resume test for ARC, there is occasionally
channel swap issue. The reason is that currently driver set
the DPATH out of reset first, then start the DMA, the first
data got from FIFO may not be the Left channel.

Moving DPATH out of reset operation after the dma enablement
to fix this issue.

Fixes: 28564486866f ("ASoC: fsl_xcvr: Add XCVR ASoC CPU DAI driver")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_xcvr.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index 31c5ee641fe7..6e67033b6cde 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -487,8 +487,9 @@ static int fsl_xcvr_prepare(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
-	/* clear DPATH RESET */
+	/* set DPATH RESET */
 	m_ctl |= FSL_XCVR_EXT_CTRL_DPTH_RESET(tx);
+	v_ctl |= FSL_XCVR_EXT_CTRL_DPTH_RESET(tx);
 	ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL, m_ctl, v_ctl);
 	if (ret < 0) {
 		dev_err(dai->dev, "Error while setting EXT_CTRL: %d\n", ret);
@@ -590,10 +591,6 @@ static void fsl_xcvr_shutdown(struct snd_pcm_substream *substream,
 		val  |= FSL_XCVR_EXT_CTRL_CMDC_RESET(tx);
 	}
 
-	/* set DPATH RESET */
-	mask |= FSL_XCVR_EXT_CTRL_DPTH_RESET(tx);
-	val  |= FSL_XCVR_EXT_CTRL_DPTH_RESET(tx);
-
 	ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL, mask, val);
 	if (ret < 0) {
 		dev_err(dai->dev, "Err setting DPATH RESET: %d\n", ret);
@@ -643,6 +640,16 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 			dev_err(dai->dev, "Failed to enable DMA: %d\n", ret);
 			return ret;
 		}
+
+		/* clear DPATH RESET */
+		ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL,
+					 FSL_XCVR_EXT_CTRL_DPTH_RESET(tx),
+					 0);
+		if (ret < 0) {
+			dev_err(dai->dev, "Failed to clear DPATH RESET: %d\n", ret);
+			return ret;
+		}
+
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
-- 
2.17.1

