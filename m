Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDCF4FA509
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Apr 2022 07:22:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 568FC17A2;
	Sat,  9 Apr 2022 07:22:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 568FC17A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649481770;
	bh=94n3ChKsG6yMLO5A1Hqs4TmFHcSD7tKRKyuvhfQ6sOo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=c7ehDuO1NdJo5VDd5UMu95iAlu3LHcH45NWGPnbBWPnNxd/sXp8o2Q0oAsLBRDkOc
	 pbI8mR1xtjdJStuw0lra6xXIbuWbP9OtSWik+3Zbv4I0VR4rC828PKP5ilfOPXL9ot
	 fGP6AGvNrQOO5HNyI8VeJdYMHisQEenhBFXB5xoQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2E3AF80155;
	Sat,  9 Apr 2022 07:21:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF376F80253; Sat,  9 Apr 2022 07:21:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6499F8011C
 for <alsa-devel@alsa-project.org>; Sat,  9 Apr 2022 07:21:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6499F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="iotYhzG6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=L0vleVIlE534qVbDB+2q/IG8Y66YuIRD+ClxjHh9uKs=; b=iotYhzG6/ErQMr3KAc//VLH0KZ
 8bHeTQ62XL8KfU+yNWbCONpi67LMEiJzi5exzXfGhOqyOwuyT3jLET1oHI9nLvKXXvfcdNORHgkFo
 AMQjG9nNoTsEuDp6O7dn6Osq0L0DfPDAY1/mdKmzeqjMy1cpNdBiRGhTRgB6flOBqUEYXfq0ncaTW
 arnNwHeFc1TzOCD3+tN7LHGmdPORaoyIRcCyE5CVqIsjQq9om5G+IJymzBrn5XIS3MbtM7r0ky/h1
 bIF4HcVPYa64RWpThlipfH+DK5ukO0jXTcJGqdWu31eOi0t3Kbi8MUBh4WN1RXp1t8HAK8bSQUTIc
 01aqiMSg==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nd3XF-002FZ1-QK; Sat, 09 Apr 2022 05:21:25 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] sound: soc/codecs: tlv320adc3xxx: needs GPIOLIB
Date: Fri,  8 Apr 2022 22:21:20 -0700
Message-Id: <20220409052120.3780-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.34.1
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
 sound/soc/codecs/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1567,6 +1567,7 @@ config SND_SOC_TFA989X
 config SND_SOC_TLV320ADC3XXX
 	tristate "Texas Instruments TLV320ADC3001/3101 audio ADC"
 	depends on I2C
+	depends on GPIOLIB
 	help
 	 Enable support for Texas Instruments TLV320ADC3001 and TLV320ADC3101
 	 ADCs.
