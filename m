Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EB88B573F
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2024 13:58:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9308D9F6;
	Mon, 29 Apr 2024 13:58:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9308D9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714391915;
	bh=07XNlzH+Om30NPL+5RgZatpoAnoy8SZw09iGVLs1Juw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZwjisXfuH9muivKAJ/Urha6SrGYH/hSLle5Ai/Pq3EkdJm9VqaidF8Ob5Gl3S+nK1
	 JSl6K3irHWSf/HwiXQXIGddSxVKx/DbcIEKDDsSrGbBLNqkushZt6dzCNBTMEUwb0c
	 XcyeXaRN+gzmxtetX/6bJuv5fBqMeIHcQF6HaBwY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91C54F805BA; Mon, 29 Apr 2024 13:57:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E50EEF805A0;
	Mon, 29 Apr 2024 13:57:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DA94F80548; Mon, 29 Apr 2024 13:51:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 82BD9F8011B
	for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2024 13:49:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82BD9F8011B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=h3nIyRBl
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-572250b7704so4441699a12.2
        for <alsa-devel@alsa-project.org>;
 Mon, 29 Apr 2024 04:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714391346; x=1714996146;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IbYwH1iwfsZOTjLTYa1sxRyjdfJ65pOFz+5ojKjybfY=;
        b=h3nIyRBlFC2WvuHXcWN0OavuYTBwGhMdxfbGDE31MpKurpLln5wdhWP+yyr5CDn8n/
         60yONuyD5+gb1y8d9Lz2EyZnuXPZfMNMlYQJrUb9KnlEkHzsVt7kqGs9y+tPjflLDUvB
         rqMBnrF8zUpuVffoPHbazlM/dZ9Uplfdpy0jQM4hOzNZp8NwNfroFiaRfevEHPFZS60l
         7qRbyFhFXv9WWCdsn6qXPkxpt+SQmJn1K7eTbVxY3FMXV+JltlSg2XuMsLJBgxuMdrTv
         v159Y6J0dCx+gfqQAvngT8Mo+YaAQFg28PkLdqhKTHsSkT6i0gZLzCtNcgV/XHkqXB5Z
         e5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714391346; x=1714996146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IbYwH1iwfsZOTjLTYa1sxRyjdfJ65pOFz+5ojKjybfY=;
        b=d20vs4TDnyuZ9kBSP9amgAfZO+oKtSG97HURk49dtToEcNkPvT7t7chlrHECedZ0q7
         bIqpzBInI90VkQGWHtBa1DAh5bSQK/PApVR7OcxkSHX19laaB2c4XklGmcKj0rC+B6IS
         0oCUZtAu9HBPDJPYlgSanAdAvj7xKAhcgcEtJJHnKorQS7alXZlgGTH6DxKlHIBmDXdB
         GbKDOw8riZlCQAmt1qbCOLlqh9mVBK/1WadncSduu+/QkjT0kIXY4RBrms7EKjoKLHDQ
         GqjdKX1AWOw1mlRuQLOcq64Yuo13WBVg2Fh2tA3Jy+0SqkkO3lGzQhlrBJt7eBq2P7ol
         Nmcw==
X-Gm-Message-State: AOJu0Yw6+LKDD+pNMe+gvmDnWrAGtgo6/n4FJrTG/cwhmZ4FeTYjFK11
	gzFI2Zz1S4sCQPGFIj3ruJLWeGMdj9n4R6xk3oUt8OIyFMSbwLMj/7d0axQPXdA=
X-Google-Smtp-Source: 
 AGHT+IEcZNlFMX0KN5Zv3Mt9V9vUg/Vy8Fa9KRdDd7Hab4D4q7tKY2rb228nXG1TnPQpT2jd9cvgNw==
X-Received: by 2002:a05:6402:3487:b0:572:689f:638a with SMTP id
 v7-20020a056402348700b00572689f638amr4800369edc.17.1714391346466;
        Mon, 29 Apr 2024 04:49:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id
 y43-20020a50bb2e000000b0057000a2cb5bsm13549651ede.18.2024.04.29.04.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 04:49:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 29 Apr 2024 13:48:47 +0200
Subject: [PATCH 2/4] ASoC: fsl: Constify static snd_pcm_hardware
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240429-n-asoc-const-snd-pcm-hardware-v1-2-c6ce60989834@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=829;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=07XNlzH+Om30NPL+5RgZatpoAnoy8SZw09iGVLs1Juw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmL4kklslopCBSQVS24U7RLVNAErQ+RmdZW+cnY
 2vP6DhzCt2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZi+JJAAKCRDBN2bmhouD
 1/OhD/9OuP5DVUEzlKoiXyRfzWiPWETGaurZlgqXePCKIhR7Aw4zgQNkrl7olw7V0PXD3AG+lxB
 kQuxk8MGNdzM5gRQ5QvitxieqGs7Q6wB65JF4E6nljMW38QLNdX8xK+9AWe99iF6Y3Ljii/Sa9d
 QmF2lRiKOifVy5b84Ro2jZFhzL2IRk6zPR+kAAkHQmlxNfAqjGJWJwRF/XQG2azeaVobrL7Z69t
 Wjv6ACChJ4RMAH1iMe6Rm9khR3AByTKQSi6OEgO9pC8lsiGxjucEMfRmQ+naf/VSjjcVdBfgaaG
 Q8eTW2nPWJFZoF4tuDX++42H/5gf4cMxpgTQ4b4rRU4czeBYwRLBULJOjAWCXps0jxBBniD35Rw
 aYXsnzH27A4T1myauv8wnF55tdbunLfRlYFeXh2/vGe09r8v1gY0ZsmXKw0A+GE7Q7UHYzTHU3c
 0iOiLeTEzwX5sjIlF7NAhYxIhvDLWQdOBOeRioCCqUk2retxoDCP7ytx55nRYTFY7Y7/PQlmLy/
 D0KFHsf7XdM7Q+FzJePSXI+QPgtGwuWIP5LkO7YQ2YwmQwUyNc00Iwo9H+JnB1acl7IU0c/nC/a
 y2Q3MIQjM8Gocdd/6jN78rhB/DEqkZppZX1UMVkC88/l0ZD2sNPIV0++IJ5qJ4rRR3c4oGObRaJ
 TcPObSVlxia1CEQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: T6PTXWIBCIYJIFJ6VDM74QJFM3PQN3HM
X-Message-ID-Hash: T6PTXWIBCIYJIFJ6VDM74QJFM3PQN3HM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T6PTXWIBCIYJIFJ6VDM74QJFM3PQN3HM/>
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
 sound/soc/fsl/imx-pcm-rpmsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index b84d1dfddba2..128728b65a3a 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -16,7 +16,7 @@
 #include "fsl_rpmsg.h"
 #include "imx-pcm-rpmsg.h"
 
-static struct snd_pcm_hardware imx_rpmsg_pcm_hardware = {
+static const struct snd_pcm_hardware imx_rpmsg_pcm_hardware = {
 	.info = SNDRV_PCM_INFO_INTERLEAVED |
 		SNDRV_PCM_INFO_BLOCK_TRANSFER |
 		SNDRV_PCM_INFO_BATCH |

-- 
2.43.0

