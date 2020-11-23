Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F192C01D5
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 10:01:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 739F916AC;
	Mon, 23 Nov 2020 10:00:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 739F916AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606122103;
	bh=pgyAev7qeTgsJ3w4rbRF0vZN/m5SslFBpvms0e0nvao=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DnWYs5YI+HspBleLaaNhX7UfdipPl0nvMfkmO4xk2zfZa8zLG9/Zd/q5SF0qx1wwk
	 haCeAazDAMAE4FvI+rIRxVFLRg/N8cTuzAg842JFDOc4EuKEqS9+h9oci0qdSkLLdD
	 4gEtsFk0SLRiOE3bpIY0ZgXmhZ1fIY7jZ5AYaUaE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E664F804E0;
	Mon, 23 Nov 2020 09:54:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7A03F80529; Mon, 23 Nov 2020 09:54:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DB44F804C2
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 09:54:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DB44F804C2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 16DFBAFC8;
 Mon, 23 Nov 2020 08:53:58 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 21/41] ALSA: usb-audio: Stop both endpoints properly at error
Date: Mon, 23 Nov 2020 09:53:27 +0100
Message-Id: <20201123085347.19667-22-tiwai@suse.de>
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

start_endpoints() may leave the data endpoint running if an error
happens at starting the sync endpoint.  We should stop both streams
properly, instead.

While we're at it, move the debug prints into the endpoint.c that is a
more suitable place.

Tested-by: Keith Milner <kamilner@superlative.org>
Tested-by: Dylan Robinson <dylan_robinson@motu.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/endpoint.c |  6 ++++++
 sound/usb/pcm.c      | 39 +++++++++++++++++----------------------
 2 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index eb459db511f8..0cc7e9c01263 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -1172,6 +1172,9 @@ int snd_usb_endpoint_start(struct snd_usb_endpoint *ep)
 	if (atomic_read(&ep->chip->shutdown))
 		return -EBADFD;
 
+	usb_audio_dbg(ep->chip, "Starting %s EP 0x%x (count %d)\n",
+		      ep_type_name(ep->type), ep->ep_num, ep->use_count);
+
 	/* already running? */
 	if (++ep->use_count != 1)
 		return 0;
@@ -1254,6 +1257,9 @@ void snd_usb_endpoint_stop(struct snd_usb_endpoint *ep)
 	if (!ep)
 		return;
 
+	usb_audio_dbg(ep->chip, "Stopping %s EP 0x%x (count %d)\n",
+		      ep_type_name(ep->type), ep->ep_num, ep->use_count);
+
 	if (snd_BUG_ON(ep->use_count == 0))
 		return;
 
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 0998be109af3..c4e39aa92a84 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -211,6 +211,17 @@ int snd_usb_init_pitch(struct snd_usb_audio *chip,
 	}
 }
 
+static void stop_endpoints(struct snd_usb_substream *subs)
+{
+	if (test_and_clear_bit(SUBSTREAM_FLAG_SYNC_EP_STARTED, &subs->flags)) {
+		snd_usb_endpoint_stop(subs->sync_endpoint);
+		subs->sync_endpoint->sync_slave = NULL;
+	}
+
+	if (test_and_clear_bit(SUBSTREAM_FLAG_DATA_EP_STARTED, &subs->flags))
+		snd_usb_endpoint_stop(subs->data_endpoint);
+}
+
 static int start_endpoints(struct snd_usb_substream *subs)
 {
 	int err;
@@ -221,13 +232,11 @@ static int start_endpoints(struct snd_usb_substream *subs)
 	if (!test_and_set_bit(SUBSTREAM_FLAG_DATA_EP_STARTED, &subs->flags)) {
 		struct snd_usb_endpoint *ep = subs->data_endpoint;
 
-		dev_dbg(&subs->dev->dev, "Starting data EP 0x%x\n", ep->ep_num);
-
 		ep->data_subs = subs;
 		err = snd_usb_endpoint_start(ep);
 		if (err < 0) {
 			clear_bit(SUBSTREAM_FLAG_DATA_EP_STARTED, &subs->flags);
-			return err;
+			goto error;
 		}
 	}
 
@@ -235,18 +244,20 @@ static int start_endpoints(struct snd_usb_substream *subs)
 	    !test_and_set_bit(SUBSTREAM_FLAG_SYNC_EP_STARTED, &subs->flags)) {
 		struct snd_usb_endpoint *ep = subs->sync_endpoint;
 
-		dev_dbg(&subs->dev->dev, "Starting sync EP 0x%x\n", ep->ep_num);
-
 		ep->sync_slave = subs->data_endpoint;
 		err = snd_usb_endpoint_start(ep);
 		if (err < 0) {
 			clear_bit(SUBSTREAM_FLAG_SYNC_EP_STARTED, &subs->flags);
 			ep->sync_slave = NULL;
-			return err;
+			goto error;
 		}
 	}
 
 	return 0;
+
+ error:
+	stop_endpoints(subs);
+	return err;
 }
 
 static void sync_pending_stops(struct snd_usb_substream *subs)
@@ -255,22 +266,6 @@ static void sync_pending_stops(struct snd_usb_substream *subs)
 	snd_usb_endpoint_sync_pending_stop(subs->data_endpoint);
 }
 
-static void stop_endpoints(struct snd_usb_substream *subs)
-{
-	if (test_and_clear_bit(SUBSTREAM_FLAG_SYNC_EP_STARTED, &subs->flags)) {
-		dev_dbg(&subs->dev->dev, "Stopping sync EP 0x%x\n",
-			subs->sync_endpoint->ep_num);
-		snd_usb_endpoint_stop(subs->sync_endpoint);
-		subs->sync_endpoint->sync_slave = NULL;
-	}
-
-	if (test_and_clear_bit(SUBSTREAM_FLAG_DATA_EP_STARTED, &subs->flags)) {
-		dev_dbg(&subs->dev->dev, "Stopping data EP 0x%x\n",
-			subs->data_endpoint->ep_num);
-		snd_usb_endpoint_stop(subs->data_endpoint);
-	}
-}
-
 /* PCM sync_stop callback */
 static int snd_usb_pcm_sync_stop(struct snd_pcm_substream *substream)
 {
-- 
2.16.4

