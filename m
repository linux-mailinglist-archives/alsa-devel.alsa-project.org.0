Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1A6118323
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 10:12:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C6F41615;
	Tue, 10 Dec 2019 10:11:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C6F41615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575969162;
	bh=L2VzLtar9rm0nn5PwGBDh56j4XQGzPs5BxGJcV+qv1A=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MG5S30Dlh8+6GusntfxGgMigHCZSFBRnatoVJb+4qVAUNis1Q1kkJc33xgkHW/mbJ
	 H/5/Bu1dbQ7r5F1MyCapZAF2yW4FSZyiVgnVeepCkDxfhQYVJIC5GM6SsgNBH8aDdM
	 PvY/WUTDsrHBJmk47Dq8KVM5eHZegYFKtpZj2tdk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5ED2DF801D8;
	Tue, 10 Dec 2019 10:11:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88D96F80248; Tue, 10 Dec 2019 10:10:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28903F800F3
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 10:10:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28903F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="G3Ih9QEP"
Received: by mail-pj1-x102b.google.com with SMTP id ca19so7149612pjb.8
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 01:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iAka9PCMzUV/Go882dsW2XBzBH2WGkc6IRilMYRAjgo=;
 b=G3Ih9QEPSbEpVAuWFDLlWEsfT7xtnE3GtpH4yX+kxJdRtzEcm9l30AMSDOWAhZgbes
 cz9uOWicu+fWi2cwBTRKulbfqOdN0RCaz4+yRO09mjfSyZTf7vBGNtx8D1WV9REh72eR
 dq1bPKuXCa0i5isedk6GFqZMRSaP+/QHwGj/axfkpXzhm8vvVVJZT291PRQfPXya8Uhp
 xdaXQphaMVa5jTfp10inWB8dzJuT8fSvPlAShCF8NWU+rTtisSi7td3E8CI9E2DPO15a
 AszQI7gW9CBgNzCDi1GM+/aN62TwM1mcr2IJVWezK7tBBtJfCWvCJeJXxIy6aM22mBqY
 nIDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iAka9PCMzUV/Go882dsW2XBzBH2WGkc6IRilMYRAjgo=;
 b=q6okBgss8B7CrTCmNhG1GIa7sLLIq7Kl2hu0oNVCbxoZOjpvqY5Fe56z2HJHvK49m4
 sXu0d+fWsi1VTelS9J/Gci56GG+Ab4cUjP4Php2xRijiFEc/Bzw8JsuhmhvplN90QyKD
 TXWyBlsn4GCjXZDgpqhXGZr9h3ZkXxEb/WQZRMFVpaudB04hiZSGD5ra9Xe5hmgLF3Vv
 xXa6IpgMYsk5T71YJlXUQQL1p+vRX1/iHJzf+hO1O5ykIt661c8jVte0PwqhStKuldgl
 TTKRZeYOWu1iLiVVyxPAE4fQQ8puP8kyqHHrtOIj9qtvedDRALPvE4oeg+h+JTsfxh3H
 TTnA==
X-Gm-Message-State: APjAAAWRhnvsVDdBynZ1blX1yP49PAe4xzFwVnkeDwSGWNkwctzybFqi
 Tg7IbrDlrrsK5H7ObKB30v961urwddo=
X-Google-Smtp-Source: APXvYqx52rM2c19cP0n4NS72e9CFFlckMO2mFJo84WTv4/lNLGYAnujm1oBJTMo+3EqCY8zpKy7Sfw==
X-Received: by 2002:a17:90a:a004:: with SMTP id
 q4mr4228578pjp.106.1575969049469; 
 Tue, 10 Dec 2019 01:10:49 -0800 (PST)
Received: from localhost.localdomain ([69.42.0.214])
 by smtp.gmail.com with ESMTPSA id d14sm2140551pjz.12.2019.12.10.01.10.48
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 01:10:48 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: alsa-devel@alsa-project.org
Date: Tue, 10 Dec 2019 01:10:45 -0800
Message-Id: <20191210091047.143081-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [alsa-devel] [PATCH 1/3] treewide: Fix -Wformat=2 warnings
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

Allows the compiler to check these formats at compile time.

Fixed several such warnings.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 include/use-case.h     | 1 +
 src/error.c            | 2 ++
 src/input.c            | 6 ++++--
 src/output.c           | 6 ++++--
 src/pcm/pcm.c          | 4 ++--
 src/pcm/pcm_direct.c   | 2 +-
 src/pcm/pcm_file.c     | 6 +++---
 src/topology/builder.c | 3 ++-
 src/ucm/ucm_local.h    | 2 ++
 9 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/include/use-case.h b/include/use-case.h
