Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D14311A80EC
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 17:04:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FBC416F4;
	Tue, 14 Apr 2020 17:04:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FBC416F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586876698;
	bh=Y9T3JF07Rbt2p7DDoNici8aob1hVC38JPFHnL5AV/CI=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Ieo0BLGENddhHqBbjAjgfPnK0ptW+4bAq9/+jeVlzAqWASWtgarKIvN7VtCVhHREs
	 a0hKCWgsjay5/YAZsxoUnOa8xVvIlK0RXgTlhv1e/UB4ANrQtjjK2dYD4kMEiMkUOM
	 6Z3Xr/nAvIpTeWfCklMHzwOVTIVd7xK9ebPQtKPQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90F4AF803C9;
	Tue, 14 Apr 2020 16:48:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8DC5F80377; Tue, 14 Apr 2020 16:48:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 378C7F8036D
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 16:48:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 378C7F8036D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YG9F8gg2"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1744F2078B;
 Tue, 14 Apr 2020 14:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586875708;
 bh=Y9T3JF07Rbt2p7DDoNici8aob1hVC38JPFHnL5AV/CI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=YG9F8gg24h5sDhOFdzfDIrciXaXCzKVhrd64W0ELoW2d1JK6UpRrKG0542z/yAzEu
 H7vJbuF5LzHAUFL/rGJzHCbCyDfEzNoYhwn6ca/ovFvQ5K7jfyn5NpgAi9TT6Jhv4l
 DgYAaH21dkvxTmQjD5jXxOUHwc0oW9q/1hM6Bde8=
Date: Tue, 14 Apr 2020 15:48:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Yong Zhi <yong.zhi@intel.com>
Subject: Applied "ASoC: Intel: sof_da7219_max98373: Add BE dailink for
 dmic16k" to the asoc tree
In-Reply-To: <20200409185827.16255-2-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200409185827.16255-2-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
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

   ASoC: Intel: sof_da7219_max98373: Add BE dailink for dmic16k

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

From a8bb72f160020db5d7f81824b2dba6c8e29ef67a Mon Sep 17 00:00:00 2001
From: Yong Zhi <yong.zhi@intel.com>
Date: Thu, 9 Apr 2020 13:58:15 -0500
Subject: [PATCH] ASoC: Intel: sof_da7219_max98373: Add BE dailink for dmic16k

Add dmic16k BE dailink for keyword detection support, FE is
added in topology tplg file.

Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Link: https://lore.kernel.org/r/20200409185827.16255-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/sof_da7219_max98373.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/intel/boards/sof_da7219_max98373.c b/sound/soc/intel/boards/sof_da7219_max98373.c
index b707dd3b5625..8b5b74ba349f 100644
--- a/sound/soc/intel/boards/sof_da7219_max98373.c
+++ b/sound/soc/intel/boards/sof_da7219_max98373.c
@@ -265,6 +265,9 @@ SND_SOC_DAILINK_DEF(dmic_pin,
 SND_SOC_DAILINK_DEF(dmic_codec,
 	DAILINK_COMP_ARRAY(COMP_CODEC("dmic-codec", "dmic-hifi")));
 
+SND_SOC_DAILINK_DEF(dmic16k_pin,
+	DAILINK_COMP_ARRAY(COMP_CPU("DMIC16k Pin")));
+
 SND_SOC_DAILINK_DEF(idisp1_pin,
 	DAILINK_COMP_ARRAY(COMP_CPU("iDisp1 Pin")));
 SND_SOC_DAILINK_DEF(idisp1_codec,
@@ -337,6 +340,14 @@ static struct snd_soc_dai_link dais[] = {
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
+	{
+		.name = "dmic16k",
+		.id = 6,
+		.ignore_suspend = 1,
+		.dpcm_capture = 1,
+		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(dmic16k_pin, dmic_codec, platform),
+	}
 };
 
 static struct snd_soc_card card_da7219_m98373 = {
-- 
2.20.1

