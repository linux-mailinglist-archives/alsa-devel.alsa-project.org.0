Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C346925FEE
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2024 14:15:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 002E310BE;
	Wed,  3 Jul 2024 14:15:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 002E310BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720008922;
	bh=X9RGNO5wB0C8KAI2bKN+Sff6tTbKWBwR8b9RYI6jmJE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HFJIe/kXeoZDy/1tNUAvWqOBd36sxZZBIIM5s11GoVtNNdOhrQ8fua9ICjUXnqv2t
	 F6LHYBpev4Y1FKCvBymZfgj75YH4gc+lohh9aNkobewZmYibj01oWdHMLmwVFgXDAy
	 OXvVKmTl2NWhZL1srox4lPuOFyQcFggmwTxMIsfE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2216DF80608; Wed,  3 Jul 2024 14:14:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 766EDF8061A;
	Wed,  3 Jul 2024 14:14:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C89A7F804FC; Wed,  3 Jul 2024 14:11:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2D574F80508
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 14:11:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D574F80508
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=eaf1UOWy
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-36794da7c96so272794f8f.0
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Jul 2024 05:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720008680; x=1720613480;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=30H4wuVh6MTN8EFct4l0si8PnCcJgk04g6gE9lXf/C0=;
        b=eaf1UOWy4LnnxZ0BsKXMnRwV+EdM6vEhBKQEuzWHLQOnfZi3moCGMfiC+sI8p+XdO8
         BBShOk/LXeiM6xUIruT2suerco95PurubUp6Dyi9nEt/RJk8eYc8j8646Q7x3ICauicQ
         akX0gyP/6A1LqOLtClmCfhMiQXyXGrF3UE/neJNzWBjhTE55QH4nxToACU02XZWIhrmw
         xYooU8DNwf5Mgsa4f6PFTmozvctUUkEMdlmEa9S8yw/MQbXXvqf6WsfgxkIMAvx4rkdp
         HmtskY0yq7tCp7wlvrue5kmZKxOucxfOF05r3HAXKJ+15Wvth+uqQB5tAKWo6TUN4p34
         Iq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720008680; x=1720613480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=30H4wuVh6MTN8EFct4l0si8PnCcJgk04g6gE9lXf/C0=;
        b=tU1534x/57C+OVG/YpAD6kM1q5e3r93wUcTCfn+1MKt/1/d3bdkt0/wEpIyHs5+whF
         IYK4/w1pAVd+elXYazhAULL8XSSovFR4Uqsmfm5cmg8xQbRUSb8GXNBFtmKSyqkWvHbV
         a20l3zwaHG1MTTkvg47zhCBD8VZcuXpnG3OAPhb0EJ4zaHX0DxsnhIDkvrK26ZFBxFHF
         UDJthUta0vFK1irmQxchyD8ewS6HnDL53ojImAWbBVZZQ9YhDix2kGAmKRNYI5mwvXk4
         Qi/QXgnuR+uaP2Kc+Qi+cNR3dDNmTPddR5qXzML6wgDgJy8oNHWBk/DQzq2fKfglG7HV
         3NOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXU6cIYXs6ek7CCil/qQqs0O6b/RRcz2ZUyOhY4RoNhrzuctFyJo7BmZEGCLtJuBxC6kwOadJOcT5ovUN+YOXWQog9P0m7PZ4mKX9I=
X-Gm-Message-State: AOJu0Yzw8bVySVb+3h4DYxagm0j3CrX6AVyZaSSRMBvfZvMEuWzmRoYb
	tBi9zRgaxApc8spvwD4YVPkLacT1kBwmSISNhEU1FmLsLk6TU+EWyhh5keD4r4A=
X-Google-Smtp-Source: 
 AGHT+IEDsnzvMssWW12W73oyc5NjjqnLZ9RF8bwCkjxaj+IHTX4GIR6Mw8E9wybObB/fyceJvM28mQ==
