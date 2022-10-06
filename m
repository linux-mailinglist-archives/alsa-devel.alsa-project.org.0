Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F221B5F721F
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Oct 2022 02:00:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C15A167A;
	Fri,  7 Oct 2022 01:59:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C15A167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665100828;
	bh=FFfvNYM9T5UeanQg9sZW1rGVmpIWUtlrGx62kIvnk2Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rhhtqihEFJU76Ha6A2hFiSRO769fXeo+j/K0a4q2J4mFQMd0IPwF8Z//sFm+v8mMy
	 hPXFSdU+T4CuBTA4Ri++66yrd476B/JTWx2ZtoCYdxS3RLzTTt8O4D87X3s+iqJUbv
	 oZt2SQgLqElSVQdBfmxvNPglcZ/tg6hQE8MxFMLM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E027F8012A;
	Fri,  7 Oct 2022 01:59:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81B99F804F3; Fri,  7 Oct 2022 01:59:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5729F80254
 for <alsa-devel@alsa-project.org>; Fri,  7 Oct 2022 01:58:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5729F80254
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="u6NDsCY6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=JXxcTYDoAGII65LnrbB+UX9xMILlYKLpThy0M/qjUrA=; b=u6NDsCY6ojetrDLaH6P5z7lomQ
 fPpI5aiePWSfZP+ifNNKx+uUflhPHW4ddFXTI7hYy/yYzTP9grhLlJFuv79LZjiYp1XvPYfgA825F
 SHcyi+Zzpk5/CAtoDTAeMT0Uu53eNALT2F4Cv0v5ntjnAAaKVWNE5Iu+G6AYnyO5vL1qbSpnsDShE
 hpS/2HThCGIYh6rmd7UTlKNAy+CT+PALGnbjvaE9lWCVrhTO/NdS/tcs1e70pAPhCb/X3otX1gZBg
 LYN0G1i1wVDkWttDP5ac0+uqaxbAl3y1xscu+lyry7xGlgKOsyCU2KVerJVc2GYNWVm58g7cgsvKC
 Qs4ZyL/A==;
Received: from [2601:1c2:d80:3110::a2e7] (helo=casper.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ogal5-001XLB-Bp; Thu, 06 Oct 2022 23:58:32 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: codec: tlv320adc3xxx: add GPIOLIB dependency
Date: Thu,  6 Oct 2022 16:58:22 -0700
Message-Id: <20221006235822.30074-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Ricard Wanderlof <ricardw@axis.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
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

Fix build errors when CONFIG_GPIOLIB is not enabled:

../sound/soc/codecs/tlv320adc3xxx.c: In function 'adc3xxx_i2c_probe':
../sound/soc/codecs/tlv320adc3xxx.c:1352:28: error: implicit declaration of function 'devm_gpiod_get'; did you mean 'devm_gpio_free'? [-Werror=implicit-function-declaration]
 1352 |         adc3xxx->rst_pin = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
../sound/soc/codecs/tlv320adc3xxx.c:1352:57: error: 'GPIOD_OUT_LOW' undeclared (first use in this function); did you mean 'GPIOF_INIT_LOW'?
 1352 |         adc3xxx->rst_pin = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
  CC      lib/dynamic_debug.o
../sound/soc/codecs/tlv320adc3xxx.c:1400:9: error: implicit declaration of function 'gpiod_set_value_cansleep'; did you mean 'gpio_set_value_cansleep'? [-Werror=implicit-function-declaration]
 1400 |         gpiod_set_value_cansleep(adc3xxx->rst_pin, 1);

Fixes: e9a3b57efd28 ("ASoC: codec: tlv320adc3xxx: New codec driver")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Ricard Wanderlof <ricardw@axis.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
---
v2: use correct Subject keywords

 sound/soc/codecs/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1629,6 +1629,7 @@ config SND_SOC_TFA989X
 config SND_SOC_TLV320ADC3XXX
 	tristate "Texas Instruments TLV320ADC3001/3101 audio ADC"
 	depends on I2C
+	depends on GPIOLIB
 	help
 	 Enable support for Texas Instruments TLV320ADC3001 and TLV320ADC3101
 	 ADCs.
