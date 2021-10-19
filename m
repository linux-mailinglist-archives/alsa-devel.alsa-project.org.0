Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A17432DB3
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Oct 2021 08:05:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 554B016BC;
	Tue, 19 Oct 2021 08:04:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 554B016BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634623529;
	bh=pOHmG58tew0WYnhgqa0gJ0OJgt5Vh0PZkvH09IZHC74=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kVwlGjSU6bP/wQlsoNvM9VNUfEbTUCYRUkmylxpbNKd6tNldsP2R+IXJ0jGPQ79m6
	 sh79A8kMHkvfKcOfpT6P7+T8DLTbwG1Nor08l0wIE+xBBymDzTaLg2prHxPXzUuecU
	 oxi9kPGvkRZ21mCPwvk0ciGvqQGouEp8/n+swRiM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9FD0F80155;
	Tue, 19 Oct 2021 08:04:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D10C9F80256; Tue, 19 Oct 2021 08:04:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A600AF80155
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 08:03:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A600AF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fJFWVL8f"
Received: by mail-pf1-x432.google.com with SMTP id q19so16697806pfl.4
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 23:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aAoohp3BZtxGGNheUbdSrC12LV0VSJwOP4SowcMpevU=;
 b=fJFWVL8fsRE1X7J3D7guL5McUx0WCWwk1cBFQh9RNL1+LhY0ukOqw7FQyxxDfgf2YC
 432esjPcSxvU8PxVJ5XtPvZbJXZ/sm6rcq+TRfMCna3USWpJkBRIZ/GtB8ZcFV6V5Tg2
 W9bmuhtUCRDse8w0TMP56COmBqYDSCdQXZgMnxusKfkAt/WL0kc8kH+VgtCXWoBIMwvg
 sAinwbwGjNKmWodBQnKrn3z6Fy0Wiu+0JDR5e94O7Mnhn9tnciIYWegclHhkHWiHq2hL
 kdnGww+iTgtK8CQNjamia2ZEd6YOrPZNTlOtZrGjd8jde3FKKNdHZLr9XGFw35CdQt7o
 D9Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aAoohp3BZtxGGNheUbdSrC12LV0VSJwOP4SowcMpevU=;
 b=FiJpWiU5KkgRF/rDNfRrHft6zbgfjRVDsX+ts6VhpxkMTw8vLYZplxGu9xNBTPH5ba
 +7AgC49EdXdxErmFDuFx2W0TIC4P6o87tTknBgti8YsMYfRSxgiqMQWHQvw2c6WkKO/T
 4zxU68j5daejYKc77Cb2bJ46i4Hqbzq8Q8xfIKD8phFSFvTcjc6r8c+S61rcuKnIFgRM
 wSS5E1tZIgdl5GWVhEoVY+6Eo6395RG3t7hDl5IS37I0seAwXCuVJIe0Oh6KwNiW8BVN
 H6fNPyLu1YmM6qxjlQYxCw0YuoGTgAnNZOwix3ImnVwcxutbZYWGz31q915XuKyySHx2
 CCHw==
X-Gm-Message-State: AOAM533u+XR0Px/SQNOjI4Dlco2NlTTiXUTp+zoeVkJASiqNtQ+6r7EU
 4Gs4WeA+celET8Nkg64XBAs=
X-Google-Smtp-Source: ABdhPJyYUhzeBuAGb+Xtr7RXa3uesGkYSgpkmA2dmdEm1pxink0iq4MxnZgsjelI3mpoXXnl99gqmw==
X-Received: by 2002:a63:e00b:: with SMTP id e11mr27533032pgh.190.1634623434822; 
 Mon, 18 Oct 2021 23:03:54 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id d138sm14939496pfd.74.2021.10.18.23.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 23:03:54 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: lv.ruyi@zte.com.cn
To: lgirdwood@gmail.com
Subject: [PATCH] ASoC: amd: remove duplicate include in acp5x-mach.c
Date: Tue, 19 Oct 2021 06:03:49 +0000
Message-Id: <20211019060349.975656-1-lv.ruyi@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 lv.ruyi@zte.com.cn, tiwai@suse.com, broonie@kernel.org,
 Vijendar.Mukunda@amd.com, Zeal Robot <zealci@zte.com.cn>
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

From: Lv Ruyi <lv.ruyi@zte.com.cn>

'linux/io.h' and 'linux/module.h' included in 'acp5x-mach.c' is
duplicated.Only one duplicate header file is reserved.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
---
 sound/soc/amd/vangogh/acp5x-mach.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/amd/vangogh/acp5x-mach.c b/sound/soc/amd/vangogh/acp5x-mach.c
index 14cf325e4b23..2d9229ba9c59 100644
--- a/sound/soc/amd/vangogh/acp5x-mach.c
+++ b/sound/soc/amd/vangogh/acp5x-mach.c
@@ -8,16 +8,14 @@
 
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
-#include <linux/module.h>
-#include <linux/io.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
-
 #include <sound/jack.h>
+
 #include <linux/clk.h>
 #include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/i2c.h>
 #include <linux/input.h>
 #include <linux/io.h>
-- 
2.25.1

