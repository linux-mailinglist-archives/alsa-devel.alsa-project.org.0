Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 835F6336B66
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 06:24:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09CE41718;
	Thu, 11 Mar 2021 06:23:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09CE41718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615440284;
	bh=Y3cOTsRyyvZlnIHXYFniuOuRTCdb2iDsPPWkLtjSWjw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hw4rMkrkSwqFpUXhuq+TPSxmy00QFh8zjyew6wAl/YM4+k4XULYmsP2X8XCss8llk
	 5OlEYbo68sy1vAUIhD2IdC8uX2kU6NqUnI9zBx0oETUaLVzyQGtIdLZppcmzTMda0M
	 SLxQ0rAAhQ6QLYAAxnfSJKpjd9BvCCzdSXhJKFPE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B161FF80275;
	Thu, 11 Mar 2021 06:22:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9092AF804B1; Thu, 11 Mar 2021 06:22:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E092F8025A
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 06:22:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E092F8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="tzpiksJ9"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="PDX3UWK9"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 84F0B2FB1;
 Thu, 11 Mar 2021 00:21:58 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 11 Mar 2021 00:21:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=HvJAd77eOJTuR
 hKUuKWovywlFpayPVJJGRJkfS7k9Pg=; b=tzpiksJ9EhJX+9yJV2DFgB1ERjBa9
 GJVg/UdVX7/py9h4XzrmLAQADyBc4hkwjAYIAsfhwKkL5/ChIcNBaRd2p1vNPcDL
 IVl8HlL1dIzDTcOxfxb8+3VqVOGOPAUA47MIVy43CyjGE3SF4SvuCvaYjjYLJ0Cb
 xfQBk6JiVPs9xS0aTvjZVllSo3FptH11lsDaHSL7dI8Mgu38t8tgYvfI/rRbvPrw
 BVkKf+xwwT82HN84LYe6ioT26fdwpf9eFCMxvN8HWLweXobHAy2Qts5bubMebcll
 WFB8q7UidNrivL2QxcHX8Wc3tg0I+s3VXgO18alDjiaSTKmgCCfPn3CVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=HvJAd77eOJTuRhKUuKWovywlFpayPVJJGRJkfS7k9Pg=; b=PDX3UWK9
 XhBqcfGtqp/FQkUXlA52/sG/1Ym9+oZ4CHKL5djrh+phwOX+KyeRWR7FC22z1nEX
 VUCSau1lOSKbftbWKa9i6cMTlWV+ZA+/HcuDzDiujzFNj6k7oEAI9v9YZfmtiNzb
 AZg7lrnvTqtzGEodjJIbsAJYyEvQlqoBLkQrny7pegFUs8Y1Eo0Xw6lL9jkmIBHe
 06JTqHxigvE/st5DLG0wWW/Dg15D5AbXaoYXz+ecmUUtf95VAfn/J8+XQoKeO+Ca
 8CWhhKThzmfIhfgg3qeXs4UPISl8xyIISmyBiB2jnLSpaUhmjb9LuqDOAQOygD5A
 tcKcSAkqhRTGew==
X-ME-Sender: <xms:9qhJYF8rM8u6OgXFZkkd_NAVPmW_SCsZaeU4lnYXbpRK6SH1RSl9Mw>
 <xme:9qhJYJvtSiMT6oQAqdOedQiPSV03V1d4S_QEP6ZQeg3Su9Du-lPOsWMN8dwHc6-K7
 _ZJlI4m5IvCYf-wf0Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduledgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:9qhJYDDFpMSWOC-PP9hqrW1GsxTM-xXEgrRbzZODzKD5ax_NyxKjLA>
 <xmx:9qhJYJeBdHCbMuzUUhim5sL6J-i_I0VUiVLd8lGWFgnmIOKKQw-Ccw>
 <xmx:9qhJYKObgDPwixv7Rptnnlm9JdazZobYYi70I6UGcKrwNkEZvaM9gw>
 <xmx:9qhJYEVY8ye5NYpw0Jb9gE2rWQ2AwuNwR5kDM7_9kxHtnMtEQ0k7sA>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 18D43240057;
 Thu, 11 Mar 2021 00:21:56 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [alsa-utils][PATCH 05/14] axfer: open file descriptor outside of
 container module
Date: Thu, 11 Mar 2021 14:21:36 +0900
Message-Id: <20210311052146.404003-6-o-takashi@sakamocchi.jp>
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

Internal container module operates file descriptor to media file. For
this purpose, the structure has fd member and any file operation is done
internally. However, the case to use special file descriptor such as
memfd requires to maintain file descriptor externally.

This commit opens file descriptor outside of container module. The
internal APIs to initialize container get an argument for the file
descriptor instead of file path.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 axfer/container.c           | 35 ++++++-----------------------------
 axfer/container.h           |  9 ++++-----
 axfer/subcmd-transfer.c     | 26 ++++++++++++++++++++++----
 axfer/test/container-test.c | 12 ++++++++++--
 axfer/test/mapper-test.c    | 19 ++++++++++++++-----
 5 files changed, 56 insertions(+), 45 deletions(-)

