Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BB31A5D71
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Apr 2020 10:16:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AD4916AE;
	Sun, 12 Apr 2020 10:15:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AD4916AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586679391;
	bh=6JqFwjjzJVwnrGv/v7wVkOF4LqktEWxwmxKwtebUXEc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gWgeJu7f5HFlZrkmygKDykGLy8ICHKAH2ytdcJB6LOxhYOyDBqS00rTaLWeMoCsle
	 aw8xS3Cy4hHUN62gmWwWLTSbg8ENVvlSU9HlhawPkUF+Ye6RboXvvMRdqRqcKbZWIP
	 MI8aa6fWGxBEk5lNyJfDp5vxexUlYWuMBGou/xjM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFF26F800B6;
	Sun, 12 Apr 2020 10:13:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75E88F8021E; Sun, 12 Apr 2020 10:13:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4E62F80126
 for <alsa-devel@alsa-project.org>; Sun, 12 Apr 2020 10:13:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4E62F80126
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 29B18AE30
 for <alsa-devel@alsa-project.org>; Sun, 12 Apr 2020 08:13:36 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/4] ALSA: usb-audio: Don't override ignore_ctl_error value
 from the map
Date: Sun, 12 Apr 2020 10:13:29 +0200
Message-Id: <20200412081331.4742-3-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200412081331.4742-1-tiwai@suse.de>
References: <20200412081331.4742-1-tiwai@suse.de>
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

The mapping table may contain also ignore_ctl_error flag for devices
that are known to behave wild.  Since this flag always writes the
card's own ignore_ctl_error flag, it overrides the value already set
by the module option, so it doesn't follow user's expectation.
Let's fix the code not to clear the flag that has been set by user.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=206873
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index d27e390dcd32..83926b1be53b 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -3106,7 +3106,7 @@ static int snd_usb_mixer_controls(struct usb_mixer_interface *mixer)
 		if (map->id == state.chip->usb_id) {
 			state.map = map->map;
 			state.selector_map = map->selector_map;
-			mixer->ignore_ctl_error = map->ignore_ctl_error;
+			mixer->ignore_ctl_error |= map->ignore_ctl_error;
 			break;
 		}
 	}
-- 
2.16.4

