Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF10140E7
	for <lists+alsa-devel@lfdr.de>; Sun,  5 May 2019 17:59:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CE1B18C5;
	Sun,  5 May 2019 17:58:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CE1B18C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557071943;
	bh=Ke4DqpJR7/U4VCYbIHBSABXP5jLtz7UFayxpAu4893w=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Es51V0VMKEmsncyz+UOAIYlk3XU+GoQZ8kqJRg5hO2lzZdgEmSLD+mP9U3HBExTyD
	 XE+yKqY7kRk0gN+8QvEVfDnRjbCtdIaro1WEruofflCnZH6u/rdhmbZTLW9p986Uyt
	 T2qCGaTssdNkR68Hz7MEG4z3A1eXqD4ZSF7jUjho=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F990F89735;
	Sun,  5 May 2019 17:54:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 068C3F896EC; Thu,  2 May 2019 14:11:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3E8CF896AA
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 14:11:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3E8CF896AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="Gn8SvsLQ"
Received: by mail-wr1-x441.google.com with SMTP id k16so3013693wrn.5
 for <alsa-devel@alsa-project.org>; Thu, 02 May 2019 05:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oCtO7F4iCfswKyRGi7bOSLphK4gIn4iJZV2uNp5ivzs=;
 b=Gn8SvsLQMxKlYfYvb5wfkMqO5ckj8c3meyR1C3aEF7HNubkJ1NYdrJV78Fn4DIcTc2
 750uPQfLMl89SFZVsmnEJSvaPPNSwxsgI9dXKjMCp1D61Qha+89LL/J4SCUdIsk/J0dX
 sFXO4IQo2P0IQtqgww6Tm2hVB0yxjd55TI6Ed3Y9xvMGF5PWOSlwCZlFLC5IS7WPB+sO
 Y0fjL8vgivscCL6P0QoLWuwI5Wsl2E2ihgRT9AewjeuhAB3aMlikCoxqnbCC4x5upxwp
 DFnouu0WnTTIOg6TR60OvVdUtOQULErUwESdhxKc24p93FG6V2sFDU1c8uHzJNKS89oI
 ieBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oCtO7F4iCfswKyRGi7bOSLphK4gIn4iJZV2uNp5ivzs=;
 b=Zx9lj8exop7GMcQc6RTLZl9xR0Bh4EpfTupp6AHpWMpPjEBgIRTkY+eUb8iEe+LTji
 xXYc/B7v5P00m9ThW9N+upxodfKeLcmsGu9YGKbbggsfBky7f8IQnuGniHGeXBnnhAZR
 GdK2kuqiB6wFtMdEqCRZpUinuHDDP1EAw+OG+ZskVvy8PPkvmmDx8TLirz7mc3+7SIQO
 in8OQfWPm8z8QbHDOMg44Z3FJJkQ2RtiSUUSloc8ybMmu8XwfR+G7GBlBt6CMM3pBVGv
 1oBhIEx3ryHJrgrYUWRA79KOqAmzY5nZc07mNe/4OGrC7rKaD7kkIMSbLvbaDk1yBkMN
 /RwA==
X-Gm-Message-State: APjAAAVgnJndlI+fI1hdtJjkuR3imteail+u8bIsa1bk1wDrGlXimyaJ
 /otm65ruznPSm8/tECpN0fE6GQ==
X-Google-Smtp-Source: APXvYqwiOYJrXyeXMjSrke5vRgXR13G0kZTQzgHmDuQOjoYmPdNvfpQ6nGVxnTDki5cdAAvppT14Iw==
X-Received: by 2002:adf:e984:: with SMTP id h4mr2580423wrm.32.1556799059924;
 Thu, 02 May 2019 05:10:59 -0700 (PDT)
Received: from localhost.localdomain
 (aputeaux-684-1-8-187.w90-86.abo.wanadoo.fr. [90.86.125.187])
 by smtp.gmail.com with ESMTPSA id u9sm3648348wmd.14.2019.05.02.05.10.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 05:10:59 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 mark.rutland@arm.com, matthias.bgg@gmail.com, perex@perex.cz,
 tiwai@suse.com, kaichieh.chuang@mediatek.com, shunli.wang@mediatek.com
Date: Thu,  2 May 2019 14:10:41 +0200
Message-Id: <20190502121041.8045-6-fparent@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502121041.8045-1-fparent@baylibre.com>
References: <20190502121041.8045-1-fparent@baylibre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 05 May 2019 17:54:02 +0200
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH 5/5] ASoC: mediatek: mt8516: register ADDA DAI
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Register the ADDA DAI driver into the MT8516 PCM driver.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 sound/soc/mediatek/mt8516/mt8516-afe-pcm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/mediatek/mt8516/mt8516-afe-pcm.c b/sound/soc/mediatek/mt8516/mt8516-afe-pcm.c
index 84fbb5dbbd14..e1fd9290dd8f 100644
--- a/sound/soc/mediatek/mt8516/mt8516-afe-pcm.c
+++ b/sound/soc/mediatek/mt8516/mt8516-afe-pcm.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 
+#include "mt8516-afe-common.h"
 #include "mt8516-afe-regs.h"
 
 #include "../common/mtk-afe-platform-driver.h"
@@ -670,6 +671,7 @@ static int mt8516_dai_memif_register(struct mtk_base_afe *afe)
 typedef int (*dai_register_cb)(struct mtk_base_afe *);
 static const dai_register_cb dai_register_cbs[] = {
 	mt8516_dai_memif_register,
+	mt8516_dai_adda_register,
 };
 
 static int mt8516_afe_component_probe(struct snd_soc_component *component)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
