Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 188284A2CB5
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Jan 2022 09:04:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8449016E7;
	Sat, 29 Jan 2022 09:03:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8449016E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643443469;
	bh=wF4KmFwV84pJjDwNr+dK6+5xG2ey9zx2A19ajg1IBvY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lJDP73J3XBw3Z32wbmHDocOR/nChZ5Xxp85/lZ8oh6mfCCxEQ/bWJji2VqOMuXCrs
	 J/sDzqHplWp7EE6VG6ylatwndNOEd98pnLoYPO6/bngCSHgzIzjWDnGQ487gv3KgKS
	 hdDd17ZvY3lV4XWGvCwF8ToQUTt9LCxplvbTjH48=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2BF5F80212;
	Sat, 29 Jan 2022 09:03:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC364F801F7; Sat, 29 Jan 2022 09:03:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B4F7F800CE
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 09:03:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B4F7F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="LFwa8TFs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=uT8PyTIhejTjbbxtqjsIo808PdBg2dLwdd29VGRzAk4=; b=LFwa8TFsszhEAAhe0wcrUQiRVZ
 WwP4zLHtzc9ZPhArmTQx343d2kHR2Hm49YL8poC1hNrn5yQptvRVXvh7iDrwtHdw+YclV1nXqU1gO
 e6XPeTzNqsWugT4Y/l3E8Op+DJE74a02V99pMOIYw+JooCjKighkvzxDmc7HzwXVZI2h4Ty7UzkE0
 BTyDEj7Ux8a14DeU2WjB7K+5sCqK7OOxMPHeYWZ4zJLLVHO7go3eYhmD1PljGNBUbWz8t6ybrmg7D
 dR8sYzFd43eEQDVGYL/B4NGQwfqdV+CMieRhCyrBVgPkeGX4l3dXpuzEEnjKF3MpUUk307YsS1N2r
 nrnTPTNQ==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDihK-004Inr-1C; Sat, 29 Jan 2022 08:03:02 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: max98927: add missing header file
Date: Sat, 29 Jan 2022 00:02:59 -0800
Message-Id: <20220129080259.19964-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Alejandro Tafalla <atafalla@dnyon.com>
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
---
 sound/soc/codecs/max98927.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20220128.orig/sound/soc/codecs/max98927.c
+++ linux-next-20220128/sound/soc/codecs/max98927.c
@@ -16,6 +16,7 @@
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/of_gpio.h>
 #include <sound/tlv.h>
 #include "max98927.h"
