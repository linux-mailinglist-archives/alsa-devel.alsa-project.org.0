Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D92391A55
	for <lists+alsa-devel@lfdr.de>; Wed, 26 May 2021 16:34:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17A7E1744;
	Wed, 26 May 2021 16:33:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17A7E1744
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622039676;
	bh=h2b2O5YS9rXHW8nPneCksqCazi5ASQyPtvRQnplwSa0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PcuZzAWbiCPnEZ9CfVoZIo0QGD4nE6qpYgJebYtBiQa8ADR1DA5KnXTbTcBWmnwDY
	 ocTbo/4HDXx/oiEzji42Nq/fosU2Aex7Buu/h6Lutw8eGVTEqeNp0cMLdHtyHT7o23
	 hw4loAyTctDXcd5brs97Yad+QXncXcoQS9iD5+ls=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67496F80260;
	Wed, 26 May 2021 16:33:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53E80F8025C; Wed, 26 May 2021 16:33:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2917AF8011B
 for <alsa-devel@alsa-project.org>; Wed, 26 May 2021 16:32:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2917AF8011B
Received: from dggems706-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FqtdK0lHNzmV6V;
 Wed, 26 May 2021 22:29:57 +0800 (CST)
Received: from dggeml759-chm.china.huawei.com (10.1.199.138) by
 dggems706-chm.china.huawei.com (10.3.19.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 26 May 2021 22:32:48 +0800
Received: from localhost.localdomain (10.175.102.38) by
 dggeml759-chm.china.huawei.com (10.1.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 26 May 2021 22:32:48 +0800
From: Wei Yongjun <weiyongjun1@huawei.com>
To: <weiyongjun1@huawei.com>, Simon Shields <simon@lineageos.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@canonical.com>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>
Subject: [PATCH -next] ASoC: samsung: midas_wm1811: Fix build error when
 CONFIG_GPIOLIB is not set
Date: Wed, 26 May 2021 14:43:39 +0000
Message-ID: <20210526144339.2392592-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.102.38]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggeml759-chm.china.huawei.com (10.1.199.138)
X-CFilter-Loop: Reflected
Cc: Hulk Robot <hulkci@huawei.com>, alsa-devel@alsa-project.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

Fix build error when CONFIG_GPIOLIB is not set:

sound/soc/samsung/midas_wm1811.c: In function 'midas_fm_set':
sound/soc/samsung/midas_wm1811.c:205:3: error:
 implicit declaration of function 'gpiod_set_value_cansleep';
 did you mean 'gpio_set_value_cansleep'? [-Werror=implicit-function-declaration]
  205 |   gpiod_set_value_cansleep(priv->gpio_fm_sel, 1);
      |   ^~~~~~~~~~~~~~~~~~~~~~~~
      |   gpio_set_value_cansleep
sound/soc/samsung/midas_wm1811.c: In function 'midas_probe':
sound/soc/samsung/midas_wm1811.c:445:22: error:
 implicit declaration of function 'devm_gpiod_get_optional';
 did you mean 'devm_clk_get_optional'? [-Werror=implicit-function-declaration]
  445 |  priv->gpio_fm_sel = devm_gpiod_get_optional(dev, "fm-sel", GPIOD_OUT_HIGH);
      |                      ^~~~~~~~~~~~~~~~~~~~~~~
      |                      devm_clk_get_optional
sound/soc/samsung/midas_wm1811.c:445:61:
 error: 'GPIOD_OUT_HIGH' undeclared (first use in this function);
 did you mean 'GPIOF_INIT_HIGH'?
  445 |  priv->gpio_fm_sel = devm_gpiod_get_optional(dev, "fm-sel", GPIOD_OUT_HIGH);
      |                                                             ^~~~~~~~~~~~~~
      |                                                             GPIOF_INIT_HIGH

Fixes: fd0ea9cd9698 ("ASoC: samsung: Add sound support for Midas boards")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 sound/soc/samsung/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index a2221ebb1b6a..22be597b1dd9 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -228,6 +228,7 @@ config SND_SOC_SAMSUNG_ARIES_WM8994
 config SND_SOC_SAMSUNG_MIDAS_WM1811
 	tristate "SoC I2S Audio support for Midas boards"
 	depends on SND_SOC_SAMSUNG
+	depends on GPIOLIB
 	select SND_SAMSUNG_I2S
 	select SND_SOC_WM8994
 	help

