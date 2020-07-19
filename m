Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 095842258C9
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jul 2020 09:39:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9F5A850;
	Mon, 20 Jul 2020 09:39:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9F5A850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595230794;
	bh=ZwBz+Mb9sBmHbvwQUlPvR4JebTJxFtZ8tJGbgovp2PQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dOSUj+NbkUCAjXg3DXlGLGbIYoXNB4e2nzI4d0BRND+3LG5RyBz2P7My0csOWPEQ0
	 93T5tj4C6Doq0kyUJa7KLV+/BhMlxy8nPSnrmoP2P+FPDH/Qknk2DIxL+OkrIDfqxZ
	 NyGJVGRJ9DgUCXWe99zgPkptVrP8Z9gFJ3YX0Ykc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0A60F802E2;
	Mon, 20 Jul 2020 09:34:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 513A9F8014C; Sun, 19 Jul 2020 17:38:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=PRX_BODY_78,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp.al2klimov.de (smtp.al2klimov.de [78.46.175.9])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 561AEF800F5
 for <alsa-devel@alsa-project.org>; Sun, 19 Jul 2020 17:38:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 561AEF800F5
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
 by smtp.al2klimov.de (Postfix) with ESMTPA id 76888BC078;
 Sun, 19 Jul 2020 15:38:28 +0000 (UTC)
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 perex@perex.cz, tiwai@suse.com, corbet@lwn.net, yuehaibing@huawei.com,
 kuninori.morimoto.gx@renesas.com, tzungbi@google.com, jbrunet@baylibre.com,
 keescook@chromium.org, pankaj.laxminarayan.bharadiya@intel.com,
 cychiang@chromium.org, dinghao.liu@zju.edu.cn, dmurphy@ti.com,
 rikard.falkeborn@gmail.com, shifu0704@thundersoft.com, lkp@intel.com,
 colin.king@canonical.com, nikita.yoush@cogentembedded.com,
 l.stach@pengutronix.de, afd@ti.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: [PATCH for v5.9] ASoC: Replace HTTP links with HTTPS ones
Date: Sun, 19 Jul 2020 17:38:22 +0200
Message-Id: <20200719153822.59788-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: +++++
Authentication-Results: smtp.al2klimov.de;
 auth=pass smtp.auth=aklimov@al2klimov.de
 smtp.mailfrom=grandmaster@al2klimov.de
X-Mailman-Approved-At: Mon, 20 Jul 2020 09:34:10 +0200
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
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

Rationale:
Reduces attack surface on kernel devs opening the links for MITM
as HTTPS traffic is much harder to manipulate.

