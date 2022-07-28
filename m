Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A5A583F69
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Jul 2022 15:01:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4393E1678;
	Thu, 28 Jul 2022 15:00:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4393E1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659013281;
	bh=4kNVtdRJOmawOMkxkxDWpZWhruQejYAtZaNeV3+zR1Y=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sAO8JmU+MVVxXIQutEz5MF1WJt56+fsdVRO8HNg5D4jEQyYPlopkCTyeMVPY/hDQU
	 7HkXO+F0uNFAlzUE0Z2/n8Qca0yAAVsJ/O7DeJwp7d7tI+1FBhpFXAQAG1nBwu9nO+
	 eG959QjdmV2UuxlgW2RM9/1xh1GyJOVJfFxSJtRU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2D77F8053C;
	Thu, 28 Jul 2022 15:00:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D1F1F80141; Thu, 28 Jul 2022 14:59:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D73D0F8053C
 for <alsa-devel@alsa-project.org>; Thu, 28 Jul 2022 14:59:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D73D0F8053C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="RaEyhzAt"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="QhumCdQp"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id ACA47344C6;
 Thu, 28 Jul 2022 12:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659013187; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2BUsYOAhyE5wLbYSagh1qo8iii+SMaIjscKb8dQDBbc=;
 b=RaEyhzAttLWSxdboyg+LTLj0J6+ESfWSgmPuvbzlV/JuNw+o1ssFMP3DMcM/j5ojzRXXTb
 896RuMnaRUIF2X2wq+V+vfgaigAKKWLaG25rP32mL//vjHoSRu7ajc+Sa5eDcAcTjMIS1w
 ZukwBWRtgmz4+YJ1BQV7Eq3UgvKiXkI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659013187;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2BUsYOAhyE5wLbYSagh1qo8iii+SMaIjscKb8dQDBbc=;
 b=QhumCdQp8EGHrd6qzQYZEVN0uZHQ+G9x9FTq646FUJerykBxz9aufz/6zytvJ7QpK+pIkA
 WjBD3zoH0aDUK3CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8729E13AB4;
 Thu, 28 Jul 2022 12:59:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UFdMIEOI4mJmOQAAMHmgww
 (envelope-from <tiwai@suse.de>); Thu, 28 Jul 2022 12:59:47 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 1/4] ALSA: core: Add async signal helpers
Date: Thu, 28 Jul 2022 14:59:42 +0200
Message-Id: <20220728125945.29533-2-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220728125945.29533-1-tiwai@suse.de>
References: <20220728125945.29533-1-tiwai@suse.de>
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

Currently the call of kill_fasync() from an interrupt handler might
lead to potential spin deadlocks, as spotted by syzkaller.
Unfortunately, it's not so trivial to fix this lock chain as it's
involved with the tasklist_lock that is touched in allover places.

As a temporary workaround, this patch provides the way to defer the
async signal notification in a work.  The new helper functions,
snd_fasync_helper() and snd_kill_faync() are replacements for
fasync_helper() and kill_fasync(), respectively.  In addition,
snd_fasync_free() needs to be called at the destructor of the relevant
file object.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/core.h |  8 ++++
 sound/core/misc.c    | 94 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 102 insertions(+)

diff --git a/include/sound/core.h b/include/sound/core.h
index dd28de2343b8..4365c35d038b 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -507,4 +507,12 @@ snd_pci_quirk_lookup_id(u16 vendor, u16 device,
 }
 #endif
 
+/* async signal helpers */
+struct snd_fasync;
+
+int snd_fasync_helper(int fd, struct file *file, int on,
+		      struct snd_fasync **fasyncp);
+void snd_kill_fasync(struct snd_fasync *fasync, int signal, int poll);
+void snd_fasync_free(struct snd_fasync *fasync);
+
 #endif /* __SOUND_CORE_H */
