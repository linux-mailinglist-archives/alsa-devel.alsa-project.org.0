Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 220ED20565A
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 17:53:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B885117C3;
	Tue, 23 Jun 2020 17:52:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B885117C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592927587;
	bh=eVAQyZQd4hc/19sTDMa1ggVsaLEtjvcJ0GRDAhMrmVE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o4LZ1u9Mxj/fpFbEMsS+kAkoWXcYO9jX4W0R7MiT6vmGLIVuWXaSNMJ2Til+4/A4r
	 SjXOc2dGNz3PLQ5+l2gOw8mQaXVKliky16+AiFVMErMRiBnWeUn4vfKL9mC0fjibUi
	 +qCC+MI1Rv6CZYA0G8EwAvA8abxbUIEPEbQTubLo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1FA3F802DB;
	Tue, 23 Jun 2020 17:49:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E512F802BD; Tue, 23 Jun 2020 17:49:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67FC8F8023E
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 17:49:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67FC8F8023E
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5991CB039
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 15:49:32 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib v2 1/2] pcm: dmix: make lockless operation optional
Date: Tue, 23 Jun 2020 17:49:30 +0200
Message-Id: <20200623154931.27755-2-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200623154931.27755-1-tiwai@suse.de>
References: <20200623154931.27755-1-tiwai@suse.de>
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

The recently reported (but a long-standing) bug about the
unconditional semaphore usage in the dmix implies that basically we've
had no problem with the locking in the practical usages over years.
Although the lockless operation has a clear merit, it's a much higher
CPU usage (especially on some uncached pages), and it might lead to a
potential deadlock in theory (which is hard to reproduce at will,
though).

This patch introduces a new configure option "--enable-lockless-dmix"
or "--disable-lockless-dmix" to let user choose the default dmix
operation mode.  The usage of the lockless mixing has been already
conditionally enabled via asoundrc and card config
"direct_memory_access", so we just need to set the default value based
on it.

In this patch, the default is set off to the lockless mixing, i.e. the
generic mixing is chosen.  It makes more sense from the performance
POV.  For any users who still require the lockless operation, it can
be enabled either via configure option or the asoundrc.

The magic number used in the shmem is also changed depending on the
operation mode.  It's just for safety, not to conflict both operation
modes with each other.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 configure.ac         | 13 +++++++++++++
 src/pcm/pcm_direct.c | 16 +++++++++++++---
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/configure.ac b/configure.ac
index 4577c417037a..75d037d5509a 100644
--- a/configure.ac
+++ b/configure.ac
@@ -629,6 +629,19 @@ if test "$build_pcm_mmap_emul" = "yes"; then
   AC_DEFINE([BUILD_PCM_PLUGIN_MMAP_EMUL], "1", [Build PCM mmap-emul plugin])
 fi
 
+if test "$build_pcm_dmix" = "yes"; then
+AC_MSG_CHECKING(for default lockless dmix)
+AC_ARG_ENABLE(lockless-dmix,
+  AS_HELP_STRING([--enable-lockless-dmix],
+    [use lockless dmix as default on x86]),
+  lockless_dmix="$enableval", lockless_dmix="no")
+if test "$lockless_dmix" = "yes"; then
+  AC_MSG_RESULT(yes)
+  AC_DEFINE([LOCKLESS_DMIX_DEFAULT], "1", [Lockless dmix as default])
+else
+  AC_MSG_RESULT(no)
+fi
+fi
 
 dnl Create PCM plugin symbol list for static library
 rm -f "$srcdir"/src/pcm/pcm_symbols_list.c
diff --git a/src/pcm/pcm_direct.c b/src/pcm/pcm_direct.c
index 665340954cf3..19c5a811262f 100644
--- a/src/pcm/pcm_direct.c
+++ b/src/pcm/pcm_direct.c
@@ -82,7 +82,13 @@ int snd_pcm_direct_semaphore_create_or_connect(snd_pcm_direct_t *dmix)
 	return 0;
 }
 
-#define SND_PCM_DIRECT_MAGIC	(0xa15ad300 + sizeof(snd_pcm_direct_share_t))
+static unsigned int snd_pcm_direct_magic(snd_pcm_direct_t *dmix)
+{
+	if (!dmix->direct_memory_access)
+		return 0xa15ad300 + sizeof(snd_pcm_direct_share_t);
+	else
+		return 0xb15ad300 + sizeof(snd_pcm_direct_share_t);
+}
 
 /*
  *  global shared memory area 
@@ -132,10 +138,10 @@ retryget:
 			buf.shm_perm.gid = dmix->ipc_gid;
 			shmctl(dmix->shmid, IPC_SET, &buf);
 		}
-		dmix->shmptr->magic = SND_PCM_DIRECT_MAGIC;
+		dmix->shmptr->magic = snd_pcm_direct_magic(dmix);
 		return 1;
 	} else {
-		if (dmix->shmptr->magic != SND_PCM_DIRECT_MAGIC) {
+		if (dmix->shmptr->magic != snd_pcm_direct_magic(dmix)) {
 			snd_pcm_direct_shm_discard(dmix);
 			return -EINVAL;
 		}
@@ -1892,7 +1898,11 @@ int snd_pcm_direct_parse_open_conf(snd_config_t *root, snd_config_t *conf,
 	rec->slowptr = 1;
 	rec->max_periods = 0;
 	rec->var_periodsize = 0;
+#ifdef LOCKLESS_DMIX_DEFAULT
 	rec->direct_memory_access = 1;
+#else
+	rec->direct_memory_access = 0;
+#endif
 	rec->hw_ptr_alignment = SND_PCM_HW_PTR_ALIGNMENT_AUTO;
 	rec->tstamp_type = -1;
 
-- 
2.16.4

