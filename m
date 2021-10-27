Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C88AA43C506
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Oct 2021 10:25:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 399D416CD;
	Wed, 27 Oct 2021 10:24:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 399D416CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635323133;
	bh=kWIOhYrTxqoTvouRepas2OKBvKfTPbZbrCIYHvdOjWg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=I/mQZSwo7wfc9iwnPdxUTwywTTzWzggDOtOo7oBbX2SDoy6sxlowLzC/PCRpaNrip
	 ZM2yJnKaJLEs9N64NMW3a8fZ8ixnmMCdtBQCz0aHlD0ywxlfoCB2iCKKbljpNJTsW0
	 F/mvRIJm76xf3jXlnRbOsmrXnM+pZXAqT7mcrsL0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FE17F8025E;
	Wed, 27 Oct 2021 10:24:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF806F800D1; Wed, 27 Oct 2021 10:24:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72335F800D1
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 10:24:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72335F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GZaa9T7Q"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D15C61073;
 Wed, 27 Oct 2021 08:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635323043;
 bh=kWIOhYrTxqoTvouRepas2OKBvKfTPbZbrCIYHvdOjWg=;
 h=From:To:Cc:Subject:Date:From;
 b=GZaa9T7Q7NhB7hGwsy0V4Ul9Prcqgxiz+bGj3tF9S6KzSWvc6wlUr1KahH09Spj4V
 T/oUPrADHk8gV4xXLLm/j+BV2Gh9IdXtsh8kigyi19gw7DTQ5v22+syKyFeT0SDX2u
 hwztaQh4XivqaV17XBk40+/w+mt9/Tj13B/aM6z9MmByOJ/TlO0wxPMzKGCMGIifCw
 TfKV4MW6oKzZRbnjcIHJtExDUuCybJ2b3F0IGKAVRskvaENVJw/fvSpfi9unluLMs2
 v/ZAAQA/7mVpJ/NhWkpuRdoM40ETdjmJTImqCK9+C44xgXr4yvZ/uWkXwOc7ptYK4C
 7+zndrpNhTypg==
From: Arnd Bergmann <arnd@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Subject: [PATCH] ASoC: amd: acp: fix Kconfig dependencies
Date: Wed, 27 Oct 2021 10:23:46 +0200
Message-Id: <20211027082359.52248-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
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

From: Arnd Bergmann <arnd@arndb.de>

The CONFIG_SND_SOC_AMD_MACH_COMMON has some dependencies that
are not checked by the symbols that select it:

WARNING: unmet direct dependencies detected for SND_SOC_AMD_MACH_COMMON
  Depends on [n]: SOUND [=y] && !UML && SND [=m] && SND_SOC [=m] && X86 && PCI [=y] && I2C [=n]
  Selected by [m]:
  - SND_SOC_AMD_LEGACY_MACH [=m] && SOUND [=y] && !UML && SND [=m] && SND_SOC [=m]
  - SND_SOC_AMD_SOF_MACH [=m] && SOUND [=y] && !UML && SND [=m] && SND_SOC [=m]

WARNING: unmet direct dependencies detected for SND_SOC_AMD_MACH_COMMON
  Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && X86 && PCI [=n] && I2C [=m]
  Selected by [m]:
  - SND_SOC_AMD_LEGACY_MACH [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m]

Make this more consistent by adding the same checks everywhere.

Fixes: 9d8a7be88b33 ("ASoC: amd: acp: Add legacy sound card support for Chrome audio")
Fixes: 9f84940f5004 ("ASoC: amd: acp: Add SOF audio support on Chrome board")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/amd/acp/Kconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
index 98ec18791d35..737135357ee2 100644
--- a/sound/soc/amd/acp/Kconfig
+++ b/sound/soc/amd/acp/Kconfig
@@ -28,24 +28,26 @@ config SND_AMD_ASOC_RENOIR
 
 config SND_SOC_AMD_MACH_COMMON
 	tristate
+	depends on X86 && PCI && I2C
 	select CLK_FIXED_FCH
 	select SND_SOC_RT5682_I2C
 	select SND_SOC_DMIC
 	select SND_SOC_RT1019
 	select SND_SOC_MAX98357A
 	select SND_SOC_RT5682S
-	depends on X86 && PCI && I2C
 	help
 	  This option enables common Machine driver module for ACP.
 
 config SND_SOC_AMD_LEGACY_MACH
 	tristate "AMD Legacy Machine Driver Support"
+	depends on X86 && PCI && I2C
 	select SND_SOC_AMD_MACH_COMMON
 	help
 	  This option enables legacy sound card support for ACP audio.
 
 config SND_SOC_AMD_SOF_MACH
 	tristate "AMD SOF Machine Driver Support"
+	depends on X86 && PCI && I2C
 	select SND_SOC_AMD_MACH_COMMON
 	help
 	  This option enables SOF sound card support for ACP audio.
-- 
2.29.2

