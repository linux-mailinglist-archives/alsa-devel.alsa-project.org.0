Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC0B1B6B53
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Apr 2020 04:27:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE85216A3;
	Fri, 24 Apr 2020 04:26:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE85216A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587695249;
	bh=7wGcHZqlrjR+8v47qDRYyrUuUt6nwW/Hq5Xb5e3ui4k=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=a5FLxvn8HjzU5sAxA/Tn5+wiUlBJWPPZldG2q6apqBXHm046J1ohnsag7RCgfGaTj
	 edbFNyNuRBpMx33GMoMRoZY4fHsK0/qoBuWfYnyD2T8EC6Ly5mQjcY6eNOOAUJRbVV
	 kuMzHw+9aaft3Y7vKtXs4JwBvtpbCwunNN+igovU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB4A2F8023F;
	Fri, 24 Apr 2020 04:25:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34FE2F80142; Fri, 24 Apr 2020 04:24:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01168F80117
 for <alsa-devel@alsa-project.org>; Fri, 24 Apr 2020 04:24:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01168F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me
 header.b="oaaHAl7u"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
 s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7T3RrT5eHz14gHXe03VDtm6JxlcnrWMsJMG+vXORN+E=; b=oaaHAl7uiAPjzIp8tjfcFATMTE
 lShEkmUL4jb3DCPncfH6jd9RZKim/rnzio7sd4bkTfzWvuZ3bt7R0AN80NIU8uqtK2jgFWEeZ+164
 U6s685feTvpcSgR9WXDfblziwUv/JRN7SNF5GBNK/2dizUFi5Cj5AcnFyzptx3nSw7G8=;
Received: from [2a00:1370:8125:3f98:890:f100:d37d:7ada] (helo=home.puleglot.ru)
 by puleglot.ru with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <puleglot@puleglot.ru>)
 id 1jRo1K-0001hb-Qo; Fri, 24 Apr 2020 05:24:50 +0300
From: Alexander Tsoy <alexander@tsoy.me>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ALSA: usb-audio: Improve frames size computation
Date: Fri, 24 Apr 2020 05:24:48 +0300
Message-Id: <20200424022449.14972-1-alexander@tsoy.me>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Gregor Pintar <grpintar@gmail.com>,
 Roope Salmi <rpsalmi@gmail.com>
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
---
 sound/usb/card.h     |  4 ++++
 sound/usb/endpoint.c | 43 ++++++++++++++++++++++++++++++++++++++-----
 sound/usb/endpoint.h |  1 +
 sound/usb/pcm.c      |  2 ++
 4 files changed, 45 insertions(+), 5 deletions(-)

diff --git a/sound/usb/card.h b/sound/usb/card.h
index 395403a2d33f..820e564656ed 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -84,6 +84,10 @@ struct snd_usb_endpoint {
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
index 4a9a2f6ef5a4..d8dc7cb56d43 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -124,12 +124,12 @@ int snd_usb_endpoint_implicit_feedback_sink(struct snd_usb_endpoint *ep)
 
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
@@ -146,6 +146,29 @@ int snd_usb_endpoint_next_packet_size(struct snd_usb_endpoint *ep)
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
@@ -190,6 +213,8 @@ static void prepare_silent_urb(struct snd_usb_endpoint *ep,
 
 		if (ctx->packet_size[i])
 			counts = ctx->packet_size[i];
+		else if (ep->sync_master)
+			counts = snd_usb_endpoint_slave_next_packet_size(ep);
 		else
 			counts = snd_usb_endpoint_next_packet_size(ep);
 
@@ -874,10 +899,17 @@ int snd_usb_endpoint_set_params(struct snd_usb_endpoint *ep,
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
@@ -936,6 +968,7 @@ int snd_usb_endpoint_start(struct snd_usb_endpoint *ep)
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
index a4e4064f9aee..b50965ab3b3a 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -1579,6 +1579,8 @@ static void prepare_playback_urb(struct snd_usb_substream *subs,
 	for (i = 0; i < ctx->packets; i++) {
 		if (ctx->packet_size[i])
 			counts = ctx->packet_size[i];
+		else if (ep->sync_master)
+			counts = snd_usb_endpoint_slave_next_packet_size(ep);
 		else
 			counts = snd_usb_endpoint_next_packet_size(ep);
 
-- 
2.26.2

