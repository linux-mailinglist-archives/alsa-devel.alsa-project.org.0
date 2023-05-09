Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6FD6FC4E9
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 13:24:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94E6E1103;
	Tue,  9 May 2023 13:23:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94E6E1103
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683631440;
	bh=7RO5O5JeSRq5etiMcvAqiaK/2UCVuj2GV8Zbn0M+Mek=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZGZjkakLeunAQ75o4J82MFRxqwlZvZ5ME73h3fxhONKXcDEc8+wJplMJ65wbZ5a6F
	 jBAMDgT7yE4dWIZJTdGZttEMUlQP+Wu9Gqn3Wf5FiiYk0BI0T9ybYm3ol15BH6K2mb
	 CzyhR1i6FYuLyBUfI5jVRpd2Poy8rj/9u8COakcw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 989B7F8053D;
	Tue,  9 May 2023 13:22:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE16DF80534; Tue,  9 May 2023 13:22:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E02EAF80087
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 13:22:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E02EAF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=RnLe0zbI
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f42769a076so12516205e9.0
        for <alsa-devel@alsa-project.org>;
 Tue, 09 May 2023 04:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683631326; x=1686223326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxG+ycENWJH3AlwoPjs8awS/KwMKrnL6bZtNa57b8KY=;
        b=RnLe0zbIGps1V1jqaoiYWNSEutPblCXI6xt+JevNLqKdg46N/cSBKyRY81niOtLVwQ
         dMZLTW/FanJ4fgm1OtsJ/RBLwt7iAzt4TZ2OnarSk2ubz3x0Ap9jQXvRVXyhR5X7ffuF
         EQKAbJ8ysIDmBCWYx/gOFDY3MplVFPi7gyBTZI59f47ciGcPdFtPmp1iRqkNfReUI8DR
         qpHSlXQRZVVvP8wbzyIFn4HTv3afpeupYViEoVx3LlDdunIIRgSlKHq7uSMBmh/RxbNr
         8Z7DGkJu1rCB6nMUM9DDRLQ29k/nW4kaFXtI7UcakjlHqw5SCL4nV8yxCjjTXYw+naqm
         KpAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683631326; x=1686223326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GxG+ycENWJH3AlwoPjs8awS/KwMKrnL6bZtNa57b8KY=;
        b=iCO+N8OkzRFF+qo8fowh+r8KyRg5MvzlJFlQKsjsggM3wi2xGgPCjWxvDC5xmYGkmq
         K2GdLlQt1fYptRo/RlrU7crqNZBYzYL0+lylcCX7hHmjNNr5ggRIbihdAq3X5QbmddTG
         fWDeeMFJyt27z9/qIt49taxHY9YN/ZRWq8ESbCuXvfjxFfKJP4Lc0BgoIeFsHHNTBcLG
         J9KUslj501dlHGYv/MTB/wMlVMyvNBBWX7K5wXooT1QHxx4HrBOhyOaFplUDj3Clk15r
         0FnQjvOxuBsgDS/Qtfpz3+3AOVdfBxd3/S9rpNM/+iQnxGHhREAbJCjSwxOiEdYNnFzx
         af4A==
X-Gm-Message-State: AC+VfDz8mDblNES0YHG4YBU/xHkjBS9ezpgjcCnwhyBuKoLc9f/5GkYN
	q2PsiHkHAY9D3l0FWv11GmPkXOe23a1GDks3oO4=
X-Google-Smtp-Source: 
 ACHHUZ6nE3QoxybXlRdqHxeEbWupLkFlBrYyQt4L/qnNVyUdhTSbl+MZB6GRpkvjC0hZpadUh1kRHg==
X-Received: by 2002:a7b:cc15:0:b0:3f4:16bc:bd1d with SMTP id
 f21-20020a7bcc15000000b003f416bcbd1dmr7335018wmh.6.1683631326709;
        Tue, 09 May 2023 04:22:06 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 n2-20020a05600c294200b003f17eded97bsm19531072wmd.19.2023.05.09.04.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 04:22:06 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 1/4] ASoC: qcom: q6dsp-common: move channel allocation to
 common
Date: Tue,  9 May 2023 12:21:59 +0100
Message-Id: <20230509112202.21471-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230509112202.21471-1-srinivas.kandagatla@linaro.org>
References: <20230509112202.21471-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Z4QXDPIE5JC3FGGRCIH4JX2V5ZALQ7MO
X-Message-ID-Hash: Z4QXDPIE5JC3FGGRCIH4JX2V5ZALQ7MO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z4QXDPIE5JC3FGGRCIH4JX2V5ZALQ7MO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

