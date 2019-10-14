Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 304E4D620D
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2019 14:08:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB7301683;
	Mon, 14 Oct 2019 14:07:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB7301683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571054916;
	bh=+GmyRRtHlNKGK+WqjVB+FKsdr2bL6fccaXpbzmHK1o0=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Ppv9KLVYOziU5NcASS4nxj0UkVLzwMZjFAb7Wi3yuTWEFcvBHq7zrV5CplSSGp89C
	 uxQAvY8EUYaXGrIwPmiYMNlSCXldr6blY9bvJUz8Z4F8MSJooSyHmbfj6YcHhw6NIA
	 4O5Lx2rR4AKDa1MW45lQNDYfoNmCUftItX90ZZKU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4578F80610;
	Mon, 14 Oct 2019 14:05:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDE4FF804AA; Mon, 14 Oct 2019 14:05:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DD1FF80376
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 14:05:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DD1FF80376
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ZkvZ04Jy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=HTqny5PVHvnmykrT7/i1QnwbFEAoZl4BaIh7+Q4ZBD8=; b=ZkvZ04JyHUqK
 EKhKl9qgVeJw+aFrjyJIXS7+NcnGa5tQma35pvSFybaP2Kua7HqT/YESsko4VZlh983J/GaiDxM/o
 BK/JqULa93WSTPO2lLgkrwv9FGxqdVQ7840MOw8WdgGlK4bgQPdRmuVY9say3n4huwkdDYLkQ5Q2q
 qZpm4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iJz5u-0007WR-MS; Mon, 14 Oct 2019 12:04:58 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 236F02741EF2; Mon, 14 Oct 2019 13:04:58 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
In-Reply-To: <20191011150042.20096-1-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20191014120458.236F02741EF2@ypsilon.sirena.org.uk>
Date: Mon, 14 Oct 2019 13:04:58 +0100 (BST)
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 piotrs@opensource.cirrus.com, lgirdwood@gmail.com, krzk@kernel.org,
 linux-kernel@vger.kernel.org, paul@crapouillou.net,
 Hulk Robot <hulkci@huawei.com>, Mark Brown <broonie@kernel.org>,
 npoushin@opensource.cirrus.com, enric.balletbo@collabora.com, tiwai@suse.com,
 nuno.sa@analog.com, rf@opensource.wolfsonmicro.com
Subject: [alsa-devel] Applied "ASoC: adau7118: Fix Kconfig warning without
	CONFIG_I2C" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: adau7118: Fix Kconfig warning without CONFIG_I2C

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From de729862cc0f0b46dd3a3c11079240ea4e13b97d Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 11 Oct 2019 23:00:42 +0800
Subject: [PATCH] ASoC: adau7118: Fix Kconfig warning without CONFIG_I2C

When building a kernel without CONFIG_I2C, Kconfig warns:

WARNING: unmet direct dependencies detected for REGMAP_I2C
  Depends on [n]: I2C [=n]
  Selected by [y]:
  - SND_SOC_ADAU7118_I2C [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y]

Add missing I2C dependency to SND_SOC_ADAU7118_I2C to fix this.

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: ca514c0f12b0 ("ASOC: Add ADAU7118 8 Channel PDM-to-I2S/TDM Converter driver")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Link: https://lore.kernel.org/r/20191011150042.20096-1-yuehaibing@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index f4747ebc251e..5a706102db04 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -416,6 +416,7 @@ config SND_SOC_ADAU7118_HW
 
 config SND_SOC_ADAU7118_I2C
 	tristate "Analog Devices ADAU7118 8 Channel PDM-to-I2S/TDM Converter - I2C"
+	depends on I2C
 	select SND_SOC_ADAU7118
 	select REGMAP_I2C
 	help
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
