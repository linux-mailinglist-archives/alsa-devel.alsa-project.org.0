Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B282C01E9
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 10:04:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D753E16D2;
	Mon, 23 Nov 2020 10:04:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D753E16D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606122294;
	bh=SEyU/9rnwgTy+4MCciZNOZTc+ii7uPyjHz8uWWcCpK4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LmUmJgwcGkodyZJvy62Nn2NboQjC7GmOzr88uTu90QDDTRvBBUIVX4JqCULdYXtFB
	 crBbA8MqqFmW/p2TnF6Xpwryz2o6NOKONt7apXD8kEMYzrlVcZaZ2/tmGqmdWS4kvl
	 B7Q5svY7HiJClG4FhQbDqvXup66TQzGstsTdXZxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BBC5F805C0;
	Mon, 23 Nov 2020 09:55:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70126F804D8; Mon, 23 Nov 2020 09:54:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86CB9F804D8
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 09:54:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86CB9F804D8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 61B2AAFCD;
 Mon, 23 Nov 2020 08:53:58 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 26/41] ALSA: usb-audio: Fix possible stall of implicit fb
 packet ring-buffer
Date: Mon, 23 Nov 2020 09:53:32 +0100
Message-Id: <20201123085347.19667-27-tiwai@suse.de>
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

The implicit feedback mode uses a ring buffer for storing the received
packet sizes from the feedback source, and the code has a slight flaw;
when a playback stream stalls by some reason and the URBs aren't
processed, the next_packet FIFO might become empty, but the driver
can't distinguish whether it's empty or full because it's managed with
read_poss and write_pos.

This patch addresses those by changing the next_packet array
management.  Instead of keeping read and write positions, now the head
position and the queued amount are kept.  It's easier to understand
about the emptiness.  Also, the URB active flag is now cleared before
calling queue_pending_output_urbs() for avoiding (theoretically)
possible inconsistency.

Tested-by: Keith Milner <kamilner@superlative.org>
Tested-by: Dylan Robinson <dylan_robinson@motu.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.h     |  5 ++--
 sound/usb/endpoint.c | 83 +++++++++++++++++++++++++++++++++++++---------------
 2 files changed, 63 insertions(+), 25 deletions(-)

diff --git a/sound/usb/card.h b/sound/usb/card.h
index 66a249ae138f..cde492e9581a 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -80,8 +80,9 @@ struct snd_usb_endpoint {
 		uint32_t packet_size[MAX_PACKS_HS];
 		int packets;
 	} next_packet[MAX_URBS];
-	int next_packet_read_pos, next_packet_write_pos;
-	struct list_head ready_playback_urbs;
+	unsigned int next_packet_head;	/* ring buffer offset to read */
+	unsigned int next_packet_queued; /* queued items in the ring buffer */
+	struct list_head ready_playback_urbs; /* playback URB FIFO for implicit fb */
 
 	unsigned int nurbs;		/* # urbs */
 	unsigned long active_mask;	/* bitmask of active urbs */
diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index eee74313603e..b8f06a75fc2a 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -328,6 +328,39 @@ static inline void prepare_inbound_urb(struct snd_usb_endpoint *ep,
 	}
 }
 
+/* notify an error as XRUN to the assigned PCM data substream */
+static void notify_xrun(struct snd_usb_endpoint *ep)
+{
+	struct snd_usb_substream *data_subs;
+
+	data_subs = READ_ONCE(ep->data_subs);
+	if (data_subs && data_subs->pcm_substream)
+		snd_pcm_stop_xrun(data_subs->pcm_substream);
+}
+
+static struct snd_usb_packet_info *
+next_packet_fifo_enqueue(struct snd_usb_endpoint *ep)
+{
+	struct snd_usb_packet_info *p;
+
+	p = ep->next_packet + (ep->next_packet_head + ep->next_packet_queued) %
+		ARRAY_SIZE(ep->next_packet);
+	ep->next_packet_queued++;
+	return p;
+}
+
+static struct snd_usb_packet_info *
+next_packet_fifo_dequeue(struct snd_usb_endpoint *ep)
+{
+	struct snd_usb_packet_info *p;
+
+	p = ep->next_packet + ep->next_packet_head;
+	ep->next_packet_head++;
+	ep->next_packet_head %= ARRAY_SIZE(ep->next_packet);
+	ep->next_packet_queued--;
+	return p;
+}
+
 /*
  * Send output urbs that have been prepared previously. URBs are dequeued
  * from ep->ready_playback_urbs and in case there aren't any available
@@ -352,17 +385,14 @@ static void queue_pending_output_urbs(struct snd_usb_endpoint *ep)
 		int err, i;
 
 		spin_lock_irqsave(&ep->lock, flags);
-		if (ep->next_packet_read_pos != ep->next_packet_write_pos) {
-			packet = ep->next_packet + ep->next_packet_read_pos;
-			ep->next_packet_read_pos++;
-			ep->next_packet_read_pos %= MAX_URBS;
-
+		if (ep->next_packet_queued > 0 &&
+		    !list_empty(&ep->ready_playback_urbs)) {
 			/* take URB out of FIFO */
