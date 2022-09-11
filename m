Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C20915B4B43
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Sep 2022 03:50:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53BB71681;
	Sun, 11 Sep 2022 03:49:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53BB71681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662861036;
	bh=tB/hD7b4iOVsDHYNw6OwrqOAlBdG4VrJDC3wzUYRlWw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dOg+hdJKvKwCSV/lClCAofKYGXWYPQ6oaHCfYfuliBg4YwcACVWP/WakXNqwtHHlV
	 spy/ps1zNrzvsWPBR+ebtqFBpgQp1ZCBjvtCsiol4tgtvhm2kn2kyDO5JQzVtG5G/h
	 dTfYA48aIZ3HlVHiqrLtMx6571UnpF3LefdFNRug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4167F800B8;
	Sun, 11 Sep 2022 03:49:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4B14F80256; Sun, 11 Sep 2022 03:49:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93A8AF8011C
 for <alsa-devel@alsa-project.org>; Sun, 11 Sep 2022 03:49:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93A8AF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="hphRvg2W"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=v6mxseQc0nruVgsZVFGEuCPSLNpAqC95AVNaz99FMPo=; b=hphRvg2WKZgW9Z3OY+c7gQ1Kfu
 fHd99ai/6FtkPtPPw7uQgj/ChUzuKzaTCftYDzLiVmpsVNVNUjT51m4ZBTsGQTKlp16iIWMgaezlI
 Qlv1zZCF6sXzgdxf8pUnHP5Oxpna8GRC63YS7/uKL/nrf9wk6vlMl47SynEa1lQp4RSMRsxJblFgk
 b0yjS2BdtrYpLD8xENhE4WEjiRmXRfpCsOg1VUvAW5BaMRXryAPC9r6Uf84C93F0EdodsXCBalSic
 apCJH6BxZXcoCJ2gjpOgGtdaqtfNWMPlPxXxQ2QPf7xHIpSdGqLcqmYv2409sZOwla/Q5OUZiEoV2
 L4cfO8WQ==;
Received: from [2601:1c0:6280:3f0::a6b3] (helo=casper.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oXC62-00EZS5-4W; Sun, 11 Sep 2022 01:49:18 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: wm8731: fix build when I2C is not enabled
Date: Sat, 10 Sep 2022 18:49:11 -0700
Message-Id: <20220911014911.6398-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
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

Building wm8731-i2c.c has a kconfig warning and build errors when
I2C is not enabled, so prevent that kconfig-uration.

WARNING: unmet direct dependencies detected for SND_SOC_WM8731_I2C
  Depends on [n]: SOUND [=y] && !UML && SND [=m] && SND_SOC [=m] && I2C [=n]
  Selected by [m]:
  - SND_SOC_DB1200 [=m] && SOUND [=y] && !UML && SND [=m] && SND_SOC [=m] && SND_SOC_AU1XPSC [=m]

and subsequent build errors:

../sound/soc/codecs/wm8731-i2c.c:64:1: warning: data definition has no type or storage class
   64 | module_i2c_driver(wm8731_i2c_driver);
../sound/soc/codecs/wm8731-i2c.c:64:1: error: type defaults to 'int' in declaration of 'module_i2c_driver' [-Werror=implicit-int]
../sound/soc/codecs/wm8731-i2c.c:64:1: warning: parameter names (without types) in function declaration
../sound/soc/codecs/wm8731-i2c.c:55:26: warning: 'wm8731_i2c_driver' defined but not used [-Wunused-variable]
   55 | static struct i2c_driver wm8731_i2c_driver = {

Fixes: 9dc15f81baf2 ("ASoC: wm8731: Factor out the I2C and SPI bus code into separate modules")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai
---
 sound/soc/au1x/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- a/sound/soc/au1x/Kconfig
+++ b/sound/soc/au1x/Kconfig
@@ -54,6 +54,7 @@ config SND_SOC_DB1000
 config SND_SOC_DB1200
 	tristate "DB1200/DB1300/DB1550 Audio support"
 	depends on SND_SOC_AU1XPSC
+	depends on I2C
 	select SND_SOC_AU1XPSC_AC97
 	select SND_SOC_AC97_CODEC
 	select SND_SOC_WM9712
