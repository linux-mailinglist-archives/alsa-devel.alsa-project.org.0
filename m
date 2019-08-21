Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B14D98243
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2019 20:04:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF4271657;
	Wed, 21 Aug 2019 20:04:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF4271657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566410695;
	bh=ioJU1vSWW67G7NBHQ+LsELgzv6/HlJuMyDC8f+WE1aA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gmntmmzbbaU5WHanfii1IcNZ9dXaPGDK3Xu39Tb9qvCZY3CB2CWr5a537qy8zVtwH
	 g7QNfduZu+NGBOIhSmCg0PeBDh9PP9ANAltsmphLoNAnBzELjqNnDiQa1zpM7jMEMl
	 FxYctDHIXFxoFoHkxBMgX53f7EzBDyVa5zK6sUjs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D405F80322;
	Wed, 21 Aug 2019 20:03:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C4D3F80306; Wed, 21 Aug 2019 20:03:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A894EF800BF
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 20:03:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A894EF800BF
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 83D95AEFC
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 18:03:03 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Wed, 21 Aug 2019 20:03:01 +0200
Message-Id: <20190821180301.13397-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH] ALSA: line6: Fix memory leak at
	line6_init_pcm() error path
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

I forgot to release the allocated object at the early error path in
line6_init_pcm().  For addressing it, slightly shuffle the code so
that the PCM destructor (pcm->private_free) is assigned properly
before all error paths.

Fixes: 3450121997ce ("ALSA: line6: Fix write on zero-sized buffer")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/line6/pcm.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/usb/line6/pcm.c b/sound/usb/line6/pcm.c
index 2c03e0f6bf72..f70211e6b174 100644
--- a/sound/usb/line6/pcm.c
+++ b/sound/usb/line6/pcm.c
@@ -550,6 +550,15 @@ int line6_init_pcm(struct usb_line6 *line6,
 	line6pcm->volume_monitor = 255;
 	line6pcm->line6 = line6;
 
+	spin_lock_init(&line6pcm->out.lock);
+	spin_lock_init(&line6pcm->in.lock);
+	line6pcm->impulse_period = LINE6_IMPULSE_DEFAULT_PERIOD;
+
+	line6->line6pcm = line6pcm;
+
+	pcm->private_data = line6pcm;
+	pcm->private_free = line6_cleanup_pcm;
+
 	line6pcm->max_packet_size_in =
 		usb_maxpacket(line6->usbdev,
 			usb_rcvisocpipe(line6->usbdev, ep_read), 0);
@@ -562,15 +571,6 @@ int line6_init_pcm(struct usb_line6 *line6,
 		return -EINVAL;
 	}
 
-	spin_lock_init(&line6pcm->out.lock);
-	spin_lock_init(&line6pcm->in.lock);
-	line6pcm->impulse_period = LINE6_IMPULSE_DEFAULT_PERIOD;
-
-	line6->line6pcm = line6pcm;
-
-	pcm->private_data = line6pcm;
-	pcm->private_free = line6_cleanup_pcm;
-
 	err = line6_create_audio_out_urbs(line6pcm);
 	if (err < 0)
 		return err;
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
