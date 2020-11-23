Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB9F2C0212
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 10:11:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84AD616D9;
	Mon, 23 Nov 2020 10:10:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84AD616D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606122696;
	bh=LpqKpdsHjjiG5K9+k/J4+GfKCTpKB3ebPtuEdCs71B4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nhkezfH+8ynoeCPruyHiu3K2u84s3ldQIwoO9BSuAYffqxMRo8OwaDs5Im1iluzB2
	 FBk6ACvUCZ0EM08WDSPY2werOiH0l2DvgCv37MJ3c2+Vh+H441JS5ff1sWJ75U/4go
	 9a6kFbkH5KyNEY9Wx02WiEKHZ2Sys2/0sF2eAgvI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E11EBF80630;
	Mon, 23 Nov 2020 09:55:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07121F80571; Mon, 23 Nov 2020 09:54:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E956BF804FB
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 09:54:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E956BF804FB
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F2ECDAF86;
 Mon, 23 Nov 2020 08:53:58 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 37/41] ALSA: usb-audio: Factor out the implicit feedback quirk
 code
Date: Mon, 23 Nov 2020 09:53:43 +0100
Message-Id: <20201123085347.19667-38-tiwai@suse.de>
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

The code dealing with the implicit feedback mode grew recently, and
it's becoming messy.  As we receive more and more devices that need
the similar handling, it's better to be processed through a table
instead of the open code.

This patch moves the code that is relevant with parsing the implicit
feedback mode and some helpers into another file, implicit.c.  The
detection and the setup of the implicit feedback sync EPs are
rewritten to use the ID/class matching table instead.

There should be no functional changes.

Tested-by: Keith Milner <kamilner@superlative.org>
Tested-by: Dylan Robinson <dylan_robinson@motu.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/Makefile   |   1 +
 sound/usb/implicit.c | 347 +++++++++++++++++++++++++++++++++++++++++++++++++++
 sound/usb/implicit.h |  14 +++
 sound/usb/pcm.c      | 320 +++--------------------------------------------
 4 files changed, 376 insertions(+), 306 deletions(-)
 create mode 100644 sound/usb/implicit.c
 create mode 100644 sound/usb/implicit.h

diff --git a/sound/usb/Makefile b/sound/usb/Makefile
index 56031026b113..9ccb21a4ff8a 100644
--- a/sound/usb/Makefile
+++ b/sound/usb/Makefile
@@ -8,6 +8,7 @@ snd-usb-audio-objs := 	card.o \
 			endpoint.o \
 			format.o \
 			helper.o \
+			implicit.o \
 			mixer.o \
 			mixer_quirks.o \
 			mixer_scarlett.o \
