Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D2B41C02
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 08:10:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AECB16FB;
	Wed, 12 Jun 2019 08:10:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AECB16FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560319851;
	bh=2pLUhg6EB2NkoWQSL+WTe5LHk47Y9JVkA3GPaTgDAHA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lbqloz7XAr6l/FjRwuQoBoneUahFVe87Z4YMnZ3icKHX688faQorN20sjit0XAlVn
	 1yEj+HVL4tJNDxPOsT/ameGqtQpebRGPhLD2jyYSyYpW8PiAV3LESPfZeCgE6675gc
	 bkRqjsTWhPDIFDepR+Ii8DI9x9DWv/y7Va19fK7A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EBE1F80791;
	Wed, 12 Jun 2019 08:08:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F6F0F89733; Wed, 12 Jun 2019 08:08:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8503FF896EA
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 08:08:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8503FF896EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mforney-org.20150623.gappssmtp.com
 header.i=@mforney-org.20150623.gappssmtp.com header.b="JJ72nT31"
Received: by mail-pl1-x641.google.com with SMTP id d21so6169350plr.3
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 23:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mforney-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f9eVawg0XmsKk0O1m0dcmUDc1r9P3WPIfld9lLkCXzA=;
 b=JJ72nT31/KvMptbdtkke+rrxrxLyjanidQf7VpFL3HzUiq1KPoXrv5VEKd0/wk3wDt
 Eq0XTbsmdRcugWpBng0wr2kgum+PRr7eg/4Ajv5kYjtN0jkHDbAZi4SEIV2X/mTe0JjG
 M1ViqrKTOC0BX2xJ/xppTdnCGMo2NLcmS7lQ7Wd0bSIDQfFoyyN9xNk8YmCpGjZUn/1u
 /D2wSTzHOvWepe+whkO9k/+T4403WaBGXbRAIwlZGrQPJbqObnAjG5Ttwu27rHObt3V5
 8VQolth873dCX+Ll34XUUlkEdt7fq41vN5aUhulIIQgF2KEIjZj5VTBREh5opxaqBEZr
 Yybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f9eVawg0XmsKk0O1m0dcmUDc1r9P3WPIfld9lLkCXzA=;
 b=fdkzCmenU27hPX+H/ZyyuO5VAYawkzwoXPhvBlqMIjUOXCUeunFGNDk1/nTTO84dpa
 zB0xbUGGLUIL709TgHmkN7ktty/zXdsSwObRZxsTkOoexzU8QosZ54IJPmankuCVHATu
 bT2Mu+e7+2Dzh+cCqxPCghaF8adzCHUOIbNC7jAQbH+JDE8PQHExWnAk6sBxXsXVsiOC
 2ZRE17NQUOROllCmVFwNxnCbHQ4+vQwPFIXijHSMQarSBi+Y4nKpH7fUYVK8hJwUT62Z
 UOdw77DgNB5AjI+LhQ28XLph/RtQWTix0QuRaAr+sT8NFJZKJ5K6zCZsexzSf+OKamDI
 6xnQ==
X-Gm-Message-State: APjAAAULX+efrzZlmZ7ah7MVSqY0VTXbp73EO4LZrxcQCOQtxtDGVxB4
 r+F0Bn6YQT3ci0py5rWr4hSeaA==
X-Google-Smtp-Source: APXvYqwCd4Tw/cZwLViNBZIoTpEoScgz8/ehBr9u57ka5S9fTbf1/JVnGKmUHfyZ4Ublk7MGve9Uxw==
X-Received: by 2002:a17:902:7004:: with SMTP id
 y4mr32137004plk.31.1560319698659; 
 Tue, 11 Jun 2019 23:08:18 -0700 (PDT)
Received: from localhost ([2601:647:5180:35d7::cf52])
 by smtp.gmail.com with ESMTPSA id n7sm18554647pgi.54.2019.06.11.23.08.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 23:08:18 -0700 (PDT)
From: Michael Forney <mforney@mforney.org>
To: patch@alsa-project.org
Date: Tue, 11 Jun 2019 23:08:10 -0700
Message-Id: <20190612060814.13534-3-mforney@mforney.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612060814.13534-1-mforney@mforney.org>
References: <20190612060814.13534-1-mforney@mforney.org>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 2/6] List cases in range explicitly
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

Case ranges are a GNU extension, and provide only a slight readability
improvement.

Signed-off-by: Michael Forney <mforney@mforney.org>
---
 src/conf.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/src/conf.c b/src/conf.c
index 3e4b76a3..77fd0da5 100644
--- a/src/conf.c
+++ b/src/conf.c
@@ -888,7 +888,8 @@ static int get_quotedchar(input_t *input)
 		return '\r';
 	case 'f':
 		return '\f';
-	case '0' ... '7':
+	case '0': case '1': case '2': case '3':
+	case '4': case '5': case '6': case '7':
 	{
 		int num = c - '0';
 		int i = 1;
@@ -1479,7 +1480,8 @@ static void string_print(char *str, int id, snd_output_t *out)
 	}
 	if (!id) {
 		switch (*p) {
-		case '0' ... '9':
+		case '0': case '1': case '2': case '3': case '4':
+		case '5': case '6': case '7': case '8': case '9':
 		case '-':
 			goto quoted;
 		}
@@ -1488,8 +1490,6 @@ static void string_print(char *str, int id, snd_output_t *out)
 	switch (*p) {
 	case 0:
 		goto nonquoted;
-	case 1 ... 31:
-	case 127 ... 255:
 	case ' ':
 	case '=':
 	case ';':
@@ -1501,6 +1501,8 @@ static void string_print(char *str, int id, snd_output_t *out)
 	case '"':
 		goto quoted;
 	default:
+		if (*p <= 31 || *p >= 127)
+			goto quoted;
 		p++;
 		goto loop;
 	}
@@ -1542,12 +1544,11 @@ static void string_print(char *str, int id, snd_output_t *out)
 			snd_output_putc(out, '\\');
 			snd_output_putc(out, c);
 			break;
-		case 32 ... '\'' - 1:
-		case '\'' + 1 ... 126:
-			snd_output_putc(out, c);
-			break;
 		default:
-			snd_output_printf(out, "\\%04o", c);
+			if (c >= 32 && c <= 126 && c != '\'')
+				snd_output_putc(out, c);
+			else
+				snd_output_printf(out, "\\%04o", c);
 			break;
 		}
 		p++;
@@ -4687,7 +4688,8 @@ static int parse_char(const char **ptr)
 	case 'f':
 		c = '\f';
 		break;
-	case '0' ... '7':
+	case '0': case '1': case '2': case '3':
+	case '4': case '5': case '6': case '7':
 	{
 		int num = c - '0';
 		int i = 1;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
