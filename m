Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EE8604EFE
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 19:39:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C62F2AF3E;
	Wed, 19 Oct 2022 19:38:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C62F2AF3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666201164;
	bh=EEShb6Hu0O9vusIBV6m+Abp3/jFNP4oYFdwPnL7JGUA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AXLqY8VHNEh2jPF7BhbNqce4qJI5giCeLThmL8d8uY2240d9PXjtX7aJHspLp+ovB
	 lZS+PuU2nnVRP951uvgqqiyYDAv4E5Zu9IwYcSp3p0Ig/2fqNKDT/57khrYdufi+y1
	 g0oLcOomrlyFEDbGHdCWxexrBdm/OF9UXjH8yZHE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 966E7F80552;
	Wed, 19 Oct 2022 19:37:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87B38F80552; Wed, 19 Oct 2022 19:37:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5962F80517
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 19:37:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5962F80517
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="cKotFVdg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666201056; x=1697737056;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EEShb6Hu0O9vusIBV6m+Abp3/jFNP4oYFdwPnL7JGUA=;
 b=cKotFVdgRlH0VU4YcKouWtdpha1r+gticm9ZeAf3BOJo+b93wzgIU1Nf
 HFc2FO31m05lUB+128e+4Ms/ut0mzf6IZ9ODyZJystYsZtaVJeutXChsg
 y8sN+uDwFUyAXB5ngBikjbO9DrWOEqP8gBtHQIsrJLinGoV3VuKYFADT4
 GHhYRDMs7IypXuL+2XewMx1rPBpj7TvS/mHmRfYd15AIDe+drsVzHyBs7
 U1Tpv4YyYlCftGyjxwIm4TRSaeclX3S1oY/XL25SvfOSZVhs77hmxjxaD
 AHjfalZRqUeKpsxeuLB2EvZ6UM6a0BBZimV5RBnZEJ5qLTpGZG7jFu5E4 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="333045694"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="333045694"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 10:37:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="771898566"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="771898566"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 19 Oct 2022 10:37:21 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 6/8] ASoC: Intel: avs: Standby power-state support
Date: Wed, 19 Oct 2022 19:53:15 +0200
Message-Id: <20221019175317.1540919-7-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221019175317.1540919-1-cezary.rojewski@intel.com>
References: <20221019175317.1540919-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.com,
 Piotr Maziarz <piotrx.maziarz@linux.intel.com>,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

From: Piotr Maziarz <piotrx.maziarz@linux.intel.com>

Introduce avs_suspend_standby() and avs_resume_standby() to support S0iX
streaming. The AudioDSP is not shutdown during such scenario and the PCI
device is armed for possible wake operation through an audio event.

Signed-off-by: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/core.c | 75 ++++++++++++++++++++++++++++++++++----
 1 file changed, 68 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index d067ce951afc..841bc9fa0d3b 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -534,12 +534,30 @@ static void avs_pci_remove(struct pci_dev *pci)
 	pm_runtime_get_noresume(&pci->dev);
 }
 
-static int __maybe_unused avs_suspend_common(struct avs_dev *adev)
+static int avs_suspend_standby(struct avs_dev *adev)
+{
+	struct hdac_bus *bus = &adev->base.core;
+	struct pci_dev *pci = adev->base.pci;
+
+	if (bus->cmd_dma_state)
+		snd_hdac_bus_stop_cmd_io(bus);
+
+	snd_hdac_ext_bus_link_power_down_all(bus);
+
+	enable_irq_wake(pci->irq);
+	pci_save_state(pci);
+
+	return 0;
+}
+
+static int __maybe_unused avs_suspend_common(struct avs_dev *adev, bool low_power)
 {
 	struct hdac_bus *bus = &adev->base.core;
 	int ret;
 
 	flush_work(&adev->probe_work);
+	if ((acpi_gbl_FADT.flags & ACPI_FADT_LOW_POWER_S0) && low_power && adev->num_lp_paths)
+		return avs_suspend_standby(adev);
 
 	snd_hdac_ext_bus_link_power_down_all(bus);
 
@@ -577,11 +595,30 @@ static int __maybe_unused avs_suspend_common(struct avs_dev *adev)
 	return 0;
 }
 
-static int __maybe_unused avs_resume_common(struct avs_dev *adev, bool purge)
+static int avs_resume_standby(struct avs_dev *adev)
+{
+	struct hdac_bus *bus = &adev->base.core;
+	struct pci_dev *pci = adev->base.pci;
+
+	pci_restore_state(pci);
+	disable_irq_wake(pci->irq);
+
+	snd_hdac_ext_bus_link_power_up_all(bus);
+
+	if (bus->cmd_dma_state)
+		snd_hdac_bus_init_cmd_io(bus);
+
+	return 0;
+}
+
+static int __maybe_unused avs_resume_common(struct avs_dev *adev, bool low_power, bool purge)
 {
 	struct hdac_bus *bus = &adev->base.core;
 	int ret;
 
+	if ((acpi_gbl_FADT.flags & ACPI_FADT_LOW_POWER_S0) && low_power && adev->num_lp_paths)
+		return avs_resume_standby(adev);
+
 	snd_hdac_display_power(bus, HDA_CODEC_IDX_CONTROLLER, true);
 	avs_hdac_bus_init_chip(bus, true);
 
@@ -599,26 +636,50 @@ static int __maybe_unused avs_resume_common(struct avs_dev *adev, bool purge)
 
 static int __maybe_unused avs_suspend(struct device *dev)
 {
-	return avs_suspend_common(to_avs_dev(dev));
+	return avs_suspend_common(to_avs_dev(dev), true);
 }
 
 static int __maybe_unused avs_resume(struct device *dev)
 {
-	return avs_resume_common(to_avs_dev(dev), true);
+	return avs_resume_common(to_avs_dev(dev), true, true);
 }
 
 static int __maybe_unused avs_runtime_suspend(struct device *dev)
 {
-	return avs_suspend_common(to_avs_dev(dev));
+	return avs_suspend_common(to_avs_dev(dev), true);
 }
 
 static int __maybe_unused avs_runtime_resume(struct device *dev)
 {
-	return avs_resume_common(to_avs_dev(dev), true);
+	return avs_resume_common(to_avs_dev(dev), true, false);
+}
+
+static int __maybe_unused avs_freeze(struct device *dev)
+{
+	return avs_suspend_common(to_avs_dev(dev), false);
+}
+static int __maybe_unused avs_thaw(struct device *dev)
+{
+	return avs_resume_common(to_avs_dev(dev), false, true);
+}
+
+static int __maybe_unused avs_poweroff(struct device *dev)
+{
+	return avs_suspend_common(to_avs_dev(dev), false);
+}
+
+static int __maybe_unused avs_restore(struct device *dev)
+{
+	return avs_resume_common(to_avs_dev(dev), false, true);
 }
 
 static const struct dev_pm_ops avs_dev_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(avs_suspend, avs_resume)
+	.suspend = avs_suspend,
+	.resume = avs_resume,
+	.freeze = avs_freeze,
+	.thaw = avs_thaw,
+	.poweroff = avs_poweroff,
+	.restore = avs_restore,
 	SET_RUNTIME_PM_OPS(avs_runtime_suspend, avs_runtime_resume, NULL)
 };
 
-- 
2.25.1

