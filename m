Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB1E4C45EE
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 14:20:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 470DC1E81;
	Fri, 25 Feb 2022 14:19:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 470DC1E81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645795243;
	bh=Snl9/NU52i1zKXtP6bQyTkzAlzGb3Du47QKlnoCyKEI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OWOqs6vK+yL+Xy3MV22iVv+UCrJ0D/m+nLhOQvrAtyA+2z57J7pKEdK49oqreQSfj
	 hSQADthySK56XpiwjW7LSoanwTXR6Z9z7rGF39F+22r+wbS8DKZiDOzrWY06vZFXdM
	 TNZYpV/QREunOYCuHwV99fqjiNF7tdUEfyeg8TFw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E11BF805ED;
	Fri, 25 Feb 2022 14:11:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F4CCF80118; Thu, 24 Feb 2022 13:19:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB8B7F80118
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 13:19:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB8B7F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="Hu+90Rmf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645705147; x=1677241147;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=PxV/N18yz0PnOF/IEfjW+y8GisGCplxOMpBz4EPrdQg=;
 b=Hu+90RmfE45th471LAJ0fvOk0T96sYyuMuX9c0VnF5QWGwquzUeK/wds
 fd3kWj+4gctoogb5vKWD5dCU9QLw57D6HcgfSYH8NFPZOK5kHcrHliY6h
 d9GrPlpTKLBTTj5cj3gDIeyr8PJAEyoSe2jsmTRikpwJOq+IxY9PU1NFg g=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 24 Feb 2022 04:19:05 -0800
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 04:19:05 -0800
Received: from hu-rbankapu-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 24 Feb 2022 04:19:02 -0800
From: Raghu Bankapur <quic_rbankapu@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH V2 1/1] ASoC: compress: propagate the error code from the
 compress framework
Date: Thu, 24 Feb 2022 17:48:33 +0530
Message-ID: <ca6d05bccf692c7e8ab9aa00f08878f163e524b1.1645704570.git.quic_rbankapu@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1645704570.git.quic_rbankapu@quicinc.com>
References: <cover.1645704570.git.quic_rbankapu@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-Mailman-Approved-At: Fri, 25 Feb 2022 14:11:19 +0100
Cc: Krishna Jha <quic_kkishorj@quicinc.com>,
 Raghu Bankapur <quic_rbankapu@quicinc.com>
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

Propagate the error code from the compress framework for the timestamp
query. This error code will be used by the client to handle the
error case scenarios gracefully.

Signed-off-by: Raghu Bankapur <quic_rbankapu@quicinc.com>
---
 sound/core/compress_offload.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index de514ec8c83d..1882b2de1a5a 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -166,9 +166,13 @@ static int snd_compr_free(struct inode *inode, struct file *f)
 static int snd_compr_update_tstamp(struct snd_compr_stream *stream,
 		struct snd_compr_tstamp *tstamp)
 {
+	int ret;
+
 	if (!stream->ops->pointer)
 		return -ENOTSUPP;
-	stream->ops->pointer(stream, tstamp);
+	ret = stream->ops->pointer(stream, tstamp);
+	if (ret)
+		return ret;
 	pr_debug("dsp consumed till %d total %d bytes\n",
 		tstamp->byte_offset, tstamp->copied_total);
 	if (stream->direction == SND_COMPRESS_PLAYBACK)
-- 
2.17.1

