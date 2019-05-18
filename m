Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F6D224D9
	for <lists+alsa-devel@lfdr.de>; Sat, 18 May 2019 22:31:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B9601695;
	Sat, 18 May 2019 22:30:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B9601695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558211463;
	bh=qIXt6Sn0YipiEpoAJKVCVBt4hTCwVfKg4jIBncLANFw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mskdq9oTW+EUeLCNmSC/LZ39QQJemhp3DWk625G2dgO2kbbB61LSTuPvUFz7X9rfm
	 wldXhV63+o8eSFfDPtgslTp2mB09jjbKspTLMWvpg9HRKpgMpXzZ/pxmDmWp6ewjaA
	 VLEGLYNUZYMZBDJpDUrcajICD0PFrT5ptpW30p24=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D2DEF896EC;
	Sat, 18 May 2019 22:27:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79237F89723; Sat, 18 May 2019 22:27:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 673F5F806E7
 for <alsa-devel@alsa-project.org>; Sat, 18 May 2019 22:27:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 673F5F806E7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 May 2019 13:27:22 -0700
X-ExtLoop1: 1
Received: from bmaster1-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.134.14])
 by orsmga002.jf.intel.com with ESMTP; 18 May 2019 13:27:22 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Sat, 18 May 2019 15:26:55 -0500
Message-Id: <20190518202704.7772-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190518202704.7772-1-pierre-louis.bossart@linux.intel.com>
References: <20190518202704.7772-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 03/12] ASoC: SOF: core: fix error handling with
	the probe workqueue
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

In some configurations, it's a requirement to split the probe in two,
with a second part handled in a workqueue (e.g. for HDMI support
which depends on the DRM modules).

SOF already handles these configurations but the error flow is
incorrect. When an error occurs in the workqueue, the probe has
technically already completed. If we release the resources on errors,
this generates kernel oops/use-after-free when the resources are
released a second time on module removal.

GitHub issue: https://github.com/thesofproject/linux/issues/945
Fixes: c16211d6226 ("ASoC: SOF: Add Sound Open Firmware driver core")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/core.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 693ad83bffc9..5beda47cdf9f 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -393,6 +393,7 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 
 	return 0;
 
+#if !IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE)
 fw_run_err:
 	snd_sof_fw_unload(sdev);
 fw_load_err:
@@ -401,6 +402,21 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 	snd_sof_free_debug(sdev);
 dbg_err:
 	snd_sof_remove(sdev);
+#else
+
+	/*
+	 * when the probe_continue is handled in a work queue, the
+	 * probe does not fail so we don't release resources here.
+	 * They will be released with an explicit call to
+	 * snd_sof_device_remove() when the PCI/ACPI device is removed
+	 */
+
+fw_run_err:
+fw_load_err:
+ipc_err:
+dbg_err:
+
+#endif
 
 	return ret;
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
