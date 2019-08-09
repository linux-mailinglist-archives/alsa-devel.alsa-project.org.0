Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A1B876CA
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 11:58:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1310C1664;
	Fri,  9 Aug 2019 11:57:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1310C1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565344701;
	bh=FTOyj0t9e/+hEg1Ecvnx1FGQ/G2YeYjhrIyffhvKHo4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZAVSd+EJthCn372Cx0Mz1xulGZWWijbphFCqvnPL+PKjVTfrHnJX9CkAWZTRlk7yR
	 cmw1ZDlUckmKNu3XO555cILhdPHQxRlmv8HETxsVSNvFgwvMT8e7drH5tUFNjHIWPQ
	 u0hhulPexwN1idLV01RspAQVq2Bv+KSDaObwgY0k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F757F804AB;
	Fri,  9 Aug 2019 11:56:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91BE4F803F3; Fri,  9 Aug 2019 11:56:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE6DAF800E4
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 11:56:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE6DAF800E4
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 1A73AD41B465C71E050C;
 Fri,  9 Aug 2019 17:56:27 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Fri, 9 Aug 2019
 17:56:19 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <broonie@kernel.org>,
 <lgirdwood@gmail.com>, <pierre-louis.bossart@linux.intel.com>,
 <yang.jie@linux.intel.com>
Date: Fri, 9 Aug 2019 17:55:50 +0800
Message-ID: <20190809095550.71040-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ASoC: SOF: Intel: Add missing include file
	hdac_hda.h
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

Building with SND_SOC_SOF_HDA_AUDIO_CODEC fails:

sound/soc/sof/intel/hda-bus.c: In function sof_hda_bus_init:
sound/soc/sof/intel/hda-bus.c:16:25: error: implicit declaration of function
 snd_soc_hdac_hda_get_ops; did you mean snd_soc_jack_add_gpiods? [-Werror=implicit-function-declaration]
 #define sof_hda_ext_ops snd_soc_hdac_hda_get_ops()

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: d4ff1b3917a5 ('ASoC: SOF: Intel: Initialize hdaudio bus properly")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/soc/sof/intel/hda-bus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/intel/hda-bus.c b/sound/soc/sof/intel/hda-bus.c
index 0caec3a..e28a9c4 100644
--- a/sound/soc/sof/intel/hda-bus.c
+++ b/sound/soc/sof/intel/hda-bus.c
@@ -13,6 +13,7 @@
 #include "hda.h"
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
+#include "../../../soc/codecs/hdac_hda.h"
 #define sof_hda_ext_ops	snd_soc_hdac_hda_get_ops()
 #else
 #define sof_hda_ext_ops	NULL
-- 
2.7.4


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
