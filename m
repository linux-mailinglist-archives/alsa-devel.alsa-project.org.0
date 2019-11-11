Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1574AF6F3C
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2019 08:54:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D38D1670;
	Mon, 11 Nov 2019 08:53:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D38D1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573458881;
	bh=tQtTjGZHVpr/O0JujMqe+gDTdLsTQfy137PuFxIjDkY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dWc5UklJjhh6nsRhwFCMsJAG1tfAVZv1776qjdXkKTQ3SnD61ha72vB7Pz110qDya
	 lJQgdkESNrdc3gatxPzW3nEiKtyw+r/Q5JTNRoazp5gBnKfvTAh6AcPwxpjHjmxvMK
	 jZhwe3QNfaIjvhwdO1nN1iUGyMw/ywV3wUea3eaY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21A17F80506;
	Mon, 11 Nov 2019 08:52:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D131F804FF; Mon, 11 Nov 2019 08:52:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC4DCF802E0
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 08:52:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC4DCF802E0
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 85E671A0B09;
 Mon, 11 Nov 2019 08:52:50 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9EC231A05F3;
 Mon, 11 Nov 2019 08:52:45 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 4ADC7402F1;
 Mon, 11 Nov 2019 15:52:39 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Mon, 11 Nov 2019 15:50:48 +0800
Message-Id: <1e706afe53fdd1fbbbc79277c48a98f8416ba873.1573458378.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [alsa-devel] [PATCH V2] ASoC: fsl_audmix: Add spin lock to protect
	tdms
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

Audmix support two substream, When two substream start
to run, the trigger function may be called by two substream
in same time, that the priv->tdms may be updated wrongly.

The expected priv->tdms is 0x3, but sometimes the
result is 0x2, or 0x1.

Fixes: be1df61cf06e ("ASoC: fsl: Add Audio Mixer CPU DAI driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
Change in v2
-add Fixes, Cc stable, and Acked-by.

 sound/soc/fsl/fsl_audmix.c | 6 ++++++
 sound/soc/fsl/fsl_audmix.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
index c7e4e9757dce..a1db1bce330f 100644
--- a/sound/soc/fsl/fsl_audmix.c
+++ b/sound/soc/fsl/fsl_audmix.c
@@ -286,6 +286,7 @@ static int fsl_audmix_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 				  struct snd_soc_dai *dai)
 {
 	struct fsl_audmix *priv = snd_soc_dai_get_drvdata(dai);
+	unsigned long lock_flags;
 
 	/* Capture stream shall not be handled */
 	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
@@ -295,12 +296,16 @@ static int fsl_audmix_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		spin_lock_irqsave(&priv->lock, lock_flags);
 		priv->tdms |= BIT(dai->driver->id);
+		spin_unlock_irqrestore(&priv->lock, lock_flags);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		spin_lock_irqsave(&priv->lock, lock_flags);
 		priv->tdms &= ~BIT(dai->driver->id);
+		spin_unlock_irqrestore(&priv->lock, lock_flags);
 		break;
 	default:
 		return -EINVAL;
@@ -491,6 +496,7 @@ static int fsl_audmix_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->ipg_clk);
 	}
 
+	spin_lock_init(&priv->lock);
 	platform_set_drvdata(pdev, priv);
 	pm_runtime_enable(dev);
 
diff --git a/sound/soc/fsl/fsl_audmix.h b/sound/soc/fsl/fsl_audmix.h
index 7812ffec45c5..479f05695d53 100644
--- a/sound/soc/fsl/fsl_audmix.h
+++ b/sound/soc/fsl/fsl_audmix.h
@@ -96,6 +96,7 @@ struct fsl_audmix {
 	struct platform_device *pdev;
 	struct regmap *regmap;
 	struct clk *ipg_clk;
+	spinlock_t lock; /* Protect tdms */
 	u8 tdms;
 };
 
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
