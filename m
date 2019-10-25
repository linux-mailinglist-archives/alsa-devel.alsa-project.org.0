Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F6DE56C1
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Oct 2019 00:58:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50BFE1AAB;
	Sat, 26 Oct 2019 00:57:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50BFE1AAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572044289;
	bh=hfevW12xP76m1o6Z3n8SOc5R8f/QUosdhQ7tnkvel4w=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ikgrZ4mvQ2boptnJfuSShJRFj7RVWcIc8Z0c/AAfRW5jTf1QLV2/DQeAPG/5mxh5h
	 jlehoIRhrmm2ne553RCfRllAxqbBSrMbZO6u7hQenvwnmVmiiO01FzF9UXBHBkaPYZ
	 +0Ld9mbvKKUkLsgMWzgIXSfw2AsZf7VMQL6wjZ8U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F5CDF80792;
	Sat, 26 Oct 2019 00:42:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15468F80674; Sat, 26 Oct 2019 00:42:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58BE9F80634
 for <alsa-devel@alsa-project.org>; Sat, 26 Oct 2019 00:41:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58BE9F80634
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Oct 2019 15:41:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,230,1569308400"; d="scan'208";a="210458231"
Received: from archagam-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.139.180])
 by fmsmga001.fm.intel.com with ESMTP; 25 Oct 2019 15:41:52 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 25 Oct 2019 17:41:19 -0500
Message-Id: <20191025224122.7718-24-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191025224122.7718-1-pierre-louis.bossart@linux.intel.com>
References: <20191025224122.7718-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 23/26] ASoC: SOF: Intel: hda-dsp: implement
	suspend/resume for S0ix<->S0 transition
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

Enable system wake up via IPC interrupt from DSP when the system is
suspending to the S0ix state, and disable it in the corresponding
resuming.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index b5070409a5e3..d23573d9e9c4 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -477,6 +477,15 @@ static int hda_resume(struct snd_sof_dev *sdev, bool runtime_resume)
 
 int hda_dsp_resume(struct snd_sof_dev *sdev)
 {
+	struct pci_dev *pci = to_pci_dev(sdev->dev);
+
+	if (sdev->s0_suspend) {
+		/* restore and disable the system wakeup */
+		pci_restore_state(pci);
+		disable_irq_wake(pci->irq);
+		return 0;
+	}
+
 	/* init hda controller. DSP cores will be powered up during fw boot */
 	return hda_resume(sdev, false);
 }
@@ -509,8 +518,16 @@ int hda_dsp_runtime_suspend(struct snd_sof_dev *sdev)
 int hda_dsp_suspend(struct snd_sof_dev *sdev)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
+	struct pci_dev *pci = to_pci_dev(sdev->dev);
 	int ret;
 
+	if (sdev->s0_suspend) {
+		/* enable the system waking up via IPC IRQ */
+		enable_irq_wake(pci->irq);
+		pci_save_state(pci);
+		return 0;
+	}
+
 	/* stop hda controller and power dsp off */
 	ret = hda_suspend(sdev, false);
 	if (ret < 0) {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
