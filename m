Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0BD336B9E
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 06:27:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C4001731;
	Thu, 11 Mar 2021 06:27:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C4001731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615440471;
	bh=TwA2R6DmbHVuJvbq36KH6uDITNZT7Ov156muPuayL+s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RkI7AymRjR17LpBmMmPLCAgkL4w010OKPQ07iYksxYzQ28NfIdTy2QiR14HSghgze
	 f/illO2N6FZ0f0nJy/vMPOqIXWbmGJ8RmeP1pvqmvIIebsEpLxZjJx2GooX3FKRPkh
	 hodsnxEvX8LBVnezYXfOt2BXEhHRMGigxjjBuFbs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51E27F804FB;
	Thu, 11 Mar 2021 06:22:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F91BF804DF; Thu, 11 Mar 2021 06:22:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6009F8028B
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 06:22:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6009F8028B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="B8a38dNA"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="rKYbjXPB"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 48A612FAB;
 Thu, 11 Mar 2021 00:22:04 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 11 Mar 2021 00:22:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=IOhvbMZH//nWS
 bbPVT69woj8xjZoDxi1XqKagcL9FCI=; b=B8a38dNAcj47HRALnFCQGPN2GSxg3
 tcKv8MioUcFnKklPlC2LgayVt8dFPCpV2jFIT9LSvpIyRfjRziSu2oKFFcdMGVv6
 e9mdBfjlkGG0YmxQp7JdUJWFdFlC+X7tUlyTOXnLG93sqvzu4q6Gfc6h45pdOJPn
 KOqTb+66FmpK64J+YrYBK44k/E/zgjk6Z/s6awhRbossFsdo5/tghFB8M99MermD
 CnJ4tycn/+ruVwVk5f4zcny8PfSHbduR07iaXH7Ucyzax+eT6yFdqdzIw+M1gJwN
 UiOSdIq/8xxCMjZwCVUHFWpj5jazPGmlsb71gqmMw0bmqmlCcxb3UHN+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=IOhvbMZH//nWSbbPVT69woj8xjZoDxi1XqKagcL9FCI=; b=rKYbjXPB
 BpSz5TUHeyBUjNPJND4SJeQqwV2wjyp/6iKdJzvmNGe69414VOGp3E/JCqU0YtJq
 ZFxZvQl6AhK14QJfl24+Nd1QxjCYGvigUriluROViILmlSOBUm0j3rD7hZjdPNeT
 rzBaJVLCNhwAtVkfC2kb0YP3/FEADhbo5tlhsBZ+G6chbEeYgTz8Ka5uN/PQMn0W
 Q2IfTrUjNFDOq8jixncz3x1+BlV2twQt8kdCwKaPVo9fMLwAWdLoFaMpvNlKyqGk
 vsPq4HgBLuoEz9yQ1t6I79Md5X1HYcr29IkOMyhtgvi4B50ihGwpmDulRlv4LYX/
 OdCfo1ZpHgdfQQ==
X-ME-Sender: <xms:-6hJYPjHF4lXc_lUeAzOfl_Gqi7IBW8eIR_rQID8ztvNmASWmJULXw>
 <xme:-6hJYMAQX233uzScnAKAQC039CaL8fG9RTbAo1KC4hiGUsvJn9OWBhRHZBOefSvJ9
 l7RlGHLS3yHzjhwFe8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduledgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:-6hJYPH55uIfmDc_2dx1zMbEgtNolW-2ZjNy3N6uJ_7-eTemh7Jyag>
 <xmx:-6hJYMRd9s3qPGDOknuLary6xXXNAh3v7moQcTXSjg_tCHN9QOmJlA>
 <xmx:-6hJYMzIF6-Q9OM1DhGOB4ciSHBYoSVX7uTvfo1bUjfRLi4f4Zz2SA>
 <xmx:-6hJYCYEJaxYS9KVPPv6WM7ue79DZJ437BtVRpN1yRnHtj_cGeb_FA>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id D27D7240054;
 Thu, 11 Mar 2021 00:22:02 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [alsa-utils][PATCH 09/14] axfer: test: use memfd_create() for
 container-test
Date: Thu, 11 Mar 2021 14:21:40 +0900
Message-Id: <20210311052146.404003-10-o-takashi@sakamocchi.jp>
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

The container test program writes audio data frame to file, and read
them from the file, then validate them. For the operations, usage of
any in-memory file is good to shorten time of overall operations.

This commit uses shm via memfd_create(). As a result, overall time to
run is shorten one half of before, depending on machine environment.

I note that we can achieve the same result by using O_TMPFILE flag in
open(2) system call, however the implementation of O_TMPFILE is to add
i-node without name on underling file system, thus it has overhead
depending on implementation in each file system. On the other hand,
memfd_create() is directly relevant to shm and expected to be less
overhead.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 axfer/test/container-test.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/axfer/test/container-test.c b/axfer/test/container-test.c
index 4d825b6..4e2dcc2 100644
--- a/axfer/test/container-test.c
+++ b/axfer/test/container-test.c
@@ -6,11 +6,20 @@
 //
 // Licensed under the terms of the GNU General Public License, version 2.
 
+#include <aconfig.h>
+#ifdef HAVE_MEMFD_CREATE
+#define _GNU_SOURCE
+#endif
+
 #include "../container.h"
 #include "../misc.h"
 
 #include "generator.h"
 
+#ifdef HAVE_MEMFD_CREATE
+#include <sys/mman.h>
+#endif
+
 #include <stdlib.h>
 #include <unistd.h>
 #include <stdbool.h>
@@ -142,16 +151,17 @@ static int callback(struct test_generator *gen, snd_pcm_access_t access,
 	if (buf == NULL)
 		return -ENOMEM;
 
-	// Remove a result of a previous trial.
-	unlink(name);
-
 	for (i = 0; i < ARRAY_SIZE(entries); ++i) {
 		int fd;
 		off64_t pos;
 
 		frames_per_second = entries[i];
 
+#ifdef HAVE_MEMFD_CREATE
+		fd = memfd_create(name, 0);
+#else
 		fd = open(name, O_RDWR | O_CREAT | O_TRUNC, 0644);
+#endif
 		if (fd < 0) {
 			err = -errno;
 			break;
@@ -176,7 +186,6 @@ static int callback(struct test_generator *gen, snd_pcm_access_t access,
 		assert(err == 0);
 
 		close(fd);
-		unlink(name);
 	}
 
 	free(buf);
-- 
2.27.0

