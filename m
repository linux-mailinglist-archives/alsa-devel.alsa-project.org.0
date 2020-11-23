Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 801BB2C0203
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 10:07:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 126F31678;
	Mon, 23 Nov 2020 10:06:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 126F31678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606122428;
	bh=40nJEb7yfS9f8sthbYJwLF76MLrc+stn+FYt5bQSexw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FWu1zRrR8BnUcx/2jvci6E0Bm6yJ2kVIE5sHXaYFm6TwMxwSz8r4LWPuxj9e6uIw/
	 2agOnhtBbQ5FT6klcBEmJ7Ss/c5Kurbt9SDyfOTzv8U0LZEjBIscKjroZ3NJNlDZ4K
	 1KJ8qr7MTS2LCoPo2w/03VWSHBeWciCwnORK8PG0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32EBCF805E1;
	Mon, 23 Nov 2020 09:55:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C888F80543; Mon, 23 Nov 2020 09:54:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6DDAF804EC
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 09:54:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6DDAF804EC
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C5B32AD75;
 Mon, 23 Nov 2020 08:53:58 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 33/41] ALSA: usb-audio: Replace slave/master terms
Date: Mon, 23 Nov 2020 09:53:39 +0100
Message-Id: <20201123085347.19667-34-tiwai@suse.de>
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

Follow the inclusive terminology, just replace sync_master/sync_slave
with sync_source/sync_sink.  It's also a bit clearer from its meaning,
too.

Tested-by: Keith Milner <kamilner@superlative.org>
Tested-by: Dylan Robinson <dylan_robinson@motu.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.h     |  4 ++--
 sound/usb/endpoint.c | 28 ++++++++++++++--------------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/usb/card.h b/sound/usb/card.h
index 1dd7a514d1d5..3e16b9288693 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -71,8 +71,8 @@ struct snd_usb_endpoint {
 				 struct urb *urb);
 
 	struct snd_usb_substream *data_subs;
-	struct snd_usb_endpoint *sync_master;
-	struct snd_usb_endpoint *sync_slave;
+	struct snd_usb_endpoint *sync_source;
+	struct snd_usb_endpoint *sync_sink;
 
 	struct snd_urb_ctx urb[MAX_URBS];
 
diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 5d618724bd75..5f1d5f1ed8db 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -175,7 +175,7 @@ int snd_usb_endpoint_next_packet_size(struct snd_usb_endpoint *ep,
 {
 	if (ctx->packet_size[idx])
 		return ctx->packet_size[idx];
-	else if (ep->sync_master)
+	else if (ep->sync_source)
 		return slave_next_packet_size(ep);
 	else
 		return next_packet_size(ep);
@@ -205,16 +205,16 @@ static void retire_inbound_urb(struct snd_usb_endpoint *ep,
 			       struct snd_urb_ctx *urb_ctx)
 {
 	struct urb *urb = urb_ctx->urb;
-	struct snd_usb_endpoint *sync_slave;
+	struct snd_usb_endpoint *sync_sink;
 
 	if (unlikely(ep->skip_packets > 0)) {
 		ep->skip_packets--;
 		return;
 	}
 
-	sync_slave = READ_ONCE(ep->sync_slave);
-	if (sync_slave)
-		snd_usb_handle_sync_urb(sync_slave, ep, urb);
+	sync_sink = READ_ONCE(ep->sync_sink);
+	if (sync_sink)
+		snd_usb_handle_sync_urb(sync_sink, ep, urb);
 
 	call_retire_callback(ep, urb);
 }
@@ -708,7 +708,7 @@ void snd_usb_endpoint_set_sync(struct snd_usb_audio *chip,
 			       struct snd_usb_endpoint *data_ep,
 			       struct snd_usb_endpoint *sync_ep)
 {
-	data_ep->sync_master = sync_ep;
+	data_ep->sync_source = sync_ep;
 }
 
 /*
@@ -802,7 +802,7 @@ static int wait_clear_urbs(struct snd_usb_endpoint *ep)
 			alive, ep->ep_num);
 	clear_bit(EP_FLAG_STOPPING, &ep->flags);
 
-	ep->sync_slave = NULL;
+	ep->sync_sink = NULL;
 	snd_usb_endpoint_set_callback(ep, NULL, NULL, NULL);
 
 	return 0;
@@ -969,9 +969,9 @@ static int data_ep_set_params(struct snd_usb_endpoint *ep)
 		packs_per_ms = 1;
 		max_packs_per_urb = MAX_PACKS;
 	}
-	if (ep->sync_master && !ep->implicit_fb_sync)
+	if (ep->sync_source && !ep->implicit_fb_sync)
 		max_packs_per_urb = min(max_packs_per_urb,
-					1U << ep->sync_master->syncinterval);
+					1U << ep->sync_source->syncinterval);
 	max_packs_per_urb = max(1u, max_packs_per_urb >> ep->datainterval);
 
 	/*
@@ -1015,7 +1015,7 @@ static int data_ep_set_params(struct snd_usb_endpoint *ep)
 		minsize = (ep->freqn >> (16 - ep->datainterval)) *
 				(frame_bits >> 3);
 		/* with sync from device, assume it can be 12% lower */
-		if (ep->sync_master)
+		if (ep->sync_source)
 			minsize -= minsize >> 3;
 		minsize = max(minsize, 1u);
 
@@ -1272,8 +1272,8 @@ int snd_usb_endpoint_start(struct snd_usb_endpoint *ep)
 	if (atomic_read(&ep->chip->shutdown))
 		return -EBADFD;
 
-	if (ep->sync_master)
-		WRITE_ONCE(ep->sync_master->sync_slave, ep);
+	if (ep->sync_source)
+		WRITE_ONCE(ep->sync_source->sync_sink, ep);
 
 	usb_audio_dbg(ep->chip, "Starting %s EP 0x%x (running %d)\n",
 		      ep_type_name(ep->type), ep->ep_num,
@@ -1366,8 +1366,8 @@ void snd_usb_endpoint_stop(struct snd_usb_endpoint *ep)
 	if (snd_BUG_ON(!atomic_read(&ep->running)))
 		return;
 
-	if (ep->sync_master)
-		WRITE_ONCE(ep->sync_master->sync_slave, NULL);
+	if (ep->sync_source)
+		WRITE_ONCE(ep->sync_source->sync_sink, NULL);
 
 	if (!atomic_dec_return(&ep->running))
 		stop_and_unlink_urbs(ep, false, false);
-- 
2.16.4

