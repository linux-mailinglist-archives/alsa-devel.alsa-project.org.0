Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5282F686917
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 15:55:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8E66843;
	Wed,  1 Feb 2023 15:55:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8E66843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675263353;
	bh=hA45/WFRIXTRXOtA4228m8pLAsrZhlH073CJU8/KKNY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=tHrA10Lgb218cb22xhY5VZXWFkQJiJsbkfDGTcRo8n7Uj2yppLaqlEJvM/aQukuX9
	 0r5LQ7UhR1Jf0L1VifkLiQtevHV6v1LEXiir30so/w+W4z0ltFmTvQ/iarllMyWZh3
	 yuhHhrlNasrBkXhmPqqAin2C0sVDWQg6psaJWuQI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 233BAF80571;
	Wed,  1 Feb 2023 15:52:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CA4FF80423; Wed,  1 Feb 2023 14:51:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1617F80246
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 14:51:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1617F80246
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=l6Z+sZlR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1675259499; x=1706795499;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gS3pWCRLJFPc0ueQ3n5YfLnR8R+V6sqtxnfm0b570DU=;
 b=l6Z+sZlRA0Koq0BumCzfCzAxaEBt2QHSxXKgCzNYzYhm1tlXCrgpSazD
 8HlslWlO8OEFoRuGY0yMqqLujLbgAvua1YTYryhSXqV1lMOHEeqiBKzch
 jKjIPSFjPP6e8r9IA668Adhuz2S1c8+Lz7mlX86O/78s6myw6R3atEvQ3 I=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 01 Feb 2023 05:51:34 -0800
X-QCInternal: smtphost
Received: from nalasex01b.na.qualcomm.com ([10.47.209.197])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 05:51:34 -0800
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 1 Feb 2023 05:51:29 -0800
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
To: <krzysztof.kozlowski+dt@linaro.org>, <agross@kernel.org>,
 <andersson@kernel.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <robh+dt@kernel.org>, <quic_plai@quicinc.com>, <bgoswami@quicinc.com>,
 <srinivas.kandagatla@linaro.org>, <quic_rohkumar@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>, <swboyd@chromium.org>,
 <judyhsiao@chromium.org>, <devicetree@vger.kernel.org>,
 <konrad.dybcio@linaro.org>
Subject: [PATCH 01/14] ALSA: compress: Update compress set params for gapless
 playback
Date: Wed, 1 Feb 2023 19:19:34 +0530
Message-ID: <20230201134947.1638197-2-quic_mohs@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230201134947.1638197-1-quic_mohs@quicinc.com>
References: <20230201134947.1638197-1-quic_mohs@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-Mailman-Approved-At: Wed, 01 Feb 2023 15:52:51 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Update compress set params for supporting next track settings
during gapless playback.
Update the runtime state to setup state only if it's in open state.
Allow parameter change only when stream has been opened and running
state.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/core/compress_offload.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 243acad89fd3..9b951d76c120 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -589,7 +589,8 @@ snd_compr_set_params(struct snd_compr_stream *stream, unsigned long arg)
 	struct snd_compr_params *params;
 	int retval;
 
-	if (stream->runtime->state == SNDRV_PCM_STATE_OPEN) {
+	if (stream->runtime->state == SNDRV_PCM_STATE_OPEN ||
+			stream->runtime->state == SNDRV_PCM_STATE_RUNNING) {
 		/*
 		 * we should allow parameter change only when stream has been
 		 * opened not in other cases
@@ -612,10 +613,13 @@ snd_compr_set_params(struct snd_compr_stream *stream, unsigned long arg)
 		if (retval)
 			goto out;
 
-		stream->metadata_set = false;
-		stream->next_track = false;
+		if (stream->runtime->state == SNDRV_PCM_STATE_OPEN) {
+			stream->metadata_set = false;
+			stream->next_track = false;
+
+			stream->runtime->state = SNDRV_PCM_STATE_SETUP;
+		}
 
-		stream->runtime->state = SNDRV_PCM_STATE_SETUP;
 	} else {
 		return -EPERM;
 	}
-- 
2.25.1

