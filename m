Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EDB4C4590
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 14:12:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DCC01AFF;
	Fri, 25 Feb 2022 14:11:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DCC01AFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645794759;
	bh=6QMGCe1tVgCWD9DttlicB92p2MGbXfXoMlHr7CzH/ho=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=obUT+v9ZDBbADMDNNEn+ELkrGreN10B3Rx2Ifqvzra5mfbAQXdiEpKyw7qt4WqgiF
	 vd5vQEStWTYCX5gtdfDF1wNnoNAdsHHgnxcsvk1JKhW1Fp4xOFR1wgbIePSJzFwj77
	 3XvoCxNpkw4NxOCfjWG1q2HlldtPP8Z7ahhUwTSw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45DD7F80516;
	Fri, 25 Feb 2022 14:11:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9079FF800F5; Wed, 23 Feb 2022 13:55:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6BF4F800F5
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 13:55:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6BF4F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="aYY9SQEV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645620940; x=1677156940;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=xDllAEF46R317WHwvyU/EeytzHdwGiWyww3otsuSb90=;
 b=aYY9SQEVFzPCSID3oJqWDOm0xlsDWXdAF6rPnweYBhtAuI1qBSRYkBVu
 U9aZbot6rN8dGX23Y1zdX9SbC88k4ACirJcukDF/L2k2oi2HbgccLdmGS
 L72v8+MeouNGuhkv3yPHeg6yqRTR5mfZZ2LeVeAmrHbuL71Zx55SQzTJC k=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 23 Feb 2022 04:55:36 -0800
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 04:55:37 -0800
Received: from hu-rbankapu-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Wed, 23 Feb 2022 04:55:32 -0800
From: Raghu Bankapur <quic_rbankapu@quicinc.com>
To: Jaroslav Kysela <perex@perex.cz>, <linux-kernel@vger.kernel.org>, "Takashi
 Iwai" <tiwai@suse.com>, <alsa-devel@alsa-project.org>
Subject: [PATCH V1 1/1] ASoC: compress: propagate the error code from the
 compress framework
Date: Wed, 23 Feb 2022 18:22:50 +0530
Message-ID: <eda8b6cdd53576c5487422e46af20bae1a5c864f.1645618332.git.quic_rbankapu@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1645618332.git.quic_rbankapu@quicinc.com>
References: <cover.1645618332.git.quic_rbankapu@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-Mailman-Approved-At: Fri, 25 Feb 2022 14:11:19 +0100
Cc: Krishna Jha <kkishorj@codeaurora.org>,
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
 sound/core/compress_offload.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index de514ec8c83d..48aa87d08bdc 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -31,7 +31,11 @@
 #include <sound/info.h>
 #include <sound/compress_params.h>
 #include <sound/compress_offload.h>
-#include <sound/compress_driver.h>
+#include <sound/compress_driver.h>ASoC: compress: propagate the error code from the compress framework
+
+Propagate the error code from the compress framework for the timestamp
+query. This error code will be used by the client to handle the
+error case scenarios gracefully.
 
 /* struct snd_compr_codec_caps overflows the ioctl bit size for some
  * architectures, so we need to disable the relevant ioctls.
@@ -166,9 +170,12 @@ static int snd_compr_free(struct inode *inode, struct file *f)
 static int snd_compr_update_tstamp(struct snd_compr_stream *stream,
 		struct snd_compr_tstamp *tstamp)
 {
+	int ret = 0;
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

