Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0087E593C77
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Aug 2022 22:38:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53BAE100;
	Mon, 15 Aug 2022 22:37:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53BAE100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660595926;
	bh=I2Uxh4EvJCSOE07CYqNhIoCNwu9Uw3Ub0lGO2+m236M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oj2k/Bn8rh390JklV9qypNTxgq6z9yvggQ395th/y67fdqa4fqNU/avripezN7ccJ
	 b8p2bRj3fz+n5fotS9CQqGz11b7U81iYMv1AVRnwiTlVX92Ii1DwA+0udTTtodQv9T
	 LUM4RDITDEOLodZ/nEzDXYZw/zz0BhpqcTQl8Lww=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEB65F80271;
	Mon, 15 Aug 2022 22:37:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85F69F8025A; Mon, 15 Aug 2022 22:37:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66579F80082
 for <alsa-devel@alsa-project.org>; Mon, 15 Aug 2022 22:37:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66579F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="uSb5nlUV"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0140660F60;
 Mon, 15 Aug 2022 20:37:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C57A8C433C1;
 Mon, 15 Aug 2022 20:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1660595852;
 bh=I2Uxh4EvJCSOE07CYqNhIoCNwu9Uw3Ub0lGO2+m236M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uSb5nlUVSs7UeIz8797dC0ymrYnSL+xFQsLEacYeukABo0MXHJ4J7Pg6dFAyvUaF5
 +bUZa8I1QUibV/lfyiG3xKd8prt/jE6VBf8WP6SB3/0YF4w08BkHzTfN0i0It05yxd
 tUxJE2orGOTVvjDOj17dxzodFRfkPILPR/HY1kW8=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.19 0894/1157] ASoC: max98390: use linux/gpio/consumer.h to
 fix build
Date: Mon, 15 Aug 2022 20:04:10 +0200
Message-Id: <20220815180515.194039678@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220815180439.416659447@linuxfoundation.org>
References: <20220815180439.416659447@linuxfoundation.org>
User-Agent: quilt/0.67
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Steve Lee <steve.lee.analog@gmail.com>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>,
 stable@vger.kernel.org, Mark Brown <broonie@kernel.org>,
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

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit aa7407f807b250eca7697e5fe9a699bc6c2fab71 ]

Change the header file to fix build errors in max98390.c:

../sound/soc/codecs/max98390.c: In function 'max98390_i2c_probe':
../sound/soc/codecs/max98390.c:1076:22: error: implicit declaration of function 'devm_gpiod_get_optional'; did you mean 'devm_regulator_get_optional'? [-Werror=implicit-function-declaration]
 1076 |         reset_gpio = devm_gpiod_get_optional(&i2c->dev,
../sound/soc/codecs/max98390.c:1077:55: error: 'GPIOD_OUT_HIGH' undeclared (first use in this function); did you mean 'GPIOF_INIT_HIGH'?
 1077 |                                              "reset", GPIOD_OUT_HIGH);
../sound/soc/codecs/max98390.c:1077:55: note: each undeclared identifier is reported only once for each function it appears in
../sound/soc/codecs/max98390.c:1083:17: error: implicit declaration of function 'gpiod_set_value_cansleep'; did you mean 'gpio_set_value_cansleep'? [-Werror=implicit-function-declaration]
 1083 |                 gpiod_set_value_cansleep(reset_gpio, 0);

Fixes: 397ff0249606 ("ASoC: max98390: Add reset gpio control")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Steve Lee <steve.lee.analog@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Link: https://lore.kernel.org/r/20220605163123.23537-1-rdunlap@infradead.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/max98390.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
index 2a6b1648c884..d83f81d9ff4e 100644
--- a/sound/soc/codecs/max98390.c
+++ b/sound/soc/codecs/max98390.c
@@ -10,7 +10,7 @@
 #include <linux/cdev.h>
 #include <linux/dmi.h>
 #include <linux/firmware.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/of_gpio.h>
-- 
2.35.1



