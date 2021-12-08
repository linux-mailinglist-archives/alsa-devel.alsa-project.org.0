Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC36E46D21F
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 12:24:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BDE926EF;
	Wed,  8 Dec 2021 12:23:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BDE926EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638962681;
	bh=WuLdKlIXsqhUz9T/VgB8RD4uteJ9vzzwqimp1h3LeqY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rab3DdBeCv4n6xF2myw4COt0PyBVXNTEOjDO9/w74tziCtqqswm+tkzbSNY69sitU
	 quJPs9Uwyh6HI2tJE4ayugKHJrxkAMMElfANXNJmcpvC0xu7RedQVnZRf4f+4Ij6up
	 NcmPtmeaqjNMKTh61bp5QpzdBh3rRfToJ8/brQjQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D51EF80622;
	Wed,  8 Dec 2021 12:13:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96EC6F80619; Wed,  8 Dec 2021 12:13:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8EFD6F80515
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 12:12:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EFD6F80515
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="236548529"
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="236548529"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 03:12:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="600600596"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Dec 2021 03:12:50 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC 35/37] ASoC: Intel: avs: Power management
Date: Wed,  8 Dec 2021 12:12:59 +0100
Message-Id: <20211208111301.1817725-36-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211208111301.1817725-1-cezary.rojewski@intel.com>
References: <20211208111301.1817725-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 harshapriya.n@intel.com, yung-chuan.liao@linux.intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 broonie@kernel.org, ranjani.sridharan@linux.intel.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 peter.ujfalusi@linux.intel.com, lma@semihalf.com
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

To preserve power during sleep operations, handle suspend (S3),
hibernation (S4) and runtime (RTD3) transitions. As flow for all of
is shared, define common handlers to reduce code size.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/core.c | 124 +++++++++++++++++++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 85f28c4ffd63..6cbbdd2a80b2 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -540,6 +540,129 @@ static void avs_pci_remove(struct pci_dev *pci)
 #endif
 }
 
+static int __maybe_unused avs_suspend_common(struct avs_dev *adev, bool low_power)
+{
+	struct hdac_bus *bus = &adev->base.core;
+	int ret;
+
+	flush_work(&adev->probe_work);
+
+	snd_hdac_ext_bus_link_power_down_all(bus);
+
+	ret = avs_ipc_set_dx(adev, AVS_MAIN_CORE_MASK, false);
+	/*
+	 * pm_runtime is blocked on DSP failure but system-wide suspend is not.
+	 * Do not block entire system from suspending if that's the case.
+	 */
+	if (ret && ret != -EPERM) {
+		dev_err(adev->dev, "set dx failed: %d\n", ret);
+		return AVS_IPC_RET(ret);
+	}
+
+	avs_dsp_op(adev, int_control, false);
+	snd_hdac_ext_bus_ppcap_int_enable(bus, false);
+
+	ret = avs_dsp_core_disable(adev, AVS_MAIN_CORE_MASK);
+	if (ret < 0) {
+		dev_err(adev->dev, "core_mask %ld disable failed: %d\n",
+			AVS_MAIN_CORE_MASK, ret);
+		return ret;
+	}
+
+	snd_hdac_ext_bus_ppcap_enable(bus, false);
+	/* disable LP SRAM retention */
+	avs_hda_power_gating_enable(adev, false);
+	snd_hdac_bus_stop_chip(bus);
+	/* disable CG when putting controller to reset */
+	avs_hdac_clock_gating_enable(bus, false);
+	snd_hdac_bus_enter_link_reset(bus);
+	avs_hdac_clock_gating_enable(bus, true);
+
+	snd_hdac_display_power(bus, HDA_CODEC_IDX_CONTROLLER, false);
+
+	return 0;
+}
+
+static int __maybe_unused avs_resume_common(struct avs_dev *adev, bool low_power, bool purge)
+{
+	struct hdac_bus *bus = &adev->base.core;
+	struct hdac_ext_link *hlink;
+	int ret;
+
+	snd_hdac_display_power(bus, HDA_CODEC_IDX_CONTROLLER, true);
+	avs_hdac_bus_init_chip(bus, true);
+
+	snd_hdac_ext_bus_ppcap_enable(bus, true);
+	snd_hdac_ext_bus_ppcap_int_enable(bus, true);
+
+	ret = avs_dsp_boot_firmware(adev, purge);
+	if (ret < 0) {
+		dev_err(adev->dev, "firmware boot failed: %d\n", ret);
+		return ret;
+	}
+
+	/* turn off the links that were off before suspend */
+	list_for_each_entry(hlink, &bus->hlink_list, list) {
+		if (!hlink->ref_count)
+			snd_hdac_ext_bus_link_power_down(hlink);
+	}
+
+	/* check dma status and clean up CORB/RIRB buffers */
+	if (!bus->cmd_dma_state)
+		snd_hdac_bus_stop_cmd_io(bus);
+
+	return 0;
+}
+
+static int __maybe_unused avs_suspend(struct device *dev)
+{
+	return avs_suspend_common(to_avs_dev(dev), true);
+}
+
+static int __maybe_unused avs_resume(struct device *dev)
+{
+	return avs_resume_common(to_avs_dev(dev), true, true);
+}
+
+static int __maybe_unused avs_runtime_suspend(struct device *dev)
+{
+	return avs_suspend_common(to_avs_dev(dev), true);
+}
+
+static int __maybe_unused avs_runtime_resume(struct device *dev)
+{
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
+}
+
+static const struct dev_pm_ops avs_dev_pm = {
+	.suspend = avs_suspend,
+	.resume = avs_resume,
+	.freeze = avs_freeze,
+	.thaw = avs_thaw,
+	.poweroff = avs_poweroff,
+	.restore = avs_restore,
+	SET_RUNTIME_PM_OPS(avs_runtime_suspend, avs_runtime_resume, NULL)
+};
+
 static const struct pci_device_id avs_ids[] = {
 	{ 0 }
 };
@@ -551,6 +674,7 @@ static struct pci_driver avs_pci_driver = {
 	.probe = avs_pci_probe,
 	.remove = avs_pci_remove,
 	.driver = {
+		.pm = &avs_dev_pm,
 	},
 };
 module_pci_driver(avs_pci_driver);
-- 
2.25.1

