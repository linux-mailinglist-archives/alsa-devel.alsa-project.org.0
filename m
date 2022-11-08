Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD5D62049E
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Nov 2022 01:20:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A1831DE;
	Tue,  8 Nov 2022 01:19:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A1831DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667866813;
	bh=xj3z7G/FKRg9G+gy6ZBKkZeKVn4ydln82Zy5Cft2/iw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oxl5MuUs9WAwWwCE5YHN/uqyVAkKJLma5k8Az5blp+ys8N39Z+JOZg8jcvTzqD287
	 +i//gcmghAc3Gd0BStQl2dyUfgKwgC/wpl4zOm9w6SVQWZUwVuKzhXxgrtzIiONsRO
	 K4QeyvRX+NCIHi0RO6Kmb1dNW+RgS8xgJs0PAX20=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89529F804BD;
	Tue,  8 Nov 2022 01:19:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68438F80116; Tue,  8 Nov 2022 01:19:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0273F80116
 for <alsa-devel@alsa-project.org>; Tue,  8 Nov 2022 01:18:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0273F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="XamMSY/b"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=Yiskkd7T/nB40qx451boflfjbNugQ6mEMun4CQBvACc=; b=XamMSY/bxGcsQbSlRp8xCGS1jP
 RW3oLIj2VVWyDftruFmaGgpX1D1cLOxSVhOctzPyO9EezB71Euui/vACNeoDkM4gV8OlYEYIyIkT5
 T1MfGo1PX04C8YzFXTUUsY13/YOc6zC1HeUngel5Ezn1H7iK8eYZvJAeTxiwtXNewxA+Xix5Km3dN
 e+YIEKnDRm6ZrzesIOPNWK9XTGCRb0EHip5Cno/ZypWUHzBEHG82XfKw3NDWJlHqptaA6zgEOWRIr
 ML35a+egq1HTiWRBxNR6+mbt18RvR8kgCls/KJKiu5BdStfq+Es3c4mZcmr2JVxWQWAik44C51SGb
 JWcReBnw==;
Received: from [2601:1c2:d80:3110::a2e7] (helo=casper.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1osCK7-009o58-IY; Tue, 08 Nov 2022 00:18:40 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: codecs: wsa883x: use correct header file
Date: Mon,  7 Nov 2022 16:18:29 -0800
Message-Id: <20221108001829.5100-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Takashi Iwai <tiwai@suse.com>
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

Fix build errors when GPIOLIB is not set/enabled:

../sound/soc/codecs/wsa883x.c: In function 'wsa883x_probe':
../sound/soc/codecs/wsa883x.c:1394:25: error: implicit declaration of function 'devm_gpiod_get_optional'; did you mean 'devm_regulator_get_optional'? [-Werror=implicit-function-declaration]
         wsa883x->sd_n = devm_gpiod_get_optional(&pdev->dev, "powerdown",
../sound/soc/codecs/wsa883x.c:1395:49: error: 'GPIOD_FLAGS_BIT_NONEXCLUSIVE' undeclared (first use in this function)
         GPIOD_FLAGS_BIT_NONEXCLUSIVE);
../sound/soc/codecs/wsa883x.c:1414:9: error: implicit declaration of function 'gpiod_direction_output'; did you mean 'gpio_direction_output'? [-Werror=implicit-function-declaration]
         gpiod_direction_output(wsa883x->sd_n, 1);

Fixes: 43b8c7dc85a1 ("ASoC: codecs: add wsa883x amplifier support")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Banajit Goswami <bgoswami@quicinc.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
---
v2: add the correct header file instead of messing with GPIOLIB in Kconfig

 sound/soc/codecs/wsa883x.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -- a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -7,7 +7,7 @@
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/device.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
