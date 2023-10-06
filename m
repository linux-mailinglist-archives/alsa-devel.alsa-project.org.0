Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F867BB9C4
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 15:49:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A09E984A;
	Fri,  6 Oct 2023 15:48:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A09E984A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696600169;
	bh=D5wJF8Kl+0W+9ZF9ftGiGUTlc1RzB7q5Omx1h3kSWM8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tPkrp3eCE6cq+d4Q6LFdzbiloPIGQuT9HtBqmys2I8UZWRwvjOjf0hEBC+gzfq7SH
	 smhwYYbjfqgsg0glvtcU8L1WmAnaMbnoUYcnglHrN5kevfSKCL3TTrR3U0X/TYweh6
	 x7jBtaZ2bHpdlsN42T+mBTJNzDEltyE6QXPKyrgo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA7DEF805C7; Fri,  6 Oct 2023 15:46:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71BD3F805BF;
	Fri,  6 Oct 2023 15:46:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 292B0F8055C; Fri,  6 Oct 2023 15:46:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D814AF80557
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 15:46:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D814AF80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=t5CathXC
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-50435a9f800so2794156e87.2
        for <alsa-devel@alsa-project.org>;
 Fri, 06 Oct 2023 06:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696599995; x=1697204795;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LbIwSXH6FjrGWEWkB8T6Lc3o+IPSoQUzJoJygEsVP2Q=;
        b=t5CathXCtsdrl7e5vw0+/oBHpjQc9ixCxxktx95yUYJ4kyNWhYbrEvAkH687hPgwrU
         CTsXTxp8SIA1q2cv1str6MYkBjuVyrcpE5VRiUNwYtwMZYRA1NPeGkgFOAXgTSj0J3w/
         dymClTHpg79QFiKFnAaosRwH7OGLVAXlvzTMnEwQpTUAyBk2jLEzxnZd8UGY2ANadyrv
         3KcgY0YoG6k2qfHGSDDCR7tXF7U8EWCthXRyHsIC42EPrXGAUaHKRG3eV5JU17xJtV1t
         cQzxP4gY+aPrcoRxdgSjldXaHpWHoKbnafgYlYciiq0VCHni+xTCWee83TR7T3d8ooWB
         bjLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696599995; x=1697204795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LbIwSXH6FjrGWEWkB8T6Lc3o+IPSoQUzJoJygEsVP2Q=;
        b=WOMnkc5In5ndD6xhxyleUof2I1QiXhaQERaQnxG6f+rp5ZRCStnXFfoWBB9JVbERK7
         smYp/aZpaa7baOF4qIuvuonwKBWVtg03PFdmDVlfYYMRM8UP1dlazJlSG8Rcx4ktxQTp
         /i/Rge5JcPT4+jF4etDLcPACw/6xPlHEEBhLALNm6LIotMUjLaIIk3OM3+5WCTWWMmOs
         BhLshwrtzRBke3rWYEylCEbblwFVdzLASUQcwLjD5hcDbUZuX+HLtIo3i4YIAxVSKowH
         p+LosV0923D5LLL2PXYqS3w0l9OU9AmINzoa+kJfPehjRaOaxXDWCaeRSoCw8jfThadD
         JxPw==
X-Gm-Message-State: AOJu0YyhNAYZIRaUJ8XgO6wjUOJ93dWCPIzZQtTBzS7rqTEkqSFm+cJP
	kjbBI183y/9UsCVLlurTujWvag==
X-Google-Smtp-Source: 
 AGHT+IFoek3UspuoDg2fClJUEjov1EeEFdmzeEDd5y8Kje8woAv95XAU2HD1vvAKiP/TapL6Jc3a7g==
X-Received: by 2002:a19:5e06:0:b0:504:4165:54c1 with SMTP id
 s6-20020a195e06000000b00504416554c1mr6124350lfb.7.1696599994954;
        Fri, 06 Oct 2023 06:46:34 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 v25-20020a197419000000b004fe37199b87sm308733lfe.156.2023.10.06.06.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 06:46:34 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 06 Oct 2023 15:46:31 +0200
Subject: [PATCH 8/8] ASoC: mt8192-afe-gpio: Drop unused include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231006-descriptors-asoc-mediatek-v1-8-07fe79f337f5@linaro.org>
References: <20231006-descriptors-asoc-mediatek-v1-0-07fe79f337f5@linaro.org>
In-Reply-To: <20231006-descriptors-asoc-mediatek-v1-0-07fe79f337f5@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 alsa-devel@alsa-project.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: EXDAF7L5FSTKOC3D7KJF4O2PCS7YOZFG
X-Message-ID-Hash: EXDAF7L5FSTKOC3D7KJF4O2PCS7YOZFG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EXDAF7L5FSTKOC3D7KJF4O2PCS7YOZFG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver includes the legacy GPIO header <linux/gpio.h> but
is not using any symbols from it. AFE has a custom GPIO
implementation that is not using the kernel GPIO framework.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/mediatek/mt8192/mt8192-afe-gpio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
index 165663a78e36..de5e1deaa167 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
@@ -6,7 +6,6 @@
 // Author: Shane Chien <shane.chien@mediatek.com>
 //
 
-#include <linux/gpio.h>
 #include <linux/pinctrl/consumer.h>
 
 #include "mt8192-afe-common.h"

-- 
2.34.1

