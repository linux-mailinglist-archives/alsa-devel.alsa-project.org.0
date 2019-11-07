Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 497A0F387F
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Nov 2019 20:22:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B52011678;
	Thu,  7 Nov 2019 20:21:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B52011678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573154566;
	bh=81EbMkJOy0a3a5r6uagZq5CWp2vooH36DiCVBo0KwJg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tfgna2Znjy44M9qLxYV6pl9quEa9O5dHk0QCYCDAGdtBg1WkBtEKaCFQwysPAJ2KO
	 Y+18qw0MLe8wMXIww90qF9jgr6SX4RL0QZPD6ug+LPiUcSKu4fiJQ+acpegJFz+bgn
	 zJqv/BFi+q3d7HEh5ePkCq1pmtrLmvdAQTPU+4A8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21104F805FB;
	Thu,  7 Nov 2019 20:20:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8526F80508; Thu,  7 Nov 2019 20:20:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFF46F80111
 for <alsa-devel@alsa-project.org>; Thu,  7 Nov 2019 20:20:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFF46F80111
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0E3CFB1C4
 for <alsa-devel@alsa-project.org>; Thu,  7 Nov 2019 19:20:12 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Thu,  7 Nov 2019 20:20:06 +0100
Message-Id: <20191107192008.32331-2-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191107192008.32331-1-tiwai@suse.de>
References: <20191107192008.32331-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 1/3] ALSA: timer: Unify master/slave linking
	code
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

The code in both snd_timer_check_master() and snd_timer_check_slave()
are almost identical, both check whether the master/slave link and
does linkage.  Factor out the common code and call it from both
functions for readability.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/timer.c | 66 +++++++++++++++++++++++++++---------------------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/sound/core/timer.c b/sound/core/timer.c
index 013f0e69ff0f..21c2d25e4074 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -163,6 +163,28 @@ static void snd_timer_request(struct snd_timer_id *tid)
 
 #endif
 
+/* move the slave if it belongs to the master; return 1 if match */
+static int check_matching_master_slave(struct snd_timer_instance *master,
+				       struct snd_timer_instance *slave)
+{
+	if (slave->slave_class != master->slave_class ||
+	    slave->slave_id != master->slave_id)
+		return 0;
+	if (master->timer->num_instances >= master->timer->max_instances)
+		return -EBUSY;
+	list_move_tail(&slave->open_list, &master->slave_list_head);
+	master->timer->num_instances++;
+	spin_lock_irq(&slave_active_lock);
+	spin_lock(&master->timer->lock);
+	slave->master = master;
+	slave->timer = master->timer;
+	if (slave->flags & SNDRV_TIMER_IFLG_RUNNING)
+		list_add_tail(&slave->active_list, &master->slave_active_head);
+	spin_unlock(&master->timer->lock);
+	spin_unlock_irq(&slave_active_lock);
+	return 1;
+}
+
 /*
  * look for a master instance matching with the slave id of the given slave.
  * when found, relink the open_link of the slave.
@@ -173,27 +195,18 @@ static int snd_timer_check_slave(struct snd_timer_instance *slave)
 {
 	struct snd_timer *timer;
 	struct snd_timer_instance *master;
+	int err = 0;
 
 	/* FIXME: it's really dumb to look up all entries.. */
 	list_for_each_entry(timer, &snd_timer_list, device_list) {
 		list_for_each_entry(master, &timer->open_list_head, open_list) {
-			if (slave->slave_class == master->slave_class &&
-			    slave->slave_id == master->slave_id) {
-				if (master->timer->num_instances >=
-				    master->timer->max_instances)
-					return -EBUSY;
-				list_move_tail(&slave->open_list,
-					       &master->slave_list_head);
-				master->timer->num_instances++;
-				spin_lock_irq(&slave_active_lock);
-				slave->master = master;
-				slave->timer = master->timer;
-				spin_unlock_irq(&slave_active_lock);
-				return 0;
-			}
+			err = check_matching_master_slave(master, slave);
+			if (err != 0) /* match found or error */
+				goto out;
 		}
 	}
-	return 0;
+ out:
+	return err < 0 ? err : 0;
 }
 
 /*
@@ -205,28 +218,15 @@ static int snd_timer_check_slave(struct snd_timer_instance *slave)
 static int snd_timer_check_master(struct snd_timer_instance *master)
 {
 	struct snd_timer_instance *slave, *tmp;
+	int err = 0;
 
 	/* check all pending slaves */
 	list_for_each_entry_safe(slave, tmp, &snd_timer_slave_list, open_list) {
-		if (slave->slave_class == master->slave_class &&
-		    slave->slave_id == master->slave_id) {
-			if (master->timer->num_instances >=
-			    master->timer->max_instances)
-				return -EBUSY;
-			list_move_tail(&slave->open_list, &master->slave_list_head);
-			master->timer->num_instances++;
-			spin_lock_irq(&slave_active_lock);
-			spin_lock(&master->timer->lock);
-			slave->master = master;
-			slave->timer = master->timer;
-			if (slave->flags & SNDRV_TIMER_IFLG_RUNNING)
-				list_add_tail(&slave->active_list,
-					      &master->slave_active_head);
-			spin_unlock(&master->timer->lock);
-			spin_unlock_irq(&slave_active_lock);
-		}
+		err = check_matching_master_slave(master, slave);
+		if (err < 0)
+			break;
 	}
-	return 0;
+	return err < 0 ? err : 0;
 }
 
 static int snd_timer_close_locked(struct snd_timer_instance *timeri,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
