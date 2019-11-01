Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04478EC753
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Nov 2019 18:14:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86771234C;
	Fri,  1 Nov 2019 18:13:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86771234C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572628439;
	bh=b18DsHOrZhlWkyCh7l9tqtXtqDwu05wz/qBvWy1mxww=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vd0o0reh+/Re3cN3LQ5qPn1U9Zp3aEoSLeRA/XMxUFMLJwhkWIGsc9fFkAD8k5eR1
	 J6IAmlJAs5wxj5ss5Dugx3XnNLHFbLqlziV0XJRe9CHAX3SS0g3yeWZ+2YLIHjAN4m
	 SPsfXEjqIe8yg7hkuwxtOdHqHev7VG/Dh2dOh8vg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFE34F803D6;
	Fri,  1 Nov 2019 18:10:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E7A6F80638; Fri,  1 Nov 2019 18:10:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8914F805FB
 for <alsa-devel@alsa-project.org>; Fri,  1 Nov 2019 18:09:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8914F805FB
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Nov 2019 10:09:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,256,1569308400"; d="scan'208";a="226090213"
Received: from ggarreto-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.92.243])
 by fmsmga004.fm.intel.com with ESMTP; 01 Nov 2019 10:09:23 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri,  1 Nov 2019 12:09:15 -0500
Message-Id: <20191101170916.26517-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191101170916.26517-1-pierre-louis.bossart@linux.intel.com>
References: <20191101170916.26517-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 2/3] ASoC: SOF: Intel: hda: set L1SEN on S0ix
	suspend
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

From: Keyon Jie <yang.jie@linux.intel.com>

Set L1SEN to make sure the system can enter S0ix, and restore it on
resume.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c | 15 +++++++++++++++
 sound/soc/sof/intel/hda.h     |  3 +++
 2 files changed, 18 insertions(+)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index d23573d9e9c4..3a54edd017fe 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -477,9 +477,16 @@ static int hda_resume(struct snd_sof_dev *sdev, bool runtime_resume)
 
 int hda_dsp_resume(struct snd_sof_dev *sdev)
 {
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	struct pci_dev *pci = to_pci_dev(sdev->dev);
 
 	if (sdev->s0_suspend) {
+		/* restore L1SEN bit */
+		if (hda->l1_support_changed)
+			snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
+						HDA_VS_INTEL_EM2,
+						HDA_VS_INTEL_EM2_L1SEN, 0);
+
 		/* restore and disable the system wakeup */
 		pci_restore_state(pci);
 		disable_irq_wake(pci->irq);
@@ -517,11 +524,19 @@ int hda_dsp_runtime_suspend(struct snd_sof_dev *sdev)
 
 int hda_dsp_suspend(struct snd_sof_dev *sdev)
 {
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct pci_dev *pci = to_pci_dev(sdev->dev);
 	int ret;
 
 	if (sdev->s0_suspend) {
+		/* enable L1SEN to make sure the system can enter S0Ix */
+		hda->l1_support_changed =
+			snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
+						HDA_VS_INTEL_EM2,
+						HDA_VS_INTEL_EM2_L1SEN,
+						HDA_VS_INTEL_EM2_L1SEN);
+
 		/* enable the system waking up via IPC IRQ */
 		enable_irq_wake(pci->irq);
 		pci_save_state(pci);
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 5ad73a34b09c..18d7e72bf9b7 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -408,6 +408,9 @@ struct sof_intel_hda_dev {
 
 	int irq;
 
+	/* PM related */
+	bool l1_support_changed;/* during suspend, is L1SEN changed or not */
+
 	/* DMIC device */
 	struct platform_device *dmic_dev;
 };
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
