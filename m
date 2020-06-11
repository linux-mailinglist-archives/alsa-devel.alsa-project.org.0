Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6BA1F6812
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jun 2020 14:44:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6BC81683;
	Thu, 11 Jun 2020 14:44:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6BC81683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591879492;
	bh=lOgsJP+8QmzeAyx4ajOTZd9m6uCeUnihaH/7WfP9ZRU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RGvx5OQcByzP7OLRWSbZWJLxvAmT95uZs5Nv2BrPiDfA0sPU+yUOihEs88zPC+Fdz
	 DPNpPPGQm0itylpGtx3I+QgKs+2w9HNoFM0kgED0ZlECUcTJQk4/HT2se5NSx04/Yr
	 JAqTHvUEXxwev4QJb75DFVaYvCPw/WY7xJDBWtyI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C065DF802BE;
	Thu, 11 Jun 2020 14:42:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE9BAF802A8; Thu, 11 Jun 2020 14:42:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AD0DF8028C
 for <alsa-devel@alsa-project.org>; Thu, 11 Jun 2020 14:42:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AD0DF8028C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="V4h1Ca5n"
Received: by mail-wr1-x442.google.com with SMTP id x14so6013662wrp.2
 for <alsa-devel@alsa-project.org>; Thu, 11 Jun 2020 05:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DNGruM6B9mSP+joziG19q2cWIhnj5b++piG0JMa2V6w=;
 b=V4h1Ca5nmbkGj2hladouj3f0enZ42GxqHryh272WGrCyPuT8xAqb5wtLULOLNDb+kC
 4nQJutDNKmqUgli3yOe3RjfHFZaSVQ19vyaJsIfIPTBQY8Djk8nvgmc+cLynOwY483hE
 +j/KXAsI6qxCx/3+go7O4EV+4+zHdi9amag7lzmPK6C1Pc0f5/gueHRHXHCloSoGx5wE
 oQw5gZFdYR3DQEGt4IpZC6IyjcxKMBtvidnKZ4MoZXG42gGEyoM7bHwuHH5p0KoFSjTv
 JSKm5hl4tsRxMY0LiWiW2QKqLF2UTBI0Tz96AH8b2WczI3be44UTQa/le2UeX/qI5JgH
 Nw+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DNGruM6B9mSP+joziG19q2cWIhnj5b++piG0JMa2V6w=;
 b=KvzpUaWqnWVefhRL4u1yjRL+1/55uZyM1LHBBScRluP06X/tdE9Lv097wdg/HFjVam
 e4JlJ8Hlm7ft7Ig6Drexklr6paxgoK3x/M4QsFqo9U1ORDMcxdTtfx4I2RRq74Iggh3X
 59i6kI5AOn8csYrq0/ihqpYBTm2qOpTtWM1Uj624ZizYaJdcYs+pwSu6B2GjT4NgAd5c
 P9yipBravnDV/5Xh1GeyeOi+P0EDWEy/9GF9YUSoV8ab+R/2kCyU6HcwELUt0KC3bXvp
 WpmMaktJVgJ5K4PXwueWyHXzWR//ZcfGeQSjI89w1gjK4bDynKeA09683twgIMUgj5mm
 Cm+g==
X-Gm-Message-State: AOAM533IYRPYUSK4eQODGN+v6BRa4AeE4Rm3I1ipi9Crhnm6OednWRjB
 aflV7eRsF1BDfYnmNu2LWwaJLg==
X-Google-Smtp-Source: ABdhPJz4z+o5PKHUFnC5aUpJgoVQGqDgO8B3X+8NJKRrokT1gn4IjQF8Z7a2PR+JqR94h+2kLxN8eA==
X-Received: by 2002:a5d:5585:: with SMTP id i5mr9200628wrv.112.1591879325343; 
 Thu, 11 Jun 2020 05:42:05 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id q13sm4810355wrn.84.2020.06.11.05.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 05:42:04 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 2/8] ASoC: q6asm: handle EOS correctly
Date: Thu, 11 Jun 2020 13:41:53 +0100
Message-Id: <20200611124159.20742-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200611124159.20742-1-srinivas.kandagatla@linaro.org>
References: <20200611124159.20742-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
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

Successful send of EOS command does not indicate that EOS is actually
finished, correct event to wait EOS is finished is EOS_RENDERED event.
EOS_RENDERED means that the DSP has finished processing all the buffers
for that particular session and stream.

This patch fixes EOS handling!

Fixes: 68fd8480bb7b ("ASoC: qdsp6: q6asm: Add support to audio stream apis")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6asm.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index 0ce70a5c7d9e..e0983970cba9 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -25,6 +25,7 @@
 #define ASM_STREAM_CMD_FLUSH			0x00010BCE
 #define ASM_SESSION_CMD_PAUSE			0x00010BD3
 #define ASM_DATA_CMD_EOS			0x00010BDB
+#define ASM_DATA_EVENT_RENDERED_EOS		0x00010C1C
 #define ASM_NULL_POPP_TOPOLOGY			0x00010C68
 #define ASM_STREAM_CMD_FLUSH_READBUFS		0x00010C09
 #define ASM_STREAM_CMD_SET_ENCDEC_PARAM		0x00010C10
@@ -622,9 +623,6 @@ static int32_t q6asm_stream_callback(struct apr_device *adev,
 		case ASM_SESSION_CMD_SUSPEND:
 			client_event = ASM_CLIENT_EVENT_CMD_SUSPEND_DONE;
 			break;
-		case ASM_DATA_CMD_EOS:
-			client_event = ASM_CLIENT_EVENT_CMD_EOS_DONE;
-			break;
 		case ASM_STREAM_CMD_FLUSH:
 			client_event = ASM_CLIENT_EVENT_CMD_FLUSH_DONE;
 			break;
@@ -727,6 +725,9 @@ static int32_t q6asm_stream_callback(struct apr_device *adev,
 			spin_unlock_irqrestore(&ac->lock, flags);
 		}
 
+		break;
+	case ASM_DATA_EVENT_RENDERED_EOS:
+		client_event = ASM_CLIENT_EVENT_CMD_EOS_DONE;
 		break;
 	}
 
-- 
2.21.0

