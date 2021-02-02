Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8DC30CF76
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 23:58:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 622B91741;
	Tue,  2 Feb 2021 23:57:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 622B91741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612306729;
	bh=MYemdnRDN6BsPw3FWs73fOj4QDozXJLKzMDUNTVBr0U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S64aPZlIp4lIoxmERAkDv+oBCcgDCfHOubMW+FwrVhdzQ6Gx66wQbbcpgX47FzLvh
	 2OafntkpdyVn+h6CkeaPKryJun61fRGOfDTwWAYBa5JLaNU7l2+TphfSBb1z4sadyN
	 SwjhFcjXe6+pPUNSuu4z40yib3FyBkusTQbGYocE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43E69F80264;
	Tue,  2 Feb 2021 23:57:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA3AAF8025D; Tue,  2 Feb 2021 23:57:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D915EF8013C
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 23:56:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D915EF8013C
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 86EC2ACAC;
 Tue,  2 Feb 2021 22:56:59 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: core: Fix the debugfs removal at snd_card_free()
Date: Tue,  2 Feb 2021 23:56:29 +0100
Message-Id: <20210202225629.1965-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Hui Wang <hui.wang@canonical.com>, Chris Wilson <chris@chris-wilson.co.uk>
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

The commit 2d670ea2bd53 ("ALSA: jack: implement software jack
injection via debugfs") introduced a debugfs root for each sound card
object.  The debugfs entry gets removed at the card removal, too, but
it turned out that debugfs_remove() is called at a wrong place; it's
after the card object gets freed, hence it leads to use-after-free.

Fix it by moving the debugfs_remove() at the right place, the
destructor of the card device.

Fixes: 2d670ea2bd53 ("ALSA: jack: implement software jack injection via debugfs")
Reported-and-tested-by: Chris Wilson <chris@chris-wilson.co.uk>
Link: https://lore.kernel.org/r/161228343605.1150.8862281636043446562@build.alporthouse.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/init.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/core/init.c b/sound/core/init.c
index d4e78b176793..84b573e9c1f9 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -487,6 +487,10 @@ static int snd_card_do_free(struct snd_card *card)
 		dev_warn(card->dev, "unable to free card info\n");
 		/* Not fatal error */
 	}
+#ifdef CONFIG_SND_DEBUG
+	debugfs_remove(card->debugfs_root);
+	card->debugfs_root = NULL;
+#endif
 	if (card->release_completion)
 		complete(card->release_completion);
 	kfree(card);
@@ -537,11 +541,6 @@ int snd_card_free(struct snd_card *card)
 	/* wait, until all devices are ready for the free operation */
 	wait_for_completion(&released);
 
-#ifdef CONFIG_SND_DEBUG
-	debugfs_remove(card->debugfs_root);
-	card->debugfs_root = NULL;
-#endif
-
 	return 0;
 }
 EXPORT_SYMBOL(snd_card_free);
-- 
2.26.2

