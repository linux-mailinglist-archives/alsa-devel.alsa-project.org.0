Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DB9178CD1
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Mar 2020 09:51:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E6601668;
	Wed,  4 Mar 2020 09:50:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E6601668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583311876;
	bh=S0cp3u+os4+A52sDWjvSJcfdRQ8lU8OG0Dxf+Xaa3fk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Q+WmXDgMq9N73sLLeYcXZhL7oGocQ9wfGNmIurBH5celV0Tjx0fiee6O810CHD9De
	 7FmAfAmjqg7P7mXHE2PZ8hR13w80oFt3tuh1qk99mQbqQ001ebMkk5SJVXpxvX9fhH
	 z24+uDz4ha0syzGgWx56F4vbwSpfPGbM5/Y/WuRM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F541F800D8;
	Wed,  4 Mar 2020 09:49:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6991DF801ED; Wed,  4 Mar 2020 09:49:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B9F3F8011C
 for <alsa-devel@alsa-project.org>; Wed,  4 Mar 2020 09:49:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B9F3F8011C
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id CEE30ED56418103D1B42;
 Wed,  4 Mar 2020 16:49:25 +0800 (CST)
Received: from localhost (10.173.223.234) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Wed, 4 Mar 2020
 16:49:19 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <akshu.agrawal@amd.com>, <yuehaibing@huawei.com>
Subject: [PATCH] ASoc: amd: acp3x: Add missing include <linux/io.h>
Date: Wed, 4 Mar 2020 16:40:57 +0800
Message-ID: <20200304084057.44764-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.223.234]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

gcc 7.4.0 build fails:

In file included from sound/soc/amd/acp3x-rt5682-max9836.c:20:0:
sound/soc/amd/raven/acp3x.h: In function rv_readl:
sound/soc/amd/raven/acp3x.h:113:9: error: implicit declaration of function readl; did you mean rv_readl? [-Werror=implicit-function-declaration]
  return readl(base_addr - ACP3x_PHY_BASE_ADDRESS);
         ^~~~~
         rv_readl
sound/soc/amd/raven/acp3x.h: In function rv_writel:
sound/soc/amd/raven/acp3x.h:118:2: error: implicit declaration of function writel; did you mean rv_writel? [-Werror=implicit-function-declaration]
  writel(val, base_addr - ACP3x_PHY_BASE_ADDRESS);
  ^~~~~~
  rv_writel

Add <linux/io.h> to fix this.

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 6b8e4e7db3cd ("ASoC: amd: Add machine driver for Raven based platform")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/soc/amd/acp3x-rt5682-max9836.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index 511b8b1..b4f68c5 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -16,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/i2c.h>
 #include <linux/input.h>
+#include <linux/io.h>
 #include <linux/acpi.h>
 
 #include "raven/acp3x.h"
-- 
2.7.4


