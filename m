Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F8E5088B9
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 15:03:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F281E1A45;
	Wed, 20 Apr 2022 15:03:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F281E1A45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650459837;
	bh=c+r31gNa8XU3p580xr3jtgNHlS/rV0wgBNw28cAw1F8=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qs5+2/RNTTBUPmW9n9bx4dIgfLIEVEykm6ViWVCIarz5iZj7rKv/SYk7ydagi59wj
	 KAnPKALX8+j79YQEfJ/Q6Q+ArzWTBivBY3hL5GU4CeYhX2SA7LMRlLYQwBIzbZdHxQ
	 k5YN/Tgs+Z01UMGCdVpSHQmL+mAODj9bHvqbBuNg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B24A6F80128;
	Wed, 20 Apr 2022 15:02:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78E0AF80125; Wed, 20 Apr 2022 15:02:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CB68F800C1
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 15:02:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CB68F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="QV3kcTkU"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="dT+tGgRe"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 3B8861F380
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 13:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650459768; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=d9hzoEIskrh7KkCeWEmK6bljqQd31geJywCMQDtjRv8=;
 b=QV3kcTkUaURF5I6nsnar/sp55s7/3iYcfayWB6Z+pmJYH1JYgB69IX6o5pdnVa2qtNsQ7C
 h7hGZ7uQ1lX6IIRAeNfOB58RjvZriDc6n4RswBRbVz7IbO6xSPfuwp1/de3VMdc4j9uLBq
 ZnlD3okkDbwrx9Ue6KOEApj6s9o2tJs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650459768;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=d9hzoEIskrh7KkCeWEmK6bljqQd31geJywCMQDtjRv8=;
 b=dT+tGgReBY3K/Qzvsuh7ACWnsn/nQgYYiSzexDtYonTR8SiLqjajuKk2Y6mD9cGnZ++GFB
 +A83z8BE/IuGqnAA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 2A1392C142;
 Wed, 20 Apr 2022 13:02:48 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Clear MIDI port active flag after draining
Date: Wed, 20 Apr 2022 15:02:47 +0200
Message-Id: <20220420130247.22062-1-tiwai@suse.de>
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

When a rawmidi output stream is closed, it calls the drain at first,
then does trigger-off only when the drain returns -ERESTARTSYS as a
fallback.  It implies that each driver should turn off the stream
properly after the drain.  Meanwhile, USB-audio MIDI interface didn't
change the port->active flag after the drain.  This may leave the
output work picking up the port that is closed right now, which
eventually leads to a use-after-free for the already released rawmidi
object.

This patch fixes the bug by properly clearing the port->active flag
after the output drain.

Reported-by: syzbot+70e777a39907d6d5fd0a@syzkaller.appspotmail.com
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/00000000000011555605dceaff03@google.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/midi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index 2c01649c70f6..7c6ca2b433a5 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -1194,6 +1194,7 @@ static void snd_usbmidi_output_drain(struct snd_rawmidi_substream *substream)
 		} while (drain_urbs && timeout);
 		finish_wait(&ep->drain_wait, &wait);
 	}
+	port->active = 0;
 	spin_unlock_irq(&ep->buffer_lock);
 }
 
-- 
2.34.1

