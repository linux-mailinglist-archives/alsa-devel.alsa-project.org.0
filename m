Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D862462F7
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Aug 2020 11:20:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B3EA169E;
	Mon, 17 Aug 2020 11:19:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B3EA169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597656002;
	bh=6WGyDlfgTycmFRSraQJH1sU+kgV0Qw0ErRU9EeEOWiA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TqW4MZ4BLCtuDoYbSP+Rx2UYR0CSQwC7ZG0eGDtXU5Iym2TJ3gXzu94CrOzhL4L58
	 uufqG020qzVw7EYlvVJTGgEBn4HyqJiu2JDB+6/UPK1q4kpNUHy2tqqKBbV9BbJcSW
	 F4ez3vAl8JdSYhRdzdoYie4uF7nZw6FsEWKZXdbY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AEF6F802A8;
	Mon, 17 Aug 2020 11:17:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1E4AF80216; Mon, 17 Aug 2020 10:57:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDC43F80218
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 10:57:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDC43F80218
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="eU8dWmKL"
Received: by mail-pj1-x1042.google.com with SMTP id 2so7481748pjx.5
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 01:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=t7X4N8pkN3GNmV8aMvjwf42XjKAkvV3xHvRmpPGyZyk=;
 b=eU8dWmKLLv5YTw4tvFvIiBL3Y1IkcJaBGGLUE54vTrcpDfTbismq7GDbmVP1OSDwSu
 TaGr1/B/34snw/Aqar9BeYatdu4L0OFKOM+gpH5kJ7Yq1EJ9pKbAQ0RV0RcwFfJldm+V
 g1PkmbwNpM0cfFbKTQLWgqStuCuhmGLakGOMCuSQURnwSI+d6iQFwg0NIhaOCqxtc43A
 jaZrSY4rFCFm6a1mUQpcNzrtnwO/ZhFTwEG9P9iMcrHKSfjgrG1g183hajzTP4gOHtjc
 XJraSp0qqdj5OPlXXp/hZre3PcGFgLS0V/5pIUsQ0BC7wfLM7uQqZoRi59mBhkpcs+b0
 5hYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=t7X4N8pkN3GNmV8aMvjwf42XjKAkvV3xHvRmpPGyZyk=;
 b=EFlwFjix4jLoz/kZzfXUkk0FK/HWCIcbUFvQIP8U596rvNkD4pxL7vhZb73epSUl8/
 snHGG15FmoTMfq685V3qzVfawjf1K3dQOqnU2XGJhZ/IsSQROGhJBACnATI7CEb5NS/G
 Z/Xt2aYPERfftJ0/jALkIWEppxGPZmNJVFklo/CypLnHOZnXnmQJYLpSeQg5MxmdiKm9
 xDMirs2YZeAhQ3SvFs4xN81ckeBw9fiBafpOcJ+FYvjyG9S9zvL96Y8zCYrm4EcjUC3Y
 x74sCfAPkfeGoXr2MAqlvYRbOLwynNMXuX21YYgDBUyJ4WC7oZu6dmyijAWjfQfwJP+x
 b9lQ==
X-Gm-Message-State: AOAM530popB5APb+gTCtLly5AvOsy7fTOOm3KtCjPCoep/uTFM6SLiUB
 ijNcx1Mq8lq0aDfe1cfALhQ=
X-Google-Smtp-Source: ABdhPJwP/IQJZ8mysCiHhZ16IDovHskbje8iA1sUnZbb8zig7yuonzpg7I5LA8g+e5ygnIfnJT9yUg==
X-Received: by 2002:a17:90a:6d26:: with SMTP id
 z35mr11434456pjj.164.1597654642315; 
 Mon, 17 Aug 2020 01:57:22 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id j5sm19057245pfg.80.2020.08.17.01.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:57:21 -0700 (PDT)
From: Allen Pais <allen.cryptic@gmail.com>
To: perex@perex.cz, tiwai@suse.com, clemens@ladisch.de,
 o-takashi@sakamocchi.jp, timur@kernel.org, nicoleotsuka@gmail.com,
 Xiubo.Lee@gmail.com
Subject: [PATCH 01/10] sound: core: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 14:26:54 +0530
Message-Id: <20200817085703.25732-2-allen.cryptic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817085703.25732-1-allen.cryptic@gmail.com>
References: <20200817085703.25732-1-allen.cryptic@gmail.com>
X-Mailman-Approved-At: Mon, 17 Aug 2020 11:17:21 +0200
Cc: alsa-devel@alsa-project.org, keescook@chromium.org,
 Allen Pais <allen.lkml@gmail.com>, linux-kernel@vger.kernel.org,
 Romain Perier <romain.perier@gmail.com>, linuxppc-dev@lists.ozlabs.org
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

From: Allen Pais <allen.lkml@gmail.com>

In preparation for unconditionally passing the
struct tasklet_struct pointer to all tasklet
callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 sound/core/timer.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/core/timer.c b/sound/core/timer.c
index d9f85f2d66a3..6e27d87b18ed 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -816,9 +816,9 @@ static void snd_timer_clear_callbacks(struct snd_timer *timer,
  * timer tasklet
  *
  */
-static void snd_timer_tasklet(unsigned long arg)
+static void snd_timer_tasklet(struct tasklet_struct *t)
 {
-	struct snd_timer *timer = (struct snd_timer *) arg;
+	struct snd_timer *timer = from_tasklet(timer, t, task_queue);
 	unsigned long flags;
 
 	if (timer->card && timer->card->shutdown) {
@@ -967,8 +967,7 @@ int snd_timer_new(struct snd_card *card, char *id, struct snd_timer_id *tid,
 	INIT_LIST_HEAD(&timer->ack_list_head);
 	INIT_LIST_HEAD(&timer->sack_list_head);
 	spin_lock_init(&timer->lock);
-	tasklet_init(&timer->task_queue, snd_timer_tasklet,
-		     (unsigned long)timer);
+	tasklet_setup(&timer->task_queue, snd_timer_tasklet);
 	timer->max_instances = 1000; /* default limit per timer */
 	if (card != NULL) {
 		timer->module = card->module;
-- 
2.17.1

