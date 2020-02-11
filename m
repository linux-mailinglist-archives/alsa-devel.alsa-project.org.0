Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9589B159406
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 16:57:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 398C683A;
	Tue, 11 Feb 2020 16:56:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 398C683A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581436627;
	bh=ZwpNwJR1GGMYHnriU5U/lYY7cl2KdNJ/yNY9SUtQfnk=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=VKKjyHRIt+pdk27YSDpk2lLX1QZUw9WywffxduLs6SHGvuCekBr41GUn4d1mmXaC4
	 Lb79gB9j8NGMYhTP615AU04dBQkGugPD6GS8cPzxZ1ToW3/GiSViTDgyhC2QLhyPyA
	 /Rj+W2dQ2ySOevLPNYGSauPi3vkc0m6hJgYvcBpU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11072F802FE;
	Tue, 11 Feb 2020 16:48:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58833F802EA; Tue, 11 Feb 2020 16:48:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 66950F802C2
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 16:48:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66950F802C2
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D74331B;
 Tue, 11 Feb 2020 07:48:47 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FE933F68E;
 Tue, 11 Feb 2020 07:48:46 -0800 (PST)
Date: Tue, 11 Feb 2020 15:48:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20200129220726.31792-6-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200129220726.31792-6-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Move DSP power state transitions
	to platform-specific ops" to the asoc tree
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

   ASoC: SOF: Move DSP power state transitions to platform-specific ops

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

From 61e285caf40fef18e8bd7cea5237ee6723609a1c Mon Sep 17 00:00:00 2001
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Date: Wed, 29 Jan 2020 16:07:22 -0600
Subject: [PATCH] ASoC: SOF: Move DSP power state transitions to
 platform-specific ops

The DSP device substates such as D0I0/D0I3
are platform-specific. Therefore, the d0_substate
field of struct snd_sof_dev is replaced
with the dsp_power_state field which represents the current
state of the DSP. This field holds both the device state
and the platform-specific substate values.

With the DSP device substates being platform-specific,
the DSP power state transitions need to be performed in
the platform-specific suspend/resume ops as well.

In order to achieve this, the ops signature has to be
modified to pass the target device state as an
argument. The target substate will be determined by
the platform-specific ops before performing the transition.
For example, in the case of the system suspending to S0IX,
the top-level SOF device suspend callback needs to
only determine if the DSP will be entering
D3 or remain in D0. The target substate in case the device
needs to remain in D0 (D0I0 or D0I3) will be determined
by the platform-specific suspend op.

With the addition of the extended set of power states for the DSP,
the set_power_state op for HDA platforms has to be extended
to handle only the appropriate state transitions. So, the
implementation for the Intel HDA platforms is also modified.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200129220726.31792-6-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/core.c          |   4 +-
 sound/soc/sof/intel/hda-dsp.c | 223 +++++++++++++++++++++++++++++++---
 sound/soc/sof/intel/hda.h     |  10 +-
 sound/soc/sof/ops.h           |  16 +--
 sound/soc/sof/pm.c            |  92 ++------------
 sound/soc/sof/sof-priv.h      |  18 ++-
 6 files changed, 242 insertions(+), 121 deletions(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 34cefbaf2d2a..1d07450aff77 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -286,8 +286,8 @@ int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
 	/* initialize sof device */
 	sdev->dev = dev;
 
-	/* initialize default D0 sub-state */
-	sdev->d0_substate = SOF_DSP_D0I0;
+	/* initialize default DSP power state */
+	sdev->dsp_power_state.state = SOF_DSP_PM_D0;
 
 	sdev->pdata = plat_data;
 	sdev->first_boot = true;
diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index fddf2c48904f..8c00e128a7b0 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -338,13 +338,10 @@ static int hda_dsp_send_pm_gate_ipc(struct snd_sof_dev *sdev, u32 flags)
 				  sizeof(pm_gate), &reply, sizeof(reply));
 }
 
-int hda_dsp_set_power_state(struct snd_sof_dev *sdev,
-			    enum sof_d0_substate d0_substate)
+static int hda_dsp_update_d0i3c_register(struct snd_sof_dev *sdev, u8 value)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
-	u32 flags;
 	int ret;
-	u8 value;
 
 	/* Write to D0I3C after Command-In-Progress bit is cleared */
 	ret = hda_dsp_wait_d0i3c_done(sdev);
@@ -354,7 +351,6 @@ int hda_dsp_set_power_state(struct snd_sof_dev *sdev,
 	}
 
 	/* Update D0I3C register */
