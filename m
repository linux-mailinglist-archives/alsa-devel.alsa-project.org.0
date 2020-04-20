Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD7C1B0B59
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 14:55:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BD8C168A;
	Mon, 20 Apr 2020 14:54:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BD8C168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587387346;
	bh=8fzhGCgld7/tgc4hmG3wKNfwEsn1G/yxdYo8/YZG9VQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jf/bzoSzb8n0yGm3HVvesKdcRffxsy/WDzeM5GV8KjYGrxLavrSnr6Br5OEAfFYgW
	 bXFGSAIWgQjpmKaziRdTUEhuMEmFfU0B6rueV7LAYZsMeKPfLmHnFKr7qigatg1w4r
	 KXdsJbL3k4KycfkQkh+dlkOSDcMh5/qd+tys0TkE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B391FF8021C;
	Mon, 20 Apr 2020 14:54:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DE4EF8021C; Mon, 20 Apr 2020 14:54:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2747CF8013E
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 14:54:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2747CF8013E
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id DFF9BFC3FD05B4C312C1;
 Mon, 20 Apr 2020 20:54:30 +0800 (CST)
Received: from localhost (10.166.215.154) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Mon, 20 Apr 2020
 20:54:24 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <geert@linux-m68k.org>
Subject: [PATCH] ASoC: wm89xx: Add missing dependency
Date: Mon, 20 Apr 2020 20:53:43 +0800
Message-ID: <20200420125343.20920-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
In-Reply-To: <20200418090853.30340-1-yuehaibing@huawei.com>
References: <20200418090853.30340-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.166.215.154]
X-CFilter-Loop: Reflected
Cc: YueHaibing <yuehaibing@huawei.com>, alsa-devel@alsa-project.org,
 ckeepax@opensource.cirrus.com, linux-kernel@vger.kernel.org
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

sound/soc/codecs/wm8900.o: In function `wm8900_i2c_probe':
wm8900.c:(.text+0xa36): undefined reference to `__devm_regmap_init_i2c'
sound/soc/codecs/wm8900.o: In function `wm8900_modinit':
wm8900.c:(.init.text+0xb): undefined reference to `i2c_register_driver'
sound/soc/codecs/wm8900.o: In function `wm8900_exit':
wm8900.c:(.exit.text+0x8): undefined reference to `i2c_del_driver'
sound/soc/codecs/wm8988.o: In function `wm8988_i2c_probe':
wm8988.c:(.text+0x857): undefined reference to `__devm_regmap_init_i2c'
sound/soc/codecs/wm8988.o: In function `wm8988_modinit':
wm8988.c:(.init.text+0xb): undefined reference to `i2c_register_driver'
sound/soc/codecs/wm8988.o: In function `wm8988_exit':
wm8988.c:(.exit.text+0x8): undefined reference to `i2c_del_driver'
sound/soc/codecs/wm8995.o: In function `wm8995_i2c_probe':
wm8995.c:(.text+0x1c4f): undefined reference to `__devm_regmap_init_i2c'
sound/soc/codecs/wm8995.o: In function `wm8995_modinit':
wm8995.c:(.init.text+0xb): undefined reference to `i2c_register_driver'
sound/soc/codecs/wm8995.o: In function `wm8995_exit':
wm8995.c:(.exit.text+0x8): undefined reference to `i2c_del_driver'

Add SND_SOC_I2C_AND_SPI dependency to fix this.

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: ea00d95200d02ece ("ASoC: Use imply for SND_SOC_ALL_CODECS")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/soc/codecs/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index e6a0c5d05fa5..e60e0b6a689c 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1525,6 +1525,7 @@ config SND_SOC_WM8804_SPI
 
 config SND_SOC_WM8900
 	tristate
+	depends on SND_SOC_I2C_AND_SPI
 
 config SND_SOC_WM8903
 	tristate "Wolfson Microelectronics WM8903 CODEC"
@@ -1576,6 +1577,7 @@ config SND_SOC_WM8985
 
 config SND_SOC_WM8988
 	tristate
+	depends on SND_SOC_I2C_AND_SPI
 
 config SND_SOC_WM8990
 	tristate
@@ -1594,6 +1596,7 @@ config SND_SOC_WM8994
 
 config SND_SOC_WM8995
 	tristate
+	depends on SND_SOC_I2C_AND_SPI
 
 config SND_SOC_WM8996
 	tristate
-- 
2.17.1


