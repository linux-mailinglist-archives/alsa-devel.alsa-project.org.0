Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9146E336B99
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 06:26:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2661216FB;
	Thu, 11 Mar 2021 06:25:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2661216FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615440361;
	bh=4NRTMp4PVgpj9g5bNAntQSSwrm11aHGAiuLS2wfgOlI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dReB7FOoV/A9SsLdrvhggqVVYSrYUmVXxvMEkvZjB3kuJKylw+QJZUr6fW7t4v5Ni
	 GkaNoTWcrTDO77/b/XhuUaRWs/8PMhIDl3185oxBVvLd+xPa79NBotFrhs8swSMRtN
	 KiuL51b7RA4tsF6S5qyuAWEH1bKYTm26lh7s0cKk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDBD4F804E2;
	Thu, 11 Mar 2021 06:22:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D0B9F804B2; Thu, 11 Mar 2021 06:22:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8212F80275
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 06:22:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8212F80275
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="oSpYKWJv"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="f3thwc9w"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id C016F1B33;
 Thu, 11 Mar 2021 00:21:59 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 11 Mar 2021 00:22:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=47RuzNF0YQNme
 JhtRc90ZNMzmCXOdfoofVvfd7ol4GE=; b=oSpYKWJvOUc9t5ypVvIEkaLwhYZuR
 Mqzwuxxsqokc2g70L6oYFhOQIwbdOF5gwudVo4EhUVOBTSFgCMkhGyupZZrGSfrF
 Zfx91gwee3QYn2MA7nhKaUCJgIrUOzGglwb0z/2N0eHxpJ25ONfWKJHM0gd4ViDm
 LFQGp4BLsMC2DRs3MXq9Zf+u+RqKsuq+iZffJf8IM9rtiLwkXtBpgaOzWlz/B1jM
 rM3xKTfk1hrwIeLw8F8KRwdOqO28QlsWT7h/nisSu/4DSZwe+nkgykd0IStWyumQ
 HkzMu5NPcwuTJaLc/gGW0fz2NAJaG1fXsE3l/WZBGh/bWtjg82u55XLBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=47RuzNF0YQNmeJhtRc90ZNMzmCXOdfoofVvfd7ol4GE=; b=f3thwc9w
 6KgaaZBwhwvO27ZvDF8wN1yJlo4+nyoRxp38RRWZH8waY3ZeMYC1df+4His68JxC
 N+WWcKUVLdoNet1cCFbemEOelp5IIChGY6Uv35/5cdB04blYo8A/SSv8j7/RchzH
 i6I5crCqQVfGqFRw4HzTGv2c5GvpF8/aEyq4/tzUmvx/a+/kecOC9apFh9P/4kUI
 ipE2POmPtYDL/VfM2VO7jxBE1DVRgDG7pMRq2E2KCeEZSmUO/L8+KXkOTXStcXNR
 CZ2pWbTic5zmTJmC3AyVd2EM3UmkxCGhmOPL6WTW3SQMYkjQ0vsd67nSNKY3rPI8
 r8HKpaPGqBqkAw==
X-ME-Sender: <xms:96hJYM2Iq3pGZJ4DYLYpLfe-GDQscaiasZeGAxquy6HLVjhTwMAWLg>
 <xme:96hJYDZamPz5ww_QuN5oQ0OWmYeDJR6AYlmKYW1K-JFIaBrx1_vFfGFs4RNL4-g50
 ZcFajbDWidiQOp2TC4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduledgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:96hJYHr2sXqnCVa99SFFzri69z59LwqfHv9uQJoJmudA-cCOxlINMw>
 <xmx:96hJYHotQ_4SFu9Afpgog6blKFzEpA3CG-UU26a-Ow9uHi1_hVmu5g>
 <xmx:96hJYB3vNop3kJNT7wniORxK7auvZwZbFAOGcdxcc6OAvPP7yUUfeg>
 <xmx:96hJYLmFJRxtpQGbFee7aTip4QBvcjDremHg_nGkvlzRmql3rwuBxg>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6621924005A;
 Thu, 11 Mar 2021 00:21:58 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [alsa-utils][PATCH 06/14] axfer: maintain lifetime of file descriptor
 outside of container module
