Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 330927BCEA8
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Oct 2023 15:57:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75614208;
	Sun,  8 Oct 2023 15:56:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75614208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696773454;
	bh=/G0jexD2zKIcKQbI/PfXkbuAyRKml+7hljltMrttdtk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=DPI0Y7Qdgon3+U00IzghnksEYrNxiBqjf81oPUzViwn+ZN4su1FcmRCBQdRmA55FZ
	 iDwV4ZNCnGx5n7TeCPpGWT9B+wVAilhqGFI3adGoG43P5DBs7pvw56Fd7nCT6zSViW
	 0r5z8mKVmmlCqaZYlx089OvouNK7JH2uY/JtTePc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D49AAF80557; Sun,  8 Oct 2023 15:56:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 891FCF8027B;
	Sun,  8 Oct 2023 15:56:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B8DBF802BE; Sun,  8 Oct 2023 15:56:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
	HK_RANDOM_FROM,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 45F29F80130
	for <alsa-devel@alsa-project.org>; Sun,  8 Oct 2023 15:56:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45F29F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SsSCFuRv
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9b2cee40de8so806362566b.1
        for <alsa-devel@alsa-project.org>;
 Sun, 08 Oct 2023 06:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696773390; x=1697378190;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9nZ3UEZX/H5fd+AnU4563AsWAEhqsNM6T83YJUnEb/g=;
        b=SsSCFuRv4PzZgRMH3PWr6JrNU486+eH+uM7HLvYdnNbVX5W3MAzccNkiWioNYcWI3H
         ocUy4Oxqs2yVR/SspF3Pw0DTOMyb8SWzf9rpdqjDRRrQvSAosJcbrB73IwsRMNeGu1kr
         xfuWMglR1guUsgEWr0xdO/uLBIx4DReQ8baxdnYO1gIKN84/zrK6KUS4+R/IdwiYzNQo
         4YTaIW2NUNCdqaGZUjzFFityk+yK5fvkxDu1uTTL/G4KsFT6hg91zvETfNIDNjOFdH/+
         V1EVW5buu/7Yb/n4SNqxj2jkJ93/+gYuTiVivL+qrPwYj2FQ4IMW+o2xqTBbiu12pbQ9
         nWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696773390; x=1697378190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9nZ3UEZX/H5fd+AnU4563AsWAEhqsNM6T83YJUnEb/g=;
        b=crHfFswVChmd/x8b0TD4jywU7BT+JvbsMuvPZvjGKsrUgykqd5r3ErCEaL5dQZ8Ed1
         Ka2zPRuzWirr2c4qdybawjSay+umrw704eLxsoDwQjKKDs0kWkXaRf6EX8254bdr09qv
         kEt08p5oIhIfB1Mc5V2ptXxh1zgDymwHBxO22AdRBJ4E9anMfGcilgoCYV5k6KomeXvf
         qGFKwMKGgM3U3PAOkT3GO8xQDArGrtUA7JdbTAe7FDJT1n0Vnd3j8Fm3CuIhGUgrnhLH
         dr9UpG3yUc/j7sc7QTRKeUnmH+XzvFdZlKYDRu0wsJs1mj+t2DyW7LqFgA+H6yHnor7+
         yZzA==
X-Gm-Message-State: AOJu0YwdwR2i+rf4l0YEmf9IAxmrfl/oVXBtGuC3BOafLDwq+UOuYnKF
	r8aRSKx1Eh3s7+QHAgUT3bE=
X-Google-Smtp-Source: 
 AGHT+IG8Rly7FzpbJ/g1gH4vMA56Ssf7FxPsRBhdP2hwm1MPeAcX9KH+JQVvGbdQ+SP+Lw+vGqvBBw==
X-Received: by 2002:a17:907:2d8c:b0:9ad:93c8:c483 with SMTP id
 gt12-20020a1709072d8c00b009ad93c8c483mr7845988ejc.2.1696773389834;
        Sun, 08 Oct 2023 06:56:29 -0700 (PDT)
Received: from dell.intranet (77-255-201-154.dynamic.inetia.pl.
 [77.255.201.154])
        by smtp.gmail.com with ESMTPSA id
 ci24-20020a170906c35800b00992ea405a79sm5513503ejb.166.2023.10.08.06.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Oct 2023 06:56:29 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH] ASoC: ti: ams-delta: Allow it to be test compiled
Date: Sun,  8 Oct 2023 15:53:10 +0200
Message-ID: <20231008135601.542356-1-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: I6R2LVVKFI4TWFU4LDFXS4LHX2LH5X2B
X-Message-ID-Hash: I6R2LVVKFI4TWFU4LDFXS4LHX2LH5X2B
X-MailFrom: jmkrzyszt@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I6R2LVVKFI4TWFU4LDFXS4LHX2LH5X2B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The driver is now built only when MACH_AMS_DELTA is selected, which
requires a very specific selection of ARCH settings.  As a consequence, it
gets very little attention from build-bots, if not none.

Drop the driver dependency on <asm/mach-types.h>, no longer required since
conversion to snd_soc_register_card() and drop of machine_is_ams_delta().
With that in place, allow the driver to be built in any environment as
long as COMPILE_TEST is selected.  Take care of not selecting
SND_SOC_OMAP_MCBSP if COMMON_CLK is not selected.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 sound/soc/ti/Kconfig     | 5 +++--
 sound/soc/ti/ams-delta.c | 2 --
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/ti/Kconfig b/sound/soc/ti/Kconfig
index 593be22503b5..e22e41af3226 100644
--- a/sound/soc/ti/Kconfig
+++ b/sound/soc/ti/Kconfig
@@ -125,8 +125,9 @@ config SND_SOC_OMAP_ABE_TWL6040
 
 config SND_SOC_OMAP_AMS_DELTA
 	tristate "SoC Audio support for Amstrad E3 (Delta) videophone"
-	depends on MACH_AMS_DELTA && TTY
-	select SND_SOC_OMAP_MCBSP
+	depends on MACH_AMS_DELTA || COMPILE_TEST
+	depends on TTY
+	select SND_SOC_OMAP_MCBSP if COMMON_CLK
 	select SND_SOC_CX20442
 	help
 	  Say Y  or M if you want to add support  for SoC audio device
diff --git a/sound/soc/ti/ams-delta.c b/sound/soc/ti/ams-delta.c
index 371943350fdf..7436cca2d2e0 100644
--- a/sound/soc/ti/ams-delta.c
+++ b/sound/soc/ti/ams-delta.c
@@ -16,8 +16,6 @@
 #include <sound/soc.h>
 #include <sound/jack.h>
 
-#include <asm/mach-types.h>
-
 #include <linux/platform_data/asoc-ti-mcbsp.h>
 
 #include "omap-mcbsp.h"
-- 
2.42.0

