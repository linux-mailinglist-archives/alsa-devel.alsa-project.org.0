Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 266C342D8A
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 19:31:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B26D517E8;
	Wed, 12 Jun 2019 19:30:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B26D517E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560360661;
	bh=52oka6OkXqh4uvBitfNz2IWCwxwa6YrXdUtM/wFq8CE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PWxvgGEt18Ip2c25GFuQtL1WHbKxM7NhxPUplGw63mk1CNmnoLtKduvpXJlQPjkBp
	 fl6wzd41MdTpZPekCMuJMBlLqTAQ0gTv0e71P8xo0uIIU7UqGmvVJTISvJh4Wh5NUo
	 gFROD5QhM3xgF/kWSjPbljoCBJ5OXc8cQScQNLyI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27E61F89757;
	Wed, 12 Jun 2019 19:24:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85279F89734; Wed, 12 Jun 2019 19:24:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73BCDF89730
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 19:24:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73BCDF89730
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jun 2019 10:23:56 -0700
X-ExtLoop1: 1
Received: from adorrell-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.133.122])
 by fmsmga008.fm.intel.com with ESMTP; 12 Jun 2019 10:23:56 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 12 Jun 2019 12:23:40 -0500
Message-Id: <20190612172347.22338-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612172347.22338-1-pierre-louis.bossart@linux.intel.com>
References: <20190612172347.22338-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 08/15] ASoC: SOF: Intel: hda: modify stream
	interrupt handler
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Modify the stream interrupt handler to always wake up the
IRQ thread if the status register is valid. The IRQ thread
performs the check for stream interrupts and RIRB interrupts
in a loop to handle the case of missed interrupts when an
unsolicited response from the codec is received just before the
stream interrupt handler is completed.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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
