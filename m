Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C37F449B02
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 09:46:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41BC316BF;
	Tue, 18 Jun 2019 09:45:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41BC316BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560843973;
	bh=toGhPdUV/ki9GSH7XPY/pxIzpDoa5wnw8GTtKc15xWw=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oGKzaTbB9FuFdd4kH4NaGz3/qJoNz7jAsrYHkzs+ggXt6Fyjy+POthWZDErqhVg3e
	 rbYcJDblxcNj9mWcbK114lGnoCFtxzwBfgXxb96Wm9kpeIQzYuVIv51w0guekLgTBw
	 HiRQfhBVxQK4UqF9mzVhpg74BYJyYCw1CszRWf7c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1100F8971C;
	Tue, 18 Jun 2019 09:44:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 726DBF896F4; Tue, 18 Jun 2019 09:44:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2E0FF89682
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 09:44:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2E0FF89682
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=codeaurora.org header.i=@codeaurora.org
 header.b="IBqmOjSp"; 
 dkim=pass (1024-bit key) header.d=codeaurora.org header.i=@codeaurora.org
 header.b="IBqmOjSp"
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id BB3B0602DD; Tue, 18 Jun 2019 07:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1560843861;
 bh=atQUjk4vum7dZNgFC1o95VNme1jXzGjB71O94ioK+qo=;
 h=From:To:Cc:Subject:Date:From;
 b=IBqmOjSpmj9DQFtfv9SdZlJ0UMK2FIA0/CB3S42NlrizP9hWB0Z8COev13nYsEzfR
 hCdahItC/RwoLCbYi7A94Ms5hZdqf0cA1uukuGgFusaxc/ONEM5qIrORf53hljgzEv
 B0PyWuOsGz2gBuhSrOkfJiryp10b914VAed8cjz0=
Received: from localhost (i-global254.qualcomm.com [199.106.103.254])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: bgoswami@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3501260300;
 Tue, 18 Jun 2019 07:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1560843861;
 bh=atQUjk4vum7dZNgFC1o95VNme1jXzGjB71O94ioK+qo=;
 h=From:To:Cc:Subject:Date:From;
 b=IBqmOjSpmj9DQFtfv9SdZlJ0UMK2FIA0/CB3S42NlrizP9hWB0Z8COev13nYsEzfR
 hCdahItC/RwoLCbYi7A94Ms5hZdqf0cA1uukuGgFusaxc/ONEM5qIrORf53hljgzEv
 B0PyWuOsGz2gBuhSrOkfJiryp10b914VAed8cjz0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3501260300
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=bgoswami@codeaurora.org
From: bgoswami@codeaurora.org
To: vkoul@kernel.org
Date: Tue, 18 Jun 2019 00:44:06 -0700
Message-Id: <1560843846-4631-1-git-send-email-bgoswami@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Cc: Dhananjay Kumar <dhakumar@codeaurora.org>, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, plai@codeaurora.org, tiwai@suse.com,
 srinivas.kandagatla@linaro.org
Subject: [alsa-devel] [PATCH] ALSA: compress: avoid integer overflow for
	long duration offload playback
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Banajit Goswami <bgoswami@codeaurora.org>

Currently a 32 bit variable is used for storing number of bytes
copied to DSP, which can overflow when playback continues for a long
duration.
Change data type for this variable to __u64 to prevent overflow.

Signed-off-by: Dhananjay Kumar <dhakumar@codeaurora.org>
Signed-off-by: Banajit Goswami <bgoswami@codeaurora.org>
---
 include/uapi/sound/compress_offload.h | 2 +-
 sound/core/compress_offload.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
index 56d9567..db5edf3 100644
--- a/include/uapi/sound/compress_offload.h
+++ b/include/uapi/sound/compress_offload.h
@@ -67,7 +67,7 @@ struct snd_compr_params {
  */
 struct snd_compr_tstamp {
 	__u32 byte_offset;
-	__u32 copied_total;
+	__u64 copied_total;
 	__u32 pcm_frames;
 	__u32 pcm_io_frames;
 	__u32 sampling_rate;
diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index a1a6fd7..2d0a709 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -184,7 +184,7 @@ static int snd_compr_update_tstamp(struct snd_compr_stream *stream,
 	if (!stream->ops->pointer)
 		return -ENOTSUPP;
 	stream->ops->pointer(stream, tstamp);
-	pr_debug("dsp consumed till %d total %d bytes\n",
+	pr_debug("dsp consumed till %d total %llu bytes\n",
 		tstamp->byte_offset, tstamp->copied_total);
 	if (stream->direction == SND_COMPRESS_PLAYBACK)
 		stream->runtime->total_bytes_transferred = tstamp->copied_total;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