index 2efcb4d8..3f0cf58e 100644
--- a/include/use-case.h
+++ b/include/use-case.h
@@ -188,6 +188,7 @@ typedef struct snd_use_case_mgr snd_use_case_mgr_t;
  * \param ... Optional arguments for sprintf like format
  * \return Allocated string identifier or NULL on error
  */
+__attribute__((format(printf, 1, 2)))
 char *snd_use_case_identifier(const char *fmt, ...);
 
 /**
diff --git a/src/error.c b/src/error.c
index 2e617f87..ad281411 100644
--- a/src/error.c
+++ b/src/error.c
@@ -95,6 +95,7 @@ snd_local_error_handler_t snd_lib_error_set_local(snd_local_error_handler_t func
  * \ref snd_lib_error_set_local, it is called. Otherwise, prints the error
  * message including location to \c stderr.
  */
+__attribute__((format(printf, 5, 6)))
 static void snd_lib_error_default(const char *file, int line, const char *function, int err, const char *fmt, ...)
 {
 	va_list arg;
@@ -149,6 +150,7 @@ const char *snd_asoundlib_version(void)
 /*
  * internal error handling
  */
+__attribute__((format(printf, 5, 6)))
 static void snd_err_msg_default(const char *file, int line, const char *function, int err, const char *fmt, ...)
 {
 	va_list arg;
diff --git a/src/input.c b/src/input.c
index 35324f1f..c204fe7b 100644
--- a/src/input.c
+++ b/src/input.c
@@ -132,6 +132,7 @@ static int snd_input_stdio_close(snd_input_t *input ATTRIBUTE_UNUSED)
 	return 0;
 }
 
+__attribute__((format(scanf, 2, 0)))
 static int snd_input_stdio_scan(snd_input_t *input, const char *format, va_list args)
 {
 	snd_input_stdio_t *stdio = input->private_data;
@@ -144,7 +145,7 @@ static char *snd_input_stdio_gets(snd_input_t *input, char *str, size_t size)
 	snd_input_stdio_t *stdio = input->private_data;
 	return fgets(str, (int) size, stdio->fp);
 }
-			
+
 static int snd_input_stdio_getc(snd_input_t *input)
 {
 	snd_input_stdio_t *stdio = input->private_data;
@@ -236,6 +237,7 @@ static int snd_input_buffer_close(snd_input_t *input)
 	return 0;
 }
 
+__attribute__((format(scanf, 2, 0)))
 static int snd_input_buffer_scan(snd_input_t *input, const char *format, va_list args)
 {
 	snd_input_buffer_t *buffer = input->private_data;
@@ -262,7 +264,7 @@ static char *snd_input_buffer_gets(snd_input_t *input, char *str, size_t size)
 	*str = '\0';
 	return str;
 }
-			
+
 static int snd_input_buffer_getc(snd_input_t *input)
 {
 	snd_input_buffer_t *buffer = input->private_data;
diff --git a/src/output.c b/src/output.c
index 7e3a91b3..935ab003 100644
--- a/src/output.c
+++ b/src/output.c
@@ -141,6 +141,7 @@ static int snd_output_stdio_close(snd_output_t *output)
 	return 0;
 }
 
+__attribute__((format(printf, 2, 0)))
 static int snd_output_stdio_print(snd_output_t *output, const char *format, va_list args)
 {
 	snd_output_stdio_t *stdio = output->private_data;
@@ -152,7 +153,7 @@ static int snd_output_stdio_puts(snd_output_t *output, const char *str)
 	snd_output_stdio_t *stdio = output->private_data;
 	return fputs(str, stdio->fp);
 }
-			
+
 static int snd_output_stdio_putc(snd_output_t *output, int c)
 {
 	snd_output_stdio_t *stdio = output->private_data;
@@ -268,6 +269,7 @@ static int snd_output_buffer_need(snd_output_t *output, size_t size)
 	return buffer->alloc - buffer->size;
 }
 
+__attribute__((format(printf, 2, 0)))
 static int snd_output_buffer_print(snd_output_t *output, const char *format, va_list args)
 {
 	snd_output_buffer_t *buffer = output->private_data;
@@ -304,7 +306,7 @@ static int snd_output_buffer_puts(snd_output_t *output, const char *str)
 	buffer->size += size;
 	return size;
 }
-			
+
 static int snd_output_buffer_putc(snd_output_t *output, int c)
 {
 	snd_output_buffer_t *buffer = output->private_data;
diff --git a/src/pcm/pcm.c b/src/pcm/pcm.c
index 1064044c..09dfe967 100644
--- a/src/pcm/pcm.c
+++ b/src/pcm/pcm.c
@@ -8241,7 +8241,7 @@ int snd_pcm_chmap_print(const snd_pcm_chmap_t *map, size_t maxlen, char *buf)
 				return -ENOMEM;
 		}
 		if (map->pos[i] & SND_CHMAP_DRIVER_SPEC)
-			len += snprintf(buf + len, maxlen - len, "%d", p);
+			len += snprintf(buf + len, maxlen - len, "%u", p);
 		else {
 			const char *name = chmap_names[p];
 			if (name)
@@ -8249,7 +8249,7 @@ int snd_pcm_chmap_print(const snd_pcm_chmap_t *map, size_t maxlen, char *buf)
 						"%s", name);
 			else
 				len += snprintf(buf + len, maxlen - len,
-						"Ch%d", p);
+						"Ch%u", p);
 		}
 		if (len >= maxlen)
 			return -ENOMEM;
