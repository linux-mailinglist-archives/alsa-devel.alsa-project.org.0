Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 259FB6A3DAA
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Feb 2023 09:59:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D8F282A;
	Mon, 27 Feb 2023 09:59:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D8F282A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677488395;
	bh=C1E2gKQQ6zAKsQYIT+4AqLKUHJ/N8g0P98PgENo6NUw=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bhMMNw2cxc9aoe8wZHs5WyB9l7BlLSd+CyGMqh8TR+nXlvVHpY5KUElhUxnbOqzJR
	 ZxWKLHgJGJzitwuquJMUKKrz+gk+uubuKEHawNr0hJvOAoQT4iH8tQc9POWn7pvh9i
	 nzJGK3f9leQT6lP5cqUaw61g3UILj+uPaJ0zp33g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD434F802BE;
	Mon, 27 Feb 2023 09:59:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34CE0F8049C; Mon, 27 Feb 2023 09:59:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E688DF80236
	for <alsa-devel@alsa-project.org>; Mon, 27 Feb 2023 09:58:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E688DF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=r8bma6NO
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2141AB80C95;
	Mon, 27 Feb 2023 08:58:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B0FAC433EF;
	Mon, 27 Feb 2023 08:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677488336;
	bh=C1E2gKQQ6zAKsQYIT+4AqLKUHJ/N8g0P98PgENo6NUw=;
	h=From:To:Cc:Subject:Date:From;
	b=r8bma6NOlrhYSSk7Z8pXKRUqvjv03el/pcVZTZbvecpqM/ufpW2NPA014A3OAzL/e
	 L1+qoW45crCtV/DJIZ9WCQ44sP6F46m3O8xmzOqvJTuFTnbi4WnhUgUKVr9Xaevq7g
	 P6JKD13sx9jAOUeLoI9ZmFbpFZhADh8cHyplXO6Y4Up8ktW7QxhVrCfFMAoNFpzhT0
	 T0EzaaBQ5sIWEZrHvFMyjpMY/6FBvA1SnXkjn00tKFUMw1cS7623C+1HC1R/suBlPy
	 g0cGACzj6G/0EnNWNxU60JDhAZK6oMqlBvwtVFPORxbhwMOewuZ9bAqYtrpZDPi4FT
	 RQcRxdpJGcMkg==
From: Arnd Bergmann <arnd@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Sven Van Asbroeck <thesven73@gmail.com>
Subject: [PATCH] ASoC: zl38060 add gpiolib dependency
Date: Mon, 27 Feb 2023 09:58:26 +0100
Message-Id: <20230227085850.2503725-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VAJCVOPIV6ZODTTYWTTNFLQXTEYKQ6XU
X-Message-ID-Hash: VAJCVOPIV6ZODTTYWTTNFLQXTEYKQ6XU
X-MailFrom: arnd@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Arnd Bergmann <arnd@arndb.de>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VAJCVOPIV6ZODTTYWTTNFLQXTEYKQ6XU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Arnd Bergmann <arnd@arndb.de>

Without gpiolib, this driver fails to link:

arm-linux-gnueabi-ld: sound/soc/codecs/zl38060.o: in function `chip_gpio_get':
zl38060.c:(.text+0x30): undefined reference to `gpiochip_get_data'
arm-linux-gnueabi-ld: sound/soc/codecs/zl38060.o: in function `zl38_spi_probe':
zl38060.c:(.text+0xa18): undefined reference to `devm_gpiochip_add_data_with_key'

This appears to have been in the driver since the start, but is hard to
hit in randconfig testing since gpiolib is almost always selected by something
else.

Fixes: 52e8a94baf90 ("ASoC: Add initial ZL38060 driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/codecs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index bd72c426a93d..07747565c3b5 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -2103,6 +2103,7 @@ config SND_SOC_WSA883X
 config SND_SOC_ZL38060
 	tristate "Microsemi ZL38060 Connected Home Audio Processor"
 	depends on SPI_MASTER
+	depends on GPIOLIB
 	select REGMAP
 	help
 	  Support for ZL38060 Connected Home Audio Processor from Microsemi,
-- 
2.39.2

