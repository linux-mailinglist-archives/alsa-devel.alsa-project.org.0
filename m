Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB86C7173A
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 13:37:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C8CD1898;
	Tue, 23 Jul 2019 13:36:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C8CD1898
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563881866;
	bh=aCRrdMYEn/DJZjGFCt11lpEXU+c6whQjfD+ed+T7obo=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=PeVYR+eGmubAZgVWFfbAXqDcwsSwN9Z0sMBQftjsE3yxW1srI1kogWP7Q4AEgJTai
	 boFmNOrm8YxPoigfUMwYe+KB40oqxrKXa6/TGPhP2IKJsopFn2mSXkFOGTFvhrvR4N
	 +RoxVK4BfC+F9gNb+KEq8v86YMKp/ijd1l/1v93I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66B70F805F6;
	Tue, 23 Jul 2019 13:29:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A20DBF80483; Tue, 23 Jul 2019 13:29:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6AC9F8048D
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 13:29:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6AC9F8048D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="kgHQtc1l"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=RSuNwKCjQxZ4+eU/VsYixSYAMSMGIcuttirFdEoWANI=; b=kgHQtc1lfSzM
 3et4zrnBMmeruTIEQDnqBQNbdH3orD8ObsMSD4K7pb2B/WLyAi05TEDg1NCtIgv+8Ur8oi2P+gNUo
 tOef2B5nnWDhw5YoPF5vbdlVQwwou/aDZZ+/Osnt3oiTQ9+1ti+R/YM9XLbax/YNen+ICmkS5qK9g
 kw2j8=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpsyo-0003JT-7Z; Tue, 23 Jul 2019 11:29:14 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 9279A2742BAB; Tue, 23 Jul 2019 12:29:13 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Fred Oh <fred.oh@linux.intel.com>
In-Reply-To: <20190722141402.7194-10-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190723112913.9279A2742BAB@ypsilon.sirena.org.uk>
Date: Tue, 23 Jul 2019 12:29:13 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: remove unused state variable in
	suspend function" to the asoc tree
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

   ASoC: SOF: remove unused state variable in suspend function

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From 1c38c9223da3af619d35f052ad6f4bbaa0f08ac2 Mon Sep 17 00:00:00 2001
From: Fred Oh <fred.oh@linux.intel.com>
Date: Mon, 22 Jul 2019 09:13:50 -0500
Subject: [PATCH] ASoC: SOF: remove unused state variable in suspend function

Remove unused and no plan to use variable from suspend function.

Signed-off-by: Fred Oh <fred.oh@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190722141402.7194-10-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-dsp.c | 10 +++++-----
 sound/soc/sof/intel/hda.h     |  4 ++--
 sound/soc/sof/ops.h           |  9 ++++-----
 sound/soc/sof/pm.c            |  4 ++--
 sound/soc/sof/sof-priv.h      |  5 ++---
 5 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 91de4785b6a3..4315896b3f07 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -282,7 +282,7 @@ void hda_dsp_ipc_int_disable(struct snd_sof_dev *sdev)
 			HDA_DSP_REG_HIPCCTL_BUSY | HDA_DSP_REG_HIPCCTL_DONE, 0);
 }
 
-static int hda_suspend(struct snd_sof_dev *sdev, int state)
+static int hda_suspend(struct snd_sof_dev *sdev, bool runtime_suspend)
 {
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	const struct sof_intel_dsp_desc *chip = hda->desc;
@@ -431,19 +431,19 @@ int hda_dsp_runtime_idle(struct snd_sof_dev *sdev)
 	return 0;
 }
 
-int hda_dsp_runtime_suspend(struct snd_sof_dev *sdev, int state)
+int hda_dsp_runtime_suspend(struct snd_sof_dev *sdev)
 {
 	/* stop hda controller and power dsp off */
-	return hda_suspend(sdev, state);
+	return hda_suspend(sdev, true);
 }
 
-int hda_dsp_suspend(struct snd_sof_dev *sdev, int state)
+int hda_dsp_suspend(struct snd_sof_dev *sdev)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	int ret;
 
 	/* stop hda controller and power dsp off */
