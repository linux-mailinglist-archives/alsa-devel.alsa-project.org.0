Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D03EF3883
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Nov 2019 20:23:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7DC0168F;
	Thu,  7 Nov 2019 20:22:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7DC0168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573154612;
	bh=XoI0f1RLhJer0ueHeR8Xio7f+YDI9BiBQBg/Ny2J7RE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IhBXlm0k957+DpUbslyPJzo3cgFEewkyFFMQ8FFDtjBd0N9G5NP8dcb+sTliE/arh
	 TvJXXfHUmAuQK+cM0NauHO6/JKnKLNW0SWtnkXKees8TbV3V4j2JV/JL2c8uS8KrNd
	 7V4wjQJne51iFAtd3nDrrhk/X+14SZBn/cMKO65A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37965F8060E;
	Thu,  7 Nov 2019 20:20:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25476F800F3; Thu,  7 Nov 2019 20:20:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C6E2F800F3
 for <alsa-devel@alsa-project.org>; Thu,  7 Nov 2019 20:20:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C6E2F800F3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A2465B158
 for <alsa-devel@alsa-project.org>; Thu,  7 Nov 2019 19:20:12 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Thu,  7 Nov 2019 20:20:07 +0100
Message-Id: <20191107192008.32331-3-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191107192008.32331-1-tiwai@suse.de>
References: <20191107192008.32331-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 2/3] ALSA: timer: Make snd_timer_close()
	returning void
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

The function doesn't return any useful value, so let's make it void to
be clearer.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/timer.h |  2 +-
 sound/core/timer.c    | 18 +++++++-----------
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/include/sound/timer.h b/include/sound/timer.h
index 199c36295a0d..8a13c09c85f7 100644
--- a/include/sound/timer.h
+++ b/include/sound/timer.h
@@ -119,7 +119,7 @@ int snd_timer_global_free(struct snd_timer *timer);
 int snd_timer_global_register(struct snd_timer *timer);
 
 int snd_timer_open(struct snd_timer_instance **ti, char *owner, struct snd_timer_id *tid, unsigned int slave_id);
-int snd_timer_close(struct snd_timer_instance *timeri);
+void snd_timer_close(struct snd_timer_instance *timeri);
 unsigned long snd_timer_resolution(struct snd_timer_instance *timeri);
 int snd_timer_start(struct snd_timer_instance *timeri, unsigned int ticks);
 int snd_timer_stop(struct snd_timer_instance *timeri);
diff --git a/sound/core/timer.c b/sound/core/timer.c
index 21c2d25e4074..c0a73913ec62 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -229,8 +229,8 @@ static int snd_timer_check_master(struct snd_timer_instance *master)
 	return err < 0 ? err : 0;
 }
 
-static int snd_timer_close_locked(struct snd_timer_instance *timeri,
-				  struct device **card_devp_to_put);
+static void snd_timer_close_locked(struct snd_timer_instance *timeri,
+				   struct device **card_devp_to_put);
 
 /*
  * open a timer instance
@@ -351,8 +351,8 @@ EXPORT_SYMBOL(snd_timer_open);
  * close a timer instance
  * call this with register_mutex down.
  */
-static int snd_timer_close_locked(struct snd_timer_instance *timeri,
-				  struct device **card_devp_to_put)
+static void snd_timer_close_locked(struct snd_timer_instance *timeri,
+				   struct device **card_devp_to_put)
 {
 	struct snd_timer *timer = timeri->timer;
 	struct snd_timer_instance *slave, *tmp;
@@ -414,28 +414,24 @@ static int snd_timer_close_locked(struct snd_timer_instance *timeri,
 			*card_devp_to_put = &timer->card->card_dev;
 		module_put(timer->module);
 	}
-
-	return 0;
 }
 
 /*
  * close a timer instance
  */
-int snd_timer_close(struct snd_timer_instance *timeri)
+void snd_timer_close(struct snd_timer_instance *timeri)
 {
 	struct device *card_dev_to_put = NULL;
-	int err;
 
 	if (snd_BUG_ON(!timeri))
-		return -ENXIO;
+		return;
 
 	mutex_lock(&register_mutex);
-	err = snd_timer_close_locked(timeri, &card_dev_to_put);
+	snd_timer_close_locked(timeri, &card_dev_to_put);
 	mutex_unlock(&register_mutex);
 	/* put_device() is called after unlock for avoiding deadlock */
 	if (card_dev_to_put)
 		put_device(card_dev_to_put);
-	return err;
 }
 EXPORT_SYMBOL(snd_timer_close);
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
