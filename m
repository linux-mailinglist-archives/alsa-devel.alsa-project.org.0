Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFE322AA6D
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jul 2020 10:16:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43F8F1616;
	Thu, 23 Jul 2020 10:15:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43F8F1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595492160;
	bh=IU5JJt6EyKpM6WB+wf50Ls1bDTe2cnlU9tCbNWXai/M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WksHZQsK2/FIRlM/SQBQ/gjwgxc0p3/MadRgooN2e7rwWP3IZaGEHdDqC17O5eY0G
	 R5WC83f9aKNvtONfQaQOKh+eqHrGQTiAVugZxe7tHeQAUyt5ifkugYk/ssn0h7oknu
	 zr7Mlekwc04c/EKFn9N6Nb+1qmZ80DNjNoDXAD/0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 779D0F8024A;
	Thu, 23 Jul 2020 10:14:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61767F80212; Thu, 23 Jul 2020 10:14:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A269AF80090
 for <alsa-devel@alsa-project.org>; Thu, 23 Jul 2020 10:14:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A269AF80090
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="p2tBy+Ag"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f1946be0000>; Thu, 23 Jul 2020 01:13:50 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 23 Jul 2020 01:14:02 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 23 Jul 2020 01:14:02 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 Jul
 2020 08:14:02 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 23 Jul 2020 08:14:02 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f1946c70001>; Thu, 23 Jul 2020 01:14:02 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>, <geert@linux-m68k.org>, <rdunlap@infradead.org>
Subject: [PATCH] ASoC: tegra: Fix build error due to 64-by-32 division
Date: Thu, 23 Jul 2020 13:43:31 +0530
Message-ID: <1595492011-2411-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1595492030; bh=KlXp5Z8io6593lkYe651OoFDsSM02BKTkfmssD6nCRU=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 X-NVConfidentiality:MIME-Version:Content-Type;
 b=p2tBy+Agm5pBGRTnZ4+mwBepgTYGpgVQI/lY4R9q4nAqrtu6Qi0EjLiqz36PTtSJ/
 PUubrApLsVOW99+H8Ob38pgwND9ARSnKD1olmkV+9Gztw8IVyb6a3kFvW+nzof3YVm
 rsiFJNWFp9HryUA3OTSlWE4fu09PHJ2Ri5x1geGgxC2YtXbiBFFnMx7OVYE/xxNhvK
 GBW6MVJ44edD5AzIeIspC/65P4BsJ+gx4is49DIdpgS9SFcglwv5Vka/vAd+oUP1XW
 pByXnEIyJfzRGuqLErt1YWaIMvx0j+agmrDMmpY2b4MHP1pC02+fqNFpebImCL1nSo
 Oxc2Y8CXTQypA==
Cc: alsa-devel@alsa-project.org, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org
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

Build errors are seen on 32-bit platforms because of a plain 64-by-32
division. For example, following build erros were reported.

"ERROR: modpost: "__udivdi3" [sound/soc/tegra/snd-soc-tegra210-dmic.ko]
 undefined!"
"ERROR: modpost: "__divdi3" [sound/soc/tegra/snd-soc-tegra210-dmic.ko]
 undefined!"

This can be fixed by using div_u64() helper from 'math64.h' header.

Fixes: 8c8ff982e9e2 ("ASoC: tegra: Add Tegra210 based DMIC driver")
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/tegra210_dmic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra210_dmic.c b/sound/soc/tegra/tegra210_dmic.c
index ff6fd65..d682414 100644
--- a/sound/soc/tegra/tegra210_dmic.c
+++ b/sound/soc/tegra/tegra210_dmic.c
@@ -6,6 +6,7 @@
 
 #include <linux/clk.h>
 #include <linux/device.h>
+#include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
@@ -129,7 +130,7 @@ static int tegra210_dmic_hw_params(struct snd_pcm_substream *substream,
 	 * Boost Gain Volume control has 100x factor.
 	 */
 	if (dmic->boost_gain)
-		gain_q23 = (gain_q23 * dmic->boost_gain) / 100;
+		gain_q23 = div_u64(gain_q23 * dmic->boost_gain, 100);
 
 	regmap_write(dmic->regmap, TEGRA210_DMIC_LP_FILTER_GAIN,
 		     (unsigned int)gain_q23);
-- 
2.7.4

