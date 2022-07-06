Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA74B569409
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 23:14:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 692681671;
	Wed,  6 Jul 2022 23:13:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 692681671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657142055;
	bh=+6ILwVb3BaKEYllGsU5wEZgDMHQnvU6J2k9hy/0MCaI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jNPGNvEcPcQOLF5yAUDtVzw3PRbelO4HbbRMDsiVTa2iIBRKulEF41zZvDUYL8J8B
	 kkxiUeywglQxhfXVJ6aqCsfrtg253JUugGaO1vPVa/troJEDtIlffwT21NbxS/avVj
	 8rJ48I/XjZ1wYpouZ8CyzVAhkH4bxqpiUIqOy6Kg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41454F8052E;
	Wed,  6 Jul 2022 23:12:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 345B9F804ED; Wed,  6 Jul 2022 23:12:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A3D5F804B4
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 23:12:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A3D5F804B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ma50mw4u"
Received: by mail-ed1-x52d.google.com with SMTP id x10so13445009edd.13
 for <alsa-devel@alsa-project.org>; Wed, 06 Jul 2022 14:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nLoYnjJYaMuUjmUl/SNVFnEZOR1w2Ji861IF7OAgh9o=;
 b=ma50mw4u5WYVMc6RSKXK+AkZv5yFmXXkZtLIQiTH7JOikTr5cY478/HZfTPOUk0/re
 AEF6m/hsyJpAt+4sm6C54s6K/iVt+Ajg9i9RtF/e31tjW+Q3kED+5u9PN5dqrOzi3ZFo
 T+83Igiu3hBTNyNfk7SBoXYFWd+Q3zjWQLji0onPRxwO3FSObnFRIizkqfEddwVUQXHU
 4f3EXF9dH88K6Vhmfa2fwzPExjQaLUz3aurJkA43NxPLoNsjXOjiww9OJc8QWcAMQTzg
 ktLibi8Pm4yWHoCIChEcRT4PVynGoXaJYsVYkB6AunAR/Wzp+k+tgXHkEz/miqfs3bZ8
 b3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nLoYnjJYaMuUjmUl/SNVFnEZOR1w2Ji861IF7OAgh9o=;
 b=HJ6UkOoMSt4QVRYYtNOwdjNUT6tIgZo6oqSXarEAwkGhwaSZeFHOhTgdd4Eu0Vne7Q
 gTJv18KeXqtT187+/VHgLwS3g+PRyKejstadZ7kHJFoUbovZElWe+DDTaM9GXmxL+S5s
 82ZksDqbY68+2sYu8+RProEQGZE4X698Df9eRuIXzbLDkT/AsIG24v+eJF2KcAInVZD4
 uL9lACXV3RwSPQckrrS163Fh6G9yaWRYr7YBapPBAGtJomJTrK+Rx5R2iiOX1Aio6MMJ
 EtszlP1zvBRyY+ATvwEADW4iKqaKlLWnygkyilG+pD9kKAYK6HXvxFRFSgbbNUw7DYle
 SZfA==
X-Gm-Message-State: AJIora9EaCQGSZEzhWHwTjaEckpoZwcxyycVPqAM6EdHdfIthg/0zeUA
 zx4i8NCF29Zr6v3fcVEC3JqGBKuBpkY=
X-Google-Smtp-Source: AGRyM1uvPqutBp4Awj0Z7Ils1JxvC8YMnPUI9lgklsEXrLB8BAhEEFSDxxc56PyKsgIBVRqlML8P0Q==
X-Received: by 2002:a05:6402:c48:b0:437:d938:9691 with SMTP id
 cs8-20020a0564020c4800b00437d9389691mr56178570edb.254.1657141958925; 
 Wed, 06 Jul 2022 14:12:38 -0700 (PDT)
Received: from localhost (92.40.202.8.threembb.co.uk. [92.40.202.8])
 by smtp.gmail.com with ESMTPSA id
 8-20020a170906300800b0072aadbd48c7sm6631357ejz.84.2022.07.06.14.12.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 14:12:38 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH 01/11] ASoC: jz4740-i2s: Remove Open Firmware dependency
Date: Wed,  6 Jul 2022 22:13:20 +0100
Message-Id: <20220706211330.120198-2-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220706211330.120198-1-aidanmacdonald.0x0@gmail.com>
References: <20220706211330.120198-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-mips@vger.kernel.org,
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

This driver doesn't require Open Firmware support. Remove the
OF-specific includes and drop the Kconfig dependency.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 sound/soc/jz4740/Kconfig      | 2 +-
 sound/soc/jz4740/jz4740-i2s.c | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/jz4740/Kconfig b/sound/soc/jz4740/Kconfig
index 29144720cb62..e72f826062e9 100644
--- a/sound/soc/jz4740/Kconfig
+++ b/sound/soc/jz4740/Kconfig
@@ -2,7 +2,7 @@
 config SND_JZ4740_SOC_I2S
 	tristate "SoC Audio (I2S protocol) for Ingenic JZ4740 SoC"
 	depends on MIPS || COMPILE_TEST
-	depends on OF && HAS_IOMEM
+	depends on HAS_IOMEM
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y if you want to use I2S protocol and I2S codec on Ingenic JZ4740
diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index 79afac0c5003..298ff0a83931 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -5,10 +5,9 @@
 
 #include <linux/init.h>
 #include <linux/io.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-- 
2.35.1

