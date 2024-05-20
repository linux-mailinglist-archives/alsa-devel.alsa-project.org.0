Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6D78C9EB2
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 16:22:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3428208;
	Mon, 20 May 2024 16:22:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3428208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716214953;
	bh=KcXmjnJ0AY0poUqIW4e8b27TbRb3h9g0TWVdcoOZzQc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Xr9pHFCTuE7QZcRtz3xzdt6BSVdsjcUY6jkXsQor9BM6yvVIkHoONeOkzlaJaJns6
	 6FBImTa53xuqzSk3P63XcNzUv95Pjaecg88VGogqZZaQPe401Dx4i+oAT1PSNCqVTK
	 7DYxa8ybGmfQ3QhaOW/gIqfiSknsgZuifniiEGR8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37D86F805D7; Mon, 20 May 2024 16:21:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DE91F805BF;
	Mon, 20 May 2024 16:21:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9AC97F804B2; Mon, 20 May 2024 16:20:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 819FFF8016B
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 16:20:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 819FFF8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=h+8oPCAy
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4200ee78f35so15426635e9.1
        for <alsa-devel@alsa-project.org>;
 Mon, 20 May 2024 07:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716214811; x=1716819611;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xHRQQE65RAI65GXyR0YkZ7EC6+UVgVpJwZAhrM/DH1g=;
        b=h+8oPCAyskU6dF9m59y40LY5z6hbhXa4L0sfZ1TPEYaUCMymKJHfQshgelnmMr5vMn
         x0YzNmNzqKQ7Oor3gcxhkYGvkymfFuZ6w92XSALWB0l2BsF8+m0VOGb0t9jdYxWYUVOa
         oEHicFW4zB6M199QWsv5vblRt40HL2SgVjRAkyUPDkaaoAHpwZ8aVFngS6AiA+RmY7v1
         YKe5o4SfB4sPl7bPEA+mACaKFb3Y1meRghV1m9L56+DewKnpJreXQKt3OArjYkVRK2lu
         9GmsWL2r10+vQYl0ruHOH6fRjcZ3x7DAq0tW8Puc5+iSOJiXdFFFZu5YYy8PoD2KMfoa
         7Lzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716214811; x=1716819611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xHRQQE65RAI65GXyR0YkZ7EC6+UVgVpJwZAhrM/DH1g=;
        b=YB7WeTjpNPfqLPjj4iONxXV/MPJk6knY6lfUvmjEi5TqtvQPXYZve6GQzHoKksStK8
         4DQSftRKR197k+IfkjL9ZaeNh82L/sypvpxWzCY4Jn32yteWheZ1loOoK5t6ACfDBh9R
         iwb1hIl+RKgD/ZjwsC2I54w2fYlvsPKmMubnThsm4gQTI2w1w4p6K+4dRXmdlW8xnpTE
         XqzRCEXTKi+CG35XXEXNABDOzAprfvwPmIbTCaz44JUVCdc459kNGR9Ywm/yZDcHLXGq
         qrEIfIxacGbHZt8zP7mjhKWURfEl6KUbmI8aop5idDYc/47NoE/yk1wKXdSCGNBeFULs
         6R0A==
X-Gm-Message-State: AOJu0YzdkTdHcPEg+ST5it+LF3uCjsvqjCSGv535dcJwOZ9nPHHxb4D0
	bYMYUqtwGoDDsECVgb7RPa9eCpVv/PN8mxUtol0JUeuRyjJ+xaB+VzDy/+u68j0=
X-Google-Smtp-Source: 
 AGHT+IGdwFfpSiCb5k+nHbLrV2SfE/QSc4k9N6wA3+1dezFaLcQXWKVJz2Cr8xwIDD5iaWnMb+BlQQ==
X-Received: by 2002:a05:600c:41d6:b0:41a:8b39:8040 with SMTP id
 5b1f17b1804b1-41feaa43677mr303456185e9.20.1716214810883;
        Mon, 20 May 2024 07:20:10 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccee962esm421612625e9.31.2024.05.20.07.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 07:20:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 20 May 2024 16:19:57 +0200
Subject: [PATCH v4 2/4] ASoC: qcom: q6apm-lpass-dais: Implement proper
 channel mapping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240520-asoc-x1e80100-4-channel-mapping-v4-2-f657159b4aad@linaro.org>
References: 
 <20240520-asoc-x1e80100-4-channel-mapping-v4-0-f657159b4aad@linaro.org>
