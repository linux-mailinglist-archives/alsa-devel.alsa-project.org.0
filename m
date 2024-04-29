Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 662838B5740
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2024 13:58:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E7C1E76;
	Mon, 29 Apr 2024 13:58:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E7C1E76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714391930;
	bh=gich1JRWEld7frP5eaWjzjWGBaaM+RGhkK+WPH3Hgf4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kA+y5eVZ26HsqsqIZuVxKR6/e6rkQRjNp2f09xAKYrNDReX4tCFpetU6nMhTjoxy4
	 pL7vZDXpo5o9j+tw5OqWtK2Hi7WCtaFONDzs9FPuMjgdTMEWpLyMaPSZnmD1TsyPsC
	 EqLA86GSA7zzrl+i00NWjni+BZm0rvafykmd+71Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C30DBF805B4; Mon, 29 Apr 2024 13:58:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F9E8F805CA;
	Mon, 29 Apr 2024 13:57:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1AA5F8011B; Mon, 29 Apr 2024 13:51:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 47479F804CC
	for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2024 13:49:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47479F804CC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=w8rGviEG
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-56e1f3462caso5487720a12.3
        for <alsa-devel@alsa-project.org>;
 Mon, 29 Apr 2024 04:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714391350; x=1714996150;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W2ZUcqC+torIBGZl2jfKZ8j0WRKINo9TI5z6SJwgmg4=;
        b=w8rGviEGhv2hbK+Tnx+XWNeHHcPuO5cT+UI3zSl2aVtqm/GyLd2CKBTzWuRlyvLTpE
         XZ2pEYiJSjKJJTvVSlmMw9A5XSgBUzHj0AaxIAneuIaeIGKKMZ5jHgX23tIoYcEcgzrA
         Dv3HRcDtX+nvsvQx+x865yjJNZxMUQh0PBycnVY19SGDufj017r32B597BLAgg7e66lN
         rCRWaZwwdrGtvrff/5B0VehP6hgqFzMwooX+v824C5Opm/5llcdK1jZQv3eTpKMP4fG7
         kxY3VfQy4vc0f9iuoqesmLtGeaVYHdjEZwbyWEDPrJ9hwxsAUFQXBTN8tQ/EKVvRCuHQ
         sE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714391350; x=1714996150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W2ZUcqC+torIBGZl2jfKZ8j0WRKINo9TI5z6SJwgmg4=;
        b=h0VNsKWSDiOVS+W4HST6Ev2eDzceCRs1oG+s78c/0qb4C3b0hSXMTNkyuQSEANYPb+
         0nGDumym5xKWM0D83r+MDc/FlZxSb44aQ3quWu7pJexfvMkrsW3olq1rJfaksSGyP6Ex
         fDzzni+Vsxnc30RHQkmi1x8AXslb12Cy3Kz8HNxo1hHNGSG1Eu+D2maeHqi0fO/Tprtd
         dHCKpYYY9s5YnFQpGMbFojBxa4sdis4Klz03XlFGWp1qg0PbdgWvaa4lqF6JGIuUbLhV
         VWAVjq7jGQ6Q3lft76wToV5iUcwdEtfMY7PgzF6cx5ISoZKnpp2vXUO+gGvEaG2O3B6H
         JZ2Q==
X-Gm-Message-State: AOJu0YyVKL49tO3Df4nUeOpzdNOVVgRPBDAw5+5C4FcB7/wiiLvpRjsK
	1W27HR2Ld8q2zNjoSkF3j+aF7c9khdK1hzzKpJG23rAO4L8UAWjuQ4GiEWFHpkY=
X-Google-Smtp-Source: 
 AGHT+IG+PpPYt5gJrRGC1b559rFwqcY02Y7afPcoTHrR3gteiPesqjrrRq6V/qr9zfo7soqjuK3G8Q==
X-Received: by 2002:a50:8ac7:0:b0:56e:2452:f867 with SMTP id
 k7-20020a508ac7000000b0056e2452f867mr4484403edk.37.1714391349889;
        Mon, 29 Apr 2024 04:49:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id
 y43-20020a50bb2e000000b0057000a2cb5bsm13549651ede.18.2024.04.29.04.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 04:49:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 29 Apr 2024 13:48:49 +0200
Subject: [PATCH 4/4] ASoC: uniphier: Constify static snd_pcm_hardware
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240429-n-asoc-const-snd-pcm-hardware-v1-4-c6ce60989834@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=778;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=gich1JRWEld7frP5eaWjzjWGBaaM+RGhkK+WPH3Hgf4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmL4km9txiF1WGA7UWw3CfsFA6VB2MZtNJU+MOU
 FKjqCQu/4qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZi+JJgAKCRDBN2bmhouD
 16ccD/9l4cVT56DbQ4s528ydZBWtzc/oqXGu1ZQbNITz14ONADT4bPlxkanL2O0tMltrVTrFj8N
 yCn7wufeyWdt6hobAeT2jnVzkG4kPP2xuFUJiw0pKpgPViDQYQQvypq31/wxF5wzMSJkrW/UClZ
 bBWRtRqsGDuBrUvJ+KQT4y0YzBjxTyieyo0MR2V6ctFh3XKFCW31u2lJSH7xSxiRcyZCeFVyLlC
 I3C0yBX1ofQrBohBO/sGp1xIkY542Vyyb0oYn2HCEiuCgP+2aJz9Uzd5nzG2D8ifsfCZDe1W2fJ
 BBo+ylftctAuKNbBXptE6DiZ/sueGCmNlIOLx1y4jtFbODWgFIG3M8WIB4tB3LimjuI00JTUfdJ
 EXptaN0tyS1nlKORVjO5N2bDN4aaRB+nVEKlcVvOlSMWicMUHepZnzKDP34A+zXPSaKHDyLHiE6
 IaPAkr6rUUVwEK/bI6iC/VKCp4A9TaeQKOmbab41FPXLFr7kS8Vy1KNyrpgxyPSRSQsSD4KjYPp
 4RUTHpCPh8X6nbbbHv2nUUnpwFIGATLbI2x8gsubcs13KPkg57nn3JNnaNhEcr88Vl/3vU652O5
 7AbhSRpcdk7w/Zb9QhAm45Osql//C85WJu45trFQ7Ntpn15eubGiD1sld2555lrF+y4UGAHWksS
 xblzapxOFjAtX0g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: RN2DRAHIQ55RM7ZGJIJE4OI64V67G5MB
X-Message-ID-Hash: RN2DRAHIQ55RM7ZGJIJE4OI64V67G5MB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RN2DRAHIQ55RM7ZGJIJE4OI64V67G5MB/>
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
 sound/soc/uniphier/aio-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/uniphier/aio-dma.c b/sound/soc/uniphier/aio-dma.c
index fe272befd967..265d61723e99 100644
--- a/sound/soc/uniphier/aio-dma.c
+++ b/sound/soc/uniphier/aio-dma.c
@@ -14,7 +14,7 @@
 
 #include "aio.h"
 
-static struct snd_pcm_hardware uniphier_aiodma_hw = {
+static const struct snd_pcm_hardware uniphier_aiodma_hw = {
 	.info = SNDRV_PCM_INFO_MMAP |
 		SNDRV_PCM_INFO_MMAP_VALID |
 		SNDRV_PCM_INFO_INTERLEAVED,

-- 
2.43.0

