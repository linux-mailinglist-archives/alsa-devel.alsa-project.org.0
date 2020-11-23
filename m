Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF72A2C01D1
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 10:00:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44460169F;
	Mon, 23 Nov 2020 09:59:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44460169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606122045;
	bh=7potPxhnn3DNx+oSizO6giIzgsoUPAQbLn1YKSCSVcY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DGps+nCLY1K6sXwgJi8DEr0hXpUzaa+ELskAWvBBgxRtFEYc/ecZJev8WlciuDoBx
	 AhHeijjrYetZuMYSFpAIaZ2BeOotJ0nX8BlWFav7ziF0RXhmq13goWBv4Ou45EQM9u
	 R/fkqnflVJDKXSJbFKJNFsl7Z7rI+tBxpjRZqt6A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 077C8F804EC;
	Mon, 23 Nov 2020 09:54:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5FDEF804C1; Mon, 23 Nov 2020 09:54:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B76FF804BC
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 09:53:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B76FF804BC
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 30329AF92;
 Mon, 23 Nov 2020 08:53:57 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 06/41] ALSA: usb-audio: Set and clear sync EP link properly
Date: Mon, 23 Nov 2020 09:53:12 +0100
Message-Id: <20201123085347.19667-7-tiwai@suse.de>
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

The sync EP setup isn't cleared at stopping the stream but expected to
be cleared at the next stream start.  This may leave the sync link
setup stale and can spoof wrongly when full duplex streams were
running in the implicit fb sync.  Let's initialize them properly at
start and end of the stream.

Tested-by: Keith Milner <kamilner@superlative.org>
Tested-by: Dylan Robinson <dylan_robinson@motu.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/pcm.c | 30 +++++++++++-------------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 2b11c2c837bf..8800ec627a73 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -238,6 +238,7 @@ static int start_endpoints(struct snd_usb_substream *subs)
 		err = snd_usb_endpoint_start(ep);
 		if (err < 0) {
 			clear_bit(SUBSTREAM_FLAG_SYNC_EP_STARTED, &subs->flags);
+			ep->sync_slave = NULL;
 			return err;
 		}
 	}
@@ -253,8 +254,10 @@ static void sync_pending_stops(struct snd_usb_substream *subs)
 
 static void stop_endpoints(struct snd_usb_substream *subs)
 {
-	if (test_and_clear_bit(SUBSTREAM_FLAG_SYNC_EP_STARTED, &subs->flags))
+	if (test_and_clear_bit(SUBSTREAM_FLAG_SYNC_EP_STARTED, &subs->flags)) {
 		snd_usb_endpoint_stop(subs->sync_endpoint);
+		subs->sync_endpoint->sync_slave = NULL;
+	}
 
 	if (test_and_clear_bit(SUBSTREAM_FLAG_DATA_EP_STARTED, &subs->flags))
 		snd_usb_endpoint_stop(subs->data_endpoint);
@@ -471,26 +474,10 @@ static int set_sync_endpoint(struct snd_usb_substream *subs,
 	bool implicit_fb;
 	int err;
 
-	/* we need a sync pipe in async OUT or adaptive IN mode */
-	/* check the number of EP, since some devices have broken
-	 * descriptors which fool us.  if it has only one EP,
-	 * assume it as adaptive-out or sync-in.
-	 */
 	attr = fmt->ep_attr & USB_ENDPOINT_SYNCTYPE;
 
-	if ((is_playback && (attr != USB_ENDPOINT_SYNC_ASYNC)) ||
-		(!is_playback && (attr != USB_ENDPOINT_SYNC_ADAPTIVE))) {
-
-		/*
-		 * In these modes the notion of sync_endpoint is irrelevant.
-		 * Reset pointers to avoid using stale data from previously
-		 * used settings, e.g. when configuration and endpoints were
-		 * changed
-		 */
-
-		subs->sync_endpoint = NULL;
-		subs->data_endpoint->sync_master = NULL;
-	}
+	subs->sync_endpoint = NULL;
+	subs->data_endpoint->sync_master = NULL;
 
 	err = set_sync_ep_implicit_fb_quirk(subs, dev, altsd, attr);
 	if (err < 0)
@@ -939,6 +926,11 @@ static int snd_usb_hw_free(struct snd_pcm_substream *substream)
 		sync_pending_stops(subs);
 		snd_usb_endpoint_deactivate(subs->sync_endpoint);
 		snd_usb_endpoint_deactivate(subs->data_endpoint);
+		if (subs->data_endpoint) {
+			subs->data_endpoint->sync_master = NULL;
+			subs->data_endpoint = NULL;
+		}
+		subs->sync_endpoint = NULL;
 		snd_usb_unlock_shutdown(subs->stream->chip);
 	}
 
-- 
2.16.4

