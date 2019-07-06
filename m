Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C50256107A
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Jul 2019 13:27:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51FF91668;
	Sat,  6 Jul 2019 13:26:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51FF91668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562412453;
	bh=h3VkLHei32C4nYo3xypaT/iYxGD9fsv5Hx+3lGbURI4=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=WGizm88YtPRIyHSg9LwbVHO8t1VKYhCq7QVza0vlZ7Lgf0LgzfWy2kf8XJDbQBf4V
	 QNOSz6C2ZXPgz4oyGmztCl6PPqP6y026OE9vYBSaACjV2AEIm7nHMAZuxBISgW8WjS
	 jVNTxaU4E+ncSpMnXQAdjetV5amoSOgOdRUVhziA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEB1CF80147;
	Sat,  6 Jul 2019 13:25:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6D58F800E5; Sat,  6 Jul 2019 13:25:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DED82F800E5
 for <alsa-devel@alsa-project.org>; Sat,  6 Jul 2019 13:25:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DED82F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="nUIgvMlW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=iNcbOMT6wfDPHS2qLQ21+m/q+AKWFBapx15GEk8BT9s=; b=nUIgvMlWEf+W
 XBA0yX4cz96qjM04SK4TLO3OCQTJKbnDQuaAtvQhYZXW6eDXOXydEK6nK8vQtsjneNYHm9nzoYnoS
 7v25gQCIBgzddUIIy716rpzGWiPhJXXNibnY9G1XdUSF7tJnMORaWTzP4aYlyxFYdXJsNCTvB4g6O
 HGDzY=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hjioL-0006nz-VH; Sat, 06 Jul 2019 11:24:58 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 5C3262743809; Sat,  6 Jul 2019 12:24:57 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20190702132428.13129-3-kai.vehmanen@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190706112457.5C3262743809@ypsilon.sirena.org.uk>
Date: Sat,  6 Jul 2019 12:24:57 +0100 (BST)
Cc: libin.yang@intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, tiwai@suse.de,
 pierre-louis.bossart@linux.intel.com, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: SOF: add runtime idle callback" to the
	asoc tree
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

   ASoC: SOF: add runtime idle callback

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From 62fde9772dd8400bc407de8822ede56b5f2f67f1 Mon Sep 17 00:00:00 2001
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Date: Tue, 2 Jul 2019 16:24:27 +0300
Subject: [PATCH] ASoC: SOF: add runtime idle callback

Add ability to implement a SOF device level runtime idle callback.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20190702132428.13129-3-kai.vehmanen@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda.h    | 1 +
 sound/soc/sof/ops.h          | 8 ++++++++
 sound/soc/sof/pm.c           | 8 ++++++++
 sound/soc/sof/sof-acpi-dev.c | 2 +-
 sound/soc/sof/sof-pci-dev.c  | 2 +-
 sound/soc/sof/sof-priv.h     | 2 ++
 6 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 73d7cc08afc2..d9c17146200b 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -457,6 +457,7 @@ int hda_dsp_suspend(struct snd_sof_dev *sdev, int state);
 int hda_dsp_resume(struct snd_sof_dev *sdev);
 int hda_dsp_runtime_suspend(struct snd_sof_dev *sdev, int state);
 int hda_dsp_runtime_resume(struct snd_sof_dev *sdev);
+int hda_dsp_runtime_idle(struct snd_sof_dev *sdev);
 int hda_dsp_set_hw_params_upon_resume(struct snd_sof_dev *sdev);
 void hda_dsp_dump_skl(struct snd_sof_dev *sdev, u32 flags);
 void hda_dsp_dump(struct snd_sof_dev *sdev, u32 flags);
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index 45a3d1091163..b9bdf45889da 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -134,6 +134,14 @@ static inline int snd_sof_dsp_runtime_suspend(struct snd_sof_dev *sdev,
 	return 0;
 }
 
+static inline int snd_sof_dsp_runtime_idle(struct snd_sof_dev *sdev)
+{
+	if (sof_ops(sdev)->runtime_idle)
+		return sof_ops(sdev)->runtime_idle(sdev);
+
+	return 0;
+}
+
 static inline int snd_sof_dsp_hw_params_upon_resume(struct snd_sof_dev *sdev)
 {
 	if (sof_ops(sdev)->set_hw_params_upon_resume)
diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index 8eeb3a1029f2..278abfd10490 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -394,6 +394,14 @@ int snd_sof_runtime_suspend(struct device *dev)
 }
 EXPORT_SYMBOL(snd_sof_runtime_suspend);
 
+int snd_sof_runtime_idle(struct device *dev)
+{
+	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
+
+	return snd_sof_dsp_runtime_idle(sdev);
+}
+EXPORT_SYMBOL(snd_sof_runtime_idle);
+
 int snd_sof_runtime_resume(struct device *dev)
 {
 	return sof_resume(dev, true);
diff --git a/sound/soc/sof/sof-acpi-dev.c b/sound/soc/sof/sof-acpi-dev.c
index c8dafb1ac54e..ea7b8b895412 100644
--- a/sound/soc/sof/sof-acpi-dev.c
+++ b/sound/soc/sof/sof-acpi-dev.c
@@ -116,7 +116,7 @@ static const struct sof_dev_desc sof_acpi_cherrytrail_desc = {
 static const struct dev_pm_ops sof_acpi_pm = {
 	SET_SYSTEM_SLEEP_PM_OPS(snd_sof_suspend, snd_sof_resume)
 	SET_RUNTIME_PM_OPS(snd_sof_runtime_suspend, snd_sof_runtime_resume,
-			   NULL)
+			   snd_sof_runtime_idle)
 };
 
 static void sof_acpi_probe_complete(struct device *dev)
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index e2b19782f01a..65d1bac4c6b8 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -206,7 +206,7 @@ static const struct sof_dev_desc kbl_desc = {
 static const struct dev_pm_ops sof_pci_pm = {
 	SET_SYSTEM_SLEEP_PM_OPS(snd_sof_suspend, snd_sof_resume)
 	SET_RUNTIME_PM_OPS(snd_sof_runtime_suspend, snd_sof_runtime_resume,
-			   NULL)
+			   snd_sof_runtime_idle)
 };
 
 static void sof_pci_probe_complete(struct device *dev)
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 58621db4fd31..b8c0b2a22684 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -176,6 +176,7 @@ struct snd_sof_dsp_ops {
 	int (*runtime_suspend)(struct snd_sof_dev *sof_dev,
 			       int state); /* optional */
 	int (*runtime_resume)(struct snd_sof_dev *sof_dev); /* optional */
+	int (*runtime_idle)(struct snd_sof_dev *sof_dev); /* optional */
 	int (*set_hw_params_upon_resume)(struct snd_sof_dev *sdev); /* optional */
 
 	/* DSP clocking */
@@ -446,6 +447,7 @@ int snd_sof_device_remove(struct device *dev);
 
 int snd_sof_runtime_suspend(struct device *dev);
 int snd_sof_runtime_resume(struct device *dev);
+int snd_sof_runtime_idle(struct device *dev);
 int snd_sof_resume(struct device *dev);
 int snd_sof_suspend(struct device *dev);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
