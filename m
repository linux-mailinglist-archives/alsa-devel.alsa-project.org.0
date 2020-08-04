Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3124023BF89
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Aug 2020 21:00:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA653165E;
	Tue,  4 Aug 2020 20:59:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA653165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596567608;
	bh=u08wsvr7mKkDh9MHEJ5CUppEj8loPp3QFLFqcHZ60gk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=U94AASPWnRK44T+bAATB9K86YXI0aAG/o03F0izv7YmjxM+aozSB0BltnGZzwcuWP
	 z29qScIvlWe8Y3X/OtRAbloMjnQGTsVHYsUvD6Lyy8N9sw2+m9snhzA1UNLmfh6ALv
	 2q9y5dQs4vF3q26zrX76aiYRCPuiyiUSel7MnZwk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B7D3F800B7;
	Tue,  4 Aug 2020 20:58:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47A6EF8015A; Tue,  4 Aug 2020 20:58:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56CE7F80124
 for <alsa-devel@alsa-project.org>; Tue,  4 Aug 2020 20:58:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56CE7F80124
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B5B44AD77;
 Tue,  4 Aug 2020 18:58:33 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: seq: oss: Serialize ioctls
Date: Tue,  4 Aug 2020 20:58:15 +0200
Message-Id: <20200804185815.2453-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Hillf Danton <hdanton@sina.com>, Zhang Qiang <qiang.zhang@windriver.com>
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

Some ioctls via OSS sequencer API may race and lead to UAF when the
port create and delete are performed concurrently, as spotted by a
couple of syzkaller cases.  This patch is an attempt to address it by
serializing the ioctls with the existing register_mutex.

Basically OSS sequencer API is an obsoleted interface and was designed
without much consideration of the concurrency.  There are very few
applications with it, and the concurrent performance isn't asked,
hence this "big hammer" approach should be good enough.

Reported-by: syzbot+1a54a94bd32716796edd@syzkaller.appspotmail.com
Reported-by: syzbot+9d2abfef257f3e2d4713@syzkaller.appspotmail.com
Suggested-by: Hillf Danton <hdanton@sina.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/oss/seq_oss.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/core/seq/oss/seq_oss.c b/sound/core/seq/oss/seq_oss.c
index 17f913657304..c8b9c0b315d8 100644
--- a/sound/core/seq/oss/seq_oss.c
+++ b/sound/core/seq/oss/seq_oss.c
@@ -168,10 +168,16 @@ static long
 odev_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 {
 	struct seq_oss_devinfo *dp;
+	long rc;
+
 	dp = file->private_data;
 	if (snd_BUG_ON(!dp))
 		return -ENXIO;
-	return snd_seq_oss_ioctl(dp, cmd, arg);
+
+	mutex_lock(&register_mutex);
+	rc = snd_seq_oss_ioctl(dp, cmd, arg);
+	mutex_unlock(&register_mutex);
+	return rc;
 }
 
 #ifdef CONFIG_COMPAT
-- 
2.16.4

