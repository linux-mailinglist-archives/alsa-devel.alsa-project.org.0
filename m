Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47748148E8E
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jan 2020 20:15:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2C8A168B;
	Fri, 24 Jan 2020 20:14:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2C8A168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579893328;
	bh=n/xW10M3UuUqm9WIpw1KJqb3r0GQ/y5e/VhgbIHImoM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rDX95hM+aCljDREOG/sQdMTtdZGlD5qGnrz6Ii2YrHzv2df20MHJkFS+3g/3vTZW3
	 RkvPepc4DnrIcQP8yNSkyr1RIpvW17WChYBojVLjKydspLfr+38AhsEBc90l8CYxzv
	 sd4fwJOQekipKQQfK0hFGf3kcG3od1CGaadDE6YY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47913F8028E;
	Fri, 24 Jan 2020 20:12:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 976D0F8028B; Fri, 24 Jan 2020 20:12:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCAE1F80217
 for <alsa-devel@alsa-project.org>; Fri, 24 Jan 2020 20:12:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCAE1F80217
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jan 2020 11:04:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,358,1574150400"; d="scan'208";a="260337143"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga002.fm.intel.com with ESMTP; 24 Jan 2020 11:04:25 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 24 Jan 2020 20:04:04 +0100
Message-Id: <20200124190413.18154-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200124190413.18154-1-cezary.rojewski@intel.com>
References: <20200124190413.18154-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Divya Prakash <divya1.prakash@intel.com>, lgirdwood@gmail.com, tiwai@suse.com,
 broonie@kernel.org
Subject: [alsa-devel] [PATCH 03/12] ALSA: hda: Interrupt servicing and BDL
	setup for compress streams
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

Account for compress streams when receiving and servicing buffer
completed interrupts. In case of compress stream enlisting hdac_stream
for data transfer, setup BDL entries much like it is the case for PCM
streams.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Divya Prakash <divya1.prakash@intel.com>
---
 sound/hda/hdac_controller.c |  4 ++--
 sound/hda/hdac_stream.c     | 26 ++++++++++++++++++++------
 2 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/sound/hda/hdac_controller.c b/sound/hda/hdac_controller.c
index bc4a8b606020..6a9a391ca60d 100644
--- a/sound/hda/hdac_controller.c
+++ b/sound/hda/hdac_controller.c
@@ -578,8 +578,8 @@ int snd_hdac_bus_handle_stream_irq(struct hdac_bus *bus, unsigned int status,
 			sd_status = snd_hdac_stream_readb(azx_dev, SD_STS);
 			snd_hdac_stream_writeb(azx_dev, SD_STS, SD_INT_MASK);
 			handled |= 1 << azx_dev->index;
-			if (!azx_dev->substream || !azx_dev->running ||
-			    !(sd_status & SD_INT_COMPLETE))
+			if ((!azx_dev->substream && !azx_dev->cstream) ||
+			    !azx_dev->running || !(sd_status & SD_INT_COMPLETE))
 				continue;
 			if (ack)
 				ack(bus, azx_dev);
diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
index bfedba3f6cd9..8a9a58d44e6e 100644
--- a/sound/hda/hdac_stream.c
+++ b/sound/hda/hdac_stream.c
@@ -7,6 +7,7 @@
 #include <linux/delay.h>
 #include <linux/export.h>
 #include <linux/clocksource.h>
+#include <sound/compress_driver.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/hdaudio.h>
@@ -408,14 +409,20 @@ int snd_hdac_stream_setup_periods(struct hdac_stream *azx_dev)
 {
 	struct hdac_bus *bus = azx_dev->bus;
 	struct snd_pcm_substream *substream = azx_dev->substream;
+	struct snd_compr_stream *cstream = azx_dev->cstream;
 	struct snd_pcm_runtime *runtime;
 	struct snd_dma_buffer *dmab;
 	__le32 *bdl;
 	int i, ofs, periods, period_bytes;
 	int pos_adj, pos_align;
 
-	runtime = substream->runtime;
-	dmab = snd_pcm_get_dma_buf(substream);
+	if (substream) {
+		runtime = substream->runtime;
+		dmab = snd_pcm_get_dma_buf(substream);
+	} else {
+		runtime = NULL;
+		dmab = snd_pcm_get_dma_buf(cstream);
+	}
 
 	/* reset BDL address */
 	snd_hdac_stream_writel(azx_dev, SD_BDLPL, 0);
@@ -484,15 +491,22 @@ int snd_hdac_stream_set_params(struct hdac_stream *azx_dev,
 				 unsigned int format_val)
 {
 	struct snd_pcm_substream *substream = azx_dev->substream;
+	struct snd_compr_stream *cstream = azx_dev->cstream;
 	unsigned int bufsize, period_bytes;
 	unsigned int no_period_wakeup;
 	int err;
 
-	if (!substream)
+	if (substream) {
+		bufsize = snd_pcm_lib_buffer_bytes(substream);
+		period_bytes = snd_pcm_lib_period_bytes(substream);
+		no_period_wakeup = substream->runtime->no_period_wakeup;
+	} else if (cstream) {
+		bufsize = cstream->runtime->buffer_size;
+		period_bytes = cstream->runtime->fragment_size;
+		no_period_wakeup = 0;
+	} else {
 		return -EINVAL;
-	bufsize = snd_pcm_lib_buffer_bytes(substream);
-	period_bytes = snd_pcm_lib_period_bytes(substream);
-	no_period_wakeup = substream->runtime->no_period_wakeup;
+	}
 
 	if (bufsize != azx_dev->bufsize ||
 	    period_bytes != azx_dev->period_bytes ||
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
