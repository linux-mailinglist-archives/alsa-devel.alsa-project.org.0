Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 122C03302E6
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Mar 2021 17:25:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 902C61F20;
	Sun,  7 Mar 2021 17:24:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 902C61F20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615134324;
	bh=u7FbZ0Fdjr56d7WDm2XXNDcg4SP24E+ZJyb/BHUGMI8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=K01387zfv3Kh7wKxa3/MqztDhOAvUx4fzweHIomyFLD4t7jUIzimGJcOLPd1CtQJT
	 8MuJgPz2vtT4AXrSvvKsswUyDI+DsbeItXk5z9DRJtZKc5ZC3ZRB9FhwabyGUy3ILX
	 Cc+xUZdchS/lnPt6FMmp3YADUZs7DjDu8O2MTJf4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95C44F800CC;
	Sun,  7 Mar 2021 17:23:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EC7EF80256; Sun,  7 Mar 2021 17:23:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,UPPERCASE_50_75,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E1C0F80139
 for <alsa-devel@alsa-project.org>; Sun,  7 Mar 2021 17:23:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E1C0F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qrTREAnJ"
Received: by mail-wr1-x435.google.com with SMTP id h98so8803512wrh.11
 for <alsa-devel@alsa-project.org>; Sun, 07 Mar 2021 08:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BqpmxAEUNndFlhKRUxuyHtFM2QUv+uV9egrv4lIpLqw=;
 b=qrTREAnJAoU+lx5pJjQjcYqe1/7aGhvtuINUKFsfpZgZUh/hGejugbNdHxFAyuhazH
 3WgGumFPZtaZlQzMfYJQuOE3DUZuyx6zvEHM1YxKNcDkVQet4IBInoOR7HgjHF/nf5XP
 mwMTOKCWV7rj1r7lQOk03Atf2BIPTfbrLRPpXkHuRY4sNGq2bRHLkKUQt4Jo3uVoqn+K
 vBceJlTCFCaV3AL5zqMC3I8LfKtiKNULv9/Dqh4xVhueRduwso9d2cBNX0jkoHML70Sj
 8+aTdqXl2FmX+nmr6lFu6goD2iI0xbhD7gKNFH4PXI4tbPjd95Vl+NtbLFF4wj1mHAq0
 j9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BqpmxAEUNndFlhKRUxuyHtFM2QUv+uV9egrv4lIpLqw=;
 b=Wkg30FUYrWX+ZmjMfX+5UAVrSvndxMEVY5TYwhLCodPbB+qkGpyjfACp2yjLGxgeLC
 BuCSeQ7mINfXjd/SssxTqBfAW5h8+vlkXWfnW3eHC/N8wLAkoODEnupi8vpX5urhhM7r
 QxPBUpLO3BXUR1/cscDuBqPDSXv2a4jWPqzoORjDWaVO9uBde/xqiqR4pdTheCUYe2Hu
 bC4blYtLUZZaTl1S188P4s3favogtBNNpeAD0/PeHjZyxGAHZChrS8saVrTVdUGQa0+h
 oZ/P1q/CtcoJ0HD4AnRbYFEknl3I8FOrn6/+6JB5R62Pgy6bLz57VIvr6wYyQsksZn3p
 Zxew==
X-Gm-Message-State: AOAM5326IT+Jcb+T1jzpEtVBUgwcSvEJepcv9H8bT3zBfI5jcw2acPY/
 Awp0UsdF5YczI20iPMAYZVI=
X-Google-Smtp-Source: ABdhPJwBJUAHEVB0tFe5Dj21Y5z4jW2tUbjLBdceJO9r8nluG7Eqsv92josv+RuHRqgbxa0l207+zw==
X-Received: by 2002:a5d:4688:: with SMTP id u8mr18833304wrq.39.1615134222459; 
 Sun, 07 Mar 2021 08:23:42 -0800 (PST)
Received: from morpheus.home.roving-it.com
 (f.c.9.1.f.e.c.d.1.e.0.0.2.b.5.5.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:fb11:2681:55b2:e1:dcef:19cf])
 by smtp.googlemail.com with ESMTPSA id a75sm14515541wme.10.2021.03.07.08.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Mar 2021 08:23:42 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
To: Jun Nie <jun.nie@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Barry Song <baohua@kernel.org>,
 alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ASoC: remove remnants of sirf prima/atlas audio codec
