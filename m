Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 252082B11ED
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Nov 2020 23:42:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A624B1839;
	Thu, 12 Nov 2020 23:41:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A624B1839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605220929;
	bh=tfP/d/vlZ13nY9vjP9L/0hyP9hV9cPCGFyPkC/5H4vk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lqCy1rgHmY+8KmHjsmVGjjrNXsQCYnvibmXTFLDBb7bJvwfNYWE/Bg6dHDr9luIDc
	 ZwkoFlA0IUtwkuIHxt3MR+7se+Y/snHmfAswe4j+dElj12tgB8BiD/fnEgYabHSsWg
	 zaYEZEhRcYSFwm800P3OppoW4nQ8IE+MCMcsIyGM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F1D0F804E4;
	Thu, 12 Nov 2020 23:39:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 619E3F801D5; Thu, 12 Nov 2020 23:39:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6569DF801D5
 for <alsa-devel@alsa-project.org>; Thu, 12 Nov 2020 23:38:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6569DF801D5
IronPort-SDR: bCI/tvnHoRF6KkSV1cUty9FXaAicDq/xfHoP7zJhj9Da92Qm2OEoKtgqua6gaDlmqVp58Tz+eY
 hHTsRlZjiINA==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="166884999"
X-IronPort-AV: E=Sophos;i="5.77,473,1596524400"; d="scan'208";a="166884999"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 14:38:52 -0800
IronPort-SDR: tbgvNDY428jLQne21EOACGkPi9nyJPuxdKnNVAaOQk48kHTC+doU5szzR8abMIQ3j5YnnizFT3
 OAJRlm+qJ8+A==
X-IronPort-AV: E=Sophos;i="5.77,473,1596524400"; d="scan'208";a="323797459"
Received: from gjshield-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.213.180.118])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 14:38:51 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/14] ALSA: hda: intel-dsp-config: add helper for ACPI DSP
 driver selection
Date: Thu, 12 Nov 2020 16:38:14 -0600
Message-Id: <20201112223825.39765-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112223825.39765-1-pierre-louis.bossart@linux.intel.com>
References: <20201112223825.39765-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 tiwai@suse.de, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, broonie@kernel.org,
 Rander Wang <rander.wang@linux.intel.com>
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

Mirror capabilities provided for PCI devices, so that distributions
can select which ACPI driver is loaded at run-time with kernel
parameters and DMI tables instead of forcing a build-time selection.

The "legacy" option supported for HDaudio has no meaning here and will
be ignored.

The 'SST' driver based on closed-source firmware has the priority to
avoid any impact on users, and the choice to use SOF is strictly
opt-in. This may change at some point when the 'SST' driver is
deprecated on Baytrail/Cherrytrail.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 include/sound/intel-dsp-config.h |  7 +++
 sound/hda/intel-dsp-config.c     | 77 ++++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/include/sound/intel-dsp-config.h b/include/sound/intel-dsp-config.h
index c36622bee3f8..d4609077c258 100644
--- a/include/sound/intel-dsp-config.h
+++ b/include/sound/intel-dsp-config.h
@@ -21,6 +21,7 @@ enum {
 #if IS_ENABLED(CONFIG_SND_INTEL_DSP_CONFIG)
 
 int snd_intel_dsp_driver_probe(struct pci_dev *pci);
+int snd_intel_acpi_dsp_driver_probe(struct device *dev, const u8 acpi_hid[ACPI_ID_LEN]);
 
 #else
 
@@ -29,6 +30,12 @@ static inline int snd_intel_dsp_driver_probe(struct pci_dev *pci)
 	return SND_INTEL_DSP_DRIVER_ANY;
 }
 
+static inline
+int snd_intel_acpi_dsp_driver_probe(struct device *dev, const u8 acpi_hid[ACPI_ID_LEN])
+{
+	return SND_INTEL_DSP_DRIVER_ANY;
+}
+
 #endif
 
 #endif
diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index 1c5114dedda9..7e6b8571c138 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -29,6 +29,7 @@ MODULE_PARM_DESC(dsp_driver, "Force the DSP driver for Intel DSP (0=auto, 1=lega
 struct config_entry {
 	u32 flags;
 	u16 device;
+	u8 acpi_hid[ACPI_ID_LEN];
 	const struct dmi_system_id *dmi_table;
 };
 
@@ -433,6 +434,82 @@ int snd_intel_dsp_driver_probe(struct pci_dev *pci)
 }
 EXPORT_SYMBOL_GPL(snd_intel_dsp_driver_probe);
 
+/*
+ * configuration table
+ * - the order of similar ACPI ID entries is important!
+ * - the first successful match will win
+ */
+static const struct config_entry acpi_config_table[] = {
+/* BayTrail */
+#if IS_ENABLED(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_ACPI)
+	{
+		.flags = FLAG_SST,
+		.acpi_hid = "80860F28",
+	},
+#endif
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
+	{
+		.flags = FLAG_SOF,
+		.acpi_hid = "80860F28",
+	},
+#endif
+/* CherryTrail */
+#if IS_ENABLED(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_ACPI)
+	{
+		.flags = FLAG_SST,
+		.acpi_hid = "808622A8",
+	},
+#endif
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
+	{
+		.flags = FLAG_SOF,
+		.acpi_hid = "808622A8",
+	},
+#endif
+};
+
+static const struct config_entry *snd_intel_acpi_dsp_find_config(const u8 acpi_hid[ACPI_ID_LEN],
+								 const struct config_entry *table,
+								 u32 len)
+{
+	for (; len > 0; len--, table++) {
+		if (memcmp(table->acpi_hid, acpi_hid, ACPI_ID_LEN))
+			continue;
+		if (table->dmi_table && !dmi_check_system(table->dmi_table))
+			continue;
+		return table;
+	}
+	return NULL;
+}
+
+int snd_intel_acpi_dsp_driver_probe(struct device *dev, const u8 acpi_hid[ACPI_ID_LEN])
+{
+	const struct config_entry *cfg;
+
+	if (dsp_driver > SND_INTEL_DSP_DRIVER_LEGACY && dsp_driver <= SND_INTEL_DSP_DRIVER_LAST)
+		return dsp_driver;
+
+	if (dsp_driver == SND_INTEL_DSP_DRIVER_LEGACY) {
+		dev_warn(dev, "dsp_driver parameter %d not supported, using automatic detection\n",
+			 SND_INTEL_DSP_DRIVER_LEGACY);
+	}
+
+	/* find the configuration for the specific device */
+	cfg = snd_intel_acpi_dsp_find_config(acpi_hid,  acpi_config_table,
+					     ARRAY_SIZE(acpi_config_table));
+	if (!cfg)
+		return SND_INTEL_DSP_DRIVER_ANY;
+
+	if (cfg->flags & FLAG_SST)
+		return SND_INTEL_DSP_DRIVER_SST;
+
+	if (cfg->flags & FLAG_SOF)
+		return SND_INTEL_DSP_DRIVER_SOF;
+
+	return SND_INTEL_DSP_DRIVER_SST;
+}
+EXPORT_SYMBOL_GPL(snd_intel_acpi_dsp_driver_probe);
+
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Intel DSP config driver");
 MODULE_IMPORT_NS(SOUNDWIRE_INTEL_INIT);
-- 
2.25.1

