Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF85D15276D
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Feb 2020 09:14:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F7E01683;
	Wed,  5 Feb 2020 09:13:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F7E01683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580890470;
	bh=OHbjJEB0639+qAcJFne2U5HiG1A7AIoEFuImcMDR0Xs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tNHXQV1Aen2ZAa8Kx4fAok1qoBuRAXBBhtzBLHBlNrQAHJL5ONMyQOlPYdYluCS/k
	 14Yve55Zg/i3swiEZ1X7Lz9tNmE0yRhPKQEitmIXg4BGrh/Anx8oB4oB/V6NgUxidi
	 lPoEUOMl2dgZKylr1+Y7dY3jNVHXyfG5Kv//KJVA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 455C3F80142;
	Wed,  5 Feb 2020 09:12:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AF5BF80150; Wed,  5 Feb 2020 09:12:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D1BDF800AB
 for <alsa-devel@alsa-project.org>; Wed,  5 Feb 2020 09:12:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D1BDF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mforney-org.20150623.gappssmtp.com
 header.i=@mforney-org.20150623.gappssmtp.com header.b="Swv1Cx5b"
Received: by mail-pg1-x543.google.com with SMTP id z124so561229pgb.13
 for <alsa-devel@alsa-project.org>; Wed, 05 Feb 2020 00:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mforney-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wR2IPbO5mn8ThLdUubtaVrM/Xmy7qMj0RvMIXoMH0kw=;
 b=Swv1Cx5brvmzu0z3odivs56aY7unkJVz2YE6uJ9hgH4dID72O1x4lOjtat4GMpdon6
 upPXyvmaIPFfTHM5yyWP1CCx4L4DdS6jMZAFDXxrdpYCvm93sQxe+YmfiRUl4EQ9Ilb4
 KjGbHivczU7PVC1IzTLkX3TqIg/P+a1TLOiRURiL00KecXd3dssqAb9SL1CmTKj5f8Qw
 9riy4I1Tww+QZav7KskIJuNj+C7qgMHjLSjdg6/e0iuzAC1xNGWXm5QT8le5cpQcn4NF
 xxmwa+g2OYQu5uWr5stbQ/7EGqBSc+QRl9ByvxAE/FAnDR1Fm1GagZrgPVD+AII5+VXE
 b6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wR2IPbO5mn8ThLdUubtaVrM/Xmy7qMj0RvMIXoMH0kw=;
 b=eFI6GVsB4kkG26a2CBiDNn2Le6gDwq18ZRNJad6g/NiPEp88js4B3RsecqJoHYGLee
 RMaeNtobD/r16LmVER45fknRdN+M5IJnbH2cWb4+APcTzSaZD5+0uIdOn3D7uD7xwhWb
 EnVs62j++Efqlx7Fz8CKbtnC4Jp8XRBbaTdDiejUIS4F/Hh2tvTEvaJe4yhzdA9qH2Gn
 x+dYppSIOXPo0FffKPeDi08eMBfT9XjGEL47UF10Iwh5Ym3X8xU46gg7jRwy/clr1lkR
 9Fr1/OuJ8powecDv2MYeHBxwvv60fSih5lQfU2omF6wIIu5vg9YO2IGq3GZRWbYB0RRY
 c7vg==
X-Gm-Message-State: APjAAAXzFmk6jZKxBYK2XAcJTQwWmE3iHQwaj+dSafTtWHWK+yJCy5UF
 XqWIQ4iQCA6nnCCsvQC9eFspcOpLtcsQqQ==
X-Google-Smtp-Source: APXvYqxlugVbN6o7Op2xB2tfS1CgYjL4yJedIHKMF1xwTQn/I6IRAULZyjMvjfeI9rR49nQrlQH10g==
X-Received: by 2002:aa7:8181:: with SMTP id g1mr35805837pfi.215.1580890358672; 
 Wed, 05 Feb 2020 00:12:38 -0800 (PST)
