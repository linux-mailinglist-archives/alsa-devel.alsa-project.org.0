Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BE9424437
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 19:30:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09B64844;
	Wed,  6 Oct 2021 19:29:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09B64844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633541400;
	bh=k6ZefLAqe6elsiIcRWLDUYO5JsQKadLXcXjPIWFp4fU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RI67hEXexj9vnLpCuVNgJ6JB54s3k7qGEKlNbxYx57UPCpKtPYIHaVWi5h6GpDRzJ
	 /PrZPPz6QX3x+RVtTlWKrGbiVqvGm5ugcGidPjaTlyQhKsqoN6FAWt5neyTOas+pr/
	 PXEh9Zf6PT+4vKB0irTYsBvExc2zh5v7el+fLQgk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C2FDF804E5;
	Wed,  6 Oct 2021 19:28:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52EF3F8032D; Wed,  6 Oct 2021 19:28:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE9DEF8010B
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 19:27:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE9DEF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="rLDSEqXL"
Received: by mail-wr1-x42f.google.com with SMTP id r10so11051488wra.12
 for <alsa-devel@alsa-project.org>; Wed, 06 Oct 2021 10:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r6o4t/p25htQCYFB1Syo8cpncY8cABgVWrSIMRp8knM=;
 b=rLDSEqXLQ/exB8A0794u3lxqVMMOxQ++/mq3JFQMDqILkcyQaWR0d3GIdRMMGEiUKD
 DZATWo25TyesFa0I9IdJKp7Gva2D5cnLl2AL61TDKDsqsBFGH45B8LF9sOJbTWSogbcv
 la9qgGDLyDj/vfno38GvV3nT/SKbT1sFWYXHVJ8Cz4SMo9enYGI2MbRfKYROoevWf8ik
 R//9VIIOnrwqPU6MCOAZBScA/zfDNqXQsAWSjy5fKcBku1vQjhCj72sxDzigli9m7nTt
 /QwCoS1VpIY6ggqRV8m8kpe4pEi0rqfC8uVnypVR6Wt47TgUhyAbCRpkK+GfmtzDWU3q
 eXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r6o4t/p25htQCYFB1Syo8cpncY8cABgVWrSIMRp8knM=;
 b=gJZUgG8EZz5Z+VIxvkuW8Pd7/AuHql3BjMWgnynccifqcLZ0Qa5vUnoCriNDumKN5b
 RMAhxcWSs/l2ARLkXx4MfTaa0Bu2CoGniLpGiQHfYCuhirsY24idq092OwWERrXxJB0m
 jd9TI5zqKD8FYvpBXk50HEiApiEEYm8Ig48qQCEyVXTjxzsbax8+wRH6KOCDkTsxYdiQ
 s/2E1ncZGOcb6Oc9Myd/WUti2PbCxDx/ZjsAN+7JOUgd4KD8aE6shdaLJZlRgF2t4vXF
 GBrUvL0JqTXS6jO1d/p9t5tGZmh53CvBT9UVXx0LQBQ2v9dMx0SIZP37koh0oeRyLIP9
 LVjQ==
X-Gm-Message-State: AOAM53277AuKelABhMs9jCpiHJwoIrnECiI47pknuaCmAwIwv5BAD7Rk
 eGlBxKRK0Hm1Lrn+Iclm51jx5A==
X-Google-Smtp-Source: ABdhPJyUm3GpAki+cFgjiZS4oOPc8zCMGmVbxBxCnrtlqt0RItsLkdcyf7YxCVNc2To1snfDbkHBLQ==
X-Received: by 2002:adf:c048:: with SMTP id c8mr20797253wrf.96.1633541274232; 
 Wed, 06 Oct 2021 10:27:54 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id q204sm3976475wme.10.2021.10.06.10.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 10:27:53 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 1/2] ASoC: qcom: sm8250: add support for TX and RX Macro dais
Date: Wed,  6 Oct 2021 18:27:44 +0100
Message-Id: <20211006172745.22103-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20211006172745.22103-1-srinivas.kandagatla@linaro.org>
References: <20211006172745.22103-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org, tiwai@suse.de,
 plai@codeaurora.org, lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com
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

On SM8250 MTP boards WCD938x codec is connected via TX and RX Macros,
so add support for this dais in the soundcard driver.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/sm8250.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index fe8fd7367e21..9f2f0598a222 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -69,6 +69,12 @@ static int sm8250_snd_hw_params(struct snd_pcm_substream *substream,
 
 	switch (cpu_dai->id) {
 	case WSA_CODEC_DMA_RX_0:
+	case RX_CODEC_DMA_RX_0:
+	case RX_CODEC_DMA_RX_1:
+	case TX_CODEC_DMA_TX_0:
+	case TX_CODEC_DMA_TX_1:
+	case TX_CODEC_DMA_TX_2:
+	case TX_CODEC_DMA_TX_3:
 		for_each_rtd_codec_dais(rtd, i, codec_dai) {
 			sruntime = snd_soc_dai_get_sdw_stream(codec_dai,
 						      substream->stream);
@@ -129,6 +135,12 @@ static int sm8250_snd_prepare(struct snd_pcm_substream *substream)
 	switch (cpu_dai->id) {
 	case WSA_CODEC_DMA_RX_0:
 	case WSA_CODEC_DMA_RX_1:
+	case RX_CODEC_DMA_RX_0:
+	case RX_CODEC_DMA_RX_1:
+	case TX_CODEC_DMA_TX_0:
+	case TX_CODEC_DMA_TX_1:
+	case TX_CODEC_DMA_TX_2:
+	case TX_CODEC_DMA_TX_3:
 		return sm8250_snd_wsa_dma_prepare(substream);
 	default:
 		break;
@@ -147,6 +159,12 @@ static int sm8250_snd_hw_free(struct snd_pcm_substream *substream)
 	switch (cpu_dai->id) {
 	case WSA_CODEC_DMA_RX_0:
 	case WSA_CODEC_DMA_RX_1:
+	case RX_CODEC_DMA_RX_0:
+	case RX_CODEC_DMA_RX_1:
+	case TX_CODEC_DMA_TX_0:
+	case TX_CODEC_DMA_TX_1:
+	case TX_CODEC_DMA_TX_2:
+	case TX_CODEC_DMA_TX_3:
 		if (sruntime && data->stream_prepared[cpu_dai->id]) {
 			sdw_disable_stream(sruntime);
 			sdw_deprepare_stream(sruntime);
-- 
2.21.0

