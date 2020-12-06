Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AB22D01F6
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Dec 2020 09:36:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AB7416AA;
	Sun,  6 Dec 2020 09:35:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AB7416AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607243806;
	bh=MNeaZWIQLr/hv6RyZFUbvNRRuE9gXX/t38DSGVJCuGw=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FDfZlEAxJOSpSvLX8SuL9Y21OI+AexOQZyKjLYT+zbxzjqnAScl33PikJWUzHgLuY
	 Eg4HHkdeKUoXo+6uv0m+2KGoXNCvWKomrxc7mrp+GvxpbYUfZluXr2CCNrb2W0M7vl
	 zWiSaJADmJUaoArziPGIZnZs+nycNi2MBj4hdGCE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05784F80218;
	Sun,  6 Dec 2020 09:35:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6700BF8019D; Sun,  6 Dec 2020 09:35:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52A5FF8010A
 for <alsa-devel@alsa-project.org>; Sun,  6 Dec 2020 09:34:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52A5FF8010A
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C4D41AB63
 for <alsa-devel@alsa-project.org>; Sun,  6 Dec 2020 08:34:58 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: seq: Use bool for snd_seq_queue internal flags
Date: Sun,  6 Dec 2020 09:34:56 +0100
Message-Id: <20201206083456.21110-1-tiwai@suse.de>
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

The snd_seq_queue struct contains various flags in the bit fields.
Those are categorized to two different use cases, both of which are
protected by different spinlocks.  That implies that there are still
potential risks of the bad operations for bit fields by concurrent
accesses.

For addressing the problem, this patch rearranges those flags to be
a standard bool instead of a bit field.

Reported-by: syzbot+63cbe31877bb80ef58f5@syzkaller.appspotmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_queue.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/core/seq/seq_queue.h b/sound/core/seq/seq_queue.h
index 1c3a8d3254d9..c69105dc1a10 100644
--- a/sound/core/seq/seq_queue.h
+++ b/sound/core/seq/seq_queue.h
@@ -26,10 +26,10 @@ struct snd_seq_queue {
 	
 	struct snd_seq_timer *timer;	/* time keeper for this queue */
 	int	owner;		/* client that 'owns' the timer */
-	unsigned int	locked:1,	/* timer is only accesibble by owner if set */
-		klocked:1,	/* kernel lock (after START) */	
-		check_again:1,
-		check_blocked:1;
+	bool	locked;		/* timer is only accesibble by owner if set */
+	bool	klocked;	/* kernel lock (after START) */
+	bool	check_again;	/* concurrent access happened during check */
+	bool	check_blocked;	/* queue being checked */
 
 	unsigned int flags;		/* status flags */
 	unsigned int info_flags;	/* info for sync */
-- 
2.26.2

