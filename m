Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D2DFF893
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Nov 2019 09:57:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADDAD169C;
	Sun, 17 Nov 2019 09:56:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADDAD169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573981063;
	bh=KJF8l6Y6Fs0KdnLU3qCcgVfQr2p2ZTWcvlkOVYMUjys=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XSXQQfiJG2YgTWfNN4J7Fpvn6LJZ5PA4E+D4M7IWnTkKhc/I4jvjFP2EENlLSNea8
	 RLi2Q9jDxeS/pXs3re/LPLfBPfrkHHz3hkPZVYSc2gidifQz3O98GX4boh6kWzFK2l
	 Zu2HwFrOk0O1Klb8XPt+nwruZT3kN4yLeOrA1JZo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3589EF80150;
	Sun, 17 Nov 2019 09:53:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDCC2F8014A; Sun, 17 Nov 2019 09:53:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8421F8013A
 for <alsa-devel@alsa-project.org>; Sun, 17 Nov 2019 09:53:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8421F8013A
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2D16DB237
 for <alsa-devel@alsa-project.org>; Sun, 17 Nov 2019 08:53:19 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun, 17 Nov 2019 09:53:07 +0100
Message-Id: <20191117085308.23915-8-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191117085308.23915-1-tiwai@suse.de>
References: <20191117085308.23915-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 7/8] ALSA: pcm: Add card sync_irq field
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

Many PCI and other drivers performs snd_pcm_period_elapsed() simply in
its interrupt handler, so the sync_stop operation is just to call
synchronize_irq().  Instead of putting this call multiple times,
introduce the common card->sync_irq field.  When this field is set,
PCM core performs synchronize_irq() for sync-stop operation.  Each
driver just needs to copy its local IRQ number to card->sync_irq, and
that's all we need.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/core.h    | 1 +
 sound/core/init.c       | 1 +
 sound/core/pcm_native.c | 2 ++
 3 files changed, 4 insertions(+)

diff --git a/include/sound/core.h b/include/sound/core.h
index ee238f100f73..af3dce956c17 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -117,6 +117,7 @@ struct snd_card {
 	struct device card_dev;		/* cardX object for sysfs */
 	const struct attribute_group *dev_groups[4]; /* assigned sysfs attr */
 	bool registered;		/* card_dev is registered? */
+	int sync_irq;			/* assigned irq, used for PCM sync */
 	wait_queue_head_t remove_sleep;
 
 #ifdef CONFIG_PM
diff --git a/sound/core/init.c b/sound/core/init.c
index db99b7fad6ad..faa9f03c01ca 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -215,6 +215,7 @@ int snd_card_new(struct device *parent, int idx, const char *xid,
 	init_waitqueue_head(&card->power_sleep);
 #endif
 	init_waitqueue_head(&card->remove_sleep);
+	card->sync_irq = -1;
 
 	device_initialize(&card->card_dev);
 	card->card_dev.parent = parent;
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 163d621ff238..1fe581167b7b 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -574,6 +574,8 @@ static void snd_pcm_sync_stop(struct snd_pcm_substream *substream)
 		substream->runtime->stop_operating = false;
 		if (substream->ops->sync_stop)
 			substream->ops->sync_stop(substream);
+		else if (substream->pcm->card->sync_irq > 0)
+			synchronize_irq(substream->pcm->card->sync_irq);
 	}
 }
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
