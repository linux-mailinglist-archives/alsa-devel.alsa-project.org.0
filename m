Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEDC61DA4
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jul 2019 13:07:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9118E1682;
	Mon,  8 Jul 2019 13:07:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9118E1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562584076;
	bh=HqvPGgxvK5L648It/38tQVxs0D1hXrH1ZXJ43x+m8BI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gk6hyrbiKNoIqZylK5x4AHCzSZCJ2Hc4lztxs8cM1SoJEeX7M68rjwJV6pjGRAP3e
	 UhVxS3XXr/CoPyOLdhQYaJQMe75i6ehoZKu25BHiGe/RKMcQLsfAxIKzK4576l5n2t
	 i493Rvmonh6nbn16dZ2raLNpUhPdnSEA7mHq+uU4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 418B9F802A1;
	Mon,  8 Jul 2019 13:05:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E9BBF802A1; Mon,  8 Jul 2019 13:05:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A6B9F80269;
 Mon,  8 Jul 2019 13:05:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A6B9F80269
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id DF1DE3C00BA;
 Mon,  8 Jul 2019 13:05:10 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GrPOUAAnMPFH; Mon,  8 Jul 2019 13:05:05 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id B8E113C0588;
 Mon,  8 Jul 2019 13:05:00 +0200 (CEST)
Received: from vmlxhi-082.adit-jv.com (10.72.93.164) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.439.0;
 Mon, 8 Jul 2019 13:05:00 +0200
From: Adam Miartus <amiartus@de.adit-jv.com>
To: <patch@alsa-project.org>
Date: Mon, 8 Jul 2019 13:04:49 +0200
Message-ID: <1562583889-2109-3-git-send-email-amiartus@de.adit-jv.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562583889-2109-1-git-send-email-amiartus@de.adit-jv.com>
References: <1562583889-2109-1-git-send-email-amiartus@de.adit-jv.com>
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

From: Andreas Pape <apape@de.adit-jv.com>

The general idea of this patch is to be able to open the device without
defined bindings. This would start the audio clock without blocking
any channel.

This might be useful for hardware that requires running clock early at
system start and to be available even without application streaming
audio data.

Signed-off-by: Andreas Pape <apape@de.adit-jv.com>
Signed-off-by: Adam Miartus <amiartus@de.adit-jv.com>
---
 src/pcm/pcm_dshare.c      | 72 +++++++++++++++++++++++++++++++++++++++--------
 src/pcm/pcm_unsupported.h |  1 +
 2 files changed, 62 insertions(+), 11 deletions(-)

diff --git a/src/pcm/pcm_dshare.c b/src/pcm/pcm_dshare.c
index b75809c..9008748 100644
--- a/src/pcm/pcm_dshare.c
+++ b/src/pcm/pcm_dshare.c
@@ -44,6 +44,7 @@
 #include <sys/un.h>
 #include <sys/mman.h>
 #include "pcm_direct.h"
+#include "pcm_unsupported.h"
 
 #ifndef PIC
 /* entry for static linking */
@@ -508,7 +509,8 @@ static int snd_pcm_dshare_close(snd_pcm_t *pcm)
 
 	if (dshare->timer)
 		snd_timer_close(dshare->timer);
-	do_silenca(pcm);
+	if (dshare->bindings)
+		do_silence(pcm);
 	snd_pcm_direct_semaphore_down(dshare, DIRECT_IPC_SEM_CLIENT);
 	dshare->shmptr->u.dshare.chn_mask &= ~dshare->u.dshare.chn_mask;
 	snd_pcm_close(dshare->spcm);
@@ -621,6 +623,54 @@ static void snd_pcm_dshare_dump(snd_pcm_t *pcm, snd_output_t *out)
 		snd_pcm_dump(dshare->spcm, out);
 }
 
