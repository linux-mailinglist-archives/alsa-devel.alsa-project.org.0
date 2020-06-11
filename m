Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EE71F681D
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jun 2020 14:47:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27F8E1687;
	Thu, 11 Jun 2020 14:46:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27F8E1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591879644;
	bh=uTmFuzq8ftfBCejonkdjTHFTnppNHZzRJMv3AWJkr3Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UOuQWM0CBBTeh4hLv8Sr2nPhWP0slnpLPzuJvRbxoyG28lIfMVTG1XJC8JSYjnOEU
	 hy+aN6RUIi8f/cizWWDqhXwZE6RHCnqhDZAAKtSipmvyBNuQGr32POAruwYn5QNBG9
	 KOrEosZ8CloCH14BeWMh/5nn+5wfstUhjF5jGZik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93AAFF802FD;
	Thu, 11 Jun 2020 14:42:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C490EF802DC; Thu, 11 Jun 2020 14:42:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CEC5F802A2
 for <alsa-devel@alsa-project.org>; Thu, 11 Jun 2020 14:42:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CEC5F802A2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="s+lJoAWo"
Received: by mail-wm1-x344.google.com with SMTP id l26so4842322wme.3
 for <alsa-devel@alsa-project.org>; Thu, 11 Jun 2020 05:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lNnQU7nlgCvrEQswoURWL2iF3lzneMUM2jWkpbiMSAc=;
 b=s+lJoAWoRoGJECYvMbW8eS/y8a2BEeRfBiogjqYTcMstMMl7ZBj476aHb5zduSoo24
 DhxTUxmMo+hA8OCL6ST7FXGEwcN948WQv+kRteqTdRgvasABBsCX9HF7QQqDrMATptLd
 d8ilNO/Nry4j3FAsUc63vIcwPGEi3DBOrQRczcS6WzdYa4vJEE6e1tGKRMYMtl1n92U4
 LcZ2WVSXPPVOKlH6VMVJ3G8fqL/x45GHuWv/BomoGUWkx85bCl5KZLi5X7jwd5B4VFK7
 bMuqc2z/GRX283M/5TNBML1rQSYQydNS8wDaOExtL6+0LgD6Pv0QxgVWhuERRDfltuJj
 2j7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lNnQU7nlgCvrEQswoURWL2iF3lzneMUM2jWkpbiMSAc=;
 b=Ycxje6/MEM01exvex5IzlIUFoxfVYvaKRHVU56nibynOGUvRes427oxl4nVe4iPcdW
 RTJU5wlRHs3w4gAgoXah2IJLBJVLV8wbtFfDOK7jSFnAufdPZLT3hEjPJskAdqb6SF9M
 zX3+2l95TsNInA4kFGRszkdioq8yFR1ZZxv+1bI5l6+Lm74uzIieSQwWTjdWA1eZccYS
 KbroWppmuo7atFaD1Dc6Ybw9/ObklmfK+UyIKOZSQ4SdUlkNYZXsm+RiBfEMEqPG5rZE
 fXFSNpugKeBkfhK9DaVFzp86Ip7lw6fseiKg4/33/6W7kE5C1E+cP6WnpANKQW+uv5vL
 eU0A==
X-Gm-Message-State: AOAM5335QBKO+dmFZq/yMOyLR5gSXCidW3jDDvq33HN+n4sy+TksCtnf
 8gTFIZNwvkP1f4+HX6snzDylhQ==
X-Google-Smtp-Source: ABdhPJz7eRsLXz/F+4yfNMex4BXcCn7ORtYkMIb8eBgCBk6GnfDF2bQvZjqBX4S5IMwWJr37i6aSMg==
X-Received: by 2002:a1c:b386:: with SMTP id c128mr8469524wmf.133.1591879331058; 
 Thu, 11 Jun 2020 05:42:11 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id q13sm4810355wrn.84.2020.06.11.05.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 05:42:10 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 7/8] ASoC: q6asm-dai: check available buffer size before
 sending
Date: Thu, 11 Jun 2020 13:41:58 +0100
Message-Id: <20200611124159.20742-8-srinivas.kandagatla@linaro.org>
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

This patch add simple check before sending data buffer to dsp which will
ensure that we are not sending any buffers which are not already available.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 892411f81613..7aba3c07810b 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -534,13 +534,12 @@ static void compress_event_handler(uint32_t opcode, uint32_t token,
 		prtd->copied_total += bytes_written;
 		snd_compr_fragment_elapsed(substream);
 
-		if (prtd->state != Q6ASM_STREAM_RUNNING) {
+		avail = prtd->bytes_received - prtd->bytes_sent;
+		if (prtd->state != Q6ASM_STREAM_RUNNING || avail <= 0) {
 			spin_unlock_irqrestore(&prtd->lock, flags);
 			break;
 		}
 
-		avail = prtd->bytes_received - prtd->bytes_sent;
-
 		if (avail >= prtd->pcm_count) {
 			q6asm_write_async(prtd->audio_client, prtd->stream_id,
 					   prtd->pcm_count, 0, 0, 0);
-- 
2.21.0

