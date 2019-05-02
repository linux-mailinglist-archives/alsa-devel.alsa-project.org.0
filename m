Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BD0140E8
	for <lists+alsa-devel@lfdr.de>; Sun,  5 May 2019 17:59:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C66A218B4;
	Sun,  5 May 2019 17:58:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C66A218B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557071983;
	bh=qHIiiY0d/coWpjhh/N6UMlEapAvm6Wt9zg104yHLn+g=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=snYA1i73814jowr+eeh9OoEuOiInEbvsnxI+/4LFbv3s1x46StXXmg7zTvgQ2POs7
	 qkH2vxWQ8WuutociMY7rJK+O/B7Q3WJu7fOvmqZ/bbW2IAgB/Jqfcap9g6ZX80uVWt
	 ULWnZJBSkJojO/0sdqJfBcQ4Q/2n498jvxpejM0I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1340F8973A;
	Sun,  5 May 2019 17:54:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8AB19F896C7; Thu,  2 May 2019 15:12:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_76,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B87CEF80722
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 15:12:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B87CEF80722
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="dr5NFFsH"
Received: by mail-wm1-x344.google.com with SMTP id b67so6599821wmg.1
 for <alsa-devel@alsa-project.org>; Thu, 02 May 2019 06:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+eKIBFVCyfU3z9K0Nkrbe4x8CjJi0tFioNqDYhFc5R0=;
 b=dr5NFFsHzVONa3dE3FwJEUNK3jJWutA5uirz+FdNEsOKyW9jtLLjOprjU7P5Dd/0rg
 2eWQ1QAm/Edl/2pyCcl5BwSZvKFykMHnrZlBmf58HKiOVkhrGLrubYLoZlHrnkWRQBgQ
 8CE2/0KNaS4NvFw8Fw3kypj1SKzhH8ilkPjtYzjiUsYZ9GIA08s4+U8kkP3LJGdcFxCc
 DfNYfE6omUGxYetreHAXNTxWjIGfvwdjqaxBmPS9txbdThNiFnKk/Z69050gYJcAIYda
 jWXPINAK5gn7kg4xzcbEHfmz0UWNK61kgKVY03AgBUMFosoIu8AMxw1VRicxiuNfPoUM
 AEqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+eKIBFVCyfU3z9K0Nkrbe4x8CjJi0tFioNqDYhFc5R0=;
 b=b8VliJ8w3YaUPsTfgcKNTD+bPf0h4Ez3aLKGl8SlfSF3IHGDuEgQmKwV8EtrA3kOFL
 bb+cbVjg/LWJdyev5f6D4qw2Sb4smQrSvphGVDKLhViVZ2Qzr3W/ig652lWQjRM4tTIX
 CwavyrBtaMfnJidZS/J3YYNJEAdWdNhxaNr+sCamcHOXyq1RENwCA+lVuSjxeFh3VCf0
 Zos3QOKyKklwSfM97GplxZVc2u9UhDsADfUVzmBXeF8L0XTG8eEGs3GkTjgfteQCG7QY
 Rn+IPD2tG/nXsShyBRi6nOsFkU/19TkzYE1fatWlwLXN6oOowfNR49VoZIxpc6E1Z11Z
 W9jw==
X-Gm-Message-State: APjAAAULeQCnu+hF3+n6dCuoG9n5uh8DwHZlbfyd0HYZICcXaTxRgkEj
 1kKtDq3bhL2QuZ0ROhZvO+BOpQ==
X-Google-Smtp-Source: APXvYqzZgK/pMDB9Xf3fEjr0tmm3/b9kba6qmyNpc31/HAcsxLdTuDfW/bsw/tKB5/jGsEYL+pWpdw==
X-Received: by 2002:a7b:c00e:: with SMTP id c14mr2286133wmb.110.1556802737876; 
 Thu, 02 May 2019 06:12:17 -0700 (PDT)
Received: from localhost.localdomain
 (aputeaux-684-1-8-187.w90-86.abo.wanadoo.fr. [90.86.125.187])
 by smtp.gmail.com with ESMTPSA id n6sm8713956wmn.48.2019.05.02.06.12.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 06:12:17 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 matthias.bgg@gmail.com
Date: Thu,  2 May 2019 15:12:14 +0200
Message-Id: <20190502131214.24009-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 05 May 2019 17:54:02 +0200
Cc: Fabien Parent <fparent@baylibre.com>, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v2] ASoC: mediatek: mt8516: register ADDA DAI
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

This patch depends on patch serie:
	[PATCH 0/5] ASoC: mediatek: Add basic PCM driver for MT8516

v2:
	* Register ADDA before memif to fix ordering issue.

---
 sound/soc/mediatek/mt8516/mt8516-afe-pcm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/mediatek/mt8516/mt8516-afe-pcm.c b/sound/soc/mediatek/mt8516/mt8516-afe-pcm.c
index 84fbb5dbbd14..dea9221c67aa 100644
--- a/sound/soc/mediatek/mt8516/mt8516-afe-pcm.c
+++ b/sound/soc/mediatek/mt8516/mt8516-afe-pcm.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 
+#include "mt8516-afe-common.h"
 #include "mt8516-afe-regs.h"
 
 #include "../common/mtk-afe-platform-driver.h"
@@ -669,6 +670,7 @@ static int mt8516_dai_memif_register(struct mtk_base_afe *afe)
 
 typedef int (*dai_register_cb)(struct mtk_base_afe *);
 static const dai_register_cb dai_register_cbs[] = {
+	mt8516_dai_adda_register,
 	mt8516_dai_memif_register,
 };
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