Date: Sun,  7 Mar 2021 16:23:37 +0000
Message-Id: <20210307162338.1160604-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, Peter Robinson <pbrobinson@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>
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

In 61fbeb5 the sirf prima/atlas drivers were removed. This cleans
up a stray header and some Kconfig entries for the codec that
were missed in the process.

Fixes: 61fbeb5dcb3d (ASoC: remove sirf prima/atlas drivers)
Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/Kconfig            |   5 --
 sound/soc/codecs/sirf-audio-codec.h | 124 ----------------------------
 2 files changed, 129 deletions(-)
 delete mode 100644 sound/soc/codecs/sirf-audio-codec.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index e4cf14e66a51..1c87b42606c9 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -186,7 +186,6 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_SI476X
 	imply SND_SOC_SIMPLE_AMPLIFIER
 	imply SND_SOC_SIMPLE_MUX
-	imply SND_SOC_SIRF_AUDIO_CODEC
 	imply SND_SOC_SPDIF
 	imply SND_SOC_SSM2305
 	imply SND_SOC_SSM2518
@@ -1279,10 +1278,6 @@ config SND_SOC_SIMPLE_MUX
 	tristate "Simple Audio Mux"
 	select GPIOLIB
 
-config SND_SOC_SIRF_AUDIO_CODEC
-	tristate "SiRF SoC internal audio codec"
-	select REGMAP_MMIO
-
 config SND_SOC_SPDIF
 	tristate "S/PDIF CODEC"
 
