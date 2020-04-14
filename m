Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E271A8173
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 17:09:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89F4B169C;
	Tue, 14 Apr 2020 17:08:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89F4B169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586876944;
	bh=tSXa/2WcNQX7C2cpF+IoA2NvsUHwlhrsskxviDOZ/j8=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=KL7hlxNFzpAj3wC0Z1PXjQxS08iFtpeDoW+tozhUST5Xa3KhXwQJNhd/P69aUAXLz
	 4hTCJ5pID126pBJvUhGh9gPuk5Wp5BD4MKTnFrVYrk/z6WgMAv5w+DqgRHfnqtf6/h
	 vsIo7zpspmW/wklolBzhHNvc7efYQ8YmGuTy7w6U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DEF6F8042A;
	Tue, 14 Apr 2020 16:49:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDD8FF8042A; Tue, 14 Apr 2020 16:49:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11598F80405
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 16:49:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11598F80405
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CY/Bv5nK"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 315AF2076D;
 Tue, 14 Apr 2020 14:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586875744;
 bh=tSXa/2WcNQX7C2cpF+IoA2NvsUHwlhrsskxviDOZ/j8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=CY/Bv5nKkNPCasYEuwovCSCF6gogS7xTsqNyfuoeZRfPMvDgxxQ7yBc100IFhkAVW
 lPKCv3NgzRe2KxcAg+5OCXFZwB48TNdsIqM99oKpl4XL0L0Cj5jLTZ+yglgKiSqrJ5
 VBTG8pIJO+/bLXnrBiWyXrxmNIoPFvG+PeT9f3KI=
Date: Tue, 14 Apr 2020 15:49:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Applied "ASoC: SOF: Intel: hda: reduce verbosity on SoundWire
 detection" to the asoc tree
In-Reply-To: <20200409184416.15591-3-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200409184416.15591-3-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 tiwai@suse.de, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
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

   ASoC: SOF: Intel: hda: reduce verbosity on SoundWire detection

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

From 0d4453e98706d996ba06aa38907eab989822f6ee Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Thu, 9 Apr 2020 13:44:14 -0500
Subject: [PATCH] ASoC: SOF: Intel: hda: reduce verbosity on SoundWire
 detection

No need to report an error when SoundWire is not detected (not present
in hardware or not exposed in ACPI). Move to dev_dbg to state that
SoundWire is skipped.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Link: https://lore.kernel.org/r/20200409184416.15591-3-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 211e91e79eae..6cbe2edc868c 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -135,10 +135,8 @@ static int hda_sdw_acpi_scan(struct snd_sof_dev *sdev)
 	hdev = sdev->pdata->hw_pdata;
 
 	ret = sdw_intel_acpi_scan(handle, &hdev->info);
-	if (ret < 0) {
-		dev_err(sdev->dev, "%s failed\n", __func__);
+	if (ret < 0)
 		return -EINVAL;
-	}
 
 	return 0;
 }
@@ -604,7 +602,7 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 	/* scan SoundWire capabilities exposed by DSDT */
 	ret = hda_sdw_acpi_scan(sdev);
 	if (ret < 0) {
-		dev_dbg(sdev->dev, "skipping SoundWire, ACPI scan error\n");
+		dev_dbg(sdev->dev, "skipping SoundWire, not detected with ACPI scan\n");
 		goto skip_soundwire;
 	}
 
-- 
2.20.1

