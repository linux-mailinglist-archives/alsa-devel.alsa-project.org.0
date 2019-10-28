Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D5DE6ED0
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 10:16:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 971971F26;
	Mon, 28 Oct 2019 10:15:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 971971F26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572254188;
	bh=fSpeiWw+AmTxYtBqD9vSSdhFjqlF1O5yzhgdkdb5vbY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BP01OEXRbpbgga0i7pwSK5492sRLl74XdDnexQx6HwNOUN/baLY5YnJ7ao0nsgvL5
	 wSXQrc4t+bRR9UoPosKmWw73j+0XXHwlOCZoA645e4FYh3KMjIstePZ7wH2tQZlO5k
	 Y8Oh0eww3/daMVq5PwSNnNeu51m5wP1Z9aK+0/mw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CF94F80600;
	Mon, 28 Oct 2019 10:14:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 165B4F805FE; Mon, 28 Oct 2019 10:14:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22D15F805AE
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 10:14:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22D15F805AE
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B713B1A070C;
 Mon, 28 Oct 2019 10:14:24 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6A4CC1A0707;
 Mon, 28 Oct 2019 10:14:19 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id E7369402E2;
 Mon, 28 Oct 2019 17:14:12 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Date: Mon, 28 Oct 2019 17:11:05 +0800
Message-Id: <52e92c4221a83e39a84a6cd92fc3d5479b44894c.1572252321.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH V3] ASoC: fsl_esai: Add spin lock to protect
	reset, stop and start
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

xrun may happen at the end of stream, the
trigger->fsl_esai_trigger_stop maybe called in the middle of
fsl_esai_hw_reset, this may cause esai in wrong state
after stop, and there may be endless xrun interrupt.

This issue may also happen with trigger->fsl_esai_trigger_start.

So Add spin lock to lock those functions.

Fixes: 7ccafa2b3879 ("ASoC: fsl_esai: recover the channel swap after xrun")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
Change in v3
-refine comments

Change in v2
-add lock for fsl_esai_trigger_start.

 sound/soc/fsl/fsl_esai.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index 37b14c48b537..453392a9cd68 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -33,6 +33,7 @@
  * @fsysclk: system clock source to derive HCK, SCK and FS
  * @spbaclk: SPBA clock (optional, depending on SoC design)
  * @task: tasklet to handle the reset operation
+ * @lock: spin lock between hw_reset() and trigger()
  * @fifo_depth: depth of tx/rx FIFO
  * @slot_width: width of each DAI slot
  * @slots: number of slots
@@ -56,6 +57,7 @@ struct fsl_esai {
 	struct clk *fsysclk;
 	struct clk *spbaclk;
 	struct tasklet_struct task;
+	spinlock_t lock; /* Protect hw_reset and trigger */
 	u32 fifo_depth;
 	u32 slot_width;
 	u32 slots;
@@ -676,8 +678,10 @@ static void fsl_esai_hw_reset(unsigned long arg)
 {
 	struct fsl_esai *esai_priv = (struct fsl_esai *)arg;
 	bool tx = true, rx = false, enabled[2];
+	unsigned long lock_flags;
 	u32 tfcr, rfcr;
 
+	spin_lock_irqsave(&esai_priv->lock, lock_flags);
 	/* Save the registers */
 	regmap_read(esai_priv->regmap, REG_ESAI_TFCR, &tfcr);
 	regmap_read(esai_priv->regmap, REG_ESAI_RFCR, &rfcr);
@@ -715,6 +719,8 @@ static void fsl_esai_hw_reset(unsigned long arg)
 		fsl_esai_trigger_start(esai_priv, tx);
 	if (enabled[rx])
 		fsl_esai_trigger_start(esai_priv, rx);
+
+	spin_unlock_irqrestore(&esai_priv->lock, lock_flags);
 }
 
 static int fsl_esai_trigger(struct snd_pcm_substream *substream, int cmd,
@@ -722,6 +728,7 @@ static int fsl_esai_trigger(struct snd_pcm_substream *substream, int cmd,
 {
 	struct fsl_esai *esai_priv = snd_soc_dai_get_drvdata(dai);
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	unsigned long lock_flags;
 
 	esai_priv->channels[tx] = substream->runtime->channels;
 
@@ -729,12 +736,16 @@ static int fsl_esai_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		spin_lock_irqsave(&esai_priv->lock, lock_flags);
 		fsl_esai_trigger_start(esai_priv, tx);
+		spin_unlock_irqrestore(&esai_priv->lock, lock_flags);
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		spin_lock_irqsave(&esai_priv->lock, lock_flags);
 		fsl_esai_trigger_stop(esai_priv, tx);
+		spin_unlock_irqrestore(&esai_priv->lock, lock_flags);
 		break;
 	default:
 		return -EINVAL;
@@ -1002,6 +1013,7 @@ static int fsl_esai_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(&pdev->dev, esai_priv);
 
+	spin_lock_init(&esai_priv->lock);
 	ret = fsl_esai_hw_init(esai_priv);
 	if (ret)
 		return ret;
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
