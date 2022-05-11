Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F3F5232C4
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 14:17:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF6F61A4E;
	Wed, 11 May 2022 14:16:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF6F61A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652271452;
	bh=LnDKYFQIzVPKQaqvZ0a/U1kxPd2j+Aq6ofzNpX/jCVM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A3LdLxUIurbeaAuDsRLmUBYX3wVHk3J6UlPpMLZLdgDbDhOHIBLBMXSXOO7i2QIqf
	 whj3XBVXb+UDohUrmuZim/bpEHvQ3zLr3oir4BPRvY3Vdpm/GPQ+KLqlUri999rBVD
	 9InsI8qWtgHk8uaJzCpRwXFKcvvxzBiYls9LxXMI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1085AF8052E;
	Wed, 11 May 2022 14:15:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE1E8F8015B; Wed, 11 May 2022 03:25:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 538B7F8015B
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 03:25:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 538B7F8015B
Received: from kwepemi500016.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4KycXt4CcfzCscn;
 Wed, 11 May 2022 09:20:30 +0800 (CST)
Received: from kwepemm600005.china.huawei.com (7.193.23.191) by
 kwepemi500016.china.huawei.com (7.221.188.220) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 11 May 2022 09:25:17 +0800
Received: from ubuntu1804.huawei.com (10.67.175.30) by
 kwepemm600005.china.huawei.com (7.193.23.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 11 May 2022 09:25:17 +0800
From: Hui Tang <tanghui20@huawei.com>
To: <lgirdwood@gmail.com>
Subject: [PATCH -next 2/2] ASoC: tlv320adc3xxx: Fix build error for implicit
 function declaration
Date: Wed, 11 May 2022 09:23:48 +0800
Message-ID: <20220511012348.94288-3-tanghui20@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220511012348.94288-1-tanghui20@huawei.com>
References: <20220511012348.94288-1-tanghui20@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.175.30]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600005.china.huawei.com (7.193.23.191)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 11 May 2022 14:14:58 +0200
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

Add depend on GPIOLIB for 'config SND_SOC_TLV320ADC3XXX'

Fixes: e9a3b57efd28 ("ASoC: codec: tlv320adc3xxx: New codec driver")
Signed-off-by: Hui Tang <tanghui20@huawei.com>
---
 sound/soc/codecs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 71a7afedd0aa..920486e01afb 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1583,6 +1583,7 @@ config SND_SOC_TFA989X
 config SND_SOC_TLV320ADC3XXX
 	tristate "Texas Instruments TLV320ADC3001/3101 audio ADC"
 	depends on I2C
+	depends on GPIOLIB
 	help
 	 Enable support for Texas Instruments TLV320ADC3001 and TLV320ADC3101
 	 ADCs.
-- 
2.17.1

