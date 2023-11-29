Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2F37FE1F9
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 22:31:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4F6FA4C;
	Wed, 29 Nov 2023 22:31:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4F6FA4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701293485;
	bh=3FXG0vtiZoVZey0ixVUNXZYFJ25iiFYU/d0IDpmfrOA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Wkmt8ztPIResDHSuqbj3yioD06QZZNRh0BoM/JjpcO4d7F/WMl7nJdFS7wWE7R3NH
	 W8UqMtGJv9inHprlIq9KaNMLQTmDPDxJy/d57p2OUGsCygS+JHI95ekPIiBLR05XA8
	 DwCBeXH1o44tbGwhLUkDb9MrlBbEY6JPlJ5wnafY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21C81F8056F; Wed, 29 Nov 2023 22:29:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CEECF806B1;
	Wed, 29 Nov 2023 22:29:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F4C1F805F7; Wed, 29 Nov 2023 22:29:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B57B9F80166
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 22:28:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B57B9F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=FEUfx9xv
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2c9c5d30b32so3510191fa.2
        for <alsa-devel@alsa-project.org>;
 Wed, 29 Nov 2023 13:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701293332; x=1701898132;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GU757npNrUowgHMI8BxiU0vGtre+9oPF8HlBVHP1/Qc=;
        b=FEUfx9xvisxTxXHnGouBhINO923PeCCoGMkK2KsVqGalu4AqdBpTgvfVPAxb3mp3uf
         rUgqaFk7cwtQq+qCJ15K6D0J3aLdT2kr4Zt1DbXvdWAXlQTRV5JkMdiltMRLpi381lHh
         PjvNdT1DU5IZp3VVyTQgLeyS5ke/dlHDc1DNBfvGbZU0mpEqDvSBinroz63ae29hM0dU
         dUk3rFeHQ6OD6oGtKj/QB0zTq27+hdTHCPFR4wb6PcTlGV/s68MV+94kbeuziYfyZNr4
         SuzXyBItRyBOYZaCgXC4d7fSLO5/Fii1NDXnS6i2mFUNVyzAZOUu/GgKeYFbchOo0Q1D
         yqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701293332; x=1701898132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GU757npNrUowgHMI8BxiU0vGtre+9oPF8HlBVHP1/Qc=;
        b=xHvv7xbg9VyoI5b/Qq7lzVfY8NMLTWCJmmY2w7XyUa87sEpoxvncvgHzf5apUxYYlH
         AvP1n9ynN4qgItpkOtKZOhZTcxDNJn097ydX8dNBbiy92v7o4pYi8OY2Ppg6m5juv7K0
         SJOsFhI2jiXA8Ytdsx5Q7BCN5y5ssn8HAkgcGs6qCrNIDJ94U50/71D2yrynPMp9KM4K
         hSGOTuOTLyJa/3+lpa+iZ06HpsHLHMm4evEzNLKeK2m2x6xkwfoWEUOxYl/Lz4AUEZse
         ln2cjcTMfrsiRk368A1dpT/UKTgldkjR6iIp/rRwbOqHorFIV10UF7peYB1FWPM/algh
         5Oug==
X-Gm-Message-State: AOJu0YzzVZFpnpG1pFVm12p5GXJM/XVYjiPkMjMsQ1Ti2cAQoNpurUrK
	f9+mv1sm3QOWW4wPuIftG76TMw==
X-Google-Smtp-Source: 
 AGHT+IEdyUI6Rv6RH6eVMr/I17nk4CK9OjZr5lyleg/5SJIpqBPmIm2LRa2NEJpv2cv9yqxd+ociMg==
X-Received: by 2002:a2e:7203:0:b0:2c9:bf97:81d1 with SMTP id
 n3-20020a2e7203000000b002c9bf9781d1mr1989104ljc.27.1701293332163;
        Wed, 29 Nov 2023 13:28:52 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 b5-20020a05651c032500b002bcdbfe36b9sm2106196ljp.111.2023.11.29.13.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 13:28:51 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Nov 2023 22:28:45 +0100
Subject: [PATCH 09/10] ASoC: cs43130: Drop legacy includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231129-descriptors-sound-cirrus-v1-9-31aa74425ff8@linaro.org>
References: <20231129-descriptors-sound-cirrus-v1-0-31aa74425ff8@linaro.org>
In-Reply-To: <20231129-descriptors-sound-cirrus-v1-0-31aa74425ff8@linaro.org>
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
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4
Message-ID-Hash: SIPAZWARAENUODK7ASKW34AHMS744XII
X-Message-ID-Hash: SIPAZWARAENUODK7ASKW34AHMS744XII
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SIPAZWARAENUODK7ASKW34AHMS744XII/>
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

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/cs43130.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index 0b40fdfb1825..18933bf04684 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -11,7 +11,6 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
@@ -26,7 +25,6 @@
 #include <sound/soc-dapm.h>
 #include <sound/initval.h>
 #include <sound/tlv.h>
-#include <linux/of_gpio.h>
 #include <linux/regulator/consumer.h>
 #include <linux/pm_runtime.h>
 #include <linux/completion.h>

-- 
2.34.1

