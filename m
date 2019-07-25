Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4892A74C90
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 13:10:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D36A41AE1;
	Thu, 25 Jul 2019 13:09:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D36A41AE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564053026;
	bh=Bez5wXZlS71E25smUga+s13Xk3ZHjayS7+XNFJdDEfI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=r1qV+SuiwxUbwveP/V3hsWVr4knlC8stdFE5eqcwFoe798GBVUzfDGPx18k59RJvf
	 8xhDoWzJNOaBy3VB26HRX18XCRRwKR9a1fTmFtTSY4eCpXRxTYEV4shR7iQDfmkxQk
	 N53jrOOse/HRmMQ0cCHwXQ0CmhkH/GvusAcfWZdY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1155EF80448;
	Thu, 25 Jul 2019 13:08:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E36EF803D0; Thu, 25 Jul 2019 13:08:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C24EFF800E8
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 13:08:34 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id D3FB5A003F;
 Thu, 25 Jul 2019 13:08:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz D3FB5A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1564052913; bh=iYMkxF232DBf+EozdctsJOY+DUrf/fFRz0AVpPKamrc=;
 h=From:To:Cc:Subject:Date:From;
 b=JAcmji+nN9uWIh4TMqDyEANBkHlriwpGZlE2VoinJTS7+1mVH3bwvUYE/yH5XU93L
 XnDTPPxL7GcGLIt0G/36ooCCZt4EXuzryU4oYKurrAh6gVeAja7OXJzZfrjTihbMth
 mLBTJpV7Sw3z8ruRDLLT8M6VXB/Xf1fkmAht8lXQ=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 25 Jul 2019 13:08:27 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Date: Thu, 25 Jul 2019 13:08:08 +0200
Message-Id: <20190725110808.19938-1-perex@perex.cz>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Takashi Iwai <tiwai@suse.de>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH] ASoC: SOF: Makefile - fix the top-level kernel
	module names (add snd- prefix)
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

Use the proper module name. The objs assignments are already there.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.de>
Cc: Mark Brown <broonie@kernel.org>0
---
 sound/soc/sof/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
index 8f14c9d2950b..d2f7a1bc09a1 100644
--- a/sound/soc/sof/Makefile
+++ b/sound/soc/sof/Makefile
@@ -11,8 +11,8 @@ obj-$(CONFIG_SND_SOC_SOF) += snd-sof.o
 obj-$(CONFIG_SND_SOC_SOF_NOCODEC) += snd-sof-nocodec.o
 
 
-obj-$(CONFIG_SND_SOC_SOF_ACPI) += sof-acpi-dev.o
-obj-$(CONFIG_SND_SOC_SOF_PCI) += sof-pci-dev.o
+obj-$(CONFIG_SND_SOC_SOF_ACPI) += snd-sof-acpi-dev.o
+obj-$(CONFIG_SND_SOC_SOF_PCI) += snd-sof-pci-dev.o
 
 obj-$(CONFIG_SND_SOC_SOF_INTEL_TOPLEVEL) += intel/
 obj-$(CONFIG_SND_SOC_SOF_XTENSA) += xtensa/
-- 
2.20.1
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
