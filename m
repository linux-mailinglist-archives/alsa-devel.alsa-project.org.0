Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9758C17A52E
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Mar 2020 13:22:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF57F1667;
	Thu,  5 Mar 2020 13:21:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF57F1667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583410931;
	bh=6HDekdP8QWtaAgQp1/Xe7KJAdu+cirzpNQlhl/LTjIw=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=JUkY8gQf4T5bkD+kzBKRvRhg/EfpeCQb7aQYle3KkCwTL9nzozqEh1okYjo569LdQ
	 5d+vGsEnbKHE6nLd6QIToMGC3loYC6W8Ntuhfv+v4+mKrJ2awVyGOGhlS+Zwwm00vg
	 7jd72zOm1KxqucdSNG88OO/+IyK1CQpthAvTU204=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF2F7F8012D;
	Thu,  5 Mar 2020 13:20:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95D76F8025F; Thu,  5 Mar 2020 13:20:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 RCVD_IN_DNSWL_BLOCKED, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 7C1B0F800D8
 for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2020 13:20:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C1B0F800D8
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 091864B2;
 Thu,  5 Mar 2020 04:20:12 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FDAE3F6C4;
 Thu,  5 Mar 2020 04:20:11 -0800 (PST)
Date: Thu, 05 Mar 2020 12:20:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Axel Lin <axel.lin@ingics.com>
Subject: Applied "ASoC: wm8741: Fix typo in Kconfig prompt" to the asoc tree
In-Reply-To: <20200304140241.340-1-axel.lin@ingics.com>
Message-Id: <applied-20200304140241.340-1-axel.lin@ingics.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Ian Lartey <ian@opensource.wolfsonmicro.com>,
 Sergej Sawazki <sergej@taudac.com>, Liam Girdwood <lgirdwood@gmail.com>
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

The patch

   ASoC: wm8741: Fix typo in Kconfig prompt

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From e79597da7ea77ff48936cd6d318644b07ee6ce56 Mon Sep 17 00:00:00 2001
From: Axel Lin <axel.lin@ingics.com>
Date: Wed, 4 Mar 2020 22:02:41 +0800
Subject: [PATCH] ASoC: wm8741: Fix typo in Kconfig prompt

Fix trivial copy-n-paste mistake.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Message-Id: <20200304140241.340-1-axel.lin@ingics.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 7e90f5d83097..ea912439e446 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1406,7 +1406,7 @@ config SND_SOC_WM8737
 	depends on SND_SOC_I2C_AND_SPI
 
 config SND_SOC_WM8741
-	tristate "Wolfson Microelectronics WM8737 DAC"
+	tristate "Wolfson Microelectronics WM8741 DAC"
 	depends on SND_SOC_I2C_AND_SPI
 
 config SND_SOC_WM8750
-- 
2.20.1

