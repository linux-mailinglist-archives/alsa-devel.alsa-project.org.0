Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1071593F3
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 16:53:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA1D0167C;
	Tue, 11 Feb 2020 16:52:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA1D0167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581436417;
	bh=ug6yNxncWbG/5zpgHLwxqhKHfAmaQxb1fVEWXyHczks=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=i2uSAJN6JgEtqdqMbGpNzJi6YqUFwHAR2Y+ZT0diY0FguUsGOtks45jb0b24HnexZ
	 nguNtUmjZixjtcOjmAd9owSe3srDPWrvMCcTbgCAHjIQ7tQcbcFZOEK3vyVb2Fn2FW
	 itc3ev+9QQBGk6XbCjUfGGeMMsbVG8lPV+IYBqcU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDF1DF802A2;
	Tue, 11 Feb 2020 16:48:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC8E9F802A7; Tue, 11 Feb 2020 16:48:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 9CE18F80292
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 16:48:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CE18F80292
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFC6E31B;
 Tue, 11 Feb 2020 07:48:37 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 357223F68E;
 Tue, 11 Feb 2020 07:48:37 -0800 (PST)
Date: Tue, 11 Feb 2020 15:48:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20200129220726.31792-10-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200129220726.31792-10-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: hda: Allow trace DMA in S0
	when DSP is in D0I3 for debug" to the asoc tree
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

   ASoC: SOF: Intel: hda: Allow trace DMA in S0 when DSP is in D0I3 for debug

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.7

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

From 851fd87324430dfe56cd55dfd05a8114ac82d168 Mon Sep 17 00:00:00 2001
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Date: Wed, 29 Jan 2020 16:07:26 -0600
Subject: [PATCH] ASoC: SOF: Intel: hda: Allow trace DMA in S0 when DSP is in
 D0I3 for debug

Trace DMA is disabled by default when the DSP is in D0I3.
Add a debug option to keep trace DMA enabled when the DSP
is in D0I3 during S0.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200129220726.31792-10-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-dsp.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index ee604be715b9..14228b4931d6 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -15,6 +15,7 @@
  * Hardware interface for generic Intel audio DSP HDA IP
  */
 
+#include <linux/module.h>
 #include <sound/hdaudio_ext.h>
 #include <sound/hda_register.h>
 #include "../sof-audio.h"
@@ -22,6 +23,13 @@
 #include "hda.h"
 #include "hda-ipc.h"
 
+static bool hda_enable_trace_D0I3_S0;
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG)
+module_param_named(enable_trace_D0I3_S0, hda_enable_trace_D0I3_S0, bool, 0444);
+MODULE_PARM_DESC(enable_trace_D0I3_S0,
+		 "SOF HDA enable trace when the DSP is in D0I3 in S0");
+#endif
+
 /*
  * DSP Core control.
  */
@@ -399,8 +407,14 @@ static int hda_dsp_set_D0_state(struct snd_sof_dev *sdev,
 	if (target_state->substate == SOF_HDA_DSP_PM_D0I3) {
 		value = SOF_HDA_VS_D0I3C_I3;
 
-		/* disable DMA trace in D0I3 */
-		flags = HDA_PM_NO_DMA_TRACE;
+		/*
+		 * Trace DMA is disabled by default when the DSP enters D0I3.
+		 * But it can be kept enabled when the DSP enters D0I3 while the
+		 * system is in S0 for debug.
+		 */
+		if (hda_enable_trace_D0I3_S0 &&
+		    sdev->system_suspend_target != SOF_SUSPEND_NONE)
+			flags = HDA_PM_NO_DMA_TRACE;
 	} else {
 		/* prevent power gating in D0I0 */
 		flags = HDA_PM_PPG;
@@ -450,11 +464,26 @@ int hda_dsp_set_power_state(struct snd_sof_dev *sdev,
 {
 	int ret = 0;
 
-	/* Nothing to do if the DSP is already in the requested state */
+	/*
+	 * When the DSP is already in D0I3 and the target state is D0I3,
+	 * it could be the case that the DSP is in D0I3 during S0
+	 * and the system is suspending to S0Ix. Therefore,
+	 * hda_dsp_set_D0_state() must be called to disable trace DMA
+	 * by sending the PM_GATE IPC to the FW.
+	 */
+	if (target_state->substate == SOF_HDA_DSP_PM_D0I3 &&
+	    sdev->system_suspend_target == SOF_SUSPEND_S0IX)
+		goto set_state;
+
+	/*
+	 * For all other cases, return without doing anything if
+	 * the DSP is already in the target state.
+	 */
 	if (target_state->state == sdev->dsp_power_state.state &&
 	    target_state->substate == sdev->dsp_power_state.substate)
 		return 0;
 
+set_state:
 	switch (target_state->state) {
 	case SOF_DSP_PM_D0:
 		ret = hda_dsp_set_D0_state(sdev, target_state);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
