Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C98A441C04
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 08:11:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F6D916FC;
	Wed, 12 Jun 2019 08:10:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F6D916FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560319898;
	bh=P5N9oArbPXyS1BxW+FXHdQQyO9Gmg2k+JKzu4a+rTeM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C2eEOEsZ3rJmddr7aK1PHwGQ1vtYVvEl7PwO4fKCsDyU1YRsMeXMMXfKeQghZK0yc
	 OHJqwRiylyCehicQMDYXftqbb+D4BGAIdBw6pKX4jOzv/DnQTP6O3/F1hHvMawhj8w
	 lFMSXscDXx3TqSBgaDbmx/Dzc7LlWlfg2/oOw4Ro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4623F8970C;
	Wed, 12 Jun 2019 08:08:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D38C2F89737; Wed, 12 Jun 2019 08:08:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE47BF896E0
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 08:08:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE47BF896E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mforney-org.20150623.gappssmtp.com
 header.i=@mforney-org.20150623.gappssmtp.com header.b="t3n/6bCH"
Received: by mail-pl1-x62f.google.com with SMTP id f97so6174949plb.5
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 23:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mforney-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YK+WCDejFYqj1sd6MXPzNlxUOWCsvcgZBE6UpjrwuxM=;
 b=t3n/6bCHgN5UY03xNgae0tGoabkokshSsIJSzojumUmhQzPgrYrytJaCB1ShFvIdio
 WVmQJuALCXcMTvIV5qzWQc3QAV1QFBu+W0IAocJD6ptv48/UoKv8X/3yoPfTuL/9qCcU
 Fdd10INZYsV2PPNwPjtugH4c5soUpsvX4S5rypHBJ9elTT1OW90BEBqVw7jZLqEwOqHh
 KGyyYvfDWjKpqJiYOasthggjFSXgzGjmDnpTYMrP912s3aK4w9EtaKkdjpXuBs9JqjFX
 PTf2eCRB/kKbD+OTqJ+mPbWezpFiSurfpvMiAWOTNqn/x9aR9T4bFSb+zpADKFSEJa/N
 c0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YK+WCDejFYqj1sd6MXPzNlxUOWCsvcgZBE6UpjrwuxM=;
 b=A8Odjvf33LaMF3IolvdR3mWeJAihYaZnEl4ZNHtnuS8+Ux4SKKTeqo7+IaLdIcVdsN
 WWhC9G8MO/CB63sJMpgt4vBdwzk1SShSgX2NNsNZQVcqZ5gdHJqTl9uW//DkyIPCJIxp
 nVK3ibrKxEyOElX29Q133aPM1p/EajsnBA5gnwuJyBXdpQQ97TPcjf4UM0x07f6c3Scw
 gjWkGwBxmBmnFHe6ZiZO52eLYwrBnkKlB4UotyHK9m6DMhvLpNtTFB8qk2VIfUbEWE+a
 a9lVZcsuoXCJ5ZGn3Z4lsEELJ9SCvfTE5pEGBVLDsAkC0mVqMqcD7kUGXlaQb/VeIpO9
 nnrg==
X-Gm-Message-State: APjAAAUcxQ8dishHAublLW9UBhtCeWeko3x+Fb3b9B8BbJ0BMa6GpPJO
 PZ1snYf2cMfEDbMderMvsaiOjw==
X-Google-Smtp-Source: APXvYqwpdH3eygpldGZ7Xw/SjhvV4ngAkdootZYj/1alJ+UD6oe6RUAqEJ3c7C1kRlQEtR2fD0TVHg==
X-Received: by 2002:a17:902:868f:: with SMTP id
 g15mr79520087plo.67.1560319697398; 
 Tue, 11 Jun 2019 23:08:17 -0700 (PDT)
Received: from localhost ([2601:647:5180:35d7::cf52])
 by smtp.gmail.com with ESMTPSA id p23sm3968666pjo.4.2019.06.11.23.08.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 23:08:16 -0700 (PDT)
From: Michael Forney <mforney@mforney.org>
To: patch@alsa-project.org
Date: Tue, 11 Jun 2019 23:08:09 -0700
Message-Id: <20190612060814.13534-2-mforney@mforney.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612060814.13534-1-mforney@mforney.org>
References: <20190612060814.13534-1-mforney@mforney.org>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 1/6] Use __func__ instead of __FUNCTION__
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

They are equivalent, but __func__ is in C99. __FUNCTION__ exists only
for backwards compatibility with old gcc versions.

Signed-off-by: Michael Forney <mforney@mforney.org>
---
 aserver/aserver.c   | 4 ++--
 include/error.h     | 8 ++++----
 include/local.h     | 4 ++--
 src/pcm/pcm_share.c | 4 ++--
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/aserver/aserver.c b/aserver/aserver.c
index 6d20f330..28387021 100644
--- a/aserver/aserver.c
+++ b/aserver/aserver.c
@@ -39,13 +39,13 @@ char *command;
 
 #if __GNUC__ > 2 || (__GNUC__ == 2 && __GNUC_MINOR__ >= 95)
 #define ERROR(...) do {\
