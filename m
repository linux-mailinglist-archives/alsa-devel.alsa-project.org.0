Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0BE72C37
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2019 12:16:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7486D1A9A;
	Wed, 24 Jul 2019 12:15:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7486D1A9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563963365;
	bh=GhYdP6WPgePG5ZArKr+i3NLwmZrYmPlpe3ApP3abdw8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=loeA7bQzJH3YTKBpDYnIqdeZltzzHyrbQJlIRtxeXs0iwwP7Wjf9SXlZVAbqU7frL
	 MvWShAdeC4VbWeRYTThyW35Ik8SGJBXbjlcoxyLXbUFdTGFrkQq4Rr1xJ1at9cPUJF
	 WYrVMh1sRfNs5INC40/KEHSTVRNRQUtLZBuZsNm4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A28BF804A9;
	Wed, 24 Jul 2019 12:13:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7297CF8048E; Wed, 24 Jul 2019 12:13:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96994F803D1;
 Wed, 24 Jul 2019 12:13:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96994F803D1
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id 5ED113C0076;
 Wed, 24 Jul 2019 12:13:18 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZvqKTLcMPTtZ; Wed, 24 Jul 2019 12:13:12 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 989D53C0582;
 Wed, 24 Jul 2019 12:13:07 +0200 (CEST)
Received: from vmlxhi-082.adit-jv.com (10.72.93.164) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.439.0;
 Wed, 24 Jul 2019 12:13:07 +0200
From: Adam Miartus <amiartus@de.adit-jv.com>
To: <patch@alsa-project.org>
Date: Wed, 24 Jul 2019 12:13:00 +0200
Message-ID: <1563963180-416-3-git-send-email-amiartus@de.adit-jv.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563963180-416-1-git-send-email-amiartus@de.adit-jv.com>
References: <1563963180-416-1-git-send-email-amiartus@de.adit-jv.com>
MIME-Version: 1.0
X-Originating-IP: [10.72.93.164]
Cc: alsa-devel@alsa-project.org, Andreas Pape <apape@de.adit-jv.com>
Subject: [alsa-devel] [PATCH 2/2] alsa: dshare: allow missing bindings
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

allow opening the device and start the audio clock without blocking
any channel

this is required if the audio clock has to be available all the time,
even when application is not streaming audio data

Signed-off-by: Andreas Pape <apape@de.adit-jv.com>
Signed-off-by: Adam Miartus <amiartus@de.adit-jv.com>
---
 src/pcm/pcm_dshare.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/src/pcm/pcm_dshare.c b/src/pcm/pcm_dshare.c
index b75809c..1d29ffe 100644
--- a/src/pcm/pcm_dshare.c
+++ b/src/pcm/pcm_dshare.c
@@ -508,7 +508,8 @@ static int snd_pcm_dshare_close(snd_pcm_t *pcm)
 
 	if (dshare->timer)
 		snd_timer_close(dshare->timer);
-	do_silence(pcm);
+	if (dshare->bindings)
+		do_silence(pcm);
 	snd_pcm_direct_semaphore_down(dshare, DIRECT_IPC_SEM_CLIENT);
 	dshare->shmptr->u.dshare.chn_mask &= ~dshare->u.dshare.chn_mask;
 	snd_pcm_close(dshare->spcm);
@@ -621,6 +622,12 @@ static void snd_pcm_dshare_dump(snd_pcm_t *pcm, snd_output_t *out)
 		snd_pcm_dump(dshare->spcm, out);
 }
 
+static const snd_pcm_ops_t snd_pcm_dshare_dummy_ops = {
+	.close = snd_pcm_dshare_close,
+};
+
+static const snd_pcm_fast_ops_t snd_pcm_dshare_fast_dummy_ops;
+
 static const snd_pcm_ops_t snd_pcm_dshare_ops = {
 	.close = snd_pcm_dshare_close,
 	.info = snd_pcm_direct_info,
@@ -713,12 +720,7 @@ int snd_pcm_dshare_open(snd_pcm_t **pcmp, const char *name,
 	if (ret < 0)
 		goto _err_nosem;
 		
-	if (!dshare->bindings) {
-		SNDERR("dshare: specify bindings!!!");
-		ret = -EINVAL;
-		goto _err_nosem;
-	}
-	
+
 	dshare->ipc_key = opts->ipc_key;
 	dshare->ipc_perm = opts->ipc_perm;
 	dshare->ipc_gid = opts->ipc_gid;
@@ -751,9 +753,14 @@ int snd_pcm_dshare_open(snd_pcm_t **pcmp, const char *name,
 		SNDERR("unable to create IPC shm instance");
 		goto _err;
 	}
-		
-	pcm->ops = &snd_pcm_dshare_ops;
-	pcm->fast_ops = &snd_pcm_dshare_fast_ops;
+
+	if (!dshare->bindings) {
+		pcm->ops = &snd_pcm_dshare_dummy_ops;
+		pcm->fast_ops = &snd_pcm_dshare_fast_dummy_ops;
+	} else {
+		pcm->ops = &snd_pcm_dshare_ops;
+		pcm->fast_ops = &snd_pcm_dshare_fast_ops;
+	}
 	pcm->private_data = dshare;
 	dshare->state = SND_PCM_STATE_OPEN;
 	dshare->slowptr = opts->slowptr;
@@ -843,7 +850,7 @@ int snd_pcm_dshare_open(snd_pcm_t **pcmp, const char *name,
 		dshare->spcm = spcm;
 	}
 
-	for (chn = 0; chn < dshare->channels; chn++) {
+	for (chn = 0; dshare->bindings && (chn < dshare->channels); chn++) {
 		unsigned int dchn = dshare->bindings ? dshare->bindings[chn] : chn;
 		if (dchn != UINT_MAX)
 			dshare->u.dshare.chn_mask |= (1ULL << dchn);
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