-	value = d0_substate == SOF_DSP_D0I3 ? SOF_HDA_VS_D0I3C_I3 : 0;
 	snd_hdac_chip_updateb(bus, VS_D0I3C, SOF_HDA_VS_D0I3C_I3, value);
 
 	/* Wait for cmd in progress to be cleared before exiting the function */
@@ -367,20 +363,160 @@ int hda_dsp_set_power_state(struct snd_sof_dev *sdev,
 	dev_vdbg(bus->dev, "D0I3C updated, register = 0x%x\n",
 		 snd_hdac_chip_readb(bus, VS_D0I3C));
 
-	if (d0_substate == SOF_DSP_D0I0)
-		flags = HDA_PM_PPG;/* prevent power gating in D0 */
-	else
-		flags = HDA_PM_NO_DMA_TRACE;/* disable DMA trace in D0I3*/
+	return 0;
+}
 
-	/* sending pm_gate IPC */
-	ret = hda_dsp_send_pm_gate_ipc(sdev, flags);
+static int hda_dsp_set_D0_state(struct snd_sof_dev *sdev,
+				const struct sof_dsp_power_state *target_state)
+{
+	u32 flags = 0;
+	int ret;
+	u8 value = 0;
+
+	/*
+	 * Sanity check for illegal state transitions
+	 * The only allowed transitions are:
+	 * 1. D3 -> D0I0
+	 * 2. D0I0 -> D0I3
+	 * 3. D0I3 -> D0I0
+	 */
+	switch (sdev->dsp_power_state.state) {
+	case SOF_DSP_PM_D0:
+		/* Follow the sequence below for D0 substate transitions */
+		break;
+	case SOF_DSP_PM_D3:
+		/* Follow regular flow for D3 -> D0 transition */
+		return 0;
+	default:
+		dev_err(sdev->dev, "error: transition from %d to %d not allowed\n",
+			sdev->dsp_power_state.state, target_state->state);
+		return -EINVAL;
+	}
+
+	/* Set flags and register value for D0 target substate */
+	if (target_state->substate == SOF_HDA_DSP_PM_D0I3) {
+		value = SOF_HDA_VS_D0I3C_I3;
+
+		/* disable DMA trace in D0I3 */
+		flags = HDA_PM_NO_DMA_TRACE;
+	} else {
+		/* prevent power gating in D0I0 */
+		flags = HDA_PM_PPG;
+	}
+
+	/* update D0I3C register */
+	ret = hda_dsp_update_d0i3c_register(sdev, value);
 	if (ret < 0)
+		return ret;
+
+	/*
+	 * Notify the DSP of the state change.
+	 * If this IPC fails, revert the D0I3C register update in order
+	 * to prevent partial state change.
+	 */
+	ret = hda_dsp_send_pm_gate_ipc(sdev, flags);
+	if (ret < 0) {
 		dev_err(sdev->dev,
 			"error: PM_GATE ipc error %d\n", ret);
+		goto revert;
+	}
+
+	return ret;
+
+revert:
+	/* fallback to the previous register value */
+	value = value ? 0 : SOF_HDA_VS_D0I3C_I3;
+
+	/*
+	 * This can fail but return the IPC error to signal that
+	 * the state change failed.
+	 */
+	hda_dsp_update_d0i3c_register(sdev, value);
 
 	return ret;
 }
 
