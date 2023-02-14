Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06458695E44
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Feb 2023 10:08:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE492827;
	Tue, 14 Feb 2023 10:07:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE492827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676365725;
	bh=OlRf+PZkFPcU3LhJ+mP2uxlveALxvDZpPtRYIg9JveY=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=XrP+t91G26NCOYGmfM3w0Fru36WtXEPCcoh6JCqPvkE+QzpyO5lugRbYuFPD12VrE
	 BC4HHzGhupACggfn+4IBBvX9lmXlx9O6zsWJdoJUHMc8PW4y47dWmeDc9zramjyq2F
	 CLjHYpTdzgwcgQM9wJH85AbiXSMUN+Ttba17QdaY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B5457F8001E;
	Tue, 14 Feb 2023 10:07:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52D21F801C0; Tue, 14 Feb 2023 10:07:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 701A5F8001E
	for <alsa-devel@alsa-project.org>; Tue, 14 Feb 2023 10:07:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 701A5F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IXzoVRY6
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0A76AB81CA4;
	Tue, 14 Feb 2023 09:07:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3059C433EF;
	Tue, 14 Feb 2023 09:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676365653;
	bh=OlRf+PZkFPcU3LhJ+mP2uxlveALxvDZpPtRYIg9JveY=;
	h=From:To:Cc:Subject:Date:From;
	b=IXzoVRY6ObRuAg2XVtKBEwZoU9lEzBnX31Bn1ILATOVyFyWd6Rh1Cudi9iIgYm2NN
	 JVpw9X9fA4IDhh9UcidvFdMbumw2RPTFOxuF4Av/tO9iBGrDS1xQWMeRQZNTMxaRpk
	 zYi/SYI1dXN25QJhnJR9HZD4Eg8SIQKhFNfXu623ngpUzyYelyb7fQq6vZQz3G3Sw1
	 PAIC9jex2oreb02gd8VXACi4BfyRXrOowCXowaeBAtn66w9GBYCYo03rUkIMfW7qze
	 fczOBo4Js4YAZHZVPeIXVli2WagEL7othzzEduM0ism7BkZWXm2ZnF5KlZ4q+zZ+DP
	 lqJicNrgGqfxw==
From: Arnd Bergmann <arnd@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] Input: mainstone: fix pxa2xx_ac97 dependency
Date: Tue, 14 Feb 2023 10:07:16 +0100
Message-Id: <20230214090728.1737140-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TXJFXR7Z7BSTWMOVEV7NI45KOAFBYANG
X-Message-ID-Hash: TXJFXR7Z7BSTWMOVEV7NI45KOAFBYANG
X-MailFrom: arnd@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TXJFXR7Z7BSTWMOVEV7NI45KOAFBYANG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Arnd Bergmann <arnd@arndb.de>

The exported PXA AC97 symbols are provided by the snd-pxa2xx-lib module
if SND_PXA2XX_SOC_AC97 is set, so both symbols have to be enabled for
the mainstone driver to actually work, and if snd-pxa2xx-lib is a loadable
module, the touchscreen driver cannot be built-in:

arm-linux-gnueabi-ld: drivers/input/touchscreen/mainstone-wm97xx.o: in function `wm97xx_acc_pen_up':
mainstone-wm97xx.c:(.text+0x8c): undefined reference to `pxa2xx_ac97_read_modr'
arm-linux-gnueabi-ld: drivers/input/touchscreen/mainstone-wm97xx.o: in function `wm97xx_acc_pen_down':
mainstone-wm97xx.c:(.text+0x2e0): undefined reference to `pxa2xx_ac97_read_modr'

The misconfiguration has always been possible but I never hit this after
my previous incomplete fix in 2019: since there were many options that
each 'select SND_PXA2XX_SOC_AC97', randconfig builds for PXA would almost
always have this built-in, not in a loadable module.

Fixes: e217b085a1ac ("Input: touchscreen: use wrapper for pxa2xx ac97 registers")
Fixes: b401d1fd8053 ("ASoC: pxa: remove unused board support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/input/touchscreen/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 61bb8e632413..1601f5bae005 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -903,7 +903,7 @@ config TOUCHSCREEN_WM9713
 config TOUCHSCREEN_WM97XX_MAINSTONE
 	tristate "WM97xx Mainstone/Palm accelerated touch"
 	depends on TOUCHSCREEN_WM97XX && ARCH_PXA
-	depends on SND_PXA2XX_LIB_AC97
+	depends on SND_PXA2XX_LIB && SND_PXA2XX_LIB_AC97
 	help
 	  Say Y here for support for streaming mode with WM97xx touchscreens
 	  on Mainstone, Palm Tungsten T5, TX and LifeDrive systems.
-- 
2.39.1

