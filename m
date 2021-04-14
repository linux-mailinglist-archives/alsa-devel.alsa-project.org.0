Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFA535EF89
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Apr 2021 10:34:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E545616DE;
	Wed, 14 Apr 2021 10:33:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E545616DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618389285;
	bh=HjBHgCUekLvnfDTJiEKo7n5oFzpgP14DpN6AsCqQ6zg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tP3GH7DQvr3CJ1AKapEcyFqAzTws5aAwgKiKSeVvrvodQw/Vc26fCkbEJDUxrVrgv
	 gjIIabKEMGzTcOMnOW20YBeAn0Z3XQZsNH1fkhKq4fFIkEVYFOtfTVxi3TgBvKTX3H
	 KwtHlzP+VZ5EPzlg087A1Rc3VS19zNEA9yvrPjI4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4215FF80271;
	Wed, 14 Apr 2021 10:33:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D5DCF80269; Wed, 14 Apr 2021 10:33:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8490FF800FF
 for <alsa-devel@alsa-project.org>; Wed, 14 Apr 2021 10:33:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8490FF800FF
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 535CFAD09;
 Wed, 14 Apr 2021 08:33:00 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Apply implicit feedback mode for BOSS devices
Date: Wed, 14 Apr 2021 10:32:55 +0200
Message-Id: <20210414083255.9527-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Mike Oliphant <oliphant@nostatic.org>,
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

During the recent rewrite of the implicit feedback support, we've
tested to apply the implicit fb on BOSS devices, but it failed, as the
capture stream didn't start without the playback.  As the end result,
it got another type of quirk for tying both streams but starts
playback always (commit 6234fdc1cede "ALSA: usb-audio: Quirk for BOSS
GT-001").

Meanwhile, Mike Oliphant has tested the real implicit feedback mode
for the playback again with the latest code, and found out that it
actually works if the initial feedback sync is skipped; that is, on
those BOSS devices, the playback stream has to be started at first
without waiting for the capture URB completions.  Otherwise it gets
stuck.  In the rest operations after the capture stream processed, we
can take them as the implicit feedback source.

This patch is an attempt to improve the support for BOSS devices with
the implicit feedback mode in the way described above.  It adds a new
flag to snd_usb_audio, playback_first, indicating that the playback
stream starts without sync with the initial capture completion.  This
flag is set in the quirk table with the new IMPLICIT_FB_BOTH type.

Reported-and-tested-by: Mike Oliphant <oliphant@nostatic.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/endpoint.c |  3 ++-
 sound/usb/implicit.c | 35 +++++++++++++++++++++++------------
 sound/usb/usbaudio.h |  1 +
 3 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 102d53515a76..f4c3d2b38abb 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -1375,7 +1375,8 @@ int snd_usb_endpoint_start(struct snd_usb_endpoint *ep)
 	if (!ep_state_update(ep, EP_STATE_STOPPED, EP_STATE_RUNNING))
 		goto __error;
 
-	if (snd_usb_endpoint_implicit_feedback_sink(ep)) {
+	if (snd_usb_endpoint_implicit_feedback_sink(ep) &&
+	    !ep->chip->playback_first) {
 		for (i = 0; i < ep->nurbs; i++) {
 			struct snd_urb_ctx *ctx = ep->urb + i;
 			list_add_tail(&ctx->ready_list, &ep->ready_playback_urbs);
diff --git a/sound/usb/implicit.c b/sound/usb/implicit.c
index 19622c58b72b..4bd9c105a529 100644
--- a/sound/usb/implicit.c
+++ b/sound/usb/implicit.c
@@ -21,6 +21,7 @@ enum {
 	IMPLICIT_FB_NONE,
 	IMPLICIT_FB_GENERIC,
 	IMPLICIT_FB_FIXED,
+	IMPLICIT_FB_BOTH,	/* generic playback + capture (for BOSS) */
 };
 
 struct snd_usb_implicit_fb_match {
@@ -36,6 +37,9 @@ struct snd_usb_implicit_fb_match {
 #define IMPLICIT_FB_FIXED_DEV(vend, prod, ep, ifnum) \
 	{ .id = USB_ID(vend, prod), .type = IMPLICIT_FB_FIXED, .ep_num = (ep),\
 	    .iface = (ifnum) }
+#define IMPLICIT_FB_BOTH_DEV(vend, prod, ep, ifnum) \
+	{ .id = USB_ID(vend, prod), .type = IMPLICIT_FB_BOTH, .ep_num = (ep),\
+	    .iface = (ifnum) }
 #define IMPLICIT_FB_SKIP_DEV(vend, prod) \
 	{ .id = USB_ID(vend, prod), .type = IMPLICIT_FB_NONE }
 
@@ -75,14 +79,14 @@ static const struct snd_usb_implicit_fb_match playback_implicit_fb_quirks[] = {
 
 /* Implicit feedback quirk table for capture: only FIXED type */
 static const struct snd_usb_implicit_fb_match capture_implicit_fb_quirks[] = {
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x0130, 0x0d, 0x01), /* BOSS BR-80 */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x0171, 0x0d, 0x01), /* BOSS RC-505 */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x0185, 0x0d, 0x01), /* BOSS GP-10 */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x0189, 0x0d, 0x01), /* BOSS GT-100v2 */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x01d6, 0x0d, 0x01), /* BOSS GT-1 */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x01d8, 0x0d, 0x01), /* BOSS Katana */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x01e5, 0x0d, 0x01), /* BOSS GT-001 */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x0203, 0x0d, 0x01), /* BOSS AD-10 */
+	IMPLICIT_FB_BOTH_DEV(0x0582, 0x0130, 0x0d, 0x01), /* BOSS BR-80 */
+	IMPLICIT_FB_BOTH_DEV(0x0582, 0x0171, 0x0d, 0x01), /* BOSS RC-505 */
+	IMPLICIT_FB_BOTH_DEV(0x0582, 0x0185, 0x0d, 0x01), /* BOSS GP-10 */
+	IMPLICIT_FB_BOTH_DEV(0x0582, 0x0189, 0x0d, 0x01), /* BOSS GT-100v2 */
+	IMPLICIT_FB_BOTH_DEV(0x0582, 0x01d6, 0x0d, 0x01), /* BOSS GT-1 */
+	IMPLICIT_FB_BOTH_DEV(0x0582, 0x01d8, 0x0d, 0x01), /* BOSS Katana */
+	IMPLICIT_FB_BOTH_DEV(0x0582, 0x01e5, 0x0d, 0x01), /* BOSS GT-001 */
+	IMPLICIT_FB_BOTH_DEV(0x0582, 0x0203, 0x0d, 0x01), /* BOSS AD-10 */
 
 	{} /* terminator */
 };
