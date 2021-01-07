Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A8C2ED13D
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jan 2021 14:59:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC40016A4;
	Thu,  7 Jan 2021 14:59:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC40016A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610027994;
	bh=w46963NwdI4LQtZwLqGVG9ZvySqbNoqxkCtBTf9P6zI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KBItwffbfsbIjSKk7qY4FDH7FygGTTZL68Pg/ooeFkAsOnmIWoZdwuhKo5LR8YbSd
	 bFBUedEDKRuIihRn6R5FMdM1HvchFQCadw2by7qwcf28Lh58OOXA+1+J+SZuS/70UQ
	 q42JcU6mhf/hhC/XmTv7xUVqd0OzQhzrPH+hxSc4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A51FAF80276;
	Thu,  7 Jan 2021 14:58:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47259F804BD; Thu,  7 Jan 2021 14:58:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E056F801F5
 for <alsa-devel@alsa-project.org>; Thu,  7 Jan 2021 14:58:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E056F801F5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BF463B71D;
 Thu,  7 Jan 2021 13:58:05 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 3/5] ALSA: usb-audio: Avoid unnecessary interface re-setup
Date: Thu,  7 Jan 2021 14:57:59 +0100
Message-Id: <20210107135801.23860-4-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107135801.23860-1-tiwai@suse.de>
References: <20210107135801.23860-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Franti=C5=A1ek=20Ku=C4=8Dera?= <konference@frantovo.cz>,
 Geraldo <geraldogabriel@gmail.com>
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

The current endpoint handling assumed (more or less) a unique 1:1
relation between the endpoint and the iface/altset.  The exception was
the sync EP without the implicit feedback which has usually the
secondary EP of the same altset.  This works fine for most devices,
but it turned out that some unusual devices like Pinoeer's ones have
both playback and capture endpoints in the same iface/altsetting and
use both for the implicit feedback mode.  For handling such a case, we
need to extend the endpoint management to take the shared interface
into account.

This patch does that: it adds a new object snd_usb_iface_ref for
managing the reference counts of the each USB interface that is used
by each endpoint.  The interface setup is performed only once for the
(sharing) endpoints, and the doubly initialization is avoided.

Along with this, the resource release of endpoints and interface
refcounts are put into a single function, snd_usb_endpoint_free_all()
instead of looping in the caller side.

