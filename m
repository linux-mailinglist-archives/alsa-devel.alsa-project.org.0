Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 946FE111A8
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 04:40:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CBA01746;
	Thu,  2 May 2019 04:39:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CBA01746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556764843;
	bh=V61Ohvnp9/+e7JK1avSl5Dd/YufWmordQ7lFJKUO8Uk=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=IPFowEk/7iZICJNpJZxPiR4tV9mIB8mc9xPUNzmtAZjQT1ypLNT+nYrB2kpmjQY1w
	 q6xVAwHSYoU8X0IhYf5VJUyU+wqeaZwMAOj7GJisrq/lDNuGaVhw7/hu0c6nq6rpG7
	 f/cau2cMTAIGRo8euHVhi2wrRIJztXrKHCIBKrpc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9EA3F897C8;
	Thu,  2 May 2019 04:19:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04A23F89764; Thu,  2 May 2019 04:19:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B7DFF8975A
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 04:19:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B7DFF8975A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="oLzyp+d1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=R2j1F1wG65fNXhdJylyMnKqAApoSPDTfJTSPsQzYInI=; b=oLzyp+d1FTxd
 XFjAxkD/AxSEaW4Wk1USCkF73J1VnldM6Cae4/6zjUCOnIKUEHQ/mD8Dcrm8WFs/CFAUEVdDps4Av
 KAarUqzYoYLU8GEOs3Z2c7rDQ+1EubOQX0x7BrLhD/+sKI+D8u4yCXFf8WDwDGAlS81cx1gKG9mll
 oV9Xg=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hM1JQ-0005vZ-Hf; Thu, 02 May 2019 02:19:04 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 5D8EE441D3D; Thu,  2 May 2019 03:19:00 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Daniel Gomez <dagmcr@gmail.com>
In-Reply-To: <1555960353-8836-1-git-send-email-dagmcr@gmail.com>
X-Patchwork-Hint: ignore
Message-Id: <20190502021900.5D8EE441D3D@finisterre.ee.mobilebroadband>
Date: Thu,  2 May 2019 03:19:00 +0100 (BST)
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, tiwai@suse.com,
 lgirdwood@gmail.com, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, dagmcr@gmail.com,
 Javier Martinez Canillas <javier@dowhile0.org>
Subject: [alsa-devel] Applied "spi: AD ASoC: declare missing of table" to
	the spi tree
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

   spi: AD ASoC: declare missing of table

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-5.2

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

From 2a168e10d6db7b77190c55d994e42fc5a58fc8e5 Mon Sep 17 00:00:00 2001
From: Daniel Gomez <dagmcr@gmail.com>
Date: Mon, 22 Apr 2019 21:12:33 +0200
Subject: [PATCH] spi: AD ASoC: declare missing of table

Add missing <of_device_id> table for SPI driver relying on SPI
device match since compatible is in a DT binding or in a DTS.

Before this patch:
modinfo sound/soc/codecs/snd-soc-adau1977-spi.ko | grep alias
alias:          spi:adau1979
alias:          spi:adau1978
alias:          spi:adau1977

After this patch:
modinfo sound/soc/codecs/snd-soc-adau1977-spi.ko | grep alias
alias:          of:N*T*Cadi,adau1979C*
alias:          of:N*T*Cadi,adau1979
alias:          of:N*T*Cadi,adau1978C*
alias:          of:N*T*Cadi,adau1978
alias:          of:N*T*Cadi,adau1977C*
alias:          of:N*T*Cadi,adau1977
alias:          spi:adau1979
alias:          spi:adau1978
alias:          spi:adau1977

Reported-by: Javier Martinez Canillas <javier@dowhile0.org>
Signed-off-by: Daniel Gomez <dagmcr@gmail.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/adau1977-spi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/codecs/adau1977-spi.c b/sound/soc/codecs/adau1977-spi.c
index 84ffbde9583f..2baf61567b59 100644
--- a/sound/soc/codecs/adau1977-spi.c
+++ b/sound/soc/codecs/adau1977-spi.c
@@ -10,6 +10,8 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/spi/spi.h>
 #include <sound/soc.h>
 
@@ -54,9 +56,18 @@ static const struct spi_device_id adau1977_spi_ids[] = {
 };
 MODULE_DEVICE_TABLE(spi, adau1977_spi_ids);
 
+static const struct of_device_id adau1977_spi_of_match[] = {
+        { .compatible = "adi,adau1977" },
+        { .compatible = "adi,adau1978" },
+        { .compatible = "adi,adau1979" },
+        { },
+};
+MODULE_DEVICE_TABLE(of, adau1977_spi_of_match);
+
 static struct spi_driver adau1977_spi_driver = {
 	.driver = {
 		.name = "adau1977",
+		.of_match_table = of_match_ptr(adau1977_spi_of_match),
 	},
 	.probe = adau1977_spi_probe,
 	.id_table = adau1977_spi_ids,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
