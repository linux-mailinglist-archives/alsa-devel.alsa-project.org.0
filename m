Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D189524760
	for <lists+alsa-devel@lfdr.de>; Thu, 12 May 2022 09:49:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0CFE1A8F;
	Thu, 12 May 2022 09:48:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0CFE1A8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652341789;
	bh=muNpsae9VSklWvCyjpkkDoMQxPZbcQXdAki9eATOwZw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y8C0kdOsG1+wGYOFQLyPVIpIOxpJnPEeUvf83L9pj882Yr45d50I5JoHsr/idhqIT
	 Ay4k4Ihrx9ZfGvQaPl8H1JwrjNUanp+QmfJ4wRlYKfXSY8UHE37AXR7frXDY5jXV8h
	 j4nwJEQZ/6kMXme2OcbnQf7COGGFE3McUO0yiDcM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20DC7F80508;
	Thu, 12 May 2022 09:48:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A820F8027C; Thu, 12 May 2022 09:48:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CF79F8011C
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 09:48:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CF79F8011C
Received: from kwepemi500005.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4KzP4J1JsJz1JBsZ;
 Thu, 12 May 2022 15:46:56 +0800 (CST)
Received: from kwepemm600005.china.huawei.com (7.193.23.191) by
 kwepemi500005.china.huawei.com (7.221.188.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 12 May 2022 15:48:09 +0800
Received: from ubuntu1804.huawei.com (10.67.175.30) by
 kwepemm600005.china.huawei.com (7.193.23.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 12 May 2022 15:48:08 +0800
From: Hui Tang <tanghui20@huawei.com>
To: <lgirdwood@gmail.com>
Subject: [PATCH -next v2 1/2] ASoC: max98396: Fix build error for implicit
 function declaration
Date: Thu, 12 May 2022 15:46:39 +0800
Message-ID: <20220512074640.75550-2-tanghui20@huawei.com>
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

sound/soc/codecs/max98396.c: In function ‘max98396_i2c_probe’:
sound/soc/codecs/max98396.c:1555:25: error: implicit declaration of function ‘devm_gpiod_get_optional’; did you mean ‘devm_regulator_get_optional’? [-Werror=implicit-function-declaration]
  max98396->reset_gpio = devm_gpiod_get_optional(&i2c->dev,
                         ^~~~~~~~~~~~~~~~~~~~~~~
                         devm_regulator_get_optional
sound/soc/codecs/max98396.c:1556:23: error: ‘GPIOD_OUT_HIGH’ undeclared (first use in this function); did you mean ‘GPIOF_INIT_HIGH’?
              "reset", GPIOD_OUT_HIGH);
                       ^~~~~~~~~~~~~~
                       GPIOF_INIT_HIGH
sound/soc/codecs/max98396.c:1556:23: note: each undeclared identifier is reported only once for each function it appears in
sound/soc/codecs/max98396.c:1565:3: error: implicit declaration of function ‘gpiod_set_value_cansleep’; did you mean ‘gpio_set_value_cansleep’? [-Werror=implicit-function-declaration]
   gpiod_set_value_cansleep(max98396->reset_gpio, 0);
   ^~~~~~~~~~~~~~~~~~~~~~~~
   gpio_set_value_cansleep
cc1: all warnings being treated as errors

Include header file <linux/gpio/consumer.h>

Fixes: b58581136770 ("ASoC: max98396: add amplifier driver")
Signed-off-by: Hui Tang <tanghui20@huawei.com>
---
Changes in v2:
 * Add missing header files instead of adding dependencies

 sound/soc/codecs/max98396.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/max98396.c b/sound/soc/codecs/max98396.c
index 745d7e761680..56eb62bb041f 100644
--- a/sound/soc/codecs/max98396.c
+++ b/sound/soc/codecs/max98396.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2022, Analog Devices Inc.
 
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <sound/pcm_params.h>
-- 
2.17.1