diff --git a/sound/usb/implicit.c b/sound/usb/implicit.c
new file mode 100644
index 000000000000..bc7edecff946
--- /dev/null
+++ b/sound/usb/implicit.c
@@ -0,0 +1,347 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+//
+// Special handling for implicit feedback mode
+//
+
+#include <linux/init.h>
+#include <linux/usb.h>
+#include <linux/usb/audio.h>
+#include <linux/usb/audio-v2.h>
+
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+
+#include "usbaudio.h"
+#include "card.h"
+#include "helper.h"
+#include "implicit.h"
+
+enum {
+	IMPLICIT_FB_NONE,
+	IMPLICIT_FB_FIXED,
+};
+
+struct snd_usb_implicit_fb_match {
+	unsigned int id;
+	unsigned int iface_class;
+	unsigned int ep_num;
+	unsigned int iface;
+	int type;
+};
+
+#define IMPLICIT_FB_FIXED_DEV(vend, prod, ep, ifnum) \
+	{ .id = USB_ID(vend, prod), .type = IMPLICIT_FB_FIXED, .ep_num = (ep),\
+	    .iface = (ifnum) }
+#define IMPLICIT_FB_SKIP_DEV(vend, prod) \
+	{ .id = USB_ID(vend, prod), .type = IMPLICIT_FB_NONE }
+
+/* Implicit feedback quirk table for playback */
+static const struct snd_usb_implicit_fb_match playback_implicit_fb_quirks[] = {
+	/* Fixed EP */
+	IMPLICIT_FB_FIXED_DEV(0x1397, 0x0001, 0x81, 1), /* Behringer UFX1604 */
+	IMPLICIT_FB_FIXED_DEV(0x1397, 0x0002, 0x81, 1), /* Behringer UFX1204 */
+	IMPLICIT_FB_FIXED_DEV(0x0763, 0x2080, 0x81, 2), /* M-Audio FastTrack Ultra */
+	IMPLICIT_FB_FIXED_DEV(0x0763, 0x2081, 0x81, 2), /* M-Audio FastTrack Ultra */
+	IMPLICIT_FB_FIXED_DEV(0x2466, 0x8010, 0x81, 2), /* Fractal Audio Axe-Fx III */
+	IMPLICIT_FB_FIXED_DEV(0x07fd, 0x0008, 0x81, 2), /* MOTU M Series */
+	IMPLICIT_FB_FIXED_DEV(0x31e9, 0x0001, 0x81, 2), /* Solid State Logic SSL2 */
+	IMPLICIT_FB_FIXED_DEV(0x31e9, 0x0002, 0x81, 2), /* Solid State Logic SSL2+ */
+	IMPLICIT_FB_FIXED_DEV(0x0499, 0x172f, 0x81, 2), /* Steinberg UR22C */
+	IMPLICIT_FB_FIXED_DEV(0x0d9a, 0x00df, 0x81, 2), /* RTX6001 */
+	IMPLICIT_FB_FIXED_DEV(0x0763, 0x2030, 0x81, 3), /* M-Audio Fast Track C400 */
+	IMPLICIT_FB_FIXED_DEV(0x0763, 0x2031, 0x81, 3), /* M-Audio Fast Track C600 */
+	IMPLICIT_FB_FIXED_DEV(0x22f0, 0x0006, 0x81, 3), /* Allen&Heath Qu-16 */
+	IMPLICIT_FB_FIXED_DEV(0x2b73, 0x000a, 0x82, 0), /* Pioneer DJ DJM-900NXS2 */
+	IMPLICIT_FB_FIXED_DEV(0x2b73, 0x0017, 0x82, 0), /* Pioneer DJ DJM-250MK2 */
+	IMPLICIT_FB_FIXED_DEV(0x1686, 0xf029, 0x82, 2), /* Zoom UAC-2 */
+	IMPLICIT_FB_FIXED_DEV(0x2466, 0x8003, 0x86, 2), /* Fractal Audio Axe-Fx II */
+	IMPLICIT_FB_FIXED_DEV(0x0499, 0x172a, 0x86, 2), /* Yamaha MODX */
+
+	/* Special matching */
+	{ .id = USB_ID(0x07fd, 0x0004), .iface_class = USB_CLASS_AUDIO,
+	  .type = IMPLICIT_FB_NONE },		/* MicroBook IIc */
+	/* ep = 0x84, ifnum = 0 */
+	{ .id = USB_ID(0x07fd, 0x0004), .iface_class = USB_CLASS_VENDOR_SPEC,
+	  .type = IMPLICIT_FB_FIXED,
+	  .ep_num = 0x84, .iface = 0 },		/* MOTU MicroBook II */
+
+	/* No quirk */
+	IMPLICIT_FB_SKIP_DEV(0x0582, 0x01d8),	/* BOSS Katana */
+
+	/* No quirk for playback but with capture quirk (see below) */
+	IMPLICIT_FB_SKIP_DEV(0x0582, 0x01e5),	/* BOSS GT-001 */
+
+	{} /* terminator */
+};
+
+/* Implicit feedback quirk table for capture */
+static const struct snd_usb_implicit_fb_match capture_implicit_fb_quirks[] = {
+	IMPLICIT_FB_FIXED_DEV(0x0582, 0x01e5, 0x0d, 0x01), /* BOSS GT-001 */
+
+	{} /* terminator */
+};
+
+/* set up sync EP information on the audioformat */
+static int add_implicit_fb_sync_ep(struct snd_usb_audio *chip,
+				   struct audioformat *fmt,
+				   int ep, int ifnum,
+				   const struct usb_host_interface *alts)
+{
+	struct usb_interface *iface;
+
+	if (!alts) {
+		iface = usb_ifnum_to_if(chip->dev, ifnum);
+		if (!iface || iface->num_altsetting < 2)
+			return 0;
+		alts = &iface->altsetting[1];
+	}
+
+	fmt->sync_ep = ep;
+	fmt->sync_iface = ifnum;
+	fmt->sync_altsetting = alts->desc.bAlternateSetting;
+	fmt->sync_ep_idx = 0;
+	fmt->implicit_fb = 1;
+	usb_audio_dbg(chip,
+		      "%d:%d: added %s implicit_fb sync_ep %x, iface %d:%d\n",
+		      fmt->iface, fmt->altsetting,
+		      (ep & USB_DIR_IN) ? "playback" : "capture",
+		      fmt->sync_ep, fmt->sync_iface, fmt->sync_altsetting);
+	return 1;
+}
+
+/* Check whether the given UAC2 iface:altset points to an implicit fb source */
+static int add_generic_uac2_implicit_fb(struct snd_usb_audio *chip,
+					struct audioformat *fmt,
+					unsigned int ifnum,
+					unsigned int altsetting)
+{
+	struct usb_host_interface *alts;
+	struct usb_endpoint_descriptor *epd;
+
+	alts = snd_usb_get_host_interface(chip, ifnum, altsetting);
+	if (!alts)
+		return 0;
+	if (alts->desc.bInterfaceClass != USB_CLASS_AUDIO ||
+	    alts->desc.bInterfaceSubClass != USB_SUBCLASS_AUDIOSTREAMING ||
+	    alts->desc.bInterfaceProtocol != UAC_VERSION_2 ||
+	    alts->desc.bNumEndpoints < 1)
+		return 0;
+	epd = get_endpoint(alts, 0);
+	if (!usb_endpoint_is_isoc_in(epd) ||
+	    (epd->bmAttributes & USB_ENDPOINT_USAGE_MASK) !=
+					USB_ENDPOINT_USAGE_IMPLICIT_FB)
+		return 0;
+	return add_implicit_fb_sync_ep(chip, fmt, epd->bEndpointAddress,
+				       ifnum, alts);
+}
+
+/* Like the function above, but specific to Roland with vendor class and hack */
+static int add_roland_implicit_fb(struct snd_usb_audio *chip,
+				  struct audioformat *fmt,
+				  unsigned int ifnum,
+				  unsigned int altsetting)
+{
+	struct usb_host_interface *alts;
+	struct usb_endpoint_descriptor *epd;
+
+	alts = snd_usb_get_host_interface(chip, ifnum, altsetting);
+	if (!alts)
+		return 0;
+	if (alts->desc.bInterfaceClass != USB_CLASS_VENDOR_SPEC ||
+	    (alts->desc.bInterfaceSubClass != 2 &&
+	     alts->desc.bInterfaceProtocol != 2) ||
+	    alts->desc.bNumEndpoints < 1)
+		return 0;
+	epd = get_endpoint(alts, 0);
+	if (!usb_endpoint_is_isoc_in(epd) ||
+	    (epd->bmAttributes & USB_ENDPOINT_USAGE_MASK) !=
+					USB_ENDPOINT_USAGE_IMPLICIT_FB)
+		return 0;
+	return add_implicit_fb_sync_ep(chip, fmt, epd->bEndpointAddress,
+				       ifnum, alts);
+}
+
+static const struct snd_usb_implicit_fb_match *
+find_implicit_fb_entry(struct snd_usb_audio *chip,
+		       const struct snd_usb_implicit_fb_match *match,
+		       const struct usb_host_interface *alts)
+{
+	for (; match->id; match++)
+		if (match->id == chip->usb_id &&
+		    (!match->iface_class ||
+		     (alts->desc.bInterfaceClass == match->iface_class)))
+			return match;
+
+	return NULL;
+}
+
+/* Setup an implicit feedback endpoint from a quirk. Returns 0 if no quirk
+ * applies. Returns 1 if a quirk was found.
+ */
+static int audioformat_implicit_fb_quirk(struct snd_usb_audio *chip,
+					 struct audioformat *fmt,
+					 struct usb_host_interface *alts)
+{
+	const struct snd_usb_implicit_fb_match *p;
+	unsigned int attr = fmt->ep_attr & USB_ENDPOINT_SYNCTYPE;
+
+	p = find_implicit_fb_entry(chip, playback_implicit_fb_quirks, alts);
+	if (p) {
+		switch (p->type) {
+		case IMPLICIT_FB_NONE:
+			return 0; /* No quirk */
+		case IMPLICIT_FB_FIXED:
+			return add_implicit_fb_sync_ep(chip, fmt, p->ep_num,
+						       p->iface, NULL);
+		}
+	}
+
+	/* Generic UAC2 implicit feedback */
+	if (attr == USB_ENDPOINT_SYNC_ASYNC &&
+	    alts->desc.bInterfaceClass == USB_CLASS_AUDIO &&
+	    alts->desc.bInterfaceProtocol == UAC_VERSION_2 &&
+	    alts->desc.bNumEndpoints == 1) {
+		if (add_generic_uac2_implicit_fb(chip, fmt,
+						 alts->desc.bInterfaceNumber + 1,
+						 alts->desc.bAlternateSetting))
+			return 1;
+	}
+
+	/* Roland/BOSS implicit feedback with vendor spec class */
+	if (attr == USB_ENDPOINT_SYNC_ASYNC &&
+	    alts->desc.bInterfaceClass == USB_CLASS_VENDOR_SPEC &&
+	    alts->desc.bInterfaceProtocol == 2 &&
+	    alts->desc.bNumEndpoints == 1 &&
+	    USB_ID_VENDOR(chip->usb_id) == 0x0582 /* Roland */) {
+		if (add_roland_implicit_fb(chip, fmt,
+					   alts->desc.bInterfaceNumber + 1,
+					   alts->desc.bAlternateSetting))
+			return 1;
+	}
+
+	/* No quirk */
+	return 0;
+}
+
+/* same for capture, but only handling FIXED entry */
+static int audioformat_capture_quirk(struct snd_usb_audio *chip,
+				     struct audioformat *fmt,
+				     struct usb_host_interface *alts)
+{
+	const struct snd_usb_implicit_fb_match *p;
+
+	p = find_implicit_fb_entry(chip, capture_implicit_fb_quirks, alts);
+	if (p && p->type == IMPLICIT_FB_FIXED)
+		return add_implicit_fb_sync_ep(chip, fmt, p->ep_num, p->iface,
+					       NULL);
+	return 0;
+}
+
+/*
+ * Parse altset and set up implicit feedback endpoint on the audioformat
+ */
+int snd_usb_parse_implicit_fb_quirk(struct snd_usb_audio *chip,
+				    struct audioformat *fmt,
+				    struct usb_host_interface *alts)
+{
+	if (fmt->endpoint & USB_DIR_IN)
+		return audioformat_capture_quirk(chip, fmt, alts);
+	else
+		return audioformat_implicit_fb_quirk(chip, fmt, alts);
+}
+
+/*
+ * Return the score of matching two audioformats.
+ * Veto the audioformat if:
+ * - It has no channels for some reason.
+ * - Requested PCM format is not supported.
+ * - Requested sample rate is not supported.
+ */
+static int match_endpoint_audioformats(struct snd_usb_substream *subs,
+				       const struct audioformat *fp,
+				       int rate, int channels,
+				       snd_pcm_format_t pcm_format)
+{
+	int i, score;
+
+	if (fp->channels < 1)
+		return 0;
+
+	if (!(fp->formats & pcm_format_to_bits(pcm_format)))
+		return 0;
+
+	if (fp->rates & SNDRV_PCM_RATE_CONTINUOUS) {
+		if (rate < fp->rate_min || rate > fp->rate_max)
+			return 0;
+	} else {
+		for (i = 0; i < fp->nr_rates; i++) {
+			if (fp->rate_table[i] == rate)
+				break;
+		}
+		if (i >= fp->nr_rates)
+			return 0;
+	}
+
+	score = 1;
+	if (fp->channels == channels)
+		score++;
+
+	return score;
+}
+
+static struct snd_usb_substream *
+find_matching_substream(struct snd_usb_audio *chip, int stream, int ep_num,
+			int fmt_type)
+{
+	struct snd_usb_stream *as;
+	struct snd_usb_substream *subs;
+
+	list_for_each_entry(as, &chip->pcm_list, list) {
+		subs = &as->substream[stream];
+		if (as->fmt_type == fmt_type && subs->ep_num == ep_num)
+			return subs;
+	}
+
+	return NULL;
+}
+
+/*
+ * Return the audioformat that is suitable for the implicit fb
+ */
+const struct audioformat *
+snd_usb_find_implicit_fb_sync_format(struct snd_usb_audio *chip,
+				     const struct audioformat *target,
+				     const struct snd_pcm_hw_params *params,
+				     int stream)
+{
+	struct snd_usb_substream *subs;
+	const struct audioformat *fp, *sync_fmt;
+	int score, high_score;
+
+	/* When sharing the same altset, use the original audioformat */
+	if (target->iface == target->sync_iface &&
+	    target->altsetting == target->sync_altsetting)
+		return target;
+
+	subs = find_matching_substream(chip, stream, target->sync_ep,
+				       target->fmt_type);
+	if (!subs)
+		return NULL;
+
+	sync_fmt = NULL;
+	high_score = 0;
+	list_for_each_entry(fp, &subs->fmt_list, list) {
+		score = match_endpoint_audioformats(subs, fp,
+						    params_rate(params),
+						    params_channels(params),
+						    params_format(params));
+		if (score > high_score) {
+			sync_fmt = fp;
+			high_score = score;
+		}
+	}
+
+	return sync_fmt;
+}
+
diff --git a/sound/usb/implicit.h b/sound/usb/implicit.h
new file mode 100644
index 000000000000..ccb415a0ea86
--- /dev/null
+++ b/sound/usb/implicit.h
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0
+#ifndef __USBAUDIO_IMPLICIT_H
+#define __USBAUDIO_IMPLICIT_H
+
+int snd_usb_parse_implicit_fb_quirk(struct snd_usb_audio *chip,
+				    struct audioformat *fmt,
+				    struct usb_host_interface *alts);
+const struct audioformat *
+snd_usb_find_implicit_fb_sync_format(struct snd_usb_audio *chip,
+				     const struct audioformat *target,
+				     const struct snd_pcm_hw_params *params,
+				     int stream);
+
+#endif /* __USBAUDIO_IMPLICIT_H */
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 676acc20595b..56079901769f 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -23,6 +23,7 @@
 #include "clock.h"
 #include "power.h"
 #include "media.h"
