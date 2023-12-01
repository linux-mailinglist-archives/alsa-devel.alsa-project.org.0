Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA88C800BC7
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Dec 2023 14:24:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55052E7D;
	Fri,  1 Dec 2023 14:24:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55052E7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701437079;
	bh=gS3N25qqZntPpR2ho84RZaESNZ0PukadGWdRi45Z8iU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bYCdoOkb6Usu3IN1Q1100jgqUgeQUwARrWmrm/dudEu8zzsWwheDCytx5Lye5GO6X
	 pUdBYaKQ+hxSJzKXbdXAaUkoBvwJU1JjfOQTcpmEJQYqAn92941tKThguaQydJxgPJ
	 CzG+qUDiKRNWeqpiSNM62PqgREefGjQ/FW/qeAGU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B02BF805BD; Fri,  1 Dec 2023 14:23:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8D43F805B4;
	Fri,  1 Dec 2023 14:23:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A194F80236; Fri,  1 Dec 2023 14:23:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 09874F801D5
	for <alsa-devel@alsa-project.org>; Fri,  1 Dec 2023 14:20:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09874F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=NKqU0SxD
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50bccc2e3efso2696135e87.0
        for <alsa-devel@alsa-project.org>;
 Fri, 01 Dec 2023 05:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701436836; x=1702041636;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QXDjDPaMbvQx1bg37W4jgjJHDDiGcy2tlOvY5Yp+dBc=;
        b=NKqU0SxDx+H35hAiF+pr8OAIjlL1bjlV+4AljP1bCPe9YgGGzi5yDgFkzneX/6djWU
         ibloMQllgYDci7qSK3p7cvmubnk1g2J6A94+X65+cN0EhA3bHyrShHjusEibeyQGxuyq
         vpxeBaUEwBwBhKUxxsilVlb1B9+NPp5vqQVcsi+uzL7uUqEFkeKdzTJiKETjvIas7k9d
         5Q3VjGA/dNcSIRRhHK3CIR1QTH+AZXK4pHbeVVMmQb5iS7FlcMBAEXTGwAukWDc/17gk
         /8vaYJ3a7o/Dh6o2RzvbhvTf3DSwuXJ0im9L0WJAqJCcdGu/EMArMuBnLUltnaBHJIgU
         oPGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701436836; x=1702041636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QXDjDPaMbvQx1bg37W4jgjJHDDiGcy2tlOvY5Yp+dBc=;
        b=JJbOzww7vc+Ssvn8lEermpONS1l3aISSOsaHJZkzuQp1IHY68205rn7uMw7iQO8xcY
         B36UvaS8Tn307AcsBFWAdVF5W/4Py1SkKrqSt1ItXRp01p5cW96NxSRtK6wpjf06dTmp
         P/SXzeYGX5KpKWG+BzUSzcDXakqmysQFicsPTt9SvYKBIaIRPGtO6E6af4VAP8iGwqid
         62K3FROIU7NIDtj4oAQGVlsCiNKeh2mcTUvAM9f0HsM28eU9MJVtEiJZc49GZn9oF8Wr
         5cHE9CnW1x6zneWeiJ3r8iUSkIzeIQdWr5TH6UW4C5Zfq9kMiFowojeUlhZxFEFr/T+1
         SXog==
X-Gm-Message-State: AOJu0Yz6E7a1sTK2u5LEhjceeV8ZbnzxRkmswJfjJj4kSRBkjkeGWwFA
	xuLtraoncOgNuQULHDFvkvw1Kl6X3Rv1teF+1z0=
X-Google-Smtp-Source: 
 AGHT+IGIItJJwYORlQRXrQG7gfQ5ooIDSNWEgNp2rLh/rkXJ7icDeuvVSqIoEojB48neS29HuUSSVw==
X-Received: by 2002:a05:6512:239f:b0:50b:c2f4:ad44 with SMTP id
 c31-20020a056512239f00b0050bc2f4ad44mr1028231lfv.29.1701436836629;
        Fri, 01 Dec 2023 05:20:36 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 u25-20020ac243d9000000b0050be054b4e8sm1081lfl.121.2023.12.01.05.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 05:20:36 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 01 Dec 2023 14:20:33 +0100
Subject: [PATCH v2 04/10] ASoC: cs35l35: Drop legacy includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231201-descriptors-sound-cirrus-v2-4-ee9f9d4655eb@linaro.org>
References: <20231201-descriptors-sound-cirrus-v2-0-ee9f9d4655eb@linaro.org>
In-Reply-To: <20231201-descriptors-sound-cirrus-v2-0-ee9f9d4655eb@linaro.org>
To: Paul Handrigan <Paul.Handrigan@cirrus.com>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Nikita Shubin <nikita.shubin@maquefel.me>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
X-Mailer: b4 0.12.4
Message-ID-Hash: BQTYNTOQ32VODKB2XGBNFQF6QFRAUEEY
X-Message-ID-Hash: BQTYNTOQ32VODKB2XGBNFQF6QFRAUEEY
X-MailFrom: linus.walleij@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BQTYNTOQ32VODKB2XGBNFQF6QFRAUEEY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver includes the legacy GPIO APIs <linux/gpio.h> and
<linux/of_gpio.h> but does not use any symbols from any of
them.

Drop the includes.

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/cs35l35.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/cs35l35.c b/sound/soc/codecs/cs35l35.c
index 63a538f747d3..ddb7d63213a3 100644
--- a/sound/soc/codecs/cs35l35.c
+++ b/sound/soc/codecs/cs35l35.c
@@ -18,14 +18,12 @@
 #include <linux/regulator/consumer.h>
 #include <linux/gpio/consumer.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/regmap.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
-#include <linux/gpio.h>
 #include <sound/initval.h>
 #include <sound/tlv.h>
 #include <sound/cs35l35.h>

-- 
2.34.1