+/*
+ * All DSP power state transitions are initiated by the driver.
+ * If the requested state change fails, the error is simply returned.
+ * Further state transitions are attempted only when the set_power_save() op
+ * is called again either because of a new IPC sent to the DSP or
+ * during system suspend/resume.
+ */
+int hda_dsp_set_power_state(struct snd_sof_dev *sdev,
+			    const struct sof_dsp_power_state *target_state)
+{
+	int ret = 0;
+
+	/* Nothing to do if the DSP is already in the requested state */
+	if (target_state->state == sdev->dsp_power_state.state &&
+	    target_state->substate == sdev->dsp_power_state.substate)
+		return 0;
+
+	switch (target_state->state) {
+	case SOF_DSP_PM_D0:
+		ret = hda_dsp_set_D0_state(sdev, target_state);
+		break;
+	case SOF_DSP_PM_D3:
+		/* The only allowed transition is: D0I0 -> D3 */
+		if (sdev->dsp_power_state.state == SOF_DSP_PM_D0 &&
+		    sdev->dsp_power_state.substate == SOF_HDA_DSP_PM_D0I0)
+			break;
+
+		dev_err(sdev->dev,
+			"error: transition from %d to %d not allowed\n",
+			sdev->dsp_power_state.state, target_state->state);
+		return -EINVAL;
+	default:
+		dev_err(sdev->dev, "error: target state unsupported %d\n",
+			target_state->state);
+		return -EINVAL;
+	}
+	if (ret < 0) {
+		dev_err(sdev->dev,
+			"failed to set requested target DSP state %d substate %d\n",
+			target_state->state, target_state->substate);
+		return ret;
+	}
+
+	sdev->dsp_power_state = *target_state;
+	dev_dbg(sdev->dev, "New DSP state %d substate %d\n",
+		target_state->state, target_state->substate);
+	return ret;
+}
+
+/*
+ * Audio DSP states may transform as below:-
+ *
+ *                                         D0I3 compatible stream
+ *     Runtime    +---------------------+   opened only, timeout
+ *     suspend    |                     +--------------------+
+ *   +------------+       D0(active)    |                    |
+ *   |            |                     <---------------+    |
+ *   |   +-------->                     |               |    |
+ *   |   |Runtime +--^--+---------^--+--+ The last      |    |
+ *   |   |resume     |  |         |  |    opened D0I3   |    |
+ *   |   |           |  |         |  |    compatible    |    |
+ *   |   |     resume|  |         |  |    stream closed |    |
+ *   |   |      from |  | D3      |  |                  |    |
+ *   |   |       D3  |  |suspend  |  | d0i3             |    |
+ *   |   |           |  |         |  |suspend           |    |
+ *   |   |           |  |         |  |                  |    |
+ *   |   |           |  |         |  |                  |    |
+ * +-v---+-----------+--v-------+ |  |           +------+----v----+
+ * |                            | |  +----------->                |
+ * |       D3 (suspended)       | |              |      D0I3      +-----+
+ * |                            | +--------------+                |     |
+ * |                            |  resume from   |                |     |
+ * +-------------------^--------+  d0i3 suspend  +----------------+     |
+ *                     |                                                |
+ *                     |                       D3 suspend               |
+ *                     +------------------------------------------------+
+ *
+ * d0i3_suspend = s0_suspend && D0I3 stream opened,
+ * D3 suspend = !d0i3_suspend,
+ */
+
 static int hda_suspend(struct snd_sof_dev *sdev, bool runtime_suspend)
 {
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
@@ -480,8 +616,22 @@ int hda_dsp_resume(struct snd_sof_dev *sdev)
 {
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	struct pci_dev *pci = to_pci_dev(sdev->dev);
+	const struct sof_dsp_power_state target_state = {
+		.state = SOF_DSP_PM_D0,
+		.substate = SOF_HDA_DSP_PM_D0I0,
+	};
+	int ret;
+
+	/* resume from D0I3 */
+	if (sdev->dsp_power_state.state == SOF_DSP_PM_D0) {
+		/* Set DSP power state */
+		ret = hda_dsp_set_power_state(sdev, &target_state);
+		if (ret < 0) {
+			dev_err(sdev->dev, "error: setting dsp state %d substate %d\n",
+				target_state.state, target_state.substate);
+			return ret;
+		}
 
-	if (sdev->system_suspend_target == SOF_SUSPEND_S0IX) {
 		/* restore L1SEN bit */
 		if (hda->l1_support_changed)
 			snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
@@ -495,13 +645,27 @@ int hda_dsp_resume(struct snd_sof_dev *sdev)
 	}
 
 	/* init hda controller. DSP cores will be powered up during fw boot */
-	return hda_resume(sdev, false);
+	ret = hda_resume(sdev, false);
+	if (ret < 0)
+		return ret;
+
+	hda_dsp_set_power_state(sdev, &target_state);
+	return ret;
 }
 
 int hda_dsp_runtime_resume(struct snd_sof_dev *sdev)
 {
+	const struct sof_dsp_power_state target_state = {
+		.state = SOF_DSP_PM_D0,
+	};
+	int ret;
+
 	/* init hda controller. DSP cores will be powered up during fw boot */
-	return hda_resume(sdev, true);
+	ret = hda_resume(sdev, true);
+	if (ret < 0)
+		return ret;
+
+	return hda_dsp_set_power_state(sdev, &target_state);
 }
 
 int hda_dsp_runtime_idle(struct snd_sof_dev *sdev)
@@ -519,18 +683,41 @@ int hda_dsp_runtime_idle(struct snd_sof_dev *sdev)
 
 int hda_dsp_runtime_suspend(struct snd_sof_dev *sdev)
 {
+	const struct sof_dsp_power_state target_state = {
+		.state = SOF_DSP_PM_D3,
+	};
+	int ret;
+
 	/* stop hda controller and power dsp off */
-	return hda_suspend(sdev, true);
+	ret = hda_suspend(sdev, true);
+	if (ret < 0)
+		return ret;
+
+	return hda_dsp_set_power_state(sdev, &target_state);
 }
 
-int hda_dsp_suspend(struct snd_sof_dev *sdev)
+int hda_dsp_suspend(struct snd_sof_dev *sdev, u32 target_state)
 {
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct pci_dev *pci = to_pci_dev(sdev->dev);
+	const struct sof_dsp_power_state target_dsp_state = {
+		.state = target_state,
+		.substate = target_state == SOF_DSP_PM_D0 ?
+				SOF_HDA_DSP_PM_D0I3 : 0,
+	};
 	int ret;
 
-	if (sdev->system_suspend_target == SOF_SUSPEND_S0IX) {
+	if (target_state == SOF_DSP_PM_D0) {
+		/* Set DSP power state */
+		ret = hda_dsp_set_power_state(sdev, &target_dsp_state);
+		if (ret < 0) {
+			dev_err(sdev->dev, "error: setting dsp state %d substate %d\n",
+				target_dsp_state.state,
+				target_dsp_state.substate);
+			return ret;
+		}
+
 		/* enable L1SEN to make sure the system can enter S0Ix */
 		hda->l1_support_changed =
 			snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
@@ -551,7 +738,7 @@ int hda_dsp_suspend(struct snd_sof_dev *sdev)
 		return ret;
 	}
 
-	return 0;
+	return hda_dsp_set_power_state(sdev, &target_dsp_state);
 }
 
 int hda_dsp_set_hw_params_upon_resume(struct snd_sof_dev *sdev)
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 6191d9192fae..02c2a7eadb1b 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -392,6 +392,12 @@ struct sof_intel_dsp_bdl {
 #define SOF_HDA_PLAYBACK		0
 #define SOF_HDA_CAPTURE			1
 
+/* HDA DSP D0 substate */
+enum sof_hda_D0_substate {
+	SOF_HDA_DSP_PM_D0I0,	/* default D0 substate */
+	SOF_HDA_DSP_PM_D0I3,	/* low power D0 substate */
+};
+
 /* represents DSP HDA controller frontend - i.e. host facing control */
 struct sof_intel_hda_dev {
 
@@ -469,9 +475,9 @@ void hda_dsp_ipc_int_enable(struct snd_sof_dev *sdev);
 void hda_dsp_ipc_int_disable(struct snd_sof_dev *sdev);
 
 int hda_dsp_set_power_state(struct snd_sof_dev *sdev,
-			    enum sof_d0_substate d0_substate);
+			    const struct sof_dsp_power_state *target_state);
 
-int hda_dsp_suspend(struct snd_sof_dev *sdev);
+int hda_dsp_suspend(struct snd_sof_dev *sdev, u32 target_state);
 int hda_dsp_resume(struct snd_sof_dev *sdev);
 int hda_dsp_runtime_suspend(struct snd_sof_dev *sdev);
 int hda_dsp_runtime_resume(struct snd_sof_dev *sdev);
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index e929a6e0058f..7f532bcc8e9d 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -146,10 +146,11 @@ static inline int snd_sof_dsp_resume(struct snd_sof_dev *sdev)
 	return 0;
 }
 
-static inline int snd_sof_dsp_suspend(struct snd_sof_dev *sdev)
+static inline int snd_sof_dsp_suspend(struct snd_sof_dev *sdev,
+				      u32 target_state)
 {
 	if (sof_ops(sdev)->suspend)
-		return sof_ops(sdev)->suspend(sdev);
+		return sof_ops(sdev)->suspend(sdev, target_state);
 
 	return 0;
 }
@@ -193,14 +194,15 @@ static inline int snd_sof_dsp_set_clk(struct snd_sof_dev *sdev, u32 freq)
 	return 0;
 }
 
-static inline int snd_sof_dsp_set_power_state(struct snd_sof_dev *sdev,
-					      enum sof_d0_substate substate)
+static inline int
+snd_sof_dsp_set_power_state(struct snd_sof_dev *sdev,
+			    const struct sof_dsp_power_state *target_state)
 {
 	if (sof_ops(sdev)->set_power_state)
-		return sof_ops(sdev)->set_power_state(sdev, substate);
+		return sof_ops(sdev)->set_power_state(sdev, target_state);
 
-	/* D0 substate is not supported */
-	return -ENOTSUPP;
+	/* D0 substate is not supported, do nothing here. */
+	return 0;
 }
 
 /* debug */
diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index bec25cb6beec..c410822d9920 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -86,7 +86,7 @@ static void sof_cache_debugfs(struct snd_sof_dev *sdev)
 static int sof_resume(struct device *dev, bool runtime_resume)
 {
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
-	enum sof_d0_substate old_d0_substate = sdev->d0_substate;
+	u32 old_state = sdev->dsp_power_state.state;
 	int ret;
 
 	/* do nothing if dsp resume callbacks are not set */
@@ -97,17 +97,6 @@ static int sof_resume(struct device *dev, bool runtime_resume)
 	if (sdev->first_boot)
 		return 0;
 
-	/* resume from D0I3 */
-	if (!runtime_resume && old_d0_substate == SOF_DSP_D0I3) {
-		ret = snd_sof_set_d0_substate(sdev, SOF_DSP_D0I0);
-		if (ret < 0 && ret != -ENOTSUPP) {
-			dev_err(sdev->dev,
-				"error: failed to resume from D0I3 %d\n",
-				ret);
-			return ret;
-		}
-	}
-
 	/*
 	 * if the runtime_resume flag is set, call the runtime_resume routine
 	 * or else call the system resume routine
@@ -122,8 +111,8 @@ static int sof_resume(struct device *dev, bool runtime_resume)
 		return ret;
 	}
 
-	/* Nothing further to do if resuming from D0I3 */
-	if (!runtime_resume && old_d0_substate == SOF_DSP_D0I3)
+	/* Nothing further to do if resuming from a low-power D0 substate */
+	if (!runtime_resume && old_state == SOF_DSP_PM_D0)
 		return 0;
 
 	sdev->fw_state = SOF_FW_BOOT_PREPARE;
@@ -176,15 +165,13 @@ static int sof_resume(struct device *dev, bool runtime_resume)
 			"error: ctx_restore ipc error during resume %d\n",
 			ret);
 
-	/* initialize default D0 sub-state */
-	sdev->d0_substate = SOF_DSP_D0I0;
-
 	return ret;
 }
 
 static int sof_suspend(struct device *dev, bool runtime_suspend)
 {
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
+	u32 target_state = 0;
 	int ret;
 
 	/* do nothing if dsp suspend callback is not set */
@@ -205,18 +192,11 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 		}
 	}
 
