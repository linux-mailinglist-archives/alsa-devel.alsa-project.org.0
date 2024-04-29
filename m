Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B268B5738
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2024 13:56:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8349A839;
	Mon, 29 Apr 2024 13:55:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8349A839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714391759;
	bh=L+z19Mflj6dbjsuY/oyg7M2Nl7bx7birqfaMqqiWFh4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lR4FLy+N95jFK+vP9m7vu4HquV7eaMk67DQ6MtvTf8y6EMHgI5WOXYjEcFTSOkNbX
	 r2WlyL/Jk/n+RDJZuFGKILGp+HfR8z0nY+XNiH+ZYmR1t5reS3QpLkEvnrKkQC4xsb
	 dtXAXjTGS7iRJ/SIa+3yIs4toRVqsA2BuIGuh70s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5A4AF8057D; Mon, 29 Apr 2024 13:55:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22A61F805A0;
	Mon, 29 Apr 2024 13:55:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93D4EF80568; Mon, 29 Apr 2024 13:51:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9AB85F800B5
	for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2024 13:49:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AB85F800B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=rDURjXfW
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-56e48d0a632so6696832a12.2
        for <alsa-devel@alsa-project.org>;
 Mon, 29 Apr 2024 04:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714391344; x=1714996144;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r2TryCs7KoAc+knf+2Iegg4aToZXu71FrGOJZxalZRo=;
        b=rDURjXfWrmehGRiHY4KotAB+C0ON87KjCD2YTf72XZ4d9XhS1+1Tm0MLQi6jLWCblJ
         IGTVj+yIrI48tZ8SZB/2o0yz3vAz0Fzo9hx3iFnhK+F6Ux/shkM2WmyJNv+yPWiX1X6J
         BZ3hWCngEdm+MU1FKTRuPYhyrnJHaFuhSVvn6xHCj7w/FXVueg5/wdzrkl7klfTx+Fok
         I05Sa1UiAh3yl39g8KLCa8PIVK6vYiOgQbgwCZJQp21iUJ9XstUUwPktf7NNOZyHhnKx
         YgO1BJcJ8GgTJcI+9xCOJiOzfHeDRDwz7ugpV16nLTAT9GW6QLMkw8guuFu/ok1ggH9E
         ma8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714391344; x=1714996144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r2TryCs7KoAc+knf+2Iegg4aToZXu71FrGOJZxalZRo=;
        b=q2M7tiLBhfYqEO2LTyEoZzMfG/kXEWgpogBrKwwpHdRjQZlVcCvvvIhVTYuBoCWBCM
         36opQaz0dZwSYH90S530uGQMMoidU6BqR+tdOGHa2wQmIbshMttXs8rCz5v9+AOG6rfr
         16NB6Mp1u6FVITjaoNKKWezp8Cu/NOZItkchosR5Acetygkn5caVTp6bsq497iiaj0Yr
         ZBVJVT83F8mh3Atjq9UtnqJVW0DoEqTnr+EHT/ZsuKmrhs7ZWSYWUtU42AzLPKyBrKSe
         aPO6WtghXsN6Sc1Z2cN4lw1TL6t1wuyvIrcChhgUpoighbIAXr9xRlWEJVKhI+RV6vyY
         fgUA==
X-Gm-Message-State: AOJu0YwUzgdbbHNahZtOW+tSnwA7VLEsXw6SHZqnCI3vTsubZBd1tZRL
	ifPRLtuKctHYs2MUw8sn9U9eFwJrDUmJ3+knJSyan/zV2OY4T2Be2xxpzUBGa0A=
X-Google-Smtp-Source: 
 AGHT+IE7Wa1uhxiwDIcwEN93hp17bsG0rm9iXFrpgirDNmmGz9BzEYEL+4mFW282MhhBjXekfPbkUA==
X-Received: by 2002:a50:c34d:0:b0:572:4e6b:958 with SMTP id
 q13-20020a50c34d000000b005724e6b0958mr8878245edb.2.1714391338535;
        Mon, 29 Apr 2024 04:48:58 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id
 y43-20020a50bb2e000000b0057000a2cb5bsm13549651ede.18.2024.04.29.04.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 04:48:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 29 Apr 2024 13:48:46 +0200
Subject: [PATCH 1/4] ASoC: qcom: Constify static snd_pcm_hardware
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240429-n-asoc-const-snd-pcm-hardware-v1-1-c6ce60989834@linaro.org>
References: 
 <20240429-n-asoc-const-snd-pcm-hardware-v1-0-c6ce60989834@linaro.org>