diff --git a/axfer/container.c b/axfer/container.c
index b4646b9..255f12c 100644
--- a/axfer/container.c
+++ b/axfer/container.c
@@ -143,23 +143,21 @@ static int set_nonblock_flag(int fd)
 	return 0;
 }
 
-int container_parser_init(struct container_context *cntr,
-			  const char *const path, unsigned int verbose)
+int container_parser_init(struct container_context *cntr, int fd,
+			  unsigned int verbose)
 {
 	const struct container_parser *parsers[] = {
 		[CONTAINER_FORMAT_RIFF_WAVE] = &container_parser_riff_wave,
 		[CONTAINER_FORMAT_AU] = &container_parser_au,
 		[CONTAINER_FORMAT_VOC] = &container_parser_voc,
 	};
-	int fd;
 	const struct container_parser *parser;
 	unsigned int size;
 	int i;
 	int err;
 
 	assert(cntr);
-	assert(path);
-	assert(path[0] != '\0');
+	assert(fd >= 0);
 
 	// Detect forgotten to destruct.
 	assert(cntr->fd == 0);
@@ -167,14 +165,6 @@ int container_parser_init(struct container_context *cntr,
 
 	memset(cntr, 0, sizeof(*cntr));
 
-	// Open a target descriptor.
-	if (!strcmp(path, "-")) {
-		fd = fileno(stdin);
-	} else {
-		fd = open(path, O_RDONLY);
-		if (fd < 0)
-			return -errno;
-	}
 	cntr->fd = fd;
 
 	cntr->stdio = (cntr->fd == fileno(stdin));
@@ -231,9 +221,8 @@ int container_parser_init(struct container_context *cntr,
 	return 0;
 }
 
-int container_builder_init(struct container_context *cntr,
-			   const char *const path, enum container_format format,
-			   unsigned int verbose)
+int container_builder_init(struct container_context *cntr, int fd,
+			   enum container_format format, unsigned int verbose)
 {
 	const struct container_builder *builders[] = {
 		[CONTAINER_FORMAT_RIFF_WAVE] = &container_builder_riff_wave,
@@ -241,13 +230,11 @@ int container_builder_init(struct container_context *cntr,
 		[CONTAINER_FORMAT_VOC] = &container_builder_voc,
 		[CONTAINER_FORMAT_RAW] = &container_builder_raw,
 	};
-	int fd;
 	const struct container_builder *builder;
 	int err;
 
 	assert(cntr);
-	assert(path);
-	assert(path[0] != '\0');
+	assert(fd >= 0);
 
 	// Detect forgotten to destruct.
 	assert(cntr->fd == 0);
@@ -255,16 +242,6 @@ int container_builder_init(struct container_context *cntr,
 
 	memset(cntr, 0, sizeof(*cntr));
 
-	// Open a target descriptor.
-	if (path == NULL || *path == '\0')
-		return -EINVAL;
-	if (!strcmp(path, "-")) {
-		fd = fileno(stdout);
-	} else {
-		fd = open(path, O_RDWR | O_CREAT | O_TRUNC, 0644);
-		if (fd < 0)
-			return -errno;
-	}
 	cntr->fd = fd;
 
 	cntr->stdio = (cntr->fd == fileno(stdout));
diff --git a/axfer/container.h b/axfer/container.h
index cb64816..0840369 100644
--- a/axfer/container.h
+++ b/axfer/container.h
@@ -61,11 +61,10 @@ struct container_context {
 
 const char *const container_suffix_from_format(enum container_format format);
 enum container_format container_format_from_path(const char *path);
-int container_parser_init(struct container_context *cntr,
-			  const char *const path, unsigned int verbose);
-int container_builder_init(struct container_context *cntr,
-			   const char *const path, enum container_format format,
-			   unsigned int verbose);
+int container_parser_init(struct container_context *cntr, int fd,
+			  unsigned int verbose);
+int container_builder_init(struct container_context *cntr, int fd,
+			   enum container_format format, unsigned int verbose);
 void container_context_destroy(struct container_context *cntr);
 int container_context_pre_process(struct container_context *cntr,
 				  snd_pcm_format_t *format,
diff --git a/axfer/subcmd-transfer.c b/axfer/subcmd-transfer.c
index 6962208..52c32d5 100644
--- a/axfer/subcmd-transfer.c
+++ b/axfer/subcmd-transfer.c
@@ -185,10 +185,19 @@ static int capture_pre_process(struct context *ctx, snd_pcm_access_t *access,
 
 	*total_frame_count = 0;
 	for (i = 0; i < ctx->cntr_count; ++i) {
+		const char *path = ctx->xfer.paths[i];
+		int fd;
 		uint64_t frame_count;
 
-		err = container_builder_init(ctx->cntrs + i,
-					     ctx->xfer.paths[i],
+		if (!strcmp(path, "-")) {
+			fd = fileno(stdout);
+		} else {
+			fd = open(path, O_RDWR | O_CREAT | O_TRUNC, 0644);
+			if (fd < 0)
+				return -errno;
+		}
+
+		err = container_builder_init(ctx->cntrs + i, fd,
 					     ctx->xfer.cntr_format,
 					     ctx->xfer.verbose > 1);
 		if (err < 0)
@@ -226,13 +235,22 @@ static int playback_pre_process(struct context *ctx, snd_pcm_access_t *access,
 		return err;
 
 	for (i = 0; i < ctx->cntr_count; ++i) {
+		const char *path = ctx->xfer.paths[i];
+		int fd;
 		snd_pcm_format_t format;
 		unsigned int channels;
 		unsigned int rate;
 		uint64_t frame_count;
 
-		err = container_parser_init(ctx->cntrs + i,
-					    ctx->xfer.paths[i],
+		if (!strcmp(path, "-")) {
+			fd = fileno(stdin);
+		} else {
+			fd = open(path, O_RDONLY);
+			if (fd < 0)
+				return -errno;
+		}
+
+		err = container_parser_init(ctx->cntrs + i, fd,
 					    ctx->xfer.verbose > 1);
 		if (err < 0)
 			return err;
diff --git a/axfer/test/container-test.c b/axfer/test/container-test.c
index 9b30ae3..fbef3a4 100644
--- a/axfer/test/container-test.c
+++ b/axfer/test/container-test.c
@@ -33,6 +33,7 @@ static void test_builder(struct container_context *cntr,
 			 void *frame_buffer, unsigned int frame_count,
 			 bool verbose)
 {
+	int fd;
 	snd_pcm_format_t sample;
 	unsigned int channels;
 	unsigned int rate;
@@ -41,7 +42,10 @@ static void test_builder(struct container_context *cntr,
 	uint64_t total_frame_count;
 	int err;
 
-	err = container_builder_init(cntr, name, format, verbose);
+	fd = open(name, O_RDWR | O_CREAT | O_TRUNC, 0644);
+	assert(fd >= 0);
+
+	err = container_builder_init(cntr, fd, format, verbose);
 	assert(err == 0);
 
 	sample = sample_format;
@@ -79,6 +83,7 @@ static void test_parser(struct container_context *cntr,
 		        void *frame_buffer, unsigned int frame_count,
 			bool verbose)
 {
+	int fd;
 	snd_pcm_format_t sample;
 	unsigned int channels;
 	unsigned int rate;
@@ -86,7 +91,10 @@ static void test_parser(struct container_context *cntr,
 	unsigned int handled_frame_count;
 	int err;
 
-	err = container_parser_init(cntr, name, verbose);
+	fd = open(name, O_RDONLY);
+	assert(fd >= 0);
+
+	err = container_parser_init(cntr, fd, verbose);
 	assert(err == 0);
 
 	sample = sample_format;
diff --git a/axfer/test/mapper-test.c b/axfer/test/mapper-test.c
index f0376c7..6252900 100644
--- a/axfer/test/mapper-test.c
+++ b/axfer/test/mapper-test.c
@@ -66,7 +66,6 @@ static int test_demux(struct mapper_trial *trial, snd_pcm_access_t access,
 		      unsigned int cntr_count)
 {
 	struct container_context *cntrs = trial->cntrs;
-	char **paths = trial->paths;
 	enum container_format cntr_format = trial->cntr_format;
 	unsigned int bytes_per_sample;
 	uint64_t total_frame_count;
@@ -74,12 +73,17 @@ static int test_demux(struct mapper_trial *trial, snd_pcm_access_t access,
 	int err = 0;
 
 	for (i = 0; i < cntr_count; ++i) {
+		const char *path = trial->paths[i];
+		int fd;
 		snd_pcm_format_t format;
 		unsigned int channels;
 		unsigned int rate;
 
-		err = container_builder_init(cntrs + i, paths[i], cntr_format,
-					     0);
+		fd = open(path, O_RDWR | O_CREAT | O_TRUNC, 0644);
+		if (fd < 0)
+			return -errno;
+
+		err = container_builder_init(cntrs + i, fd, cntr_format, 0);
 		if (err < 0)
 			goto end;
 
@@ -159,18 +163,23 @@ static int test_mux(struct mapper_trial *trial, snd_pcm_access_t access,
 		    unsigned int cntr_count)
 {
 	struct container_context *cntrs = trial->cntrs;
-	char **paths = trial->paths;
 	unsigned int bytes_per_sample;
 	uint64_t total_frame_count;
 	int i;
 	int err = 0;
 
 	for (i = 0; i < cntr_count; ++i) {
+		const char *path = trial->paths[i];
+		int fd;
 		snd_pcm_format_t format;
 		unsigned int channels;
 		unsigned int rate;
 
-		err = container_parser_init(cntrs + i, paths[i], 0);
+		fd = open(path, O_RDONLY);
+		if (fd < 0)
+			return -errno;
+
+		err = container_parser_init(cntrs + i, fd, 0);
 		if (err < 0)
 			goto end;
 
-- 
2.27.0

