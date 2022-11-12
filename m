Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E58FA626BC9
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Nov 2022 22:13:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 832841654;
	Sat, 12 Nov 2022 22:12:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 832841654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668287606;
	bh=2iAAWO5Y7WxyfujruBap3TgmnqtxP2liK/32VJVnnA0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mSQN8GN9wwtT2cBSyzht5lkAOHP6eBge8wN4fbSNld7npdYYOlIdqL1BZoBlQ9Kl7
	 la0oWxxCsyPgKCyE+zSu8PgM6QClLKLgrjOy70+Be/v3g7vnLPmxqMP+cflF6rGM3r
	 hyO1WAATZSf/iyRLY0TFM8499/BAGb1mEizB1rBw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EAB9F800CC;
	Sat, 12 Nov 2022 22:12:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39EC1F8026D; Sat, 12 Nov 2022 22:12:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp-13.smtpout.orange.fr
 [80.12.242.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5BC2F800CC
 for <alsa-devel@alsa-project.org>; Sat, 12 Nov 2022 22:12:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5BC2F800CC
Received: from pop-os.home ([86.243.100.34]) by smtp.orange.fr with ESMTPA
 id txnUo3RPmEkSDtxnUoiQpZ; Sat, 12 Nov 2022 22:12:21 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 12 Nov 2022 22:12:21 +0100
X-ME-IP: 86.243.100.34
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Lars-Peter Clausen <lars@metafoo.de>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: codecs: Remove a useless include
Date: Sat, 12 Nov 2022 22:12:13 +0100
Message-Id: <875ca433849025edf8c23624cf29b0e2250bba50.1668287523.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

<linux/gcd.h> is not needed for these drivers. Remove the corresponding
#include.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/soc/codecs/adau1372.c | 1 -
 sound/soc/codecs/adau1373.c | 1 -
 sound/soc/codecs/adau17x1.c | 1 -
 3 files changed, 3 deletions(-)

diff --git a/sound/soc/codecs/adau1372.c b/sound/soc/codecs/adau1372.c
index a9f89e8565ec..fbb6bf6fb3cc 100644
--- a/sound/soc/codecs/adau1372.c
+++ b/sound/soc/codecs/adau1372.c
@@ -8,7 +8,6 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/gcd.h>
 #include <linux/gpio/consumer.h>
 #include <linux/init.h>
 #include <linux/module.h>
diff --git a/sound/soc/codecs/adau1373.c b/sound/soc/codecs/adau1373.c
index 7f832d00ab17..37e178e8a1d0 100644
--- a/sound/soc/codecs/adau1373.c
+++ b/sound/soc/codecs/adau1373.c
@@ -12,7 +12,6 @@
 #include <linux/pm.h>
 #include <linux/i2c.h>
 #include <linux/slab.h>
-#include <linux/gcd.h>
 
 #include <sound/core.h>
 #include <sound/pcm.h>
diff --git a/sound/soc/codecs/adau17x1.c b/sound/soc/codecs/adau17x1.c
index c0f44ecef606..634d4dbca5ec 100644
--- a/sound/soc/codecs/adau17x1.c
+++ b/sound/soc/codecs/adau17x1.c
@@ -16,7 +16,6 @@
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/tlv.h>
-#include <linux/gcd.h>
 #include <linux/i2c.h>
 #include <linux/spi/spi.h>
 #include <linux/regmap.h>
-- 
2.34.1

