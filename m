Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B7E8BF84D
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 10:17:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E01A5E9F;
	Wed,  8 May 2024 10:17:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E01A5E9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715156268;
	bh=d+whTvaCUFBkWJxrgaqvE8kSJoAykKqRo1KOv90DlbU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q96QzUH2w57r+fp6dFvQBC3iiIvi8RCrBZHDWYBdyopMZRwtt6cZ/FqxpbdTm0gUG
	 Sau6LYhyyssYeWm4IMuLrTQTUrA4Xregz7t/4GyngvDspriE+K6RJTuRM5MjaClqYT
	 Ke4b41Ynic3Aa0madWRJ36wS/yfYAjf9As7aO1J4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96A42F805EC; Wed,  8 May 2024 10:17:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 20791F805FD;
	Wed,  8 May 2024 10:17:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C68BF805B1; Wed,  8 May 2024 10:16:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 79CD0F80423
	for <alsa-devel@alsa-project.org>; Wed,  8 May 2024 10:16:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79CD0F80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=QwaSF3U1
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a59a64db066so1035012666b.3
        for <alsa-devel@alsa-project.org>;
 Wed, 08 May 2024 01:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715156201; x=1715761001;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0J7Cge03mHzKytqfe46M5SWmiJDYT6L/0iD5WUZ2XNk=;
        b=QwaSF3U1UYijSP+FCnIEtzgp0Rrsk7/MzikG13ACbpYkX2zRxZGCCGoR5sNV//kZhI
         cIU3FISOj2P4GSKpyROqxX2Ra7E+TR+HTBgw/VSUQIpYElieD520X4oEmx43cftfWndQ
         hJd03RlgKlDSojXe6Yb/yzrbdv1VKqfBplkQ4lzfVnpUKFcZTtDkqAVoRFQrhRU1VLPD
         ufnD0ffr96Aa4lMwmUYHL4E4OZVKYP3MM0q01Mki7RyejbViMQot4pFpTTDerz1lzhF0
         09/egakBx+GOiAYgpzg88/SDb8U36T+8I9U8ez9P+fgSXujfK2ShUCpNOBIsqgcjQfAW
         DyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715156201; x=1715761001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0J7Cge03mHzKytqfe46M5SWmiJDYT6L/0iD5WUZ2XNk=;
        b=UgQ795aofZw5SM09KFO8KSF1hKVROjGmVwXXGImaZWsKpY6yVRSBPjAu31iHVIlIDl
         LdhrcmIr/XwmfMmuV4WipSIsYf5DNGVpASI3Z7MWd/pXgXk/6V7A8/gCdCCzu6So5Npw
         E9eyFIftKAHNOZJ/WfsxmVVYsgW/ZtU/f/R5lVn7X8t5qIbWRTm+lrFJKyuBVjUV7Jn+
         5vR/SgknIMj2zw0utpb36b6/adL0MCU6kDJJtCm8Vtu7STaa8ic7BtBWzbPR3R5kjWlk
         kgM1voG18a8atFJiQFwF5syIQDibjML1+kthNqNHXLY/bYqBEfJ8FlzH2U4rn9MrMebW
         qcHw==
X-Gm-Message-State: AOJu0Yw6+fS0gjavgIZ2u4qIhuebOQ2G5EbJUL1Tc21WUvl9cL5R5+7z
	L2d7IdKoD/KJjcbnG1/wgFMBufhKnaPC1wO8kY7vYb65+09MvpY9UKeO8/tpBt0=
X-Google-Smtp-Source: 
 AGHT+IFZ3qYEvnZ6rTmw8oYG9ikVNB5PUPg8nEX7L1tXb4l7wu50K2eH4wdfLFOOD0rRGkPUkUdGPw==
X-Received: by 2002:a17:906:4a01:b0:a59:afdd:5911 with SMTP id
 a640c23a62f3a-a59fb9cf8ebmr117229466b.61.1715156201334;
        Wed, 08 May 2024 01:16:41 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id
 va28-20020a17090711dc00b00a59b87dd0d7sm4564734ejb.147.2024.05.08.01.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 01:16:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 08 May 2024 10:16:28 +0200
Subject: [PATCH v2 2/4] ASoC: qcom: q6apm-lpass-dais: Implement proper
 channel mapping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240508-asoc-x1e80100-4-channel-mapping-v2-2-ccef9a66a572@linaro.org>
References: 
 <20240508-asoc-x1e80100-4-channel-mapping-v2-0-ccef9a66a572@linaro.org>
In-Reply-To: 
 <20240508-asoc-x1e80100-4-channel-mapping-v2-0-ccef9a66a572@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2494;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=d+whTvaCUFBkWJxrgaqvE8kSJoAykKqRo1KOv90DlbU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmOzTi8NEsdlADISPfQf36sKPevu5VsjGLqs0hx
 kDZ6uc8tH+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjs04gAKCRDBN2bmhouD
 11aOD/9s1WsoAA6B5DobpnjGcCX7UuSSk/NL0D87AYUsJWiNfkbfnVALM79q2oh77xiICczVoTc
 F+UQ2l/Z7dybuXatUoPdSrs0jzy3aAhh4Cq85245TWhfmAVzAEwKGLUAXYGMNiWSkGhr8PF0AMl
 w0XyISwuUL5jS9yjcycHy2Y8xd2GWrJN5BjrEOz85WR8W+lWoietfVaE+HeFcwXXDNcXgSkSuae
 ndEbcKiJ01RB4rqL1ka/dn8Dvz6/S+ddEU2NlPUttdvaLsWK+MEYg+4v7VlJvm3VBlh5Uy4pmuW
 3rNPNsQ6iqIH4UQ+JCiLd5Z5gTNLSAsZ9gAslAd/2AlLmYr6VeohJvMCWU3jGYjndWs3ypoHGf4
 h5mnWpYgylDE94yfPG8kSiEuWRKFrKEmfGLLMzKr1NP6dR1d6pHQXZvZcV8Ge4NQkmPmHtT7sOs
 bMSPaJN1T0S3K0xwx/dDOFE/Tm+n5oxBYX6HyfHkgXMoF3RO0679nax4RQyea+7a6f13hrBXQEW
 D4cc2QND4Omhz3v7sq5pYnhMTAN3CujXiL9/dYigdLg0RXCScmuTZFtpWMWZBFHGPBbiPJsp529
 BrdEQZBQHuNK38RvxE8pY72CYAJbZrUKUiXPj29rASjjCprRepydfG/Vlp60j7OnImnt+p7zFCG
 d85DyJDwvsMneqQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: TP35V7VUAGTHHJGJVYIQJ4T4OF77GXSO
X-Message-ID-Hash: TP35V7VUAGTHHJGJVYIQJ4T4OF77GXSO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TP35V7VUAGTHHJGJVYIQJ4T4OF77GXSO/>
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