-	ret = hda_suspend(sdev, state);
+	ret = hda_suspend(sdev, false);
 	if (ret < 0) {
 		dev_err(bus->dev, "error: suspending dsp\n");
 		return ret;
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index d9c17146200b..84d5fd021ccb 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -453,9 +453,9 @@ int hda_dsp_core_reset_power_down(struct snd_sof_dev *sdev,
 void hda_dsp_ipc_int_enable(struct snd_sof_dev *sdev);
 void hda_dsp_ipc_int_disable(struct snd_sof_dev *sdev);
 
-int hda_dsp_suspend(struct snd_sof_dev *sdev, int state);
+int hda_dsp_suspend(struct snd_sof_dev *sdev);
 int hda_dsp_resume(struct snd_sof_dev *sdev);
-int hda_dsp_runtime_suspend(struct snd_sof_dev *sdev, int state);
+int hda_dsp_runtime_suspend(struct snd_sof_dev *sdev);
 int hda_dsp_runtime_resume(struct snd_sof_dev *sdev);
 int hda_dsp_runtime_idle(struct snd_sof_dev *sdev);
 int hda_dsp_set_hw_params_upon_resume(struct snd_sof_dev *sdev);
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index 8fda42748f39..793c1aea0c53 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -128,10 +128,10 @@ static inline int snd_sof_dsp_resume(struct snd_sof_dev *sdev)
 	return 0;
 }
 
-static inline int snd_sof_dsp_suspend(struct snd_sof_dev *sdev, int state)
+static inline int snd_sof_dsp_suspend(struct snd_sof_dev *sdev)
 {
 	if (sof_ops(sdev)->suspend)
-		return sof_ops(sdev)->suspend(sdev, state);
+		return sof_ops(sdev)->suspend(sdev);
 
 	return 0;
 }
@@ -144,11 +144,10 @@ static inline int snd_sof_dsp_runtime_resume(struct snd_sof_dev *sdev)
 	return 0;
 }
 
-static inline int snd_sof_dsp_runtime_suspend(struct snd_sof_dev *sdev,
-					      int state)
+static inline int snd_sof_dsp_runtime_suspend(struct snd_sof_dev *sdev)
 {
 	if (sof_ops(sdev)->runtime_suspend)
-		return sof_ops(sdev)->runtime_suspend(sdev, state);
+		return sof_ops(sdev)->runtime_suspend(sdev);
 
 	return 0;
 }
diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index 48c6d78d72e2..e23beaeefe00 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -377,9 +377,9 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 
 	/* power down all DSP cores */
 	if (runtime_suspend)
-		ret = snd_sof_dsp_runtime_suspend(sdev, 0);
+		ret = snd_sof_dsp_runtime_suspend(sdev);
 	else
-		ret = snd_sof_dsp_suspend(sdev, 0);
+		ret = snd_sof_dsp_suspend(sdev);
 	if (ret < 0)
 		dev_err(sdev->dev,
 			"error: failed to power down DSP during suspend %d\n",
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index a6ec9115a9fb..b8c9274ccf42 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -171,10 +171,9 @@ struct snd_sof_dsp_ops {
 	int (*post_fw_run)(struct snd_sof_dev *sof_dev); /* optional */
 
 	/* DSP PM */
-	int (*suspend)(struct snd_sof_dev *sof_dev, int state); /* optional */
+	int (*suspend)(struct snd_sof_dev *sof_dev); /* optional */
 	int (*resume)(struct snd_sof_dev *sof_dev); /* optional */
-	int (*runtime_suspend)(struct snd_sof_dev *sof_dev,
-			       int state); /* optional */
+	int (*runtime_suspend)(struct snd_sof_dev *sof_dev); /* optional */
 	int (*runtime_resume)(struct snd_sof_dev *sof_dev); /* optional */
 	int (*runtime_idle)(struct snd_sof_dev *sof_dev); /* optional */
 	int (*set_hw_params_upon_resume)(struct snd_sof_dev *sdev); /* optional */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
