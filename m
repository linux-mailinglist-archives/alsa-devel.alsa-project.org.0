Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E11B257646
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Aug 2020 11:13:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3358F184D;
	Mon, 31 Aug 2020 11:13:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3358F184D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598865238;
	bh=D3PlPG7gV6yHwlS8euLBulPj9X3Rb09FdnJHmaMU3dI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B6qMiP2Vu2snYXfldKjvpZv1FHFONK9iut0FhVGzDMKtH/1kB30+EhaCBB3iEG1YD
	 lN5QtDYAYsv0Eph/lpMJ7rwYh80fD9rzPoU53qyLPgAYoc3lM8Xg/ctGpBK9wnEKJW
	 QYgDEUDIWNUteRcTwRIuBLm7Uq3w5K3nI1gTfvKw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 868BFF8024A;
	Mon, 31 Aug 2020 11:08:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71207F802EA; Mon, 31 Aug 2020 11:08:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 611B5F8026F
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 11:08:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 611B5F8026F
IronPort-SDR: V8lsuoFyIvPLXkatYjrXQ0bccFPtnQbE91rcJ+1yEl06asNwHXf577Ar1oPXMQJ/+CJuLjjcPJ
 WEGfwmk0mjcQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9729"; a="136466783"
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; d="scan'208";a="136466783"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2020 02:08:19 -0700
IronPort-SDR: gozAWbBfCOt95Er7Bfi2b3CKNdSZJMQxSxaRiwUCRS7HJWI5z3Lgd1ckeehtJ3yfxlkFvg0XdJ
 jozznpWlYVcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; d="scan'208";a="314286961"
Received: from test-hp-compaq-8100-elite-cmt-pc.igk.intel.com ([10.237.149.93])
 by orsmga002.jf.intel.com with ESMTP; 31 Aug 2020 02:08:18 -0700
From: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 10/10] topology: Make buffer for saving dynamic size
Date: Mon, 31 Aug 2020 11:09:03 +0200
Message-Id: <1598864943-22883-11-git-send-email-piotrx.maziarz@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598864943-22883-1-git-send-email-piotrx.maziarz@linux.intel.com>
References: <1598864943-22883-1-git-send-email-piotrx.maziarz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, cezary.rojewski@intel.com,
 amadeuszx.slawinski@linux.intel.com, tiwai@suse.com
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

Some fields can exceed size limit, e.g. private data has no size
restriction. Therefore it needs to be dynamically increased.

Signed-off-by: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 src/topology/save.c | 34 +++++++++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/src/topology/save.c b/src/topology/save.c
index 4ecf86c..9c74735 100644
--- a/src/topology/save.c
+++ b/src/topology/save.c
@@ -19,22 +19,43 @@
 #include "tplg_local.h"
 
 #define SAVE_ALLOC_SHIFT	(13)	/* 8192 bytes */
+#define PRINT_BUF_SIZE		(1024)
+#define PRINT_BUF_SIZE_MAX	(1024 * 1024)
 
 int tplg_save_printf(char **dst, const char *pfx, const char *fmt, ...)
 {
 	va_list va;
-	char buf[1024], *s;
+	char *buf, *s;
 	size_t n, l, t, pl;
+	int ret = 0;
+
+	buf = malloc(PRINT_BUF_SIZE);
+	if (!buf)
+		return -ENOMEM;
 
 	if (pfx == NULL)
 		pfx = "";
 
 	va_start(va, fmt);
-	n = vsnprintf(buf, sizeof(buf), fmt, va);
+	n = vsnprintf(buf, PRINT_BUF_SIZE, fmt, va);
 	va_end(va);
 
-	if (n >= sizeof(buf))
-		return -EOVERFLOW;
+	if (n >= PRINT_BUF_SIZE_MAX) {
+		ret = -EOVERFLOW;
+		goto end;
+	}
+
+	if (n >= PRINT_BUF_SIZE) {
+		char *tmp = realloc(buf, n + 1);
+		if (!tmp) {
+			ret = -ENOMEM;
+			goto end;
+		}
+		buf = tmp;
+		va_start(va, fmt);
+		n = vsnprintf(buf, n + 1, fmt, va);
+		va_end(va);
+	}
 
 	pl = strlen(pfx);
 	l = *dst ? strlen(*dst) : 0;
@@ -47,7 +68,8 @@ int tplg_save_printf(char **dst, const char *pfx, const char *fmt, ...)
 		if (s == NULL) {
 			free(*dst);
 			*dst = NULL;
-			return -ENOMEM;
+			ret = -ENOMEM;
+			goto end;
 		}
 	} else {
 		s = *dst;
@@ -57,6 +79,8 @@ int tplg_save_printf(char **dst, const char *pfx, const char *fmt, ...)
 		strcpy(s + l, pfx);
 	strcpy(s + l + pl, buf);
 	*dst = s;
+end:
+	free(buf);
 	return 0;
 }
 
-- 
2.7.4

