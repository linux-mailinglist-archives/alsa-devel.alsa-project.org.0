Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD3C4E6E7A
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Mar 2022 08:03:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D62016B2;
	Fri, 25 Mar 2022 08:02:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D62016B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648191782;
	bh=aQhDMzYn+xYfNiecCIb8OV7QTYcdC0WnbBLgJwssVFw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=irvcfSv8vMWbwM7To7BFA1lmLwBRXrSgcJltC8BDacd8vcCV/33spHYPeK16hvq60
	 xgDaokJKkyEMhHgmj8E4QHscNPCU9enmaF3zZ2lH7fSQbk2h2Eiq1wnYZHyNYvD5GM
	 rjOS73e1Vyou/xvXAInihy9pFBoKiQaAoAfH2Ef8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB5F6F80115;
	Fri, 25 Mar 2022 08:01:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5898AF802DB; Wed, 23 Mar 2022 14:59:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B347F800C1
 for <alsa-devel@alsa-project.org>; Wed, 23 Mar 2022 14:59:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B347F800C1
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4KNqj51jH8z1GCh3;
 Wed, 23 Mar 2022 21:59:21 +0800 (CST)
Received: from huawei.com (10.175.104.82) by canpemm500005.china.huawei.com
 (7.192.104.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Wed, 23 Mar
 2022 21:59:29 +0800
From: Baisong Zhong <zhongbaisong@huawei.com>
To: <linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH -next] ASoC: tlv320adc3xxx: Fix build error when GPIOLIB is
 not set
Date: Wed, 23 Mar 2022 22:17:36 +0800
Message-ID: <20220323141737.211198-1-zhongbaisong@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.104.82]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 canpemm500005.china.huawei.com (7.192.104.229)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 25 Mar 2022 08:01:55 +0100
Cc: drhodes@opensource.cirrus.com, pierre-louis.bossart@linux.intel.com,
 ckeepax@opensource.cirrus.com, tanureal@opensource.cirrus.com,
 hdegoede@redhat.com, tiwai@suse.com, lgirdwood@gmail.com, cy_huang@richtek.com,
 ricardw@axis.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 pbrobinson@gmail.com, lukas.bulwahn@gmail.com
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

sound/soc/codecs/tlv320adc3xxx.c:1352:21: error: implicit declaration of function ‘devm_gpiod_get’; did you mean ‘devm_gpio_free’?
sound/soc/codecs/tlv320adc3xxx.c:1352:50: error: ‘GPIOD_OUT_LOW’ undeclared (first use in this function); did you mean ‘GPIOF_INIT_LOW’?
sound/soc/codecs/tlv320adc3xxx.c:1400:2: error: implicit declaration of function ‘gpiod_set_value_cansleep’; did you mean ‘gpio_set_value_cansleep’?

Fixes: e9a3b57efd28 ("ASoC: codec: tlv320adc3xxx: New codec driver")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Baisong Zhong <zhongbaisong@huawei.com>
---
 sound/soc/codecs/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index f46a22660103..1400fc75fd65 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1535,7 +1535,7 @@ config SND_SOC_TFA989X
 
 config SND_SOC_TLV320ADC3XXX
 	tristate "Texas Instruments TLV320ADC3001/3101 audio ADC"
-	depends on I2C
+	depends on I2C && GPIOLIB
 	help
 	 Enable support for Texas Instruments TLV320ADC3001 and TLV320ADC3101
 	 ADCs.
-- 
2.25.1

