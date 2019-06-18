Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC1049E23
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 12:20:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6119C16C4;
	Tue, 18 Jun 2019 12:19:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6119C16C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560853234;
	bh=6nCfSEALeafE+PGWrLTk17Sn2IAZSlx8FvytsmrtwE0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t3WBQl5DxKR696p21kYXYfoIXwksC6Y9HvYOofbmggVZIOFXHSCJQ9Ydr09K0Qvg4
	 J0InqSPAYBF1QBDN0hwqU8eVXhzDOfBZdRi2sB7bW/BHllNv4rCu20BULpS6UT6IEu
	 G6nMBxXJaWZ1KntOtmPFL6qlP6heH7vj4KDJNOX8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1270F89732;
	Tue, 18 Jun 2019 12:17:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A3C4F89729; Tue, 18 Jun 2019 12:17:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0C21F89682
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 12:17:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0C21F89682
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jun 2019 03:17:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,388,1557212400"; d="scan'208";a="153420208"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga008.jf.intel.com with ESMTP; 18 Jun 2019 03:17:19 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Date: Tue, 18 Jun 2019 13:18:03 +0300
Message-Id: <20190618101804.21670-3-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190618101804.21670-1-kai.vehmanen@linux.intel.com>
References: <20190618101804.21670-1-kai.vehmanen@linux.intel.com>
Cc: tiwai@suse.de, libin.yang@intel.com, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com
Subject: [alsa-devel] [PATCH v2 2/3] ASoC: SOF: add runtime idle callback
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

Add ability to implement a SOF device level runtime idle callback.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/sof/intel/hda.h    | 1 +
 sound/soc/sof/ops.h          | 8 ++++++++
 sound/soc/sof/pm.c           | 8 ++++++++
 sound/soc/sof/sof-acpi-dev.c | 2 +-
 sound/soc/sof/sof-pci-dev.c  | 2 +-
 sound/soc/sof/sof-priv.h     | 2 ++
 6 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 73d7cc08afc22..d9c17146200b3 100644
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
index 45a3d10911634..b9bdf45889da1 100644
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
index 8eeb3a1029f24..278abfd10490d 100644
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
index c8dafb1ac54e2..ea7b8b8954128 100644
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
index e2b19782f01ac..65d1bac4c6b8b 100644
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
index 58621db4fd31a..b8c0b2a226845 100644
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
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
