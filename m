Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0AC1945FD
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Mar 2020 19:03:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EE751673;
	Thu, 26 Mar 2020 19:02:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EE751673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585245788;
	bh=9dWUTiiCnWeagpAE8YrZBiNmPfSDGY8PXlJoIOOMakI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ReycWrsT5DVfNlhqIpueEVpiMzknP7EgC6c3pstc4M70xpdqRQ4g0sEg5fyqYmEDh
	 pMxltREIPdKxV3IwtcdU6DQ5lPe+2EziZCE53asixBJ6XAsh4/UFs7aHwIS91rwcz5
	 eJvq9jH6P5u+XB0BrG0Y+gthJoeihjHIU7m1N1wA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B17E5F80234;
	Thu, 26 Mar 2020 19:01:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CB42F80227; Thu, 26 Mar 2020 19:01:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 04BC8F8011B
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 19:01:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04BC8F8011B
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 018CF7FA;
 Thu, 26 Mar 2020 11:01:19 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 787D53F71E;
 Thu, 26 Mar 2020 11:01:18 -0700 (PDT)
From: Mark Brown <broonie@kernel.org>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: pxa: Enable AC'97 bus support for PXA machines
Date: Thu, 26 Mar 2020 18:01:16 +0000
Message-Id: <20200326180116.21375-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 KernelCI <bot@kernelci.org>, linux-arm-kernel@lists.infradead.org
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

The AC'97 based PXA machines currently don't build reliably as they don't
ensure that an AC'97 bus is built, causing at least eseries_pxa_defconfig
to fail to build. Add selects to fix this.

Reported-by: KernelCI <bot@kernelci.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/pxa/Kconfig | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/pxa/Kconfig b/sound/soc/pxa/Kconfig
index 1f0c08b06c1d..d4c0f580a565 100644
--- a/sound/soc/pxa/Kconfig
+++ b/sound/soc/pxa/Kconfig
@@ -82,6 +82,8 @@ config SND_PXA2XX_SOC_TOSA
 	depends on MFD_TC6393XB
 	depends on AC97_BUS=n
 	select REGMAP
+	select AC97_BUS_NEW
+	select AC97_BUS_COMPAT
 	select SND_PXA2XX_SOC_AC97
 	select SND_SOC_WM9712
 	help
@@ -93,6 +95,8 @@ config SND_PXA2XX_SOC_E740
 	depends on SND_PXA2XX_SOC && MACH_E740
 	depends on AC97_BUS=n
 	select REGMAP
+	select AC97_BUS_NEW
+	select AC97_BUS_COMPAT
 	select SND_SOC_WM9705
 	select SND_PXA2XX_SOC_AC97
 	help
@@ -116,6 +120,8 @@ config SND_PXA2XX_SOC_E800
 	depends on AC97_BUS=n
 	select REGMAP
 	select SND_SOC_WM9712
+	select AC97_BUS_NEW
+	select AC97_BUS_COMPAT
 	select SND_PXA2XX_SOC_AC97
 	help
 	  Say Y if you want to add support for SoC audio on the
@@ -127,6 +133,8 @@ config SND_PXA2XX_SOC_EM_X270
 			MACH_CM_X300)
 	depends on AC97_BUS=n
 	select REGMAP
+	select AC97_BUS_NEW
+	select AC97_BUS_COMPAT
 	select SND_PXA2XX_SOC_AC97
 	select SND_SOC_WM9712
 	help
@@ -139,6 +147,8 @@ config SND_PXA2XX_SOC_PALM27X
 			MACH_PALMT5 || MACH_PALMTE2)
 	depends on AC97_BUS=n
 	select REGMAP
+	select AC97_BUS_NEW
+	select AC97_BUS_COMPAT
 	select SND_PXA2XX_SOC_AC97
 	select SND_SOC_WM9712
 	help
@@ -169,6 +179,8 @@ config SND_SOC_ZYLONITE
 	tristate "SoC Audio support for Marvell Zylonite"
 	depends on SND_PXA2XX_SOC && MACH_ZYLONITE
 	depends on AC97_BUS=n
+	select AC97_BUS_NEW
+	select AC97_BUS_COMPAT
 	select SND_PXA2XX_SOC_AC97
 	select REGMAP
 	select SND_PXA_SOC_SSP
@@ -201,6 +213,8 @@ config SND_PXA2XX_SOC_MIOA701
 	depends on SND_PXA2XX_SOC && MACH_MIOA701
 	depends on AC97_BUS=n
 	select REGMAP
+	select AC97_BUS_NEW
+	select AC97_BUS_COMPAT
 	select SND_PXA2XX_SOC_AC97
 	select SND_SOC_WM9713
 	help
-- 
2.20.1

