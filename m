Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A870D336B9B
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 06:26:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3662A1717;
	Thu, 11 Mar 2021 06:25:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3662A1717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615440406;
	bh=Y1Z5oqqUXZx9/NOjjvKDH6O0xsoKjy673BBO7hzY4l0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mgd5WG5xHMcQyzkgWgjwlzZdupo5EqYl4h6/gqLj2NAK9U/ET88cukBhxVkfihs06
	 +qZibu291+31gj+/3q/k27MnX23KZGdpIHp3W3glZpPlgGPJL2tnqhc/p+qASbKaJN
	 SOPY+Og2fEkR9Hwpu4ualR6dP7fye1iyNrHTB2zs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F0DEF804E7;
	Thu, 11 Mar 2021 06:22:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F9F3F804DA; Thu, 11 Mar 2021 06:22:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96685F802D2
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 06:22:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96685F802D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="eh8zKoRk"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="NBNnw3kd"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 00B3C2F95;
 Thu, 11 Mar 2021 00:22:02 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 11 Mar 2021 00:22:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=KB5FiiHZGxuKj
 qAN6vHRFU/8JJNKlxJREV69SmH6ev4=; b=eh8zKoRkXEXnsjFv5PlXJea28CJet
 R5oO6R83xnlv3/UgkQocOqcZjb/ZSSEqG27xqJoj1ZZxRPwqq5jutkei4YNnLhQw
 w7vsvpr1PeIieoL5u9OGC3/SgKPSozejuJaVEtvnbr7xFJ9W2Dc+Vcc86Yb4+Awb
 DcmMjpcbW38hkFagQ1BUhAW3rLYu4iiR0aYVGTUvnUltS10+bG/HQkEPn/TOp+DF
 JEq3oLPa8eUKV8HjH5QTjg2zZYHza19bsGOZSpiApAKIJHs5aX9CAni8GPijt5zO
 /9gA95yYyk0YyuC6PaXEvGzqkqmxHpRIiJUw7BuF9BSLLHjDQfu1vv0iw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=KB5FiiHZGxuKjqAN6vHRFU/8JJNKlxJREV69SmH6ev4=; b=NBNnw3kd
 x229zqZ+v0A0+WJ8HJbu90zQiO3e4jEXF+V2sFYN4yNIjFGlyZgVSGODuaOXRoYR
 noWjK1wGyN1AzfnsOiztMGY7j/6IJjrhdIYwXtQeMpwE/9qijgxcPEpjNtI+loqe
 JrYSm60n/97ohSOGPkIBIotadR8RmvSR6VeiKLzdtzj559bGJ/fwqjfbvwQTb7X+
 1uQtVWKSfTDBr8LPS6jGYzbI1p76ivxG8FxfXlJKizDgLra22DXbkrDSltyo0ItP
 fm7PGibgDkDs0HH4tDU2AeTkSflkWWlLW9NODE7F1qguJMNeai0FxGZdV0qlZjii
 S3l2qleNvxcCMw==
X-ME-Sender: <xms:-qhJYAxzqE8kblb8U7KLfNvrXOxTc6fKGk_fyAkwhqh1yzkhdzOzCg>
 <xme:-qhJYETgGwHytnsuyB4lCHOHE2ZVSPsfYZf6kgAwecI2PTXCfnOSk7ri2BOg6p9Hp
 LltV2EYa69LaP4H9F0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduledgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:-qhJYCXtazLdh7znfeeAKeANEKfWnTNSTaEAXyXG2F7AnN1wjMAjFA>
 <xmx:-qhJYOiiAmjFiziIW2HsxIhDmSJR6e5unka9MOSV_miozMDYaGDeXg>
 <xmx:-qhJYCCRn0EYhVMTUMszZyiIJHUnl6HjIkCnOJYcHBDPUW1vUiiB4A>
 <xmx:-qhJYNqp2fGLFzHsDYVVKNG88CArxGdpHdVsAeWW0Q7M_LcUG-alHQ>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7CB6A24005A;
 Thu, 11 Mar 2021 00:22:00 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [alsa-utils][PATCH 08/14] axfer: test: minor code arrangement to use
 the same file descriptor for container-test
Date: Thu, 11 Mar 2021 14:21:39 +0900
Message-Id: <20210311052146.404003-9-o-takashi@sakamocchi.jp>
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