Deterministic algorithm:
For each file:
  If not .svg:
    For each line:
      If doesn't contain `\bxmlns\b`:
        For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
            If both the HTTP and HTTPS versions
            return 200 OK and serve the same content:
              Replace HTTP with HTTPS.

Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 Continuing my work started at 93431e0607e5.
 See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
 (Actually letting a shell for loop submit all this stuff for me.)

 If there are any URLs to be removed completely
 or at least not (just) HTTPSified:
 Just clearly say so and I'll *undo my change*.
 See also: https://lkml.org/lkml/2020/6/27/64

 If there are any valid, but yet not changed URLs:
 See: https://lkml.org/lkml/2020/6/26/837

 If you apply the patch, please let me know.

 Sorry again to all maintainers who complained about subject lines.
 Now I realized that you want an actually perfect prefixes,
 not just subsystem ones.
 I tried my best...
 And yes, *I could* (at least half-)automate it.
 Impossible is nothing! :)


 Documentation/devicetree/bindings/sound/adi,adau1977.txt   | 6 +++---
 Documentation/devicetree/bindings/sound/tas2552.txt        | 2 +-
 Documentation/devicetree/bindings/sound/tas5720.txt        | 6 +++---
 Documentation/devicetree/bindings/sound/ti,tas6424.txt     | 2 +-
 Documentation/devicetree/bindings/sound/tlv320adcx140.yaml | 6 +++---
 Documentation/sound/soc/dai.rst                            | 2 +-
 sound/soc/cirrus/ep93xx-ac97.c                             | 2 +-
 sound/soc/codecs/hdmi-codec.c                              | 2 +-
 sound/soc/codecs/max9850.c                                 | 2 +-
 sound/soc/codecs/mc13783.c                                 | 2 +-
 sound/soc/codecs/pcm186x-i2c.c                             | 2 +-
 sound/soc/codecs/pcm186x-spi.c                             | 2 +-
 sound/soc/codecs/pcm186x.c                                 | 2 +-
 sound/soc/codecs/pcm186x.h                                 | 2 +-
 sound/soc/codecs/tas2552.c                                 | 2 +-
 sound/soc/codecs/tas2552.h                                 | 2 +-
 sound/soc/codecs/tas2562.h                                 | 2 +-
 sound/soc/codecs/tas2770.c                                 | 2 +-
 sound/soc/codecs/tas2770.h                                 | 2 +-
 sound/soc/codecs/tas5720.c                                 | 2 +-
 sound/soc/codecs/tas5720.h                                 | 2 +-
 sound/soc/codecs/tas6424.c                                 | 2 +-
 sound/soc/codecs/tas6424.h                                 | 2 +-
 sound/soc/codecs/tlv320adcx140.c                           | 2 +-
 sound/soc/codecs/tlv320adcx140.h                           | 2 +-
 sound/soc/codecs/tlv320aic31xx.c                           | 4 ++--
 sound/soc/codecs/tlv320aic31xx.h                           | 2 +-
 27 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/adi,adau1977.txt b/Documentation/devicetree/bindings/sound/adi,adau1977.txt
index 9225472c80b4..37f8aad01203 100644
--- a/Documentation/devicetree/bindings/sound/adi,adau1977.txt
+++ b/Documentation/devicetree/bindings/sound/adi,adau1977.txt
@@ -1,9 +1,9 @@
 Analog Devices ADAU1977/ADAU1978/ADAU1979
 
 Datasheets:
-http://www.analog.com/media/en/technical-documentation/data-sheets/ADAU1977.pdf
-http://www.analog.com/media/en/technical-documentation/data-sheets/ADAU1978.pdf
-http://www.analog.com/media/en/technical-documentation/data-sheets/ADAU1979.pdf
+https://www.analog.com/media/en/technical-documentation/data-sheets/ADAU1977.pdf
+https://www.analog.com/media/en/technical-documentation/data-sheets/ADAU1978.pdf
+https://www.analog.com/media/en/technical-documentation/data-sheets/ADAU1979.pdf
 
 This driver supports both the I2C and SPI bus.
 
diff --git a/Documentation/devicetree/bindings/sound/tas2552.txt b/Documentation/devicetree/bindings/sound/tas2552.txt
index 2d71eb05c1d3..a7eecad83db1 100644
--- a/Documentation/devicetree/bindings/sound/tas2552.txt
+++ b/Documentation/devicetree/bindings/sound/tas2552.txt
@@ -33,4 +33,4 @@ tas2552: tas2552@41 {
 };
 
 For more product information please see the link below:
-http://www.ti.com/product/TAS2552
+https://www.ti.com/product/TAS2552
diff --git a/Documentation/devicetree/bindings/sound/tas5720.txt b/Documentation/devicetree/bindings/sound/tas5720.txt
index 7481653fe8e3..df99ca9451b0 100644
--- a/Documentation/devicetree/bindings/sound/tas5720.txt
+++ b/Documentation/devicetree/bindings/sound/tas5720.txt
@@ -4,9 +4,9 @@ The TAS5720 serial control bus communicates through the I2C protocol only. The
 serial bus is also used for periodic codec fault checking/reporting during
 audio playback. For more product information please see the links below:
 
-http://www.ti.com/product/TAS5720L
-http://www.ti.com/product/TAS5720M
-http://www.ti.com/product/TAS5722L
+https://www.ti.com/product/TAS5720L
+https://www.ti.com/product/TAS5720M
+https://www.ti.com/product/TAS5722L
 
 Required properties:
 
