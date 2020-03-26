Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 630DF194731
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Mar 2020 20:11:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08AD61666;
	Thu, 26 Mar 2020 20:10:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08AD61666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585249871;
	bh=ES0RR4Wsg1TrtCBuKqPpXDUW8uVWHtsui0hVjyclpSc=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ZpjbjVnBhMDnxIS4etIprhGH4wWlJxmCv4Ixnzi1xL72GfaCARpsEoqXCazzR9Tak
	 Wtcqo7VHZbN0CcHNod7LMQObvpgFRpy/0f1owuCGZXaSnrXWoz7MOLavljy8+Zc4WR
	 9bLmRk34zbd1oRb4iEXxoZjwjba41mKge488ed/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C02CF802DD;
	Thu, 26 Mar 2020 20:05:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5FD3F802E2; Thu, 26 Mar 2020 20:05:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id CF07DF802DD
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 20:05:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF07DF802DD
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E3D57FA;
 Thu, 26 Mar 2020 12:05:20 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 878FB3F71F;
 Thu, 26 Mar 2020 12:05:19 -0700 (PDT)
Date: Thu, 26 Mar 2020 19:05:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Applied "ASoC: SOF: Intel: hda: Improve DSP state logging" to the
 asoc tree
In-Reply-To: <20200325211233.27394-2-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200325211233.27394-2-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

   ASoC: SOF: Intel: hda: Improve DSP state logging

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

From 66de6beb933d373224f350834fbab68093d24627 Mon Sep 17 00:00:00 2001
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Date: Wed, 25 Mar 2020 16:12:29 -0500
Subject: [PATCH] ASoC: SOF: Intel: hda: Improve DSP state logging

Improve the DSP power state logs with the state names
instead of values.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200325211233.27394-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-dsp.c | 43 +++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 79ce52c32ef1..c396b7ef0328 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -452,6 +452,46 @@ static int hda_dsp_set_D0_state(struct snd_sof_dev *sdev,
 	return ret;
 }
 
+/* helper to log DSP state */
+static void hda_dsp_state_log(struct snd_sof_dev *sdev)
+{
+	switch (sdev->dsp_power_state.state) {
+	case SOF_DSP_PM_D0:
+		switch (sdev->dsp_power_state.substate) {
+		case SOF_HDA_DSP_PM_D0I0:
+			dev_dbg(sdev->dev, "Current DSP power state: D0I0\n");
+			break;
+		case SOF_HDA_DSP_PM_D0I3:
+			dev_dbg(sdev->dev, "Current DSP power state: D0I3\n");
+			break;
+		default:
+			dev_dbg(sdev->dev, "Unknown DSP D0 substate: %d\n",
+				sdev->dsp_power_state.substate);
+			break;
+		}
+		break;
+	case SOF_DSP_PM_D1:
+		dev_dbg(sdev->dev, "Current DSP power state: D1\n");
+		break;
+	case SOF_DSP_PM_D2:
+		dev_dbg(sdev->dev, "Current DSP power state: D2\n");
+		break;
+	case SOF_DSP_PM_D3_HOT:
+		dev_dbg(sdev->dev, "Current DSP power state: D3_HOT\n");
+		break;
+	case SOF_DSP_PM_D3:
+		dev_dbg(sdev->dev, "Current DSP power state: D3\n");
+		break;
+	case SOF_DSP_PM_D3_COLD:
+		dev_dbg(sdev->dev, "Current DSP power state: D3_COLD\n");
+		break;
+	default:
+		dev_dbg(sdev->dev, "Unknown DSP power state: %d\n",
+			sdev->dsp_power_state.state);
+		break;
+	}
+}
+
 /*
  * All DSP power state transitions are initiated by the driver.
  * If the requested state change fails, the error is simply returned.
@@ -511,8 +551,7 @@ int hda_dsp_set_power_state(struct snd_sof_dev *sdev,
 	}
 
 	sdev->dsp_power_state = *target_state;
-	dev_dbg(sdev->dev, "New DSP state %d substate %d\n",
-		target_state->state, target_state->substate);
+	hda_dsp_state_log(sdev);
 	return ret;
 }
 
-- 
2.20.1

