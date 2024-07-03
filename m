Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2162F925FEF
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2024 14:15:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A100DE8E;
	Wed,  3 Jul 2024 14:15:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A100DE8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720008936;
	bh=zkBYXA5XhH4F6q1m9UDysUTPImTnL2Gru3YtQza5a+s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oYdsCYSCWyKvf54i8QwP2L7mcYg+umolZKMmGxsWL0f3G0YipS5XbaUcUmK7Cvfs1
	 10LlfHKgDEVLHUoFQ0B+fERDwbOWZy7Z+a2yQblSNwh7Pq8cM4Bfecmi04L+Z1wWS5
	 u4SzdlvgmUIK1FLF7SoNQTRLM6q1/VTlzzXLrKwk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2D9BF8064F; Wed,  3 Jul 2024 14:14:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10D4CF80635;
	Wed,  3 Jul 2024 14:14:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE7ADF804FC; Wed,  3 Jul 2024 14:11:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DFBE8F8013D
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 14:11:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFBE8F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=JlEs8Hxj
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-362f62ae4c5so349327f8f.1
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Jul 2024 05:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720008671; x=1720613471;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7cLxowQxGXKyItHO9t5LQNge45csaHkg4VU8jx6Qm+I=;
        b=JlEs8HxjZ8/BUOTzOZArlO0SV/XWSdzHa2MfyRKEYlSIh92i8ucU/t9rrptlkyzg50
         R/YCN2Un5Z1klO8GUad0x9Dlot9v2GH8GwOsiwPfyedVmNezE0yWR8Z9nnOyCwKGik5i
         4in+vnP+tExqDPr4i/o/t+w4+IVEMH5R4rplqbbi+EpoYo/xkzs/i86YfdRPgD3HA0wE
         ymhIhgAYO686OrwvngwqXymdIYLcS0/RlaWN3pCbFsVqAcwVfBYA9on1U0lHa3y+PCSR
         s4ksuHkdfQA6nx+ekSfRqYrSKKgBSqM/mw8fMPrBr6+zRMoyTjABXT60T62gakuEa3Eu
         /axQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720008671; x=1720613471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7cLxowQxGXKyItHO9t5LQNge45csaHkg4VU8jx6Qm+I=;
        b=X0D/eW1pSfF9JNH4mpJ2r4+SILXNM3vXQ0jNDa0ysgb7CRaVSe9mdObot8vQYFwny6
         pfu4/CyK5IEPfw/Qpxg/7GaKA0oYJWO3Wi6z5UTE6AFLRZ8QEFhUiiREZ5/hqIT14JZ3
         mvzOfdPVQY0h5zQNYkGmrKChptGM7cFlaYee9fan2Iffut43HPaSYhAGZfu7oivbnDib
         Y9Ca8BM5uU+6X2sE4B+6EyDGzuZiBLDKtvhkY1/k7m4ZPGA93tgtLn2/69TE2GNNuf+C
         45j+7NzWqPaGMj7es481eIeNgosyh1AUZQTUMrTpgAY+qytDhYs2G1wj6RvRClgIEsAn
         8t8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZnm7BqF21J4yiMsW/KgLmdKhe0z+offrDxnTDDLvFx3tqdHqQuIR6rztpMxIjJm8T77G7JUX3/ygyvH16K5PJKoDwgDcx5EgoPjA=
X-Gm-Message-State: AOJu0YwSxGo+A1aDv0xyVuSBAV7BA+BO11g6Qx6ttNbcspvkr89j3uY/
	wdIVEZiSjER6SkUU6epP+G82daDLDc3gjf+twtcp3Z9EAm55PVQpVhhnfmH3vHo=
X-Google-Smtp-Source: 
 AGHT+IFy7XIwYIBv75NcGjjGCl0VS2oKdh8CqLT1sJCeuF/ePWgLta3XoHjrEoA8051q0A7kko4l1Q==
X-Received: by 2002:adf:f652:0:b0:363:337a:3e0 with SMTP id
 ffacd0b85a97d-36794780b27mr1367398f8f.1.1720008670720;
        Wed, 03 Jul 2024 05:11:10 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a10307bsm15716222f8f.94.2024.07.03.05.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 05:11:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Jul 2024 14:10:55 +0200
Subject: [PATCH 01/11] ASoC: codecs: audio-iio-aux: Simplify
 audio_iio_aux_add_dapms() with cleanup.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-asoc-cleanup-h-v1-1-71219dfd0aef@linaro.org>