diff --git a/src/pcm/pcm_direct.c b/src/pcm/pcm_direct.c
index 54d99005..719e1692 100644
--- a/src/pcm/pcm_direct.c
+++ b/src/pcm/pcm_direct.c
@@ -1406,7 +1406,7 @@ int snd_pcm_direct_initialize_poll_fd(snd_pcm_direct_t *dmix)
 		SNDERR("unable to info for slave pcm");
 		return ret;
 	}
-	sprintf(name, "hw:CLASS=%i,SCLASS=0,CARD=%i,DEV=%i,SUBDEV=%i",
+	sprintf(name, "hw:CLASS=%i,SCLASS=0,CARD=%i,DEV=%u,SUBDEV=%u",
 		(int)SND_TIMER_CLASS_PCM,
 		snd_pcm_info_get_card(&info),
 		snd_pcm_info_get_device(&info),
diff --git a/src/pcm/pcm_file.c b/src/pcm/pcm_file.c
index a02b2dc0..c874e863 100644
--- a/src/pcm/pcm_file.c
+++ b/src/pcm/pcm_file.c
@@ -155,7 +155,7 @@ static int snd_pcm_file_replace_fname(snd_pcm_file_t *file, char **new_fname_p)
 			 next char */
 			switch (*(++old_index_ch)) {
 			case RATE_KEY:
-				snprintf(value, sizeof(value), "%d",
+				snprintf(value, sizeof(value), "%u",
 						pcm->rate);
 				err = snd_pcm_file_append_value(&new_fname,
 					&new_index_ch, &new_len, value);
@@ -164,7 +164,7 @@ static int snd_pcm_file_replace_fname(snd_pcm_file_t *file, char **new_fname_p)
 				break;
 
 			case CHANNELS_KEY:
-				snprintf(value, sizeof(value), "%d",
+				snprintf(value, sizeof(value), "%u",
 						pcm->channels);
 				err = snd_pcm_file_append_value(&new_fname,
 					&new_index_ch, &new_len, value);
@@ -173,7 +173,7 @@ static int snd_pcm_file_replace_fname(snd_pcm_file_t *file, char **new_fname_p)
 				break;
 
 			case BWIDTH_KEY:
-				snprintf(value, sizeof(value), "%d",
+				snprintf(value, sizeof(value), "%u",
 					pcm->frame_bits/pcm->channels);
 				err = snd_pcm_file_append_value(&new_fname,
 						&new_index_ch, &new_len, value);
diff --git a/src/topology/builder.c b/src/topology/builder.c
index 5ae3ae89..3adbad45 100644
--- a/src/topology/builder.c
+++ b/src/topology/builder.c
@@ -21,6 +21,7 @@
 #include "tplg_local.h"
 
 /* verbose output detailing each object size and file position */
+__attribute__((format(printf, 2, 3)))
 static void verbose(snd_tplg_t *tplg, const char *fmt, ...)
 {
 	int offset;
@@ -244,7 +245,7 @@ static int write_manifest_data(snd_tplg_t *tplg)
 		return ret;
 	}
 
-	verbose(tplg, "manifest : write %d bytes\n", sizeof(tplg->manifest));
+	verbose(tplg, "manifest : write %zu bytes\n", sizeof(tplg->manifest));
 	ret = write(tplg->out_fd, &tplg->manifest, sizeof(tplg->manifest));
 	if (ret < 0) {
 		SNDERR("error: failed to write manifest %d\n", ret);
diff --git a/src/ucm/ucm_local.h b/src/ucm/ucm_local.h
index ba961507..696a60dc 100644
--- a/src/ucm/ucm_local.h
+++ b/src/ucm/ucm_local.h
@@ -246,7 +246,9 @@ struct snd_use_case_mgr {
 #define uc_dbg(fmt, arg...) do { } while (0)
 #endif
 
+__attribute__((format(printf, 1, 2)))
 void uc_mgr_error(const char *fmt, ...);
+__attribute__((format(printf, 1, 2)))
 void uc_mgr_stdout(const char *fmt, ...);
 
 int uc_mgr_config_load(int format, const char *file, snd_config_t **cfg);
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
