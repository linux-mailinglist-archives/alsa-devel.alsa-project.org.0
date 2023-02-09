Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0266908D2
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 13:30:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 983F7DEE;
	Thu,  9 Feb 2023 13:29:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 983F7DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675945816;
	bh=zDyJ5ghTP9eYRWZEAh2yDcpgglGnhtKISaYGmLlBI7A=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DuaOms+iq+eBd/Y1mDeaB4FadOo0Y1Y6gbWFT9k26+UAsLEOtK31nNM6RVX3lknW6
	 K12x/Nb7m/3lMgi9fsjgcuPtUuag4W0C8hRIApPL0IdAdSCTuflbAYYtE7RO2mU1TQ
	 ynovOaNPBBKYJjON/++n1nqBl6c5LcsLCoH9Py4g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A1C4F80529;
	Thu,  9 Feb 2023 13:28:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B090BF80526; Thu,  9 Feb 2023 13:28:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 80CA7F80094
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 13:28:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80CA7F80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=alMmw7K9
Received: by mail-wr1-x430.google.com with SMTP id y1so1609760wru.2
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Feb 2023 04:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JongRsuVGtYNajpohdC5ZEm05+E/44o4yeTIeuBWqPg=;
        b=alMmw7K9GMnEn1dIokLBXd4VnAN2PqcPqLeYDOvmAEvT+atiV99OFPdGXozBSW1ssj
         ccORQTeZzjA8aLRxMsj+skj1xDRSXVIxjBTUzh/apuAPqn3ele+M/sugsW1C8k03X4tq
         YEdEGEkEY0o6n2vIisvGuacfKbPSLlHmbGSqDowpOOmRMEwfTxvAZlQocUX5x+u1kCzO
         FlguWkcJCItO/oGT/y3ZoY6MzZrV7rX4TJjuDtvzTQtG6M1zMIj58VTStQDka8oVsu6l
         vxSOHg31mXv1kY4gERgMIEM5NUEpTNpfzi4iQAkFWsF2FXAteACyABSGiHPdHEsbptBC
         nk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JongRsuVGtYNajpohdC5ZEm05+E/44o4yeTIeuBWqPg=;
        b=h4UdgqJ0nKI/wGlm1/cxRLpPwqystT5MJ64+6q0k2Z8tJJHPy5vZKOx33wnel4ezsc
         ReqMVHPivhSpmkgM69Quek7MTQTtnRLrjqkMxYgwBN5122iqxvtYR4yZt3Or1mUdrgMf
         vXe6Tb1qaSdn4Q7JvnEtnILe4/AbVSbXeu6gt9adatCA1L1HLEYzwLQ4CsNFCkRlp6LP
         qqZjMKt1qxtzuf8Y6afazjgt73XiDd9Ni/npGGrwReRD+0ccZs+oRY3n76mix9mXucyU
         BxmwW8c60au1PM37fiZwXiZzOoD4nvv2zWFzwjkJ+ag3rddZs14mFc3ZKsQ1WNBIgerg
         j/lw==
X-Gm-Message-State: AO0yUKXczp1OHizGhYnENdc8UZ2BenOgDM76nnyKx7J+ZCSt8NP4UoLY
	406mlo3pFGGhRBb/LxFjZGa0Sg==
X-Google-Smtp-Source: 
 AK7set8SioHyugKUVRQMPGwHDkqYTiDLPA9qpldsYrSbri1MnKs3q0k8fi7Ii5vdS25u7FD8u9iJ2g==
X-Received: by 2002:a05:6000:8:b0:2c2:ad22:40ba with SMTP id
 h8-20020a056000000800b002c2ad2240bamr10493326wrx.68.1675945697850;
        Thu, 09 Feb 2023 04:28:17 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 o8-20020a5d58c8000000b002c3f0a4ce98sm1134763wrf.98.2023.02.09.04.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 04:28:17 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 2/8] ASoC: qcom: q6apm-dai: fix race condition while updating
 the position pointer
