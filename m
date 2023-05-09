Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC02B6FC4EE
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 13:25:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00CD51107;
	Tue,  9 May 2023 13:24:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00CD51107
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683631495;
	bh=6qGv9Lp4VCZSB2E4jMJFss2BiVBOpnJRbZ9tqnyrALE=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SeOfxVdMt7Mdg35rD12NJ/xS73wV7QyjDTI35isNpRBTPbPxDuq5mEKJ17hAw9ww+
	 DlRBX6LH74vikTmwyVwwbK9swszncH5w+JTWxRfCm2X9yCe3hijZF29PWLW+HaBu6a
	 3Cu7DJowAb/bzDnO+pkjuLpYfe2JEN0QknVHXhEg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CE58F80310;
	Tue,  9 May 2023 13:24:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4589FF8052E; Tue,  9 May 2023 13:24:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 116C0F804B1
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 13:22:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 116C0F804B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=luRFiM+l
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f4271185daso18742405e9.2
        for <alsa-devel@alsa-project.org>;
 Tue, 09 May 2023 04:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683631330; x=1686223330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AcBWMqISV9A++p9N6hrGlnxpBrh/70LXAdj4PNnNPmc=;
        b=luRFiM+lwLaYpfKqQCsA8MqB1Xo7dII/IIjf7hfda8lgOOUgvIXxM33MgaNQ/w9hXp
         jmfRRJ44qEo+8wuDrHHF3c3R5/H1Ki/0JuoT4qcuBOtGJNi6ckdtE85LonTGBHlN3g6L
         H4ybapZugifO3/DicO3cPhAZau7qIpVu2WV2jCQ2D/Yel8rJCcd18o11y6zrJTk80N/9
         hlrCrTBo6l6S7L6uTxcxm3L23hfYFBOtyKy/7FPkMfiXL+Do7vYrGyhrTo23DMzFG4aw
         bH/z/vMhd/Fyd7xPioO6lAySztugfms415eQ3liDbhOrATrqUXpQriIfGQi2lm+XvlmG
         V5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683631330; x=1686223330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AcBWMqISV9A++p9N6hrGlnxpBrh/70LXAdj4PNnNPmc=;
        b=B7Yy+I8QlI+dLbeehDtKH62CUsgwcmcuPU8+5ulPyCOw0iEutBItbmUfXfwTkW8Q41
         /QDE3xZYQmNbZuUJnvwLaK0CKGF/AABrSGFIdK4s+os0bjNI6lJtknJpCO6rGR/9s9l4
         qqoYHc/H7GSzygDleN4FMXfNQaJXhf5yr/2GyCxokqjeenufgbi5UezdYIObhj3NGKzK
         +BL5nkFERZF/J2eTC3+vD0gLr44V/AJB7Oee6lmXuPFXHjgcNQb98Fodt0x+DcOSDrL3
         oEXFRjTme2Bi16erIWJf5FMfippaIT0j2Id3Lmp9XIeRheN5TFQnTx3rpPCKwdOwkihx
         S9kg==
X-Gm-Message-State: AC+VfDxyyQHVANtc3tJbmjoS61dQG0KEtwlX7ZAfB6GB8jKOWOPqYwzc
	cKjmfJq1zbfYL29RO2Fo5mjXaw==
X-Google-Smtp-Source: 
 ACHHUZ5L3YbTRGyJAJmeYwfPqVXKmMnuTCBjfdZ9dKyfAaB7LLt09gFRzDI2AHX1NfxyYzVXledfEQ==
X-Received: by 2002:a1c:cc11:0:b0:3f4:86:33b with SMTP id
 h17-20020a1ccc11000000b003f40086033bmr9020222wmb.26.1683631330578;
        Tue, 09 May 2023 04:22:10 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 n2-20020a05600c294200b003f17eded97bsm19531072wmd.19.2023.05.09.04.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 04:22:09 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 4/4] ASoC: qcom: q6apm: add support to display ports in lpass
 dais
Date: Tue,  9 May 2023 12:22:02 +0100
Message-Id: <20230509112202.21471-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230509112202.21471-1-srinivas.kandagatla@linaro.org>
References: <20230509112202.21471-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Q4B2MGFWJJNUOYQTQWD2UUVF4BALIQHW
X-Message-ID-Hash: Q4B2MGFWJJNUOYQTQWD2UUVF4BALIQHW
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, lgirdwood@gmail.com, ckeepax@opensource.cirrus.com,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q4B2MGFWJJNUOYQTQWD2UUVF4BALIQHW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch adds support to q6apm lpass display port dais. This support
is required to get DP audio on x13s.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 39 +++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 420e8aa11f42..7ad604b80e25 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -11,6 +11,7 @@
 #include <sound/soc.h>
 #include <sound/pcm_params.h>
 #include "q6dsp-lpass-ports.h"
+#include "q6dsp-common.h"
 #include "audioreach.h"
 #include "q6apm.h"
 
@@ -91,6 +92,36 @@ static int q6dma_set_channel_map(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static int q6hdmi_hw_params(struct snd_pcm_substream *substream,
+			    struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
+{
+	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
+	struct audioreach_module_config *cfg = &dai_data->module_config[dai->id];
+	int channels = params_channels(params);
+	int ret;
+
+	cfg->bit_width = params_width(params);
+	cfg->sample_rate = params_rate(params);
+	cfg->num_channels = channels;
+
+	switch (dai->id) {
+	case DISPLAY_PORT_RX_0:
+		cfg->dp_idx = 0;
+		break;
+	case DISPLAY_PORT_RX_1 ... DISPLAY_PORT_RX_7:
+		cfg->dp_idx = dai->id - DISPLAY_PORT_RX_1 + 1;
+		break;
+	}
+
+	ret = q6dsp_get_channel_allocation(channels);
+	if (ret < 0)
+		return ret;
+
+	cfg->channel_allocation = ret;
+
+	return 0;
+}
+
 static int q6dma_hw_params(struct snd_pcm_substream *substream,
 			   struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
 {
@@ -215,6 +246,13 @@ static const struct snd_soc_dai_ops q6i2s_ops = {
 	.shutdown	= q6apm_lpass_dai_shutdown,
 	.set_channel_map  = q6dma_set_channel_map,
 	.hw_params        = q6dma_hw_params,
+};
+
+static const struct snd_soc_dai_ops q6hdmi_ops = {
+	.prepare	= q6apm_lpass_dai_prepare,
+	.startup	= q6apm_lpass_dai_startup,
+	.shutdown	= q6apm_lpass_dai_shutdown,
+	.hw_params	= q6hdmi_hw_params,
 	.set_fmt	= q6i2s_set_fmt,
 };
 
@@ -242,6 +280,7 @@ static int q6apm_lpass_dai_dev_probe(struct platform_device *pdev)
 	memset(&cfg, 0, sizeof(cfg));
 	cfg.q6i2s_ops = &q6i2s_ops;
 	cfg.q6dma_ops = &q6dma_ops;
+	cfg.q6hdmi_ops = &q6hdmi_ops;
 	dais = q6dsp_audio_ports_set_config(dev, &cfg, &num_dais);
 
 	return devm_snd_soc_register_component(dev, &q6apm_lpass_dai_component, dais, num_dais);
-- 
2.21.0