diff --git a/Documentation/devicetree/bindings/sound/ti,tas6424.txt b/Documentation/devicetree/bindings/sound/ti,tas6424.txt
index eacb54f34188..00940c489299 100644
--- a/Documentation/devicetree/bindings/sound/ti,tas6424.txt
+++ b/Documentation/devicetree/bindings/sound/ti,tas6424.txt
@@ -19,4 +19,4 @@ tas6424: tas6424@6a {
 };
 
 For more product information please see the link below:
-http://www.ti.com/product/TAS6424-Q1
+https://www.ti.com/product/TAS6424-Q1
diff --git a/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml b/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
index 2e6ac5d2ee96..8e008b7cf926 100644
--- a/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
+++ b/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
@@ -18,9 +18,9 @@ description: |
   microphone bias or supply voltage generation.
 
   Specifications can be found at:
-    http://www.ti.com/lit/ds/symlink/tlv320adc3140.pdf
-    http://www.ti.com/lit/ds/symlink/tlv320adc5140.pdf
-    http://www.ti.com/lit/ds/symlink/tlv320adc6140.pdf
+    https://www.ti.com/lit/ds/symlink/tlv320adc3140.pdf
+    https://www.ti.com/lit/ds/symlink/tlv320adc5140.pdf
+    https://www.ti.com/lit/ds/symlink/tlv320adc6140.pdf
 
 properties:
   compatible:
diff --git a/Documentation/sound/soc/dai.rst b/Documentation/sound/soc/dai.rst
index 2e99183a7a47..009b07e5a0f3 100644
--- a/Documentation/sound/soc/dai.rst
+++ b/Documentation/sound/soc/dai.rst
@@ -17,7 +17,7 @@ frame (FRAME) (usually 48kHz) is always driven by the controller. Each AC97
 frame is 21uS long and is divided into 13 time slots.
 
 The AC97 specification can be found at :
-http://www.intel.com/p/en_US/business/design
+https://www.intel.com/p/en_US/business/design
 
 
 I2S
