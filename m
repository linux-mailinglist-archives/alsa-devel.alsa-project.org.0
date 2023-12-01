Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20068800BBA
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Dec 2023 14:22:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B277ADF3;
	Fri,  1 Dec 2023 14:22:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B277ADF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701436959;
	bh=GefnZjYNxVGqWTPDtMdCFkCbRrC5ZFPfiZrAwKmB1UI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E5wo5m9OhQaxpo9TSUKflnFPdaXZdICjzp07f5DgZoS7f+hyS3Uk62BuNEPt90CFH
	 sGvAkl77EHBDpCqghEDWeJ3ZHGnFINeaF0Fq4Z/H+XUpPc/xKbvxsRVldZ2FDF4gW9
	 FALivwROdUt371DSfS+/TUBMvv09gtCiqr4IXnJA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F215BF80673; Fri,  1 Dec 2023 14:21:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0CB9F8065C;
	Fri,  1 Dec 2023 14:21:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 701ECF805F4; Fri,  1 Dec 2023 14:20:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 36AFBF80254
	for <alsa-devel@alsa-project.org>; Fri,  1 Dec 2023 14:20:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36AFBF80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=jje8AK8i
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50bce78f145so2344494e87.0
        for <alsa-devel@alsa-project.org>;
 Fri, 01 Dec 2023 05:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701436843; x=1702041643;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+fvbs0Xp4GpuorKL8Tfj6BakgsRgukno1Vk7LhvLiBQ=;
        b=jje8AK8i22QVf61QAmd+e1C2cgJxsQMBgYTh1VEsik3eiK/c0E4Kd4PJxdA1UwqHtI
         4VeJCaXYNVjYKhcexaE9a0ItIhsD+LkZyTs14Bs70xwoEIPaS+Fs9+5Qp16ByxYEaovk
         msU7KuVgFVd8BehWTf+bVdnLyWSG8TdjOt5SVb2IgiVcG7ihKSuS84zJAVO5xML02DCk
         nAuRio79PF0x0XIlVpADzLNuYIbm5DAk7LeAknQu4midZucAvEeJzr7Kt2IG/p7LJoAc
         btr0UIZ0uhzIgpC4cqbYl6NzvFdV2+GLyQjHHIfhDPCz+ofUue9/zETUPOsL9mGq+Mv/
         +quw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701436843; x=1702041643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+fvbs0Xp4GpuorKL8Tfj6BakgsRgukno1Vk7LhvLiBQ=;
        b=GwbkBD5pffxBpCCaoXVsq/3sObI5E8lWxgYJSLSrDL4qxNByZk/eCnLrHqY6NdEUvs
         X7Lzfq4vugCqIoQCsUpuz0QCWIz+94aYRBSyumzlJIcH2MgI0PcHWMBowoXTOhS8vMvg
         jEVy5d5X5oyPrOcmol7o2tCQDY9m8IySiK0rYwuOMJ37z3sE5dt6u1B1mI1vbJ2On3n2
         Rl5RoBj+yIu2MoyZK2AqFC295ZflkFsRyaVk3A7ToGUjdP4iRC0wcYYW5+VZtCpNRrOV
         y+6Th4Hkbq8yB/twQRraLp8xkYE1TsNU5kz9I11HHt5WTJBewoTcHuFDBAnh6BQJrhUo
         Ycxw==
X-Gm-Message-State: AOJu0YxEhznftxMmsD062y7Lp9b0SSLO4gUfiFVGZFI9QI/MhrcmWcUd
	aHf5oxqiXlIgYCz7NHgULTKuL8XENPIMMYUe7E8=
X-Google-Smtp-Source: 
 AGHT+IHtjQtt799xLpoVCezjOYP5wu/F6yl+pLI9Fcs3e2ywoijlCxrF0bm3T9nOT+wMNRQXj8UvwQ==
X-Received: by 2002:a05:6512:1046:b0:50b:b9f3:9fc6 with SMTP id
 c6-20020a056512104600b0050bb9f39fc6mr534218lfb.54.1701436843083;
        Fri, 01 Dec 2023 05:20:43 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 u25-20020ac243d9000000b0050be054b4e8sm1081lfl.121.2023.12.01.05.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 05:20:42 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 01 Dec 2023 14:20:39 +0100
Subject: [PATCH v2 10/10] ASoC: cs4349: Drop legacy include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231201-descriptors-sound-cirrus-v2-10-ee9f9d4655eb@linaro.org>
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
Message-ID-Hash: AZQZLAGPHQSHVNQ4BT5JJWT6QD2KB6WC
X-Message-ID-Hash: AZQZLAGPHQSHVNQ4BT5JJWT6QD2KB6WC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AZQZLAGPHQSHVNQ4BT5JJWT6QD2KB6WC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver includes the legacy GPIO API <linux/gpio.h> but
does not use any symbols from it.

Drop the include.

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/cs4349.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/cs4349.c b/sound/soc/codecs/cs4349.c
index 9083228495d4..ca8f21aa4837 100644
--- a/sound/soc/codecs/cs4349.c
+++ b/sound/soc/codecs/cs4349.c
@@ -13,7 +13,6 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>

-- 
2.34.1

