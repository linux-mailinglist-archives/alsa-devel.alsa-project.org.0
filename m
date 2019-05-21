Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E594E2510B
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2019 15:49:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CC17168B;
	Tue, 21 May 2019 15:48:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CC17168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558446554;
	bh=UvlP2PHae3MEzUYZtK6BX1w6Hau33RNR284PMfmF1A0=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pH0k5v7RkzJsbBf5zrZEAYdI5/Li36NCO4T7Hn4HXERMq6E+r12LmlFRAlkrLwGj0
	 oWa2eDPzy5dR2nEgu3W9PLYz6AejSSVcXXiIkd51dg7bN6hCqEsiY7F47n3rEGa54I
	 lg9QBi1+M0XLqcYHy3nkrXT/sumvEpUT0OUuTckU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D06FF8972F;
	Tue, 21 May 2019 15:47:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A9D4F89674; Tue, 21 May 2019 15:43:43 +0200 (CEST)
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F82CF89670;
 Tue, 21 May 2019 15:33:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F82CF89670
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id 17B0A3C00D1;
 Tue, 21 May 2019 15:33:37 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M8ck9O0ZNIB6; Tue, 21 May 2019 15:33:30 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 35A333C005E;
 Tue, 21 May 2019 15:33:30 +0200 (CEST)
Received: from vmlxhi-082.adit-jv.com (10.72.93.164) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.439.0;
 Tue, 21 May 2019 15:33:29 +0200
From: Adam Miartus <amiartus@de.adit-jv.com>
To: <patch@alsa-project.org>
Date: Tue, 21 May 2019 15:33:29 +0200
Message-ID: <1558445609-11567-1-git-send-email-amiartus@de.adit-jv.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.72.93.164]
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH - alsa-lib 3/4] pcm: add mmap_begin callback to
	snd_pcm_fast_ops_t api
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

main motivation for adding the callback is to use it to enable operation
on mmaped buffer before user access for pcm_file plugin

support for MMAP read access with masking by data from input file is not
implemented for pcm_file plugin, by adding this callback implementing
such feature can be done by rewriting next continuous portion of buffer
on each mmap_begin call

plugins like softvol use pcm_plugin interface and overwrite the buffer by
looping around it in avail_update callback, this patch hopes to simplify
the task by adding new api callback, removing the need for rewriting
pcm_file (to use pcm_plugin callbacks) and careful checking when looping
around whole mmaped buffer

Signed-off-by: Adam Miartus <amiartus@de.adit-jv.com>
Reviewed-by: Timo Wischer <twischer@de.adit-jv.com>