In container test program, two file descriptors open to the same file
for builder and parser contexts, however the same file descriptor is
available for the case.

This commit arranges to use the same file descriptor for the contexts.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 axfer/test/container-test.c | 40 +++++++++++++++++++++----------------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/axfer/test/container-test.c b/axfer/test/container-test.c
index d89852a..4d825b6 100644
--- a/axfer/test/container-test.c
+++ b/axfer/test/container-test.c
@@ -24,8 +24,8 @@ struct container_trial {
 	bool verbose;
 };
 
-static void test_builder(struct container_context *cntr,
-			 enum container_format format, const char *const name,
+static void test_builder(struct container_context *cntr, int fd,
+			 enum container_format format,
 			 snd_pcm_access_t access,
 			 snd_pcm_format_t sample_format,
 			 unsigned int samples_per_frame,
@@ -33,7 +33,6 @@ static void test_builder(struct container_context *cntr,
 			 void *frame_buffer, unsigned int frame_count,
 			 bool verbose)
 {
-	int fd;
 	snd_pcm_format_t sample;
 	unsigned int channels;
 	unsigned int rate;
@@ -42,9 +41,6 @@ static void test_builder(struct container_context *cntr,
 	uint64_t total_frame_count;
 	int err;
 
-	fd = open(name, O_RDWR | O_CREAT | O_TRUNC, 0644);
-	assert(fd >= 0);
-
 	err = container_builder_init(cntr, fd, format, verbose);
 	assert(err == 0);
 
@@ -73,18 +69,16 @@ static void test_builder(struct container_context *cntr,
 	assert(total_frame_count == frame_count);
 
 	container_context_destroy(cntr);
-	close(fd);
 }
 
-static void test_parser(struct container_context *cntr,
-		        enum container_format format, const char *const name,
+static void test_parser(struct container_context *cntr, int fd,
+		        enum container_format format,
 		        snd_pcm_access_t access, snd_pcm_format_t sample_format,
 		        unsigned int samples_per_frame,
 		        unsigned int frames_per_second,
 		        void *frame_buffer, unsigned int frame_count,
 			bool verbose)
 {
-	int fd;
 	snd_pcm_format_t sample;
 	unsigned int channels;
 	unsigned int rate;
@@ -92,9 +86,6 @@ static void test_parser(struct container_context *cntr,
 	unsigned int handled_frame_count;
 	int err;
 
-	fd = open(name, O_RDONLY);
-	assert(fd >= 0);
-
 	err = container_parser_init(cntr, fd, verbose);
 	assert(err == 0);
 
@@ -122,7 +113,6 @@ static void test_parser(struct container_context *cntr,
 	assert(total_frame_count == handled_frame_count);
 
 	container_context_destroy(cntr);
-	close(fd);
 }
 
 static int callback(struct test_generator *gen, snd_pcm_access_t access,
@@ -156,26 +146,42 @@ static int callback(struct test_generator *gen, snd_pcm_access_t access,
 	unlink(name);
 
 	for (i = 0; i < ARRAY_SIZE(entries); ++i) {
+		int fd;
+		off64_t pos;
+
 		frames_per_second = entries[i];
 
-		test_builder(&trial->cntr, trial->format, name, access,
+		fd = open(name, O_RDWR | O_CREAT | O_TRUNC, 0644);
+		if (fd < 0) {
+			err = -errno;
+			break;
+		}
+
+		test_builder(&trial->cntr, fd, trial->format, access,
 			     sample_format, samples_per_frame,
 			     frames_per_second, frame_buffer, frame_count,
 			     trial->verbose);
 
-		test_parser(&trial->cntr, trial->format, name, access,
+		pos = lseek64(fd, 0, SEEK_SET);
+		if (pos < 0) {
+			err = -errno;
+			break;
+		}
+
+		test_parser(&trial->cntr, fd, trial->format, access,
 			    sample_format, samples_per_frame, frames_per_second,
 			    buf, frame_count, trial->verbose);
 
 		err = memcmp(buf, frame_buffer, size);
 		assert(err == 0);
 
+		close(fd);
 		unlink(name);
 	}
 
 	free(buf);
 
-	return 0;
+	return err;
 }
 
 int main(int argc, const char *argv[])
-- 
2.27.0

