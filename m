Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B28B265645
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jul 2019 14:00:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3407E15E2;
	Thu, 11 Jul 2019 13:59:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3407E15E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562846442;
	bh=lvSjtP+6Mn0iVoKAqYgfVwI3LYh+4rl0G3su9MmmHks=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=B+XmfJX31qvfl5PchLFWFbyGwpuUFvrg8bLZV34poAHYm0cOOQ/ugZsd1BoS5MMAt
	 yoGLfezljMB/4sDF8lxMzssgwE30WBWMQdEM/R9k62MDfZB9bPGoBpi0INIs0t0Jio
	 jk5VkYXWKxyJrLUNPTkbKvFffvTXbaK3rDywGeTI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AB53F80321;
	Thu, 11 Jul 2019 13:58:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0BBDF80321; Thu, 11 Jul 2019 13:58:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F4039F800D8
 for <alsa-devel@alsa-project.org>; Thu, 11 Jul 2019 13:58:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F4039F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Hrriw5ym"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=hrcsSoV9tNm+0jgdVpq6IQc9XDthnx1G7fZIGzT+dyY=; b=Hrriw5ymYv1L
 +pYVBinO8ki6dotzt++/XdfAUzcW+OmuCwWOiHM4a8gYwKLvZ/vJDTNyzUL8CpRx9n+3tj3hgimz3
 oloooqztAis5DVPc36kRyGC2RnVWpw3NTzDYBRouPZaCR9ZCLZQM2W0FNrnn+sWgZdZOhm0gPA6QF
 /ok7Y=;
Received: from [217.140.106.52] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hlXiB-0002K7-UM; Thu, 11 Jul 2019 11:58:07 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 4ABB3D02DA9; Thu, 11 Jul 2019 12:58:07 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Shuming Fan <shumingf@realtek.com>
In-Reply-To: <20190711082214.8142-1-shumingf@realtek.com>
X-Patchwork-Hint: ignore
Message-Id: <20190711115807.4ABB3D02DA9@fitzroy.sirena.org.uk>
Date: Thu, 11 Jul 2019 12:58:07 +0100 (BST)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>,
 derek.fang@realtek.com, sathya.prakash.m.r@intel.com, naveen.m@intel.com,
 mingjane_hsieh@realtek.com, flove@realtek.com
Subject: [alsa-devel] Applied "ASoC: rt1011: fix DC calibration offset not
	applying" to the asoc tree
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

   ASoC: rt1011: fix DC calibration offset not applying

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From 09297c2f7a5428776369ba3b9904718a358e5559 Mon Sep 17 00:00:00 2001
From: Shuming Fan <shumingf@realtek.com>
Date: Thu, 11 Jul 2019 16:22:14 +0800
Subject: [PATCH] ASoC: rt1011: fix DC calibration offset not applying

There are two issues to fix:
- DC offset calibration data will be reset after stopping playback.
- DC offset calibration data should be applied in the initial setting.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
Link: https://lore.kernel.org/r/20190711082214.8142-1-shumingf@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt1011.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index 5605b660f4bf..0a6ff13d76e1 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -39,7 +39,7 @@ static const struct reg_sequence init_list[] = {
 	{ RT1011_POWER_9, 0xa840 },
 
 	{ RT1011_ADC_SET_5, 0x0a20 },
-	{ RT1011_DAC_SET_2, 0xa232 },
+	{ RT1011_DAC_SET_2, 0xa032 },
 	{ RT1011_ADC_SET_1, 0x2925 },
 
 	{ RT1011_SPK_PRO_DC_DET_1, 0xb00c },
@@ -1917,7 +1917,7 @@ static int rt1011_set_bias_level(struct snd_soc_component *component,
 		snd_soc_component_write(component,
 			RT1011_SYSTEM_RESET_2, 0x0000);
 		snd_soc_component_write(component,
-			RT1011_SYSTEM_RESET_3, 0x0000);
+			RT1011_SYSTEM_RESET_3, 0x0001);
 		snd_soc_component_write(component,
 			RT1011_SYSTEM_RESET_1, 0x003f);
 		snd_soc_component_write(component,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
