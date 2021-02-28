Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F71F327180
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Feb 2021 09:03:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C066166C;
	Sun, 28 Feb 2021 09:02:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C066166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614499402;
	bh=lto5AwqbkRyjeZjAhD0d0q/2E5cQc7XB8l+siS78hi0=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nFiz1vqra/LpGah5H8wDgrA4TccH3JB4r8bRXqBsiSgbB0ajIu34WQrHDJme21kOL
	 663LLiDPA6OYghxErxEL6eJfW/lmE71woBOtV7RLnd70T8vo64rNaitH5mm92ITXCT
	 BzW5HovoLNMGXny81PjzWBjz+e71n8YIGHe3sL3U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD3F9F80269;
	Sun, 28 Feb 2021 09:01:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 047ABF8025B; Sun, 28 Feb 2021 09:01:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABDC5F800E0
 for <alsa-devel@alsa-project.org>; Sun, 28 Feb 2021 09:01:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABDC5F800E0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CF1ECAB8C
 for <alsa-devel@alsa-project.org>; Sun, 28 Feb 2021 08:01:39 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Allow modifying parameters with succeeding
 hw_params calls
Date: Sun, 28 Feb 2021 09:01:38 +0100
Message-Id: <20210228080138.9936-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The recent fix for the hw constraints for implicit feedback streams
via commit e4ea77f8e53f ("ALSA: usb-audio: Always apply the hw
constraints for implicit fb sync") added the check of the matching
endpoints and whether those EPs are already opened.  This is needed
and correct, per se, even for the normal streams without the implicit
feedback, as the endpoint setup is exclusive.

However, it's reported that there seem applications that behave in
unexpected ways to update the hw_params without clearing the previous
setup via hw_free, and those hit a problem now: then hw_params is
called with still the previous EP setup kept, hence it's restricted
with the previous own setup.  Although the obvious fix is to call
snd_pcm_hw_free() API in the application side, it's a kind of
unwelcome change.

This patch tries to ease the situation: in the endpoint check, we add
a couple of more conditions and now skip the endpoint that is being
used only by the stream in question itself.  That is, in addition to
the presence check of ep (ep->cur_audiofmt is non-NULL), when the
following conditions are met, we skip such an ep:
- ep->opened == 1, and
- ep->cur_audiofmt == subs->cur_audiofmt.

subs->cur_audiofmt is non-NULL only if it's a re-setup of hw_params,
and ep->cur_audiofmt points to the currently set up parameters.  So if
those match, it must be this stream itself.

Fixes: e4ea77f8e53f ("ALSA: usb-audio: Always apply the hw constraints for implicit fb sync")
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=211941
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/pcm.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index bf5a0f3c1fad..e5311b6bb3f6 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -845,13 +845,19 @@ get_sync_ep_from_substream(struct snd_usb_substream *subs)
 
 	list_for_each_entry(fp, &subs->fmt_list, list) {
 		ep = snd_usb_get_endpoint(chip, fp->endpoint);
-		if (ep && ep->cur_rate)
-			return ep;
+		if (ep && ep->cur_audiofmt) {
+			/* if EP is already opened solely for this substream,
+			 * we still allow us to change the parameter; otherwise
+			 * this substream has to follow the existing parameter
+			 */
+			if (ep->cur_audiofmt != subs->cur_audiofmt || ep->opened > 1)
+				return ep;
+		}
 		if (!fp->implicit_fb)
 			continue;
 		/* for the implicit fb, check the sync ep as well */
 		ep = snd_usb_get_endpoint(chip, fp->sync_ep);
-		if (ep && ep->cur_rate)
+		if (ep && ep->cur_audiofmt)
 			return ep;
 	}
 	return NULL;
-- 
2.26.2