+static const snd_pcm_ops_t snd_pcm_dshare_dummy_ops = {
+	.close = snd_pcm_dshare_close,
+	.info = snd_pcm_unsupported_info,
+	.hw_refine = snd_pcm_unsupported_hw_refine,
+	.hw_params = snd_pcm_unsupported_hw_params,
+	.hw_free = snd_pcm_unsupported_hw_free,
+	.sw_params = snd_pcm_unsupported_sw_params,
+	.channel_info = snd_pcm_unsupported_channel_info,
+	.dump = snd_pcm_unsupported_dump,
+	.nonblock = snd_pcm_unsupported_nonblock,
+	.async = snd_pcm_unsupported_async,
+	.mmap = snd_pcm_unsupported_mmap,
+	.munmap = snd_pcm_unsupported_munmap,
+	.get_chmap = snd_pcm_unsupported_get_chmap,
+	.set_chmap = snd_pcm_unsupported_set_chmap,
+};
+
+static const snd_pcm_fast_ops_t snd_pcm_dshare_fast_dummy_ops = {
+	.status = snd_pcm_unsupported_status,
+	.state = snd_pcm_unsupported_state,
+	.hwsync = snd_pcm_unsupported_hwsync,
+	.delay = snd_pcm_unsupported_delay,
+	.prepare = snd_pcm_unsupported_prepare,
+	.reset = snd_pcm_unsupported_reset,
+	.start = snd_pcm_unsupported_start,
+	.drop = snd_pcm_unsupported_drop,
+	.drain = snd_pcm_unsupported_drain,
+	.pause = snd_pcm_unsupported_pause,
+	.rewindable = snd_pcm_unsupported_rewindable,
+	.rewind = snd_pcm_unsupported_rewind,
+	.forwardable = snd_pcm_unsupported_forwardable,
+	.forward = snd_pcm_unsupported_forward,
+	.resume = snd_pcm_unsupported_resume,
+	.link = NULL,
+	.link_slaves = NULL,
+	.unlink = NULL,
+	.writei = snd_pcm_unsupported_writei,
+	.writen = snd_pcm_unsupported_writen,
+	.readi = snd_pcm_unsupported_readi,
+	.readn = snd_pcm_unsupported_readn,
+	.avail_update = snd_pcm_unsupported_avail_update,
+	.mmap_commit = snd_pcm_unsupported_mmap_commit,
+	.htimestamp = snd_pcm_unsupported_htimestamp,
+	.poll_descriptors = snd_pcm_unsupported_poll_descriptors,
+	.poll_descriptors_count = NULL,
+	.poll_revents = snd_pcm_unsupported_poll_revents,
+};
+
 static const snd_pcm_ops_t snd_pcm_dshare_ops = {
 	.close = snd_pcm_dshare_close,
 	.info = snd_pcm_direct_info,
@@ -713,12 +763,7 @@ int snd_pcm_dshare_open(snd_pcm_t **pcmp, const char *name,
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
@@ -751,9 +796,14 @@ int snd_pcm_dshare_open(snd_pcm_t **pcmp, const char *name,
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
@@ -843,7 +893,7 @@ int snd_pcm_dshare_open(snd_pcm_t **pcmp, const char *name,
 		dshare->spcm = spcm;
 	}
 
-	for (chn = 0; chn < dshare->channels; chn++) {
+	for (chn = 0; dshare->bindings && (chn < dshare->channels); chn++) {
 		unsigned int dchn = dshare->bindings ? dshare->bindings[chn] : chn;
 		if (dchn != UINT_MAX)
 			dshare->u.dshare.chn_mask |= (1ULL << dchn);
diff --git a/src/pcm/pcm_unsupported.h b/src/pcm/pcm_unsupported.h
index 13e4d1b..5783222 100644
--- a/src/pcm/pcm_unsupported.h
+++ b/src/pcm/pcm_unsupported.h
@@ -114,6 +114,7 @@
 #define snd_pcm_unsupported_may_wait_for_avail_min \
 	snd1_pcm_unsupported_may_wait_for_avail_min
 
+void snd_pcm_unsupported_dump(snd_pcm_t *pcm, snd_output_t *out);
 int snd_pcm_unsupported_close(snd_pcm_t *pcm);
 int snd_pcm_unsupported_nonblock(snd_pcm_t *pcm, int nonblock);
 int snd_pcm_unsupported_async(snd_pcm_t *pcm, int sig, pid_t pid);
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
