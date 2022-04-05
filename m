Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0817A4F2643
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 09:54:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 542561724;
	Tue,  5 Apr 2022 09:53:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 542561724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649145277;
	bh=6/cQjaXqq6vyOdwI/I7vG3d/NAXAZj9v3wIcWjLZh04=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EDGDaf83ef+YMCVsQODUFQtMVsIhO9BluLNgVNMXJtUPXHRKyO2gCifQWkOS0GbPK
	 hkcOpLXIE6eVCfkQyt5lVhBKPGhNte9KZ0aFOnK7SbjUaXPbOQ4lGNvfCNaCvzjs3w
	 +C+dAQv116T3JXmJ6LSI/ZO6tCikerO4XWBGTbi8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2526F8012C;
	Tue,  5 Apr 2022 09:53:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0878BF8012C; Tue,  5 Apr 2022 09:53:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F06EF8012C
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 09:53:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F06EF8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="a6QAf1iI"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CF39AB81BB1;
 Tue,  5 Apr 2022 07:53:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A252C340EE;
 Tue,  5 Apr 2022 07:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1649145206;
 bh=6/cQjaXqq6vyOdwI/I7vG3d/NAXAZj9v3wIcWjLZh04=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a6QAf1iIPl5avnxNFi5kzuBZ/vELNDk9wzIqHElQOXji2FiwGAzW+l6iMSeXVh69V
 OifnVep1deg2yBH5i4J54/9/DZMDz2lAO7mOM3xf+BO4FgHYMEt+Lg/mzy2YPYU2ze
 AXehbpy9v8KwmLiU+jcdyfPXkWSi1ZMbxAMykUgQ=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.17 0323/1126] ASoC: max98927: add missing header file
Date: Tue,  5 Apr 2022 09:17:50 +0200
Message-Id: <20220405070417.098371956@linuxfoundation.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405070407.513532867@linuxfoundation.org>
References: <20220405070407.513532867@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 kernel test robot <lkp@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>,
 stable@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Alejandro Tafalla <atafalla@dnyon.com>
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

[ Upstream commit bb45f689fa62110c263c86070bfcb9ecbb6e1e23 ]

Add a header file that provides the missing function prototypes
and macro to fix these build errors (seen on arch/alpha/):

../sound/soc/codecs/max98927.c: In function 'max98927_i2c_probe':
../sound/soc/codecs/max98927.c:902:19: error: implicit declaration of function 'devm_gpiod_get_optional'; did you mean 'devm_regulator_get_optional'? [-Werror=implicit-function-declaration]
  902 |                 = devm_gpiod_get_optional(&i2c->dev, "reset", GPIOD_OUT_HIGH);
      |                   ^~~~~~~~~~~~~~~~~~~~~~~
../sound/soc/codecs/max98927.c:902:63: error: 'GPIOD_OUT_HIGH' undeclared (first use in this function); did you mean 'GPIOF_INIT_HIGH'?
  902 |                 = devm_gpiod_get_optional(&i2c->dev, "reset", GPIOD_OUT_HIGH);
      |                                                               ^~~~~~~~~~~~~~
../sound/soc/codecs/max98927.c:909:17: error: implicit declaration of function 'gpiod_set_value_cansleep'; did you mean 'gpio_set_value_cansleep'? [-Werror=implicit-function-declaration]
  909 |                 gpiod_set_value_cansleep(max98927->reset_gpio, 0);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~

Fixes: 4d67dc1998f1 ("ASoC: max98927: Handle reset gpio when probing i2c")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Alejandro Tafalla <atafalla@dnyon.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Link: https://lore.kernel.org/r/20220129080259.19964-1-rdunlap@infradead.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/max98927.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/max98927.c b/sound/soc/codecs/max98927.c
index 5ba5f876eab8..fd84780bf689 100644
--- a/sound/soc/codecs/max98927.c
+++ b/sound/soc/codecs/max98927.c
@@ -16,6 +16,7 @@
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/of_gpio.h>
 #include <sound/tlv.h>
 #include "max98927.h"
-- 
2.34.1



