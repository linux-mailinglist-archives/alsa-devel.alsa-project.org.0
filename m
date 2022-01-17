Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F244900F6
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jan 2022 06:04:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AF15173B;
	Mon, 17 Jan 2022 06:03:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AF15173B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642395880;
	bh=nqh2rSVAHCoQ0rYPXu5YduRRam2f0xsNIiOJKiP4ezU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JBQyEAKAflBAwQV7dLDSmkhAIyNJ87cKKesBcVN8mJAKZwAjGlmi20HzRNL5mGWJm
	 fwuiFCJwUwxK/02EcLZGC7ujZsRUlIz7IPuRMnSxWcMs7q53lKVNJH0uSk/vLL0+sq
	 7BuprN4sPZ35Rj9qLSYWZsp+mUT820ild9CVJvgs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A36E2F80254;
	Mon, 17 Jan 2022 06:03:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70BCBF80249; Mon, 17 Jan 2022 06:03:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com
 [IPv6:2607:f8b0:4864:20::929])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA727F800CE
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 06:03:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA727F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Pe8h9X12"
Received: by mail-ua1-x929.google.com with SMTP id w21so18899058uan.7
 for <alsa-devel@alsa-project.org>; Sun, 16 Jan 2022 21:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FiX6saUHa8tVXRR2pHw4nDfUBFLj+hL82kG5LF2eBdE=;
 b=Pe8h9X12WGtdQqLsjvkYCgh9YwVwNQuiyWCD+D2ElDyMJEpxjbgr+/kWvuhVCNuBSd
 lCwAseOQfu1D7csJyUCRDAFi3oWkZ+40OCZTXmHZ0zlm/8LRQJ5Azerhk43bixsiq+ND
 eRDh0lAxFiQvOT1siqzq+AP472Sr+UMTMpAVWUlczMTRqZk9JOxp6Ad9R6HLJeE8i2IK
 ON4rwGJc3vUyue1cZwO2b6nYWD1xrObw2ydur/Zcn/e9UzlSPOs8c4oS4fKbJSP8ut4J
 b5j4Jn43pvSZ/Y55Qj6o4ujfNItonT+WjEKYL5qrTmiywCLAW1C8+oylFsQAx9l6P0E2
 Bn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=FiX6saUHa8tVXRR2pHw4nDfUBFLj+hL82kG5LF2eBdE=;
 b=CQo5MbD9uh6AhZla1uj40lnJzSl3UVfnbHTwDdzNLaAgJX70xP6ipsfakABP87gkOw
 j7cIaDXNeFM0ZYlLawudEVDhwR3adi7HoGzKxLpFgdS/kMPCihmNCxpGEHjr0izgBmGT
 SnPB7E0g8wdNVyBv7s6rBwQnoK3gASHz+t+r80QFJN1AqtMXHhTh2c6A3Lwj1T7xCJRi
 cPK6Hc7flX+JTafb2EQon+K4gvjcHGK6ZZ3jFx8wt7CMbr63KJ8VKNrYIAMaOfV+Kwtr
 DznX3MKWJxpvU/gyXxB/BvqqfMK27HOOitgQr+FKEf3tG1ns5SF9QM84HX9vzaC7bi++
 N9/A==
X-Gm-Message-State: AOAM532YW7vslTT1KQXcNmrnnAK0878HqDLVsxu3KbGMj1kB6kBwxHSa
 BnH/NXSES50bGGhn2RkhuDI=
X-Google-Smtp-Source: ABdhPJz76tG0q0wKXnD43AKOEaEGErm27DJnaqkJ7NI14WMk3UwR/gAtlSgheL3vdfuM0t+KzW6FhA==
X-Received: by 2002:a9f:25b6:: with SMTP id 51mr7935322uaf.111.1642395806522; 
 Sun, 16 Jan 2022 21:03:26 -0800 (PST)
Received: from kubuntu-desktop.. ([67.8.38.84])
 by smtp.gmail.com with ESMTPSA id k77sm1012686vka.20.2022.01.16.21.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 21:03:26 -0800 (PST)
From: Julian Braha <julianbraha@gmail.com>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 matthias.bgg@gmail.com, trevor.wu@mediatek.com, tzungbi@google.com,
 geert+renesas@glider.be
Subject: [PATCH] ASoC: mediatek: fix unmet dependency on GPIOLIB for
 SND_SOC_DMIC
Date: Mon, 17 Jan 2022 00:03:24 -0500
Message-Id: <20220117050324.68371-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: fazilyildiran@gmail.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

When SND_SOC_MT8195_MT6359_RT1011_RT5682 is selected,
and GPIOLIB is not selected,
Kbuild gives the following warning:

WARNING: unmet direct dependencies detected for SND_SOC_DMIC
  Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && GPIOLIB [=n]
  Selected by [y]:
  - SND_SOC_MT8195_MT6359_RT1011_RT5682 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=y] && SND_SOC_MT8195 [=y] && MTK_PMIC_WRAP [=y]

This is because SND_SOC_MT8195_MT6359_RT1011_RT5682
selects SND_SOC_DMIC without selecting or depending on
GPIOLIB, depsite SND_SOC_DMIC depending on GPIOLIB.

This unmet dependency bug was detected by Kismet,
a static analysis tool for Kconfig. Please advise
if this is not the appropriate solution.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 sound/soc/mediatek/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 9306b7ca2644..0d154350f180 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -216,7 +216,7 @@ config SND_SOC_MT8195_MT6359_RT1019_RT5682
 
 config SND_SOC_MT8195_MT6359_RT1011_RT5682
 	tristate "ASoC Audio driver for MT8195 with MT6359 RT1011 RT5682 codec"
-	depends on I2C
+	depends on I2C && GPIOLIB
 	depends on SND_SOC_MT8195 && MTK_PMIC_WRAP
 	select SND_SOC_MT6359
 	select SND_SOC_RT1011
-- 
2.32.0

