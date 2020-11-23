Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE1B2C01C8
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 09:57:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 414C61666;
	Mon, 23 Nov 2020 09:56:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 414C61666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606121850;
	bh=/80Wxo3ZBHitJnvwBpweaPaqAkVaQ0AlbHTjkacSdjU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ACvxPs7i4fQeCDzzXFKZY7JHVelrVTE09GIh0P07hJSJtmkz4t8yYZCa/pY5Gzrfs
	 qZzJcR0UL/+6to+i0z8iZWiPx8EgWk5Bo+OTPG+QZ6Q/n/8vLz86OGqr1yu/8IOsyX
	 bhL8v8SMbyDD1uBI3rj76QkawUV6dG+ka1enWlRE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B254F804B4;
	Mon, 23 Nov 2020 09:54:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3030FF8051B; Mon, 23 Nov 2020 09:54:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0819CF8027C
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 09:53:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0819CF8027C
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1F634AF90;
 Mon, 23 Nov 2020 08:53:57 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 05/41] ALSA: usb-audio: Add snd_usb_get_endpoint() helper
Date: Mon, 23 Nov 2020 09:53:11 +0100
Message-Id: <20201123085347.19667-6-tiwai@suse.de>
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

Factor out the code to obtain snd_usb_endpoint object matching with
the given endpoint.  It'll be used in the later patch to add the
implicit feedback hw-constraint.

No functional change by this patch itself.

Tested-by: Keith Milner <kamilner@superlative.org>
Tested-by: Dylan Robinson <dylan_robinson@motu.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/endpoint.c | 36 +++++++++++++++++++++++++++---------
 sound/usb/endpoint.h |  4 ++++
 2 files changed, 31 insertions(+), 9 deletions(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index e2f9ce2f5b8b..cf00871fd278 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -439,6 +439,26 @@ static void snd_complete_urb(struct urb *urb)
 	clear_bit(ctx->index, &ep->active_mask);
 }
 
+/*
+ * Get the existing endpoint object corresponding EP, iface and alt numbers
+ * Returns NULL if not present.
+ * Call inside chip->mutex locking for avoiding the race.
+ */
+struct snd_usb_endpoint *
+snd_usb_get_endpoint(struct snd_usb_audio *chip,
+		     int ep_num, int iface, int altsetting)
+{
+	struct snd_usb_endpoint *ep;
+
+	list_for_each_entry(ep, &chip->ep_list, list) {
+		if (ep->ep_num == ep_num &&
+		    ep->iface == iface &&
+		    ep->altsetting == altsetting)
+			return ep;
+	}
+	return NULL;
+}
+
 /**
  * snd_usb_add_endpoint: Add an endpoint to an USB audio chip
  *
@@ -470,15 +490,13 @@ struct snd_usb_endpoint *snd_usb_add_endpoint(struct snd_usb_audio *chip,
 
 	mutex_lock(&chip->mutex);
 
-	list_for_each_entry(ep, &chip->ep_list, list) {
-		if (ep->ep_num == ep_num &&
-		    ep->iface == alts->desc.bInterfaceNumber &&
-		    ep->altsetting == alts->desc.bAlternateSetting) {
-			usb_audio_dbg(ep->chip,
-				      "Re-using EP %x in iface %d,%d @%p\n",
-					ep_num, ep->iface, ep->altsetting, ep);
-			goto __exit_unlock;
-		}
+	ep = snd_usb_get_endpoint(chip, ep_num,
+				  alts->desc.bInterfaceNumber,
+				  alts->desc.bAlternateSetting);
+	if (ep) {
+		usb_audio_dbg(ep->chip, "Re-using EP %x in iface %d,%d @%p\n",
+			      ep_num, ep->iface, ep->altsetting, ep);
+		goto __exit_unlock;
 	}
 
 	usb_audio_dbg(chip, "Creating new %s %s endpoint #%x\n",
diff --git a/sound/usb/endpoint.h b/sound/usb/endpoint.h
index d23fa0a8c11b..61487095a766 100644
--- a/sound/usb/endpoint.h
+++ b/sound/usb/endpoint.h
@@ -5,6 +5,10 @@
 #define SND_USB_ENDPOINT_TYPE_DATA     0
 #define SND_USB_ENDPOINT_TYPE_SYNC     1
 
+struct snd_usb_endpoint *snd_usb_get_endpoint(struct snd_usb_audio *chip,
+					      int ep_num, int iface,
+					      int altsetting);
+
 struct snd_usb_endpoint *snd_usb_add_endpoint(struct snd_usb_audio *chip,
 					      struct usb_host_interface *alts,
 					      int ep_num, int direction, int type);
-- 
2.16.4

