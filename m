Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4713D43A3
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2019 17:03:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A6F01676;
	Fri, 11 Oct 2019 17:02:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A6F01676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570806187;
	bh=oqbmHmJBUSKAUG7IElKeOYWYWgsiGd71aTa7tidUHTU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XX8E8sziGtav9uifDQBY78HZwd7pabecaxIjSXOjSomr1Pz0X2Eo8GgHhBB4/KIV1
	 WPG5CoH/v4LYadBP+kgGwk+w2l66SpGAIwGR940B3cTZ/eBXB19SOXoAhYZTqBQFTK
	 8dMwLTr2Gph6msguM5GuVAaiFytFFP6obEhX6OF8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EA6DF802DF;
	Fri, 11 Oct 2019 17:01:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24F83F802BE; Fri, 11 Oct 2019 17:01:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88733F80113
 for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2019 17:01:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88733F80113
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 191083191309D95217E8;
 Fri, 11 Oct 2019 23:01:12 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Fri, 11 Oct 2019
 23:01:01 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <nuno.sa@analog.com>, <ckeepax@opensource.cirrus.com>,
 <rf@opensource.wolfsonmicro.com>, <piotrs@opensource.cirrus.com>,
 <npoushin@opensource.cirrus.com>, <paul@crapouillou.net>, <krzk@kernel.org>,
 <enric.balletbo@collabora.com>
Date: Fri, 11 Oct 2019 23:00:42 +0800
Message-ID: <20191011150042.20096-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH -next] ASoC: adau7118: Fix Kconfig warning
	without CONFIG_I2C
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

When building a kernel without CONFIG_I2C, Kconfig warns:

WARNING: unmet direct dependencies detected for REGMAP_I2C
  Depends on [n]: I2C [=n]
  Selected by [y]:
  - SND_SOC_ADAU7118_I2C [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y]

Add missing I2C dependency to SND_SOC_ADAU7118_I2C to fix this.

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: ca514c0f12b0 ("ASOC: Add ADAU7118 8 Channel PDM-to-I2S/TDM Converter driver")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/soc/codecs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index d196752..6a28741 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -416,6 +416,7 @@ config SND_SOC_ADAU7118_HW
 
 config SND_SOC_ADAU7118_I2C
 	tristate "Analog Devices ADAU7118 8 Channel PDM-to-I2S/TDM Converter - I2C"
+	depends on I2C
 	select SND_SOC_ADAU7118
 	select REGMAP_I2C
 	help
-- 
2.7.4


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