In-Reply-To: 
 <20240429-n-asoc-const-snd-pcm-hardware-v1-0-c6ce60989834@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2057;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=L+z19Mflj6dbjsuY/oyg7M2Nl7bx7birqfaMqqiWFh4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmL4kjQtqus+caDsWogKmeSbNLXw+geB1/pDh6h
 zr4LbfsFbuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZi+JIwAKCRDBN2bmhouD
 14b0D/0V8sY+FV/qujbJc2MZicjp6syHrzotc7cYVvSeV+dkb439YYh+NaGaaqpeJUxjyJb2iwN
 g80bspO9f4x8zDrj33iaDX6i3PTrzUfqIdX9sdjRVTV3Fr4uwKC3aCbsFa2Vxiv17HN44sBJGNk
 xcWehLqO4B7ywwZItmOd80D5xro3XPgXNLdKOH0MdqlZklYl6hO+1xNLiPfWpip/W612624D8iQ
 9cP+3JFtg/WOs8bs1pw19ck/erjsxcK5agwdvb8/PBDqzGw+thqtLTiyhfNYkK84HIQRMnr/HAB
 zZ2imnBm+Sq/JYviHRnhDisoAwtJIMJjkKz5LVikIN/ZncgetLX/XtHcabi9PUe8u1UVTlQI35t
 p8N0ddiiugWxBSwUqeB0l/oUYVGD25BM7rw6FvLyxGRRbq6wNHIF2FM5L+CvTbf4Cjj7en2yqIe
 YAmbAszVP1IJinxReJfTLotoI8eOEInUmx5Oi6/RtoiA8PrGDx91vg9sv8+GHiPKwyUq86gzY56
 lnNPaYQ7rkZ3xUUxNfiaxz3bU/Xfdd5mCFC9bVihIo/K+xYvtE7VpBIULyS/kS+qAUaKjOPuTWS
 nSbxB6Ep7ZaUfi/J8Le0Job8rTy/m6gU/Q+TRR6KLg0Fp6FzUP4wqvblu8wCjozXsnk7ZvM43r7
 Qo+Ozchtl/HeR4w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: WCDLZDHXVIVBTYVJU23IRV33P3NGAF6W
X-Message-ID-Hash: WCDLZDHXVIVBTYVJU23IRV33P3NGAF6W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WCDLZDHXVIVBTYVJU23IRV33P3NGAF6W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Static 'struct snd_pcm_hardware' is not modified by the driver and its
copy is passed to the core, so it can be made const for increased code
safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 4 ++--
 sound/soc/qcom/qdsp6/q6asm-dai.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 00bbd291be5c..3c78440a2f0f 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -85,7 +85,7 @@ struct q6apm_dai_data {
 	long long sid;
 };
 
-static struct snd_pcm_hardware q6apm_dai_hardware_capture = {
+static const struct snd_pcm_hardware q6apm_dai_hardware_capture = {
 	.info =                 (SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_BLOCK_TRANSFER |
 				 SNDRV_PCM_INFO_MMAP_VALID | SNDRV_PCM_INFO_INTERLEAVED |
 				 SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME |
@@ -104,7 +104,7 @@ static struct snd_pcm_hardware q6apm_dai_hardware_capture = {
 	.fifo_size =            0,
 };
 
-static struct snd_pcm_hardware q6apm_dai_hardware_playback = {
+static const struct snd_pcm_hardware q6apm_dai_hardware_playback = {
 	.info =                 (SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_BLOCK_TRANSFER |
 				 SNDRV_PCM_INFO_MMAP_VALID | SNDRV_PCM_INFO_INTERLEAVED |
 				 SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME |
diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index aeb6a9d479ab..3913706ccdc5 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -103,7 +103,7 @@ static const struct snd_pcm_hardware q6asm_dai_hardware_capture = {
 	.fifo_size =            0,
 };
 
-static struct snd_pcm_hardware q6asm_dai_hardware_playback = {
+static const struct snd_pcm_hardware q6asm_dai_hardware_playback = {
 	.info =                 (SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_BATCH |
 				SNDRV_PCM_INFO_BLOCK_TRANSFER |
 				SNDRV_PCM_INFO_MMAP_VALID |

-- 
2.43.0

