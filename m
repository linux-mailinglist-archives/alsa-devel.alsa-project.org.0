Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F15E72CF2A
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 21:15:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B2543E8;
	Mon, 12 Jun 2023 21:14:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B2543E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686597332;
	bh=3i0WATeaW5+6FVG/aZj7PmTNjRB/7xezDMzg3ZPqa2c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FEzTPQ4/taOiP7Yx1r6ona6vzn/NbLVLv0XSSn7x6p/Bhkpj/aaWijyPZ3YcRBziR
	 rYKGgovZVLKmoidxHxVnRd0jhcQW2Mjel6M9hoTgFM61PeFGe0LR14pAp+lbBdn94P
	 Eg2DVfhmFHa5dYBBBEeja1dzdkoUySDmbz0fnB9c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C091F8058C; Mon, 12 Jun 2023 21:13:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD09CF80588;
	Mon, 12 Jun 2023 21:13:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49127F80552; Mon, 12 Jun 2023 21:13:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 36162F80246
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 21:13:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36162F80246
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id E4E3A24236;
	Mon, 12 Jun 2023 15:13:25 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1q8myj-WKL-00; Mon, 12 Jun 2023 21:13:25 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 6/9] ALSA: timer: minimize open-coded access to hw.resolution
Date: Mon, 12 Jun 2023 21:13:22 +0200
Message-Id: <20230612191325.1315854-7-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230612191325.1315854-1-oswald.buddenhagen@gmx.de>
References: <20230612191325.1315854-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: J4A6KD7DCI7CEB5C4AP6O2P2LKLID5CR
X-Message-ID-Hash: J4A6KD7DCI7CEB5C4AP6O2P2LKLID5CR
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J4A6KD7DCI7CEB5C4AP6O2P2LKLID5CR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some info-querying code still used hw.resolution directly instead of
calling snd_timer_hw_resolution(), thus missing a possible
hw.c_resolution callback. This patch rectifies that.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/core/timer.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/sound/core/timer.c b/sound/core/timer.c
index e08a37c23add..9d0d2a5c2e15 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -1246,6 +1246,7 @@ static void snd_timer_proc_read(struct snd_info_entry *entry,
 {
 	struct snd_timer *timer;
 	struct snd_timer_instance *ti;
+	unsigned long resolution;
 
 	mutex_lock(&register_mutex);
 	list_for_each_entry(timer, &snd_timer_list, device_list) {
@@ -1269,10 +1270,13 @@ static void snd_timer_proc_read(struct snd_info_entry *entry,
 				    timer->tmr_device, timer->tmr_subdevice);
 		}
 		snd_iprintf(buffer, "%s :", timer->name);
-		if (timer->hw.resolution)
+		spin_lock_irq(&timer->lock);
+		resolution = snd_timer_hw_resolution(timer);
+		spin_unlock_irq(&timer->lock);
+		if (resolution)
 			snd_iprintf(buffer, " %lu.%03luus (%lu ticks)",
-				    timer->hw.resolution / 1000,
-				    timer->hw.resolution % 1000,
+				    resolution / 1000,
+				    resolution % 1000,
 				    timer->hw.ticks);
 		if (timer->hw.flags & SNDRV_TIMER_HW_SLAVE)
 			snd_iprintf(buffer, " SLAVE");
@@ -1662,7 +1666,9 @@ static int snd_timer_user_ginfo(struct file *file,
 			ginfo->flags |= SNDRV_TIMER_FLG_SLAVE;
 		strscpy(ginfo->id, t->id, sizeof(ginfo->id));
 		strscpy(ginfo->name, t->name, sizeof(ginfo->name));
-		ginfo->resolution = t->hw.resolution;
+		spin_lock_irq(&t->lock);
+		ginfo->resolution = snd_timer_hw_resolution(t);
+		spin_unlock_irq(&t->lock);
 		if (t->hw.resolution_min > 0) {
 			ginfo->resolution_min = t->hw.resolution_min;
 			ginfo->resolution_max = t->hw.resolution_max;
@@ -1817,7 +1823,9 @@ static int snd_timer_user_info(struct file *file,
 		info->flags |= SNDRV_TIMER_FLG_SLAVE;
 	strscpy(info->id, t->id, sizeof(info->id));
 	strscpy(info->name, t->name, sizeof(info->name));
-	info->resolution = t->hw.resolution;
+	spin_lock_irq(&t->lock);
+	info->resolution = snd_timer_hw_resolution(t);
+	spin_unlock_irq(&t->lock);
 	if (copy_to_user(_info, info, sizeof(*_info)))
 		err = -EFAULT;
 	kfree(info);
-- 
2.40.0.152.g15d061e6df