-			if (!list_empty(&ep->ready_playback_urbs)) {
-				ctx = list_first_entry(&ep->ready_playback_urbs,
+			ctx = list_first_entry(&ep->ready_playback_urbs,
 					       struct snd_urb_ctx, ready_list);
-				list_del_init(&ctx->ready_list);
-			}
+			list_del_init(&ctx->ready_list);
+
+			packet = next_packet_fifo_dequeue(ep);
 		}
 		spin_unlock_irqrestore(&ep->lock, flags);
 
@@ -377,12 +407,15 @@ static void queue_pending_output_urbs(struct snd_usb_endpoint *ep)
 		prepare_outbound_urb(ep, ctx);
 
 		err = usb_submit_urb(ctx->urb, GFP_ATOMIC);
-		if (err < 0)
+		if (err < 0) {
 			usb_audio_err(ep->chip,
 				      "Unable to submit urb #%d: %d at %s\n",
 				      ctx->index, err, __func__);
-		else
-			set_bit(ctx->index, &ep->active_mask);
+			notify_xrun(ep);
+			return;
+		}
+
+		set_bit(ctx->index, &ep->active_mask);
 	}
 }
 
@@ -393,7 +426,6 @@ static void snd_complete_urb(struct urb *urb)
 {
 	struct snd_urb_ctx *ctx = urb->context;
 	struct snd_usb_endpoint *ep = ctx->ep;
-	struct snd_usb_substream *data_subs;
 	unsigned long flags;
 	int err;
 
@@ -418,10 +450,10 @@ static void snd_complete_urb(struct urb *urb)
 		if (snd_usb_endpoint_implicit_feedback_sink(ep)) {
 			spin_lock_irqsave(&ep->lock, flags);
 			list_add_tail(&ctx->ready_list, &ep->ready_playback_urbs);
+			clear_bit(ctx->index, &ep->active_mask);
 			spin_unlock_irqrestore(&ep->lock, flags);
 			queue_pending_output_urbs(ep);
-
-			goto exit_clear;
+			return;
 		}
 
 		prepare_outbound_urb(ep, ctx);
@@ -442,9 +474,7 @@ static void snd_complete_urb(struct urb *urb)
 		return;
 
 	usb_audio_err(ep->chip, "cannot submit urb (err = %d)\n", err);
-	data_subs = READ_ONCE(ep->data_subs);
-	if (data_subs && data_subs->pcm_substream)
-		snd_pcm_stop_xrun(data_subs->pcm_substream);
+	notify_xrun(ep);
 
 exit_clear:
 	clear_bit(ctx->index, &ep->active_mask);
@@ -789,8 +819,8 @@ static int deactivate_urbs(struct snd_usb_endpoint *ep, bool force)
 	clear_bit(EP_FLAG_RUNNING, &ep->flags);
 
 	INIT_LIST_HEAD(&ep->ready_playback_urbs);
-	ep->next_packet_read_pos = 0;
-	ep->next_packet_write_pos = 0;
+	ep->next_packet_head = 0;
+	ep->next_packet_queued = 0;
 
 	for (i = 0; i < ep->nurbs; i++) {
 		if (test_bit(i, &ep->active_mask)) {
@@ -1402,7 +1432,16 @@ static void snd_usb_handle_sync_urb(struct snd_usb_endpoint *ep,
 			return;
 
 		spin_lock_irqsave(&ep->lock, flags);
-		out_packet = ep->next_packet + ep->next_packet_write_pos;
+		if (ep->next_packet_queued >= ARRAY_SIZE(ep->next_packet)) {
+			spin_unlock_irqrestore(&ep->lock, flags);
+			usb_audio_err(ep->chip,
+				      "next package FIFO overflow EP 0x%x\n",
+				      ep->ep_num);
+			notify_xrun(ep);
+			return;
+		}
+
+		out_packet = next_packet_fifo_enqueue(ep);
 
 		/*
 		 * Iterate through the inbound packet and prepare the lengths
@@ -1423,8 +1462,6 @@ static void snd_usb_handle_sync_urb(struct snd_usb_endpoint *ep,
 				out_packet->packet_size[i] = 0;
 		}
 
-		ep->next_packet_write_pos++;
-		ep->next_packet_write_pos %= MAX_URBS;
 		spin_unlock_irqrestore(&ep->lock, flags);
 		queue_pending_output_urbs(ep);
 
-- 
2.16.4

