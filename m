Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF60CCF23
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Oct 2019 09:24:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 137C41661;
	Sun,  6 Oct 2019 09:24:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 137C41661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570346697;
	bh=cd8a892J6gB3Y03XPiu7rga++rOUkB9er6+W1uetegY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PQATYcl5606ytkfCjlIdmPnluz5OLIfVVSG/WtQnXfgLwl71njkqTCQWMJkvBNMpZ
	 Q3lX9UCqwgLxgd25FOcl4NvQxgvRBt+1ZeQ0qqLsyEowsp/kJXU4sjlZd4lwLll9SR
	 8NHJZwdDmXrcF6u1R9fym7K7hoJ00WhwCUCE6xIQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DA3AF80322;
	Sun,  6 Oct 2019 09:23:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBF77F80322; Sun,  6 Oct 2019 09:23:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3456F80137
 for <alsa-devel@alsa-project.org>; Sun,  6 Oct 2019 09:23:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3456F80137
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 90AA93774B1F60D3DFA7;
 Sun,  6 Oct 2019 15:22:58 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Sun, 6 Oct 2019
 15:22:47 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <ckeepax@opensource.cirrus.com>,
 <rf@opensource.wolfsonmicro.com>, <piotrs@opensource.cirrus.com>,
 <enric.balletbo@collabora.com>, <paul@crapouillou.net>,
 <srinivas.kandagatla@linaro.org>, <andradanciu1997@gmail.com>,
 <mirq-linux@rere.qmqm.pl>, <kuninori.morimoto.gx@renesas.com>,
 <m.felsch@pengutronix.de>, <shifu0704@thundersoft.com>
Date: Sun, 6 Oct 2019 15:22:41 +0800
Message-ID: <20191006072241.56808-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH -next] ASoc: tas2770: Fix build error without
	GPIOLIB
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

If GPIOLIB is not set, building fails:

sound/soc/codecs/tas2770.c: In function tas2770_reset:
sound/soc/codecs/tas2770.c:38:3: error: implicit declaration of function gpiod_set_value_cansleep; did you mean gpio_set_value_cansleep? [-Werror=implicit-function-declaration]
   gpiod_set_value_cansleep(tas2770->reset_gpio, 0);
   ^~~~~~~~~~~~~~~~~~~~~~~~
   gpio_set_value_cansleep
sound/soc/codecs/tas2770.c: In function tas2770_i2c_probe:
sound/soc/codecs/tas2770.c:749:24: error: implicit declaration of function devm_gpiod_get_optional; did you mean devm_regulator_get_optional? [-Werror=implicit-function-declaration]
  tas2770->reset_gpio = devm_gpiod_get_optional(tas2770->dev,
                        ^~~~~~~~~~~~~~~~~~~~~~~
                        devm_regulator_get_optional
sound/soc/codecs/tas2770.c:751:13: error: GPIOD_OUT_HIGH undeclared (first use in this function); did you mean GPIOF_INIT_HIGH?
             GPIOD_OUT_HIGH);
             ^~~~~~~~~~~~~~
             GPIOF_INIT_HIGH

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 1a476abc723e ("tas2770: add tas2770 smart PA kernel driver")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/soc/codecs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index bcac957..d639f17 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1108,6 +1108,7 @@ config SND_SOC_TAS2552
 config SND_SOC_TAS2770
 	tristate "Texas Instruments TAS2770 speaker amplifier"
 	depends on I2C
+	select GPIOLIB
 
 config SND_SOC_TAS5086
 	tristate "Texas Instruments TAS5086 speaker amplifier"
-- 
2.7.4


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
