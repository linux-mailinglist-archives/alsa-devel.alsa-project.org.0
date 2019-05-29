Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBFC2E188
	for <lists+alsa-devel@lfdr.de>; Wed, 29 May 2019 17:49:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 726091612;
	Wed, 29 May 2019 17:48:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 726091612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559144948;
	bh=caVz8jFhVVX1VTtn365APziVdQGUqnVS5+/QV9G2AvA=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=beOIr5R7cJ0W4VywXUhDMj322pgP00hYTfNVjpMj0KIV+7MCdj8IZBBwi2mo0Xwxd
	 MNy81OWshBwDkk2bzGVD7RCAfZpL9URhWb8AdCpzBm24r80leTX6sGA59xkTc/DFNA
	 muLGXznuLggdOquqALucfDEYAq4HhntICzTDIS2g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D1B5F89731;
	Wed, 29 May 2019 17:45:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B402EF8972E; Wed, 29 May 2019 17:45:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3049EF896F7
 for <alsa-devel@alsa-project.org>; Wed, 29 May 2019 17:45:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3049EF896F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="RpxO9O0f"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=MbU9KTY7lRDIVaXn8e0mtzlZsMKjQlL1HDMtTrGcWVU=; b=RpxO9O0fZlZc
 SlD3qDONZ4mfn9y7+lab4VuQdISTMB2Fh66MCYFDjfDo48bOHj4vzbfJF8uZEA5c+adurrrwii8cx
 ozEhbLsRiGTKQhUHyuXzi4CgrzUalLqria5uKMVljkwNG9f1HNaBiHkQZKuLJT/TAJWfErdISVyac
 q544U=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hW0lh-00051h-5v; Wed, 29 May 2019 15:45:33 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 8B003440049; Wed, 29 May 2019 16:45:27 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20190529033002.16606-1-shengjiu.wang@nxp.com>
X-Patchwork-Hint: ignore
Message-Id: <20190529154527.8B003440049@finisterre.sirena.org.uk>
Date: Wed, 29 May 2019 16:45:27 +0100 (BST)
Cc: brian.austin@cirrus.com, alsa-devel@alsa-project.org,
 kbuild test robot <lkp@intel.com>, tiwai@suse.com, lgirdwood@gmail.com,
 Paul.Handrigan@cirrus.com, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: cs42xx8: Fix build error with
	CONFIG_GPIOLIB is not set" to the asoc tree
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
Content-Type: multipart/mixed; boundary="===============8620253319884777924=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

--===============8620253319884777924==
Content-Type: text/plain

The patch

   ASoC: cs42xx8: Fix build error with CONFIG_GPIOLIB is not set

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From 7cda6223503d592f980a222811355ab07611b821 Mon Sep 17 00:00:00 2001
From: Shengjiu Wang <shengjiu.wang@nxp.com>
Date: Wed, 29 May 2019 11:30:02 +0800
Subject: [PATCH] ASoC: cs42xx8: Fix build error with CONFIG_GPIOLIB is not set
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

config: x86_64-randconfig-x000201921-201921
compiler: gcc-7 (Debian 7.3.0-1) 7.3.0
reproduce:
        make ARCH=x86_64

sound/soc/codecs/cs42xx8.c: In function ‘cs42xx8_probe’:
sound/soc/codecs/cs42xx8.c:472:25: error: implicit declaration of function ‘devm_gpiod_get_optional’; did you mean ‘devm_clk_get_optional’? [-Werror=implicit-function-declaration]
  cs42xx8->gpiod_reset = devm_gpiod_get_optional(dev, "reset",
                         ^~~~~~~~~~~~~~~~~~~~~~~
                         devm_clk_get_optional
sound/soc/codecs/cs42xx8.c:473:8: error: ‘GPIOD_OUT_HIGH’ undeclared (first use in this function); did you mean ‘GPIOF_INIT_HIGH’?
        GPIOD_OUT_HIGH);
        ^~~~~~~~~~~~~~
        GPIOF_INIT_HIGH
sound/soc/codecs/cs42xx8.c:473:8: note: each undeclared identifier is reported only once for each function it appears in
sound/soc/codecs/cs42xx8.c:477:2: error: implicit declaration of function ‘gpiod_set_value_cansleep’; did you mean ‘gpio_set_value_cansleep’? [-Werror=implicit-function-declaration]
  gpiod_set_value_cansleep(cs42xx8->gpiod_reset, 0);
  ^~~~~~~~~~~~~~~~~~~~~~~~
  gpio_set_value_cansleep

Fixes: bfe95dfa4dac ("ASoC: cs42xx8: Add reset gpio handling")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs42xx8.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42xx8.c b/sound/soc/codecs/cs42xx8.c
index b377cddaf2e6..6203f54d9f25 100644
--- a/sound/soc/codecs/cs42xx8.c
+++ b/sound/soc/codecs/cs42xx8.c
@@ -14,7 +14,7 @@
 #include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
-#include <linux/of_gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <sound/pcm_params.h>
-- 
2.20.1


--===============8620253319884777924==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8620253319884777924==--