diff --git a/sound/soc/cirrus/ep93xx-ac97.c b/sound/soc/cirrus/ep93xx-ac97.c
index 1c45fb9ff990..16f9bb283b5c 100644
--- a/sound/soc/cirrus/ep93xx-ac97.c
+++ b/sound/soc/cirrus/ep93xx-ac97.c
@@ -285,7 +285,7 @@ static int ep93xx_ac97_trigger(struct snd_pcm_substream *substream,
 			/*
 			 * As per Cirrus EP93xx errata described below:
 			 *
-			 * http://www.cirrus.com/en/pubs/errata/ER667E2B.pdf
+			 * https://www.cirrus.com/en/pubs/errata/ER667E2B.pdf
 			 *
 			 * we will wait for the TX FIFO to be empty before
 			 * clearing the TEN bit.
diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index f005751da2cc..86c636ee312a 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * ALSA SoC codec for HDMI encoder drivers
- * Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2015 Texas Instruments Incorporated - https://www.ti.com/
  * Author: Jyri Sarha <jsarha@ti.com>
  */
 #include <linux/module.h>
diff --git a/sound/soc/codecs/max9850.c b/sound/soc/codecs/max9850.c
index 6f43748f9239..4659b8c6e746 100644
--- a/sound/soc/codecs/max9850.c
+++ b/sound/soc/codecs/max9850.c
@@ -7,7 +7,7 @@
  * Author: Christian Glindkamp <christian.glindkamp@taskit.de>
  *
  * Initial development of this code was funded by
- * MICRONIC Computer Systeme GmbH, http://www.mcsberlin.de/
+ * MICRONIC Computer Systeme GmbH, https://www.mcsberlin.de/
  */
 
 #include <linux/module.h>
diff --git a/sound/soc/codecs/mc13783.c b/sound/soc/codecs/mc13783.c
index f9830bd3da18..9e6a0cda43d0 100644
--- a/sound/soc/codecs/mc13783.c
+++ b/sound/soc/codecs/mc13783.c
@@ -5,7 +5,7 @@
  * Copyright 2012 Philippe Retornaz, philippe.retornaz@epfl.ch
  *
  * Initial development of this code was funded by
- * Phytec Messtechnik GmbH, http://www.phytec.de
+ * Phytec Messtechnik GmbH, https://www.phytec.de
  */
 #include <linux/module.h>
 #include <linux/device.h>
diff --git a/sound/soc/codecs/pcm186x-i2c.c b/sound/soc/codecs/pcm186x-i2c.c
index 0214dc6d84d0..f8382b74391d 100644
--- a/sound/soc/codecs/pcm186x-i2c.c
+++ b/sound/soc/codecs/pcm186x-i2c.c
@@ -2,7 +2,7 @@
 /*
  * Texas Instruments PCM186x Universal Audio ADC - I2C
  *
- * Copyright (C) 2015-2017 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2015-2017 Texas Instruments Incorporated - https://www.ti.com
  *	Andreas Dannenberg <dannenberg@ti.com>
  *	Andrew F. Davis <afd@ti.com>
  */
diff --git a/sound/soc/codecs/pcm186x-spi.c b/sound/soc/codecs/pcm186x-spi.c
index b56e19827497..bc1b0f0698ed 100644
--- a/sound/soc/codecs/pcm186x-spi.c
+++ b/sound/soc/codecs/pcm186x-spi.c
@@ -2,7 +2,7 @@
 /*
  * Texas Instruments PCM186x Universal Audio ADC - SPI
  *
- * Copyright (C) 2015-2017 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2015-2017 Texas Instruments Incorporated - https://www.ti.com
  *	Andreas Dannenberg <dannenberg@ti.com>
  *	Andrew F. Davis <afd@ti.com>
  */
diff --git a/sound/soc/codecs/pcm186x.c b/sound/soc/codecs/pcm186x.c
index c5fcc632f670..f0da55901dcb 100644
--- a/sound/soc/codecs/pcm186x.c
+++ b/sound/soc/codecs/pcm186x.c
@@ -2,7 +2,7 @@
 /*
  * Texas Instruments PCM186x Universal Audio ADC
  *
- * Copyright (C) 2015-2017 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2015-2017 Texas Instruments Incorporated - https://www.ti.com
  *	Andreas Dannenberg <dannenberg@ti.com>
  *	Andrew F. Davis <afd@ti.com>
  */
diff --git a/sound/soc/codecs/pcm186x.h b/sound/soc/codecs/pcm186x.h
index bb3f0c42a1cd..4d493754a3e2 100644
--- a/sound/soc/codecs/pcm186x.h
+++ b/sound/soc/codecs/pcm186x.h
@@ -2,7 +2,7 @@
 /*
  * Texas Instruments PCM186x Universal Audio ADC
  *
- * Copyright (C) 2015-2017 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2015-2017 Texas Instruments Incorporated - https://www.ti.com
  *	Andreas Dannenberg <dannenberg@ti.com>
  *	Andrew F. Davis <afd@ti.com>
  */
diff --git a/sound/soc/codecs/tas2552.c b/sound/soc/codecs/tas2552.c
index d90e5f2b6f27..a94ad2580729 100644
--- a/sound/soc/codecs/tas2552.c
+++ b/sound/soc/codecs/tas2552.c
@@ -2,7 +2,7 @@
 /*
  * tas2552.c - ALSA SoC Texas Instruments TAS2552 Mono Audio Amplifier
  *
- * Copyright (C) 2014 Texas Instruments Incorporated -  http://www.ti.com
+ * Copyright (C) 2014 Texas Instruments Incorporated -  https://www.ti.com
  *
  * Author: Dan Murphy <dmurphy@ti.com>
  */
diff --git a/sound/soc/codecs/tas2552.h b/sound/soc/codecs/tas2552.h
index d0958315d6a2..b9c2e70df57e 100644
--- a/sound/soc/codecs/tas2552.h
+++ b/sound/soc/codecs/tas2552.h
@@ -2,7 +2,7 @@
 /*
  * tas2552.h - ALSA SoC Texas Instruments TAS2552 Mono Audio Amplifier
  *
- * Copyright (C) 2014 Texas Instruments Incorporated -  http://www.ti.com
+ * Copyright (C) 2014 Texas Instruments Incorporated -  https://www.ti.com
  *
  * Author: Dan Murphy <dmurphy@ti.com>
  */
diff --git a/sound/soc/codecs/tas2562.h b/sound/soc/codecs/tas2562.h
index 28e75fc431d0..61f22b45fe1b 100644
--- a/sound/soc/codecs/tas2562.h
+++ b/sound/soc/codecs/tas2562.h
@@ -2,7 +2,7 @@
 /*
  * tas2562.h - ALSA SoC Texas Instruments TAS2562 Mono Audio Amplifier
  *
- * Copyright (C) 2019 Texas Instruments Incorporated -  http://www.ti.com
+ * Copyright (C) 2019 Texas Instruments Incorporated -  https://www.ti.com
  *
  * Author: Dan Murphy <dmurphy@ti.com>
  */
diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 54c8135fe43c..ad660d1a5ed9 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -3,7 +3,7 @@
 // ALSA SoC Texas Instruments TAS2770 20-W Digital Input Mono Class-D
 // Audio Amplifier with Speaker I/V Sense
 //
-// Copyright (C) 2016-2017 Texas Instruments Incorporated - http://www.ti.com/
+// Copyright (C) 2016-2017 Texas Instruments Incorporated - https://www.ti.com/
 //	Author: Tracy Yi <tracy-yi@ti.com>
 //	Frank Shi <shifu0704@thundersoft.com>
 
diff --git a/sound/soc/codecs/tas2770.h b/sound/soc/codecs/tas2770.h
index cbb858369fe6..96683971ee9b 100644
--- a/sound/soc/codecs/tas2770.h
+++ b/sound/soc/codecs/tas2770.h
@@ -2,7 +2,7 @@
  *
  * ALSA SoC TAS2770 codec driver
  *
- *  Copyright (C) 2016-2017 Texas Instruments Incorporated - http://www.ti.com/
+ *  Copyright (C) 2016-2017 Texas Instruments Incorporated - https://www.ti.com/
  */
 #ifndef __TAS2770__
 #define __TAS2770__
diff --git a/sound/soc/codecs/tas5720.c b/sound/soc/codecs/tas5720.c
index 37fab8f22800..616c8ab89c68 100644
--- a/sound/soc/codecs/tas5720.c
+++ b/sound/soc/codecs/tas5720.c
@@ -2,7 +2,7 @@
 /*
  * tas5720.c - ALSA SoC Texas Instruments TAS5720 Mono Audio Amplifier
  *
- * Copyright (C)2015-2016 Texas Instruments Incorporated -  http://www.ti.com
+ * Copyright (C)2015-2016 Texas Instruments Incorporated -  https://www.ti.com
  *
  * Author: Andreas Dannenberg <dannenberg@ti.com>
  */
diff --git a/sound/soc/codecs/tas5720.h b/sound/soc/codecs/tas5720.h
index 93079f954f09..223858f0de71 100644
--- a/sound/soc/codecs/tas5720.h
+++ b/sound/soc/codecs/tas5720.h
@@ -2,7 +2,7 @@
 /*
  * tas5720.h - ALSA SoC Texas Instruments TAS5720 Mono Audio Amplifier
  *
- * Copyright (C)2015-2016 Texas Instruments Incorporated -  http://www.ti.com
+ * Copyright (C)2015-2016 Texas Instruments Incorporated -  https://www.ti.com
  *
  * Author: Andreas Dannenberg <dannenberg@ti.com>
  */
diff --git a/sound/soc/codecs/tas6424.c b/sound/soc/codecs/tas6424.c
index aaba39295079..3e6a77d60a2f 100644
--- a/sound/soc/codecs/tas6424.c
+++ b/sound/soc/codecs/tas6424.c
@@ -2,7 +2,7 @@
 /*
  * ALSA SoC Texas Instruments TAS6424 Quad-Channel Audio Amplifier
  *
- * Copyright (C) 2016-2017 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2016-2017 Texas Instruments Incorporated - https://www.ti.com/
  *	Author: Andreas Dannenberg <dannenberg@ti.com>
  *	Andrew F. Davis <afd@ti.com>
  */
diff --git a/sound/soc/codecs/tas6424.h b/sound/soc/codecs/tas6424.h
index c67a7835ca66..a6a0d00e5190 100644
--- a/sound/soc/codecs/tas6424.h
+++ b/sound/soc/codecs/tas6424.h
@@ -2,7 +2,7 @@
 /*
  * ALSA SoC Texas Instruments TAS6424 Quad-Channel Audio Amplifier
  *
- * Copyright (C) 2016-2017 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2016-2017 Texas Instruments Incorporated - https://www.ti.com/
  *	Author: Andreas Dannenberg <dannenberg@ti.com>
  *	Andrew F. Davis <afd@ti.com>
  */
diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index 35fe8ee5bce9..0c3b08d1d749 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 // TLV320ADCX140 Sound driver
-// Copyright (C) 2020 Texas Instruments Incorporated - http://www.ti.com/
+// Copyright (C) 2020 Texas Instruments Incorporated - https://www.ti.com/
 
 #include <linux/module.h>
 #include <linux/moduleparam.h>
diff --git a/sound/soc/codecs/tlv320adcx140.h b/sound/soc/codecs/tlv320adcx140.h
index 39206bf1af12..ab3fec866ae9 100644
--- a/sound/soc/codecs/tlv320adcx140.h
+++ b/sound/soc/codecs/tlv320adcx140.h
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 // TLV320ADCX104 Sound driver
-// Copyright (C) 2020 Texas Instruments Incorporated - http://www.ti.com/
+// Copyright (C) 2020 Texas Instruments Incorporated - https://www.ti.com/
 
 #ifndef _TLV320ADCX140_H
 #define _TLV320ADCX140_H
diff --git a/sound/soc/codecs/tlv320aic31xx.c b/sound/soc/codecs/tlv320aic31xx.c
index 31daa60695bd..9d4063138e22 100644
--- a/sound/soc/codecs/tlv320aic31xx.c
+++ b/sound/soc/codecs/tlv320aic31xx.c
@@ -2,7 +2,7 @@
 /*
  * ALSA SoC TLV320AIC31xx CODEC Driver
  *
- * Copyright (C) 2014-2017 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2014-2017 Texas Instruments Incorporated - https://www.ti.com/
  *	Jyri Sarha <jsarha@ti.com>
  *
  * Based on ground work by: Ajit Kulkarni <x0175765@ti.com>
@@ -877,7 +877,7 @@ static int aic31xx_setup_pll(struct snd_soc_component *component,
 		   there may be trouble. To fix the issue edit the
 		   aic31xx_divs table for your mclk and sample
 		   rate. Details can be found from:
-		   http://www.ti.com/lit/ds/symlink/tlv320aic3100.pdf
+		   https://www.ti.com/lit/ds/symlink/tlv320aic3100.pdf
 		   Section: 5.6 CLOCK Generation and PLL
 		*/
 	}
diff --git a/sound/soc/codecs/tlv320aic31xx.h b/sound/soc/codecs/tlv320aic31xx.h
index 0523884cee74..81952984613d 100644
--- a/sound/soc/codecs/tlv320aic31xx.h
+++ b/sound/soc/codecs/tlv320aic31xx.h
@@ -2,7 +2,7 @@
 /*
  * ALSA SoC TLV320AIC31xx CODEC Driver Definitions
  *
- * Copyright (C) 2014-2017 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2014-2017 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 #ifndef _TLV320AIC31XX_H
-- 
2.27.0

