Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 088318BDFC7
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2024 12:31:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 872EF7F8;
	Tue,  7 May 2024 12:31:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 872EF7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715077888;
	bh=ncE3FH0TY58sFGa9Rl6y2ExmL1TBCQDazEEcf1SbmOY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CaLWjJlNDFAnAkLtIH4i5MPM0kOEOFYSWXGyI8f3jvvYZTTbaYNEYelpQKFGpvZRN
	 66CH7Zip2TjSsLl5qU94lM0cm7rJDx/qjIx48Yy6DcMl/PNVt6eC4/PrRe7Zix/A/8
	 NBg9sBQZTIFi+cDurNcVc1dWMiA6hOfNbjekaSYQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16014F8057C; Tue,  7 May 2024 12:30:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 081E8F805B2;
	Tue,  7 May 2024 12:30:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20CD2F805AF; Tue,  7 May 2024 12:28:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8F457F80152
	for <alsa-devel@alsa-project.org>; Tue,  7 May 2024 12:27:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F457F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=TGNX/aUj
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a59ce1e8609so309691466b.0
        for <alsa-devel@alsa-project.org>;
 Tue, 07 May 2024 03:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715077669; x=1715682469;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4nKzFo7oe//9kG74WVhks4ZLuw4EcTS+WpLRtZjt0GY=;
        b=TGNX/aUjQyrO9GLAQrNe0sKPHL3ZniIg39E4O7TcHzMe0rlDkbN1WJEFquhGL7DnAm
         befwgq8K63emd9m+RCwjLUI9AAQFTD8/8j0VdrGoAzukIVO02Q/fqImng4LJjZh5Saou
         irW4xDCmtCqQsqJvlW0/rfDhUaopwyVhEcm8k1riiNnTkZMP4H0gg7OrxSE6twfue2Wh
         BgBGQ6M4nv5lBcAZj6gyrzIdculWAR2jMjXPg6Uuf0KMW761JG6Y2JSAaYfrUhvYds4S
         kcO2RPbhdG6lzhrLnnSnt0Kyv8gOnTl1etbRuI+cYv1tfmr1BmeBqWOY0Jj/z0IQaZBr
         NoVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715077669; x=1715682469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4nKzFo7oe//9kG74WVhks4ZLuw4EcTS+WpLRtZjt0GY=;
        b=rtaqOIJ3ECjP9j2aFDi2V4T1YKcmr1PiJda/qGe8qAjKQIm/9OAbydxLq+nncCrxk5
         ZH8wkvDj3TQv0nVWDxWpvX+v2m9vyKJTDfQVrHTdeC5o/UvxL2m3zpHkScrsUfThoiyt
         Z8K4AKpB6j3BeLI0gQ6mJc8AE83d0JNaKnm4ArUSvyxnEp8R6D+Muf7cu/IwI3ETDZP1
         YgloO+sQEfW+1Wa+4IihEFKzsrI1kQ0071CtvoqTpanI4yGf61QM/UwAVcyItEHZhnxK
         4yN0IKrUs8fwfjLO5zeQHSNVw3g71tjeJtv+kyE4kD5fgG72Cf8HbNb62rjfstlznQtl
         y7Qw==
X-Gm-Message-State: AOJu0Ywt3K/+Ss9m2L9ZNphsmeC3ectvDhiS6k0VgN7nOG3px9/83tsp
	xqwog2E9AQbbw485W8O/DWfq5luscVAu6y4Suj/iV/gNgK2ij9ooHpgLv2y3ReI=
X-Google-Smtp-Source: 
 AGHT+IHxr+kpeiafMqoxHfKgf5yt6IB9ScYZU6jaD6rdvbS50GCRRhzNcEFrQXFWvrvB3EXyV7WKoA==
X-Received: by 2002:a17:906:71c9:b0:a55:aded:200d with SMTP id
 i9-20020a17090671c900b00a55aded200dmr1705986ejk.12.1715077668923;
        Tue, 07 May 2024 03:27:48 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id
 bo15-20020a170906d04f00b00a59b87dd0bbsm3370093ejb.161.2024.05.07.03.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 03:27:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 07 May 2024 12:27:33 +0200
Subject: [PATCH 4/4] ASoC: qcom: x1e80100: Correct channel mapping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240507-asoc-x1e80100-4-channel-mapping-v1-4-b12c13e0a55d@linaro.org>
References: 
 <20240507-asoc-x1e80100-4-channel-mapping-v1-0-b12c13e0a55d@linaro.org>
