Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CF053DD07
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jun 2022 18:33:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEBD0168B;
	Sun,  5 Jun 2022 18:32:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEBD0168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654446779;
	bh=t4I1i9Rx25bVBuCIlSgY5JAjTbekX+85awJZ6N3WJI4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oMprGZQECZXw3UvdZACh0YOD3KsdqKVb3jbtFnfLMwRO/P+u5VU3mtE+ridUpuJky
	 qTj97gsOzk7lUC6f7w8XcFg2kdSkUTenq8YmgI1wZWS9XjY9DwhUg0rsldtZx2VvEf
	 Z3OVjOmQTB3eUwcRHVs90LE2HL8S/CUb/H+3Trp8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 324C8F801F7;
	Sun,  5 Jun 2022 18:32:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA2DAF8016C; Sun,  5 Jun 2022 18:31:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B247F800D3
 for <alsa-devel@alsa-project.org>; Sun,  5 Jun 2022 18:31:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B247F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="PN0Bi1pm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=dI3rf3edy3Kft6mBrBSiDKYbeeS3F5z2oeWA1gb5ziU=; b=PN0Bi1pmYIrCr/u2Syoq6r98BX
 nf9F8H92bvNpjQGQ/5aeGRZljvrQUaqjJF1iLsyTqwJLSLQSQ0TVDVdhP0bDtTa7etHE2qRWRZUG+
 5V1RXDFoyMD/mUcy7w5SMQhsKCXGnHXYI6Becaqpe/x1tWY0+Fc1zIOTcVQYwLvmmHFbsEnjTWpWw
 v3croie01C2H3c8BpGI9H+RmKEMsBANLlQ+33HqTGgpuyNuyYBPel0CeGRFJxi8gvCnTfdMLad6XP
 RQUFWVxnfifHTxz44Oxy1eH0Gtp3lnJMjwVPABpM0RRdfwH0p5W2ubDEVUDAWQQy2hYEpDoiFCv5G
 MPBNZ9UA==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=casper.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nxtA1-009qFA-TT; Sun, 05 Jun 2022 16:31:30 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: max98390: use linux/gpio/consumer.h to fix build
Date: Sun,  5 Jun 2022 09:31:23 -0700
Message-Id: <20220605163123.23537-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Steve Lee <steve.lee.analog@gmail.com>, alsa-devel@alsa-project.org,
 kernel test robot <lkp@intel.com>, Randy Dunlap <rdunlap@infradead.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
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
---
 sound/soc/codecs/max98390.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
