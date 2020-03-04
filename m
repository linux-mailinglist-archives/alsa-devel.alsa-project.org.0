Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F66179191
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Mar 2020 14:41:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12CAC1667;
	Wed,  4 Mar 2020 14:40:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12CAC1667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583329269;
	bh=KbxByt0htRYxdQ4RukfsRWLlqr0DYIMFxt8/ix7iV98=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Vu02POEm0JdhlyMcbMw6RMTyreaSGvQV57J2bLUHoScxfQFXn7ASucfyEVyOHFw4n
	 C6IhgkfgGicdJfbZBzTm4nLrpjW4P9bHpe21E1Fa3hN1ueGty8VvPbIXAVxqrDeW+4
	 k7r/0fwv1UXvP/OzfSccUsSs07RBYy1oyDYZFZZU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E2DBF801F5;
	Wed,  4 Mar 2020 14:39:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0572BF801F5; Wed,  4 Mar 2020 14:39:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 RCVD_IN_DNSWL_BLOCKED, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 7D9BEF800D8
 for <alsa-devel@alsa-project.org>; Wed,  4 Mar 2020 14:39:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D9BEF800D8
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFF2031B;
 Wed,  4 Mar 2020 05:39:15 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 33B373F6C4;
 Wed,  4 Mar 2020 05:39:15 -0800 (PST)
Date: Wed, 04 Mar 2020 13:39:13 +0000
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Applied "ASoc: amd: acp3x: Add missing include <linux/io.h>" to the
 asoc tree
In-Reply-To: <20200304084057.44764-1-yuehaibing@huawei.com>
Message-Id: <applied-20200304084057.44764-1-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, yuehaibing@huawei.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Hulk Robot <hulkci@huawei.com>, Mark Brown <broonie@kernel.org>,
 akshu.agrawal@amd.com
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

The patch

   ASoc: amd: acp3x: Add missing include <linux/io.h>

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 14beaccc36dc9c1afbe6da627b873bf1d6849234 Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 4 Mar 2020 16:40:57 +0800
Subject: [PATCH] ASoc: amd: acp3x: Add missing include <linux/io.h>

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

Fixes: 6b8e4e7db3cd ("ASoC: amd: Add machine driver for Raven based platform")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Message-Id: <20200304084057.44764-1-yuehaibing@huawei.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/amd/acp3x-rt5682-max9836.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index 521c9ab4c29c..8f71c3f7ef79 100644
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
2.20.1

