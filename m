Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBB62ED13F
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jan 2021 15:00:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E82386E;
	Thu,  7 Jan 2021 14:59:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E82386E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610028034;
	bh=y48b76E7PODKEyvGVht9/ncC4KldU+zHGsrOSoiXiiE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X7hQUdLsD0eIMXI7ebIQ9cs4wjbC6+rsomUNuDLBNQDPkNbQIuIMauPb9dAEwgVZ9
	 U3iI2I70f/fqKJwcrMYblMKSJvKslHMOiyXciPTPeVP7ljGHThX3A1YHYOIPwxI2xx
	 L09ogiurzq5pfKsZfYEFyJSEnM+0TYVuju2+3d2M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E55D0F804CB;
	Thu,  7 Jan 2021 14:58:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A5C4F804C2; Thu,  7 Jan 2021 14:58:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6555FF80271
 for <alsa-devel@alsa-project.org>; Thu,  7 Jan 2021 14:58:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6555FF80271
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BFBCDB720;
 Thu,  7 Jan 2021 13:58:05 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 4/5] ALSA: usb-audio: Annotate the endpoint index in
 audioformat
Date: Thu,  7 Jan 2021 14:58:00 +0100
Message-Id: <20210107135801.23860-5-tiwai@suse.de>
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
 3 files changed, 8 insertions(+), 1 deletion(-)

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
-- 
2.26.2

