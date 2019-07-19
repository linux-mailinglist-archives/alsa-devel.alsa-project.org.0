Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCE66E6DB
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jul 2019 15:50:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1BFD1693;
	Fri, 19 Jul 2019 15:49:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1BFD1693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563544222;
	bh=UNrVg6TLjr4vglzHM3zTjIALPj791gLix2lk7SQzC2E=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aTmjIeh8psLUmpDzWMlS86iRpY8IQqW5vnSEHry9qGO/vyny5vc4zmYk7e6alIXAs
	 +3gNkiVKxAf8eT+czvF0KwAKSamIOW37117K0DxCkCzlpep4ZXFh9o2U2PTmpO+4Ow
	 U23v3St45JlhZ2migIphI94+AlUGBspbjULEWdqw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27D7AF80228;
	Fri, 19 Jul 2019 15:48:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 426CBF80272; Fri, 19 Jul 2019 15:48:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2219F800B2
 for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2019 15:48:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2219F800B2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1C22DAD05;
 Fri, 19 Jul 2019 13:48:30 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri, 19 Jul 2019 15:48:27 +0200
Message-Id: <20190719134827.23092-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Duncan Overbruck <kernel@duncano.de>
Subject: [alsa-devel] [PATCH] ALSA: pcm: Fix refcount_inc() on zero usage
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

The recent rewrite of PCM link lock management introduced the refcount
in snd_pcm_group object, managed by the kernel refcount_t API.  This
caused unexpected kernel warnings when the kernel is built with
CONFIG_REFCOUNT_FULL=y.  As the warning line indicates, the problem is
obviously that we start with refcount=0 and do refcount_inc() for
adding each PCM link, while refcount_t API doesn't like refcount_inc()
performed on zero.

For adapting the proper refcount_t usage, this patch changes the logic
slightly:
- The initial refcount is 1, assuming the single list entry
- The refcount is incremented / decremented at each PCM link addition
  and deletion
- ... which allows us concentrating only on the refcount as a release
  condition

Fixes: f57f3df03a8e ("ALSA: pcm: More fine-grained PCM link locking")
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=204221
Reported-and-tested-by: Duncan Overbruck <kernel@duncano.de>
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_native.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 860543a4c840..12dd9b318db1 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -77,7 +77,7 @@ void snd_pcm_group_init(struct snd_pcm_group *group)
 	spin_lock_init(&group->lock);
 	mutex_init(&group->mutex);
 	INIT_LIST_HEAD(&group->substreams);
-	refcount_set(&group->refs, 0);
+	refcount_set(&group->refs, 1);
 }
 
 /* define group lock helpers */
@@ -1096,8 +1096,7 @@ static void snd_pcm_group_unref(struct snd_pcm_group *group,
 
 	if (!group)
 		return;
-	do_free = refcount_dec_and_test(&group->refs) &&
-		list_empty(&group->substreams);
+	do_free = refcount_dec_and_test(&group->refs);
 	snd_pcm_group_unlock(group, substream->pcm->nonatomic);
 	if (do_free)
 		kfree(group);
@@ -2020,6 +2019,7 @@ static int snd_pcm_link(struct snd_pcm_substream *substream, int fd)
 	snd_pcm_group_lock_irq(target_group, nonatomic);
 	snd_pcm_stream_lock(substream1);
 	snd_pcm_group_assign(substream1, target_group);
+	refcount_inc(&target_group->refs);
 	snd_pcm_stream_unlock(substream1);
 	snd_pcm_group_unlock_irq(target_group, nonatomic);
  _end:
@@ -2056,13 +2056,14 @@ static int snd_pcm_unlink(struct snd_pcm_substream *substream)
 	snd_pcm_group_lock_irq(group, nonatomic);
 
 	relink_to_local(substream);
+	refcount_dec(&group->refs);
 
 	/* detach the last stream, too */
 	if (list_is_singular(&group->substreams)) {
 		relink_to_local(list_first_entry(&group->substreams,
 						 struct snd_pcm_substream,
 						 link_list));
-		do_free = !refcount_read(&group->refs);
+		do_free = refcount_dec_and_test(&group->refs);
 	}
 
 	snd_pcm_group_unlock_irq(group, nonatomic);
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
