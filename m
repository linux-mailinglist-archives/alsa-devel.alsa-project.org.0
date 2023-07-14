Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6F1754161
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jul 2023 19:52:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CED92DED;
	Fri, 14 Jul 2023 19:51:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CED92DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689357155;
	bh=/d24obfiTmxsqU0Kn0c83DAe5ZAEC4RURrSBIHwPncM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=AkaRNR2ShF6+Dk1hXgOoCCWT8Cu+FDAOIUWljLS3NPXwJazek0Hh4tFu6dNsQSnGL
	 nJRvwoxJjTfshpe7ZREZUEWuLHbKxVzCCFXBf2yO39+2ydxQH32/XT6o5ZzVhKcvMh
	 GSvRPg7kiIXTUopNoNHKaDfupwP6jPCzy2nycWdQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9028EF800E4; Fri, 14 Jul 2023 19:51:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4096AF800E4;
	Fri, 14 Jul 2023 19:51:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0AEC8F8024E; Fri, 14 Jul 2023 19:51:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A7558F80153
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 19:51:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7558F80153
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-7835e5fa459so86380839f.2
        for <alsa-devel@alsa-project.org>;
 Fri, 14 Jul 2023 10:51:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689357097; x=1691949097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jV0ZVw+tXJJaX6sFXrDUifNmdjozDg0jsFO9uzlP0KY=;
        b=I5dRvHLnDrx9FDLFTBdCVEr1HvqGTlL7ZR0iH46+qx3YrJvKvVFoGg38U2I9fTisTY
         rA/rMXNDsNrY+MFd2rUo6IDZgomhcKScYrrac2G8BmwUG009qj/R4HaoB6pYm0u02hbJ
         CdW0ebYeDiTNg7nfxhSfPr5CxPVdmgwjI8K/LBkm4s8TpZNCTjFLTYn3VBnsCIiBxrwv
         1Krd539+S/zqOHFcbEwOmd0sQUCggJGNhy93mOGdgtNSIxtWDdP2gStYE7VePnzg46iE
         ArSSGpQPwY5VsXmgfPpsOoFtpuQClXZ7DY8aPMpLCBCHuL+i2pg2tzgKTfsMj6mug4pC
         Y+Pw==
X-Gm-Message-State: ABy/qLYAxHe3HminDItZaIPO+dZpAPT3jFEoFTS5KfFCrP6j4oikoACH
	BCRbgc8dczgABFuZOw+Y5g==
X-Google-Smtp-Source: 
 APBJJlGxSu03yLG4CUI74yCQInNqkiQy4rOqdX6zUkTVngY8Cs5QXVjapqeBVhmSeXBcmI8RKct4iA==
X-Received: by 2002:a6b:db02:0:b0:783:5e93:1e7f with SMTP id
 t2-20020a6bdb02000000b007835e931e7fmr5310749ioc.18.1689357096822;
        Fri, 14 Jul 2023 10:51:36 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id
 i10-20020a02b68a000000b004290fd3a68dsm2731869jam.1.2023.07.14.10.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 10:51:36 -0700 (PDT)
Received: (nullmailer pid 4066909 invoked by uid 1000);
	Fri, 14 Jul 2023 17:51:23 -0000
From: Rob Herring <robh@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH] ALSA: Explicitly include correct DT includes
Date: Fri, 14 Jul 2023 11:51:08 -0600
Message-Id: <20230714175109.4066599-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RV6P2DD3YQOCJW4Z5ZIXBCQSL4KQAAUN
X-Message-ID-Hash: RV6P2DD3YQOCJW4Z5ZIXBCQSL4KQAAUN
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RV6P2DD3YQOCJW4Z5ZIXBCQSL4KQAAUN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it as merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 sound/atmel/ac97c.c            | 3 +--
 sound/drivers/serial-generic.c | 2 +-
 sound/pci/hda/hda_tegra.c      | 3 ++-
 sound/ppc/awacs.c              | 1 +
 sound/ppc/burgundy.c           | 1 +
 sound/sparc/amd7930.c          | 3 +--
 sound/sparc/cs4231.c           | 2 +-
 sound/sparc/dbri.c             | 2 +-
 8 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/sound/atmel/ac97c.c b/sound/atmel/ac97c.c
