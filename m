Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EDA404AF7
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Sep 2021 13:49:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F0AE16B1;
	Thu,  9 Sep 2021 13:48:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F0AE16B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631188158;
	bh=e0YyQ89vhZJrfRip3kDvSsTUPtWMNrFtRZ/S2IQUvJ0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LTWFHYmix1WgGMiV12sXeESMiS8JQ+tG4sh5bAc6zWliwMZYjYE+UDY3KOdOLNNv3
	 RdwKFJ0Ms9TNVN670ItmkHaZSFg9KatPjlxa0j+Hl4HYMGbra2P5IdfAN6q4MavoF8
	 wE8oNM3j5l4jYroBXg1hRiEutrJsQqSUFvIgKpEY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29D84F804FB;
	Thu,  9 Sep 2021 13:46:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C52D8F804FA; Thu,  9 Sep 2021 13:46:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8F03F80166
 for <alsa-devel@alsa-project.org>; Thu,  9 Sep 2021 13:46:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8F03F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SDBIVS7l"
Received: by mail.kernel.org (Postfix) with ESMTPSA id DA14A61167;
 Thu,  9 Sep 2021 11:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631188005;
 bh=e0YyQ89vhZJrfRip3kDvSsTUPtWMNrFtRZ/S2IQUvJ0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SDBIVS7l05Pl3wbbs6a16fRs2cSMJXk1+VetRO+jF1nfHKwT/py3W/beAdTY7S8RU
 bOahvZzEuAwZw7+DR4Sqx2vVBNhX1o4P2D/KIp/ygFvJhMjc5iPJ0p3mWqy3dpnue8
 DJHOUNY4ZSoGBFBAF8ehOJwrBhevYFWvyQplHKVEUUfhOX8Z8qGgih5e6PhFVMvg9r
 6Ecyf1Um7lP4MI3wB+s+vwznp2qPPFPLb0Y7T+rw8I/3zjwFV+TFaCf1BQx+EfbeOj
 35RqARsISti24VIQBngf3gr2lJbOQOaW01G6ZDobcnHKyo77P0ObBQqAduMd+Sos39
 sd20GTLLnvQMQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.13 007/219] ASoC: atmel: ATMEL drivers don't need
 HAS_DMA
Date: Thu,  9 Sep 2021 07:43:03 -0400
Message-Id: <20210909114635.143983-7-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909114635.143983-1-sashal@kernel.org>
References: <20210909114635.143983-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Randy Dunlap <rdunlap@infradead.org>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
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

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit 6c5c659dfe3f02e08054a6c20019e3886618b512 ]

On a config (such as arch/sh/) which does not set HAS_DMA when MMU
is not set, several ATMEL ASoC drivers select symbols that cause
kconfig warnings. There is one "depends on HAS_DMA" which is no longer
needed. Dropping it eliminates the kconfig warnings and still builds
with no problems reported.

Fix the following kconfig warnings:

WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_PDC
  Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && HAS_DMA [=n]
  Selected by [m]:
  - SND_ATMEL_SOC_SSC [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m]
  - SND_ATMEL_SOC_SSC_PDC [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && ATMEL_SSC [=m]

WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_SSC_PDC
  Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && ATMEL_SSC [=m] && HAS_DMA [=n]
  Selected by [m]:
  - SND_AT91_SOC_SAM9G20_WM8731 [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && (ARCH_AT91 || COMPILE_TEST [=y]) && ATMEL_SSC [=m] && SND_SOC_I2C_AND_SPI [=m]

WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_SSC
  Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && HAS_DMA [=n]
  Selected by [m]:
  - SND_ATMEL_SOC_SSC_DMA [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && ATMEL_SSC [=m]

WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_SSC_DMA
  Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && ATMEL_SSC [=m] && HAS_DMA [=n]
  Selected by [m]:
  - SND_ATMEL_SOC_WM8904 [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && (ARCH_AT91 || COMPILE_TEST [=y]) && ATMEL_SSC [=m] && I2C [=m]
  - SND_AT91_SOC_SAM9X5_WM8731 [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && (ARCH_AT91 || COMPILE_TEST [=y]) && ATMEL_SSC [=m] && SND_SOC_I2C_AND_SPI [=m]

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Link: https://lore.kernel.org/r/20210707214752.3831-1-rdunlap@infradead.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/atmel/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/atmel/Kconfig b/sound/soc/atmel/Kconfig
index ec04e3386bc0..8617793ed955 100644
--- a/sound/soc/atmel/Kconfig
+++ b/sound/soc/atmel/Kconfig
@@ -11,7 +11,6 @@ if SND_ATMEL_SOC
 
 config SND_ATMEL_SOC_PDC
 	bool
-	depends on HAS_DMA
 
 config SND_ATMEL_SOC_DMA
 	bool
-- 
2.30.2

