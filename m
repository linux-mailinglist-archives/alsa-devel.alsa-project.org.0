Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A96AA7BB9C9
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 15:50:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A2A51EB;
	Fri,  6 Oct 2023 15:49:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A2A51EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696600211;
	bh=hNwobKa48WJv//EchZDoR3HbTlqXpOazNxNUHgFwOlg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YXD6Z5DqExgXtwsOE5ecoW4DXX68z6gZ3k1KD9+E9qv8H81xA3ylfdMGjzlqWMpvu
	 gGr+hsrXijkfibErutHrOiiJQAGmYOkY6wMh23QkImHf9ozHpJymU0j2yWaigcxg47
	 2R2E6qQkNes6GtDLIeyCLcY/5wQZzNSyxCkJzb60=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60A15F805DA; Fri,  6 Oct 2023 15:47:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE459F80551;
	Fri,  6 Oct 2023 15:47:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FDFAF80558; Fri,  6 Oct 2023 15:47:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3F6FEF80551
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 15:46:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F6FEF80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=c3MT7Oyp
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5046bf37daeso2812076e87.1
        for <alsa-devel@alsa-project.org>;
 Fri, 06 Oct 2023 06:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696599991; x=1697204791;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yLHdfqqmxuwlIGJBiB8XcSmFMMCFwMYGv/NG27m7YvI=;
        b=c3MT7OypBKgNEHROtyVLUd6tAf1XC7qKoSzFaw9gUbRtnN/932+3mVLMldbozSAHda
         9fD6Y/CsDcVtgqfnVZNGFfsjoWsg+O3sUFo6rBmide+6bYzQZQWInO/0+4Gj/Lr8p3W4
         VcfSt4vlhg53oXl3UNf3eA5SK5LqS9ma2LhckV6DkEAbqlKquDsFZoaxQgHLj/PIC0Xn
         BikJ/w5XPCrnbo4U9zPa/je+jZjV5OTy3O/HUFgzMvO+Af3XXmVFKxhUxPHDZn31z83i
         VhiUJI3t1caSfnrIfgWGIjL73DSa60PRxDZDbNQFn75SYGLt8a7KUBJi5fnaxcCTxEiV
         1HzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696599991; x=1697204791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yLHdfqqmxuwlIGJBiB8XcSmFMMCFwMYGv/NG27m7YvI=;
        b=XAv/nyiO/xb6tnx9IlhfiD0oS/Nxltw4aFSOrnykcTtIq8De/xnPJjdZZU15dWYbrS
         IbTE5m16ID2lIlmdqKB9NV91QknkgdHZ3X+F2RHAj22u3JHKcO3XcrWd/r4FjKruESwi
         UOp2Z0ginr4i0JXaL+vG8jPvHBfuycgz7vAhmdV/TxO2V4gK0JEXTaAfq5PZKGoqICiG
         3i1n3d49UrwxrvvWon4aiSed2OtjsGBS1FC5Ku2lnFMkv+GmURpMWyyvADIvqGyEyHne
         68j8zMzyld96CohOC5pf99C/8fxceNgo9KLBoXbEbnIlTSYYZaO67XVcjthYs61NMvbo
         xu4g==
X-Gm-Message-State: AOJu0Yyn0O/z1fo+7KIucLd8Nx/5USYuyEBkY0jXSWwV6mufYXmcZH4a
	dp4ObfkPZhGLQvQ372FSXUjPQULvrkjEJuAv2dY=
X-Google-Smtp-Source: 
 AGHT+IHH6cMZMIc0p+3s1aNepbYLEIdwjOGFxWA8k3GZHEzIsKgLBMyNC5q7KJmT2KWbBpAGygbDMw==
X-Received: by 2002:ac2:5e21:0:b0:502:ff3b:766f with SMTP id
 o1-20020ac25e21000000b00502ff3b766fmr6194209lfg.6.1696599991178;
        Fri, 06 Oct 2023 06:46:31 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 v25-20020a197419000000b004fe37199b87sm308733lfe.156.2023.10.06.06.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 06:46:30 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 06 Oct 2023 15:46:27 +0200
Subject: [PATCH 4/8] ASoC: mt8173-rt5650-rt5514: Drop unused includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231006-descriptors-asoc-mediatek-v1-4-07fe79f337f5@linaro.org>
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
Message-ID-Hash: ZVQ2255CVDZTSAFXFNEYG3MAUXH6IAQE
X-Message-ID-Hash: ZVQ2255CVDZTSAFXFNEYG3MAUXH6IAQE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZVQ2255CVDZTSAFXFNEYG3MAUXH6IAQE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver includes the legacy GPIO header <linux/gpio.h> and
<linux/of_gpio.h> but does not use any symbols from either of
them so drop the includes.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
index e502cd1670ba..0204b461e291 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
@@ -7,8 +7,6 @@
  */
 
 #include <linux/module.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
 #include <sound/soc.h>
 #include <sound/jack.h>
 #include "../../codecs/rt5645.h"

-- 
2.34.1

