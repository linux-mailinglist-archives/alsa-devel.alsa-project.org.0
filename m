Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F74336B9C
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 06:27:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1093716F9;
	Thu, 11 Mar 2021 06:26:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1093716F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615440427;
	bh=hWsnkRuJb7qpnixsMMtNyG+ABHy4L4oG0RnnCp0JdV0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K3diALoAK5inkFq7EfKi4UD5NNQ76byzIEY6i2ZHwqtnI5+FwybUHMsboxxZFUZVj
	 p6EVfWt3a7xJe92eZ+/j6939GxZxDgPFGQA7dbkf8hrAmFfCsIXOa2PtQodoA8RCQ3
	 iS7QJXb3spCrEQ/51+CBjb5NtOo+lSaAGbotnI68=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6994F804ED;
	Thu, 11 Mar 2021 06:22:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1489F80227; Thu, 11 Mar 2021 06:22:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE90EF8032C
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 06:22:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE90EF8032C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="lm/tEIq1"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="eFiCcbBD"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 1AA112FA0;
 Thu, 11 Mar 2021 00:22:07 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 11 Mar 2021 00:22:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=c8CvjuUr3RQk5
 H387/Mvm7ZDVN3RPJbq9mHJK9/9FPE=; b=lm/tEIq10m/0hmYV394BUwklNeJk0
 ssfMi04Js0eOEBWHNFb+W0KBnL9rgZh2/+vT2OlMtb3sIn6TyONE7zeYTTdsabHF
 iKdLe9FP/OGLUDoA3bD2xW5366vq7H/2dbO5QYQGplxmlqiVQ5Jq3TfumDoxWtGC
 UlDJrPPPASFFfGaK4i/ZEI8qJsScxSfjyu7CUIqqm2jpi9fOajC6Fxh+8HJjYJKz
 TVtZ5TBXatVXYy9CiFTBfZIKBUOd9IoclGjLEcR7rMQiPyoQnlqGScjFY4+mkVY2
 iBHNLD34VVitmlAiVrGsGjSOROGUTmc7+x7OJm5NbCTfW7CkKKZ60f7jA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=c8CvjuUr3RQk5H387/Mvm7ZDVN3RPJbq9mHJK9/9FPE=; b=eFiCcbBD
 vDw5kqFgh7Jm2uFLmuBES9l8WnXTjDCoaKvbmqGUTruyuP3MWk7m504WKyQCF+dE
 yrI5K34PayTyQ75yyMZSjnjE0aRy+bLjrAjrezkOlIYWBDctBi56nnTJdREoSjyP
 FM7NmI1D22iOolB4VqkFnm5IPmXJVPeAfQR41yHq3yjUd7iijqK494wv5kzslnSf
 aZXJXkKAx6/6+/Jp8YS9wvf33I+UIAO0k0bmKuMlwdFUlThEhvRs4euqLS9bXjYZ
 Jv1wnQVG41fQyDp9Afs+/KxBZF5/ZvmR3DjLZEoV5CB/gTcDDVe0YHfrE4lmjMGO
 6mHUwVKRmhStlQ==
X-ME-Sender: <xms:_qhJYA3V_lVBHs8YnB9RiMgNFChkIqr23YnA_D26H1q-ijydvrh8Pg>
 <xme:_qhJYLGA3IYdBJiSm8aUlJcl7IVH2MRUVD9Dxdb3QZyomC0MCQiy8nLdx9dDwPqct
 ZBh-O2vUWX85QsdpdM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduledgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:_qhJYI4pDqBVQWWWDqEipsC3adt4rOG86PKP-K1KaKAW3lYoyHYwJw>
 <xmx:_qhJYJ2xKJchwYgdB9dP42GF5vGd8XHvQlO7x5wepUs5IKjPhG1B7Q>
 <xmx:_qhJYDFy5gp1oK2YAjN0ggy6pY5SnlPe9eHRVPLP4O1LPi_olQUz0Q>
 <xmx:_qhJYGOqdcmMwnA-80t_YueQgiyo6KdOLl5fT3ESCGkZ75TQEskJ3w>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id A6080240054;
 Thu, 11 Mar 2021 00:22:05 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [alsa-utils][PATCH 11/14] axfer: test: use memfd_create() for
 mapper-test
Date: Thu, 11 Mar 2021 14:21:42 +0900
Message-Id: <20210311052146.404003-12-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210311052146.404003-1-o-takashi@sakamocchi.jp>
References: <20210311052146.404003-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

The mapper test program writes audio data frame to files, and read
them from the files, then validate them. For the operations, usage of
any in-memory file is good to shorten time of overall operations.

This commit uses shm by memfd_create().

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 axfer/test/mapper-test.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/axfer/test/mapper-test.c b/axfer/test/mapper-test.c
index 0bed4bb..477871d 100644
--- a/axfer/test/mapper-test.c
+++ b/axfer/test/mapper-test.c
@@ -6,11 +6,20 @@
 //
 // Licensed under the terms of the GNU General Public License, version 2.
 
+#include <aconfig.h>
+#ifdef HAVE_MEMFD_CREATE
+#define _GNU_SOURCE
+#endif
+
 #include "../mapper.h"
 #include "../misc.h"
 
 #include "generator.h"
 
+#ifdef HAVE_MEMFD_CREATE
+#include <sys/mman.h>
+#endif
+
 #include <stdlib.h>
 #include <unistd.h>
 #include <stdbool.h>
@@ -230,7 +239,11 @@ static int test_mapper(struct mapper_trial *trial, snd_pcm_access_t access,
 	for (i = 0; i < cntr_count; ++i) {
 		const char *path = trial->paths[i];
 
+#ifdef HAVE_MEMFD_CREATE
+		cntr_fds[i] = memfd_create(path, 0);
+#else
 		cntr_fds[i] = open(path, O_RDWR | O_CREAT | O_TRUNC, 0644);
+#endif
 		if (cntr_fds[i] < 0) {
 			err = -errno;
 			goto end;
@@ -255,10 +268,8 @@ static int test_mapper(struct mapper_trial *trial, snd_pcm_access_t access,
 		       frames_per_second, frames_per_buffer, check_buffer,
 		       frame_count, cntr_fds, cntr_count);
 end:
-	for (i = 0; i < cntr_count; ++i) {
-		unlink(trial->paths[i]);
+	for (i = 0; i < cntr_count; ++i)
 		close(cntr_fds[i]);
-	}
 
 	free(cntr_fds);
 
-- 
2.27.0

