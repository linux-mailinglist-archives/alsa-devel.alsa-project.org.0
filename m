Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 989C3592408
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Aug 2022 18:28:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08A411614;
	Sun, 14 Aug 2022 18:27:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08A411614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660494499;
	bh=ShuwgENlE/EI+6Nzcu62eOBuU19hQbRvJ9/8rsU0Q8s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cRoU/5ZMFugvPpTb9GfVJCkL1HJcyJcCFCUl8xg0Vj/Y82zwdjP8ky6BK+HjIUZqb
	 9BOVfEoMde9WBqdc+xrQExpySbSFeN6ZrMO6JTMV3O4Xye0zLvC+GAAaxOW98uIbok
	 qOt4Zt2I0tB6lfAAwuuXc368spTX5GoSCph4mr5k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A1AEF80549;
	Sun, 14 Aug 2022 18:25:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89434F80568; Sun, 14 Aug 2022 18:25:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 711ADF80515
 for <alsa-devel@alsa-project.org>; Sun, 14 Aug 2022 18:25:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 711ADF80515
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NuruuyFW"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8AE96B80AEE;
 Sun, 14 Aug 2022 16:25:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82B17C433D6;
 Sun, 14 Aug 2022 16:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660494335;
 bh=ShuwgENlE/EI+6Nzcu62eOBuU19hQbRvJ9/8rsU0Q8s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NuruuyFWcxAHpm9Ab5vZ5f5gJysrOE8LUDs0AJClYYBFyKF72oGIN0+nLxbF/4C6n
 ZbQa2FBeApLb+5ZDrNXXNPLEFGhm5ScqzphloNoTuxspNoEmwasRnl0/dLLnVMP41H
 xss69Klq7wInwy9J/SvobFl6ry3kuASSrChJVxsP3i11dEIBTLRxDc1ndvQt1zNIZT
 9O45b/RLcsnhzXyoVQnUPIUuJ5/qVSL4wEkP1QbY1EzV/IwVT+nroISZJrxpcbRrIs
 8eYwS6GcYL2AVcILRcq6JEams+EW8IJBRO5OTRSIETXgFrojL+tk3EXJnFaXFdtR1i
 sX2v/opIp89jg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 29/39] ALSA: core: Add async signal helpers
Date: Sun, 14 Aug 2022 12:23:18 -0400
Message-Id: <20220814162332.2396012-29-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814162332.2396012-1-sashal@kernel.org>
References: <20220814162332.2396012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org, tiwai@suse.com
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

From: Takashi Iwai <tiwai@suse.de>

[ Upstream commit ef34a0ae7a2654bc9e58675e36898217fb2799d8 ]

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

Link: https://lore.kernel.org/r/20220728125945.29533-2-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/sound/core.h |  8 ++++
 sound/core/misc.c    | 94 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 102 insertions(+)

diff --git a/include/sound/core.h b/include/sound/core.h
index 6d4cc49584c6..39cee40ac22e 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -501,4 +501,12 @@ snd_pci_quirk_lookup_id(u16 vendor, u16 device,
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
2.35.1

