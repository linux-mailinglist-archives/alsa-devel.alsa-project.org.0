Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CAE592455
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Aug 2022 18:32:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13E12168D;
	Sun, 14 Aug 2022 18:31:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13E12168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660494726;
	bh=qKyR4/slPDJJoCo9vd2LuqYW5vB81KL8yoJ+W0mWyZ4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pAXVTLv1yyvgJEzHXx+P5D83VzYDWKuqIdMUUDiFwroOzatVobM72fhW7Ks78woal
	 8P/p35a6DXcJLzxkIyGwcG1EPubpUdGllQ+VX7/z6q8OYKgUeCW8tExfjb/ORfHKzd
	 R17ffc415SIyfjvT7EvgxQEDxayR/QmR2Xif9epk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F9EFF8055C;
	Sun, 14 Aug 2022 18:29:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40EEEF8055A; Sun, 14 Aug 2022 18:29:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF2A6F804CC
 for <alsa-devel@alsa-project.org>; Sun, 14 Aug 2022 18:29:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF2A6F804CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aprHU16D"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id E8871CE0B5E;
 Sun, 14 Aug 2022 16:29:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 725A2C433C1;
 Sun, 14 Aug 2022 16:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660494584;
 bh=qKyR4/slPDJJoCo9vd2LuqYW5vB81KL8yoJ+W0mWyZ4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aprHU16DOM8NJZibjN2HDdjX6WlCTNYzZgbOwjfCx7e1QM7NLytA/lDFrJtqsSotk
 lBvoS4iZNS9H/CCMXQ5xgDQF0PA8jjhDSd9AUx9KWbONWFapbFRIZt1Vbjtc+iW+hd
 xqytTfSUKTXGRoEfK8HRINwTPLMpzNf7rTOwMtL0NAJL1FaVtXaEX0yiIrGxe7ulVM
 h1cVl3dN3I7jq2RMdTKj2G9WbNEe58rbRQHL7uu68ZLnjNebBA5RY7Uzf7lfbIpdFF
 9g3jl7Jjuxh2vgXvI5+qYLo2Q9wOoEhZtVVhOBtF7eG38fqSwu2RnZhICq0p99Cx/k
 EAxn+K4AoIfJA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 08/14] ALSA: core: Add async signal helpers
Date: Sun, 14 Aug 2022 12:29:14 -0400
Message-Id: <20220814162922.2398723-8-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814162922.2398723-1-sashal@kernel.org>
References: <20220814162922.2398723-1-sashal@kernel.org>
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
index 36a5934cf4b1..b5a8cc4d02cc 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -444,4 +444,12 @@ snd_pci_quirk_lookup_id(u16 vendor, u16 device,
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
index 0f818d593c9e..d100feba26b5 100644
--- a/sound/core/misc.c
+++ b/sound/core/misc.c
@@ -25,6 +25,7 @@
 #include <linux/time.h>
 #include <linux/slab.h>
 #include <linux/ioport.h>
+#include <linux/fs.h>
 #include <sound/core.h>
 
 #ifdef CONFIG_SND_DEBUG
@@ -160,3 +161,96 @@ snd_pci_quirk_lookup(struct pci_dev *pci, const struct snd_pci_quirk *list)
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