In-Reply-To: 
 <20240520-asoc-x1e80100-4-channel-mapping-v4-0-f657159b4aad@linaro.org>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2524;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=KcXmjnJ0AY0poUqIW4e8b27TbRb3h9g0TWVdcoOZzQc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmS1wT1xFhZckPx+G4fVsbfms73t1WEZI+lxA2g
 2s4CcjTjF+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZktcEwAKCRDBN2bmhouD
 17sjEACYXZI6kpL+uEMc+XDJnuwm5R3L7XoKQW/5PuLWOHqNvbY429ietCvF66+DiASSwd5QFh+
 TihhfNJCgkmsQGork59va9S5uv7MaGANL2mxK5sbYXu0z5WZQMZTyWHNs2IrayK1IkqhRAAuHDQ
 SX0uud1vJugwESiBNoHIK9QoVzmBZszNHOZYARYeQOZ/i2hNamF2kGh90vrSRsoC5H2PKJUlCaV
 MUr4/uZu9SXxg3gh9zcW6TMP0lBRzLzZILjf/dz7jTYhQ4o+abNOzoBiLbOnhJ2gDrJonXQdV9l
 D6v4WGu4z2EyjC/vzbJJSt45O6mOUstD2Kfl6GPQo2i+vXC0DdVYiM2JnPb5oqvuKxv84zGaR+b
 dXLNqaZZkDMqaD+nCEkB481NFqMJ9RI+PpvA+UBiIZjglDy8R9cE0gI4eoLTvizjfxcq/Ov1ZBX
 AxmgcgVrmMRhNk5aXy9DcnEKJLFuuHpIyeImO/kDbTrfSVLCpb3nkYcFWODAzxQxddNBpZfV7py
 8xEwDQp/OA12QSlYcMZL08Hhr5av386oCGS4Hk7xStUhgiZTYdA4T1IzAxWaUxf9XGSDPhbR3E6
 stiIIG5jtYb9R5AYnlAMmA+I0yCSkRquiIq4lXt5UpG4WZyAi/0kIYVCk+a9tIC5L4mF7XjUMFa
 h8DT/vVC7GVF8kA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: 225O2ZW7VF7XNU3X5NG64N7THKGNRFJJ
X-Message-ID-Hash: 225O2ZW7VF7XNU3X5NG64N7THKGNRFJJ
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/225O2ZW7VF7XNU3X5NG64N7THKGNRFJJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The set_channel_map() implementation in q6apm-lpass-dais driver was
copying older pre-Audioreach code from q6afe-dai driver, but not really
using it.  The code sets active channel mask based on passed channel
mapping, but Audioreach code does not use that mask ever.  Audioreach
module configuration does have on the other hand proper channel mapping
field, which should supersed that active channel mask.

Drop the unused active channel mask and implement proper mapping of
channels in q6apm-lpass-dais driver.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3/v4:
1. None

Changes in v2:
1. Entirely replaced - now channel mapping is implemented in
   q6apm-lpass-dais.
---
 sound/soc/qcom/qdsp6/audioreach.h       |  1 -
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 10 +++++-----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 2c82917b7162..eb9306280988 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -755,7 +755,6 @@ struct audioreach_module_config {
 
 	u16	data_format;
 	u16	num_channels;
-	u16	active_channels_mask;
 	u16	dp_idx;
 	u32	channel_allocation;
 	u32	sd_line_mask;
diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 6bfbb52345e1..a4ad1d0e6abd 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -33,7 +33,7 @@ static int q6dma_set_channel_map(struct snd_soc_dai *dai,
 
 	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
 	struct audioreach_module_config *cfg = &dai_data->module_config[dai->id];
-	int ch_mask;
+	int i;
 
 	switch (dai->id) {
 	case WSA_CODEC_DMA_TX_0:
@@ -58,7 +58,8 @@ static int q6dma_set_channel_map(struct snd_soc_dai *dai,
 				tx_num);
 			return -EINVAL;
 		}
-		ch_mask = *tx_ch_mask;
+		for (i = 0; i < tx_num; i++)
+			cfg->channel_map[i] = tx_ch_mask[i];
 
 		break;
 	case WSA_CODEC_DMA_RX_0:
@@ -81,7 +82,8 @@ static int q6dma_set_channel_map(struct snd_soc_dai *dai,
 				rx_num);
 			return -EINVAL;
 		}
-		ch_mask = *rx_ch_mask;
+		for (i = 0; i < rx_num; i++)
+			cfg->channel_map[i] = rx_ch_mask[i];
 
 		break;
 	default:
@@ -90,8 +92,6 @@ static int q6dma_set_channel_map(struct snd_soc_dai *dai,
 		return -EINVAL;
 	}
 
-	cfg->active_channels_mask = ch_mask;
-
 	return 0;
 }
 

-- 
2.43.0