-	if (snd_sof_dsp_power_target(sdev) == SOF_DSP_PM_D0) {
-		/* suspend to D0i3 */
-		ret = snd_sof_set_d0_substate(sdev, SOF_DSP_D0I3);
-		if (ret < 0) {
-			dev_err(sdev->dev, "error: failed to enter D0I3, %d\n",
-				ret);
-			return ret;
-		}
+	target_state = snd_sof_dsp_power_target(sdev);
 
-		/* Skip to platform-specific suspend if DSP is entering D0I3 */
+	/* Skip to platform-specific suspend if DSP is entering D0 */
+	if (target_state == SOF_DSP_PM_D0)
 		goto suspend;
-	}
 
 	/* release trace */
 	snd_sof_release_trace(sdev);
@@ -254,14 +234,14 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 	if (runtime_suspend)
 		ret = snd_sof_dsp_runtime_suspend(sdev);
 	else
-		ret = snd_sof_dsp_suspend(sdev);
+		ret = snd_sof_dsp_suspend(sdev, target_state);
 	if (ret < 0)
 		dev_err(sdev->dev,
 			"error: failed to power down DSP during suspend %d\n",
 			ret);
 
-	/* Do not reset FW state if DSP is in D0I3 */
-	if (sdev->d0_substate == SOF_DSP_D0I3)
+	/* Do not reset FW state if DSP is in D0 */
+	if (target_state == SOF_DSP_PM_D0)
 		return ret;
 
 	/* reset FW state */
