Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6823A209E2B
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jun 2020 14:11:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05FAC18D4;
	Thu, 25 Jun 2020 14:10:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05FAC18D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593087097;
	bh=jJMobRRJJtzFYwugY7LNlLfjeGm+OfGICmdhKue+liE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MMCZ29WmfBmh92dkXpUS2EOT1cCQ1bEJ44qyFkXZcitdYGbVwCJU4uXc1LhujepPs
	 pFLerLU1QGRe1M+K5FAqc960TfwKPFMDbHkBzKMjlT4QcdYsUUtS7VB9uan/o3tgaL
	 VH0hPh3zun1+5tBu0cMqNkvDzGMIuUfJwqQeON2s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFBD5F802F9;
	Thu, 25 Jun 2020 14:06:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEBE0F8025E; Thu, 25 Jun 2020 14:05:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E6B7F8025E
 for <alsa-devel@alsa-project.org>; Thu, 25 Jun 2020 14:05:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E6B7F8025E
IronPort-SDR: uYoe4PiytYMNW6eKmah6TeVvYBFAO7xtfFMBMN6yC7a3fUB/ZClVMTs3aRCN77Mt+IbZy/q1sn
 mG2vXvpMND6g==
X-IronPort-AV: E=McAfee;i="6000,8403,9662"; a="206389955"
X-IronPort-AV: E=Sophos;i="5.75,279,1589266800"; d="scan'208";a="206389955"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 05:05:46 -0700
IronPort-SDR: qrmUxfyYrdtfPUTadlSuIC4+ZjywDLGu75ERzSpG8Sgh/KITdpWc/+WY9Ci/T2nGeJ+w50GEXN
 wVM1O4YQNwwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,279,1589266800"; d="scan'208";a="354438989"
Received: from test-hp-compaq-8100-elite-cmt-pc.igk.intel.com ([10.237.149.93])
 by orsmga001.jf.intel.com with ESMTP; 25 Jun 2020 05:05:43 -0700
From: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 8/8] topology: Make buffer for saving dynamic size
Date: Thu, 25 Jun 2020 13:03:46 +0200
Message-Id: <1593083026-7501-8-git-send-email-piotrx.maziarz@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593083026-7501-1-git-send-email-piotrx.maziarz@linux.intel.com>
References: <1593083026-7501-1-git-send-email-piotrx.maziarz@linux.intel.com>
Cc: cezary.rojewski@intel.com, amadeuszx.slawinski@intel.com
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
---
 src/topology/save.c | 36 ++++++++++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/src/topology/save.c b/src/topology/save.c
index 4ecf86c..d6ee8b6 100644
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
-	size_t n, l, t, pl;
+	char *buf, *s;
+	size_t n, alloc_size = PRINT_BUF_SIZE, l, t, pl;
+	int ret = 0;
+
+	buf = malloc(alloc_size);
+	if (!buf)
+		return -ENOMEM;
 
 	if (pfx == NULL)
 		pfx = "";
 
+again:
 	va_start(va, fmt);
-	n = vsnprintf(buf, sizeof(buf), fmt, va);
+	n = vsnprintf(buf, alloc_size, fmt, va);
 	va_end(va);
 
-	if (n >= sizeof(buf))
-		return -EOVERFLOW;
+	if (n >= PRINT_BUF_SIZE_MAX) {
+		ret = -EOVERFLOW;
+		goto end;
+	}
+
+	if (n >= alloc_size) {
+		char *tmp = realloc(buf, n + 1);
+		if (!tmp) {
+			ret = -ENOMEM;
+			goto end;
+		}
+		buf = tmp;
+		alloc_size = n + 1;
+		goto again;
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

