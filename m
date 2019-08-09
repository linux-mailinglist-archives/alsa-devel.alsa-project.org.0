Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 214B187830
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 13:05:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 834D7166B;
	Fri,  9 Aug 2019 13:04:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 834D7166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565348741;
	bh=oEeP8VV/5aDmu4+QP0/mnxXvz9UpLRb1K8HgzozbO4k=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hfudfTt/D/VC4XJdEoYQt9NRXWsNwGzT8DCcs0bzG+XxZMdWGVp8aHffZ0KOo7sXy
	 DEq8GhxjntkcyWqV391BFufVIdWWLtJsJRaCs+f8GP10uhrEu+bOWyMzuPBhpQLHiw
	 I/6CthudcKo0GRSAgUOa71c972v4gA3sj7Y9eva0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC13DF80483;
	Fri,  9 Aug 2019 13:03:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5ADE7F803F3; Fri,  9 Aug 2019 13:03:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D87C3F8036B
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 13:03:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D87C3F8036B
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 40E64786FB91D940B113;
 Fri,  9 Aug 2019 19:03:48 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Fri, 9 Aug 2019
 19:03:38 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <broonie@kernel.org>,
 <lgirdwood@gmail.com>, <pierre-louis.bossart@linux.intel.com>,
 <yang.jie@linux.intel.com>
Date: Fri, 9 Aug 2019 19:01:00 +0800
Message-ID: <20190809110100.71236-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
In-Reply-To: <20190809095550.71040-1-yuehaibing@huawei.com>
References: <20190809095550.71040-1-yuehaibing@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v2] ASoC: SOF: Intel: Add missing include file
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
Suggested-by: Takashi Iwai <tiwai@suse.de>
Fixes: d4ff1b3917a5 ('ASoC: SOF: Intel: Initialize hdaudio bus properly")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
v2: remove unused include from hda.c
---
 sound/soc/sof/intel/hda-bus.c | 1 +
 sound/soc/sof/intel/hda.c     | 3 ---
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda-bus.c b/sound/soc/sof/intel/hda-bus.c
index 0caec3a..1d2babd 100644
--- a/sound/soc/sof/intel/hda-bus.c
+++ b/sound/soc/sof/intel/hda-bus.c
@@ -13,6 +13,7 @@
 #include "hda.h"
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
+#include "../../codecs/hdac_hda.h"
 #define sof_hda_ext_ops	snd_soc_hdac_hda_get_ops()
 #else
 #define sof_hda_ext_ops	NULL
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 368254b..ebf2777 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -23,9 +23,6 @@
 #include <sound/sof/xtensa.h>
 #include "../ops.h"
 #include "hda.h"
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
-#include "../../codecs/hdac_hda.h"
-#endif
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 #include <sound/soc-acpi-intel-match.h>
-- 
2.7.4


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