@@ -268,10 +272,17 @@ static int audioformat_implicit_fb_quirk(struct snd_usb_audio *chip,
 		}
 	}
 
-	/* Don't apply playback quirks for the devices with capture quirk */
+	/* Special handling for devices with capture quirks */
 	p = find_implicit_fb_entry(chip, capture_implicit_fb_quirks, alts);
-	if (p && p->type == IMPLICIT_FB_FIXED)
-		return 0; /* no quirk */
+	if (p) {
+		switch (p->type) {
+		case IMPLICIT_FB_FIXED:
+			return 0; /* no quirk */
+		case IMPLICIT_FB_BOTH:
+			chip->playback_first = 1;
+			return add_generic_implicit_fb(chip, fmt, alts);
+		}
+	}
 
 	/* Generic UAC2 implicit feedback */
 	if (attr == USB_ENDPOINT_SYNC_ASYNC &&
@@ -321,7 +332,7 @@ static int audioformat_capture_quirk(struct snd_usb_audio *chip,
 	const struct snd_usb_implicit_fb_match *p;
 
 	p = find_implicit_fb_entry(chip, capture_implicit_fb_quirks, alts);
-	if (p && p->type == IMPLICIT_FB_FIXED)
+	if (p && (p->type == IMPLICIT_FB_FIXED || p->type == IMPLICIT_FB_BOTH))
 		return add_implicit_fb_sync_ep(chip, fmt, p->ep_num, 0,
 					       p->iface, NULL);
 	return 0;
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index a536ee33d36e..538831cbd925 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -37,6 +37,7 @@ struct snd_usb_audio {
 	unsigned int txfr_quirk:1; /* Subframe boundaries on transfers */
 	unsigned int tx_length_quirk:1; /* Put length specifier in transfers */
 	unsigned int need_delayed_register:1; /* warn for delayed registration */
+	unsigned int playback_first:1;	/* for implicit fb: don't wait for the first capture URBs */
 	int num_interfaces;
 	int num_suspended_intf;
 	int sample_rate_read_error;
-- 
2.26.2

