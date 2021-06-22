Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF753B0B04
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Jun 2021 19:02:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66F22166E;
	Tue, 22 Jun 2021 19:01:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66F22166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624381355;
	bh=pz/ux5V8UC0Xrqj0XkIZjjbz8X2oljWdFEzP+cyQd6k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XVj+pFRrlm6o0z3bbyUun29tnGBqidQJLNeLC0U31BN53its9l+skZL20HrAYXNMr
	 2gzj9949tqa1p3n/oDx8dT/HAxFDZrpmQ0ZfEc0E5Gpabcy1Y6ZrIwNM0qTvitNXKb
	 QDwbFgbQ1hO+/RRW2tVDDtzNTHbkPMeVUXbCa1us=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5081F804B4;
	Tue, 22 Jun 2021 19:01:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4014AF80161; Tue, 22 Jun 2021 19:01:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20FC3F800E1
 for <alsa-devel@alsa-project.org>; Tue, 22 Jun 2021 19:00:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20FC3F800E1
Received: by m.b4.vu (Postfix, from userid 1000)
 id B7A1061E286D; Wed, 23 Jun 2021 02:30:49 +0930 (ACST)
Date: Wed, 23 Jun 2021 02:30:49 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 01/17] ALSA: usb-audio: scarlett2: Fix wrong resume call
Message-ID: <49721219f45b7e175e729b0d9d9c142fd8f4342a.1624379707.git.g@b4.vu>
References: <cover.1624379707.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1624379707.git.g@b4.vu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Hin-Tak Leung <htl10@users.sourceforge.net>,
 Vladimir Sadovnikov <sadko4u@gmail.com>
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

From: Takashi Iwai <tiwai@suse.de>

The current way of the scarlett2 mixer code managing the
usb_mixer_elem_info object is wrong in two ways: it passes its
internal index to the head.id field, and the val_type field is
uninitialized.  This ended up with the wrong execution at the resume
because a bogus unit id is passed wrongly.  Also, in the later code
extensions, we'll have more mixer elements, and passing the index will
overflow the unit id size (of 256).

This patch corrects those issues.  It introduces a new value type,
USB_MIXER_BESPOKEN, which indicates a non-standard mixer element, and
use this type for all scarlett2 mixer elements, as well as
initializing the fixed unit id 0 for avoiding the overflow.

Tested-by: Geoffrey D. Bennett <g@b4.vu>
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer.c               | 3 +++
 sound/usb/mixer.h               | 1 +
 sound/usb/mixer_scarlett_gen2.c | 7 ++++++-
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 428d581f988f..0f578dabd094 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -3605,6 +3605,9 @@ static int restore_mixer_value(struct usb_mixer_elem_list *list)
 	struct usb_mixer_elem_info *cval = mixer_elem_list_to_info(list);
 	int c, err, idx;
 
+	if (cval->val_type == USB_MIXER_BESPOKEN)
+		return 0;
+
 	if (cval->cmask) {
 		idx = 0;
 		for (c = 0; c < MAX_CHANNELS; c++) {
diff --git a/sound/usb/mixer.h b/sound/usb/mixer.h
index e5a01f17bf3c..ea41e7a1f7bf 100644
--- a/sound/usb/mixer.h
+++ b/sound/usb/mixer.h
@@ -55,6 +55,7 @@ enum {
 	USB_MIXER_U16,
 	USB_MIXER_S32,
 	USB_MIXER_U32,
+	USB_MIXER_BESPOKEN,	/* non-standard type */
 };
 
 typedef void (*usb_mixer_elem_dump_func_t)(struct snd_info_buffer *buffer,
diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index dde008ea21d7..c4689c401d6e 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -1136,10 +1136,15 @@ static int scarlett2_add_new_ctl(struct usb_mixer_interface *mixer,
 	if (!elem)
 		return -ENOMEM;
 
+	/* We set USB_MIXER_BESPOKEN type, so that the core USB mixer code
+	 * ignores them for resume and other operations.
+	 * Also, the head.id field is set to 0, as we don't use this field.
+	 */
 	elem->head.mixer = mixer;
 	elem->control = index;
-	elem->head.id = index;
+	elem->head.id = 0;
 	elem->channels = channels;
+	elem->val_type = USB_MIXER_BESPOKEN;
 
 	kctl = snd_ctl_new1(ncontrol, elem);
 	if (!kctl) {
-- 
2.31.1

