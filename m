Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4042448757
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2019 17:33:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAE7B1774;
	Mon, 17 Jun 2019 17:32:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAE7B1774
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560785616;
	bh=e/TkWrRHfpYX2d1INM0+W6D/57tGg7WZkAg35hNLwzM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=MI1vLvu4Nj0yhJgdI0BLCs0SJyiW3m3iVW3spwGXOXJKEyVV4PLWEihGW3faIPXF0
	 g/V1etC9glvuPJMC14qMfJ9heagr9L+sjx0RM+NF/giNzn30us15kqD7PD++6UZQ/v
	 jM8zRpr5MBnTuJOHznJ1EbaqmMa1toLPpb5P2JZY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F9E5F8976C;
	Mon, 17 Jun 2019 17:24:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28F9CF89742; Mon, 17 Jun 2019 17:24:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4182F89737
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 17:24:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4182F89737
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="iwfZZm/O"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=oDbuoJ+k8bH6tTakATeu5IXZQS1uNUvT2jYKp1rZgqg=; b=iwfZZm/Ox1Pr
 1uj6qQigf1k0Nf6gXQjw0FrLXARa2kEAI38D5SmRqyoO3Zp1uSI8fcv9KZFk9TLhZLQwhJspjQFqB
 2J2W/Rx4vbk7GcM0mT0NZ5rm9LWQXWtiDSJ4qMnrdC5+OKmISmyFfc7Abv2vredeF5uE1bsQ5abZA
 GpJTE=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hctUd-0001yA-EF; Mon, 17 Jun 2019 15:24:23 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 03DFD440046; Mon, 17 Jun 2019 16:24:22 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20190612172347.22338-9-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190617152423.03DFD440046@finisterre.sirena.org.uk>
Date: Mon, 17 Jun 2019 16:24:22 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: hda: modify stream
	interrupt handler" to the asoc tree
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

The patch

   ASoC: SOF: Intel: hda: modify stream interrupt handler

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 6297a0dc4c14a62bea5a9137ceef280cb7a80665 Mon Sep 17 00:00:00 2001
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Date: Wed, 12 Jun 2019 12:23:40 -0500
Subject: [PATCH] ASoC: SOF: Intel: hda: modify stream interrupt handler

Modify the stream interrupt handler to always wake up the
IRQ thread if the status register is valid. The IRQ thread
performs the check for stream interrupts and RIRB interrupts
in a loop to handle the case of missed interrupts when an
unsolicited response from the codec is received just before the
stream interrupt handler is completed.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-stream.c | 79 +++++++++++++++++++++-----------
 1 file changed, 51 insertions(+), 28 deletions(-)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index ff6ab0c45d8e..d44318040948 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -461,57 +461,40 @@ int hda_dsp_stream_hw_free(struct snd_sof_dev *sdev,
 irqreturn_t hda_dsp_stream_interrupt(int irq, void *context)
 {
 	struct hdac_bus *bus = context;
-	struct sof_intel_hda_dev *sof_hda = bus_to_sof_hda(bus);
-	u32 stream_mask;
+	int ret = IRQ_WAKE_THREAD;
 	u32 status;
 
-	if (!pm_runtime_active(bus->dev))
-		return IRQ_NONE;
-
 	spin_lock(&bus->reg_lock);
 
 	status = snd_hdac_chip_readl(bus, INTSTS);
-	stream_mask = GENMASK(sof_hda->stream_max - 1, 0) | AZX_INT_CTRL_EN;
-
-	/* Not stream interrupt or register inaccessible, ignore it.*/
-	if (!(status & stream_mask) || status == 0xffffffff) {
-		spin_unlock(&bus->reg_lock);
-		return IRQ_NONE;
-	}
+	dev_vdbg(bus->dev, "stream irq, INTSTS status: 0x%x\n", status);
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
-	/* clear rirb int */
-	status = snd_hdac_chip_readb(bus, RIRBSTS);
-	if (status & RIRB_INT_MASK) {
-		if (status & RIRB_INT_RESPONSE)
-			snd_hdac_bus_update_rirb(bus);
-		snd_hdac_chip_writeb(bus, RIRBSTS, RIRB_INT_MASK);
-	}
-#endif
+	/* Register inaccessible, ignore it.*/
+	if (status == 0xffffffff)
+		ret = IRQ_NONE;
 
 	spin_unlock(&bus->reg_lock);
 
-	return snd_hdac_chip_readl(bus, INTSTS) ? IRQ_WAKE_THREAD : IRQ_HANDLED;
+	return ret;
 }
 
-irqreturn_t hda_dsp_stream_threaded_handler(int irq, void *context)
+static bool hda_dsp_stream_check(struct hdac_bus *bus, u32 status)
 {
-	struct hdac_bus *bus = context;
 	struct sof_intel_hda_dev *sof_hda = bus_to_sof_hda(bus);
-	u32 status = snd_hdac_chip_readl(bus, INTSTS);
 	struct hdac_stream *s;
+	bool active = false;
 	u32 sd_status;
 
-	/* check streams */
 	list_for_each_entry(s, &bus->stream_list, list) {
-		if (status & (1 << s->index) && s->opened) {
+		if (status & BIT(s->index) && s->opened) {
 			sd_status = snd_hdac_stream_readb(s, SD_STS);
 
 			dev_vdbg(bus->dev, "stream %d status 0x%x\n",
 				 s->index, sd_status);
 
-			snd_hdac_stream_writeb(s, SD_STS, SD_INT_MASK);
+			snd_hdac_stream_writeb(s, SD_STS, sd_status);
 
+			active = true;
 			if (!s->substream ||
 			    !s->running ||
 			    (sd_status & SOF_HDA_CL_DMA_SD_INT_COMPLETE) == 0)
@@ -520,8 +503,48 @@ irqreturn_t hda_dsp_stream_threaded_handler(int irq, void *context)
 			/* Inform ALSA only in case not do that with IPC */
 			if (sof_hda->no_ipc_position)
 				snd_sof_pcm_period_elapsed(s->substream);
+		}
+	}
+
+	return active;
+}
 
+irqreturn_t hda_dsp_stream_threaded_handler(int irq, void *context)
+{
+	struct hdac_bus *bus = context;
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+	u32 rirb_status;
+#endif
+	bool active;
+	u32 status;
+	int i;
+
+	/*
+	 * Loop 10 times to handle missed interrupts caused by
+	 * unsolicited responses from the codec
+	 */
+	for (i = 0, active = true; i < 10 && active; i++) {
+		spin_lock_irq(&bus->reg_lock);
+
+		status = snd_hdac_chip_readl(bus, INTSTS);
+
+		/* check streams */
+		active = hda_dsp_stream_check(bus, status);
+
+		/* check and clear RIRB interrupt */
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+		if (status & AZX_INT_CTRL_EN) {
+			rirb_status = snd_hdac_chip_readb(bus, RIRBSTS);
+			if (rirb_status & RIRB_INT_MASK) {
+				active = true;
+				if (rirb_status & RIRB_INT_RESPONSE)
+					snd_hdac_bus_update_rirb(bus);
+				snd_hdac_chip_writeb(bus, RIRBSTS,
+						     RIRB_INT_MASK);
+			}
 		}
+#endif
+		spin_unlock_irq(&bus->reg_lock);
 	}
 
 	return IRQ_HANDLED;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
