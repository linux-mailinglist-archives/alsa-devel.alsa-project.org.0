Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE1D657CCC
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Dec 2022 16:36:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7669359ED;
	Wed, 28 Dec 2022 16:35:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7669359ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672241775;
	bh=8zcx4+pxIdKZazB7sAWPppJwslZcmz8YqF8Kw51lHCc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kEaiw6VIrdJV0PA2Y2ty5ufjn2OmI4PnWw7/Z4HoQjshQVlwY/r4KyTBO32ZcrWGf
	 URtsjEo1xLysVfEsfp0GfPRbG1UXWbHw3Meg2QGsoWSnCXJzRNGDOcWeOdQ7Hu62vl
	 7pt8JOrMLlVtxcC5RpCKY3DxlCfKB3/kM48AHfWc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A35BF800F0;
	Wed, 28 Dec 2022 16:35:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D15DF8042F; Wed, 28 Dec 2022 16:35:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA3F2F8023B
 for <alsa-devel@alsa-project.org>; Wed, 28 Dec 2022 16:35:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA3F2F8023B
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=dCDtQt1s
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2CFDDB8171C;
 Wed, 28 Dec 2022 15:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D904C433D2;
 Wed, 28 Dec 2022 15:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1672241698;
 bh=8zcx4+pxIdKZazB7sAWPppJwslZcmz8YqF8Kw51lHCc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dCDtQt1s862dQMnKjUlW0PnFJ/8RueLELBYQbBHka3MeCV7jTYkXRUyCxWHoDyGFF
 gE64N7qJ59sYnVgTZBPyzimUNfYhsa/ICyNjcgij2TDyhEn1tnHJWY3ncDmQKMSNgd
 TD6+tAxZONBlZaX6LVRthPqsZxwrGJJb6Ituw4BI=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Subject: [PATCH 6.0 0317/1073] ASoC: codecs: wsa883x: use correct header file
Date: Wed, 28 Dec 2022 15:31:45 +0100
Message-Id: <20221228144336.619048474@linuxfoundation.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221228144328.162723588@linuxfoundation.org>
References: <20221228144328.162723588@linuxfoundation.org>
User-Agent: quilt/0.67
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 kernel test robot <lkp@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, patches@lists.linux.dev,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Takashi Iwai <tiwai@suse.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit 5f52ceddc40cd61b1dd2ecf735624deaf05f779f ]

Fix build errors when GPIOLIB is not set/enabled:

../sound/soc/codecs/wsa883x.c: In function 'wsa883x_probe':
../sound/soc/codecs/wsa883x.c:1394:25: error: implicit declaration of function 'devm_gpiod_get_optional'; did you mean 'devm_regulator_get_optional'? [-Werror=implicit-function-declaration]
         wsa883x->sd_n = devm_gpiod_get_optional(&pdev->dev, "powerdown",
../sound/soc/codecs/wsa883x.c:1395:49: error: 'GPIOD_FLAGS_BIT_NONEXCLUSIVE' undeclared (first use in this function)
         GPIOD_FLAGS_BIT_NONEXCLUSIVE);
../sound/soc/codecs/wsa883x.c:1414:9: error: implicit declaration of function 'gpiod_direction_output'; did you mean 'gpio_direction_output'? [-Werror=implicit-function-declaration]
         gpiod_direction_output(wsa883x->sd_n, 1);

Fixes: 43b8c7dc85a1 ("ASoC: codecs: add wsa883x amplifier support")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Banajit Goswami <bgoswami@quicinc.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Link: https://lore.kernel.org/r/20221108001829.5100-1-rdunlap@infradead.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/wsa883x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index cb1d0a3e90e6..9dfa0ac08e6f 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -7,7 +7,7 @@
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/device.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-- 
2.35.1



