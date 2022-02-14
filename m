Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C7E4B50DC
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Feb 2022 13:58:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB5111754;
	Mon, 14 Feb 2022 13:57:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB5111754
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644843510;
	bh=ognt00oMRmNZaG+w3LT1jmLXB0pBmxHwCDpv9lryFQw=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m0sPKpDQGQGOhnJD9nX4MM1OKd4LXmensz6lVLgZFaj9VH2VPHK/P4CnWrZDmtgtS
	 a7Q1F1cuccmTK77Z/k5Y0bue6BQQ9CSeM1Bwtshxq1un3wBpcd5oy3IlXmzLG1Ps6+
	 OAdGyjmSnMpA+zcYZvz6rmZTQg/jlQtlGy0yX7Ag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63D7FF80430;
	Mon, 14 Feb 2022 13:57:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C92BFF80310; Mon, 14 Feb 2022 13:57:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD956F800C0
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 13:57:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD956F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="AEDGE3sZ"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="10HIWsSq"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 43B8D210F0
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 12:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644843432; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ZKgnC64UlkRjypCtepBBcqmG9O7e55SdNoP0fdf8Sbs=;
 b=AEDGE3sZYGC1PdIl7ylQwc7gDSkVNZRuW3YEFPpaLaxqKNyuYVA0kXCmJkuS5S0agH86kN
 eIGBxbQ4p8LDO97K7Ctjb4VeXSdUr1DIy81WuyInnnzMbAI+b91bViybuNKwnGqdZISRgQ
 BbSP7o8gQvCUP+79miMG5QYHrhti9uY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644843432;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ZKgnC64UlkRjypCtepBBcqmG9O7e55SdNoP0fdf8Sbs=;
 b=10HIWsSqJrCrCP42DwvKJhFU8CfQq4FqoeYjwEzujnGoBHqmyBnfBSeoiuNkO26GalaV8s
 GcXFJfSoAwah7rDw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 3BBE2A3B89;
 Mon, 14 Feb 2022 12:57:12 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Don't abort resume upon errors
Date: Mon, 14 Feb 2022 13:57:11 +0100
Message-Id: <20220214125711.20531-1-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
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

The default mixer resume code treats the errors at restoring the
modified mixer items as a fatal error, and it returns back to the
caller.  This ends up in the resume failure, and the device will be
come unavailable, although basically those errors are intermittent and
can be safely ignored.

The problem itself has been present from the beginning, but it didn't
hit usually because the code tries to resume only the modified items.
But now with the recent commit to forcibly initialize each item at the
probe time, the problem surfaced more often, hence it appears as a
regression.

This patch fixes the regression simply by ignoring the errors at
resume.

Fixes: b96681bd5827 ("ALSA: usb-audio: Initialize every feature unit once at probe time")
Cc: <stable@vger.kernel.org>
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=215561
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 630766ba259f..a5641956ef10 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -3678,17 +3678,14 @@ static int restore_mixer_value(struct usb_mixer_elem_list *list)
 				err = snd_usb_set_cur_mix_value(cval, c + 1, idx,
 							cval->cache_val[idx]);
 				if (err < 0)
-					return err;
+					break;
 			}
 			idx++;
 		}
 	} else {
 		/* master */
-		if (cval->cached) {
-			err = snd_usb_set_cur_mix_value(cval, 0, 0, *cval->cache_val);
-			if (err < 0)
-				return err;
-		}
+		if (cval->cached)
+			snd_usb_set_cur_mix_value(cval, 0, 0, *cval->cache_val);
 	}
 
 	return 0;
-- 
2.31.1

