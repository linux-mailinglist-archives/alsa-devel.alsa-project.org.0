Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 519974D30FA
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 15:24:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0CF217EB;
	Wed,  9 Mar 2022 15:23:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0CF217EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646835889;
	bh=eyQUZNtipOrBhmfkB32vbkvB1cYZBmsaEL92ucx4hYE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b3JF5h4zbzpk5p04MGKdLfFa3IECx9cA/z4QoktVGX17iZQbE8Hq2VxlZnF+us1BE
	 DbhVwRx7o/cSipRNxk8QnpYJlBGhYbPoUFbvf8fmih+z6YgT9P/x+3O/ZOuumZkPmO
	 UH/0fTUQ4e9HJ8jdxj79OUD1ApLM4woN3zGy5r/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B1A1F8012F;
	Wed,  9 Mar 2022 15:23:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8286F8028D; Wed,  9 Mar 2022 15:23:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D094F8012F
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 15:23:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D094F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="GWh83nEZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1646835792; x=1678371792;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=RWKnNnTeEOjVqq7CWbHUR0BTNxJt/MW7KsU/tp//GhY=;
 b=GWh83nEZ0kqGry25pAMqpDUd/9wkeHV8uhCKDqd98zjMbHXjoin//vq9
 xTS0Klqsrl31Y3QI2LaacMdPlWSg7IkSfkQV8gTnF1OzYzpgqd1ThNB5R
 eovt8udexvxMWlizuxwKvs1p0F6A33MD6DXHLnjVajR4iHd3VpTdPkbe3 Y=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 09 Mar 2022 06:23:06 -0800
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 06:23:06 -0800
Received: from hu-rbankapu-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Wed, 9 Mar 2022 06:23:03 -0800
From: Raghu Bankapur <quic_rbankapu@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Raghu Bankapur <quic_rbankapu@quicinc.com>,
 <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH V0 1/1] ASoC: msm: fix integer overflow for long duration
 offload playback
Date: Wed, 9 Mar 2022 19:52:28 +0530
Message-ID: <b906dbaf772d0152a3af52d639b090d15fe8c362.1646835508.git.quic_rbankapu@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1646835508.git.quic_rbankapu@quicinc.com>
References: <cover.1646835508.git.quic_rbankapu@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
Cc: Krishna Jha <quic_kkishorj@quicinc.com>,
 Raghu Bankapur <quic_rbankapu@quiinc.com>
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

From: Raghu Bankapur <quic_rbankapu@quiinc.com>

32 bit variable is used for storing number of bytes copied to DSP,
which can overflow when playback duration goes beyond 24 hours.
Change data type for this variable to uint64_t to prevent overflow
and related playback anomaly.

Signed-off-by: Raghu Bankapur <quic_rbankapu@quicinc.com>
---
 include/uapi/sound/compress_offload.h | 2 +-
 sound/core/compress_offload.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
index 9555f31c8425..57d24d89b2f4 100644
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
index de514ec8c83d..068376b586be 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -169,7 +169,7 @@ static int snd_compr_update_tstamp(struct snd_compr_stream *stream,
 	if (!stream->ops->pointer)
 		return -ENOTSUPP;
 	stream->ops->pointer(stream, tstamp);
-	pr_debug("dsp consumed till %d total %d bytes\n",
+	pr_debug("dsp consumed till %d total %llu bytes\n",
 		tstamp->byte_offset, tstamp->copied_total);
 	if (stream->direction == SND_COMPRESS_PLAYBACK)
 		stream->runtime->total_bytes_transferred = tstamp->copied_total;
-- 
2.17.1

