Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3282273D8E
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Sep 2020 10:41:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A07B16C0;
	Tue, 22 Sep 2020 10:40:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A07B16C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600764094;
	bh=nuYGqNWBAfs3mDcoIRhiSmBRUGr3YZKcEPG7C6CnVqo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RBG6Kp6E2M3sPYqZZIrkcgrgTkY0Qt7WDMd5RWEF1rw5nbn3u4HE66Q16S02IEWQS
	 rg27SrBtwu9Ar2hXibB1cHLlKJUm27grNYFYQEujVHHnqxa8UcXCiasy8jMFe47RVm
	 O1qcV7dSZ9NPiAY0bwNus28MRWZMw4oXLV1l1DFA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B8E2F8010A;
	Tue, 22 Sep 2020 10:39:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B318AF8010A; Tue, 22 Sep 2020 10:39:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CBD6F80229
 for <alsa-devel@alsa-project.org>; Tue, 22 Sep 2020 10:38:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CBD6F80229
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 71755AFEC;
 Tue, 22 Sep 2020 08:39:34 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: seq: oss: Avoid mutex lock for a long-time ioctl
Date: Tue, 22 Sep 2020 10:38:56 +0200
Message-Id: <20200922083856.28572-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Pavel Machek <pavel@ucw.cz>
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

Recently we applied a fix to cover the whole OSS sequencer ioctls with
the mutex for dealing with the possible races.  This works fine in
general, but in theory, this may lead to unexpectedly long stall if an
ioctl like SNDCTL_SEQ_SYNC is issued and an event with the far future
timestamp was queued.

For fixing such a potential stall, this patch changes the mutex lock
applied conditionally excluding such an ioctl command.  Also, change
the mutex_lock() with the interruptible version for user to allow
escaping from the big-hammer mutex.

Fixes: 80982c7e834e ("ALSA: seq: oss: Serialize ioctls")
Suggested-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/oss/seq_oss.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/core/seq/oss/seq_oss.c b/sound/core/seq/oss/seq_oss.c
index c8b9c0b315d8..250a92b18726 100644
--- a/sound/core/seq/oss/seq_oss.c
+++ b/sound/core/seq/oss/seq_oss.c
@@ -174,9 +174,12 @@ odev_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	if (snd_BUG_ON(!dp))
 		return -ENXIO;
 
-	mutex_lock(&register_mutex);
+	if (cmd != SNDCTL_SEQ_SYNC &&
+	    mutex_lock_interruptible(&register_mutex))
+		return -ERESTARTSYS;
 	rc = snd_seq_oss_ioctl(dp, cmd, arg);
-	mutex_unlock(&register_mutex);
+	if (cmd != SNDCTL_SEQ_SYNC)
+		mutex_unlock(&register_mutex);
 	return rc;
 }
 
-- 
2.16.4