@@ -290,58 +270,6 @@ int snd_sof_runtime_resume(struct device *dev)
 }
 EXPORT_SYMBOL(snd_sof_runtime_resume);
 
-int snd_sof_set_d0_substate(struct snd_sof_dev *sdev,
-			    enum sof_d0_substate d0_substate)
-{
-	int ret;
-
-	if (sdev->d0_substate == d0_substate)
-		return 0;
-
-	/* do platform specific set_state */
-	ret = snd_sof_dsp_set_power_state(sdev, d0_substate);
-	if (ret < 0)
-		return ret;
-
-	/* update dsp D0 sub-state */
-	sdev->d0_substate = d0_substate;
-
-	return 0;
-}
-EXPORT_SYMBOL(snd_sof_set_d0_substate);
-
-/*
- * Audio DSP states may transform as below:-
- *
- *                                         D0I3 compatible stream
- *     Runtime    +---------------------+   opened only, timeout
- *     suspend    |                     +--------------------+
- *   +------------+       D0(active)    |                    |
- *   |            |                     <---------------+    |
- *   |   +-------->                     |               |    |
- *   |   |Runtime +--^--+---------^--+--+ The last      |    |
- *   |   |resume     |  |         |  |    opened D0I3   |    |
- *   |   |           |  |         |  |    compatible    |    |
- *   |   |     resume|  |         |  |    stream closed |    |
- *   |   |      from |  | D3      |  |                  |    |
- *   |   |       D3  |  |suspend  |  | d0i3             |    |
- *   |   |           |  |         |  |suspend           |    |
- *   |   |           |  |         |  |                  |    |
- *   |   |           |  |         |  |                  |    |
- * +-v---+-----------+--v-------+ |  |           +------+----v----+
- * |                            | |  +----------->                |
- * |       D3 (suspended)       | |              |      D0I3      +-----+
- * |                            | +--------------+                |     |
- * |                            |  resume from   |                |     |
- * +-------------------^--------+  d0i3 suspend  +----------------+     |
- *                     |                                                |
- *                     |                       D3 suspend               |
- *                     +------------------------------------------------+
- *
- * d0i3_suspend = s0_suspend && D0I3 stream opened,
- * D3 suspend = !d0i3_suspend,
- */
-
 int snd_sof_resume(struct device *dev)
 {
 	return sof_resume(dev, false);
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index a7c6109acd98..ef33aaadbc31 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -64,10 +64,9 @@ enum sof_dsp_power_states {
 	SOF_DSP_PM_D3_COLD,
 };
 
-/* DSP D0ix sub-state */
-enum sof_d0_substate {
-	SOF_DSP_D0I0 = 0,	/* DSP default D0 substate */
-	SOF_DSP_D0I3,		/* DSP D0i3(low power) substate*/
+struct sof_dsp_power_state {
+	u32 state;
+	u32 substate; /* platform-specific */
 };
 
 /* System suspend target state */
@@ -186,14 +185,15 @@ struct snd_sof_dsp_ops {
 	int (*post_fw_run)(struct snd_sof_dev *sof_dev); /* optional */
 
 	/* DSP PM */
-	int (*suspend)(struct snd_sof_dev *sof_dev); /* optional */
+	int (*suspend)(struct snd_sof_dev *sof_dev,
+		       u32 target_state); /* optional */
 	int (*resume)(struct snd_sof_dev *sof_dev); /* optional */
 	int (*runtime_suspend)(struct snd_sof_dev *sof_dev); /* optional */
 	int (*runtime_resume)(struct snd_sof_dev *sof_dev); /* optional */
 	int (*runtime_idle)(struct snd_sof_dev *sof_dev); /* optional */
 	int (*set_hw_params_upon_resume)(struct snd_sof_dev *sdev); /* optional */
 	int (*set_power_state)(struct snd_sof_dev *sdev,
-			       enum sof_d0_substate d0_substate); /* optional */
+			       const struct sof_dsp_power_state *target_state); /* optional */
 
 	/* DSP clocking */
 	int (*set_clk)(struct snd_sof_dev *sof_dev, u32 freq); /* optional */
@@ -340,8 +340,8 @@ struct snd_sof_dev {
 	 */
 	struct snd_soc_component_driver plat_drv;
 
-	/* power states related */
-	enum sof_d0_substate d0_substate;
+	/* current DSP power state */
+	struct sof_dsp_power_state dsp_power_state;
 
 	/* Intended power target of system suspend */
 	enum sof_system_suspend_state system_suspend_target;
@@ -435,8 +435,6 @@ int snd_sof_resume(struct device *dev);
 int snd_sof_suspend(struct device *dev);
 int snd_sof_prepare(struct device *dev);
 void snd_sof_complete(struct device *dev);
-int snd_sof_set_d0_substate(struct snd_sof_dev *sdev,
-			    enum sof_d0_substate d0_substate);
 
 void snd_sof_new_platform_drv(struct snd_sof_dev *sdev);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
