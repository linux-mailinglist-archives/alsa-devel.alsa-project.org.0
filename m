Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B099DCAE428
	for <lists+alsa-devel@lfdr.de>; Mon, 08 Dec 2025 22:45:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC90F601F9;
	Mon,  8 Dec 2025 22:45:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC90F601F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765230332;
	bh=5Ad7mIfXe4fIKz2BSSWbn8C7+lmncJn6Tdra8YjJSho=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=NTOPobH3uLv9gH+EKcxbhXPDN+M4KgQ2e1H+abRWcbSyrw/piWpMO5XBkK4aYBQ5R
	 ONiMgx1xOKRCXI4PVv1zAb/mKsHozDoELo6r79UZ0M3cYmO80/7yvDCE4h4v+1B/fz
	 9Vl9LOheOXkL2od9SqkMb6ZCZHVNJFRYYqyUTKD0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53B7BF805D9; Mon,  8 Dec 2025 22:44:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C5FF4F805D8;
	Mon,  8 Dec 2025 22:44:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92379F80525; Mon,  8 Dec 2025 22:44:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=BAYES_20,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id E904FF800ED
	for <alsa-devel@alsa-project.org>; Mon,  8 Dec 2025 22:44:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E904FF800ED
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <187f5b978c917500-webhooks-bot@alsa-project.org>
In-Reply-To: <187f5b978b928300-webhooks-bot@alsa-project.org>
References: <187f5b978b928300-webhooks-bot@alsa-project.org>
Subject: Build Failure Due to Undefined Reference to close_range with alsa-lib
 1.2.15
Date: Mon,  8 Dec 2025 22:44:48 +0100 (CET)
Message-ID-Hash: H7RKQINSB3XUN42YLXELQWO2RROMJFBM
X-Message-ID-Hash: H7RKQINSB3XUN42YLXELQWO2RROMJFBM
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H7RKQINSB3XUN42YLXELQWO2RROMJFBM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #485 was opened from darkshram:

### Description

I encountered a build failure while compiling **alsa-lib 1.2.15** due to an undefined reference to `close_range`. My environment uses **glibc 2.30**, which should support this function.

### Error Message

```
ucm/.libs/libucm.a(ucm_exec.o): In function `uc_mgr_exec':
/builddir/build/BUILD/alsa-lib-1.2.15/src/ucm/ucm_exec.c:263: undefined reference to `close_range'
collect2: error: ld returned 1 exit status
```

### Solution

To resolve the issue, I applied the following patch, which effectively reverses [the change that introduced](https://github.com/alsa-project/alsa-lib/pull/459) `close_range`:

```
diff -Naur alsa-lib-1.2.15.orig/src/ucm/ucm_exec.c alsa-lib-1.2.15/src/ucm/ucm_exec.c
--- alsa-lib-1.2.15.orig/src/ucm/ucm_exec.c     2025-12-07 13:41:56.000000000 -0600
+++ alsa-lib-1.2.15/src/ucm/ucm_exec.c  2025-12-08 15:03:30.632324127 -0600
@@ -259,12 +259,8 @@
                close(f);

-#if defined(_GNU_SOURCE)
-               close_range(3, maxfd, 0);
-#else
                for (f = 3; f < maxfd; f++)
                        close(f);
-#endif

                /* install default handlers for the forked process */
                signal(SIGINT, SIG_DFL);
```
This workaround restored compatibility and allowed the build to complete successfully.

### Additional Information

Please consider this issue for further review. If close_range is required, clearer compatibility notes might be beneficial. Thank you!

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/485
Repository URL: https://github.com/alsa-project/alsa-lib