X-Received: by 2002:a05:6000:156a:b0:366:e508:c7d7 with SMTP id
 ffacd0b85a97d-36775696c9emr9653713f8f.7.1720008680569;
        Wed, 03 Jul 2024 05:11:20 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a10307bsm15716222f8f.94.2024.07.03.05.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 05:11:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Jul 2024 14:11:02 +0200
Subject: [PATCH 08/11] ASoC: simple-card: Use cleanup.h instead of
 devm_kfree()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-asoc-cleanup-h-v1-8-71219dfd0aef@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1558;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=X9RGNO5wB0C8KAI2bKN+Sff6tTbKWBwR8b9RYI6jmJE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmhT/YMEj7J9NvFTYv5P+4OQRpfot2iJsqj4iuF
 QE/7PDROlCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoU/2AAKCRDBN2bmhouD
 1yMlD/9U1tGNEULLbx4K0Qb3ti9u79wPsPOGSVTGfeT4IvhdfTtElmd6RNSsJxBuhTXESGpgNLM
 BmhcGaYslhtTD5iwD6vr/ytTPHZHB6olK1Q7+BMin5qZfeFVIf+rFICGdJy6UZnvy5491siZ1qq
 NUSYVGoY0JPq8xa0CdB7vTiKEUFofiWfIr9DEqxJG1LsbA1goDvah5Iu2alGtaZmmDojm0CJwjL
 O1MmfJx/7mxQvCrYj1gdENaI3q7b4DPDa+QDqY5HG5MIfBAad0EaANQSaKQRABSpZs9aagn+oF+
 ucjzTD3VGG4Bv7rzp8mDddiADe0ew/umdLAkcFACuAfDXntAsYA08R4Ers9+7B2RbreeFEU9yQw
 i/aMefqRpMeMYEjd/Gmb+KMUHt28mbk7P92iIOTTNB99yxn662j1EjY2tDC2bZWSeD2XAgMwDja
 hBd4XutXGRhK4PL3sRvKWiJnJByM0ybhTpTzKsE/AxF5YWiADGrXrPeGBOktP0/+J+gmwmBQHQL
 9qDUp++viikr3mnx++adqlVaRCg1x4A3qp7c6O3GO8hfSWn2DUGjnJE1kVFGQql/5IlIUQy0mEm
 UbiTrZ86Sg9n836zL7qIJHai2oZrfWzs2Gd8wq57VVVUOZ8clFwJDeQfcznZ9kBlY0hE5UTqm0N
 R6WtkzOurrfY+yw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: BPHVJU4WOS2UCOTBTXXYDSHYRLJXELCX
X-Message-ID-Hash: BPHVJU4WOS2UCOTBTXXYDSHYRLJXELCX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BPHVJU4WOS2UCOTBTXXYDSHYRLJXELCX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Allocate the memory with scoped/cleanup.h, instead of devm interface, to
make the code more obvious that memory is not used outside this scope.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/generic/simple-card.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index edbb6322e9be..d2588f1ea54e 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -5,6 +5,7 @@
 // Copyright (C) 2012 Renesas Solutions Corp.
 // Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/module.h>
@@ -727,7 +728,6 @@ static int simple_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct snd_soc_card *card;
-	struct link_info *li;
 	int ret;
 
 	/* Allocate the private data and the DAI link array */
@@ -741,7 +741,7 @@ static int simple_probe(struct platform_device *pdev)
 	card->probe		= simple_soc_probe;
 	card->driver_name       = "simple-card";
 
-	li = devm_kzalloc(dev, sizeof(*li), GFP_KERNEL);
+	struct link_info *li __free(kfree) = kzalloc(sizeof(*li), GFP_KERNEL);
 	if (!li)
 		return -ENOMEM;
 
@@ -818,7 +818,6 @@ static int simple_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err;
 
-	devm_kfree(dev, li);
 	return 0;
 err:
 	simple_util_clean_reference(card);

-- 
2.43.0

