Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E25501FE1F8
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 03:58:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8824B1735;
	Thu, 18 Jun 2020 03:57:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8824B1735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592445506;
	bh=kDfgXbkLOcQsgKi7kCnSID1zbif1f+ACplg1zsdz6pI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cGetAoWf0dKaS75gLs1Z7PlQug8Oduyc+OXRmC71FfmIPE8c6kKk4jmRibsKjdfkL
	 ANM/FSCQOowDyhr6PVqN5UHZyjwmYWVMipaf2FfqlM36SyTb/PX968HTdPPcyOTDKk
	 dSvj+NwZ6LiR8kbkfZKzcR2Y2N9IKYjLnJYupDtA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4518F802C4;
	Thu, 18 Jun 2020 03:27:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FD83F802F9; Thu, 18 Jun 2020 03:27:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7561F802C4
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 03:26:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7561F802C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="q4oDuDMw"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8373821D7F;
 Thu, 18 Jun 2020 01:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592443614;
 bh=kDfgXbkLOcQsgKi7kCnSID1zbif1f+ACplg1zsdz6pI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q4oDuDMwwfr/sR37Vd+yTy2nH8w8folLx+zGT2wJFiUtSVKgmzdRcmNVxJROV1I24
 0wYti3HhPDzSmysdcSWsvHZvz1SQK+93fzaphO/+Nm3JhurYxicqDrUkIhAVANiidT
 o6cJc/NQEqR+UQVx5obSvr8wLSYTcLMVgDLHvGiE=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 041/108] ALSA: usb-audio: Improve frames size
 computation
Date: Wed, 17 Jun 2020 21:24:53 -0400
Message-Id: <20200618012600.608744-41-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618012600.608744-1-sashal@kernel.org>
References: <20200618012600.608744-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 Alexander Tsoy <alexander@tsoy.me>, alsa-devel@alsa-project.org
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

From: Alexander Tsoy <alexander@tsoy.me>

[ Upstream commit f0bd62b64016508938df9babe47f65c2c727d25c ]

For computation of the the next frame size current value of fs/fps and
accumulated fractional parts of fs/fps are used, where values are stored
in Q16.16 format. This is quite natural for computing frame size for
asynchronous endpoints driven by explicit feedback, since in this case
fs/fps is a value provided by the feedback endpoint and it's already in
the Q format. If an error is accumulated over time, the device can
adjust fs/fps value to prevent buffer overruns/underruns.

But for synchronous endpoints the accuracy provided by these computations
is not enough. Due to accumulated error the driver periodically produces
frames with incorrect size (+/- 1 audio sample).

This patch fixes this issue by implementing a different algorithm for
frame size computation. It is based on accumulating of the remainders
from division fs/fps and it doesn't accumulate errors over time. This
new method is enabled for synchronous and adaptive playback endpoints.

Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
Link: https://lore.kernel.org/r/20200424022449.14972-1-alexander@tsoy.me
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/usb/card.h     |  4 ++++
 sound/usb/endpoint.c | 43 ++++++++++++++++++++++++++++++++++++++-----
 sound/usb/endpoint.h |  1 +
 sound/usb/pcm.c      |  2 ++
 4 files changed, 45 insertions(+), 5 deletions(-)

