Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E2D159412
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 16:57:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9400B1676;
	Tue, 11 Feb 2020 16:57:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9400B1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581436672;
	bh=lZE9uDbHXjZq8SqrEknPnfIE3s6PoRjjpPWrEcXMQ+8=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Ito1pOkGyl3v7SPiCIUKleQRR6XifREbPG82MHtUnSNP2LEWhjkUhQz6UarKuypII
	 PoaTRgqkLF0JqkQNhPTg8QP5Hh+iKvgrguxS4IfomQWbTih7sjpei70dZK3nxMgHXB
	 Zwgfkqa88r1UfO4Z0PKhkAg5eJpLA5KwfbEQ/dpc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43594F8031A;
	Tue, 11 Feb 2020 16:49:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38C36F802FE; Tue, 11 Feb 2020 16:48:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id D6C14F802E3
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 16:48:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6C14F802E3
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD8801063;
 Tue, 11 Feb 2020 07:48:51 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 51DCD3F68E;
 Tue, 11 Feb 2020 07:48:51 -0800 (PST)
Date: Tue, 11 Feb 2020 15:48:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20200129220726.31792-4-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200129220726.31792-4-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Add system_suspend_target field to
	struct snd_sof_dev" to the asoc tree
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

   ASoC: SOF: Add system_suspend_target field to struct snd_sof_dev

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

From 043ae13bbd558971ce91596ce09c03d6ef6a4a0c Mon Sep 17 00:00:00 2001
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Date: Wed, 29 Jan 2020 16:07:20 -0600
Subject: [PATCH] ASoC: SOF: Add system_suspend_target field to struct
 snd_sof_dev

Add the system_suspend_target field to struct snd_sof_dev
to track the intended system suspend power target. This will
be used as one of the criteria for determining the
final DSP power state.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200129220726.31792-4-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
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
