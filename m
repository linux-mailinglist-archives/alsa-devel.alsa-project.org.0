Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A79891B0B96
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 14:57:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 510A4167B;
	Mon, 20 Apr 2020 14:56:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 510A4167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587387467;
	bh=wsK/9dU9PrYnuBYz2GOVIjNOK+Le5NdKjVuV1pFv1w4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mfg+eTK/LnFCTEC9k5UDlIs81H02QwXjZb6FoNXyfZv6+yMCFPEw6dQZgjJ1CoFY8
	 DiTDJ1Glq/rz/eXTvfEUns/TOE7GC5je32+b1CGDPBOZnWciCsU4LtFCuL/ar/5/e+
	 01AT9EzSmJc33UZFISU+ACI5my0SHSUcGWrnDyeA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1C2AF8028D;
	Mon, 20 Apr 2020 14:55:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55A4BF8023F; Mon, 20 Apr 2020 14:26:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DATE_IN_FUTURE_06_12,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55EBEF800E7
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 14:26:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55EBEF800E7
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 1776992AF7BEDEBF3F29;
 Mon, 20 Apr 2020 20:26:29 +0800 (CST)
Received: from euler.huawei.com (10.175.104.193) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Mon, 20 Apr 2020 20:26:26 +0800
From: Wei Li <liwei391@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <rdunlap@infradead.org>, <geert@linux-m68k.org>
Subject: [PATCH 1/2] ASoC: wm89xx: Fix build errors caused by I2C dependency
Date: Tue, 21 Apr 2020 04:24:09 +0800
Message-ID: <20200420202410.47327-2-liwei391@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200420202410.47327-1-liwei391@huawei.com>
References: <20200420202410.47327-1-liwei391@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.193]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 20 Apr 2020 14:55:51 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

When I2C=m, SND_SOC_WM8900=y, SND_SOC_WM8988=y, SND_SOC_WM8995=y:

sound/soc/codecs/wm8900.o: In function `wm8900_i2c_probe':
wm8900.c:(.text+0xa16): undefined reference to `__devm_regmap_init_i2c'
sound/soc/codecs/wm8900.o: In function `wm8900_modinit':
wm8900.c:(.init.text+0xb): undefined reference to `i2c_register_driver'
sound/soc/codecs/wm8900.o: In function `wm8900_exit':
wm8900.c:(.exit.text+0x8): undefined reference to `i2c_del_driver'
sound/soc/codecs/wm8988.o: In function `wm8988_i2c_probe':
wm8988.c:(.text+0x86b): undefined reference to `__devm_regmap_init_i2c'
sound/soc/codecs/wm8988.o: In function `wm8988_modinit':
wm8988.c:(.init.text+0xb): undefined reference to `i2c_register_driver'
sound/soc/codecs/wm8988.o: In function `wm8988_exit':
wm8988.c:(.exit.text+0x8): undefined reference to `i2c_del_driver'
sound/soc/codecs/wm8995.o: In function `wm8995_i2c_probe':
wm8995.c:(.text+0x1b5b): undefined reference to `__devm_regmap_init_i2c'
sound/soc/codecs/wm8995.o: In function `wm8995_modinit':
wm8995.c:(.init.text+0xb): undefined reference to `i2c_register_driver'
sound/soc/codecs/wm8995.o: In function `wm8995_exit':
wm8995.c:(.exit.text+0x8): undefined reference to `i2c_del_driver'

As these drivers support I2C and SPI, we add the SND_SOC_I2C_AND_SPI
dependency to solve it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: ea00d95200d02 ("ASoC: Use imply for SND_SOC_ALL_CODECS")
Signed-off-by: Wei Li <liwei391@huawei.com>
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

