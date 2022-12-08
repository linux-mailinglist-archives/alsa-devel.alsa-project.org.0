Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D6D646AD2
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Dec 2022 09:43:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AB5D17EC;
	Thu,  8 Dec 2022 09:42:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AB5D17EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670489006;
	bh=gvi+j6foqGCBfyUBcDGrT+G1lDhArgs4X9GDOE2mgjk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ln2YCe7w0xbE8NxOZKMvFfI5BJ/a7bLr9uQ0DFPb5LHUSI93rCeeJb4UHwKW3spEu
	 H2oF58DnWZqi479ldqdcbq52IUQZQKCqENYiOqDEV9sJLndY1zRuSR0Xl1iJJvwakF
	 5qI05u41yqUNw3m/pCyBMsBvNmnvHT47a2TQkhAU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AFEBF8024C;
	Thu,  8 Dec 2022 09:42:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0949AF8020D; Thu,  8 Dec 2022 09:42:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1FFFF80121
 for <alsa-devel@alsa-project.org>; Thu,  8 Dec 2022 09:42:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1FFFF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="c9xG9GI1"
Received: by mail-pg1-x534.google.com with SMTP id 82so694251pgc.0
 for <alsa-devel@alsa-project.org>; Thu, 08 Dec 2022 00:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DGJUqYentDxpsZIqZganWe5s05yc50g5y506pVr616s=;
 b=c9xG9GI1V8aQgWpo7G11WVbtiKLGwJBz5kacyFpUq+OtYMc52xXwIEzThqSwV9pNxC
 mQBMXyrUJeoNWya3unYBMIO2jv7vZPvvT/enpF5UTF/jRaBpFDrNkLNt5D5UxWJPRwMy
 833lLMjlZeR0jwGgk/mIGGI5LDM7B3O3AIBTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DGJUqYentDxpsZIqZganWe5s05yc50g5y506pVr616s=;
 b=3gcSvyXxWtHo4iuClXQ23AV7/MW7NFDfMaKcwIiKpuDRWkZIYIztdzhyoarb5KxgeH
 18pKVtEf2HaHxGaGWHW27Lzknxhbx+h4SwaeR8ePM34Cm4OrDuTTyHvLf5KFgsKq93xs
 ezUkC4h+EegGP1mFKaqxVcJKAsUM9l4pn+5kRINxMwqwPvyq3bpdQYFW8IQIx5Q8jijl
 /H20HRUcI7R8xK0CR7LPJqCiPOm02+hNau6IZBs96rFdSCw0YOZk4uIkCSCZ3jwZwIGs
 AiLI/Jxl6yR6ERTtFm8g/cM2yF8m9jojR5Kcikohq6NnPS3nDvSkM8YgCCfT3/XOgbFr
 Ytjg==
X-Gm-Message-State: ANoB5pmATTCtYE/spCbGDPNc0ICoTuuC0zwf3JjphXQYIhdfHDFLCzjx
 nsrhopZXYgvo3tkXrRgPnSqxDw==
X-Google-Smtp-Source: AA0mqf5NZIwK4wg0NcMqZI3Pqz/HTbk75LiStHqDkGpllqpRWle6crJdD45l2KSB5di/zLufBJA+2g==
X-Received: by 2002:a62:de04:0:b0:577:3885:9d43 with SMTP id
 h4-20020a62de04000000b0057738859d43mr1501097pfg.18.1670488937909; 
 Thu, 08 Dec 2022 00:42:17 -0800 (PST)
Received: from judyhsiao0523.c.googlers.com.com
 (21.160.199.104.bc.googleusercontent.com. [104.199.160.21])
 by smtp.gmail.com with ESMTPSA id
 n9-20020aa79849000000b005769ccca18csm9215193pfq.85.2022.12.08.00.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 00:42:17 -0800 (PST)
From: Judy Hsiao <judyhsiao@chromium.org>
To: srinivas.kandagatla@linaro.org, bgoswami@codeaurora.org,
 lgirdwood@gmail.com, broonie@kernel.org
Subject: [PATCH v1] ASoC: qcom: lpass-platform: Use SNDRV_DMA_TYPE_NONCOHERENT
 page allocation
Date: Thu,  8 Dec 2022 08:42:00 +0000
Message-Id: <20221208084200.2136311-1-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.39.0.rc0.267.gcb52ba06e7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 Banajit Goswami <bgoswami@quicinc.com>, Judy Hsiao <judyhsiao@chromium.org>
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

Replace SNDRV_DMA_TYPE_DEV by SNDRV_DMA_TYPE_NONCOHERENT for pcm
buffer allocation. We measured about 18x performance improvement
when accessing the snd_pcm_mmap() buffer from userspace.

Eg: aarch64 with internal speaker
==
SNDRV_DMA_TYPE_DEV
    frames_per_second=66.4557M/s
    max_time_per_4096_frames=106.094u
    time_per_4096_frames=61.6351us

SNDRV_DMA_TYPE_NONCOHERENT
    frames_per_second=1028.58M/s
    max_time_per_4096_frames=20.312u
    time_per_4096_frames=3.98221us

Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>

---

 sound/soc/qcom/lpass-platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index b41ab7a321ae..ef5cb40b2d9b 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -1181,7 +1181,7 @@ static int lpass_platform_pcm_new(struct snd_soc_component *component,
 	if (is_cdc_dma_port(dai_id))
 		return lpass_platform_prealloc_cdc_dma_buffer(component, pcm, dai_id);
 
-	return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+	return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_NONCOHERENT,
 					    component->dev, size);
 }
 
-- 
2.39.0.rc0.267.gcb52ba06e7-goog

