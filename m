Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA165FA993
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Oct 2022 03:03:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B58D63161;
	Tue, 11 Oct 2022 03:02:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B58D63161
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665450219;
	bh=w2tQcBiMrR7vR7ASLqbjZajoiDSKypYm7lyE7h57thU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CJOcuAoqFFpD1ioK656hIwVuvdOAyUR+4mCIrbVX/siRFSIWhiI07uZansmxwBQYT
	 W9WbZCaTFLcqum6v/Fn/gxwdyhZSI94CDeHqWZiUlTm8Et2v+VHPDqYBD6fozK4T9L
	 7a9YluXwc1tiAQAoSC9hrscLTfb29VKurIFnVzKI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BB9DF8032B;
	Tue, 11 Oct 2022 03:02:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63056F80256; Tue, 11 Oct 2022 03:02:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 487CAF800B8
 for <alsa-devel@alsa-project.org>; Tue, 11 Oct 2022 03:02:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 487CAF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="L60wNARa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=PrM3oxAWY+DvolGk6EOkPHlLnCs6oAe+5MGgAOsFI0I=; b=L60wNARaHBVJoHySPpUIA9/43p
 WNHDesmbjQqzQEDl9lwVgBWssR7YxiaLIfTI0iefK4DS1tVKn7dHkfCtltQmxIwoeWgEQL5vAVXoY
 /3X1QuVv9+jrpkuX1JOe7x9kuyFOzE+t726C8n22z7Jz0vuznMSTUaOoDvChEAhw6bQBmC8DcDAnZ
 BNnp2/7FVFPk7kKF5O3VZzucZJRJUgs8OgEuv8D54dot6nPIHjswwBE3IH3cye2O9N+OlcNablsMI
 cw+c0G2XrEo6Gp7mD6RNmq5ZLOq0CHyI5EvuV+2MP/x6NKTACxq+/HM4O+LXj9mp+VaV56qYEK8M1
 sHUu2JCQ==;
Received: from [2601:1c2:d80:3110::a2e7] (helo=casper.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oi3f4-004bAy-CP; Tue, 11 Oct 2022 01:02:23 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: wm8731: fix build when I2C is not enabled
Date: Mon, 10 Oct 2022 18:02:13 -0700
Message-Id: <20221011010213.4096-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
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
Cc: Takashi Iwai <tiwai@suse.com>
---
v2: add Takashi's email address

 sound/soc/au1x/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff sound/soc/au1x/Kconfig sound/soc/au1x/Kconfig
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
