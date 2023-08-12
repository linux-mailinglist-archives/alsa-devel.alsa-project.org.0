Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4AC77A226
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Aug 2023 22:01:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6DDE85D;
	Sat, 12 Aug 2023 22:00:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6DDE85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691870504;
	bh=R/FPBRVZGABOWdOpRTk0erHXEQ0F5Egq2bAxhUF5lMY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vq21jFpnyvBxDx84RIkuCOatGLddo/SDWj4VlNZLIM7krDOXtn+UhOfQPpUC1dX01
	 AWJLZ6zc50vWXWL9uX/bBhIaG047JRmByodrVGN4NsQXjPPvOMNoQhbg3HfPPO4NPc
	 VEsCPwQCpsX/pdVOEjKC51VdBYI7qI6MUaQsS3cA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16C6CF805BA; Sat, 12 Aug 2023 21:59:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BAB9F805AD;
	Sat, 12 Aug 2023 21:59:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C1FDF801EB; Sat, 12 Aug 2023 21:57:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8B77F80549
	for <alsa-devel@alsa-project.org>; Sat, 12 Aug 2023 21:56:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8B77F80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Umz6Aba3
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4fe3b86cec1so4762561e87.2
        for <alsa-devel@alsa-project.org>;
 Sat, 12 Aug 2023 12:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691870218; x=1692475018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4kjlHniAc6arc0m9mehA9++EC6OU5C4FNQAGRJcfJBM=;
        b=Umz6Aba3IwiPvqp0pIvSt1/oXpJnp2i5Bvow+UDzhclwbwdPRlNYJWzyOme7HYL/7X
         xlL9i6sKFN5qorPb0c3qhz9J3ONNgBVm9BiqllFaCIy8UvdSSfT0qCFjv3eG/09nEjA1
         j/GHzBcrH+OuKH7eX64kImiWgbTKThoYoTa1bHkEJPsqkeyX5sz4xV2ANIica3lWz2Hz
         F4ndN/5oepA9H1cXff+sk6ETYlOBD7ubLHfZcdNMT9OTJ8NOux4hK4msnrnYEXU84f55
         IgtONxgnUgiDQ8lBukQj/abiQz/ZSR58N4atRNMPsFpX9hqpJWa3vOn7P4DY00z10yz8
         6QwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691870218; x=1692475018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4kjlHniAc6arc0m9mehA9++EC6OU5C4FNQAGRJcfJBM=;
        b=DxvX0Y5IIoZOq7JWSvMZzQHcRMeAxgnEo+9YTSmHPNtz6knn58DN0wbxa2r632cEyv
         wBai+5DKndEfODJyVVTZPmStxlIQplMmIbrAeVfvOlSuQp2G2eMdlNMDKXbddHer+pkx
         xdS5dVcbV8XS/yNQB4p4F60Vc3fgCZHam59oIqIDjlbvyrPrUG6q8Hkg6SSdeeSm6aXt
         QBXNotMn/cKuPwVCYLnXMNIJ+XlRA6oq/rf4sdGZ2rOTSg8dBoe5vQfV3jeBEySgaEzh
         8CFqxpRiqu2yU80gg+2Sqokbjzxl0KLVEUP5mzcpl+iS+qEsJNk7ZbGnfj6CdNjmBfcZ
         NGBA==
X-Gm-Message-State: AOJu0YxidO+RtLXMA4GMIIE22DDSNJZBPDnqGuxOkJ5F4dyZzQsaKXUb
	pTJfXHEdb9NSbYcp4i0ugv9+ww==
X-Google-Smtp-Source: 
 AGHT+IEeqDc5TPoIkGhEAP1dF+YwTumn3HvnCWPJn8ypksCk6Ddts9ujT0t4hMTYY6mX3/4l7SM9rA==
X-Received: by 2002:a19:e009:0:b0:4fa:5e76:7ad4 with SMTP id
 x9-20020a19e009000000b004fa5e767ad4mr3716056lfg.10.1691870217856;
        Sat, 12 Aug 2023 12:56:57 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 n29-20020ac2491d000000b004f87893ce21sm1236182lfi.3.2023.08.12.12.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Aug 2023 12:56:57 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 12 Aug 2023 21:56:47 +0200
Subject: [PATCH 09/14] ASoC: rt5514: Drop GPIO include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230812-descriptors-asoc-v1-9-eb4dca1f68af@linaro.org>
References: <20230812-descriptors-asoc-v1-0-eb4dca1f68af@linaro.org>
In-Reply-To: <20230812-descriptors-asoc-v1-0-eb4dca1f68af@linaro.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: NVG3WTBHBQV23IGPXC4D6ZNCABIRVC72
X-Message-ID-Hash: NVG3WTBHBQV23IGPXC4D6ZNCABIRVC72
X-MailFrom: linus.walleij@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NVG3WTBHBQV23IGPXC4D6ZNCABIRVC72/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver include the GPIO legacy header <linux/gpio.h> yet
doesn't use symbols from it. Drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/rt5514.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/rt5514.c b/sound/soc/codecs/rt5514.c
index b3aac2373357..43fc7814fdde 100644
--- a/sound/soc/codecs/rt5514.c
+++ b/sound/soc/codecs/rt5514.c
@@ -17,7 +17,6 @@
 #include <linux/i2c.h>
 #include <linux/platform_device.h>
 #include <linux/firmware.h>
-#include <linux/gpio.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>

-- 
2.34.1

