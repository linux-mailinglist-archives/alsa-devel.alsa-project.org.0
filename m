Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 629FA2C0204
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 10:07:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BC2D16F4;
	Mon, 23 Nov 2020 10:06:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BC2D16F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606122449;
	bh=lUUCe0ACQaH37hevcW/hdZ/i/+Z4F5wor05fTpy+1RM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fkACrAS2UB7VISKH0KEw7ZskOKPsSGBjjWdgRbQAyLya1Jtv4J+X4P6acSoHIe68/
	 ONIJZinNC1R4tK0zBm70eoVy37upaZGJ1ZtohvMnwAC5LyLAd5wnOAXS23ff2dK1AO
	 TiwvmmfMLTUpXplH0Ewqd1bM5gcK7GwLI4DTfZMI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFAB7F805E8;
	Mon, 23 Nov 2020 09:55:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 775D9F80551; Mon, 23 Nov 2020 09:54:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6398F804ED
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 09:54:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6398F804ED
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D3EDDACBD;
 Mon, 23 Nov 2020 08:53:58 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 34/41] ALSA: usb-audio: Use unsigned char for iface and
 altsettings fields
Date: Mon, 23 Nov 2020 09:53:40 +0100
Message-Id: <20201123085347.19667-35-tiwai@suse.de>
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

Just for consistency, use unsigned char for iface and altsetting in
allover places.  Also rearrange the field positions of
snd_usb_endpiont and tidy up with some comments.

Tested-by: Keith Milner <kamilner@superlative.org>
Tested-by: Dylan Robinson <dylan_robinson@motu.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.h     | 11 +++++++----
 sound/usb/endpoint.c |  2 +-
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/sound/usb/card.h b/sound/usb/card.h
index 3e16b9288693..6a027c349194 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -16,7 +16,7 @@ struct audioformat {
 	unsigned int fmt_type;		/* USB audio format type (1-3) */
 	unsigned int fmt_bits;		/* number of significant bits */
 	unsigned int frame_size;	/* samples per frame for non-audio */
-	int iface;			/* interface number */
+	unsigned char iface;		/* interface number */
 	unsigned char altsetting;	/* corresponding alternate setting */
 	unsigned char altset_idx;	/* array index of altenate setting */
 	unsigned char attributes;	/* corresponding attributes of cs endpoint */
@@ -63,7 +63,12 @@ struct snd_usb_endpoint {
 	atomic_t running;	/* running status */
 	int ep_num;		/* the referenced endpoint number */
 	int type;		/* SND_USB_ENDPOINT_TYPE_* */
-	unsigned long flags;
+
+	unsigned char iface;		/* interface number */
+	unsigned char altsetting;	/* corresponding alternate setting */
+	unsigned char ep_idx;		/* endpoint array index */
+
+	unsigned long flags;	/* running bit flags */
 
 	void (*prepare_data_urb) (struct snd_usb_substream *subs,
 				  struct urb *urb);
@@ -112,8 +117,6 @@ struct snd_usb_endpoint {
 	unsigned int syncinterval;	/* P for adaptive mode, 0 otherwise */
 	unsigned char silence_value;
 	unsigned int stride;
-	int iface, altsetting;
-	unsigned char ep_idx;		/* endpoint array index */
 	int skip_packets;		/* quirks for devices to ignore the first n packets
 					   in a stream */
 	bool implicit_fb_sync;		/* syncs with implicit feedback */
diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 5f1d5f1ed8db..162da7a50046 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -762,7 +762,7 @@ void snd_usb_endpoint_close(struct snd_usb_audio *chip,
 		      ep->ep_num, ep->opened);
 	if (!--ep->opened) {
 		endpoint_set_interface(chip, ep, false);
-		ep->iface = -1;
+		ep->iface = 0;
 		ep->altsetting = 0;
 		ep->cur_audiofmt = NULL;
 		ep->cur_rate = 0;
-- 
2.16.4

