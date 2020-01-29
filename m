Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF9F14D2E0
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jan 2020 23:14:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EC3E168C;
	Wed, 29 Jan 2020 23:14:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EC3E168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580336096;
	bh=5h0bZnBTmQtdlD4SM0s9oQC1I2N988rcNJe++WbnCzM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tWwRy/m+cjM/D+VWOWV6JpBCoscbm7H0h7Fwrc36MI/SQRlfXzAGjP6D+mxczXtS8
	 GkD+vlktHfQ+3Z0O17/UngnhlYKfooF/yP8AljsUn4ai42fJaufMVkME6ncinp9Bzm
	 unA3HH5c73PiS4HNYqYr5oXEJ4xUZcGiOXinEhhE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8500DF802E2;
	Wed, 29 Jan 2020 23:08:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55824F80290; Wed, 29 Jan 2020 23:08:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47B17F80268
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 23:07:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47B17F80268
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jan 2020 14:07:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,379,1574150400"; d="scan'208";a="402122401"
Received: from kjhudson-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.70.93])
 by orsmga005.jf.intel.com with ESMTP; 29 Jan 2020 14:07:52 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 29 Jan 2020 16:07:26 -0600
Message-Id: <20200129220726.31792-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200129220726.31792-1-pierre-louis.bossart@linux.intel.com>
References: <20200129220726.31792-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Keyon Jie <yang.jie@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 9/9] ASoC: SOF: Intel: hda: Allow trace DMA in
	S0 when DSP is in D0I3 for debug
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Trace DMA is disabled by default when the DSP is in D0I3.
Add a debug option to keep trace DMA enabled when the DSP
is in D0I3 during S0.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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