move hdmi/dp channel allocation to a common function
q6dsp_get_channel_allocation() so that we can reuse this across
q6afe and q6apm drivers.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6afe-dai.c    | 34 ++++++----------------------
 sound/soc/qcom/qdsp6/q6dsp-common.c | 35 +++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/q6dsp-common.h |  1 +
 3 files changed, 43 insertions(+), 27 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
index 8bb7452b8f18..31e0bad71e95 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -12,6 +12,7 @@
 #include <sound/soc.h>
 #include <sound/pcm_params.h>
 #include "q6dsp-lpass-ports.h"
+#include "q6dsp-common.h"
 #include "q6afe.h"
 
 
@@ -69,6 +70,7 @@ static int q6hdmi_hw_params(struct snd_pcm_substream *substream,
 	struct q6afe_dai_data *dai_data = dev_get_drvdata(dai->dev);
 	int channels = params_channels(params);
 	struct q6afe_hdmi_cfg *hdmi = &dai_data->port_config[dai->id].hdmi;
+	int ret;
 
 	hdmi->sample_rate = params_rate(params);
 	switch (params_format(params)) {
@@ -80,33 +82,11 @@ static int q6hdmi_hw_params(struct snd_pcm_substream *substream,
 		break;
 	}
 
-	/* HDMI spec CEA-861-E: Table 28 Audio InfoFrame Data Byte 4 */
-	switch (channels) {
-	case 2:
-		hdmi->channel_allocation = 0;
-		break;
-	case 3:
-		hdmi->channel_allocation = 0x02;
-		break;
-	case 4:
-		hdmi->channel_allocation = 0x06;
-		break;
-	case 5:
-		hdmi->channel_allocation = 0x0A;
-		break;
-	case 6:
-		hdmi->channel_allocation = 0x0B;
-		break;
-	case 7:
-		hdmi->channel_allocation = 0x12;
-		break;
-	case 8:
-		hdmi->channel_allocation = 0x13;
-		break;
-	default:
-		dev_err(dai->dev, "invalid Channels = %u\n", channels);
-		return -EINVAL;
-	}
+	ret = q6dsp_get_channel_allocation(channels);
+	if (ret < 0)
+		return ret;
+
+	hdmi->channel_allocation = (u16) ret;
 
 	return 0;
 }
diff --git a/sound/soc/qcom/qdsp6/q6dsp-common.c b/sound/soc/qcom/qdsp6/q6dsp-common.c
index d393003492c7..95585dea2b36 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-common.c
+++ b/sound/soc/qcom/qdsp6/q6dsp-common.c
@@ -63,4 +63,39 @@ int q6dsp_map_channels(u8 ch_map[PCM_MAX_NUM_CHANNEL], int ch)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(q6dsp_map_channels);
+
+int q6dsp_get_channel_allocation(int channels)
+{
+	int channel_allocation;
+
+	/* HDMI spec CEA-861-E: Table 28 Audio InfoFrame Data Byte 4 */
+	switch (channels) {
+	case 2:
+		channel_allocation = 0;
+		break;
+	case 3:
+		channel_allocation = 0x02;
+		break;
+	case 4:
+		channel_allocation = 0x06;
+		break;
+	case 5:
+		channel_allocation = 0x0A;
+		break;
+	case 6:
+		channel_allocation = 0x0B;
+		break;
+	case 7:
+		channel_allocation = 0x12;
+		break;
+	case 8:
+		channel_allocation = 0x13;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return channel_allocation;
+}
+EXPORT_SYMBOL_GPL(q6dsp_get_channel_allocation);
 MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/qcom/qdsp6/q6dsp-common.h b/sound/soc/qcom/qdsp6/q6dsp-common.h
index 01094d108b8a..9e704db5f604 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-common.h
+++ b/sound/soc/qcom/qdsp6/q6dsp-common.h
@@ -20,5 +20,6 @@
 #define PCM_CHANNELS   10	/* Top surround channel. */
 
 int q6dsp_map_channels(u8 ch_map[PCM_MAX_NUM_CHANNEL], int ch);
+int q6dsp_get_channel_allocation(int channels);
 
 #endif /* __Q6DSP_COMMON_H__ */
-- 
2.21.0

