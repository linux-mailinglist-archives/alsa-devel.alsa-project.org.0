Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96128355277
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Apr 2021 13:40:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 257131654;
	Tue,  6 Apr 2021 13:39:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 257131654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617709218;
	bh=K7BNh/3Zfv5ZIO+wuAGtRdVz41gXrxzJwpCfGUBmHO4=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=K9+SByZdoADL2QV5XmDwYaWFg0PjUJMQfE7eh0kU55ZAbKr2ADDf8PyOhBd6PDaO0
	 GFAIGgTYdX2hY1Ki+xMLyT6++vDAZl9TKymKB7+bcRXMRTfEXO/4q/Ei1UoNCa/luO
	 5NPf3I0CI0pqJ5Sn9XXFuffrdfqIYWdj8IM7Vi10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71E88F80246;
	Tue,  6 Apr 2021 13:38:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 748F7F8020B; Tue,  6 Apr 2021 13:38:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7EF88F800E3
 for <alsa-devel@alsa-project.org>; Tue,  6 Apr 2021 13:38:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EF88F800E3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DF3B2B15B
 for <alsa-devel@alsa-project.org>; Tue,  6 Apr 2021 11:38:38 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Drop implicit fb quirk entries dubbed for
 capture
Date: Tue,  6 Apr 2021 13:38:37 +0200
Message-Id: <20210406113837.32041-1-tiwai@suse.de>
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

The implicit feedback quirk table contains the entries that also
appear in the capture quirks, and those are all handled to be
skipped.  For the code simplicity, drop the duped entries in the
playback quirk table, and check the match with the capture quirk table
instead.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=212519
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/implicit.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/usb/implicit.c b/sound/usb/implicit.c
index 11a85e66aa96..19622c58b72b 100644
--- a/sound/usb/implicit.c
+++ b/sound/usb/implicit.c
@@ -70,16 +70,6 @@ static const struct snd_usb_implicit_fb_match playback_implicit_fb_quirks[] = {
 	  .type = IMPLICIT_FB_FIXED,
 	  .ep_num = 0x84, .iface = 0 },		/* MOTU MicroBook II */
 
-	/* No quirk for playback but with capture quirk (see below) */
-	IMPLICIT_FB_SKIP_DEV(0x0582, 0x0130),	/* BOSS BR-80 */
-	IMPLICIT_FB_SKIP_DEV(0x0582, 0x0171),   /* BOSS RC-505 */
-	IMPLICIT_FB_SKIP_DEV(0x0582, 0x0185),	/* BOSS GP-10 */
-	IMPLICIT_FB_SKIP_DEV(0x0582, 0x0189),	/* BOSS GT-100v2 */
-	IMPLICIT_FB_SKIP_DEV(0x0582, 0x01d6),	/* BOSS GT-1 */
-	IMPLICIT_FB_SKIP_DEV(0x0582, 0x01d8),	/* BOSS Katana */
-	IMPLICIT_FB_SKIP_DEV(0x0582, 0x01e5),	/* BOSS GT-001 */
-	IMPLICIT_FB_SKIP_DEV(0x0582, 0x0203),   /* BOSS AD-10 */
-
 	{} /* terminator */
 };
 
@@ -278,6 +268,11 @@ static int audioformat_implicit_fb_quirk(struct snd_usb_audio *chip,
 		}
 	}
 
+	/* Don't apply playback quirks for the devices with capture quirk */
+	p = find_implicit_fb_entry(chip, capture_implicit_fb_quirks, alts);
+	if (p && p->type == IMPLICIT_FB_FIXED)
+		return 0; /* no quirk */
+
 	/* Generic UAC2 implicit feedback */
 	if (attr == USB_ENDPOINT_SYNC_ASYNC &&
 	    alts->desc.bInterfaceClass == USB_CLASS_AUDIO &&
-- 
2.26.2

