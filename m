Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C0E490106
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jan 2022 06:11:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD81D1747;
	Mon, 17 Jan 2022 06:10:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD81D1747
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642396281;
	bh=+RFQ5HaRhMFNji5eT3Sf6rqaQH5nM8ABDkQ+E7ruZQo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Py+nHBpxgYvzF4subNAh7jL48rxmkZ6xJJ2XNEyPV/SB6KGlMJoQvY9nzI2PA3Yhk
	 x5zQlPDfe/Q1Vcj6OQyedIFID0SfLzrO9metG4yFiuLpBFSczIvlX2cwMkdvEAI8lw
	 ytW91EccnGAtfrpQ7TRJFMBjBCpCCrGuc4N8QpBw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F6C9F8025D;
	Mon, 17 Jan 2022 06:10:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BAA84F80254; Mon, 17 Jan 2022 06:10:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com
 [IPv6:2607:f8b0:4864:20::a2d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41513F800EB
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 06:10:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41513F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Wp3wRPz+"
Received: by mail-vk1-xa2d.google.com with SMTP id v192so6650201vkv.4
 for <alsa-devel@alsa-project.org>; Sun, 16 Jan 2022 21:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VVMSvibBEDQWmTS4Y5AZX2LAQUp1loCiB0WTviYsyCk=;
 b=Wp3wRPz+YyRwJiNCgcQ1UGidIy+Nwa2YffuUNaXCKfkVGDhJCJ5WIu4mHaoh3UXrF9
 41NqRlnXBQfBvfZ7YC8spNt4xR4glQMU1VbvTkl3ovutQZkIIdPh0Dgpti5yo0RlGVFA
 pSGBKuW8baLlQRLOSJSx6mPdj1f90VLiFJWq8UzHGvQVyu/MPmhYt9afH7Ri0S6XrHi7
 DfmNkcZqTJJRyqpXRhsQ+h66uW20gdwqd30U9ZgsmQemyzExhkJcx4ODI+ezcMPyidiF
 SrizIKUgtFFiSWUh2HUn8jBmLZpEiIe1Q522+9PwaCA+txKXMwvnjur8LZAePLhS5egS
 l42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=VVMSvibBEDQWmTS4Y5AZX2LAQUp1loCiB0WTviYsyCk=;
 b=KnKi+tbXp22BNGbuSBPCvqjPBmclP9O6/Rg6RMT4bk9HuSzu/iywTYinkhX7clb45r
 ZtyJ9Sp1u4rQ2CCCe6AFhJVboRQXVwNy8hjpm+5LXo/R5qLE7il9+OE7xFmKN7Ej4JhH
 0EiUl8LQ0AsvWd6uGKSzqSnUEJ2xGqF7IYyxjdNFZI0Jgga2BUjTPYHoFPd5trpiCfVJ
 Mg80TiFtYX509Q0Ppui8P6CS0PvPNW7uLvLGhKsTt9EEZgMp/g9HnpLkSMGZ6R9I5+BH
 WFzFR2kLRW8k7obVU05qVsfRz5RzFOmlkRfFsDvWsp/48Y6v9D2/SCsgKI3Bi4vKP1i5
 Dp6Q==
X-Gm-Message-State: AOAM5331i/dJIMcKspCoU5aSfExlsVKVtre8TOEzsEzQ+F1iKTUHXlh7
 TcePFYvhfiLQVU9PrgZ6Q40=
X-Google-Smtp-Source: ABdhPJxsGuOnDKIZ3OkIIR5d038ZKXPOcXRRRKUP/O6Gfk8vqlxZaG0VpNTjIN7SEL/jiT7/HewuUQ==
X-Received: by 2002:a1f:fcc9:: with SMTP id a192mr7446632vki.1.1642396204346; 
 Sun, 16 Jan 2022 21:10:04 -0800 (PST)
Received: from kubuntu-desktop.. ([67.8.38.84])
 by smtp.gmail.com with ESMTPSA id d124sm3543878vkb.9.2022.01.16.21.10.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 21:10:03 -0800 (PST)
From: Julian Braha <julianbraha@gmail.com>
To: broonie@kernel.org, olivier.moysan@foss.st.com,
 arnaud.pouliquen@foss.st.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Subject: [PATCH] ASoC: stm32: fix unmet dependency on GPIOLIB for SND_SOC_DMIC
Date: Mon, 17 Jan 2022 00:10:02 -0500
Message-Id: <20220117051002.70270-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

When SND_SOC_STM32_DFSDM is selected,
and GPIOLIB is not selected,
Kbuild gives the following warning:

WARNING: unmet direct dependencies detected for SND_SOC_DMIC
  Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && GPIOLIB [=n]
  Selected by [y]:
  - SND_SOC_STM32_DFSDM [=y] && SOUND [=y] && !UML && SND [=y] && (ARCH_STM32 || COMPILE_TEST [=y]) && SND_SOC [=y] && STM32_DFSDM_ADC [=y]

This is because SND_SOC_STM32_DFSDM selects
SND_SOC_DMIC without selecting or depending on
GPIOLIB, despite SND_SOC_DMIC depending on GPIOLIB.

This unmet dependency bug was detected by Kismet,
a static analysis tool for Kconfig. Please advise
if this is not the appropriate solution.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 sound/soc/stm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/stm/Kconfig b/sound/soc/stm/Kconfig
index da1f7a16605b..bfc11b606bbd 100644
--- a/sound/soc/stm/Kconfig
+++ b/sound/soc/stm/Kconfig
@@ -37,6 +37,7 @@ config SND_SOC_STM32_DFSDM
 	depends on ARCH_STM32 || COMPILE_TEST
 	depends on SND_SOC
 	depends on STM32_DFSDM_ADC
+	depends on GPIOLIB
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	select SND_SOC_DMIC
 	select IIO_BUFFER_CB
-- 
2.32.0