diff --git a/src/pcm/pcm.c b/src/pcm/pcm.c
index 3a71d79..323926e 100644
--- a/src/pcm/pcm.c
+++ b/src/pcm/pcm.c
@@ -7129,7 +7129,13 @@ int __snd_pcm_mmap_begin(snd_pcm_t *pcm, const snd_pcm_channel_area_t **areas,
 	snd_pcm_uframes_t f;
 	snd_pcm_uframes_t avail;
 	const snd_pcm_channel_area_t *xareas;
+
 	assert(pcm && areas && offset && frames);
+
+	if (pcm->fast_ops->mmap_begin)
+		return pcm->fast_ops->mmap_begin(pcm->fast_op_arg, areas, offset, frames);
+
+	/* fallback for plugins that do not specify new callback */
 	xareas = snd_pcm_mmap_areas(pcm);
 	if (xareas == NULL)
 		return -EBADFD;
diff --git a/src/pcm/pcm_dmix.c b/src/pcm/pcm_dmix.c
index 274726e..96049e0 100644
--- a/src/pcm/pcm_dmix.c
+++ b/src/pcm/pcm_dmix.c
@@ -990,6 +990,7 @@ static const snd_pcm_fast_ops_t snd_pcm_dmix_fast_ops = {
 	.poll_descriptors = snd_pcm_direct_poll_descriptors,
 	.poll_descriptors_count = NULL,
 	.poll_revents = snd_pcm_dmix_poll_revents,
+	.mmap_begin = NULL,
 };
 
 /**
diff --git a/src/pcm/pcm_dshare.c b/src/pcm/pcm_dshare.c
index b75809c..328ef83 100644
--- a/src/pcm/pcm_dshare.c
+++ b/src/pcm/pcm_dshare.c
@@ -667,6 +667,7 @@ static const snd_pcm_fast_ops_t snd_pcm_dshare_fast_ops = {
 	.poll_descriptors = snd_pcm_direct_poll_descriptors,
 	.poll_descriptors_count = NULL,
 	.poll_revents = snd_pcm_direct_poll_revents,
+	.mmap_begin = NULL,
 };
 
 /**
diff --git a/src/pcm/pcm_dsnoop.c b/src/pcm/pcm_dsnoop.c
index 58b1e53..5b9d9f5 100644
--- a/src/pcm/pcm_dsnoop.c
+++ b/src/pcm/pcm_dsnoop.c
@@ -544,6 +544,7 @@ static const snd_pcm_fast_ops_t snd_pcm_dsnoop_fast_ops = {
 	.poll_descriptors = snd_pcm_direct_poll_descriptors,
 	.poll_descriptors_count = NULL,
 	.poll_revents = snd_pcm_direct_poll_revents,
+	.mmap_begin = NULL,
 };
 
 /**
diff --git a/src/pcm/pcm_file.c b/src/pcm/pcm_file.c
index dcaa41d..10d227b 100644
--- a/src/pcm/pcm_file.c
+++ b/src/pcm/pcm_file.c
@@ -773,6 +773,7 @@ static const snd_pcm_fast_ops_t snd_pcm_file_fast_ops = {
 	.poll_descriptors = snd_pcm_generic_poll_descriptors,
 	.poll_revents = snd_pcm_generic_poll_revents,
 	.htimestamp = snd_pcm_generic_htimestamp,
+	.mmap_begin = NULL,
 };
 
 /**
diff --git a/src/pcm/pcm_generic.h b/src/pcm/pcm_generic.h
index dfbe21a..683e60b 100644
--- a/src/pcm/pcm_generic.h
+++ b/src/pcm/pcm_generic.h
@@ -161,4 +161,3 @@ snd_pcm_chmap_query_t **snd_pcm_generic_query_chmaps(snd_pcm_t *pcm);
 snd_pcm_chmap_t *snd_pcm_generic_get_chmap(snd_pcm_t *pcm);
 int snd_pcm_generic_set_chmap(snd_pcm_t *pcm, const snd_pcm_chmap_t *map);
 int snd_pcm_generic_may_wait_for_avail_min(snd_pcm_t *pcm, snd_pcm_uframes_t avail);
-
diff --git a/src/pcm/pcm_hooks.c b/src/pcm/pcm_hooks.c
index 4416d36..14396fa 100644
--- a/src/pcm/pcm_hooks.c
+++ b/src/pcm/pcm_hooks.c
@@ -200,6 +200,7 @@ static const snd_pcm_fast_ops_t snd_pcm_hooks_fast_ops = {
 	.poll_descriptors = snd_pcm_generic_poll_descriptors,
 	.poll_revents = snd_pcm_generic_poll_revents,
 	.may_wait_for_avail_min = snd_pcm_generic_may_wait_for_avail_min,
+	.mmap_begin = NULL,
 };
 
 /**
diff --git a/src/pcm/pcm_hw.c b/src/pcm/pcm_hw.c
index 91370a8..8ee1d69 100644
--- a/src/pcm/pcm_hw.c
+++ b/src/pcm/pcm_hw.c
@@ -1481,6 +1481,7 @@ static const snd_pcm_fast_ops_t snd_pcm_hw_fast_ops = {
 	.poll_descriptors = NULL,
 	.poll_descriptors_count = NULL,
 	.poll_revents = NULL,
+	.mmap_begin = NULL,
 };
 
 static const snd_pcm_fast_ops_t snd_pcm_hw_fast_ops_timer = {
@@ -1512,6 +1513,7 @@ static const snd_pcm_fast_ops_t snd_pcm_hw_fast_ops_timer = {
 	.poll_descriptors = snd_pcm_hw_poll_descriptors,
 	.poll_descriptors_count = snd_pcm_hw_poll_descriptors_count,
 	.poll_revents = snd_pcm_hw_poll_revents,
+	.mmap_begin = NULL,
 };
 
 /**
diff --git a/src/pcm/pcm_ioplug.c b/src/pcm/pcm_ioplug.c
index a437ca3..3e19499 100644
--- a/src/pcm/pcm_ioplug.c
+++ b/src/pcm/pcm_ioplug.c
@@ -940,6 +940,7 @@ static const snd_pcm_fast_ops_t snd_pcm_ioplug_fast_ops = {
 	.poll_descriptors_count = snd_pcm_ioplug_poll_descriptors_count,
 	.poll_descriptors = snd_pcm_ioplug_poll_descriptors,
 	.poll_revents = snd_pcm_ioplug_poll_revents,
+	.mmap_begin = NULL,
 };
 
 #endif /* !DOC_HIDDEN */
diff --git a/src/pcm/pcm_local.h b/src/pcm/pcm_local.h
index d52229d..d5726eb 100644
--- a/src/pcm/pcm_local.h
+++ b/src/pcm/pcm_local.h
@@ -184,6 +184,7 @@ typedef struct {
 	int (*poll_descriptors)(snd_pcm_t *pcm, struct pollfd *pfds, unsigned int space); /* locked */
 	int (*poll_revents)(snd_pcm_t *pcm, struct pollfd *pfds, unsigned int nfds, unsigned short *revents); /* locked */
 	int (*may_wait_for_avail_min)(snd_pcm_t *pcm, snd_pcm_uframes_t avail);
+	int (*mmap_begin)(snd_pcm_t *pcm, const snd_pcm_channel_area_t **areas, snd_pcm_uframes_t *offset, snd_pcm_uframes_t *frames); /* locked */
 } snd_pcm_fast_ops_t;
 
 struct _snd_pcm {
diff --git a/src/pcm/pcm_meter.c b/src/pcm/pcm_meter.c
index 20b4187..28bb578 100644
--- a/src/pcm/pcm_meter.c
+++ b/src/pcm/pcm_meter.c
@@ -548,6 +548,7 @@ static const snd_pcm_fast_ops_t snd_pcm_meter_fast_ops = {
 	.poll_descriptors = snd_pcm_generic_poll_descriptors,
 	.poll_revents = snd_pcm_generic_poll_revents,
 	.may_wait_for_avail_min = snd_pcm_generic_may_wait_for_avail_min,
+	.mmap_begin = NULL,
 };
 
 /**
diff --git a/src/pcm/pcm_mmap_emul.c b/src/pcm/pcm_mmap_emul.c
index 009cebb..6fa5fe6 100644
--- a/src/pcm/pcm_mmap_emul.c
+++ b/src/pcm/pcm_mmap_emul.c
@@ -401,6 +401,7 @@ static const snd_pcm_fast_ops_t snd_pcm_mmap_emul_fast_ops = {
 	.poll_descriptors_count = snd_pcm_generic_poll_descriptors_count,
 	.poll_revents = snd_pcm_generic_poll_revents,
 	.may_wait_for_avail_min = snd_pcm_generic_may_wait_for_avail_min,
+	.mmap_begin = NULL,
 };
 
 #ifndef DOC_HIDDEN
diff --git a/src/pcm/pcm_multi.c b/src/pcm/pcm_multi.c
index 53c414d..069d224 100644
--- a/src/pcm/pcm_multi.c
+++ b/src/pcm/pcm_multi.c
@@ -1042,6 +1042,7 @@ static const snd_pcm_fast_ops_t snd_pcm_multi_fast_ops = {
 	.poll_descriptors = snd_pcm_multi_poll_descriptors,
 	.poll_revents = snd_pcm_multi_poll_revents,
 	.may_wait_for_avail_min = snd_pcm_multi_may_wait_for_avail_min,
+	.mmap_begin = NULL,
 };
 
 /**
diff --git a/src/pcm/pcm_null.c b/src/pcm/pcm_null.c
index 1d81548..e6fa049 100644
--- a/src/pcm/pcm_null.c
+++ b/src/pcm/pcm_null.c
@@ -361,6 +361,7 @@ static const snd_pcm_fast_ops_t snd_pcm_null_fast_ops = {
 	.avail_update = snd_pcm_null_avail_update,
 	.mmap_commit = snd_pcm_null_mmap_commit,
 	.htimestamp = snd_pcm_generic_real_htimestamp,
+	.mmap_begin = NULL,
 };
 
 /**
diff --git a/src/pcm/pcm_plugin.c b/src/pcm/pcm_plugin.c
index ea60eb9..0714d2c 100644
--- a/src/pcm/pcm_plugin.c
+++ b/src/pcm/pcm_plugin.c
@@ -646,6 +646,7 @@ const snd_pcm_fast_ops_t snd_pcm_plugin_fast_ops = {
 	.poll_descriptors = snd_pcm_generic_poll_descriptors,
 	.poll_revents = snd_pcm_generic_poll_revents,
 	.may_wait_for_avail_min = snd_pcm_plugin_may_wait_for_avail_min,
+	.mmap_begin = NULL,
 };
 
 #endif
diff --git a/src/pcm/pcm_rate.c b/src/pcm/pcm_rate.c
index 5dc8a92..f29739b 100644
--- a/src/pcm/pcm_rate.c
+++ b/src/pcm/pcm_rate.c
@@ -1217,6 +1217,7 @@ static const snd_pcm_fast_ops_t snd_pcm_rate_fast_ops = {
 	.poll_descriptors = snd_pcm_generic_poll_descriptors,
 	.poll_revents = snd_pcm_rate_poll_revents,
 	.may_wait_for_avail_min = snd_pcm_plugin_may_wait_for_avail_min,
+	.mmap_begin = NULL,
 };
 
 static const snd_pcm_ops_t snd_pcm_rate_ops = {
diff --git a/src/pcm/pcm_share.c b/src/pcm/pcm_share.c
index 5a540c4..b803a82 100644
--- a/src/pcm/pcm_share.c
+++ b/src/pcm/pcm_share.c
@@ -1346,6 +1346,7 @@ static const snd_pcm_fast_ops_t snd_pcm_share_fast_ops = {
 	.avail_update = snd_pcm_share_avail_update,
 	.htimestamp = snd_pcm_share_htimestamp,
 	.mmap_commit = snd_pcm_share_mmap_commit,
+	.mmap_begin = NULL,
 };
 
 /**
diff --git a/src/pcm/pcm_shm.c b/src/pcm/pcm_shm.c
index 26a27a5..a18720f 100644
--- a/src/pcm/pcm_shm.c
+++ b/src/pcm/pcm_shm.c
@@ -629,6 +629,7 @@ static const snd_pcm_fast_ops_t snd_pcm_shm_fast_ops = {
 	.avail_update = snd_pcm_shm_avail_update,
 	.mmap_commit = snd_pcm_shm_mmap_commit,
 	.htimestamp = snd_pcm_shm_htimestamp,
+	.mmap_begin = NULL,
 };
 
 static int make_local_socket(const char *filename)
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