index c8912b8a1dc5..402b5f66dcc3 100644
--- a/sound/atmel/ac97c.c
+++ b/sound/atmel/ac97c.c
@@ -12,13 +12,12 @@
 #include <linux/gpio/consumer.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/mutex.h>
 #include <linux/types.h>
 #include <linux/io.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
 
 #include <sound/core.h>
 #include <sound/initval.h>
diff --git a/sound/drivers/serial-generic.c b/sound/drivers/serial-generic.c
index e1f864dc7939..b0262541802a 100644
--- a/sound/drivers/serial-generic.c
+++ b/sound/drivers/serial-generic.c
@@ -16,7 +16,7 @@
 #include <linux/io.h>
 #include <linux/ioport.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/serdev.h>
 #include <linux/serial_reg.h>
 #include <linux/slab.h>
diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index 9d0ab043880b..39fa036616ce 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -16,7 +16,8 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/mutex.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/time.h>
diff --git a/sound/ppc/awacs.c b/sound/ppc/awacs.c
index 53d558b2806c..659866cfe3b4 100644
--- a/sound/ppc/awacs.c
+++ b/sound/ppc/awacs.c
@@ -11,6 +11,7 @@
 #include <asm/nvram.h>
 #include <linux/init.h>
 #include <linux/delay.h>
+#include <linux/of.h>
 #include <linux/slab.h>
 #include <sound/core.h>
 #include "pmac.h"
diff --git a/sound/ppc/burgundy.c b/sound/ppc/burgundy.c
index 4fb990ab2ceb..400a886562b1 100644
--- a/sound/ppc/burgundy.c
+++ b/sound/ppc/burgundy.c
@@ -9,6 +9,7 @@
 #include <linux/io.h>
 #include <linux/init.h>
 #include <linux/delay.h>
+#include <linux/of.h>
 #include <sound/core.h>
 #include "pmac.h"
 #include "burgundy.h"
diff --git a/sound/sparc/amd7930.c b/sound/sparc/amd7930.c
index c434b69a83f1..0fea04acc3ea 100644
--- a/sound/sparc/amd7930.c
+++ b/sound/sparc/amd7930.c
@@ -37,7 +37,7 @@
 #include <linux/interrupt.h>
 #include <linux/moduleparam.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
+#include <linux/platform_device.h>
 #include <linux/io.h>
 
 #include <sound/core.h>
@@ -47,7 +47,6 @@
 #include <sound/initval.h>
 
 #include <asm/irq.h>
-#include <asm/prom.h>
 
 static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;	/* Index 0-MAX */
 static char *id[SNDRV_CARDS] = SNDRV_DEFAULT_STR;	/* ID for this card */
diff --git a/sound/sparc/cs4231.c b/sound/sparc/cs4231.c
index 31bac355ec4d..c2ad3fa2f25a 100644
--- a/sound/sparc/cs4231.c
+++ b/sound/sparc/cs4231.c
@@ -18,7 +18,7 @@
 #include <linux/irq.h>
 #include <linux/io.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
+#include <linux/platform_device.h>
 
 #include <sound/core.h>
 #include <sound/pcm.h>
diff --git a/sound/sparc/dbri.c b/sound/sparc/dbri.c
index 376aed136a45..050e98f32d36 100644
--- a/sound/sparc/dbri.c
+++ b/sound/sparc/dbri.c
@@ -69,7 +69,7 @@
 #include <sound/initval.h>
 
 #include <linux/of.h>
-#include <linux/of_device.h>
+#include <linux/platform_device.h>
 #include <linux/atomic.h>
 #include <linux/module.h>
 
-- 
2.40.1

