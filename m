Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC8D43445A
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Oct 2021 06:27:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86366169C;
	Wed, 20 Oct 2021 06:26:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86366169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634704057;
	bh=vgUjI7ZxIUm0+hododsWu6wz8zFQcqvK4OrgFNSG7ck=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NvJmCe5iTxRLiY0jxb9h9ji9XM9MBl9NfNqQrYeMte7gHVHrT1IAFlmvp8gJIKdm3
	 f0Zt4S9yTPjhtm1aBfE/oPKatbE8GwDkpeFwvWe6d0NCIdCUCRwpWG1VZfr16xl9JQ
	 uMNcvo5JDGm8P2RI1gV5xBf1lfz0kTgOAZjVsHlA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3DABF80253;
	Wed, 20 Oct 2021 06:26:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97B02F80229; Wed, 20 Oct 2021 06:26:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C120F80082
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 06:26:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C120F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="jd4BTd7i"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="OFLBoWip"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 095223201D49;
 Wed, 20 Oct 2021 00:26:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 20 Oct 2021 00:26:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=8hM0F2iGp/jKQziVMbzbVnszjF
 K0RLTl/XvjhuJGwJk=; b=jd4BTd7ilEGBa2tGxEU5pNgOdA5QCmYr4JS8a+jxQN
 ajiDsRGDUPmJBj46r+Zb0anlg2qvxlxVDD5TK3ZgwKX8QLlwXHacZ7LX1hcI6Bso
 4tUZBl7K1iTzA/KM619Uligg/lf/JGi5w9T6qQ6KfGslR8+4n/v9KHAGvcBJV/za
 FT2grdbuGy1lXw10AhNY1pe3zEMq6bMmWWc9F6RabctMv8HVBiY5rgt8QrX55NeY
 IvsM0L9MblKvbdLYqMv9pLEFtrd0YMD//tQuwpslhDa0iOB7yO8uits9N9dWYLL1
 e8TTX47k+3dBNoz8perwyGFHfN9H2xJ4rXRR+DBpcRhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=8hM0F2iGp/jKQziVM
 bzbVnszjFK0RLTl/XvjhuJGwJk=; b=OFLBoWipjCoUTbNs/OC9EpSrrqC/EfJd1
 EYV/2fJO6vPYc3U/utN7gtFsTH7OZBfXmM68Y6kuzJ5dtsMDyV6mkr6PtsFmvuMP
 JP5W53iZm4cpPo6Zw/8zH2FHpGe7uIBeWA9npqAxRbwUZ1K3TzhlRKfDOjGyYZHa
 FrIesMKO19xcliQGrFh4Ircd7YLoBeCddbOQQoh7XvzjOe/HdDElbCxCAJ+oWs9a
 vD8lKnE29BuXHKsyzt2BxIFqY4q90Hp/B6nd3hCdRk0oYwq9hlRDuSSRpM1VsRe4
 8Q8PMhHSk4+LI+dtZo+3Laqv+89wKVyL5C8zQ1MiOAbV4aZjz77qA==
X-ME-Sender: <xms:WJpvYdNq55L3Ncn7KNTHz8kMIzwRrypgITLj8SHAykBFufqlvh6cbg>
 <xme:WJpvYf8p_DJ8gjScJe58DEFUF88crseg-ebUr0vxnkxgu2gz-ZXvrdUFBEwdLG_iV
 COdh8r0gbYPWEmf9fM>
X-ME-Received: <xmr:WJpvYcRTjROxXuN93OMk31CbC--R5-7Uu1b4SV5kULn5VMO38SkREQRGLGVvDMMBNFe8JczphvX9pDCgdoIYjqjMQfoXQto7NkGBb3czS2_RkKqI-2Vj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvfedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepudejteelhfdttd
 ekgfdtueeilefhgfetjeejheekgeevuddvveegieehueeukeejnecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkh
 grmhhotggthhhirdhjph
X-ME-Proxy: <xmx:WJpvYZsuAsLsLOmuiQpsJcB5pyaPSBn0eBijzrZD_0G9BByqVbrUvQ>
 <xmx:WJpvYVfe9C29eGynUcaJrfgWd-u4lQPKxpX3QeEce9jOJeAncsYp0A>
 <xmx:WJpvYV1xH3xyfqlvmjJAi66PoibnZFKBfIsCY9qVTePIwnBQR3bqPA>
 <xmx:WJpvYVFS-HmLIoGqWFVscnF6o5wcbp0_kYrtjS10pfuCkCw5gOeBGQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 Oct 2021 00:25:58 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH] ALSA: firewire-motu: fix invalid memory access when operating
 hwdep character device
Date: Wed, 20 Oct 2021 13:25:55 +0900
Message-Id: <20211020042555.40866-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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

ALSA firewire-motu driver recently got support for event notification via
ALSA HwDep interface for register DSP models. However, when polling ALSA
HwDep cdev, the driver can cause null pointer dereference for the other
models due to accessing to unallocated memory or uninitialized memory.