In-Reply-To: 
 <20240507-asoc-x1e80100-4-channel-mapping-v1-0-b12c13e0a55d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3113;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ncE3FH0TY58sFGa9Rl6y2ExmL1TBCQDazEEcf1SbmOY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmOgIcJ8C4pKpQ2s1uPew1mzWN5b8egwDGkdXHd
 q6kDAPoZn6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjoCHAAKCRDBN2bmhouD
 14RHD/97iqUCmd+/m5xbNrWdeCNRTnpiBM/7B858xCTJ9NZ21Z+511GhAjTfglasiURr7dVtlEY
 DX2TAk/WsCkE+LiRRLwpSa61DvhwbUPUPzS8ACCMsuP9ol0hFdJeGBrqLiLFfcpxG2fNxJDEE7k
 aMyuiQOveIQGqtl25oREsxDO/tSzrYnrkKsv9w4y1D1qTTnttcJ1kj2S21B1J5i/s4+urXfFWNH
 vEEWa8+HQO0lZ3gG0AmsF/KyIf3S4bMr9BnIOjfVCAdOM0AZ+V0r06+JwtWLM7IQtttq5j1yRgR
 hcq5iN8bKo4uiQ+YZEozR9/7hlxkxrxMaFUMG+QR3PqAfDuB4Ra+uKY253yukq/UFjA2SN2J7jH
 Nuq1ZqtsVmeHP5WpAUAtsWvEudUHSn5EBM9lfmJ5v4NtMTkbAkorOB4c2EBWR5T6spWKef9zNPF
 mugo2RADZpNz7rloQpQkgktnSGHCAO9DnIyd/jk1iZgEeCXS/ymruAZ8Ave7zDhQbRvHho3xgDg
 rDy/wf/ztDUnYstNhQEgeaKoFQiRej8HVlUVKyWoCbL6p/kpbhr05aaxS/sNImzgAZKVF/za7Tk
 xA5dKkU8x0uhU75l34zhUh3uj8ePWn6GPltw30TgCTuzTE+qAswufzAzGNAayAeB9VuclLAtYNx
 UQ6b4+9KKmjCqnQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: OGN6PZYOFIFC42AJZGQPMLGRTGLG6SU5
X-Message-ID-Hash: OGN6PZYOFIFC42AJZGQPMLGRTGLG6SU5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OGN6PZYOFIFC42AJZGQPMLGRTGLG6SU5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

X1E80100 CRD board comes with four speakers arranged as left front+back
and then right front+back.  Using default channel mapping causes front
right speaker to play left back stream.

Adjust the channel maps for frontend DAIs to fix stereo and four-channel
playback.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/x1e80100.c | 37 +++++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
index c3c8bf7ffb5b..e90c68815b5c 100644
--- a/sound/soc/qcom/x1e80100.c
+++ b/sound/soc/qcom/x1e80100.c
@@ -12,6 +12,7 @@
 
 #include "common.h"
 #include "qdsp6/q6afe.h"
+#include "qdsp6/q6dsp-common.h"
 #include "sdw.h"
 
 struct x1e80100_snd_data {
@@ -74,7 +75,7 @@ static int x1e80100_snd_hw_params(struct snd_pcm_substream *substream,
 	return qcom_snd_sdw_hw_params(substream, params, &data->sruntime[cpu_dai->id]);
 }
 
-static int x1e80100_snd_prepare(struct snd_pcm_substream *substream)
+static int x1e80100_snd_be_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
@@ -96,12 +97,34 @@ static int x1e80100_snd_hw_free(struct snd_pcm_substream *substream)
 				    &data->stream_prepared[cpu_dai->id]);
 }
 
+static int x1e80100_snd_fe_prepare(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		const unsigned int rx_slot[4] = { PCM_CHANNEL_FL,
+						  PCM_CHANNEL_LB,
+						  PCM_CHANNEL_FR,
+						  PCM_CHANNEL_RB };
+
+		snd_soc_dai_set_channel_map(cpu_dai, 0, NULL, ARRAY_SIZE(rx_slot),
+					    rx_slot);
+	}
+
+	return 0;
+}
+
 static const struct snd_soc_ops x1e80100_be_ops = {
 	.startup = qcom_snd_sdw_startup,
 	.shutdown = x1e80100_snd_shutdown,
 	.hw_params = x1e80100_snd_hw_params,
 	.hw_free = x1e80100_snd_hw_free,
-	.prepare = x1e80100_snd_prepare,
+	.prepare = x1e80100_snd_be_prepare,
+};
+
+static const struct snd_soc_ops x1e80100_fe_ops = {
+	.prepare = x1e80100_snd_fe_prepare,
 };
 
 static void x1e80100_add_be_ops(struct snd_soc_card *card)
@@ -118,6 +141,15 @@ static void x1e80100_add_be_ops(struct snd_soc_card *card)
 	}
 }
 
+static int x1e80100_add_dai_link(struct snd_soc_card *card, struct snd_soc_dai_link *link)
+{
+	/* Add ops for Frontend DAIs coming from Topology */
+	if (link->dynamic && !link->no_pcm && !link->ops)
+		link->ops = &x1e80100_fe_ops;
+
+	return 0;
+}
+
 static int x1e80100_platform_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card;
@@ -135,6 +167,7 @@ static int x1e80100_platform_probe(struct platform_device *pdev)
 
 	card->owner = THIS_MODULE;
 	card->dev = dev;
+	card->add_dai_link = x1e80100_add_dai_link;
 	dev_set_drvdata(dev, card);
 	snd_soc_card_set_drvdata(card, data);
 

-- 
2.43.0

