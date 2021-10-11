Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BADAA428AD2
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Oct 2021 12:38:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B343167D;
	Mon, 11 Oct 2021 12:37:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B343167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633948696;
	bh=Wr+g7M2KRkTwxunc2U3ZLRZNSrtS5B7uryenm94ORCQ=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VV/yy+eNU9my7tRBJyBdR4AY+n9sHFGUDmU0HypINbncxDQHiWdHYTDZzQM0v00JD
	 3CjA4DheWn5LJn/gcF+3ZLolO2KUBXhXNs3/MsxHiNeTwstRO7Y4vq30wCuu4UZszy
	 Sd1SbkVu/cr9mkCVGANk2suyA7wp093cbUnhg1CU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A30CF8028D;
	Mon, 11 Oct 2021 12:36:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A5FCF80269; Mon, 11 Oct 2021 12:36:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 509B2F800C0
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 12:36:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 509B2F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="PORcJPSu"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="o4CFtY6x"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 0E9442207C
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 10:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1633948612; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=oI7lTcJfGtqOWMMRqAKvNKgBo/UNiHFxIAN3/1pSZTA=;
 b=PORcJPSunSljj39+hLOPbaPwaOfGyktXSmLmg+a/Bh+uE/BL8NGu6G6eQM6+6IhNaWB3Nr
 vNgbswn3bCNfbsq9o/dj3wFEJlSgbAjuafZN1eLE4ssA/BwSq1I17XLZe4iYzkfJyj+jkY
 NjE5Ef1N8CoIQ+ZyBfNIcYwqpZNJ1qc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1633948612;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=oI7lTcJfGtqOWMMRqAKvNKgBo/UNiHFxIAN3/1pSZTA=;
 b=o4CFtY6xIwmb5wy+ppZZa4Mb8S4d65L9Dkei3bPt4MfniYsyr/+gBW74wL0t/wnyhSUOX/
 eyeB4dEsQNBqFtCw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id F2CBAA3B87;
 Mon, 11 Oct 2021 10:36:51 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Less restriction for low-latency playback
 mode
Date: Mon, 11 Oct 2021 12:36:50 +0200
Message-Id: <20211011103650.10182-1-tiwai@suse.de>
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

The recent support for the improved low-latency playback mode applied
the SNDRV_PCM_INFO_EXPLICIT_SYNC flag for the target streams, but this
was a slight overkill.  The use of the flag above disables effectively
both PCM status and control mmaps, while basically what we want to
track is only about the appl_ptr update.

For less restriction, use a more proper flag,
SNDRV_PCM_INFO_SYNC_APPLPTR instead, which disables only the control
mmap.

Fixes: d5f871f89e21 ("ALSA: usb-audio: Improved lowlatency playback support")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 3bb095a3c9b6..95ec8eec1bb0 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -1102,7 +1102,7 @@ static int snd_usb_pcm_open(struct snd_pcm_substream *substream)
 	/* need an explicit sync to catch applptr update in low-latency mode */
 	if (direction == SNDRV_PCM_STREAM_PLAYBACK &&
 	    as->chip->lowlatency)
-		runtime->hw.info |= SNDRV_PCM_INFO_EXPLICIT_SYNC;
+		runtime->hw.info |= SNDRV_PCM_INFO_SYNC_APPLPTR;
 	runtime->private_data = subs;
 	subs->pcm_substream = substream;
 	/* runtime PM is also done there */
-- 
2.31.1