Date: Thu,  9 Feb 2023 12:28:00 +0000
Message-Id: <20230209122806.18923-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230209122806.18923-1-srinivas.kandagatla@linaro.org>
References: <20230209122806.18923-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SD2EG3XJWCCDA7N3DCKEDNTPXXQX6MDY
X-Message-ID-Hash: SD2EG3XJWCCDA7N3DCKEDNTPXXQX6MDY
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, steev@kali.org, johan+linaro@kernel.org,
 quic_bjorande@quicinc.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SD2EG3XJWCCDA7N3DCKEDNTPXXQX6MDY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It is noticed that the position pointer value seems to get a get corrupted
due to missing locking between updating and reading.

Fix this by adding a spinlock around the position pointer.

Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index ee59ef36b85a..bd35067a4052 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -8,6 +8,7 @@
 #include <linux/slab.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
+#include <linux/spinlock.h>
 #include <sound/pcm.h>
 #include <asm/dma.h>
 #include <linux/dma-mapping.h>
@@ -53,6 +54,7 @@ struct q6apm_dai_rtd {
 	uint16_t session_id;
 	enum stream_state state;
 	struct q6apm_graph *graph;
+	spinlock_t lock;
 };
 
 struct q6apm_dai_data {
@@ -99,20 +101,25 @@ static void event_handler(uint32_t opcode, uint32_t token, uint32_t *payload, vo
 {
 	struct q6apm_dai_rtd *prtd = priv;
 	struct snd_pcm_substream *substream = prtd->substream;
+	unsigned long flags;
 
 	switch (opcode) {
 	case APM_CLIENT_EVENT_CMD_EOS_DONE:
 		prtd->state = Q6APM_STREAM_STOPPED;
 		break;
 	case APM_CLIENT_EVENT_DATA_WRITE_DONE:
+	        spin_lock_irqsave(&prtd->lock, flags);
 		prtd->pos += prtd->pcm_count;
+		spin_unlock_irqrestore(&prtd->lock, flags);
 		snd_pcm_period_elapsed(substream);
 		if (prtd->state == Q6APM_STREAM_RUNNING)
 			q6apm_write_async(prtd->graph, prtd->pcm_count, 0, 0, 0);
 
 		break;
 	case APM_CLIENT_EVENT_DATA_READ_DONE:
+	        spin_lock_irqsave(&prtd->lock, flags);
 		prtd->pos += prtd->pcm_count;
+		spin_unlock_irqrestore(&prtd->lock, flags);
 		snd_pcm_period_elapsed(substream);
 		if (prtd->state == Q6APM_STREAM_RUNNING)
 			q6apm_read(prtd->graph);
@@ -253,6 +260,7 @@ static int q6apm_dai_open(struct snd_soc_component *component,
 	if (prtd == NULL)
 		return -ENOMEM;
 
+	spin_lock_init(&prtd->lock);
 	prtd->substream = substream;
 	prtd->graph = q6apm_graph_open(dev, (q6apm_cb)event_handler, prtd, graph_id);
 	if (IS_ERR(prtd->graph)) {
@@ -332,11 +340,17 @@ static snd_pcm_uframes_t q6apm_dai_pointer(struct snd_soc_component *component,
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct q6apm_dai_rtd *prtd = runtime->private_data;
+	snd_pcm_uframes_t ptr;
+	unsigned long flags;
 
+	spin_lock_irqsave(&prtd->lock, flags);
 	if (prtd->pos == prtd->pcm_size)
 		prtd->pos = 0;
 
-	return bytes_to_frames(runtime, prtd->pos);
+	ptr =  bytes_to_frames(runtime, prtd->pos);
+	spin_unlock_irqrestore(&prtd->lock, flags);
+
+	return ptr;
 }
 
 static int q6apm_dai_hw_params(struct snd_soc_component *component,
-- 
2.21.0

