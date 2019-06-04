Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 186F434B61
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2019 17:02:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2351168B;
	Tue,  4 Jun 2019 17:02:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2351168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559660573;
	bh=8T+aH70ObuQrSlN2nUgRnDB3++uYIx2xqhm1dONsU/s=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=V6arGUh4X3OFgc5nIvWqG7NYo7QA7bXMe0pQMGlIjA36OLKaLf0YsNeLUYWYu2SHG
	 J5Kkq8a5a4iKNsGRCGaZi6xCN1iNsxuk9gJHp0exw1br+AvEd5JvFRlhkxeuiIhg3i
	 Dt4GhikESzvU6npJg5ITsk8sRIeKPyAh45vP76QI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BEEDCF8973F;
	Tue,  4 Jun 2019 16:59:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 898E0F89736; Tue,  4 Jun 2019 16:59:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 242C5F89673
 for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2019 16:59:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 242C5F89673
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="X7BkEqWK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Z6xN0yGWulWekvwXXiRFtdPpBCls+d5un3yiyvhzWJA=; b=X7BkEqWKl2vx
 eFmyzsSa+3DadoZ9AeZmxFZ05FVHdT+qL8M5kDSju8lXI3UFKy4JHg+lLuRoRdyEVDmkzf0ukwtFx
 iYlhRxTA7rRNXC3AWCSQR75rXxTBWXW7smwMat7oBzlxZB2UFlUmUtOOpXD+1g+rC2cJh0hKWHeYH
 5e/48=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYAtv-0006ER-2y; Tue, 04 Jun 2019 14:58:59 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id A0D11440049; Tue,  4 Jun 2019 15:58:58 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
In-Reply-To: <20190601085144.13832-1-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20190604145858.A0D11440049@finisterre.sirena.org.uk>
Date: Tue,  4 Jun 2019 15:58:58 +0100 (BST)
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, Hulk Robot <hulkci@huawei.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 shunli.wang@mediatek.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: da7219: Fix build error without
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

   ASoC: da7219: Fix build error without CONFIG_I2C

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.2

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

From cbc0fa7b6e8c6180c18fd951d28197281a526330 Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 1 Jun 2019 16:51:44 +0800
Subject: [PATCH] ASoC: da7219: Fix build error without CONFIG_I2C

Fix gcc build error while CONFIG_I2C is not set

sound/soc/codecs/da7219.c:2640:1: warning: data definition has no type or storage class
 module_i2c_driver(da7219_i2c_driver);
 ^~~~~~~~~~~~~~~~~
sound/soc/codecs/da7219.c:2640:1: error: type defaults to int in declaration of module_i2c_driver [-Werror=implicit-int]
sound/soc/codecs/da7219.c:2640:1: warning: parameter names (without types) in function declaration
sound/soc/codecs/da7219.c:2629:26: warning: da7219_i2c_driver defined but not used [-Wunused-variable]

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 6d817c0e9fd7 ("ASoC: codecs: Add da7219 codec driver")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/mediatek/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index f70b7109f2b6..59980df5add6 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -132,7 +132,7 @@ config SND_SOC_MT8183_MT6358_TS3A227E_MAX98357A
 
 config SND_SOC_MT8183_DA7219_MAX98357A
 	tristate "ASoC Audio driver for MT8183 with DA7219 MAX98357A codec"
-	depends on SND_SOC_MT8183
+	depends on SND_SOC_MT8183 && I2C
 	select SND_SOC_MT6358
 	select SND_SOC_MAX98357A
 	select SND_SOC_DA7219
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
