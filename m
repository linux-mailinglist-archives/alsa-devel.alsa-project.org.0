Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7BB196BF
	for <lists+alsa-devel@lfdr.de>; Fri, 10 May 2019 04:39:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E868A1AB7;
	Fri, 10 May 2019 04:38:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E868A1AB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557455962;
	bh=0QJBtd6PybYlSyuedN+BO9WTQCfGEshleRrRzkX6/ds=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rzkJ/2jcZJRi+1NB2N361zqtzykYiwUn+GmVMwZJzLw/5ZersRnur3qORaIh98i+6
	 nQaFO5NCPel2zSjI6FavntwUCq+JvoG8BEZJEPAlcTMPo4NoWFzUSF2NupnLbEnJ+v
	 6+NycLq6eaSXTENMkwZY/Pp2BKOacpYHkgYUFePE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5556BF89673;
	Fri, 10 May 2019 04:37:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E05AFF896F0; Fri, 10 May 2019 04:37:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB414F8073C
 for <alsa-devel@alsa-project.org>; Fri, 10 May 2019 04:37:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB414F8073C
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 1F17F1393922CD272DFB;
 Fri, 10 May 2019 10:37:29 +0800 (CST)
Received: from localhost (10.177.31.96) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0; Fri, 10 May 2019
 10:37:19 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <pierre-louis.bossart@linux.intel.com>,
 <rdunlap@infradead.org>
Date: Fri, 10 May 2019 10:36:57 +0800
Message-ID: <20190510023657.8960-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.177.31.96]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ASoC: SOF: Fix build error with
	CONFIG_SND_SOC_SOF_NOCODEC=m
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

Fix gcc build error while CONFIG_SND_SOC_SOF_NOCODEC=m

sound/soc/sof/core.o: In function `snd_sof_device_probe':
core.c:(.text+0x4af): undefined reference to `sof_nocodec_setup'

Change SND_SOC_SOF_NOCODEC to bool to fix this.

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: c16211d6226d ("ASoC: SOF: Add Sound Open Firmware driver core")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/soc/sof/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index b204c65..9c280c9 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -44,7 +44,7 @@ config SND_SOC_SOF_OPTIONS
 if SND_SOC_SOF_OPTIONS
 
 config SND_SOC_SOF_NOCODEC
-	tristate "SOF nocodec mode Support"
+	bool "SOF nocodec mode Support"
 	help
 	  This adds support for a dummy/nocodec machine driver fallback
 	  option if no known codec is detected. This is typically only
-- 
2.7.4


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
