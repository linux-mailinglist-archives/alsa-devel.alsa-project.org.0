Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 099141119B
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 04:40:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EAFB171C;
	Thu,  2 May 2019 04:39:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EAFB171C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556764803;
	bh=ZIE+jyynH1uC1RwcdzINQRt38qxuxbviz7ucMZioKoM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=czE02buXQvoff0PWMZ9UrByuL5Wv1x5Nyx+YeSRsDSr5s1shFnDiC1zaYrEsn52cV
	 CD5ysUw+sy3Be6iLt19FvWgU4yPQoNAS1XNiZC8Y1fnOEcpRbTCf33CSVO0MTvsPyh
	 qoaXygKTFZY4/+oOe0irxxS+9Bh3C4FCjkj6SrVI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2300F897C6;
	Thu,  2 May 2019 04:19:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FD91F89762; Thu,  2 May 2019 04:19:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA12AF8974F
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 04:18:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA12AF8974F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ejSnNLhm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=oL192bTqvDNtO9/zE8dKxXdEjuXQ5GVJqZjrNkHIiv0=; b=ejSnNLhmGS24
 sls3P/G7RzMkZS565WSQhaU5mCwz0fX0bYJqSOL3FuzXHUGOvvXd3gB8S+6FJPfmPGljZXyQijMZi
 0fSH9svyRKZwmwOUqcDAgR3LJiLxwX4nXnvigGl2IRba5ZF8xBUTAbiNblCX5ZOlRwmSfbSn/XTdv
 tMC38=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hM1JE-0005u2-9f; Thu, 02 May 2019 02:18:52 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 6798B441D3E; Thu,  2 May 2019 03:18:49 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
In-Reply-To: <20190417152932.36436-1-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20190502021849.6798B441D3E@finisterre.ee.mobilebroadband>
Date: Thu,  2 May 2019 03:18:49 +0100 (BST)
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, Hulk Robot <hulkci@huawei.com>,
 Mark Brown <broonie@kernel.org>, shunli.wang@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 kaichieh.chuang@mediatek.com
Subject: [alsa-devel] Applied "ASoC: Mediatek: MT8183: Fix build err while
	CONFIG_I2C set to module" to the asoc tree
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

   ASoC: Mediatek: MT8183: Fix build err while CONFIG_I2C set to module

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

From f2a1fdb50d3187266a91bcf99b504e99695772a6 Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 17 Apr 2019 23:29:32 +0800
Subject: [PATCH] ASoC: Mediatek: MT8183: Fix build err while CONFIG_I2C set to
 module

During randconfig builds, I occasionally run into an invalid configuration

WARNING: unmet direct dependencies detected for SND_SOC_TS3A227E
  Depends on [m]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=m]
  Selected by [y]:
  - SND_SOC_MT8183_MT6358_TS3A227E_MAX98357A [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_MT8183 [=y]

sound/soc/codecs/ts3a227e.o: In function `ts3a227e_i2c_probe':
ts3a227e.c:(.text+0x684): undefined reference to `__devm_regmap_init_i2c'
sound/soc/codecs/ts3a227e.o: In function `ts3a227e_driver_init':
ts3a227e.c:(.init.text+0x18): undefined reference to `i2c_register_driver'
sound/soc/codecs/ts3a227e.o: In function `ts3a227e_driver_exit':
ts3a227e.c:(.exit.text+0x14): undefined reference to `i2c_del_driver'

This patch add I2C dependency to fix this.

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: ebbddc75bbe8 ("ASoC: Mediatek: MT8183: Add machine driver with DA7219")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/mediatek/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 874404bcccfd..f70b7109f2b6 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -118,6 +118,7 @@ config SND_SOC_MT8183
 
 config SND_SOC_MT8183_MT6358_TS3A227E_MAX98357A
 	tristate "ASoC Audio driver for MT8183 with MT6358 TS3A227E MAX98357A codec"
+	depends on I2C
 	depends on SND_SOC_MT8183
 	select SND_SOC_MT6358
 	select SND_SOC_MAX98357A
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
