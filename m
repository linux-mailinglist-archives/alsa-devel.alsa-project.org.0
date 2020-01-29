Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C640F14D2DB
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jan 2020 23:12:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A4A71670;
	Wed, 29 Jan 2020 23:11:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A4A71670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580335965;
	bh=zz0TWxsvaW4G76G7TYtw4k9y6kHu6VVCJ433tkBg0sI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t5QSfwYHUkklCl6n6nvh8PptgLMjzmfsoblIY3fN8CukM1HXlo6QJHJ/E+5NlOITl
	 psG5tnAT3ijQHkC8tBGdsqrgqGdy+5HY4RHMl/zCknk8xloHcuj7BXMyfLZvFkr8GE
	 +bUggu8AakbfuksJEEBZUutpWEhA1xoxNKLKbhT4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 317D2F80290;
	Wed, 29 Jan 2020 23:08:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6CE7F8027B; Wed, 29 Jan 2020 23:08:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF1DBF80252
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 23:07:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF1DBF80252
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jan 2020 14:07:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,379,1574150400"; d="scan'208";a="402122373"
Received: from kjhudson-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.70.93])
 by orsmga005.jf.intel.com with ESMTP; 29 Jan 2020 14:07:48 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 29 Jan 2020 16:07:21 -0600
Message-Id: <20200129220726.31792-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200129220726.31792-1-pierre-louis.bossart@linux.intel.com>
References: <20200129220726.31792-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 4/9] ASoC: SOF: pm: Introduce DSP power states
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

Add a new enum sof_dsp_power_states for all the possible
the DSP device states. The SOF driver currently handles
only the D0 and D3 states and support for other states
will be added later as needed.

Also, add a helper to determine the target DSP power state
based on the system suspend target.
The snd_sof_dsp_d0i3_on_suspend() function is renamed to
snd_sof_stream_suspend_ignored() to be more indicative
of what it does and it used to determine the target
DSP state during system suspend.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/pm.c        | 38 +++++++++++++++++++++++++++++++++++++-
 sound/soc/sof/sof-audio.c |  2 +-
 sound/soc/sof/sof-audio.h |  2 +-
 sound/soc/sof/sof-priv.h  | 10 ++++++++++
 4 files changed, 49 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index c86ac1e84bd7..bec25cb6beec 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -12,6 +12,42 @@
 #include "sof-priv.h"
 #include "sof-audio.h"
 
+/*
+ * Helper function to determine the target DSP state during
+ * system suspend. This function only cares about the device
+ * D-states. Platform-specific substates, if any, should be
+ * handled by the platform-specific parts.
+ */
+static u32 snd_sof_dsp_power_target(struct snd_sof_dev *sdev)
+{
+	u32 target_dsp_state;
+
+	switch (sdev->system_suspend_target) {
+	case SOF_SUSPEND_S3:
+		/* DSP should be in D3 if the system is suspending to S3 */
+		target_dsp_state = SOF_DSP_PM_D3;
+		break;
+	case SOF_SUSPEND_S0IX:
+		/*
+		 * Currently, the only criterion for retaining the DSP in D0
+		 * is that there are streams that ignored the suspend trigger.
+		 * Additional criteria such Soundwire clock-stop mode and
+		 * device suspend latency considerations will be added later.
+		 */
+		if (snd_sof_stream_suspend_ignored(sdev))
+			target_dsp_state = SOF_DSP_PM_D0;
+		else
+			target_dsp_state = SOF_DSP_PM_D3;
+		break;
+	default:
+		/* This case would be during runtime suspend */
+		target_dsp_state = SOF_DSP_PM_D3;
+		break;
+	}
+
+	return target_dsp_state;
+}
+
 static int sof_send_pm_ctx_ipc(struct snd_sof_dev *sdev, int cmd)
 {
 	struct sof_ipc_pm_ctx pm_ctx;
@@ -169,7 +205,7 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 		}
 	}
 
-	if (snd_sof_dsp_d0i3_on_suspend(sdev)) {
+	if (snd_sof_dsp_power_target(sdev) == SOF_DSP_PM_D0) {
 		/* suspend to D0i3 */
 		ret = snd_sof_set_d0_substate(sdev, SOF_DSP_D0I3);
 		if (ret < 0) {
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 345e42ee4783..d16571ca129c 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -11,7 +11,7 @@
 #include "sof-audio.h"
 #include "ops.h"
 
-bool snd_sof_dsp_d0i3_on_suspend(struct snd_sof_dev *sdev)
+bool snd_sof_stream_suspend_ignored(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_pcm *spcm;
 
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index a62fb2da6a6e..a2702afbd9a1 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -202,7 +202,7 @@ int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol,
 /* PM */
 int sof_restore_pipelines(struct device *dev);
 int sof_set_hw_params_upon_resume(struct device *dev);
-bool snd_sof_dsp_d0i3_on_suspend(struct snd_sof_dev *sdev);
+bool snd_sof_stream_suspend_ignored(struct snd_sof_dev *sdev);
 
 /* Machine driver enumeration */
 int sof_machine_register(struct snd_sof_dev *sdev, void *pdata);
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 1839cc51957d..a7c6109acd98 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -54,6 +54,16 @@ extern int sof_core_debug;
 	(IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_ENABLE_DEBUGFS_CACHE) || \
 	 IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST))
 
+/* DSP power state */
+enum sof_dsp_power_states {
+	SOF_DSP_PM_D0,
+	SOF_DSP_PM_D1,
+	SOF_DSP_PM_D2,
+	SOF_DSP_PM_D3_HOT,
+	SOF_DSP_PM_D3,
+	SOF_DSP_PM_D3_COLD,
+};
+
 /* DSP D0ix sub-state */
 enum sof_d0_substate {
 	SOF_DSP_D0I0 = 0,	/* DSP default D0 substate */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
