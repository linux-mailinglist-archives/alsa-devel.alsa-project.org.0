Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F95D60F1E2
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 10:09:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11BF532D6;
	Thu, 27 Oct 2022 10:08:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11BF532D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666858168;
	bh=dpLGzQwfKrcRxmPSfAVJZ6u4CmLx7kxAQIL3CRVd5hQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vLDX4GnlITPoOG4yQlOukr/sxnsynbZPo19Ig9seB7lGWB6WyW+a076hdfBDPeybk
	 7ujQIKyyHROMatPxNNZiIpAmBRq6CFJrvXQBLiZdsGx2+i0GsBos9rz6qdGt0InOMF
	 MhbJByqEvlFFspQGcP16uRjgBY3tBGlLhtf4081g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D1B7F80578;
	Thu, 27 Oct 2022 10:07:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDAC8F80571; Thu, 27 Oct 2022 10:07:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33799F80558
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 10:07:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33799F80558
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="A2uXAqqN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666858046; x=1698394046;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dpLGzQwfKrcRxmPSfAVJZ6u4CmLx7kxAQIL3CRVd5hQ=;
 b=A2uXAqqNZ1SCB2WcEMxJG+fEwq2Ug2n4WT26CumzhJm8qDq08NOyMyL1
 j9K5SNZXLPnynQBtOGiRmBk50MlREZvikW8jcDJywDegfYc43atPAij3O
 InDTbayWZ8lo01V2YKf/qlj75P1c2On0mpIm3a8aYsCswxZK2wK5ZHJsi
 hbaOuXkwoIgUv2JWWc5xJUrgDpKhQlYRCYII9ztBdxSQzkVTFg+LowrVs
 pmW+kwwrfG2MfcN03ybGYB2cSXUy0fQ4YAcNVSmJ2Ba82Jc4uS+L4RfHI
 H2jmBl8ZwPp/qVfwVFskiagjb6lvUMYQgfoKq4pKZKJRX/bwOLVi96vcC g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="291462734"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; d="scan'208";a="291462734"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 01:07:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="961534882"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; d="scan'208";a="961534882"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga005.fm.intel.com with ESMTP; 27 Oct 2022 01:07:09 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v3 7/9] ASoC: Intel: avs: Standby power-state support
Date: Thu, 27 Oct 2022 10:23:29 +0200
Message-Id: <20221027082331.1561740-8-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221027082331.1561740-1-cezary.rojewski@intel.com>
References: <20221027082331.1561740-1-cezary.rojewski@intel.com>
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

Introduce avs_suspend_standby() and avs_resume_standby() to support S0IX
streaming. The AudioDSP is not shutdown during such scenario and the PCI
device is armed for possible wake operation through an audio event.

As capability for a stream to be active during low power S0 is based off
of ->ignore_suspend, adjust the field's value according to platform
capabilities if needed.

Signed-off-by: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/avs.h      |  7 ++++
 sound/soc/intel/avs/core.c     | 75 ++++++++++++++++++++++++++++++----
 sound/soc/intel/avs/topology.c | 10 +++++
 3 files changed, 85 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index fb73d207697f..8d05b27608fe 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -24,6 +24,13 @@ struct avs_tplg_library;
 struct avs_soc_component;
 struct avs_ipc_msg;
 
+#ifdef CONFIG_ACPI
+#define AVS_S0IX_SUPPORTED \
+	(acpi_gbl_FADT.flags & ACPI_FADT_LOW_POWER_S0)
+#else
+#define AVS_S0IX_SUPPORTED false
+#endif
+
 /*
  * struct avs_dsp_ops - Platform-specific DSP operations
  *
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 0aaded90a99a..6b68d926c9f4 100644
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
+	if (low_power && adev->num_lp_paths)
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
 
+	if (low_power && adev->num_lp_paths)
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
 
diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index 8a9f9fc48938..e845eaf0a1e7 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -1405,6 +1405,11 @@ static int avs_widget_load(struct snd_soc_component *comp, int index,
 	if (!le32_to_cpu(dw->priv.size))
 		return 0;
 
+	if (w->ignore_suspend && !AVS_S0IX_SUPPORTED) {
+		dev_info_once(comp->dev, "Device does not support S0IX, check BIOS settings\n");
+		w->ignore_suspend = false;
+	}
+
 	tplg = acomp->tplg;
 	mach = dev_get_platdata(comp->card->dev);
 
@@ -1442,6 +1447,11 @@ static int avs_dai_load(struct snd_soc_component *comp, int index,
 static int avs_link_load(struct snd_soc_component *comp, int index, struct snd_soc_dai_link *link,
 			 struct snd_soc_tplg_link_config *cfg)
 {
+	if (link->ignore_suspend && !AVS_S0IX_SUPPORTED) {
+		dev_info_once(comp->dev, "Device does not support S0IX, check BIOS settings\n");
+		link->ignore_suspend = false;
+	}
+
 	if (!link->no_pcm) {
 		/* Stream control handled by IPCs. */
 		link->nonatomic = true;
-- 
2.25.1