diff --git a/sound/soc/codecs/sirf-audio-codec.h b/sound/soc/codecs/sirf-audio-codec.h
deleted file mode 100644
index a7fe2680f4c7..000000000000
--- a/sound/soc/codecs/sirf-audio-codec.h
+++ /dev/null
@@ -1,124 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * SiRF inner codec controllers define
- *
- * Copyright (c) 2011 Cambridge Silicon Radio Limited, a CSR plc group company.
- */
-
-#ifndef _SIRF_AUDIO_CODEC_H
-#define _SIRF_AUDIO_CODEC_H
-
-
-#define AUDIO_IC_CODEC_PWR			(0x00E0)
-#define AUDIO_IC_CODEC_CTRL0			(0x00E4)
-#define AUDIO_IC_CODEC_CTRL1			(0x00E8)
-#define AUDIO_IC_CODEC_CTRL2			(0x00EC)
-#define AUDIO_IC_CODEC_CTRL3			(0x00F0)
-
-#define MICBIASEN		(1 << 3)
-
-#define IC_RDACEN		(1 << 0)
-#define IC_LDACEN		(1 << 1)
-#define IC_HSREN		(1 << 2)
-#define IC_HSLEN		(1 << 3)
-#define IC_SPEN			(1 << 4)
-#define IC_CPEN			(1 << 5)
-
-#define IC_HPRSELR		(1 << 6)
-#define IC_HPLSELR		(1 << 7)
-#define IC_HPRSELL		(1 << 8)
-#define IC_HPLSELL		(1 << 9)
-#define IC_SPSELR		(1 << 10)
-#define IC_SPSELL		(1 << 11)
-
-#define IC_MONOR		(1 << 12)
-#define IC_MONOL		(1 << 13)
-
-#define IC_RXOSRSEL		(1 << 28)
-#define IC_CPFREQ		(1 << 29)
-#define IC_HSINVEN		(1 << 30)
-
-#define IC_MICINREN		(1 << 0)
-#define IC_MICINLEN		(1 << 1)
-#define IC_MICIN1SEL		(1 << 2)
-#define IC_MICIN2SEL		(1 << 3)
-#define IC_MICDIFSEL		(1 << 4)
-#define	IC_LINEIN1SEL		(1 << 5)
-#define	IC_LINEIN2SEL		(1 << 6)
-#define	IC_RADCEN		(1 << 7)
-#define	IC_LADCEN		(1 << 8)
-#define	IC_ALM			(1 << 9)
-
-#define IC_DIGMICEN             (1 << 22)
-#define IC_DIGMICFREQ           (1 << 23)
-#define IC_ADC14B_12            (1 << 24)
-#define IC_FIRDAC_HSL_EN        (1 << 25)
-#define IC_FIRDAC_HSR_EN        (1 << 26)
-#define IC_FIRDAC_LOUT_EN       (1 << 27)
-#define IC_POR                  (1 << 28)
-#define IC_CODEC_CLK_EN         (1 << 29)
-#define IC_HP_3DB_BOOST         (1 << 30)
-
-#define IC_ADC_LEFT_GAIN_SHIFT	16
-#define IC_ADC_RIGHT_GAIN_SHIFT 10
-#define IC_ADC_GAIN_MASK	0x3F
-#define IC_MIC_MAX_GAIN		0x39
-
-#define IC_RXPGAR_MASK		0x3F
-#define IC_RXPGAR_SHIFT		14
-#define IC_RXPGAL_MASK		0x3F
-#define IC_RXPGAL_SHIFT		21
-#define IC_RXPGAR		0x7B
-#define IC_RXPGAL		0x7B
-
-#define AUDIO_PORT_TX_FIFO_LEVEL_CHECK_MASK     0x3F
-#define AUDIO_PORT_TX_FIFO_SC_OFFSET    0
-#define AUDIO_PORT_TX_FIFO_LC_OFFSET    10
-#define AUDIO_PORT_TX_FIFO_HC_OFFSET    20
-
-#define TX_FIFO_SC(x)           (((x) & AUDIO_PORT_TX_FIFO_LEVEL_CHECK_MASK) \
-				<< AUDIO_PORT_TX_FIFO_SC_OFFSET)
-#define TX_FIFO_LC(x)           (((x) & AUDIO_PORT_TX_FIFO_LEVEL_CHECK_MASK) \
-				<< AUDIO_PORT_TX_FIFO_LC_OFFSET)
-#define TX_FIFO_HC(x)           (((x) & AUDIO_PORT_TX_FIFO_LEVEL_CHECK_MASK) \
-				<< AUDIO_PORT_TX_FIFO_HC_OFFSET)
-
-#define AUDIO_PORT_RX_FIFO_LEVEL_CHECK_MASK     0x0F
-#define AUDIO_PORT_RX_FIFO_SC_OFFSET    0
-#define AUDIO_PORT_RX_FIFO_LC_OFFSET    10
-#define AUDIO_PORT_RX_FIFO_HC_OFFSET    20
-
-#define RX_FIFO_SC(x)           (((x) & AUDIO_PORT_RX_FIFO_LEVEL_CHECK_MASK) \
-				<< AUDIO_PORT_RX_FIFO_SC_OFFSET)
-#define RX_FIFO_LC(x)           (((x) & AUDIO_PORT_RX_FIFO_LEVEL_CHECK_MASK) \
-				<< AUDIO_PORT_RX_FIFO_LC_OFFSET)
-#define RX_FIFO_HC(x)           (((x) & AUDIO_PORT_RX_FIFO_LEVEL_CHECK_MASK) \
-				<< AUDIO_PORT_RX_FIFO_HC_OFFSET)
-#define AUDIO_PORT_IC_CODEC_TX_CTRL		(0x00F4)
-#define AUDIO_PORT_IC_CODEC_RX_CTRL		(0x00F8)
-
-#define AUDIO_PORT_IC_TXFIFO_OP			(0x00FC)
-#define AUDIO_PORT_IC_TXFIFO_LEV_CHK		(0x0100)
-#define AUDIO_PORT_IC_TXFIFO_STS		(0x0104)
-#define AUDIO_PORT_IC_TXFIFO_INT		(0x0108)
-#define AUDIO_PORT_IC_TXFIFO_INT_MSK		(0x010C)
-
-#define AUDIO_PORT_IC_RXFIFO_OP			(0x0110)
-#define AUDIO_PORT_IC_RXFIFO_LEV_CHK		(0x0114)
-#define AUDIO_PORT_IC_RXFIFO_STS		(0x0118)
-#define AUDIO_PORT_IC_RXFIFO_INT		(0x011C)
-#define AUDIO_PORT_IC_RXFIFO_INT_MSK		(0x0120)
-
-#define AUDIO_FIFO_START		(1 << 0)
-#define AUDIO_FIFO_RESET		(1 << 1)
-
-#define AUDIO_FIFO_FULL			(1 << 0)
-#define AUDIO_FIFO_EMPTY		(1 << 1)
-#define AUDIO_FIFO_OFLOW		(1 << 2)
-#define AUDIO_FIFO_UFLOW		(1 << 3)
-
-#define IC_TX_ENABLE		(0x03)
-#define IC_RX_ENABLE_MONO	(0x01)
-#define IC_RX_ENABLE_STEREO	(0x03)
-
-#endif /*__SIRF_AUDIO_CODEC_H*/
-- 
2.29.2