This commit fixes the bug by check the type of model before accessing to
the memory.

Fixes: 634ec0b2906e ("ALSA: firewire-motu: notify event for parameter change in register DSP model")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-hwdep.c | 72 ++++++++++++++++++++------------
 1 file changed, 45 insertions(+), 27 deletions(-)

diff --git a/sound/firewire/motu/motu-hwdep.c b/sound/firewire/motu/motu-hwdep.c
index 9c2e457ce692..ae2d01ddc8d3 100644
--- a/sound/firewire/motu/motu-hwdep.c
+++ b/sound/firewire/motu/motu-hwdep.c
@@ -16,6 +16,47 @@
 
 #include "motu.h"
 
+static bool has_dsp_event(struct snd_motu *motu)
+{
+	if (motu->spec->flags & SND_MOTU_SPEC_REGISTER_DSP)
+		return (snd_motu_register_dsp_message_parser_count_event(motu) > 0);
+	else
+		return false;
+}
+
+// NOTE: Take care of page fault due to accessing to userspace.
+static long copy_dsp_event_to_user(struct snd_motu *motu, char __user *buf, long count,
+				   struct snd_firewire_event_motu_register_dsp_change *event)
+{
+	if (motu->spec->flags & SND_MOTU_SPEC_REGISTER_DSP) {
+		size_t consumed = 0;
+		u32 __user *ptr;
+		u32 ev;
+
+		// Header is filled later.
+		consumed += sizeof(*event);
+
+		while (consumed < count &&
+		       snd_motu_register_dsp_message_parser_copy_event(motu, &ev)) {
+			ptr = (u32 __user *)(buf + consumed);
+			if (put_user(ev, ptr))
+				return -EFAULT;
+			consumed += sizeof(ev);
+		}
+
+		event->type = SNDRV_FIREWIRE_EVENT_MOTU_REGISTER_DSP_CHANGE;
+		event->count = (consumed - sizeof(*event)) / 4;
+		if (copy_to_user(buf, &event, sizeof(*event)))
+			return -EFAULT;
+
+		count = consumed;
+	} else {
+		count = 0;
+	}
+
+	return count;
+}
+
 static long hwdep_read(struct snd_hwdep *hwdep, char __user *buf, long count,
 		       loff_t *offset)
 {
@@ -25,8 +66,7 @@ static long hwdep_read(struct snd_hwdep *hwdep, char __user *buf, long count,
 
 	spin_lock_irq(&motu->lock);
 
-	while (!motu->dev_lock_changed && motu->msg == 0 &&
-			snd_motu_register_dsp_message_parser_count_event(motu) == 0) {
+	while (!motu->dev_lock_changed && motu->msg == 0 && !has_dsp_event(motu)) {
 		prepare_to_wait(&motu->hwdep_wait, &wait, TASK_INTERRUPTIBLE);
 		spin_unlock_irq(&motu->lock);
 		schedule();
@@ -55,31 +95,10 @@ static long hwdep_read(struct snd_hwdep *hwdep, char __user *buf, long count,
 		count = min_t(long, count, sizeof(event));
 		if (copy_to_user(buf, &event, count))
 			return -EFAULT;
-	} else if (snd_motu_register_dsp_message_parser_count_event(motu) > 0) {
-		size_t consumed = 0;
-		u32 __user *ptr;
-		u32 ev;
-
+	} else if (has_dsp_event(motu)) {
 		spin_unlock_irq(&motu->lock);
 
-		// Header is filled later.
-		consumed += sizeof(event.motu_register_dsp_change);
-
-		while (consumed < count &&
-		       snd_motu_register_dsp_message_parser_copy_event(motu, &ev)) {
-			ptr = (u32 __user *)(buf + consumed);
-			if (put_user(ev, ptr))
-				return -EFAULT;
-			consumed += sizeof(ev);
-		}
-
-		event.motu_register_dsp_change.type = SNDRV_FIREWIRE_EVENT_MOTU_REGISTER_DSP_CHANGE;
-		event.motu_register_dsp_change.count =
-			(consumed - sizeof(event.motu_register_dsp_change)) / 4;
-		if (copy_to_user(buf, &event, sizeof(event.motu_register_dsp_change)))
-			return -EFAULT;
-
-		count = consumed;
+		count = copy_dsp_event_to_user(motu, buf, count, &event.motu_register_dsp_change);
 	}
 
 	return count;
@@ -94,8 +113,7 @@ static __poll_t hwdep_poll(struct snd_hwdep *hwdep, struct file *file,
 	poll_wait(file, &motu->hwdep_wait, wait);
 
 	spin_lock_irq(&motu->lock);
-	if (motu->dev_lock_changed || motu->msg ||
-	    snd_motu_register_dsp_message_parser_count_event(motu) > 0)
+	if (motu->dev_lock_changed || motu->msg || has_dsp_event(motu))
 		events = EPOLLIN | EPOLLRDNORM;
 	else
 		events = 0;
-- 
2.30.2

