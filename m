Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B56AF336B9F
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 06:28:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5381D1739;
	Thu, 11 Mar 2021 06:27:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5381D1739
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615440495;
	bh=WBreZIW3h8ToTg+h9dFLggAMzcpPYHl3zOwiMY+z/34=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HiNYveah3V6p5SnqDfEkOcBWCpUZ9cUb3fXrSZTFnAwQqot+GW9B1RutX+K6a0aJl
	 E/Eb2SdQbsZ2cBR2rK95h7ZWsNfJw6lpqQP+eR3d+uyWYIfIVA2DbaG17nJQRVZd/G
	 EhadBDF7ZdAvMe04Dq7iRvqFNE+RKAjkfSMkwsZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7824F80516;
	Thu, 11 Mar 2021 06:23:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5461BF804E0; Thu, 11 Mar 2021 06:22:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D2C5F80227
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 06:22:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D2C5F80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="1wKnuIX6"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="GGkIQraD"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id BE6652FAC;
 Thu, 11 Mar 2021 00:22:05 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 11 Mar 2021 00:22:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=ppxr9iGRPYUyH
 iosRCnhPqwzqmvQOKxBujAlppbgIHg=; b=1wKnuIX6/ddFAU5UJCX2rzhg3SHhD
 o/DRiot5iiPocQIh/EUZKeIXx7mZMpkstY7QBw9xB78VxRjpPE9FF6kWqy3DK7Ay
 h6jCfHhoztOnm4OuTWfpaeAzkIVqcxBBRKEQofQcuGXaIoQWj9lLwbUyy9RU5O+9
 hFaAJA1OuAl9xs9lWosAnPrcJiX/16v+J7yGeEqopiNZQQ8nRHoV86/2/CCEqO0w
 P6oqh/ltbNkRLJCvaLiITemxkuDJhmxExUnZ06xNMhqYyyKtGPp0GTYeO5gp+red
 2Noynw676ZYkCDgwHwNJAKB4ZUkA+lv5EGSoWBE8NssV3iEKZD362bF4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=ppxr9iGRPYUyHiosRCnhPqwzqmvQOKxBujAlppbgIHg=; b=GGkIQraD
 GI0nTqvquxKhV1+RfxGJgW9eNBpJwMnn/0KCEXnXBn00G7si4BAR4oBOBrMm+c0X
 Z9g0eL775eUF2Z0gqeQ6OCVM+q0siiNdLu+g+DsnK0hu3WgFLPs/0xg+we5WPPZM
 0WQmK4fnE3zSZHcl5mvYrubarSzbRff1dFntErr84gcJIwlh5EmiTwQ8NWtWV8Jr
 5PerXqJ1cl/3/Yx6A2mQ4Qw8/UAqfHioSg33tw7ql/SukFhEbZB7QJLQh5C3Rmpj
 jA0mwlfzPAvmtaWwjpJtK5dvpAyfn2tE+X0AbEL40qCG+8ominowCEc1ZYWuY+bt
 pN91LDEbUmmuoA==
X-ME-Sender: <xms:_ahJYOvnA-6SHaZEBJwzooeg_50S3iQMV7N9EqOzBbaEbqt-3Jk40A>
 <xme:_ahJYDf9oLjBINnnwMQeKls7UUl5ak1s_31tEcl04qegcICYS4MSMtcwHFDjPp6_y
 5OAC5pj76Nl9dNYgGM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduledgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:_ahJYJySH1jTCqKFbZROXtJWdVT47qvKpfe13Q3PibmhPW0O5I-OWA>
 <xmx:_ahJYJMA3ZdpXVtCLEQjoy301KbmovhJ5v5bx6fq0I--vZuST0PdIQ>
 <xmx:_ahJYO8UZXW96V6FTig2F5vAxfTAUtuDBhG4L6OPMNQBrrLrQlC8QQ>
 <xmx:_ahJYDHn-TQcWH34vIME_9bDZFovv45yCYmXfHmP_azlO__q4K90OA>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4B21824005A;
 Thu, 11 Mar 2021 00:22:03 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [alsa-utils][PATCH 10/14] axfer: test: minor code arrangement to use
 the same file descriptor for mappter-test
Date: Thu, 11 Mar 2021 14:21:41 +0900
Message-Id: <20210311052146.404003-11-o-takashi@sakamocchi.jp>
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

In mapper test program, two set of file descriptors open to the same files
for container builder and parser contexts, however the same file descriptor
is available for the case.

This commit arranges to use the same file descriptor for the contexts.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 axfer/test/mapper-test.c | 73 +++++++++++++++++++---------------------
 1 file changed, 34 insertions(+), 39 deletions(-)