diff --git a/sound/usb/card.h b/sound/usb/card.h
index ed87cc83eb47..9dbcbb27c28e 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -81,6 +81,10 @@ struct snd_usb_endpoint {
 	dma_addr_t sync_dma;		/* DMA address of syncbuf */
 
 	unsigned int pipe;		/* the data i/o pipe */
+	unsigned int framesize[2];	/* small/large frame sizes in samples */
+	unsigned int sample_rem;	/* remainder from division fs/fps */
+	unsigned int sample_accum;	/* sample accumulator */
+	unsigned int fps;		/* frames per second */
 	unsigned int freqn;		/* nominal sampling rate in fs/fps in Q16.16 format */
 	unsigned int freqm;		/* momentary sampling rate in fs/fps in Q16.16 format */
 	int	   freqshift;		/* how much to shift the feedback value to get Q16.16 */
diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 8caf0b57f9c6..841219560872 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -137,12 +137,12 @@ int snd_usb_endpoint_implicit_feedback_sink(struct snd_usb_endpoint *ep)
 
 /*
  * For streaming based on information derived from sync endpoints,
- * prepare_outbound_urb_sizes() will call next_packet_size() to
+ * prepare_outbound_urb_sizes() will call slave_next_packet_size() to
  * determine the number of samples to be sent in the next packet.
  *
- * For implicit feedback, next_packet_size() is unused.
+ * For implicit feedback, slave_next_packet_size() is unused.
  */
-int snd_usb_endpoint_next_packet_size(struct snd_usb_endpoint *ep)
+int snd_usb_endpoint_slave_next_packet_size(struct snd_usb_endpoint *ep)
 {
 	unsigned long flags;
 	int ret;
@@ -159,6 +159,29 @@ int snd_usb_endpoint_next_packet_size(struct snd_usb_endpoint *ep)
 	return ret;
 }
 
+/*
+ * For adaptive and synchronous endpoints, prepare_outbound_urb_sizes()
+ * will call next_packet_size() to determine the number of samples to be
+ * sent in the next packet.
+ */
+int snd_usb_endpoint_next_packet_size(struct snd_usb_endpoint *ep)
+{
+	int ret;
+
+	if (ep->fill_max)
+		return ep->maxframesize;
+
+	ep->sample_accum += ep->sample_rem;
+	if (ep->sample_accum >= ep->fps) {
+		ep->sample_accum -= ep->fps;
+		ret = ep->framesize[1];
+	} else {
+		ret = ep->framesize[0];
+	}
+
+	return ret;
+}
+
 static void retire_outbound_urb(struct snd_usb_endpoint *ep,
 				struct snd_urb_ctx *urb_ctx)
 {
@@ -203,6 +226,8 @@ static void prepare_silent_urb(struct snd_usb_endpoint *ep,
 
 		if (ctx->packet_size[i])
 			counts = ctx->packet_size[i];
+		else if (ep->sync_master)
+			counts = snd_usb_endpoint_slave_next_packet_size(ep);
 		else
 			counts = snd_usb_endpoint_next_packet_size(ep);
 
@@ -889,10 +914,17 @@ int snd_usb_endpoint_set_params(struct snd_usb_endpoint *ep,
 	ep->maxpacksize = fmt->maxpacksize;
 	ep->fill_max = !!(fmt->attributes & UAC_EP_CS_ATTR_FILL_MAX);
 
-	if (snd_usb_get_speed(ep->chip->dev) == USB_SPEED_FULL)
+	if (snd_usb_get_speed(ep->chip->dev) == USB_SPEED_FULL) {
 		ep->freqn = get_usb_full_speed_rate(rate);
-	else
+		ep->fps = 1000;
+	} else {
 		ep->freqn = get_usb_high_speed_rate(rate);
+		ep->fps = 8000;
+	}
+
+	ep->sample_rem = rate % ep->fps;
+	ep->framesize[0] = rate / ep->fps;
+	ep->framesize[1] = (rate + (ep->fps - 1)) / ep->fps;
 
 	/* calculate the frequency in 16.16 format */
 	ep->freqm = ep->freqn;
@@ -951,6 +983,7 @@ int snd_usb_endpoint_start(struct snd_usb_endpoint *ep)
 	ep->active_mask = 0;
 	ep->unlink_mask = 0;
 	ep->phase = 0;
+	ep->sample_accum = 0;
 
 	snd_usb_endpoint_start_quirk(ep);
 
diff --git a/sound/usb/endpoint.h b/sound/usb/endpoint.h
index 63a39d4fa8d8..d23fa0a8c11b 100644
--- a/sound/usb/endpoint.h
+++ b/sound/usb/endpoint.h
@@ -28,6 +28,7 @@ void snd_usb_endpoint_release(struct snd_usb_endpoint *ep);
 void snd_usb_endpoint_free(struct snd_usb_endpoint *ep);
 
 int snd_usb_endpoint_implicit_feedback_sink(struct snd_usb_endpoint *ep);
+int snd_usb_endpoint_slave_next_packet_size(struct snd_usb_endpoint *ep);
 int snd_usb_endpoint_next_packet_size(struct snd_usb_endpoint *ep);
 
 void snd_usb_handle_sync_urb(struct snd_usb_endpoint *ep,
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index ff38fca1781b..fd73186d6003 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -1484,6 +1484,8 @@ static void prepare_playback_urb(struct snd_usb_substream *subs,
 	for (i = 0; i < ctx->packets; i++) {
 		if (ctx->packet_size[i])
 			counts = ctx->packet_size[i];
+		else if (ep->sync_master)
+			counts = snd_usb_endpoint_slave_next_packet_size(ep);
 		else
 			counts = snd_usb_endpoint_next_packet_size(ep);
 
-- 
2.25.1

