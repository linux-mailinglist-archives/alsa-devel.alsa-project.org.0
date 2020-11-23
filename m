Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 101772C01EC
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 10:05:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A656616EE;
	Mon, 23 Nov 2020 10:05:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A656616EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606122358;
	bh=ow11qwAEDOvF+My8FsPAkgX2Uc4U9EBQiqLgHiKrygU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SjxvFeoIG8pxj70hjcZlrkyUeE6wKx1HtJ9x1KQdBA6W/49WsBTGPC/awwHGGUWJa
	 au2i8wR4s+bfqgwF0KT4ZoqKp3cvChTJk2NjGaJXZyVS93so1Liz7UCNhRIxnGloy7
	 1mLfYXDckn3IcXiud4meseR3GLVg6qClzaewcWco=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E00AEF805D5;
	Mon, 23 Nov 2020 09:55:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B144F8053A; Mon, 23 Nov 2020 09:54:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E9D3F804E5
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 09:54:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E9D3F804E5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A6D06AFD8;
 Mon, 23 Nov 2020 08:53:58 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 31/41] ALSA: usb-audio: Unify the code for the next packet
 size calculation
Date: Mon, 23 Nov 2020 09:53:37 +0100
Message-Id: <20201123085347.19667-32-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20201123085347.19667-1-tiwai@suse.de>
References: <20201123085347.19667-1-tiwai@suse.de>
Cc: Matwey Kornilov <matwey.kornilov@gmail.com>,
 Dylan Robinson <dylan_robinson@motu.com>,
 Keith Milner <kamilner@superlative.org>
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

There are two places calculating the next packet size for the playback
stream in the exactly same way.  Provide the single helper for this
purpose and use it from both places gracefully.

Tested-by: Keith Milner <kamilner@superlative.org>
Tested-by: Dylan Robinson <dylan_robinson@motu.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/endpoint.c | 40 ++++++++++++++++++++++++----------------
 sound/usb/endpoint.h |  4 ++--
 sound/usb/pcm.c      |  8 +-------
 3 files changed, 27 insertions(+), 25 deletions(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 35c84c2264e1..5d618724bd75 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -121,13 +121,13 @@ int snd_usb_endpoint_implicit_feedback_sink(struct snd_usb_endpoint *ep)
 }
 
 /*
- * For streaming based on information derived from sync endpoints,
- * prepare_outbound_urb_sizes() will call slave_next_packet_size() to
- * determine the number of samples to be sent in the next packet.
+ * Return the number of samples to be sent in the next packet
+ * for streaming based on information derived from sync endpoints
  *
- * For implicit feedback, slave_next_packet_size() is unused.
+ * This won't be used for implicit feedback which takes the packet size
+ * returned from the sync source
  */
-int snd_usb_endpoint_slave_next_packet_size(struct snd_usb_endpoint *ep)
+static int slave_next_packet_size(struct snd_usb_endpoint *ep)
 {
 	unsigned long flags;
 	int ret;
@@ -145,11 +145,10 @@ int snd_usb_endpoint_slave_next_packet_size(struct snd_usb_endpoint *ep)
 }
 
 /*
- * For adaptive and synchronous endpoints, prepare_outbound_urb_sizes()
- * will call next_packet_size() to determine the number of samples to be
- * sent in the next packet.
+ * Return the number of samples to be sent in the next packet
+ * for adaptive and synchronous endpoints
  */
-int snd_usb_endpoint_next_packet_size(struct snd_usb_endpoint *ep)
+static int next_packet_size(struct snd_usb_endpoint *ep)
 {
 	int ret;
 
@@ -167,6 +166,21 @@ int snd_usb_endpoint_next_packet_size(struct snd_usb_endpoint *ep)
 	return ret;
 }
 
+/*
+ * snd_usb_endpoint_next_packet_size: Return the number of samples to be sent
+ * in the next packet
+ */
+int snd_usb_endpoint_next_packet_size(struct snd_usb_endpoint *ep,
+				      struct snd_urb_ctx *ctx, int idx)
+{
+	if (ctx->packet_size[idx])
+		return ctx->packet_size[idx];
+	else if (ep->sync_master)
+		return slave_next_packet_size(ep);
+	else
+		return next_packet_size(ep);
+}
+
 static void call_retire_callback(struct snd_usb_endpoint *ep,
 				 struct urb *urb)
 {
@@ -223,13 +237,7 @@ static void prepare_silent_urb(struct snd_usb_endpoint *ep,
 		unsigned int length;
 		int counts;
 
-		if (ctx->packet_size[i])
-			counts = ctx->packet_size[i];
-		else if (ep->sync_master)
-			counts = snd_usb_endpoint_slave_next_packet_size(ep);
-		else
-			counts = snd_usb_endpoint_next_packet_size(ep);
-
+		counts = snd_usb_endpoint_next_packet_size(ep, ctx, i);
 		length = counts * ep->stride; /* number of silent bytes */
 		offset = offs * ep->stride + extra * i;
 		urb->iso_frame_desc[i].offset = offset;
diff --git a/sound/usb/endpoint.h b/sound/usb/endpoint.h
index 201011d89659..11e3bb839fd7 100644
--- a/sound/usb/endpoint.h
+++ b/sound/usb/endpoint.h
@@ -45,7 +45,7 @@ void snd_usb_endpoint_release(struct snd_usb_endpoint *ep);
 void snd_usb_endpoint_free(struct snd_usb_endpoint *ep);
 
 int snd_usb_endpoint_implicit_feedback_sink(struct snd_usb_endpoint *ep);
-int snd_usb_endpoint_slave_next_packet_size(struct snd_usb_endpoint *ep);
-int snd_usb_endpoint_next_packet_size(struct snd_usb_endpoint *ep);
+int snd_usb_endpoint_next_packet_size(struct snd_usb_endpoint *ep,
+				      struct snd_urb_ctx *ctx, int idx);
 
 #endif /* __USBAUDIO_ENDPOINT_H */
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 95a6a854dc55..5953e22a72c5 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -1512,13 +1512,7 @@ static void prepare_playback_urb(struct snd_usb_substream *subs,
 	spin_lock_irqsave(&subs->lock, flags);
 	subs->frame_limit += ep->max_urb_frames;
 	for (i = 0; i < ctx->packets; i++) {
-		if (ctx->packet_size[i])
-			counts = ctx->packet_size[i];
-		else if (ep->sync_master)
-			counts = snd_usb_endpoint_slave_next_packet_size(ep);
-		else
-			counts = snd_usb_endpoint_next_packet_size(ep);
-
+		counts = snd_usb_endpoint_next_packet_size(ep, ctx, i);
 		/* set up descriptor */
 		urb->iso_frame_desc[i].offset = frames * ep->stride;
 		urb->iso_frame_desc[i].length = counts * ep->stride;
-- 
2.16.4

