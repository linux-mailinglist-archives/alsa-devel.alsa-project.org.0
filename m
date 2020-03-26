Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C271942B6
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Mar 2020 16:11:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DE951678;
	Thu, 26 Mar 2020 16:11:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DE951678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585235515;
	bh=9vBbn1uomAVwvzP3tNAMbnxK7ep7/IBeeulz3bW/Nhw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JB4qfP5HeEqrTfH0sh0meMSvvvaQK8EiIC1EeJuLOaf4GU//Y0kJHIbcqVFVLrKB9
	 kPL9L/o0e5lMRTf20rmi2luOCxEH9u691PQekiIsC865FJ9urfRWAEjHYGSTleRduN
	 /h6upGs3avQjP76nHS5700m0wZIDdZMAZvHx0/DA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9811F8011E;
	Thu, 26 Mar 2020 16:11:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B856F80249; Thu, 26 Mar 2020 16:11:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 8B13BF80095
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 16:10:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B13BF80095
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D0967FA;
 Thu, 26 Mar 2020 08:10:56 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB7F13F71E;
 Thu, 26 Mar 2020 08:10:55 -0700 (PDT)
From: Mark Brown <broonie@kernel.org>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: pxa: Select regmap from AC'97 machines
Date: Thu, 26 Mar 2020 15:10:53 +0000
Message-Id: <20200326151053.40806-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

regmap needs to be selected by users which for machine drivers that select
AC'97 CODEC drivers means that we need to also select regmap to ensure that
the CODEC driver will build if nothing else enables regmap as is likely for
such systems.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/pxa/Kconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/pxa/Kconfig b/sound/soc/pxa/Kconfig
index 295cfffa4646..1f0c08b06c1d 100644
--- a/sound/soc/pxa/Kconfig
+++ b/sound/soc/pxa/Kconfig
@@ -81,6 +81,7 @@ config SND_PXA2XX_SOC_TOSA
 	depends on SND_PXA2XX_SOC && MACH_TOSA
 	depends on MFD_TC6393XB
 	depends on AC97_BUS=n
+	select REGMAP
 	select SND_PXA2XX_SOC_AC97
 	select SND_SOC_WM9712
 	help
@@ -91,6 +92,7 @@ config SND_PXA2XX_SOC_E740
 	tristate "SoC AC97 Audio support for e740"
 	depends on SND_PXA2XX_SOC && MACH_E740
 	depends on AC97_BUS=n
+	select REGMAP
 	select SND_SOC_WM9705
 	select SND_PXA2XX_SOC_AC97
 	help
@@ -101,6 +103,7 @@ config SND_PXA2XX_SOC_E750
 	tristate "SoC AC97 Audio support for e750"
 	depends on SND_PXA2XX_SOC && MACH_E750
 	depends on AC97_BUS=n
+	select REGMAP
 	select SND_SOC_WM9705
 	select SND_PXA2XX_SOC_AC97
 	help
@@ -111,6 +114,7 @@ config SND_PXA2XX_SOC_E800
 	tristate "SoC AC97 Audio support for e800"
 	depends on SND_PXA2XX_SOC && MACH_E800
 	depends on AC97_BUS=n
+	select REGMAP
 	select SND_SOC_WM9712
 	select SND_PXA2XX_SOC_AC97
 	help
@@ -122,6 +126,7 @@ config SND_PXA2XX_SOC_EM_X270
 	depends on SND_PXA2XX_SOC && (MACH_EM_X270 || MACH_EXEDA || \
 			MACH_CM_X300)
 	depends on AC97_BUS=n
+	select REGMAP
 	select SND_PXA2XX_SOC_AC97
 	select SND_SOC_WM9712
 	help
@@ -133,6 +138,7 @@ config SND_PXA2XX_SOC_PALM27X
 	depends on SND_PXA2XX_SOC && (MACH_PALMLD || MACH_PALMTX || \
 			MACH_PALMT5 || MACH_PALMTE2)
 	depends on AC97_BUS=n
+	select REGMAP
 	select SND_PXA2XX_SOC_AC97
 	select SND_SOC_WM9712
 	help
@@ -164,6 +170,7 @@ config SND_SOC_ZYLONITE
 	depends on SND_PXA2XX_SOC && MACH_ZYLONITE
 	depends on AC97_BUS=n
 	select SND_PXA2XX_SOC_AC97
+	select REGMAP
 	select SND_PXA_SOC_SSP
 	select SND_SOC_WM9713
 	help
@@ -193,6 +200,7 @@ config SND_PXA2XX_SOC_MIOA701
 	tristate "SoC Audio support for MIO A701"
 	depends on SND_PXA2XX_SOC && MACH_MIOA701
 	depends on AC97_BUS=n
+	select REGMAP
 	select SND_PXA2XX_SOC_AC97
 	select SND_SOC_WM9713
 	help
-- 
2.20.1

