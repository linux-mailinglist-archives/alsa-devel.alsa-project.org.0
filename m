Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 066B5A4D1D
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Sep 2019 03:34:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C6C31688;
	Mon,  2 Sep 2019 03:33:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C6C31688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567388074;
	bh=2FjPCYcry0NY72PHMMGLbKA6u6bPheYptZUt/ZTBeEI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tZI2WgSJEi9HgGTVCLTI3CdAUDuanQqEGnSKNAOVj1T8N84C/nRMB92hHiTw8yK6K
	 9aAVeO3O99czM0i3dwdW+Sk63suYLVo1B0wapQRhuZQXA9GBGXOIxOQHJOw39oB43z
	 x2V7nA9hpIFEzzZPCo8WuAS0t/Jfvw6lbqVAzx90=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0C0AF804A9;
	Mon,  2 Sep 2019 03:32:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97218F8045F; Mon,  2 Sep 2019 03:32:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0D4FF80306
 for <alsa-devel@alsa-project.org>; Mon,  2 Sep 2019 03:32:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0D4FF80306
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MRkrh/El"
Received: by mail-pf1-x444.google.com with SMTP id b24so8058163pfp.1
 for <alsa-devel@alsa-project.org>; Sun, 01 Sep 2019 18:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=P0xla+/48Cc0EmdcDdKwChU9YuKbzXjNPfHb1kB/e70=;
 b=MRkrh/EloCt1NbfOx8G4qEizBAZgOaihQWSkn5uAd4b1mWj/vrwmW+pjG0PXbegeI8
 V3PvoiCf9CxAxR2t5qx33jB2BVxdSx4DJ5aITjLVhi/71o3UYm/dcxtnymkttTuK3p17
 MxtYQWw8rVQxgDrQn5nhjnOXZS0xR/2OdDPHczPn05Z4/Oczjk46RZjDj0PpW27CmY47
 EPYt6CIr/Pkh852uelVEdoATJ2meqZ7wG/x5gLMWzh/F3GBDlP7AUgPRPDxiIuL94Z1b
 1e19P5rYcNcVICdFMNzE+/BWBl4mOhU17UqYbmoWJPagksQBh6qc8r/VibAcyZEul5ub
 L6XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=P0xla+/48Cc0EmdcDdKwChU9YuKbzXjNPfHb1kB/e70=;
 b=sMuvi7FrhYwy9sk6evQRaZfijWCD1oWZrH49CYkT6ngXYv5/3H4524I0WqShW4Bmub
 /XBJd6eItLWPvhJUvCDKue3ARCPd86hJEunNrEAE+iGHPVN0IAsm0HZtq5Ly//ku4RQ8
 3l1aJ+KOHILR99hx8nDDvhOoBtLbHPYu8sx94nj3otMySjvKMsBfDJWxT5KLon1NWpPo
 T9SuyXwhl+tuJvQ8CbbW+OXi04kTqRq3X3ibUPIP6cwPFuIc2RpZjdbMebzlNflLEEf6
 xlAvx+Mr2MwYxMEgTC3r6rGN93iwHU8xsnOn3W4BSAIz7KvK+XXx181UcvC0JgbWUK5I
 Fu+g==
X-Gm-Message-State: APjAAAUjeCIQMOgDQ9dZEC1ZbPJPN50rulN/oFs3MNWy7fbSi2iYe8SG
 C6VUEBZRjhe/A3ZNjU3W9CzxjHFMw/g=
X-Google-Smtp-Source: APXvYqyFCHc5ivWalxIa8a2O68nV1xYVZE54jhvSvOxwNzSjVbKAOndvPfZX2pfQO1LsblyWuxab4g==
X-Received: by 2002:a63:2364:: with SMTP id u36mr22280825pgm.449.1567387962244; 
 Sun, 01 Sep 2019 18:32:42 -0700 (PDT)
Received: from localhost.localdomain (76-14-106-55.rk.wavecable.com.
 [76.14.106.55])
 by smtp.gmail.com with ESMTPSA id l123sm16584020pfl.9.2019.09.01.18.32.41
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Sep 2019 18:32:41 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: alsa-devel@alsa-project.org
Date: Sun,  1 Sep 2019 18:32:40 -0700
Message-Id: <20190902013240.16591-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [alsa-devel] [PATCH] alsa-lib: Remove usleep usage
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

usleep was deprecated by POSIX 2008 and is unavailable without deprecated
APIs enabled in uClibc-ng.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 src/pcm/pcm_shm.c | 3 ++-
 src/ucm/main.c    | 3 ++-
 test/mixtest.c    | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/src/pcm/pcm_shm.c b/src/pcm/pcm_shm.c
index 26a27a57..30a77cd4 100644
--- a/src/pcm/pcm_shm.c
+++ b/src/pcm/pcm_shm.c
@@ -485,12 +485,13 @@ static int snd_pcm_shm_drain(snd_pcm_t *pcm)
 	snd_pcm_shm_t *shm = pcm->private_data;
 	volatile snd_pcm_shm_ctrl_t *ctrl = shm->ctrl;
 	int err;
+	struct timespec req = { 0, 10 * 1000 * 1000 };
 	do {
 		ctrl->cmd = SNDRV_PCM_IOCTL_DRAIN;
 		err = snd_pcm_shm_action(pcm);
 		if (err != -EAGAIN)
 			break;
-		usleep(10000);
+		nanosleep(&req, NULL);
 	} while (1);
 	if (err < 0)
 		return err;
diff --git a/src/ucm/main.c b/src/ucm/main.c
index 99b1cd08..0e5236cb 100644
--- a/src/ucm/main.c
+++ b/src/ucm/main.c
@@ -359,6 +359,7 @@ static int execute_sequence(snd_use_case_mgr_t *uc_mgr,
 {
 	struct list_head *pos;
 	struct sequence_element *s;
+	struct timespec sleep = { 0, s->data.sleep * 1000 };
 	char *cdev = NULL;
 	snd_ctl_t *ctl = NULL;
 	int err = 0;
@@ -440,7 +441,7 @@ static int execute_sequence(snd_use_case_mgr_t *uc_mgr,
 			}
 			break;
 		case SEQUENCE_ELEMENT_TYPE_SLEEP:
-			usleep(s->data.sleep);
+			nanosleep(&sleep, NULL);
 			break;
 		case SEQUENCE_ELEMENT_TYPE_EXEC:
 			err = system(s->data.exec);
diff --git a/test/mixtest.c b/test/mixtest.c
index 57ca5d53..f0940344 100644
--- a/test/mixtest.c
+++ b/test/mixtest.c
@@ -77,7 +77,7 @@ static double detect_cpu_clock()
 	rdtscll(tsc_begin);
 	clock_gettime(CLOCK_MONOTONIC, &tm_begin);
 
-	usleep(1000000);
+	sleep(1);
 
 	rdtscll(tsc_end);
 	clock_gettime(CLOCK_MONOTONIC, &tm_end);
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
