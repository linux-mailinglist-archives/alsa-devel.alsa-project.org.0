Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF79104332
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 19:21:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E866175B;
	Wed, 20 Nov 2019 19:20:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E866175B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574274076;
	bh=JP+0Odq89p3KstXzhlyevf3EyzDPN3x6xN1zXxtauQg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tj6nmSNVM1Sgp4ZLg2qCQPmvgQJAvVl/5HhNZbAyBGYTVvFvDcJRE1PmGQQiYZQSu
	 7r5louEwzisUC2v2ev9vV925HJsPjhoE/jq7ljvMls5vQk0ZZy1/WmwS6OiD28fv2S
	 nH5TwoDTSYdahpWInVqrESl3URAb+fB6TwhMhEQU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3B12F8013F;
	Wed, 20 Nov 2019 19:19:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 948F7F8013D; Wed, 20 Nov 2019 19:19:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0B2FF800F0
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 19:19:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0B2FF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="p0CWX3lo"
Received: by mail-pg1-x543.google.com with SMTP id 207so118498pge.8
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 10:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J+EISKkBcokl8f2rL2XT7VvGDoW0tpFRO5otFG6ZUDg=;
 b=p0CWX3loJrmV2WbMtfaETPwwcXK7TUsGCnAr9zXYXHxkiyTuixl7DqYmqOG0Ct1y3r
 EWQadxzWtwoJ+pXLyPWiO+WAnSZ6V14hI82a8vPUYA+Wa0T84mfOqWrOuvLAxvhN3qTD
 Y6yr8t3BekB4LVXlQNw4dT3hNdgHJZ+XyN8LXMp7nI2ZwsIQCOtc9ni6QAztm+SL3CNX
 nJ6w2uVecvIAxqH7rMiVSL8HhLVfst2ZtkbjCAnjjE2efQMaCAMANjZ5Yl8rX2XMaymI
 ocR/5yRNYWJ/ySTJRQska7rjr5nQB9t5daYM05mDS4HooU8UUcYd/eEH1KIQk0Sghiy4
 zxXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J+EISKkBcokl8f2rL2XT7VvGDoW0tpFRO5otFG6ZUDg=;
 b=r73Q3HgCrmztVydz4Jap0qqJ/9qkioAxM/TWMxFHu3pnxAbnf30rprl/00jLICx1Zq
 FhFzYd3AATf563c35NjchaOLs0MJdqwE/25Y1yotbY4eIUD39xgqX7jDtcYRQyspYFpX
 N2BI8M4r56LSMk2YUFy9TrYvJWDQI58mUYtIytOVdDuhfRe1nIvYz+XUK9oAj9KMFlzE
 4xA/mMeEzCS6iIzVHODULdW6Tq66xUgM4vsoZhLo++WP3QnHI3Pr5XvoGaoCQVPPWUcR
 woGjLj9YaBLOZ83A6N5j1QLFk0HyzKDm3gm9wfNNFxoFKU88zbMsXkcowF3efip1gKKK
 q6/g==
X-Gm-Message-State: APjAAAUWhYMCpQxiZ+Fqpp592DEH+INgD2UwsUMGIDI8OgftVZ5I/iY4
 FAo0Lq2Y9d6JUVZas6436oYxMfg0ePc=
X-Google-Smtp-Source: APXvYqxJA+Q+TCSLJ3wPlWE5V2dt0RKmQhtVzkGF0eVvtt025NszGK00zarOBt7q26RqZfevHrqWLg==
X-Received: by 2002:aa7:870c:: with SMTP id b12mr5663124pfo.30.1574273963196; 
 Wed, 20 Nov 2019 10:19:23 -0800 (PST)
Received: from mangix-trapnet.lan ([69.42.0.214])
 by smtp.gmail.com with ESMTPSA id s1sm22502272pgk.9.2019.11.20.10.19.22
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 10:19:22 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: alsa-devel@alsa-project.org
Date: Wed, 20 Nov 2019 10:19:20 -0800
Message-Id: <20191120181920.178406-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [alsa-devel] [PATCH] aplay: Adjust buffer sizes to fix snprintf
	warnings
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

It also reduces compiled size slightly.

aplay.c: In function 'capture':
aplay.c:3055:34: error: '-01' directive output may be truncated writing 3
bytes into a region of size between 1 and 4097 [-Werror=format-truncation=
]
 3055 |    snprintf(namebuf, namelen, "%s-01", buf);
      |                                  ^~~
aplay.c:3055:4: note: 'snprintf' output between 4 and 4100 bytes into a
destination of size 4097
 3055 |    snprintf(namebuf, namelen, "%s-01", buf);
      |    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
aplay.c:3053:34: error: '-01.' directive output may be truncated writing 4
bytes into a region of size between 1 and 4097 [-Werror=format-truncation=
]
 3053 |    snprintf(namebuf, namelen, "%s-01.%s", buf, s);
      |                                  ^~~~
aplay.c:3053:4: note: 'snprintf' output 5 or more bytes (assuming 4101)
into a destination of size 4097
 3053 |    snprintf(namebuf, namelen, "%s-01.%s", buf, s);
      |    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
aplay.c:3065:34: error: '%02i' directive output may be truncated writing
between 2 and 10 bytes into a region of size between 0 and 4096 [-Werror=
format-truncation=]
 3065 |   snprintf(namebuf, namelen, "%s-%02i", buf, filecount);
      |                                  ^~~~
aplay.c:3065:30: note: directive argument in the range [1, 2147483647]
 3065 |   snprintf(namebuf, namelen, "%s-%02i", buf, filecount);
      |                              ^~~~~~~~~
aplay.c:3065:3: note: 'snprintf' output between 4 and 4108 bytes into a
destination of size 4097
 3065 |   snprintf(namebuf, namelen, "%s-%02i", buf, filecount);
      |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
aplay.c:3063:34: error: '%02i' directive output may be truncated writing
between 2 and 10 bytes into a region of size between 0 and 4096 [-Werror=
format-truncation=]
 3063 |   snprintf(namebuf, namelen, "%s-%02i.%s", buf, filecount, s);
      |                                  ^~~~
aplay.c:3063:30: note: directive argument in the range [1, 2147483647]
 3063 |   snprintf(namebuf, namelen, "%s-%02i.%s", buf, filecount, s);
      |                              ^~~~~~~~~~~~
aplay.c:3063:3: note: 'snprintf' output 5 or more bytes (assuming 4109)
into a destination of size 4097
 3063 |   snprintf(namebuf, namelen, "%s-%02i.%s", buf, filecount, s);

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 aplay/aplay.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/aplay/aplay.c b/aplay/aplay.c
index 9c5a11b..1a887e4 100644
--- a/aplay/aplay.c
+++ b/aplay/aplay.c
@@ -3017,7 +3017,7 @@ static int new_capture_file(char *name, char *namebuf, size_t namelen,
 			    int filecount)
 {
 	char *s;
-	char buf[PATH_MAX+1];
+	char buf[PATH_MAX-10];
 	time_t t;
 	struct tm *tmp;
 
@@ -3124,7 +3124,7 @@ static void capture(char *orig_name)
 	int tostdout=0;		/* boolean which describes output stream */
 	int filecount=0;	/* number of files written */
 	char *name = orig_name;	/* current filename */
-	char namebuf[PATH_MAX+1];
+	char namebuf[PATH_MAX+2];
 	off64_t count, rest;		/* number of bytes to capture */
 	struct stat statbuf;
 
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
