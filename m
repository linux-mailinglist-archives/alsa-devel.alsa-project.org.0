Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F270E336B97
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 06:25:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B437171E;
	Thu, 11 Mar 2021 06:24:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B437171E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615440310;
	bh=omNqrkhXKMmDJ7HPC1+ZXrwLcWJXalreHhkEzTR2tV8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XIy0xK0VcWbVbRU5p6tqxL9E4PULHA9kZemCTEQrmSHQqGrV1Z5uDDUmcmGBPWzwA
	 7KXac7EhMF38trO/ykkLeHyV6TzD0fiXK96lMiVImTBZreRm8wqsnzMEtEkVQBEL/8
	 f24iiFAr06FiG0D7p4UWStfXIRwNO2NqQBBNtkFw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C7C7F80276;
	Thu, 11 Mar 2021 06:22:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A0C3F804B2; Thu, 11 Mar 2021 06:22:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8ACAF80256
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 06:21:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8ACAF80256
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="R5fjnfdm"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="oPjuj6J5"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2EE532FAC;
 Thu, 11 Mar 2021 00:21:57 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 11 Mar 2021 00:21:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=8uruRkbmDFcVY
 YXq0kgCeHF4CDUTPNjx2foUT+6bpN8=; b=R5fjnfdm0CXQdBINx1L+ZFkJ+e4/P
 ncTcejBn6mYXgQduAP/lbseMl3THra9U+5EU/1CnJNurLVuk8uvLwx4QkazJrPnO
 cbcRUnHgAaQzZAi5Jd3dggneu8pcO3mdxYIYap2m7rlY52MOXV3Gu8X6hCK6O18+
 XV7vilzhVC1AFCJ0csEijptUOVs8OFgvdfLkywsmwlpvBxiZmVLwa4+2hlA/FGdA
 iCafEqO8gvdwGAa/hyULBiwuEtsRFxhLczuDE5P3gr9C9WaeQ+gHXR3vqCrmvC2b
 7T/jz3/bgPJZVkcmVffFijHDPTlugp6j7D35Od0v9g+rHo+JExnPxA4Ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=8uruRkbmDFcVYYXq0kgCeHF4CDUTPNjx2foUT+6bpN8=; b=oPjuj6J5
 cEfwd8gu41Oj7gEFmLkmkMdXBSwr+grsyED8WRbSjvsnKOz2gT5LetfPeAyriQio
 6md2tZMRwPqxEg4Yz81/0THCigmHMr9RBBaWOf3OPhkhfEx9zpDINzKa4s1A9RQy
 NCr5xXYMQAh4hsTTSrBf6UAzYm++Sm+OCVsYYwkQNKXBrdGKbrkAsjC73vINLEJg
 U2qAP4Fl1NumqGLHs+mx8EuU3YmFvhakr8NCYrpKixsVBGNUtZneoIcY1Yke2DxE
 HTACIjjcEb5ag0TqxZZnB+1foxawo/t1WMZ8R5f8qODkgjDM8OrMIC5a23PTpn69
 MeazUHGNQmc6CA==
X-ME-Sender: <xms:9KhJYJ2GOwWqC6cWixmUwWBGXt3YRkSYetPdiqbKn8FBPKB39v6Adw>
 <xme:9KhJYAF7-ztxDPvo3bwuoY8VEorN8diUUVIElf6TcXH9-dpb-NaD77t68vQluhh8i
 796prgPRYWvI3bq1os>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduledgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:9KhJYJ6d4rRaPaQA3mvRlKStsp61sdYm6WNktQBvBFtjp7wQT2tNKg>
 <xmx:9KhJYG18pDTN1pyI6OgikSm1fMmexBLA5xgaAND9M6VMAn_8pvNVWQ>
 <xmx:9KhJYMGskqhzfh2vBH-Ko7qd_VdhoAzP7WIDCTbGEs1rlfN2cFZW_A>
 <xmx:9KhJYHOQPiOU_BIBlzwU8mRxrN-n18CplPcizmjnxpNkI6PoSH0O6g>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id BDEAF24005A;
 Thu, 11 Mar 2021 00:21:55 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [alsa-utils][PATCH 04/14] axfer: minor code arrangement to allocate
 containers
Date: Thu, 11 Mar 2021 14:21:35 +0900
Message-Id: <20210311052146.404003-5-o-takashi@sakamocchi.jp>
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

This commit unifies duplicated code to allocate for container structure.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 axfer/subcmd-transfer.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/axfer/subcmd-transfer.c b/axfer/subcmd-transfer.c
index 8746e6f..6962208 100644
--- a/axfer/subcmd-transfer.c
+++ b/axfer/subcmd-transfer.c
@@ -146,6 +146,16 @@ static int context_init(struct context *ctx, snd_pcm_stream_t direction,
 	return xfer_context_init(&ctx->xfer, xfer_type, direction, argc, argv);
 }
 
+static int allocate_containers(struct context *ctx, unsigned int count)
+{
+	ctx->cntrs = calloc(count, sizeof(*ctx->cntrs));
+	if (ctx->cntrs == NULL)
+		return -ENOMEM;
+	ctx->cntr_count = count;
+
+	return 0;
+}
+
 static int capture_pre_process(struct context *ctx, snd_pcm_access_t *access,
 			       snd_pcm_uframes_t *frames_per_buffer,
 			       uint64_t *total_frame_count)
@@ -164,10 +174,9 @@ static int capture_pre_process(struct context *ctx, snd_pcm_access_t *access,
 		return err;
 
 	// Prepare for containers.
-	ctx->cntrs = calloc(ctx->xfer.path_count, sizeof(*ctx->cntrs));
-	if (ctx->cntrs == NULL)
-		return -ENOMEM;
-	ctx->cntr_count = ctx->xfer.path_count;
+	err = allocate_containers(ctx, ctx->xfer.path_count);
+	if (err < 0)
+		return err;
 
 	if (ctx->cntr_count > 1)
 		channels = 1;
@@ -212,10 +221,9 @@ static int playback_pre_process(struct context *ctx, snd_pcm_access_t *access,
 	int err;
 
 	// Prepare for containers.
-	ctx->cntrs = calloc(ctx->xfer.path_count, sizeof(*ctx->cntrs));
-	if (ctx->cntrs == NULL)
-		return -ENOMEM;
-	ctx->cntr_count = ctx->xfer.path_count;
+	err = allocate_containers(ctx, ctx->xfer.path_count);
+	if (err < 0)
+		return err;
 
 	for (i = 0; i < ctx->cntr_count; ++i) {
 		snd_pcm_format_t format;
-- 
2.27.0

