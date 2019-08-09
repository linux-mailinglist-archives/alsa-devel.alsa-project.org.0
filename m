Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A059687A40
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 14:35:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E6A91660;
	Fri,  9 Aug 2019 14:34:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E6A91660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565354143;
	bh=bAJBg6Jyv5/VQDnr2hUJBonw8VpAOVIo/s+BGsu9OAY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=LPw/4AWtxbjmym+Ig62A7QF4CJpEXvTX4dyQHTtnFORlSIeAA3grNSSQOYbHyJAOz
	 Uq3t5zJ1pVTci4ARG7uy4+RNgu6UoT8NSPbR8CKY1xA706LN+a7NM3vJxpHtz9uZ1V
	 qDHA7buknaDeAZhsgh8J/NwtIRu6+AlE/xqPJJ4U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23322F80611;
	Fri,  9 Aug 2019 14:32:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02D50F804AB; Fri,  9 Aug 2019 14:32:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B0ADF804AB
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 14:31:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B0ADF804AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="lD8fVUF1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=al+IDLkvrSWI6sWkuIdC0Y1CSo3vy5Hk3ckNI2dZEuE=; b=lD8fVUF1iJ0F
 Ulkq/Etr6KJF9If/B6mgEeNInsSEL16WSfDHmb5B/VoVqmzIA3ye/TtrFqX1UzlNb0taT/oiNir6G
 fu2pRsWmwPuq+MabgZL9t5l6lxleS6scgL7K04VGpeeUG6kwR/tGV+OWkhj7sToA31QC0To2jYDzu
 kk0Ko=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hw43l-00061E-Kj; Fri, 09 Aug 2019 12:31:53 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id E96DE27430B7; Fri,  9 Aug 2019 13:31:52 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
In-Reply-To: <20190809110100.71236-1-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20190809123152.E96DE27430B7@ypsilon.sirena.org.uk>
Date: Fri,  9 Aug 2019 13:31:52 +0100 (BST)
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, yang.jie@linux.intel.com,
 lgirdwood@gmail.com, Hulk Robot <hulkci@huawei.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: Add missing include file
	hdac_hda.h" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: SOF: Intel: Add missing include file hdac_hda.h

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From a62bd63893027bfa32fccbba0e0ac067824c362c Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 9 Aug 2019 19:01:00 +0800
Subject: [PATCH] ASoC: SOF: Intel: Add missing include file hdac_hda.h

Building with SND_SOC_SOF_HDA_AUDIO_CODEC fails:

sound/soc/sof/intel/hda-bus.c: In function sof_hda_bus_init:
sound/soc/sof/intel/hda-bus.c:16:25: error: implicit declaration of function
 snd_soc_hdac_hda_get_ops; did you mean snd_soc_jack_add_gpiods? [-Werror=implicit-function-declaration]
 #define sof_hda_ext_ops snd_soc_hdac_hda_get_ops()

Reported-by: Hulk Robot <hulkci@huawei.com>
Suggested-by: Takashi Iwai <tiwai@suse.de>
Fixes: d4ff1b3917a5 ('ASoC: SOF: Intel: Initialize hdaudio bus properly")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Link: https://lore.kernel.org/r/20190809110100.71236-1-yuehaibing@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-bus.c | 1 +
 sound/soc/sof/intel/hda.c     | 3 ---
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda-bus.c b/sound/soc/sof/intel/hda-bus.c
index 0caec3a070d3..1d2babdda9dd 100644
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
index d04844d6b104..28eb780494aa 100644
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
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