Date: Thu, 11 Mar 2021 14:21:37 +0900
Message-Id: <20210311052146.404003-7-o-takashi@sakamocchi.jp>
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

This commit closes file descriptor outside of container module so
that maintenance of lifetime for the descriptor is delegated to container
user.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 axfer/container.c           |  1 -
 axfer/container.h           |  1 -
 axfer/subcmd-transfer.c     | 18 +++++++++++++--
 axfer/test/container-test.c |  2 ++
 axfer/test/mapper-test.c    | 44 +++++++++++++++++++++++++++----------
 5 files changed, 50 insertions(+), 16 deletions(-)

diff --git a/axfer/container.c b/axfer/container.c
index 255f12c..8c88d5c 100644
--- a/axfer/container.c
+++ b/axfer/container.c
@@ -451,7 +451,6 @@ void container_context_destroy(struct container_context *cntr)
 {
 	assert(cntr);
 
-	close(cntr->fd);
 	if (cntr->private_data)
 		free(cntr->private_data);
 
diff --git a/axfer/container.h b/axfer/container.h
index 0840369..71017a6 100644
--- a/axfer/container.h
+++ b/axfer/container.h
@@ -11,7 +11,6 @@
 
 #define _LARGEFILE64_SOURCE
 #include <sys/types.h>
-#include <unistd.h>
 
 #include <stdbool.h>
 #include <stdint.h>
diff --git a/axfer/subcmd-transfer.c b/axfer/subcmd-transfer.c
index 52c32d5..27d2cc5 100644
--- a/axfer/subcmd-transfer.c
+++ b/axfer/subcmd-transfer.c
@@ -19,6 +19,8 @@ struct context {
 	struct container_context *cntrs;
 	unsigned int cntr_count;
 
+	int *cntr_fds;
+
 	// NOTE: To handling Unix signal.
 	bool interrupted;
 	int signal;
@@ -153,6 +155,10 @@ static int allocate_containers(struct context *ctx, unsigned int count)
 		return -ENOMEM;
 	ctx->cntr_count = count;
 
+	ctx->cntr_fds = calloc(count, sizeof(*ctx->cntrs));
+	if (ctx->cntr_fds == NULL)
+		return -ENOMEM;
+
 	return 0;
 }
 
@@ -196,8 +202,9 @@ static int capture_pre_process(struct context *ctx, snd_pcm_access_t *access,
 			if (fd < 0)
 				return -errno;
 		}
+		ctx->cntr_fds[i] = fd;
 
-		err = container_builder_init(ctx->cntrs + i, fd,
+		err = container_builder_init(ctx->cntrs + i, ctx->cntr_fds[i],
 					     ctx->xfer.cntr_format,
 					     ctx->xfer.verbose > 1);
 		if (err < 0)
@@ -249,8 +256,9 @@ static int playback_pre_process(struct context *ctx, snd_pcm_access_t *access,
 			if (fd < 0)
 				return -errno;
 		}
+		ctx->cntr_fds[i] = fd;
 
-		err = container_parser_init(ctx->cntrs + i, fd,
+		err = container_parser_init(ctx->cntrs + i, ctx->cntr_fds[i],
 					    ctx->xfer.verbose > 1);
 		if (err < 0)
 			return err;
@@ -447,6 +455,12 @@ static void context_post_process(struct context *ctx,
 		free(ctx->cntrs);
 	}
 
+	if (ctx->cntr_fds) {
+		for (i = 0; i < ctx->cntr_count; ++i)
+			close(ctx->cntr_fds[i]);
+		free(ctx->cntr_fds);
+	}
+
 	mapper_context_post_process(&ctx->mapper);
 	mapper_context_destroy(&ctx->mapper);
 }
diff --git a/axfer/test/container-test.c b/axfer/test/container-test.c
index fbef3a4..d89852a 100644
--- a/axfer/test/container-test.c
+++ b/axfer/test/container-test.c
@@ -73,6 +73,7 @@ static void test_builder(struct container_context *cntr,
 	assert(total_frame_count == frame_count);
 
 	container_context_destroy(cntr);
+	close(fd);
 }
 
 static void test_parser(struct container_context *cntr,
@@ -121,6 +122,7 @@ static void test_parser(struct container_context *cntr,
 	assert(total_frame_count == handled_frame_count);
 
 	container_context_destroy(cntr);
+	close(fd);
 }
 
 static int callback(struct test_generator *gen, snd_pcm_access_t access,
diff --git a/axfer/test/mapper-test.c b/axfer/test/mapper-test.c
index 6252900..78a063a 100644
--- a/axfer/test/mapper-test.c
+++ b/axfer/test/mapper-test.c
@@ -67,23 +67,29 @@ static int test_demux(struct mapper_trial *trial, snd_pcm_access_t access,
 {
 	struct container_context *cntrs = trial->cntrs;
 	enum container_format cntr_format = trial->cntr_format;
+	int *cntr_fds;
 	unsigned int bytes_per_sample;
 	uint64_t total_frame_count;
 	int i;
 	int err = 0;
 
+	cntr_fds = calloc(cntr_count, sizeof(*cntr_fds));
+	if (cntr_fds == NULL)
+		return -ENOMEM;
+
 	for (i = 0; i < cntr_count; ++i) {
 		const char *path = trial->paths[i];
-		int fd;
 		snd_pcm_format_t format;
 		unsigned int channels;
 		unsigned int rate;
 
-		fd = open(path, O_RDWR | O_CREAT | O_TRUNC, 0644);
-		if (fd < 0)
-			return -errno;
+		cntr_fds[i] = open(path, O_RDWR | O_CREAT | O_TRUNC, 0644);
+		if (cntr_fds[i] < 0) {
+			err = -errno;
+			goto end;
+		}
 
-		err = container_builder_init(cntrs + i, fd, cntr_format, 0);
+		err = container_builder_init(cntrs + i, cntr_fds[i], cntr_format, 0);
 		if (err < 0)
 			goto end;
 
@@ -118,8 +124,12 @@ static int test_demux(struct mapper_trial *trial, snd_pcm_access_t access,
 		assert(total_frame_count == frame_count);
 	}
 end:
-	for (i = 0; i < cntr_count; ++i)
+	for (i = 0; i < cntr_count; ++i) {
 		container_context_destroy(cntrs + i);
+		close(cntr_fds[i]);
+	}
+
+	free(cntr_fds);
 
 	return err;
 }
@@ -163,23 +173,29 @@ static int test_mux(struct mapper_trial *trial, snd_pcm_access_t access,
 		    unsigned int cntr_count)
 {
 	struct container_context *cntrs = trial->cntrs;
+	int *cntr_fds;
 	unsigned int bytes_per_sample;
 	uint64_t total_frame_count;
 	int i;
 	int err = 0;
 
+	cntr_fds = calloc(cntr_count, sizeof(*cntr_fds));
+	if (cntr_fds == NULL)
+		return -ENOMEM;
+
 	for (i = 0; i < cntr_count; ++i) {
 		const char *path = trial->paths[i];
-		int fd;
 		snd_pcm_format_t format;
 		unsigned int channels;
 		unsigned int rate;
 
-		fd = open(path, O_RDONLY);
-		if (fd < 0)
-			return -errno;
+		cntr_fds[i] = open(path, O_RDONLY);
+		if (cntr_fds[i] < 0) {
+			err = -errno;
+			goto end;
+		}
 
-		err = container_parser_init(cntrs + i, fd, 0);
+		err = container_parser_init(cntrs + i, cntr_fds[i], 0);
 		if (err < 0)
 			goto end;
 
@@ -214,8 +230,12 @@ static int test_mux(struct mapper_trial *trial, snd_pcm_access_t access,
 		assert(total_frame_count == frame_count);
 	}
 end:
-	for (i = 0; i < cntr_count; ++i)
+	for (i = 0; i < cntr_count; ++i) {
 		container_context_destroy(cntrs + i);
+		close(cntr_fds[i]);
+	}
+
+	free(cntr_fds);
 
 	return err;
 }
-- 
2.27.0

