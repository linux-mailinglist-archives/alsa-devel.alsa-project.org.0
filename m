Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1DC524762
	for <lists+alsa-devel@lfdr.de>; Thu, 12 May 2022 09:50:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAA1C1AAB;
	Thu, 12 May 2022 09:49:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAA1C1AAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652341800;
	bh=ymmsbmJM071zOhHnKUdDNkTjzQddpjO5iptw0dapwgE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZVjn+BO1HWRlwW3kah4mJSfcF4zfx1ZyLuUMXhmCcvkpptx1VZKHhLLk8P3MppOva
	 dMgge5xpCujrUZz9986tutDdujqBmLRGXH6f5emh+9XYkf1Zc3XuXfnVKnyOVBRvjB
	 FVv9UtkWlxfCYmCYEcaNcbDAgQZYwekXdddu9cmA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE7A4F80519;
	Thu, 12 May 2022 09:48:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0775F80508; Thu, 12 May 2022 09:48:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 232CDF800BB
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 09:48:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 232CDF800BB
Received: from kwepemi500004.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KzP2S427TzGpbC;
 Thu, 12 May 2022 15:45:20 +0800 (CST)
Received: from kwepemm600005.china.huawei.com (7.193.23.191) by
 kwepemi500004.china.huawei.com (7.221.188.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 12 May 2022 15:48:09 +0800
Received: from ubuntu1804.huawei.com (10.67.175.30) by
 kwepemm600005.china.huawei.com (7.193.23.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 12 May 2022 15:48:09 +0800
From: Hui Tang <tanghui20@huawei.com>
To: <lgirdwood@gmail.com>
Subject: [PATCH -next v2 2/2] ASoC: tlv320adc3xxx: Fix build error for
 implicit function declaration
Date: Thu, 12 May 2022 15:46:40 +0800
Message-ID: <20220512074640.75550-3-tanghui20@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220512074640.75550-1-tanghui20@huawei.com>
References: <20220512074640.75550-1-tanghui20@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.175.30]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600005.china.huawei.com (7.193.23.191)
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, steve@sk2.org, tanghui20@huawei.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, ricardw@axis.com,
 broonie@kernel.org, ryan.lee.analog@gmail.com
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

sound/soc/codecs/tlv320adc3xxx.c: In function ‘adc3xxx_i2c_probe’:
sound/soc/codecs/tlv320adc3xxx.c:1359:21: error: implicit declaration of function ‘devm_gpiod_get’; did you mean ‘devm_gpio_free’? [-Werror=implicit-function-declaration]
  adc3xxx->rst_pin = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
                     ^~~~~~~~~~~~~~
                     devm_gpio_free
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/sorgt215.o
  LD [M]  sound/soc/codecs/snd-soc-ak4671.o
  LD [M]  sound/soc/codecs/snd-soc-arizona.o
  LD [M]  sound/soc/codecs/snd-soc-cros-ec-codec.o
  LD [M]  sound/soc/codecs/snd-soc-ak4641.o
  LD [M]  sound/soc/codecs/snd-soc-alc5632.o
sound/soc/codecs/tlv320adc3xxx.c:1359:50: error: ‘GPIOD_OUT_LOW’ undeclared (first use in this function); did you mean ‘GPIOF_INIT_LOW’?
  adc3xxx->rst_pin = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
                                                  ^~~~~~~~~~~~~
                                                  GPIOF_INIT_LOW
sound/soc/codecs/tlv320adc3xxx.c:1359:50: note: each undeclared identifier is reported only once for each function it appears in
  LD [M]  sound/soc/codecs/snd-soc-cs35l32.o
sound/soc/codecs/tlv320adc3xxx.c:1408:2: error: implicit declaration of function ‘gpiod_set_value_cansleep’; did you mean ‘gpio_set_value_cansleep’? [-Werror=implicit-function-declaration]
  gpiod_set_value_cansleep(adc3xxx->rst_pin, 1);
  ^~~~~~~~~~~~~~~~~~~~~~~~
  gpio_set_value_cansleep
  LD [M]  sound/soc/codecs/snd-soc-cs35l41-lib.o
  LD [M]  sound/soc/codecs/snd-soc-cs35l36.o
  LD [M]  sound/soc/codecs/snd-soc-cs35l34.o
  LD [M]  sound/soc/codecs/snd-soc-cs35l41.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/sormcp89.o
cc1: all warnings being treated as errors

Fixes: e9a3b57efd28 ("ASoC: codec: tlv320adc3xxx: New codec driver")
Signed-off-by: Hui Tang <tanghui20@huawei.com>
---
Changes in v2:
* Add missing header files instead of adding dependencies
* Calling 'gpiochip_remove' depends on 'CONFIG_GPIOLIB' enabled

 sound/soc/codecs/tlv320adc3xxx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/tlv320adc3xxx.c b/sound/soc/codecs/tlv320adc3xxx.c
index a5e9f80cfa32..80b8115e6053 100644
--- a/sound/soc/codecs/tlv320adc3xxx.c
+++ b/sound/soc/codecs/tlv320adc3xxx.c
@@ -14,6 +14,7 @@
 
 #include <dt-bindings/sound/tlv320adc3xxx.h>
 #include <linux/clk.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/io.h>
@@ -1025,7 +1026,9 @@ static const struct gpio_chip adc3xxx_gpio_chip = {
 
 static void adc3xxx_free_gpio(struct adc3xxx *adc3xxx)
 {
+#ifdef CONFIG_GPIOLIB
 	gpiochip_remove(&adc3xxx->gpio_chip);
+#endif
 }
 
 static void adc3xxx_init_gpio(struct adc3xxx *adc3xxx)
-- 
2.17.1

