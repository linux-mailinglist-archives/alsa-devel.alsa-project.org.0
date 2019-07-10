Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2158364139
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jul 2019 08:24:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D2481667;
	Wed, 10 Jul 2019 08:23:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D2481667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562739843;
	bh=bpYHlPIhXcl+4hAeluRarz/B1uFo3oS1uKkwVoZ/dFs=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oDYxFUKtGSINCd15sjrOBScLtHk9xPVeZ1zKJ2TSxEmQSGVZ9fn6l17nKrmwYuyVm
	 FsxfHJfsY31eFMiqoBt4ezdK+vzOsn6UIST+ab4h2LVfEMJH+u0Tbk1RtnXCu+aYpF
	 9FXSD9gCkx1nOIQZ2C9RXZPcLfBJyfIbadXkAstM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B80B1F802BC;
	Wed, 10 Jul 2019 08:22:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BA7AF802A1; Wed, 10 Jul 2019 07:50:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from host.euro-space.net (host.euro-space.net [87.117.239.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63706F800DE
 for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2019 07:50:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63706F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=birdec.com header.i=@birdec.com
 header.b="WEi8z93d"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=birdec.com; 
 s=default;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version
 :Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VdUiBxCjMnnmnjRuqrh2wCzPM35P1D7GGN/3U9qGim4=; b=WEi8z93dlEvDji1OYcR9r4X+7l
 x8qMDa/++VDfFFL3krpXjXvEmDLcDD2axsSVHU77qip5WiZmVe7mqUXQYDzRGI6zwpDvOQxdikdlE
 uFmqY4KfKtUj6v5gLULr6CdWY4Hue0C5hKbjAv3g1s92MwZG56l/KJGQbplFLBniNRXV9vM80FwB9
 FcvBt+GppAYBL7IOgvdN9AU8tiy7GEQs3oi3dZBJBISYA09CgHSh4Gt6Gm42gdoiXNaZK6kBbZS0g
 li0FE2LqF1ZWT1klTvnJ2tiF6grxK+24OgvYbzvdsGxOIP09tMKWCFaNqZDcSYTGppL7msKeS8vg8
 gktyp/IQ==;
Received: from x4dbf9360.dyn.telefonica.de ([77.191.147.96]:58102
 helo=gentoo0.localdomain)
 by host.euro-space.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <kmarinushkin@birdec.com>)
 id 1hl5Uw-0002Cb-DB; Wed, 10 Jul 2019 06:50:34 +0100
From: Kirill Marinushkin <kmarinushkin@birdec.com>
To: Mark Brown <broonie@kernel.org>
Date: Wed, 10 Jul 2019 07:51:35 +0200
Message-Id: <20190710055135.21377-1-kmarinushkin@birdec.com>
X-Mailer: git-send-email 2.13.6
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - host.euro-space.net
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - birdec.com
X-Get-Message-Sender-Via: host.euro-space.net: authenticated_id:
 kmarinushkin@birdec.com
X-Authenticated-Sender: host.euro-space.net: kmarinushkin@birdec.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Approved-At: Wed, 10 Jul 2019 08:22:16 +0200
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Kirill Marinushkin <kmarinushkin@birdec.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [alsa-devel] [PATCH] ASoC: Relocate my e-mail to .com domain zone
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Signed-off-by: Kirill Marinushkin <kmarinushkin@birdec.com>
---
 MAINTAINERS                    | 2 +-
 sound/soc/codecs/pcm3060-i2c.c | 4 ++--
 sound/soc/codecs/pcm3060-spi.c | 4 ++--
 sound/soc/codecs/pcm3060.c     | 4 ++--
 sound/soc/codecs/pcm3060.h     | 2 +-
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 558acf24ea1e..9cdc10e80d78 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15829,7 +15829,7 @@ S:	Maintained
 F:	drivers/net/ethernet/ti/netcp*
 
 TI PCM3060 ASoC CODEC DRIVER
-M:	Kirill Marinushkin <kmarinushkin@birdec.tech>
+M:	Kirill Marinushkin <kmarinushkin@birdec.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/sound/pcm3060.txt
diff --git a/sound/soc/codecs/pcm3060-i2c.c b/sound/soc/codecs/pcm3060-i2c.c
index cdc8314882bc..abcdeb922201 100644
--- a/sound/soc/codecs/pcm3060-i2c.c
+++ b/sound/soc/codecs/pcm3060-i2c.c
@@ -2,7 +2,7 @@
 //
 // PCM3060 I2C driver
 //
-// Copyright (C) 2018 Kirill Marinushkin <kmarinushkin@birdec.tech>
+// Copyright (C) 2018 Kirill Marinushkin <kmarinushkin@birdec.com>
 
 #include <linux/i2c.h>
 #include <linux/module.h>
@@ -56,5 +56,5 @@ static struct i2c_driver pcm3060_i2c_driver = {
 module_i2c_driver(pcm3060_i2c_driver);
 
 MODULE_DESCRIPTION("PCM3060 I2C driver");
-MODULE_AUTHOR("Kirill Marinushkin <kmarinushkin@birdec.tech>");
+MODULE_AUTHOR("Kirill Marinushkin <kmarinushkin@birdec.com>");
 MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/codecs/pcm3060-spi.c b/sound/soc/codecs/pcm3060-spi.c
index f6f19fa80932..3b79734b832b 100644
--- a/sound/soc/codecs/pcm3060-spi.c
+++ b/sound/soc/codecs/pcm3060-spi.c
@@ -2,7 +2,7 @@
 //
 // PCM3060 SPI driver
 //
-// Copyright (C) 2018 Kirill Marinushkin <kmarinushkin@birdec.tech>
+// Copyright (C) 2018 Kirill Marinushkin <kmarinushkin@birdec.com>
 
 #include <linux/module.h>
 #include <linux/spi/spi.h>
@@ -55,5 +55,5 @@ static struct spi_driver pcm3060_spi_driver = {
 module_spi_driver(pcm3060_spi_driver);
 
 MODULE_DESCRIPTION("PCM3060 SPI driver");
-MODULE_AUTHOR("Kirill Marinushkin <kmarinushkin@birdec.tech>");
+MODULE_AUTHOR("Kirill Marinushkin <kmarinushkin@birdec.com>");
 MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/codecs/pcm3060.c b/sound/soc/codecs/pcm3060.c
index 32b26f1c2282..b2358069cf9b 100644
--- a/sound/soc/codecs/pcm3060.c
+++ b/sound/soc/codecs/pcm3060.c
@@ -2,7 +2,7 @@
 //
 // PCM3060 codec driver
 //
-// Copyright (C) 2018 Kirill Marinushkin <kmarinushkin@birdec.tech>
+// Copyright (C) 2018 Kirill Marinushkin <kmarinushkin@birdec.com>
 
 #include <linux/module.h>
 #include <sound/pcm_params.h>
@@ -342,5 +342,5 @@ int pcm3060_probe(struct device *dev)
 EXPORT_SYMBOL(pcm3060_probe);
 
 MODULE_DESCRIPTION("PCM3060 codec driver");
-MODULE_AUTHOR("Kirill Marinushkin <kmarinushkin@birdec.tech>");
+MODULE_AUTHOR("Kirill Marinushkin <kmarinushkin@birdec.com>");
 MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/codecs/pcm3060.h b/sound/soc/codecs/pcm3060.h
index 75931c9a9d85..18d51e5dac2c 100644
--- a/sound/soc/codecs/pcm3060.h
+++ b/sound/soc/codecs/pcm3060.h
@@ -2,7 +2,7 @@
 /*
  * PCM3060 codec driver
  *
- * Copyright (C) 2018 Kirill Marinushkin <kmarinushkin@birdec.tech>
+ * Copyright (C) 2018 Kirill Marinushkin <kmarinushkin@birdec.com>
  */
 
 #ifndef _SND_SOC_PCM3060_H
-- 
2.13.6

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
