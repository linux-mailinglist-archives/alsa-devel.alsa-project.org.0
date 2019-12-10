Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51717118CF0
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 16:48:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDE3816AC;
	Tue, 10 Dec 2019 16:47:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDE3816AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575992895;
	bh=77HYHYGrJYA56xkH7eWBZW7IyX7/Zc8L32zxHHACpiY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VnjLFFNuyT2Kfx/NHiK2aFenpsm7NjUc5tQ+0nTYbR9BlEWBi6qe+xDD51otvrnVU
	 qamP4qdbI5As+Wbbr4WWXXt9NP6YSVjPGqmMBYsjx43Z2q9J8vvhINmqPSKClZvcZL
	 6uWhEy8xzYCkAtPcIugSmeLKu+vlFLrcbjohmvOs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 465A5F8024A;
	Tue, 10 Dec 2019 16:45:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6A58F80217; Tue, 10 Dec 2019 16:45:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3996AF801D8
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 16:45:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3996AF801D8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 10554B175;
 Tue, 10 Dec 2019 15:45:41 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: dri-devel@lists.freedesktop.org
Date: Tue, 10 Dec 2019 16:45:35 +0100
Message-Id: <20191210154536.29819-2-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210154536.29819-1-tiwai@suse.de>
References: <20191210154536.29819-1-tiwai@suse.de>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, alsa-devel@alsa-project.org,
 Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 Russell King <linux@armlinux.org.uk>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [alsa-devel] [PATCH for-5.6 1/2] drm/bridge: dw-hdmi: Follow the
	standard ALSA memalloc way
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

The driver manages actually two different buffers: the internal buffer
that is pre-allocated at the probe time and the vmalloc buffer for PCM
streams allocated at each stream open time.  The problem of the
current code is that the PCM core rather expects other way round,
i.e. the the vmalloc buffer is declared as preallocator (although not
actually pre-allocating pages at the probe time).  Then the whole rest
buffer allocation and release can be managed inside PCM core and we
can drop the allocation/free call in the driver.

For achieving that, this patch changes the buffer management in the
following way:
- The intermediate buffer is allocated manually instead of
  snd_pcm_lib_preallocate*() helper, kept in the own record, released
  in the card private_free call
- The size of internal buffer is specified by the new module option,
  buffer_size
- The normal stream buffer is set up via the new
  snd_pcm_set_managed_buffer*() helper
- The hw_params and hw_free callbacks are removed as they become
  superfluous with the new API

Also the hw_constraint call is corrected to point to the right unit
(bytes) instead of the frame size.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 .../gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c    | 48 ++++++++++++----------
 1 file changed, 26 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
index 2b7539701b42..ab8d16b3b78d 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
@@ -7,6 +7,7 @@
 #include <linux/io.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
+#include <linux/moduleparam.h>
 #include <linux/platform_device.h>
 #include <drm/bridge/dw_hdmi.h>
 #include <drm/drm_edid.h>
@@ -22,6 +23,10 @@
 
 #define DRIVER_NAME "dw-hdmi-ahb-audio"
 
