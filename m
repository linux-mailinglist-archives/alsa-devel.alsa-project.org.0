Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 181A1433F16
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Oct 2021 21:16:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95238169F;
	Tue, 19 Oct 2021 21:15:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95238169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634670990;
	bh=/znmkFn+1hv2P3Gitl75yKUrCACWkay2CRqRv1A/zkE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=avwkY+ep5mg3ry0Qf27UPJbn02uYtLhHd2xBzoPVysTetUaUTRD0bldEMWmJvDbJL
	 BDKmILuVfmTG7op5WzaCxL56M7ojPSGqvZCvNQZH0vQMDY8TPQLcEp9kyiP6fqijo+
	 k8qWeDJA1ZHay1hTKknb0vPSXz9e6n0Q5UGIyXBY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06949F80155;
	Tue, 19 Oct 2021 21:15:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FF0EF80240; Tue, 19 Oct 2021 21:15:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAC25F80082
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 21:15:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAC25F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ltitQs67"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 87EC26136F;
 Tue, 19 Oct 2021 19:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634670898;
 bh=/znmkFn+1hv2P3Gitl75yKUrCACWkay2CRqRv1A/zkE=;
 h=From:To:Cc:Subject:Date:From;
 b=ltitQs67F5lcd0NsyCr7JXCQz3HfQUheX6dZx0f100TfB6DPwGp9AL+3iEphBNwhJ
 LsUkWdjdSQBnXCcefttZPEMgi/fnGuOvEpmHMwjLatRX/R8AOpcp4VKjyBlsdMLmIX
 uhteC0ayykb9Dy6Mv3pain3D7a4BL1z6tJJjblXu8uLgqyXqKBo1lxgh+2DooGGrED
 sTDBV6jyaWWQIpFK5A0yIfcROO2ug3WSXYhquDcnddVs5VFwjUVrcw6b/ktcOW7dYh
 bmtkgtFxWTdBvRnk9HeTqNWIqFAqsuvG6c3V47en7TfJJHxQoqdj7udyvkSLWwlFfY
 ZNEHLnkkiAWfA==
From: Arnd Bergmann <arnd@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: amd: vangogh: add SPI dependency
Date: Tue, 19 Oct 2021 21:14:43 +0200
Message-Id: <20211019191453.3047514-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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

Without CONFIG_SPI, this fails to build:

WARNING: unmet direct dependencies detected for SND_SOC_CS35L41_SPI
  Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SPI_MASTER [=n]
  Selected by [m]:
  - SND_SOC_AMD_VANGOGH_MACH [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_SOC_AMD_ACP5x [=m] && I2C [=y]
ERROR: modpost: "spi_setup" [sound/soc/codecs/snd-soc-cs35l41-spi.ko] undefined!
ERROR: modpost: "__devm_regmap_init_spi" [sound/soc/codecs/snd-soc-cs35l41-spi.ko] undefined!

Fixes: 96792fdd77cd ("ASoC: amd: enable vangogh platform machine driver build")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/amd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index d91a9399777c..edee2098c82e 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -68,7 +68,7 @@ config SND_SOC_AMD_VANGOGH_MACH
 	tristate "AMD Vangogh support for NAU8821 CS35L41"
 	select SND_SOC_NAU8821
 	select SND_SOC_CS35L41_SPI
-	depends on SND_SOC_AMD_ACP5x && I2C
+	depends on SND_SOC_AMD_ACP5x && I2C && SPI
 	help
 	  This option enables machine driver for Vangogh platform
 	  using NAU8821 and CS35L41 codecs.
-- 
2.29.2