Received: from localhost ([2601:647:5180:4570:16dd:a9ff:fee7:6b79])
 by smtp.gmail.com with ESMTPSA id d2sm6296486pjv.18.2020.02.05.00.12.37
 for <alsa-devel@alsa-project.org>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Feb 2020 00:12:38 -0800 (PST)
From: Michael Forney <mforney@mforney.org>
To: alsa-devel@alsa-project.org
Date: Wed,  5 Feb 2020 00:12:18 -0800
Message-Id: <20200205081221.18665-1-mforney@mforney.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [alsa-devel] [PATCH alsa-utils 1/4] Use __func__ instead of
	__FUNCTION__
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
 alsactl/alsactl.h | 16 ++++++++--------
 aplay/aplay.c     |  4 ++--
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/alsactl/alsactl.h b/alsactl/alsactl.h
index 4f969ec..69b539c 100644
--- a/alsactl/alsactl.h
+++ b/alsactl/alsactl.h
@@ -13,15 +13,15 @@ void cerror_(const char *fcn, long line, int cond, const char *fmt, ...);
 void dbg_(const char *fcn, long line, const char *fmt, ...);
 
 #if __GNUC__ > 2 || (__GNUC__ == 2 && __GNUC_MINOR__ >= 95)
-#define info(...) do { info_(__FUNCTION__, __LINE__, __VA_ARGS__); } while (0)
-#define error(...) do { error_(__FUNCTION__, __LINE__, __VA_ARGS__); } while (0)
-#define cerror(cond, ...) do { cerror_(__FUNCTION__, __LINE__, (cond) != 0, __VA_ARGS__); } while (0)
-#define dbg(...) do { dbg_(__FUNCTION__, __LINE__, __VA_ARGS__); } while (0)
+#define info(...) do { info_(__func__, __LINE__, __VA_ARGS__); } while (0)
+#define error(...) do { error_(__func__, __LINE__, __VA_ARGS__); } while (0)
+#define cerror(cond, ...) do { cerror_(__func__, __LINE__, (cond) != 0, __VA_ARGS__); } while (0)
+#define dbg(...) do { dbg_(__func__, __LINE__, __VA_ARGS__); } while (0)
 #else
-#define info(args...) do { info_(__FUNCTION__, __LINE__, ##args); }  while (0)
-#define error(args...) do { error_(__FUNCTION__, __LINE__, ##args); }  while (0)
-#define cerror(cond, ...) do { error_(__FUNCTION__, __LINE__, (cond) != 0, ##args); } while (0)
-#define dbg(args...) do { dbg_(__FUNCTION__, __LINE__, ##args); }  while (0)
+#define info(args...) do { info_(__func__, __LINE__, ##args); }  while (0)
+#define error(args...) do { error_(__func__, __LINE__, ##args); }  while (0)
+#define cerror(cond, ...) do { error_(__func__, __LINE__, (cond) != 0, ##args); } while (0)
+#define dbg(args...) do { dbg_(__func__, __LINE__, ##args); }  while (0)
 #endif	
 
 int init(const char *file, const char *cardname);
diff --git a/aplay/aplay.c b/aplay/aplay.c
index 1a887e4..908093c 100644
--- a/aplay/aplay.c
+++ b/aplay/aplay.c
@@ -186,13 +186,13 @@ static const struct fmt_capture {
 
 #if __GNUC__ > 2 || (__GNUC__ == 2 && __GNUC_MINOR__ >= 95)
 #define error(...) do {\
-	fprintf(stderr, "%s: %s:%d: ", command, __FUNCTION__, __LINE__); \
+	fprintf(stderr, "%s: %s:%d: ", command, __func__, __LINE__); \
 	fprintf(stderr, __VA_ARGS__); \
 	putc('\n', stderr); \
 } while (0)
 #else
 #define error(args...) do {\
-	fprintf(stderr, "%s: %s:%d: ", command, __FUNCTION__, __LINE__); \
+	fprintf(stderr, "%s: %s:%d: ", command, __func__, __LINE__); \
 	fprintf(stderr, ##args); \
 	putc('\n', stderr); \
 } while (0)
-- 
2.25.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
