Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F9B271DED
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 10:27:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C6A017EF;
	Mon, 21 Sep 2020 10:26:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C6A017EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600676855;
	bh=EEM99riwTvUHxfmDwjStK4pTCU0mJ095/iumT0sU8zw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XzJsVPk+ufbb6CVwzDZ7WVMx3RdbiR0ldLsQ5FOa5RjmAz7d2Fg8hTRueBFXtj1QJ
	 P8MZoD67QnI3tv2rWzSKQIlZ1VWJoqPNl/DI9Ca6jgswlu/ScQB96tOUjPSNG4tTdG
	 eG8bCuJ0yeNlKYDgf1CjVlVX47qSGd+NI9E/Serc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 665ADF803CB;
	Mon, 21 Sep 2020 10:11:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1CC9F8015A; Fri, 18 Sep 2020 15:14:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 499F0F8012D
 for <alsa-devel@alsa-project.org>; Fri, 18 Sep 2020 15:14:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 499F0F8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="aYwKf0it"
Received: by mail-ej1-x643.google.com with SMTP id lo4so8032282ejb.8
 for <alsa-devel@alsa-project.org>; Fri, 18 Sep 2020 06:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h9RM0lB/HRjVWapVwauDh3GcmVkeqJuprfSIbmmhiDw=;
 b=aYwKf0itNWEbbNcpboiYR4ONcLbgu3ObEd8tjxkeDdZnZ6Ev9olACStb/a/TzbN+BN
 ZU15wqlx+uG+mxetzn8hNmbTk/gvwv/O3ujdy+KQJFSU3BBEB+I5Sz4NzI+Ez2SlOjeC
 DIqh08RTMQyIXUIgIAgggQEAO4t2wFb2dC2cvPKkV2/Pkh1VIko0DXj+V0h/FX9P4ZKO
 Kr9kzPae0p5JquoI4C/TMHIcE4BYyzrB5GK8L8z6wQ9eRcJ4VFCtHWtVBVlz7eqcLaHI
 VP59D/Ztj/r6qADoQ3AAUSKlHMTeEJ9Q4Ynp4lEGxCBIIl0JaQFUjRGST6mssueHLRHQ
 Uyzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h9RM0lB/HRjVWapVwauDh3GcmVkeqJuprfSIbmmhiDw=;
 b=e9MwVweie18kCesrUq/xQMmfN+EmLs0bn1YAAwhq+Qpfi4/Ngie0rAgrGgXYUR6853
 AF4TP9MmclFWefxgPy8oEgZinVY1mXAYmDsXywHXVGMysJsuOZTxPqLtcxNvntRjb2MF
 C81Kp9F4j+clu7CTngCsLamNUEgImkfiU/fuomGAyG3qgVqzbxMYDaB0Kt47rlHTptJP
 cqdRu5WSQC4qWAelxPQtrnhqB2tZ5rg3hhZWXM8fQNTY5hailtInwbpVwy73fe1JiEoW
 G93q2dBrEd3SeqepzELtrHe04DaLARGMMfk3jN/abBZ53OGI9/7LKFcrp2uqfvWtAKio
 5h3Q==
X-Gm-Message-State: AOAM530cQ8RjnfPF88F1tCvWfw+8wuguDzJxJL68EJiuYmsfxWmRq9bN
 LPSGUpdCHHXSQgdMDOFwexQ=
X-Google-Smtp-Source: ABdhPJxFvCYXn6QKQxQjig9/JET66Bd4HCmh6BMLITBLNBgrZEU132Msm0GVujJ6ehpBMuGZV8HT3g==
X-Received: by 2002:a17:906:cf8b:: with SMTP id
 um11mr37458262ejb.540.1600434848122; 
 Fri, 18 Sep 2020 06:14:08 -0700 (PDT)
Received: from localhost.localdomain ([85.153.229.188])
 by smtp.gmail.com with ESMTPSA id s14sm1530082eju.84.2020.09.18.06.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 06:14:07 -0700 (PDT)
From: Necip Fazil Yildiran <fazilyildiran@gmail.com>
To: broonie@kernel.org
Subject: [PATCH] ASoC: fix kconfig dependency warnings for SND_SOC_WM8731
Date: Fri, 18 Sep 2020 16:12:58 +0300
Message-Id: <20200918131257.5860-1-fazilyildiran@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 21 Sep 2020 10:10:23 +0200
Cc: paul@pgazz.com, alsa-devel@alsa-project.org, jeho@cs.utexas.edu,
 linux-kernel@vger.kernel.org, Necip Fazil Yildiran <fazilyildiran@gmail.com>
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

SND_SOC_WM8731 was made visible and dependent on other symbols with commit
1291e14175e6 ("ASoC: codecs: Make OF supported CODECs visible in Kconfig").
To this respect, the symbols selecting SND_SOC_WM8731 turned out to be
overlooking its dependencies.

For example, enabling SND_SOC_DB1200 and disabling SND_SOC_I2C_AND_SPI
results in the following Kconfig warning since SND_SOC_DB1200 selects
SND_SOC_WM8731 but does not account for its dependencies:

WARNING: unmet direct dependencies detected for SND_SOC_WM8731
  Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_I2C_AND_SPI [=n]
  Selected by [y]:
  - SND_SOC_DB1200 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_AU1XPSC [=y]

Switch reverse dependencies on SND_SOC_WM8731 to normal dependencies.

Fixes: 1291e14175e6 ("ASoC: codecs: Make OF supported CODECs visible in Kconfig")
Signed-off-by: Necip Fazil Yildiran <fazilyildiran@gmail.com>
---
 sound/soc/atmel/Kconfig | 7 +++----
 sound/soc/au1x/Kconfig  | 3 +--
 sound/soc/pxa/Kconfig   | 4 ++--
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/sound/soc/atmel/Kconfig b/sound/soc/atmel/Kconfig
index 71f2d42188c4..abb1284835c0 100644
--- a/sound/soc/atmel/Kconfig
+++ b/sound/soc/atmel/Kconfig
@@ -44,8 +44,8 @@ config SND_AT91_SOC_SAM9G20_WM8731
 	tristate "SoC Audio support for WM8731-based At91sam9g20 evaluation board"
 	depends on ARCH_AT91 || COMPILE_TEST
 	depends on ATMEL_SSC && SND_SOC_I2C_AND_SPI
+	depends on SND_SOC_WM8731
 	select SND_ATMEL_SOC_SSC_PDC
-	select SND_SOC_WM8731
 	help
 	  Say Y if you want to add support for SoC audio on WM8731-based
 	  AT91sam9g20 evaluation board.
@@ -64,8 +64,8 @@ config SND_AT91_SOC_SAM9X5_WM8731
 	tristate "SoC Audio support for WM8731-based at91sam9x5 board"
 	depends on ARCH_AT91 || COMPILE_TEST
 	depends on ATMEL_SSC && SND_SOC_I2C_AND_SPI
+	depends on SND_SOC_WM8731
 	select SND_ATMEL_SOC_SSC_DMA
-	select SND_SOC_WM8731
 	help
 	  Say Y if you want to add support for audio SoC on an
 	  at91sam9x5 based board that is using WM8731 codec.
@@ -110,8 +110,7 @@ config SND_ATMEL_SOC_I2S
 config SND_SOC_MIKROE_PROTO
 	tristate "Support for Mikroe-PROTO board"
 	depends on OF
-	depends on SND_SOC_I2C_AND_SPI
-	select SND_SOC_WM8731
+	depends on SND_SOC_I2C_AND_SPI && SND_SOC_WM8731
 	help
 	  Say Y or M if you want to add support for MikroElektronika PROTO Audio
 	  Board. This board contains the WM8731 codec, which can be configured
diff --git a/sound/soc/au1x/Kconfig b/sound/soc/au1x/Kconfig
index 38de7c0efbc7..749e59fddfcd 100644
--- a/sound/soc/au1x/Kconfig
+++ b/sound/soc/au1x/Kconfig
@@ -53,12 +53,11 @@ config SND_SOC_DB1000
 
 config SND_SOC_DB1200
 	tristate "DB1200/DB1300/DB1550 Audio support"
-	depends on SND_SOC_AU1XPSC
+	depends on SND_SOC_AU1XPSC && SND_SOC_WM8731
 	select SND_SOC_AU1XPSC_AC97
 	select SND_SOC_AC97_CODEC
 	select SND_SOC_WM9712
 	select SND_SOC_AU1XPSC_I2S
-	select SND_SOC_WM8731
 	help
 	  Select this option to enable audio (AC97 and I2S) on the
 	  Alchemy/AMD/RMI/NetLogic Db1200, Db1550 and Db1300 evaluation boards.
diff --git a/sound/soc/pxa/Kconfig b/sound/soc/pxa/Kconfig
index 0ac85eada75c..eeb1dde59468 100644
--- a/sound/soc/pxa/Kconfig
+++ b/sound/soc/pxa/Kconfig
@@ -44,8 +44,8 @@ config SND_MMP_SOC_SSPA
 config SND_PXA2XX_SOC_CORGI
 	tristate "SoC Audio support for Sharp Zaurus SL-C7x0"
 	depends on SND_PXA2XX_SOC && PXA_SHARP_C7xx && I2C
+	depends on SND_SOC_WM8731
 	select SND_PXA2XX_SOC_I2S
-	select SND_SOC_WM8731
 	help
 	  Say Y if you want to add support for SoC audio on Sharp
 	  Zaurus SL-C7x0 models (Corgi, Shepherd, Husky).
@@ -70,8 +70,8 @@ config SND_PXA2XX_SOC_Z2
 config SND_PXA2XX_SOC_POODLE
 	tristate "SoC Audio support for Poodle"
 	depends on SND_PXA2XX_SOC && MACH_POODLE && I2C
+	depends on SND_SOC_WM8731
 	select SND_PXA2XX_SOC_I2S
-	select SND_SOC_WM8731
 	help
 	  Say Y if you want to add support for SoC audio on Sharp
 	  Zaurus SL-5600 model (Poodle).
-- 
2.25.1

