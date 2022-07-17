Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA09577775
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Jul 2022 19:24:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FFF21772;
	Sun, 17 Jul 2022 19:23:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FFF21772
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658078670;
	bh=QRdPl9+DZlbe/hocMHAP+XeNbUHGNRlnSd/AjVGRbIo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=T2B2tyrVWxVu6ygdBTE9igVLxE1qcqonIGnodQTpELS9JLyLNJdMXvD/imsJJMED3
	 PMHO57mlzwBLzyt3QNuYSH9U6BjfI60X1CtBrrtYN7XStEj7CyzOhPHjQ5W0Q0rqKO
	 WHoCuZSNepBJcvQ24nuIw9lduS1rHluriwCHNAAA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AE20F804D8;
	Sun, 17 Jul 2022 19:23:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83A40F804D2; Sun, 17 Jul 2022 19:23:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49792F800CB
 for <alsa-devel@alsa-project.org>; Sun, 17 Jul 2022 19:23:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49792F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.b="BFFPmyAH"
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 900DBFF802;
 Sun, 17 Jul 2022 17:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1658078601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=1LYIjrrFwLZ4yIaraSmmvzN6AsUruBLSvssompiF0p0=;
 b=BFFPmyAHju+/FZ59uvtPDp76JRm1nQeqieV+Ic6obX1V0yMxCDFHUrWUncGtLWStE6gV/J
 alywjERgUt1Wl3hmmJZ3DjjNZgUwhji3buQ7aup9+FX2OtK7qbK+DGFp1RrGhWbo+pKB61
 AHhJUBcPlMe4VApsIUPrREezTAY4fjBpHKvsy0fEAEMSO29FPZFCYy4+B9aBiWgTQVIZBT
 T934lq1d5axG0f4XRqiYYSumzZSHIMX/2ugV1hj/vSsO5TJhYKDL+VQXaC+REtACOXJv/9
 E4iEUB/ehHQX2fPCrPEfSVjU+Gsz0qmd6VLbDAf5DOJ2GGWTIFJLiMq4eTCX1g==
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH alsa-utils] aplay/aplay.c: make UCM support optional
Date: Sun, 17 Jul 2022 19:23:18 +0200
Message-Id: <20220717172318.1386259-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

Commit 90f59671784a7e47b40485095cd66892d4840ed7 ("topology:
pre-processor: Move the call to expand variables") modified aplay by
unconditionally invoking features of the use case manager (UCM) from
alsa-lib. However, alsa-lib can be compiled with UCM support.

In order to properly support this situation, this commit changes aplay
to only conditionally compile the UCM related code.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 aplay/aplay.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/aplay/aplay.c b/aplay/aplay.c
index b3b3635..59f937d 100644
--- a/aplay/aplay.c
+++ b/aplay/aplay.c
@@ -41,7 +41,9 @@
 #include <time.h>
 #include <locale.h>
 #include <alsa/asoundlib.h>
+#ifdef HAVE_ALSA_USE_CASE_H
 #include <alsa/use-case.h>
+#endif
 #include <assert.h>
 #include <termios.h>
 #include <signal.h>
@@ -453,6 +455,7 @@ static ssize_t xwrite(int fd, const void *buf, size_t count)
 	return offset;
 }
 
+#ifdef HAVE_ALSA_USE_CASE_H
 static int open_ucm(snd_use_case_mgr_t **uc_mgr, char **pcm_name, const char *name)
 {
 	char *s, *p;
@@ -476,6 +479,7 @@ static int open_ucm(snd_use_case_mgr_t **uc_mgr, char **pcm_name, const char *na
 	}
 	return err;
 }
+#endif
 
 static long parse_long(const char *str, int *err)
 {
@@ -553,7 +557,9 @@ int main(int argc, char *argv[])
 	int do_device_list = 0, do_pcm_list = 0, force_sample_format = 0;
 	snd_pcm_info_t *info;
 	FILE *direction;
+#ifdef HAVE_ALSA_USE_CASE_H
 	snd_use_case_mgr_t *uc_mgr = NULL;
+#endif
 
 #ifdef ENABLE_NLS
 	setlocale(LC_ALL, "");
@@ -852,6 +858,7 @@ int main(int argc, char *argv[])
 		goto __end;
 	}
 
+#ifdef HAVE_ALSA_USE_CASE_H
 	if (strncmp(pcm_name, "ucm.", 4) == 0) {
 		err = open_ucm(&uc_mgr, &pcm_name, pcm_name + 4);
 		if (err < 0) {
@@ -861,6 +868,7 @@ int main(int argc, char *argv[])
 		if (verbose)
 			fprintf(stderr, _("Found UCM PCM device: %s\n"), pcm_name);
 	}
+#endif
 
 	err = snd_pcm_open(&handle, pcm_name, stream, open_mode);
 	if (err < 0) {
@@ -951,8 +959,10 @@ int main(int argc, char *argv[])
 	if (verbose==2)
 		putchar('\n');
 	snd_pcm_close(handle);
+#ifdef HAVE_ALSA_USE_CASE_H
 	if (uc_mgr)
 		snd_use_case_mgr_close(uc_mgr);
+#endif
 	handle = NULL;
 	free(audiobuf);
       __end:
-- 
2.36.1