+#include "implicit.h"
 
 #define SUBSTREAM_FLAG_DATA_EP_STARTED	0
 #define SUBSTREAM_FLAG_SYNC_EP_STARTED	1
@@ -276,211 +277,7 @@ static int snd_usb_pcm_sync_stop(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-/* Check whether the given iface:altsetting points to an implicit fb source */
-static bool search_generic_implicit_fb(struct snd_usb_audio *chip, int ifnum,
-				       unsigned int altsetting,
-				       struct usb_host_interface **altsp,
-				       unsigned int *ep)
-{
-	struct usb_host_interface *alts;
-	struct usb_interface_descriptor *altsd;
-	struct usb_endpoint_descriptor *epd;
-
-	alts = snd_usb_get_host_interface(chip, ifnum, altsetting);
-	if (!alts)
-		return false;
-	altsd = get_iface_desc(alts);
-	if (altsd->bInterfaceClass != USB_CLASS_AUDIO ||
-	    altsd->bInterfaceSubClass != USB_SUBCLASS_AUDIOSTREAMING ||
-	    altsd->bInterfaceProtocol != UAC_VERSION_2 ||
-	    altsd->bNumEndpoints < 1)
-		return false;
-	epd = get_endpoint(alts, 0);
-	if (!usb_endpoint_is_isoc_in(epd) ||
-	    (epd->bmAttributes & USB_ENDPOINT_USAGE_MASK) !=
-					USB_ENDPOINT_USAGE_IMPLICIT_FB)
-		return false;
-	*ep = epd->bEndpointAddress;
-	*altsp = alts;
-	return true;
-}
-
-/* Like the function above, but specific to Roland with vendor class and hack */
-static bool search_roland_implicit_fb(struct snd_usb_audio *chip, int ifnum,
-				      unsigned int altsetting,
-				      struct usb_host_interface **altsp,
-				      unsigned int *ep)
-{
-	struct usb_host_interface *alts;
-	struct usb_interface_descriptor *altsd;
-	struct usb_endpoint_descriptor *epd;
-
-	alts = snd_usb_get_host_interface(chip, ifnum, altsetting);
-	if (!alts)
-		return false;
-	altsd = get_iface_desc(alts);
-	if (altsd->bInterfaceClass != USB_CLASS_VENDOR_SPEC ||
-	    (altsd->bInterfaceSubClass != 2 &&
-	     altsd->bInterfaceProtocol != 2) ||
-	    altsd->bNumEndpoints < 1)
-		return false;
-	epd = get_endpoint(alts, 0);
-	if (!usb_endpoint_is_isoc_in(epd) ||
-	    (epd->bmAttributes & USB_ENDPOINT_USAGE_MASK) !=
-					USB_ENDPOINT_USAGE_IMPLICIT_FB)
-		return false;
-	*ep = epd->bEndpointAddress;
-	*altsp = alts;
-	return true;
-}
-
-/* Setup an implicit feedback endpoint from a quirk. Returns 0 if no quirk
- * applies. Returns 1 if a quirk was found.
- */
-static int audioformat_implicit_fb_quirk(struct snd_usb_audio *chip,
-					 struct audioformat *fmt,
-					 struct usb_host_interface *alts)
-{
-	struct usb_device *dev = chip->dev;
-	struct usb_interface_descriptor *altsd = get_iface_desc(alts);
-	struct usb_interface *iface;
-	unsigned int attr = fmt->ep_attr & USB_ENDPOINT_SYNCTYPE;
-	unsigned int ep;
-	unsigned int ifnum;
-
-	switch (chip->usb_id) {
-	case USB_ID(0x0763, 0x2030): /* M-Audio Fast Track C400 */
-	case USB_ID(0x0763, 0x2031): /* M-Audio Fast Track C600 */
-	case USB_ID(0x22f0, 0x0006): /* Allen&Heath Qu-16 */
-		ep = 0x81;
-		ifnum = 3;
-		goto add_sync_ep_from_ifnum;
-	case USB_ID(0x0763, 0x2080): /* M-Audio FastTrack Ultra */
-	case USB_ID(0x0763, 0x2081):
-		ep = 0x81;
-		ifnum = 2;
-		goto add_sync_ep_from_ifnum;
-	case USB_ID(0x2466, 0x8003): /* Fractal Audio Axe-Fx II */
-	case USB_ID(0x0499, 0x172a): /* Yamaha MODX */
-		ep = 0x86;
-		ifnum = 2;
-		goto add_sync_ep_from_ifnum;
-	case USB_ID(0x2466, 0x8010): /* Fractal Audio Axe-Fx III */
-		ep = 0x81;
-		ifnum = 2;
-		goto add_sync_ep_from_ifnum;
-	case USB_ID(0x1686, 0xf029): /* Zoom UAC-2 */
-		ep = 0x82;
-		ifnum = 2;
-		goto add_sync_ep_from_ifnum;
-	case USB_ID(0x1397, 0x0001): /* Behringer UFX1604 */
-	case USB_ID(0x1397, 0x0002): /* Behringer UFX1204 */
-		ep = 0x81;
-		ifnum = 1;
-		goto add_sync_ep_from_ifnum;
-	case USB_ID(0x07fd, 0x0004): /* MOTU MicroBook II/IIc */
-		/* MicroBook IIc */
-		if (altsd->bInterfaceClass == USB_CLASS_AUDIO)
-			return 0;
-
-		/* MicroBook II */
-		ep = 0x84;
-		ifnum = 0;
-		goto add_sync_ep_from_ifnum;
-	case USB_ID(0x07fd, 0x0008): /* MOTU M Series */
-	case USB_ID(0x31e9, 0x0001): /* Solid State Logic SSL2 */
-	case USB_ID(0x31e9, 0x0002): /* Solid State Logic SSL2+ */
-	case USB_ID(0x0499, 0x172f): /* Steinberg UR22C */
-	case USB_ID(0x0d9a, 0x00df): /* RTX6001 */
-		ep = 0x81;
-		ifnum = 2;
-		goto add_sync_ep_from_ifnum;
-	case USB_ID(0x2b73, 0x000a): /* Pioneer DJ DJM-900NXS2 */
-	case USB_ID(0x2b73, 0x0017): /* Pioneer DJ DJM-250MK2 */
-		ep = 0x82;
-		ifnum = 0;
-		goto add_sync_ep_from_ifnum;
-	case USB_ID(0x0582, 0x01d8): /* BOSS Katana */
-		/* BOSS Katana amplifiers do not need quirks */
-		return 0;
-	case USB_ID(0x0582, 0x01e5): /* BOSS GT-001 */
-		/* BOSS GT-001 needs no implicit fb for playback */
-		return 0;
-	}
-
-	/* Generic UAC2 implicit feedback */
-	if (attr == USB_ENDPOINT_SYNC_ASYNC &&
-	    altsd->bInterfaceClass == USB_CLASS_AUDIO &&
-	    altsd->bInterfaceProtocol == UAC_VERSION_2 &&
-	    altsd->bNumEndpoints == 1) {
-		ifnum = altsd->bInterfaceNumber + 1;
-		if (search_generic_implicit_fb(chip, ifnum,
-					       altsd->bAlternateSetting,
-					       &alts, &ep))
-			goto add_sync_ep;
-	}
-
-	/* Roland/BOSS implicit feedback with vendor spec class */
-	if (attr == USB_ENDPOINT_SYNC_ASYNC &&
-	    altsd->bInterfaceClass == USB_CLASS_VENDOR_SPEC &&
-	    altsd->bInterfaceProtocol == 2 &&
-	    altsd->bNumEndpoints == 1 &&
-	    USB_ID_VENDOR(chip->usb_id) == 0x0582 /* Roland */) {
-		ifnum = altsd->bInterfaceNumber + 1;
-		if (search_roland_implicit_fb(chip, ifnum,
-					      altsd->bAlternateSetting,
-					      &alts, &ep))
-			goto add_sync_ep;
-	}
-
-	/* No quirk */
-	return 0;
-
-add_sync_ep_from_ifnum:
-	iface = usb_ifnum_to_if(dev, ifnum);
-
-	if (!iface || iface->num_altsetting < 2)
-		return 0;
-
-	alts = &iface->altsetting[1];
-
-add_sync_ep:
-	fmt->sync_ep = ep;
-	fmt->sync_iface = ifnum;
-	fmt->sync_altsetting = alts->desc.bAlternateSetting;
-	fmt->sync_ep_idx = 0;
-	fmt->implicit_fb = 1;
-	dev_dbg(&dev->dev, "%d:%d: found implicit_fb sync_ep=%x, iface=%d, alt=%d\n",
-		fmt->iface, fmt->altsetting, fmt->sync_ep, fmt->sync_iface,
-		fmt->sync_altsetting);
-
-	return 1;
-}
-
-static int audioformat_capture_quirk(struct snd_usb_audio *chip,
-				     struct audioformat *fmt,
-				     struct usb_host_interface *alts)
-{
-	struct usb_device *dev = chip->dev;
-
-	switch (chip->usb_id) {
-	case USB_ID(0x0582, 0x01e5): /* BOSS GT-001 */
-		if (!snd_usb_get_host_interface(chip, 0x01, 0x01))
-			return 0;
-		fmt->sync_ep = 0x0d;
-		fmt->sync_iface = 0x01;
-		fmt->sync_altsetting = 0x01;
-		fmt->sync_ep_idx = 0;
-		fmt->implicit_fb = 1;
-		dev_dbg(&dev->dev, "%d:%d: added fake capture sync sync_ep=%x, iface=%d, alt=%d\n",
-			fmt->iface, fmt->altsetting, fmt->sync_ep, fmt->sync_iface,
-			fmt->sync_altsetting);
-		return 1;
-	}
-	return 0;
-
-}
-
+/* Set up sync endpoint */
 int snd_usb_audioformat_set_sync_ep(struct snd_usb_audio *chip,
 				    struct audioformat *fmt)
 {
@@ -496,20 +293,18 @@ int snd_usb_audioformat_set_sync_ep(struct snd_usb_audio *chip,
 		return 0;
 	altsd = get_iface_desc(alts);
 
-	is_playback = !(get_endpoint(alts, 0)->bEndpointAddress & USB_DIR_IN);
-	if (is_playback) {
-		err = audioformat_implicit_fb_quirk(chip, fmt, alts);
-		if (err > 0)
-			return 0;
-	} else {
-		err = audioformat_capture_quirk(chip, fmt, alts);
-		if (err > 0)
-			return 0;
-	}
+	err = snd_usb_parse_implicit_fb_quirk(chip, fmt, alts);
+	if (err > 0)
+		return 0; /* matched */
+
+	/*
+	 * Generic sync EP handling
+	 */
 
 	if (altsd->bNumEndpoints < 2)
 		return 0;
 
+	is_playback = !(get_endpoint(alts, 0)->bEndpointAddress & USB_DIR_IN);
 	attr = fmt->ep_attr & USB_ENDPOINT_SYNCTYPE;
 	if ((is_playback && (attr == USB_ENDPOINT_SYNC_SYNC ||
 			     attr == USB_ENDPOINT_SYNC_ADAPTIVE)) ||
@@ -569,45 +364,6 @@ int snd_usb_audioformat_set_sync_ep(struct snd_usb_audio *chip,
 	return 0;
 }
 
-/*
- * Return the score of matching two audioformats.
- * Veto the audioformat if:
- * - It has no channels for some reason.
- * - Requested PCM format is not supported.
- * - Requested sample rate is not supported.
- */
-static int match_endpoint_audioformats(struct snd_usb_substream *subs,
-				       const struct audioformat *fp,
-				       int rate, int channels,
-				       snd_pcm_format_t pcm_format)
-{
-	int i, score;
-
-	if (fp->channels < 1)
-		return 0;
-
-	if (!(fp->formats & pcm_format_to_bits(pcm_format)))
-		return 0;
-
-	if (fp->rates & SNDRV_PCM_RATE_CONTINUOUS) {
-		if (rate < fp->rate_min || rate > fp->rate_max)
-			return 0;
-	} else {
-		for (i = 0; i < fp->nr_rates; i++) {
-			if (fp->rate_table[i] == rate)
-				break;
-		}
-		if (i >= fp->nr_rates)
-			return 0;
-	}
-
-	score = 1;
-	if (fp->channels == channels)
-		score++;
-
-	return score;
-}
-
 static int snd_usb_pcm_change_state(struct snd_usb_substream *subs, int state)
 {
 	int ret;
@@ -656,53 +412,6 @@ int snd_usb_pcm_resume(struct snd_usb_stream *as)
 	return 0;
 }
 
-static struct snd_usb_substream *
-find_matching_substream(struct snd_usb_audio *chip, int stream, int ep_num,
-			int fmt_type)
-{
-	struct snd_usb_stream *as;
-	struct snd_usb_substream *subs;
-
-	list_for_each_entry(as, &chip->pcm_list, list) {
-		subs = &as->substream[stream];
-		if (as->fmt_type == fmt_type && subs->ep_num == ep_num)
-			return subs;
-	}
-
-	return NULL;
-}
-
-static const struct audioformat *
-find_implicit_fb_sync_format(struct snd_usb_audio *chip,
-			     const struct audioformat *target,
-			     const struct snd_pcm_hw_params *params,
-			     int stream)
-{
-	struct snd_usb_substream *subs;
-	const struct audioformat *fp, *sync_fmt;
-	int score, high_score;
-
-	subs = find_matching_substream(chip, stream, target->sync_ep,
-				       target->fmt_type);
-	if (!subs)
-		return NULL;
-
-	sync_fmt = NULL;
-	high_score = 0;
-	list_for_each_entry(fp, &subs->fmt_list, list) {
-		score = match_endpoint_audioformats(subs, fp,
-						    params_rate(params),
-						    params_channels(params),
-						    params_format(params));
-		if (score > high_score) {
-			sync_fmt = fp;
-			high_score = score;
-		}
-	}
-
-	return sync_fmt;
-}
-
 static void close_endpoints(struct snd_usb_audio *chip,
 			    struct snd_usb_substream *subs)
 {
@@ -775,11 +484,10 @@ static int snd_usb_hw_params(struct snd_pcm_substream *substream,
 		goto stop_pipeline;
 	}
 
-	if (fmt->implicit_fb &&
-	    (fmt->iface != fmt->sync_iface ||
-	     fmt->altsetting != fmt->sync_altsetting)) {
-		sync_fmt = find_implicit_fb_sync_format(chip, fmt, hw_params,
-							!substream->stream);
+	if (fmt->implicit_fb) {
+		sync_fmt = snd_usb_find_implicit_fb_sync_format(chip, fmt,
+								hw_params,
+								!substream->stream);
 		if (!sync_fmt) {
 			usb_audio_dbg(chip,
 				      "cannot find sync format: ep=0x%x, iface=%d:%d, format=%s, rate=%d, channels=%d\n",
-- 
2.16.4

