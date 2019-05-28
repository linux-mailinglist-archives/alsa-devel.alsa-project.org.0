Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4332BE9A
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 07:29:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37C1117C7;
	Tue, 28 May 2019 07:28:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37C1117C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559021349;
	bh=zS4kOs12j60ezZE6WQ2EZH4am8alYSgnAMW6kZsNXgQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KcNM5wrmpNf5AB6MFc8tnpuCPxFtEgZIFfJ+9eL+ermeAJ323VO0BhrSCFnS4G1Wm
	 Gg/6u77VdmZ00M+9DKg3Qr4zfQFm/Ds3V64ERiZA0sZr5dospL5+7bXH1VRLjUuA54
	 +GAO6y7BDT43midT5m5+eoKrT/iQMLPsoapmCBug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 450E4F896EB;
	Tue, 28 May 2019 07:27:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE2BBF896EB; Tue, 28 May 2019 07:27:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2D10F808F6
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 07:27:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2D10F808F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=codeaurora.org header.i=@codeaurora.org
 header.b="hmGPvOCX"; 
 dkim=pass (1024-bit key) header.d=codeaurora.org header.i=@codeaurora.org
 header.b="hmGPvOCX"
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id D838E60769; Tue, 28 May 2019 05:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1559021235;
 bh=COM27CLA5YPcjO6w0WncoMyHj7+7UOp0BdV0sWfuSqw=;
 h=From:To:Cc:Subject:Date:From;
 b=hmGPvOCX/3Wu+v3ZgpB9s6mi+wdWL5+S93sNJe0O8WYDboNu+5Sofom7oV1IXTiwd
 9g3FotDJmNagi7Pl9BgcD7lmIuuxWDlj8tSjt8jjgL//fISXFDpBzGuwDFdyaLK8ZK
 U+WIrCyBlvfzsi6KaRZWswMFYoORdf1NP28QA7i0=
Received: from localhost (i-global254.qualcomm.com [199.106.103.254])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: bgoswami@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 594386030D;
 Tue, 28 May 2019 05:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1559021235;
 bh=COM27CLA5YPcjO6w0WncoMyHj7+7UOp0BdV0sWfuSqw=;
 h=From:To:Cc:Subject:Date:From;
 b=hmGPvOCX/3Wu+v3ZgpB9s6mi+wdWL5+S93sNJe0O8WYDboNu+5Sofom7oV1IXTiwd
 9g3FotDJmNagi7Pl9BgcD7lmIuuxWDlj8tSjt8jjgL//fISXFDpBzGuwDFdyaLK8ZK
 U+WIrCyBlvfzsi6KaRZWswMFYoORdf1NP28QA7i0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 594386030D
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=bgoswami@codeaurora.org
From: bgoswami@codeaurora.org
To: perex@perex.cz,
	tiwai@suse.com
Date: Mon, 27 May 2019 22:27:03 -0700
Message-Id: <1559021223-28674-1-git-send-email-bgoswami@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 plai@codeaurora.org, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 Phani Kumar Uppalapati <phaniu@codeaurora.org>
Subject: [alsa-devel] [PATCH] ALSA: pcm: Check for integer overflow during
	multiplication
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

From: Phani Kumar Uppalapati <phaniu@codeaurora.org>

Channel info data structure is parsed from userspace and if
the number of channels is not set correctly, it could lead
to integer overflow when the number of channels is multiplied
with pcm bit width. Add a condition to check for integer
overflow during the multiplication operationi, and return error
if overflow detected.

Signed-off-by: Phani Kumar Uppalapati <phaniu@codeaurora.org>
Signed-off-by: Banajit Goswami <bgoswami@codeaurora.org>
---
 sound/core/pcm_lib.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 345ab1a..f45ae3a 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1718,6 +1718,11 @@ static int snd_pcm_lib_ioctl_channel_info(struct snd_pcm_substream *substream,
 	switch (runtime->access) {
 	case SNDRV_PCM_ACCESS_MMAP_INTERLEAVED:
 	case SNDRV_PCM_ACCESS_RW_INTERLEAVED:
+		if ((UINT_MAX/width) < info->channel) {
+			snd_printd("%s: integer overflow in multiplication\n",
+				   __func__);
+			return -EINVAL;
+		}
 		info->first = info->channel * width;
 		info->step = runtime->channels * width;
 		break;
@@ -1725,6 +1730,12 @@ static int snd_pcm_lib_ioctl_channel_info(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_ACCESS_RW_NONINTERLEAVED:
 	{
 		size_t size = runtime->dma_bytes / runtime->channels;
+
+		if ((size > 0) && ((UINT_MAX/(size * 8)) < info->channel)) {
+			snd_printd("%s: integer overflow in multiplication\n",
+				   __func__);
+			return -EINVAL;
+		}
 		info->first = info->channel * size * 8;
 		info->step = width;
 		break;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