References: <20240703-asoc-cleanup-h-v1-0-71219dfd0aef@linaro.org>
In-Reply-To: <20240703-asoc-cleanup-h-v1-0-71219dfd0aef@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2812;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=zkBYXA5XhH4F6q1m9UDysUTPImTnL2Gru3YtQza5a+s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmhT/SBRZL/pAdnmTHzMWcEt1sae0bOVf+MOlLi
 9Iouwdrzt+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoU/0gAKCRDBN2bmhouD
 1++xD/4smEI7/Q/xqQ8kHg3Br1em0PyUgtV32GF4yvl2OjiJmfHfqwc4MC8tYzguMEV3m9v143t
 3is1DhFHdotHjyQMMJiMG+/b3egvgKx8MxxKLDTGJ3MbXRecLSlQAaMuSCGeuLk4bCEXAZtN2nZ
 59l6mosBbXKPDZGIBe3M+soiCM03Ydl01cJl8dSK5suDjwRpkMhb0+JXQjOl4yk2ZO0u8RmvM0j
 uTtxKpGljxGv78qEXDf1jblZH1uShAGNoK1Ox0ZKWxrhVpaG14Ytg1DC66Mpd7oomSWnyWBt1wU
 EshhBKabPnUlVVJObbJ1XFzGZURbnFu/lUXJgmBgaxhNczlYsv9/5T60tarIxLoFEClMrdN5NF4
 7an704jrG2hU0kQtKZznWsT3bxDivQfnUj/7hEgnVcadq4eChOBHgZKl886/hgKB4b7l25UUdxr
 7Zw7a1u0wlt1n9SPZTdlqdQwGj/1eL8hAkZkxLW54Dn6o59EUy415ArhoHSaawTLZFbER5UtXSs
 JrKvhfVNnjlmMmOGlnXUwCWRTfLqf9HBuynCCUJsjfA4B6sMDo0lV+P5grGPlQlghYxPgiaUAzU
 H96CRf99qS+tBY6o3K4/0HEsWzv1FLK3oz/6DmIkUKweb/sR9xpbL8JxcMRwZsi762H3cuL7vTE
 RVySwVK/E7N7Ziw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: 5SKQ4COB4UUBJ6H2JFP6JMDUSUM2PCMW
X-Message-ID-Hash: 5SKQ4COB4UUBJ6H2JFP6JMDUSUM2PCMW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5SKQ4COB4UUBJ6H2JFP6JMDUSUM2PCMW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Allocate the memory with scoped/cleanup.h in audio_iio_aux_add_dapms()
to reduce error handling (less error paths) and make the code a bit
simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/audio-iio-aux.c | 36 +++++++++++-------------------------
 1 file changed, 11 insertions(+), 25 deletions(-)

diff --git a/sound/soc/codecs/audio-iio-aux.c b/sound/soc/codecs/audio-iio-aux.c
index 1e8e1effc2af..3969ee45f41e 100644
--- a/sound/soc/codecs/audio-iio-aux.c
+++ b/sound/soc/codecs/audio-iio-aux.c
@@ -6,6 +6,7 @@
 //
 // Author: Herve Codina <herve.codina@bootlin.com>
 
+#include <linux/cleanup.h>
 #include <linux/iio/consumer.h>
 #include <linux/minmax.h>
 #include <linux/mod_devicetable.h>
@@ -131,33 +132,27 @@ static int audio_iio_aux_add_dapms(struct snd_soc_component *component,
 				   struct audio_iio_aux_chan *chan)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
-	char *output_name;
-	char *input_name;
-	char *pga_name;
 	int ret;
 
-	input_name = kasprintf(GFP_KERNEL, "%s IN", chan->name);
+	/* Allocated names are not needed afterwards (duplicated in ASoC internals) */
+	char *input_name __free(kfree) = kasprintf(GFP_KERNEL, "%s IN", chan->name);
 	if (!input_name)
 		return -ENOMEM;
 
-	output_name = kasprintf(GFP_KERNEL, "%s OUT", chan->name);
-	if (!output_name) {
-		ret = -ENOMEM;
-		goto out_free_input_name;
-	}
+	char *output_name __free(kfree) = kasprintf(GFP_KERNEL, "%s OUT", chan->name);
+	if (!output_name)
+		return -ENOMEM;
 
-	pga_name = kasprintf(GFP_KERNEL, "%s PGA", chan->name);
-	if (!pga_name) {
-		ret = -ENOMEM;
-		goto out_free_output_name;
-	}
+	char *pga_name __free(kfree) = kasprintf(GFP_KERNEL, "%s PGA", chan->name);
+	if (!pga_name)
+		return -ENOMEM;
 
 	widgets[0] = SND_SOC_DAPM_INPUT(input_name);
 	widgets[1] = SND_SOC_DAPM_OUTPUT(output_name);
 	widgets[2] = SND_SOC_DAPM_PGA(pga_name, SND_SOC_NOPM, 0, 0, NULL, 0);
 	ret = snd_soc_dapm_new_controls(dapm, widgets, 3);
 	if (ret)
-		goto out_free_pga_name;
+		return ret;
 
 	routes[0].sink = pga_name;
 	routes[0].control = NULL;
@@ -165,17 +160,8 @@ static int audio_iio_aux_add_dapms(struct snd_soc_component *component,
 	routes[1].sink = output_name;
 	routes[1].control = NULL;
 	routes[1].source = pga_name;
-	ret = snd_soc_dapm_add_routes(dapm, routes, 2);
 
-	/* Allocated names are no more needed (duplicated in ASoC internals) */
-
-out_free_pga_name:
-	kfree(pga_name);
-out_free_output_name:
-	kfree(output_name);
-out_free_input_name:
-	kfree(input_name);
-	return ret;
+	return snd_soc_dapm_add_routes(dapm, routes, 2);
 }
 
 static int audio_iio_aux_component_probe(struct snd_soc_component *component)

-- 
2.43.0