+static unsigned int hw_buffer_size = 128 * 1024;
+module_param_named(buffer_size, hw_buffer_size, uint, 0444);
+MODULE_PARM_DESC(buffer_size, "Hardware buffer size to preallocate");
+
 /* Provide some bits rather than bit offsets */
 enum {
 	HDMI_AHB_DMA_CONF0_SW_FIFO_RST = BIT(7),
@@ -119,6 +124,7 @@ struct snd_dw_hdmi {
 	spinlock_t lock;
 	struct dw_hdmi_audio_data data;
 	struct snd_pcm_substream *substream;
+	struct snd_dma_buffer hw_buffer;
 	void (*reformat)(struct snd_dw_hdmi *, size_t, size_t);
 	void *buf_src;
 	void *buf_dst;
@@ -339,8 +345,8 @@ static int dw_hdmi_open(struct snd_pcm_substream *substream)
 
 	/* Limit the buffer size to the size of the preallocated buffer */
 	ret = snd_pcm_hw_constraint_minmax(runtime,
-					   SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
-					   0, substream->dma_buffer.bytes);
+					   SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
+					   0, dw->hw_buffer.bytes);
 	if (ret < 0)
 		return ret;
 
@@ -382,19 +388,6 @@ static int dw_hdmi_close(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int dw_hdmi_hw_free(struct snd_pcm_substream *substream)
-{
-	return snd_pcm_lib_free_vmalloc_buffer(substream);
-}
-
-static int dw_hdmi_hw_params(struct snd_pcm_substream *substream,
-	struct snd_pcm_hw_params *params)
-{
-	/* Allocate the PCM runtime buffer, which is exposed to userspace. */
-	return snd_pcm_lib_alloc_vmalloc_buffer(substream,
-						params_buffer_bytes(params));
-}
-
 static int dw_hdmi_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
@@ -449,8 +442,8 @@ static int dw_hdmi_prepare(struct snd_pcm_substream *substream)
 	dw->iec_offset = 0;
 	dw->channels = runtime->channels;
 	dw->buf_src  = runtime->dma_area;
-	dw->buf_dst  = substream->dma_buffer.area;
-	dw->buf_addr = substream->dma_buffer.addr;
+	dw->buf_dst  = dw->hw_buffer.area;
+	dw->buf_addr = dw->hw_buffer.addr;
 	dw->buf_period = snd_pcm_lib_period_bytes(substream);
 	dw->buf_size = snd_pcm_lib_buffer_bytes(substream);
 
@@ -506,14 +499,19 @@ static const struct snd_pcm_ops snd_dw_hdmi_ops = {
 	.open = dw_hdmi_open,
 	.close = dw_hdmi_close,
 	.ioctl = snd_pcm_lib_ioctl,
-	.hw_params = dw_hdmi_hw_params,
-	.hw_free = dw_hdmi_hw_free,
 	.prepare = dw_hdmi_prepare,
 	.trigger = dw_hdmi_trigger,
 	.pointer = dw_hdmi_pointer,
-	.page = snd_pcm_lib_get_vmalloc_page,
 };
 
+static void snd_dw_hdmi_free(struct snd_card *card)
+{
+	struct snd_dw_hdmi *dw = card->private_data;
+
+	if (dw->hw_buffer.bytes)
+		snd_dma_free_pages(&dw->hw_buffer);
+}
+
 static int snd_dw_hdmi_probe(struct platform_device *pdev)
 {
 	const struct dw_hdmi_audio_data *data = pdev->dev.platform_data;
@@ -548,6 +546,7 @@ static int snd_dw_hdmi_probe(struct platform_device *pdev)
 	dw->card = card;
 	dw->data = *data;
 	dw->revision = revision;
+	card->private_free = snd_dw_hdmi_free;
 
 	spin_lock_init(&dw->lock);
 
@@ -559,13 +558,18 @@ static int snd_dw_hdmi_probe(struct platform_device *pdev)
 	pcm->private_data = dw;
 	strlcpy(pcm->name, DRIVER_NAME, sizeof(pcm->name));
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &snd_dw_hdmi_ops);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_VMALLOC, dev, 0, 0);
 
 	/*
 	 * To support 8-channel 96kHz audio reliably, we need 512k
 	 * to satisfy alsa with our restricted period (ERR004323).
 	 */
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-			dev, 128 * 1024, 1024 * 1024);
+	if (hw_buffer_size > 1024 * 1024)
+		hw_buffer_size = 1024 * 1024;
+	ret  = snd_dma_alloc_pages_fallback(SNDRV_DMA_TYPE_DEV, dev,
+					    hw_buffer_size, &dw->hw_buffer);
+	if (ret < 0)
+		goto err;
 
 	ret = snd_card_register(card);
 	if (ret < 0)
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
