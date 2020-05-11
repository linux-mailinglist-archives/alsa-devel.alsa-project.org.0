Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CD31CD0DB
	for <lists+alsa-devel@lfdr.de>; Mon, 11 May 2020 06:42:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A8CA1612;
	Mon, 11 May 2020 06:41:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A8CA1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589172123;
	bh=GVZME+h59nLbAd0SpNzsadyPp7g7KIh8wTpeVIDsnLE=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WG/0WamiJTMjCFkWQFwsGgEGLgz7dn2UPXyMaMJnBxzE43DwgXCa6vsWb9wghAPhK
	 R+E06Mqj9fGrgJqICWC+hbaA7E64SKpEPs2yxI+Y8Jwg1jYHss0ZserFA+7bhDArNV
	 CEmfzdSuSqbR+n3E5Y+gp5iCOgl+NBOLXp8CTMQY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58778F8014C;
	Mon, 11 May 2020 06:40:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D552DF80157; Mon, 11 May 2020 06:40:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F97BF800E3
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 06:40:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F97BF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="LQSUUpeP"
Received: by mail-yb1-xb49.google.com with SMTP id e2so10251588ybm.19
 for <alsa-devel@alsa-project.org>; Sun, 10 May 2020 21:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=C7MZ5yH2EBM/QfNCjc4/3t6rGZaUYSu5xVho9M8iA1Q=;
 b=LQSUUpePxcNjOlt5h+sR5ABakGa5NZx0NKZz3ejyPx7pHQQg3Jar4l6gjZdcUqXwH9
 Ub+jWByPJjrxLmDVhnVMEYhWb01BnEENVyQs9XLdbyia0pg3tGWyVrL+7WVxbyCeJkg4
 AR+x2VZABXTKMj8tkp3px+C5MzRBuw1WcsmZ8Kv0vYZU1ZoPstpEfUD5CtHyR7j/zTkb
 Vf2Gkf44S/ddFWNk5wic6QcCfsa114wvDvmp8c+0Hvl1kuXBUF8n1qoCuIEDSX/HL4DN
 ElNiaHugmOUAYo7m+OQ+KUQVXvB/+ahLTFFryfgZ7XEfxPpZ1ZedgfKBSK2D0GOl6lwY
 9wng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=C7MZ5yH2EBM/QfNCjc4/3t6rGZaUYSu5xVho9M8iA1Q=;
 b=SUrLagE6yA3RU87FFsbZ3J0T8X9SEIq2Hkm4tqHBUnGZYnM9j0TbqWwW1pRIUbkqxM
 iZ/q+Qa+IniDdYWUAi3r5YSn41e9iHhuxYNC4qgVu4PMbpKEBILQRFN83w0OOOE0kmfv
 KPLuNH8Fl7LF4RY+3yJRkgzz+i+VtUbVk06GkHKJDeus5vWmPRocf4KtwJMi4GCKO47z
 vyV+UMAbFCvw5bu6Nzo8l4+fcMUHv1Pnme8CgE8CyXf99eCKkFlCKG6k0cGiZ0GMxKAD
 pfGnkoGriIgEVgBPXAnBobD7mBl03xbImnBJn4of/AKY8yWVnF2HnSvSvxW0GxtbPHwH
 JCJQ==
X-Gm-Message-State: AOAM531q7oX1QU8FwT6x3TMUql/bD1L2h6tj/mW3U2eQceXiIPHY3Eh4
 Ymd6M83RNRddWQTjLOxNNJDIhRFXSQM4
X-Google-Smtp-Source: ABdhPJxNbXw1gOirRVLK+NVsQTYTbjgDoh82NnY2pzKgxgWowjtGP+dwP17WBQ8VQ3Q8YwgrDmml2DLCSTDo
X-Received: by 2002:a25:d450:: with SMTP id m77mr2288500ybf.177.1589172005051; 
 Sun, 10 May 2020 21:40:05 -0700 (PDT)
Date: Mon, 11 May 2020 12:40:00 +0800
Message-Id: <20200511044000.86161-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
Subject: [PATCH] ASoC: mediatek: mt8183-da7219: set headset button maps
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org
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

Sets headset button maps.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../soc/mediatek/mt8183/mt8183-da7219-max98357.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index 5b3dfa79b4ae..ffd7c931e7bb 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -6,11 +6,12 @@
 // Copyright (c) 2018 MediaTek Inc.
 // Author: Shunli Wang <shunli.wang@mediatek.com>
 
+#include <linux/input.h>
 #include <linux/module.h>
+#include <linux/pinctrl/consumer.h>
+#include <sound/jack.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
-#include <sound/jack.h>
-#include <linux/pinctrl/consumer.h>
 
 #include "mt8183-afe-common.h"
 #include "../../codecs/da7219-aad.h"
@@ -471,9 +472,18 @@ mt8183_da7219_max98357_headset_init(struct snd_soc_component *component)
 	if (ret)
 		return ret;
 
+	snd_jack_set_key(
+		priv->headset_jack.jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
+	snd_jack_set_key(
+		priv->headset_jack.jack, SND_JACK_BTN_1, KEY_VOLUMEUP);
+	snd_jack_set_key(
+		priv->headset_jack.jack, SND_JACK_BTN_2, KEY_VOLUMEDOWN);
+	snd_jack_set_key(
+		priv->headset_jack.jack, SND_JACK_BTN_3, KEY_VOICECOMMAND);
+
 	da7219_aad_jack_det(component, &priv->headset_jack);
 
-	return ret;
+	return 0;
 }
 
 static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
-- 
2.26.2.645.ge9eca65c58-goog

