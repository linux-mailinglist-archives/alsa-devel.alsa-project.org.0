Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BCC31646E
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Feb 2021 11:57:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D031C16CF;
	Wed, 10 Feb 2021 11:57:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D031C16CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612954674;
	bh=aoR8trsMlNO2W2K7wiLk3G67VwrZWwZwcG6LyskwAZk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GBSwqC5PGyn7l1MphSQnbXOgpe5WbD8M0i8TpjOhIByA6tavyWdM0NWH85rqfFpCu
	 HkG6tHqCkRbu6imnFhM9kn7hHLRgxCgSl7fJ/wQxd3gtIWo41gWA8jOm2//Ahw/qis
	 RD8Fynr7YDmu7BYDW9lqSDCsZ4huW0oeqTfCIPHE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11975F8022D;
	Wed, 10 Feb 2021 11:56:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA3E9F8022B; Wed, 10 Feb 2021 11:56:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9ADA3F80165
 for <alsa-devel@alsa-project.org>; Wed, 10 Feb 2021 11:56:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9ADA3F80165
IronPort-SDR: QT9Nd6i40HqRDj1GzmAc3rtnv/Y0fyOQ6mrkNH66X1JQy6DS6z+LR4SmVi+goLCw8+WTtktemu
 9U/biBlX7c0Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="182192371"
X-IronPort-AV: E=Sophos;i="5.81,168,1610438400"; d="scan'208";a="182192371"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 02:56:06 -0800
IronPort-SDR: rBP/79Es6jMoiYF59Oud5QZ/+ubQleakSdvAXika5xXEMBzUG1Aygf6z+O6StUctjirnLRqsM7
 WI37YhHpKGlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,168,1610438400"; d="scan'208";a="379914472"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga008.fm.intel.com with ESMTP; 10 Feb 2021 02:56:04 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: fix runtime pm usage mismatch after probe errors
Date: Wed, 10 Feb 2021 12:52:37 +0200
Message-Id: <20210210105237.2179273-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
 yung-chuan.liao@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com, Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

With current delayed probe implementation, sof_probe_complete is not
called in case of errors. And as this function is responsible for
decrementing runtime pm usage counter, this will result in following
problem:

 - probe driver in conditions where probe will fail (to force
   the condition on Intel SOF systems, set
   "snd_sof_intel_hda_common.codec_mask=0")
 - unload driver (runtime-pm usage_count is leaked)
 - fix the issue by installing missing fw, modifying module parameters,
   etc actions
 - try to load driver again -> success, probe ok
 -> device never enters runtime suspend

Fix the issue by storing result of delayed probe to a state variable and
providing new snd_sof_device_probe_completed() to be queried from SOF
PCI/ACPI/OF drivers.

If probe never completed successfully, runtime PM was not set up and
thus at remove(), we should not increment usage count anymore.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
---
 sound/soc/sof/core.c        | 10 ++++++++++
 sound/soc/sof/sof-pci-dev.c |  3 ++-
 sound/soc/sof/sof-priv.h    |  2 ++
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 8d13eb13fe08..6d8f7d9fd192 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -246,6 +246,8 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 	if (plat_data->sof_probe_complete)
 		plat_data->sof_probe_complete(sdev->dev);
 
+	sdev->probe_completed = true;
+
 	return 0;
 
 fw_trace_err:
@@ -340,6 +342,14 @@ int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
 }
 EXPORT_SYMBOL(snd_sof_device_probe);
 
+bool snd_sof_device_probe_completed(struct device *dev)
+{
+	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
+
+	return sdev->probe_completed;
+}
+EXPORT_SYMBOL(snd_sof_device_probe_completed);
+
 int snd_sof_device_remove(struct device *dev)
 {
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 388772f9c4d2..84990cc8aa7d 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -447,7 +447,8 @@ static void sof_pci_remove(struct pci_dev *pci)
 	snd_sof_device_remove(&pci->dev);
 
 	/* follow recommendation in pci-driver.c to increment usage counter */
-	if (!(sof_pci_debug & SOF_PCI_DISABLE_PM_RUNTIME))
+	if (snd_sof_device_probe_completed(&pci->dev) &&
+	    !(sof_pci_debug & SOF_PCI_DISABLE_PM_RUNTIME))
 		pm_runtime_get_noresume(&pci->dev);
 
 	/* release pci regions and disable device */
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 682c4b6d01ef..ad0d7ba2708c 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -389,6 +389,7 @@ struct snd_sof_dev {
 
 	/* work queue in case the probe is implemented in two steps */
 	struct work_struct probe_work;
+	bool probe_completed;
 
 	/* DSP HW differentiation */
 	struct snd_sof_pdata *pdata;
@@ -464,6 +465,7 @@ struct snd_sof_dev {
 int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data);
 int snd_sof_device_remove(struct device *dev);
 int snd_sof_device_shutdown(struct device *dev);
+bool snd_sof_device_probe_completed(struct device *dev);
 
 int snd_sof_runtime_suspend(struct device *dev);
 int snd_sof_runtime_resume(struct device *dev);

base-commit: d40dac7ae8c0f213ac1da7896c35ddc2c58419ab
-- 
2.29.2

