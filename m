Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 934032EEE2B
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jan 2021 08:54:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FA9616A8;
	Fri,  8 Jan 2021 08:53:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FA9616A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610092463;
	bh=8VjBwlf/71S4DyioIPxh+sZsAMiR9Mki6vAHmRF8jQw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QD028AQOt2Yl6dSzhCLSAVOQmOKhN5mxetDMiRULjxRc1Ln+hLQ1tmz6joJ7i7zKf
	 6hNaKXHVgmN0A7SFiHphKM4r74e+JMmxrGUmEAN46DL5wNhp7REr6wYbJx6OB/Ik+G
	 MpkDSWqJj/Qi9dHbNxaPVPj3toriin7Rm9kW7MkQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B81DF80279;
	Fri,  8 Jan 2021 08:52:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 808EDF8027D; Fri,  8 Jan 2021 08:52:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30D8AF80167
 for <alsa-devel@alsa-project.org>; Fri,  8 Jan 2021 08:52:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30D8AF80167
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A9728AF19;
 Fri,  8 Jan 2021 07:52:20 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v5 4/5] ALSA: usb-audio: Annotate the endpoint index in
 audioformat
Date: Fri,  8 Jan 2021 08:52:18 +0100
Message-Id: <20210108075219.21463-5-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210108075219.21463-1-tiwai@suse.de>
References: <20210108075219.21463-1-tiwai@suse.de>
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

There are devices that have multiple endpoints sharing the same
iface/altset not only for sync but also for the actual streams, and
the audioformat for such an endpoint needs to be handled with the
proper endpoint index; otherwise it confuses the endpoint management.

This patch extends the audioformat to annotate the endpoint index, and
put the proper ep_idx=1 to Pioneer device quirk entries accordingly.

Fixes: bf6313a0ff76 ("ALSA: usb-audio: Refactor endpoint management")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.h         | 1 +
 sound/usb/endpoint.c     | 2 +-
 sound/usb/quirks-table.h | 6 ++++++
 sound/usb/quirks.c       | 4 ++--
 4 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/sound/usb/card.h b/sound/usb/card.h
index de0d2aa883fa..37091b117614 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -18,6 +18,7 @@ struct audioformat {
 	unsigned int frame_size;	/* samples per frame for non-audio */
 	unsigned char iface;		/* interface number */
 	unsigned char altsetting;	/* corresponding alternate setting */
+	unsigned char ep_idx;		/* endpoint array index */
 	unsigned char altset_idx;	/* array index of altenate setting */
 	unsigned char attributes;	/* corresponding attributes of cs endpoint */
 	unsigned char endpoint;		/* endpoint */
diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index ae6276aded91..fe73fe3ff2bc 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -683,7 +683,7 @@ snd_usb_endpoint_open(struct snd_usb_audio *chip,
 		} else {
 			ep->iface = fp->iface;
 			ep->altsetting = fp->altsetting;
-			ep->ep_idx = 0;
+			ep->ep_idx = fp->ep_idx;
 		}
 		usb_audio_dbg(chip, "Open EP 0x%x, iface=%d:%d, idx=%d\n",
 			      ep_num, ep->iface, ep->altsetting, ep->ep_idx);
diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 0e11cb96fa8c..c8a4bdf18207 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -3362,6 +3362,7 @@ AU0828_DEVICE(0x2040, 0x7270, "Hauppauge", "HVR-950Q"),
 					.altsetting = 1,
 					.altset_idx = 1,
 					.endpoint = 0x86,
+					.ep_idx = 1,
 					.ep_attr = USB_ENDPOINT_XFER_ISOC|
 						 USB_ENDPOINT_SYNC_ASYNC|
 						 USB_ENDPOINT_USAGE_IMPLICIT_FB,
@@ -3450,6 +3451,7 @@ AU0828_DEVICE(0x2040, 0x7270, "Hauppauge", "HVR-950Q"),
 					.altsetting = 1,
 					.altset_idx = 1,
 					.endpoint = 0x82,
+					.ep_idx = 1,
 					.ep_attr = USB_ENDPOINT_XFER_ISOC|
 						USB_ENDPOINT_SYNC_ASYNC|
 						USB_ENDPOINT_USAGE_IMPLICIT_FB,
@@ -3506,6 +3508,7 @@ AU0828_DEVICE(0x2040, 0x7270, "Hauppauge", "HVR-950Q"),
 					.altsetting = 1,
 					.altset_idx = 1,
 					.endpoint = 0x82,
+					.ep_idx = 1,
 					.ep_attr = USB_ENDPOINT_XFER_ISOC|
 						 USB_ENDPOINT_SYNC_ASYNC|
 						 USB_ENDPOINT_USAGE_IMPLICIT_FB,
@@ -3562,6 +3565,7 @@ AU0828_DEVICE(0x2040, 0x7270, "Hauppauge", "HVR-950Q"),
 					.altsetting = 1,
 					.altset_idx = 1,
 					.endpoint = 0x82,
+					.ep_idx = 1,
 					.ep_attr = USB_ENDPOINT_XFER_ISOC|
 						 USB_ENDPOINT_SYNC_ASYNC|
 						 USB_ENDPOINT_USAGE_IMPLICIT_FB,
@@ -3619,6 +3623,7 @@ AU0828_DEVICE(0x2040, 0x7270, "Hauppauge", "HVR-950Q"),
 					.altsetting = 1,
 					.altset_idx = 1,
 					.endpoint = 0x82,
+					.ep_idx = 1,
 					.ep_attr = USB_ENDPOINT_XFER_ISOC|
 						USB_ENDPOINT_SYNC_ASYNC|
 					USB_ENDPOINT_USAGE_IMPLICIT_FB,
@@ -3679,6 +3684,7 @@ AU0828_DEVICE(0x2040, 0x7270, "Hauppauge", "HVR-950Q"),
 					.altsetting = 1,
 					.altset_idx = 1,
 					.endpoint = 0x82,
+					.ep_idx = 1,
 					.ep_attr = USB_ENDPOINT_XFER_ISOC|
 					    USB_ENDPOINT_SYNC_ASYNC|
 					    USB_ENDPOINT_USAGE_IMPLICIT_FB,
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index b70e2ebc3e29..89e172642d98 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -194,7 +194,7 @@ static int create_fixed_stream_quirk(struct snd_usb_audio *chip,
 	}
 	alts = &iface->altsetting[fp->altset_idx];
 	altsd = get_iface_desc(alts);
-	if (altsd->bNumEndpoints < 1) {
+	if (altsd->bNumEndpoints <= fp->ep_idx) {
 		err = -EINVAL;
 		goto error;
 	}
@@ -204,7 +204,7 @@ static int create_fixed_stream_quirk(struct snd_usb_audio *chip,
 	if (fp->datainterval == 0)
 		fp->datainterval = snd_usb_parse_datainterval(chip, alts);
 	if (fp->maxpacksize == 0)
-		fp->maxpacksize = le16_to_cpu(get_endpoint(alts, 0)->wMaxPacketSize);
+		fp->maxpacksize = le16_to_cpu(get_endpoint(alts, fp->ep_idx)->wMaxPacketSize);
 	if (!fp->fmt_type)
 		fp->fmt_type = UAC_FORMAT_TYPE_I;
 
-- 
2.26.2

