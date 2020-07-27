Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FD422E942
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 11:41:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB2441668;
	Mon, 27 Jul 2020 11:40:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB2441668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595842866;
	bh=xuOfXPHBqirPOhrzau6JVqo+8jOyJEnDhcUHJoLx5xo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gZ501r3EP/LVsVS47g25MQiuio6d12qKOUavU/pHxlUvXLxOAIhc0DiQy0dKE9hPL
	 8YfAkF7+E3CU2bwCV3pv1gOeSY5jfpAdspv9F3fbfqBbMh2uZlWcmeMIJbRn5MrhOM
	 pwI5y/DbG23ObFIigJBEFYHLZfGOqR9FPECqYmrQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A45A3F802D2;
	Mon, 27 Jul 2020 11:38:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A83DF802BD; Mon, 27 Jul 2020 11:38:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 936B1F801D9
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 11:38:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 936B1F801D9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="RhOXMgss"
Received: by mail-wr1-x42b.google.com with SMTP id f18so14177599wrs.0
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 02:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NGhSMw5rANk93AxDzrh+wwZG+B5HF8qJTCODBy27FHQ=;
 b=RhOXMgssTx6PPGu1/Vegg97W3OXjoKMeWxLRo2HdsCYofJV7I6CWx3NqsrMfRyin3G
 SN4xkcFD4ZPa3UAetwasbE3Hjm9kLETVc72d/EhjygzCyg9O5Pvdt24lQXrf988dBhCw
 0R3jANKPQFUZaGGFy+FFrfBbySVuV7PxdtTLPLKS56uCUgBx6b3eUBrozqtSdhD9wP8Y
 AUnRULsfwCpQjxr/nnNABoG3reJ+YiARMnmK1DcekF2+ZMGVaeaPbWvlDxyAXGhM/QZS
 kM3TD6v8lG5okWyFgl10QvoWXVU/eMkNVda2aAgy4OMQbRTMAT4CymAAaIdterxvqEI+
 v4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NGhSMw5rANk93AxDzrh+wwZG+B5HF8qJTCODBy27FHQ=;
 b=hJjktb49v2IxZyPgLVZSeqgMepjxgn9NJSoN4A5Z0vmJ0Ia3OBdLaBEUtFvLPpC44i
 2OKJ+jcZwxQRpka/4A92ZBlagd3ySMQZZSrbjlewNMzPEJyte/qgYkO8TDJeBOdVPcyN
 CDACyj2Q9DXZSjKv29CEU8RdVP1c1+bhR51oUyMtesgnfZhiIzgD983GtGaoVh9g4yiJ
 NciplE7iY2kiorOCQ7GJ6235U5Spms52hK4bg3Q3jL6f3r9x4h031WH1Ohf3DI+c0FHH
 aLW6L/8Yl17hMzDvtpUOmGP7hqHJQF7m6Cw78GlYNm6zjfVyYYcmm+1Y9UDg73BaOCLL
 lwTw==
X-Gm-Message-State: AOAM532VtTj8kCwIa5ZkZjd5BQlhibN/sqrV8PVABPVe9jOqhCJ78fVC
 /HwAJzPM3ZH5eHIgZ7nEwORXlw==
X-Google-Smtp-Source: ABdhPJya93rqdcJwhckPQUaHBuEIu9GMb+saVL1XYg0o4gz1LaDhJSt0Sn/S40itt6TIeef+yn1+Eg==
X-Received: by 2002:a5d:4942:: with SMTP id r2mr15760878wrs.285.1595842697169; 
 Mon, 27 Jul 2020 02:38:17 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id y189sm20566099wmd.27.2020.07.27.02.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 02:38:16 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v3 03/10] ASoC: q6asm: use flags directly from q6asm-dai
Date: Mon, 27 Jul 2020 10:37:59 +0100
Message-Id: <20200727093806.17089-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200727093806.17089-1-srinivas.kandagatla@linaro.org>
References: <20200727093806.17089-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 ckeepax@opensource.cirrus.com, tiwai@suse.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, vkoul@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

use flags set by q6asm-dais directly!

This will be useful gapless case where write needs a special flag to indicate
that last buffer.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 8 ++++----
 sound/soc/qcom/qdsp6/q6asm.c     | 5 +----
 sound/soc/qcom/qdsp6/q6asm.h     | 1 -
 3 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index e8c732ec6061..466383b8c20c 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -186,7 +186,7 @@ static void event_handler(uint32_t opcode, uint32_t token,
 	case ASM_CLIENT_EVENT_CMD_RUN_DONE:
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 			q6asm_write_async(prtd->audio_client, prtd->stream_id,
-				   prtd->pcm_count, 0, 0, NO_TIMESTAMP);
+				   prtd->pcm_count, 0, 0, 0);
 		break;
 	case ASM_CLIENT_EVENT_CMD_EOS_DONE:
 		prtd->state = Q6ASM_STREAM_STOPPED;
@@ -196,7 +196,7 @@ static void event_handler(uint32_t opcode, uint32_t token,
 		snd_pcm_period_elapsed(substream);
 		if (prtd->state == Q6ASM_STREAM_RUNNING)
 			q6asm_write_async(prtd->audio_client, prtd->stream_id,
-					   prtd->pcm_count, 0, 0, NO_TIMESTAMP);
+					   prtd->pcm_count, 0, 0, 0);
 
 		break;
 		}
@@ -515,7 +515,7 @@ static void compress_event_handler(uint32_t opcode, uint32_t token,
 		spin_lock_irqsave(&prtd->lock, flags);
 		if (!prtd->bytes_sent) {
 			q6asm_write_async(prtd->audio_client, prtd->stream_id,
-					  prtd->pcm_count, 0, 0, NO_TIMESTAMP);
+					  prtd->pcm_count, 0, 0, 0);
 			prtd->bytes_sent += prtd->pcm_count;
 		}
 
@@ -541,7 +541,7 @@ static void compress_event_handler(uint32_t opcode, uint32_t token,
 
 		if (avail >= prtd->pcm_count) {
 			q6asm_write_async(prtd->audio_client, prtd->stream_id,
-					   prtd->pcm_count, 0, 0, NO_TIMESTAMP);
+					   prtd->pcm_count, 0, 0, 0);
 			prtd->bytes_sent += prtd->pcm_count;
 		}
 
diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index f5d1f3c2c1ec..d6728304ce6a 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -1546,10 +1546,7 @@ int q6asm_write_async(struct audio_client *ac, uint32_t stream_id, uint32_t len,
 	write->mem_map_handle =
 	    ac->port[SNDRV_PCM_STREAM_PLAYBACK].mem_map_handle;
 
-	if (wflags == NO_TIMESTAMP)
-		write->flags = (wflags & 0x800000FF);
-	else
-		write->flags = (0x80000000 | wflags);
+	write->flags = wflags;
 
 	port->dsp_buf++;
 
diff --git a/sound/soc/qcom/qdsp6/q6asm.h b/sound/soc/qcom/qdsp6/q6asm.h
index ceece124dd3d..9ac020c609c6 100644
--- a/sound/soc/qcom/qdsp6/q6asm.h
+++ b/sound/soc/qcom/qdsp6/q6asm.h
@@ -29,7 +29,6 @@ enum {
 };
 
 #define MAX_SESSIONS	8
-#define NO_TIMESTAMP    0xFF00
 #define FORMAT_LINEAR_PCM   0x0000
 
 struct q6asm_flac_cfg {
-- 
2.21.0