diff --git a/axfer/test/mapper-test.c b/axfer/test/mapper-test.c
index 78a063a..0bed4bb 100644
--- a/axfer/test/mapper-test.c
+++ b/axfer/test/mapper-test.c
@@ -63,32 +63,20 @@ static int test_demux(struct mapper_trial *trial, snd_pcm_access_t access,
 		      unsigned int frames_per_second,
 		      unsigned int frames_per_buffer,
 		      void *frame_buffer, unsigned int frame_count,
-		      unsigned int cntr_count)
+		      int *cntr_fds, unsigned int cntr_count)
 {
 	struct container_context *cntrs = trial->cntrs;
 	enum container_format cntr_format = trial->cntr_format;
-	int *cntr_fds;
 	unsigned int bytes_per_sample;
 	uint64_t total_frame_count;
 	int i;
 	int err = 0;
 
-	cntr_fds = calloc(cntr_count, sizeof(*cntr_fds));
-	if (cntr_fds == NULL)
-		return -ENOMEM;
-
 	for (i = 0; i < cntr_count; ++i) {
-		const char *path = trial->paths[i];
 		snd_pcm_format_t format;
 		unsigned int channels;
 		unsigned int rate;
 
-		cntr_fds[i] = open(path, O_RDWR | O_CREAT | O_TRUNC, 0644);
-		if (cntr_fds[i] < 0) {
-			err = -errno;
-			goto end;
-		}
-
 		err = container_builder_init(cntrs + i, cntr_fds[i], cntr_format, 0);
 		if (err < 0)
 			goto end;
@@ -124,12 +112,8 @@ static int test_demux(struct mapper_trial *trial, snd_pcm_access_t access,
 		assert(total_frame_count == frame_count);
 	}
 end:
-	for (i = 0; i < cntr_count; ++i) {
+	for (i = 0; i < cntr_count; ++i)
 		container_context_destroy(cntrs + i);
-		close(cntr_fds[i]);
-	}
-
-	free(cntr_fds);
 
 	return err;
 }
@@ -170,31 +154,19 @@ static int test_mux(struct mapper_trial *trial, snd_pcm_access_t access,
 		    unsigned int frames_per_second,
 		    unsigned int frames_per_buffer,
 		    void *frame_buffer, unsigned int frame_count,
-		    unsigned int cntr_count)
+		    int *cntr_fds, unsigned int cntr_count)
 {
 	struct container_context *cntrs = trial->cntrs;
-	int *cntr_fds;
 	unsigned int bytes_per_sample;
 	uint64_t total_frame_count;
 	int i;
 	int err = 0;
 
-	cntr_fds = calloc(cntr_count, sizeof(*cntr_fds));
-	if (cntr_fds == NULL)
-		return -ENOMEM;
-
 	for (i = 0; i < cntr_count; ++i) {
-		const char *path = trial->paths[i];
 		snd_pcm_format_t format;
 		unsigned int channels;
 		unsigned int rate;
 
-		cntr_fds[i] = open(path, O_RDONLY);
-		if (cntr_fds[i] < 0) {
-			err = -errno;
-			goto end;
-		}
-
 		err = container_parser_init(cntrs + i, cntr_fds[i], 0);
 		if (err < 0)
 			goto end;
@@ -230,12 +202,8 @@ static int test_mux(struct mapper_trial *trial, snd_pcm_access_t access,
 		assert(total_frame_count == frame_count);
 	}
 end:
-	for (i = 0; i < cntr_count; ++i) {
+	for (i = 0; i < cntr_count; ++i)
 		container_context_destroy(cntrs + i);
-		close(cntr_fds[i]);
-	}
-
-	free(cntr_fds);
 
 	return err;
 }
@@ -247,6 +215,7 @@ static int test_mapper(struct mapper_trial *trial, snd_pcm_access_t access,
 		    void *check_buffer, unsigned int frame_count,
 		    unsigned int cntr_count)
 {
+	int *cntr_fds;
 	unsigned int frames_per_buffer;
 	int i;
 	int err;
@@ -254,18 +223,44 @@ static int test_mapper(struct mapper_trial *trial, snd_pcm_access_t access,
 	// Use a buffer aligned by typical size of page frame.
 	frames_per_buffer = ((frame_count + 4096) / 4096) * 4096;
 
+	cntr_fds = calloc(cntr_count, sizeof(*cntr_fds));
+	if (cntr_fds == NULL)
+		return -ENOMEM;
+
+	for (i = 0; i < cntr_count; ++i) {
+		const char *path = trial->paths[i];
+
+		cntr_fds[i] = open(path, O_RDWR | O_CREAT | O_TRUNC, 0644);
+		if (cntr_fds[i] < 0) {
+			err = -errno;
+			goto end;
+		}
+	}
+
 	err = test_demux(trial, access, sample_format, samples_per_frame,
 			 frames_per_second, frames_per_buffer, frame_buffer,
-			 frame_count, cntr_count);
+			 frame_count, cntr_fds, cntr_count);
 	if (err < 0)
 		goto end;
 
+	for (i = 0; i < cntr_count; ++i) {
+		off64_t pos = lseek64(cntr_fds[i], 0, SEEK_SET);
+		if (pos != 0) {
+			err = -EIO;
+			goto end;
+		}
+	}
+
 	err = test_mux(trial, access, sample_format, samples_per_frame,
 		       frames_per_second, frames_per_buffer, check_buffer,
-		       frame_count, cntr_count);
+		       frame_count, cntr_fds, cntr_count);
 end:
-	for (i = 0; i < cntr_count; ++i)
+	for (i = 0; i < cntr_count; ++i) {
 		unlink(trial->paths[i]);
+		close(cntr_fds[i]);
+	}
+
+	free(cntr_fds);
 
 	return err;
 }
-- 
2.27.0

