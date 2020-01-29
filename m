Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE6A14D2D8
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jan 2020 23:11:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DF01167D;
	Wed, 29 Jan 2020 23:10:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DF01167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580335879;
	bh=68gv8Duel21+vDkeQyRcBn3SeXs8eFBf4RAr+lX8rzY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FXwtaGVZRJZb2cb9aWYEoGIN63Wc+AHtvAD5it/QoVKEn66CAaoxBKdjNMgSJTM/D
	 d+a6hUU48+4oImjdMtJbWkWQk/y5h2k1pUQzxd80oNa/evff2ylttHsLXflsN39K8E
	 +1rFYUAgmDqSQX/879QUfzw0kWfH8EH9+gQ3WOM8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7D2AF8028B;
	Wed, 29 Jan 2020 23:08:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26A9AF80278; Wed, 29 Jan 2020 23:08:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 453A1F80123
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 23:07:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 453A1F80123
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jan 2020 14:07:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,379,1574150400"; d="scan'208";a="402122366"
Received: from kjhudson-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.70.93])
 by orsmga005.jf.intel.com with ESMTP; 29 Jan 2020 14:07:47 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 29 Jan 2020 16:07:20 -0600
Message-Id: <20200129220726.31792-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200129220726.31792-1-pierre-louis.bossart@linux.intel.com>
References: <20200129220726.31792-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 3/9] ASoC: SOF: Add system_suspend_target field
	to struct snd_sof_dev
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

Add the system_suspend_target field to struct snd_sof_dev
to track the intended system suspend power target. This will
be used as one of the criteria for determining the
final DSP power state.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c |  4 ++--
 sound/soc/sof/pcm.c           |  2 +-
 sound/soc/sof/pm.c            |  9 ++++++---
 sound/soc/sof/sof-priv.h      | 12 ++++++++++--
 4 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 4a4d318f97ff..fddf2c48904f 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -481,7 +481,7 @@ int hda_dsp_resume(struct snd_sof_dev *sdev)
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	struct pci_dev *pci = to_pci_dev(sdev->dev);
 
-	if (sdev->s0_suspend) {
+	if (sdev->system_suspend_target == SOF_SUSPEND_S0IX) {
 		/* restore L1SEN bit */
 		if (hda->l1_support_changed)
 			snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
@@ -530,7 +530,7 @@ int hda_dsp_suspend(struct snd_sof_dev *sdev)
 	struct pci_dev *pci = to_pci_dev(sdev->dev);
 	int ret;
 
-	if (sdev->s0_suspend) {
+	if (sdev->system_suspend_target == SOF_SUSPEND_S0IX) {
 		/* enable L1SEN to make sure the system can enter S0Ix */
 		hda->l1_support_changed =
 			snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 29435ba2d329..db3df02c7398 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -372,7 +372,7 @@ static int sof_pcm_trigger(struct snd_soc_component *component,
 		stream.hdr.cmd |= SOF_IPC_STREAM_TRIG_START;
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
-		if (sdev->s0_suspend &&
+		if (sdev->system_suspend_target == SOF_SUSPEND_S0IX &&
 		    spcm->stream[substream->stream].d0i3_compatible) {
 			/*
 			 * trap the event, not sending trigger stop to
diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index 5b186bceedb9..c86ac1e84bd7 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -323,10 +323,13 @@ int snd_sof_prepare(struct device *dev)
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 
 #if defined(CONFIG_ACPI)
-	sdev->s0_suspend = acpi_target_system_state() == ACPI_STATE_S0;
+	if (acpi_target_system_state() == ACPI_STATE_S0)
+		sdev->system_suspend_target = SOF_SUSPEND_S0IX;
+	else
+		sdev->system_suspend_target = SOF_SUSPEND_S3;
 #else
 	/* will suspend to S3 by default */
-	sdev->s0_suspend = false;
+	sdev->system_suspend_target = SOF_SUSPEND_S3;
 #endif
 
 	return 0;
@@ -337,6 +340,6 @@ void snd_sof_complete(struct device *dev)
 {
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 
-	sdev->s0_suspend = false;
+	sdev->system_suspend_target = SOF_SUSPEND_NONE;
 }
 EXPORT_SYMBOL(snd_sof_complete);
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index bc2337cf1142..1839cc51957d 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -60,6 +60,13 @@ enum sof_d0_substate {
 	SOF_DSP_D0I3,		/* DSP D0i3(low power) substate*/
 };
 
+/* System suspend target state */
+enum sof_system_suspend_state {
+	SOF_SUSPEND_NONE = 0,
+	SOF_SUSPEND_S0IX,
+	SOF_SUSPEND_S3,
+};
+
 struct snd_sof_dev;
 struct snd_sof_ipc_msg;
 struct snd_sof_ipc;
@@ -325,8 +332,9 @@ struct snd_sof_dev {
 
 	/* power states related */
 	enum sof_d0_substate d0_substate;
-	/* flag to track if the intended power target of suspend is S0ix */
-	bool s0_suspend;
+
+	/* Intended power target of system suspend */
+	enum sof_system_suspend_state system_suspend_target;
 
 	/* DSP firmware boot */
 	wait_queue_head_t boot_wait;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