-	fprintf(stderr, "%s %s:%i:(%s) ", command, __FILE__, __LINE__, __FUNCTION__); \
+	fprintf(stderr, "%s %s:%i:(%s) ", command, __FILE__, __LINE__, __func__); \
 	fprintf(stderr, __VA_ARGS__); \
 	putc('\n', stderr); \
 } while (0)
 #else
 #define ERROR(args...) do {\
-	fprintf(stderr, "%s %s:%i:(%s) ", command, __FILE__, __LINE__, __FUNCTION__); \
+	fprintf(stderr, "%s %s:%i:(%s) ", command, __FILE__, __LINE__, __func__); \
 	fprintf(stderr, ##args); \
 	putc('\n', stderr); \
 } while (0)
diff --git a/include/error.h b/include/error.h
index 9a996aba..7239db85 100644
--- a/include/error.h
+++ b/include/error.h
@@ -61,11 +61,11 @@ extern snd_lib_error_handler_t snd_lib_error;
 extern int snd_lib_error_set_handler(snd_lib_error_handler_t handler);
 
 #if __GNUC__ > 2 || (__GNUC__ == 2 && __GNUC_MINOR__ > 95)
-#define SNDERR(...) snd_lib_error(__FILE__, __LINE__, __FUNCTION__, 0, __VA_ARGS__) /**< Shows a sound error message. */
-#define SYSERR(...) snd_lib_error(__FILE__, __LINE__, __FUNCTION__, errno, __VA_ARGS__) /**< Shows a system error message (related to \c errno). */
+#define SNDERR(...) snd_lib_error(__FILE__, __LINE__, __func__, 0, __VA_ARGS__) /**< Shows a sound error message. */
+#define SYSERR(...) snd_lib_error(__FILE__, __LINE__, __func__, errno, __VA_ARGS__) /**< Shows a system error message (related to \c errno). */
 #else
-#define SNDERR(args...) snd_lib_error(__FILE__, __LINE__, __FUNCTION__, 0, ##args) /**< Shows a sound error message. */
-#define SYSERR(args...) snd_lib_error(__FILE__, __LINE__, __FUNCTION__, errno, ##args) /**< Shows a system error message (related to \c errno). */
+#define SNDERR(args...) snd_lib_error(__FILE__, __LINE__, __func__, 0, ##args) /**< Shows a sound error message. */
+#define SYSERR(args...) snd_lib_error(__FILE__, __LINE__, __func__, errno, ##args) /**< Shows a system error message (related to \c errno). */
 #endif
 
 /** \} */
diff --git a/include/local.h b/include/local.h
index e8390df5..bf19f0f8 100644
--- a/include/local.h
+++ b/include/local.h
@@ -244,8 +244,8 @@ size_t snd_strlcpy(char *dst, const char *src, size_t size);
 #ifndef NDEBUG
 #define CHECK_SANITY(x) x
 extern snd_lib_error_handler_t snd_err_msg;
-#define SNDMSG(args...) snd_err_msg(__FILE__, __LINE__, __FUNCTION__, 0, ##args)
-#define SYSMSG(args...) snd_err_msg(__FILE__, __LINE__, __FUNCTION__, errno, ##args)
+#define SNDMSG(args...) snd_err_msg(__FILE__, __LINE__, __func__, 0, ##args)
+#define SYSMSG(args...) snd_err_msg(__FILE__, __LINE__, __func__, errno, ##args)
 #else
 #define CHECK_SANITY(x) 0 /* not evaluated */
 #define SNDMSG(args...) /* nop */
diff --git a/src/pcm/pcm_share.c b/src/pcm/pcm_share.c
index 5a540c4f..bff9507d 100644
--- a/src/pcm/pcm_share.c
+++ b/src/pcm/pcm_share.c
@@ -54,11 +54,11 @@ char *snd_pcm_share_slaves_mutex_holder;
 do { \
 	int err = pthread_mutex_trylock(mutex); \
 	if (err < 0) { \
-		fprintf(stderr, "lock " #mutex " is busy (%s): waiting in " __FUNCTION__ "\n", *(mutex##_holder)); \
+		fprintf(stderr, "lock " #mutex " is busy (%s): waiting in " __func__ "\n", *(mutex##_holder)); \
 		pthread_mutex_lock(mutex); \
 		fprintf(stderr, "... got\n"); \
 	} \
-	*(mutex##_holder) = __FUNCTION__; \
+	*(mutex##_holder) = __func__; \
 } while (0)
 
 #define Pthread_mutex_unlock(mutex) \
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
