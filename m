Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 430E249C8D1
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jan 2022 12:38:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C32621EFF;
	Wed, 26 Jan 2022 12:37:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C32621EFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643197110;
	bh=EQkaQaUkc+wyREHktGItkocSaoVeoMfuOb+QxQENXl0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HkpGOKQY5cFdlST5WbeJCCQBT/9w8eURGHbIXjuKEdtAWxj9ZagDrEXYUm4WqIlrO
	 QcyRHWdMXGgvZ6/aPgQj7ATPe6n9eJkEGkLXVMBZqBxRIPBriyQW+s+OUc7J/msevU
	 9NCGIZtbA5UJu9eSyPlFzkqjGsy7ovKmL2G/gPm0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFD70F8051A;
	Wed, 26 Jan 2022 12:36:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B49DF80511; Wed, 26 Jan 2022 12:36:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2DA8F804C1
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 12:36:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2DA8F804C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="bOPFKWeS"
Received: by mail-wr1-x436.google.com with SMTP id w11so13062876wra.4
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 03:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bXVjE+WHy8056yU6PQ186TKgk9YFsJSf/z9MoSICAgo=;
 b=bOPFKWeSDz/5+SWrCSqxTxArgqoAVTVn9JPw/LwQVWw/KF8qXvJXOqSe+p0LykVAMl
 FVHAvDWl4uq+Twi3eh6lCLiaMXN2PjAqVCezLLxc2VTlKJL4V9FMusPREkrzc18XNK60
 P2GhDxWYXChfe2PmIXOrCdKEjLmpQi7RantbrgMCzXL7uphq0emDusi5DtgizxaxvnBn
 q8nIoIuTRT21j9n3EZpMW9+5fyqF+9pxctLuV2LVwTZVkByAvGfM639trJdAOOvWMbpo
 E/bS5WOiEOIE0kXb/hi4CE/hRZcYL78/7AvmLPJk91Rr2hxlGTm7pG93zIoUcJpbLfhJ
 7Ugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bXVjE+WHy8056yU6PQ186TKgk9YFsJSf/z9MoSICAgo=;
 b=U8ooaywNbkhWOox9GzDscb3JAQi9Vas2i9wY3aq4JFFAbGQknydxwi1WXwEypoOVP3
 qmDNTkW7ZJNvFjNZ4cY8xwjSs8T+gGrHdrnD8d/OJ5doxYWf15Vj3Ulpp4XEwVaM2aLX
 /PERh8Z6ispXuF7ecf0DyvZtlI6+PPssDY2fbVdWVM3Z96R32wp+7G0f8oLVOWdR7Zf1
 D1y2G6LStD2/IJhrtQqcWtaOsItrylEGhzzVh6tgpiuCOQq2o73be3hXtS1wPLI7NLRj
 406B04yGG5edJEs0Vk7mnsv4XfNERc4auGqrZ6b48YGjzAdWqgdjqvtLjuS3ANTVPHiQ
 qpXA==
X-Gm-Message-State: AOAM532mR4g9m9pBRPpNLMHBHo54c3lHQ98J13FHIaN9BMIIfJIbs6R3
 pigFUyOdYxpI+6HK/VRoOLUjkhGpLLzmCA==
X-Google-Smtp-Source: ABdhPJzXvbDq09qiBfc5o13vwHQzmqhkxGwNvWS1trLsF9xfkIUo9E3GK79OPSvS6pT/ByTWosOOxA==
X-Received: by 2002:adf:e48c:: with SMTP id i12mr21498933wrm.43.1643196960863; 
 Wed, 26 Jan 2022 03:36:00 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id n14sm11999188wri.75.2022.01.26.03.35.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 03:36:00 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 2/4] ASoC: codecs: lpass-rx-macro: fix sidetone register
 offsets
Date: Wed, 26 Jan 2022 11:35:47 +0000
Message-Id: <20220126113549.8853-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220126113549.8853-1-srinivas.kandagatla@linaro.org>
References: <20220126113549.8853-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 quic_srivasam@quicinc.com
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

For some reason we ended up with incorrect register offfset calcuations
for sidetone. regmap clearly throw errors when accessing these incorrect
registers as these do not belong to any read/write ranges.
so fix them to point to correct register offsets.

Fixes: f3ce6f3c9a99 ("ASoC: codecs: lpass-rx-macro: add iir widgets")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index aec5127260fd..6ffe88345de5 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -2688,8 +2688,8 @@ static uint32_t get_iir_band_coeff(struct snd_soc_component *component,
 	int reg, b2_reg;
 
 	/* Address does not automatically update if reading */
-	reg = CDC_RX_SIDETONE_IIR0_IIR_COEF_B1_CTL + 16 * iir_idx;
-	b2_reg = CDC_RX_SIDETONE_IIR0_IIR_COEF_B2_CTL + 16 * iir_idx;
+	reg = CDC_RX_SIDETONE_IIR0_IIR_COEF_B1_CTL + 0x80 * iir_idx;
+	b2_reg = CDC_RX_SIDETONE_IIR0_IIR_COEF_B2_CTL + 0x80 * iir_idx;
 
 	snd_soc_component_write(component, reg,
 				((band_idx * BAND_MAX + coeff_idx) *
@@ -2718,7 +2718,7 @@ static uint32_t get_iir_band_coeff(struct snd_soc_component *component,
 static void set_iir_band_coeff(struct snd_soc_component *component,
 			       int iir_idx, int band_idx, uint32_t value)
 {
-	int reg = CDC_RX_SIDETONE_IIR0_IIR_COEF_B2_CTL + 16 * iir_idx;
+	int reg = CDC_RX_SIDETONE_IIR0_IIR_COEF_B2_CTL + 0x80 * iir_idx;
 
 	snd_soc_component_write(component, reg, (value & 0xFF));
 	snd_soc_component_write(component, reg, (value >> 8) & 0xFF);
@@ -2739,7 +2739,7 @@ static int rx_macro_put_iir_band_audio_mixer(
 	int iir_idx = ctl->iir_idx;
 	int band_idx = ctl->band_idx;
 	u32 coeff[BAND_MAX];
-	int reg = CDC_RX_SIDETONE_IIR0_IIR_COEF_B1_CTL + 16 * iir_idx;
+	int reg = CDC_RX_SIDETONE_IIR0_IIR_COEF_B1_CTL + 0x80 * iir_idx;
 
 	memcpy(&coeff[0], ucontrol->value.bytes.data, params->max);
 
-- 
2.21.0