diff --git a/sound/core/misc.c b/sound/core/misc.c
index 50e4aaa6270d..d32a19976a2b 100644
--- a/sound/core/misc.c
+++ b/sound/core/misc.c
@@ -10,6 +10,7 @@
 #include <linux/time.h>
 #include <linux/slab.h>
 #include <linux/ioport.h>
+#include <linux/fs.h>
 #include <sound/core.h>
 
 #ifdef CONFIG_SND_DEBUG
@@ -145,3 +146,96 @@ snd_pci_quirk_lookup(struct pci_dev *pci, const struct snd_pci_quirk *list)
 }
 EXPORT_SYMBOL(snd_pci_quirk_lookup);
 #endif
+
+/*
+ * Deferred async signal helpers
+ *
+ * Below are a few helper functions to wrap the async signal handling
+ * in the deferred work.  The main purpose is to avoid the messy deadlock
+ * around tasklist_lock and co at the kill_fasync() invocation.
+ * fasync_helper() and kill_fasync() are replaced with snd_fasync_helper()
+ * and snd_kill_fasync(), respectively.  In addition, snd_fasync_free() has
+ * to be called at releasing the relevant file object.
+ */
+struct snd_fasync {
+	struct fasync_struct *fasync;
+	int signal;
+	int poll;
+	int on;
+	struct list_head list;
+};
+
+static DEFINE_SPINLOCK(snd_fasync_lock);
+static LIST_HEAD(snd_fasync_list);
+
+static void snd_fasync_work_fn(struct work_struct *work)
+{
+	struct snd_fasync *fasync;
+
+	spin_lock_irq(&snd_fasync_lock);
+	while (!list_empty(&snd_fasync_list)) {
+		fasync = list_first_entry(&snd_fasync_list, struct snd_fasync, list);
+		list_del_init(&fasync->list);
+		spin_unlock_irq(&snd_fasync_lock);
+		if (fasync->on)
+			kill_fasync(&fasync->fasync, fasync->signal, fasync->poll);
+		spin_lock_irq(&snd_fasync_lock);
+	}
+	spin_unlock_irq(&snd_fasync_lock);
+}
+
+static DECLARE_WORK(snd_fasync_work, snd_fasync_work_fn);
+
+int snd_fasync_helper(int fd, struct file *file, int on,
+		      struct snd_fasync **fasyncp)
+{
+	struct snd_fasync *fasync = NULL;
+
+	if (on) {
+		fasync = kzalloc(sizeof(*fasync), GFP_KERNEL);
+		if (!fasync)
+			return -ENOMEM;
+		INIT_LIST_HEAD(&fasync->list);
+	}
+
+	spin_lock_irq(&snd_fasync_lock);
+	if (*fasyncp) {
+		kfree(fasync);
+		fasync = *fasyncp;
+	} else {
+		if (!fasync) {
+			spin_unlock_irq(&snd_fasync_lock);
+			return 0;
+		}
+		*fasyncp = fasync;
+	}
+	fasync->on = on;
+	spin_unlock_irq(&snd_fasync_lock);
+	return fasync_helper(fd, file, on, &fasync->fasync);
+}
+EXPORT_SYMBOL_GPL(snd_fasync_helper);
+
+void snd_kill_fasync(struct snd_fasync *fasync, int signal, int poll)
+{
+	unsigned long flags;
+
+	if (!fasync || !fasync->on)
+		return;
+	spin_lock_irqsave(&snd_fasync_lock, flags);
+	fasync->signal = signal;
+	fasync->poll = poll;
+	list_move(&fasync->list, &snd_fasync_list);
+	schedule_work(&snd_fasync_work);
+	spin_unlock_irqrestore(&snd_fasync_lock, flags);
+}
+EXPORT_SYMBOL_GPL(snd_kill_fasync);
+
+void snd_fasync_free(struct snd_fasync *fasync)
+{
+	if (!fasync)
+		return;
+	fasync->on = 0;
+	flush_work(&snd_fasync_work);
+	kfree(fasync);
+}
+EXPORT_SYMBOL_GPL(snd_fasync_free);
-- 
2.35.3

