Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC11225A439
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 06:05:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61EB11818;
	Wed,  2 Sep 2020 06:04:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61EB11818
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599019512;
	bh=8X6fOOnp8B7Z9ZhXKQ8b70eido++ofAReaSbfr5UfqM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XXl7d/nGU/VFzmN77YYBmWA2a72BUkXTAvEyC03FPv6mVfTbsE9eDU/NOWD0nkysd
	 NwnyOys1rbKrCyDxSDlJrR6WQbiQM2T3BgPCmavJnR8f04V96wG83K2JIn1hO4WrrV
	 o8j+hahKLRxCdhwYSbm6m9JxjXwIJx5iz3gMySjo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F22CDF802DD;
	Wed,  2 Sep 2020 06:02:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A273F8026F; Wed,  2 Sep 2020 06:02:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F2D9F800BA
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 06:02:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F2D9F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="agc7SYV7"
Received: by mail-pl1-x644.google.com with SMTP id t11so1659362plr.5
 for <alsa-devel@alsa-project.org>; Tue, 01 Sep 2020 21:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g3cpTjafgayQRIpdf+S3hnTmfkWRIRTNu+EldrSuk9Q=;
 b=agc7SYV7Bdvne2Q479y7ay01LUOMcmViBmOlwk4qXHL8PMhw7hmOT3BYLTCkJP7iCP
 OLMOeWB88nBXQ4EoFjVTSOQ10hxacisArFzPsSs2s7DTwqvTRhHJWZXMCEmcI3Uvp9MY
 Rwjc0Mdyl/85JqW1rA9IIz/rJLXk397jIchAVTWjiQyZweoj8dfxmC5e3uflzFIgQxP5
 NVHfoKc/asLgNo/ylE2vw8UAwb7bWNmvFxA9FntZ61l8ha1Wf4KKnpApaOJCA5v4lcRp
 icKmjFU+XPSmEYaCQqS4QAlfRKPrL+l7fFbidsj3lypF2VbCdwObSULs41PO7AK5HkxG
 ByDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g3cpTjafgayQRIpdf+S3hnTmfkWRIRTNu+EldrSuk9Q=;
 b=IELcUI9vikFqeswD00LN3AvVStdRCbudo5fguzlUgBNCSIpjqKgU6cndrPwPRp8yAE
 eCF5JmWOJICoYxLlaEMAz8FMp285KXpEmqNkyYs7J/3NhHQmLor/4zCp7w0rxcsIbi88
 rzyBbf6sTz/C5wbckRfRbVry7BmBiad5Z/XxpG8SYth/Csh1vNCoRJfzBZ5FiXoG+U3u
 0gymKVl5eFEWK9vke0l436/xzSg8PSJY+Rr5lO2MvDgvKgQCOAGzuTb4EZJh9Tcx2mFf
 gDhOxZ9PRJO/yArEn2qAitiO6lfVx0h/WytE4gRBza8kmZ2qAJIZDuABFTvb7xREKk6f
 7UsA==
X-Gm-Message-State: AOAM532phn79b2V21qc7m/iSF17FHDUnJghKeoBJp+snGyjX5zoQkotW
 NI1aHgpLLxuJ/yzTJL2ayfA=
X-Google-Smtp-Source: ABdhPJxiLH+0iQd493pFP3zsKqoD6J6je95d5IAC9QzEVfGSOjLg9ANjqLdETVBlowAnmQu6tBLkXg==
X-Received: by 2002:a17:90a:4401:: with SMTP id s1mr444166pjg.79.1599019355349; 
 Tue, 01 Sep 2020 21:02:35 -0700 (PDT)
Received: from localhost.localdomain ([49.207.196.170])
 by smtp.gmail.com with ESMTPSA id q71sm3058350pjq.7.2020.09.01.21.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 21:02:34 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	broonie@kernel.org
Subject: [PATCH v2 01/10] ALSA: core: convert tasklets to use new
 tasklet_setup() API
Date: Wed,  2 Sep 2020 09:32:12 +0530
Message-Id: <20200902040221.354941-2-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200902040221.354941-1-allen.lkml@gmail.com>
References: <20200902040221.354941-1-allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 clemens@ladisch.de, Allen Pais <allen.lkml@gmail.com>, nicoleotsuka@gmail.com,
 Romain Perier <romain.perier@gmail.com>
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
2.25.1