Fixes: bf6313a0ff76 ("ALSA: usb-audio: Refactor endpoint management")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.c     |  5 ++-
 sound/usb/card.h     |  2 ++
 sound/usb/endpoint.c | 82 ++++++++++++++++++++++++++++++++++++++------
 sound/usb/endpoint.h |  2 +-
 sound/usb/usbaudio.h |  1 +
 5 files changed, 77 insertions(+), 15 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index d731ca62d599..e08fbf8e3ee0 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -450,10 +450,8 @@ lookup_device_name(u32 id)
 static void snd_usb_audio_free(struct snd_card *card)
 {
 	struct snd_usb_audio *chip = card->private_data;
-	struct snd_usb_endpoint *ep, *n;
 
-	list_for_each_entry_safe(ep, n, &chip->ep_list, list)
-		snd_usb_endpoint_free(ep);
+	snd_usb_endpoint_free_all(chip);
 
 	mutex_destroy(&chip->mutex);
 	if (!atomic_read(&chip->shutdown))
@@ -611,6 +609,7 @@ static int snd_usb_audio_create(struct usb_interface *intf,
 	chip->usb_id = usb_id;
 	INIT_LIST_HEAD(&chip->pcm_list);
 	INIT_LIST_HEAD(&chip->ep_list);
+	INIT_LIST_HEAD(&chip->iface_ref_list);
 	INIT_LIST_HEAD(&chip->midi_list);
 	INIT_LIST_HEAD(&chip->mixer_list);
 
diff --git a/sound/usb/card.h b/sound/usb/card.h
index 6a027c349194..de0d2aa883fa 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -42,6 +42,7 @@ struct audioformat {
 };
 
 struct snd_usb_substream;
+struct snd_usb_iface_ref;
 struct snd_usb_endpoint;
 struct snd_usb_power_domain;
 
@@ -58,6 +59,7 @@ struct snd_urb_ctx {
 
 struct snd_usb_endpoint {
 	struct snd_usb_audio *chip;
+	struct snd_usb_iface_ref *iface_ref;
 
 	int opened;		/* open refcount; protect with chip->mutex */
 	atomic_t running;	/* running status */
diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 162da7a50046..ae6276aded91 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -24,6 +24,14 @@
 #define EP_FLAG_RUNNING		1
 #define EP_FLAG_STOPPING	2
 
+/* interface refcounting */
+struct snd_usb_iface_ref {
+	unsigned char iface;
+	bool need_setup;
+	int opened;
+	struct list_head list;
+};
+
 /*
  * snd_usb_endpoint is a model that abstracts everything related to an
  * USB endpoint and its streaming.
@@ -488,6 +496,28 @@ static void snd_complete_urb(struct urb *urb)
 	clear_bit(ctx->index, &ep->active_mask);
 }
 
+/*
+ * Find or create a refcount object for the given interface
+ *
+ * The objects are released altogether in snd_usb_endpoint_free_all()
+ */
+static struct snd_usb_iface_ref *
+iface_ref_find(struct snd_usb_audio *chip, int iface)
+{
+	struct snd_usb_iface_ref *ip;
+
+	list_for_each_entry(ip, &chip->iface_ref_list, list)
+		if (ip->iface == iface)
+			return ip;
+
+	ip = kzalloc(sizeof(*ip), GFP_KERNEL);
+	if (!ip)
+		return NULL;
+	ip->iface = iface;
+	list_add_tail(&ip->list, &chip->iface_ref_list);
+	return ip;
+}
+
 /*
  * Get the existing endpoint object corresponding EP
  * Returns NULL if not present.
@@ -520,8 +550,8 @@ snd_usb_get_endpoint(struct snd_usb_audio *chip, int ep_num)
  *
  * Returns zero on success or a negative error code.
  *
- * New endpoints will be added to chip->ep_list and must be freed by
- * calling snd_usb_endpoint_free().
+ * New endpoints will be added to chip->ep_list and freed by
+ * calling snd_usb_endpoint_free_all().
  *
  * For SND_USB_ENDPOINT_TYPE_SYNC, the caller needs to guarantee that
  * bNumEndpoints > 1 beforehand.
@@ -658,6 +688,12 @@ snd_usb_endpoint_open(struct snd_usb_audio *chip,
 		usb_audio_dbg(chip, "Open EP 0x%x, iface=%d:%d, idx=%d\n",
 			      ep_num, ep->iface, ep->altsetting, ep->ep_idx);
 
+		ep->iface_ref = iface_ref_find(chip, ep->iface);
+		if (!ep->iface_ref) {
+			ep = NULL;
+			goto unlock;
+		}
+
 		ep->cur_audiofmt = fp;
 		ep->cur_channels = fp->channels;
 		ep->cur_rate = params_rate(params);
@@ -681,6 +717,11 @@ snd_usb_endpoint_open(struct snd_usb_audio *chip,
 			      ep->implicit_fb_sync);
 
 	} else {
+		if (WARN_ON(!ep->iface_ref)) {
+			ep = NULL;
+			goto unlock;
+		}
+
 		if (!endpoint_compatible(ep, fp, params)) {
 			usb_audio_err(chip, "Incompatible EP setup for 0x%x\n",
 				      ep_num);
@@ -692,6 +733,9 @@ snd_usb_endpoint_open(struct snd_usb_audio *chip,
 			      ep_num, ep->opened);
 	}
 
+	if (!ep->iface_ref->opened++)
+		ep->iface_ref->need_setup = true;
+
 	ep->opened++;
 
  unlock:
@@ -760,12 +804,16 @@ void snd_usb_endpoint_close(struct snd_usb_audio *chip,
 	mutex_lock(&chip->mutex);
 	usb_audio_dbg(chip, "Closing EP 0x%x (count %d)\n",
 		      ep->ep_num, ep->opened);
-	if (!--ep->opened) {
+
+	if (!--ep->iface_ref->opened)
 		endpoint_set_interface(chip, ep, false);
+
+	if (!--ep->opened) {
 		ep->iface = 0;
 		ep->altsetting = 0;
 		ep->cur_audiofmt = NULL;
 		ep->cur_rate = 0;
+		ep->iface_ref = NULL;
 		usb_audio_dbg(chip, "EP 0x%x closed\n", ep->ep_num);
 	}
 	mutex_unlock(&chip->mutex);
@@ -775,6 +823,8 @@ void snd_usb_endpoint_close(struct snd_usb_audio *chip,
 void snd_usb_endpoint_suspend(struct snd_usb_endpoint *ep)
 {
 	ep->need_setup = true;
+	if (ep->iface_ref)
+		ep->iface_ref->need_setup = true;
 }
 
 /*
@@ -1195,11 +1245,13 @@ int snd_usb_endpoint_configure(struct snd_usb_audio *chip,
 	int err = 0;
 
 	mutex_lock(&chip->mutex);
+	if (WARN_ON(!ep->iface_ref))
+		goto unlock;
 	if (!ep->need_setup)
 		goto unlock;
 
-	/* No need to (re-)configure the sync EP belonging to the same altset */
-	if (ep->ep_idx) {
+	/* If the interface has been already set up, just set EP parameters */
+	if (!ep->iface_ref->need_setup) {
 		err = snd_usb_endpoint_set_params(chip, ep);
 		if (err < 0)
 			goto unlock;
@@ -1242,6 +1294,8 @@ int snd_usb_endpoint_configure(struct snd_usb_audio *chip,
 			goto unlock;
 	}
 
+	ep->iface_ref->need_setup = false;
+
  done:
 	ep->need_setup = false;
 	err = 1;
@@ -1387,15 +1441,21 @@ void snd_usb_endpoint_release(struct snd_usb_endpoint *ep)
 }
 
 /**
- * snd_usb_endpoint_free: Free the resources of an snd_usb_endpoint
+ * snd_usb_endpoint_free_all: Free the resources of an snd_usb_endpoint
+ * @card: The chip
  *
- * @ep: the endpoint to free
- *
- * This free all resources of the given ep.
+ * This free all endpoints and those resources
  */
-void snd_usb_endpoint_free(struct snd_usb_endpoint *ep)
+void snd_usb_endpoint_free_all(struct snd_usb_audio *chip)
 {
-	kfree(ep);
+	struct snd_usb_endpoint *ep, *en;
+	struct snd_usb_iface_ref *ip, *in;
+
+	list_for_each_entry_safe(ep, en, &chip->ep_list, list)
+		kfree(ep);
+
+	list_for_each_entry_safe(ip, in, &chip->iface_ref_list, list)
+		kfree(ip);
 }
 
 /*
diff --git a/sound/usb/endpoint.h b/sound/usb/endpoint.h
index 11e3bb839fd7..eea4ca49876d 100644
--- a/sound/usb/endpoint.h
+++ b/sound/usb/endpoint.h
@@ -42,7 +42,7 @@ void snd_usb_endpoint_sync_pending_stop(struct snd_usb_endpoint *ep);
 void snd_usb_endpoint_suspend(struct snd_usb_endpoint *ep);
 int  snd_usb_endpoint_activate(struct snd_usb_endpoint *ep);
 void snd_usb_endpoint_release(struct snd_usb_endpoint *ep);
-void snd_usb_endpoint_free(struct snd_usb_endpoint *ep);
+void snd_usb_endpoint_free_all(struct snd_usb_audio *chip);
 
 int snd_usb_endpoint_implicit_feedback_sink(struct snd_usb_endpoint *ep);
 int snd_usb_endpoint_next_packet_size(struct snd_usb_endpoint *ep,
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index 980287aadd36..215c1771dd57 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -44,6 +44,7 @@ struct snd_usb_audio {
 
 	struct list_head pcm_list;	/* list of pcm streams */
 	struct list_head ep_list;	/* list of audio-related endpoints */
+	struct list_head iface_ref_list; /* list of interface refcounts */
 	int pcm_devs;
 
 	struct list_head midi_list;	/* list of midi interfaces */
-- 
2.26.2

