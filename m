Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C39E19331E
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Mar 2020 22:55:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB765167F;
	Wed, 25 Mar 2020 22:54:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB765167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585173311;
	bh=oN2E4EwyTFmWc7Ya0k1npb34598bqRNYr+C4yO1GVSY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gDegEKKOoV68Kxds7wcinY5r0OFjm2Gjke4/99ixliIFtSnFJfbJdj1HMWiODMgIh
	 N2cABDglmswqlB1U5la1revLU4HXNOKBm6T9mg9FLAnIY+8LBwqu2jcdEI5bu8VmZp
	 hKVhvGaOIW2f33CVUsgkFDpV4OuUhgbY6nwm93IE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92137F80291;
	Wed, 25 Mar 2020 22:50:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A7CFF802DC; Wed, 25 Mar 2020 22:50:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=PRX_BODY_72,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDF1EF8015A
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 22:50:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDF1EF8015A
IronPort-SDR: mMKIwfGdjxARH+rGHh3mw7GBXZOY2T7D+FZOk18ZGUpt1dxmFCU9iRbaplNGB1KrvEKRQgvENK
 tyVz4/bxWeDw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 14:50:38 -0700
IronPort-SDR: Lqp7ojtEG2zRNAPWFyf5i9S6mpf9k2A3KOc0LPmm7qX7zkPRe1XZEGnh8XBqiXyVZfp+4UGY4O
 BKIih5hSrYlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,305,1580803200"; d="scan'208";a="265666154"
Received: from abeljans.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.233.195])
 by orsmga002.jf.intel.com with ESMTP; 25 Mar 2020 14:50:37 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 02/11] ASoC: SOF: Intel: add SoundWire configuration
 interface
Date: Wed, 25 Mar 2020 16:50:18 -0500
Message-Id: <20200325215027.28716-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200325215027.28716-1-pierre-louis.bossart@linux.intel.com>
References: <20200325215027.28716-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Now that the SoundWire core supports the multi-step initialization,
call the relevant APIs.

The actual hardware enablement can be done in two places, ideally we'd
want to startup the SoundWire IP as soon as possible (while still
taking power rail dependencies into account)

However when suspend/resume is implemented, the DSP device will be
resumed first, and only when the DSP firmware is downloaded/booted
would the SoundWire child devices be resumed, so there are only
marginal benefits in starting the IP earlier for the first probe.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c |  13 ++++
 sound/soc/sof/intel/hda.c        | 120 +++++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.h        |  44 ++++++++++++
 3 files changed, 177 insertions(+)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 0633b76dab49..2ae94ea53122 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -399,6 +399,19 @@ int hda_dsp_pre_fw_run(struct snd_sof_dev *sdev)
 /* post fw run operations */
 int hda_dsp_post_fw_run(struct snd_sof_dev *sdev)
 {
+	int ret;
+
+	if (sdev->first_boot) {
+		ret = hda_sdw_startup(sdev);
+		if (ret < 0) {
+			dev_err(sdev->dev,
+				"error: could not startup SoundWire links\n");
+			return ret;
+		}
+	}
+
+	hda_sdw_int_enable(sdev, true);
+
 	/* re-enable clock gating and power gating */
 	return hda_dsp_ctrl_clock_power_gating(sdev, true);
 }
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index ee1edb53840c..c1fe94800da1 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -18,7 +18,9 @@
 #include <sound/hdaudio_ext.h>
 #include <sound/hda_register.h>
 
+#include <linux/acpi.h>
 #include <linux/module.h>
+#include <linux/soundwire/sdw_intel.h>
 #include <sound/intel-nhlt.h>
 #include <sound/sof.h>
 #include <sound/sof/xtensa.h>
@@ -34,6 +36,98 @@
 
 #define EXCEPT_MAX_HDR_SIZE	0x400
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
+
+void hda_sdw_int_enable(struct snd_sof_dev *sdev, bool enable)
+{
+	sdw_intel_enable_irq(sdev->bar[HDA_DSP_BAR], enable);
+}
+
+static int hda_sdw_acpi_scan(struct snd_sof_dev *sdev)
+{
+	struct sof_intel_hda_dev *hdev;
+	acpi_handle handle;
+	int ret;
+
+	handle = ACPI_HANDLE(sdev->dev);
+
+	/* save ACPI info for the probe step */
+	hdev = sdev->pdata->hw_pdata;
+
+	ret = sdw_intel_acpi_scan(handle, &hdev->info);
+	if (ret < 0) {
+		dev_err(sdev->dev, "%s failed\n", __func__);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int hda_sdw_probe(struct snd_sof_dev *sdev)
+{
+	struct sof_intel_hda_dev *hdev;
+	struct sdw_intel_res res;
+	acpi_handle handle;
+	void *sdw;
+
+	handle = ACPI_HANDLE(sdev->dev);
+
+	hdev = sdev->pdata->hw_pdata;
+
+	memset(&res, 0, sizeof(res));
+
+	res.mmio_base = sdev->bar[HDA_DSP_BAR];
+	res.irq = sdev->ipc_irq;
+	res.handle = hdev->info.handle;
+	res.parent = sdev->dev;
+
+	/*
+	 * ops and arg fields are not populated for now,
+	 * they will be needed when the DAI callbacks are
+	 * provided
+	 */
+
+	/* we could filter links here if needed, e.g for quirks */
+	res.count = hdev->info.count;
+	res.link_mask = hdev->info.link_mask;
+
+	sdw = sdw_intel_probe(&res);
+	if (!sdw) {
+		dev_err(sdev->dev, "error: SoundWire probe failed\n");
+		return -EINVAL;
+	}
+
+	/* save context */
+	hdev->sdw = sdw;
+
+	return 0;
+}
+
+int hda_sdw_startup(struct snd_sof_dev *sdev)
+{
+	struct sof_intel_hda_dev *hdev;
+
+	hdev = sdev->pdata->hw_pdata;
+
+	return sdw_intel_startup(hdev->sdw);
+}
+
+static int hda_sdw_exit(struct snd_sof_dev *sdev)
+{
+	struct sof_intel_hda_dev *hdev;
+
+	hdev = sdev->pdata->hw_pdata;
+
+	hda_sdw_int_enable(sdev, false);
+
+	if (hdev->sdw)
+		sdw_intel_exit(hdev->sdw);
+	hdev->sdw = NULL;
+
+	return 0;
+}
+#endif
+
 /*
  * Debug
  */
@@ -346,9 +440,12 @@ static const char *fixup_tplg_name(struct snd_sof_dev *sdev,
 static int hda_init_caps(struct snd_sof_dev *sdev)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
+	struct snd_sof_pdata *pdata = sdev->pdata;
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 	struct hdac_ext_link *hlink;
 #endif
+	struct sof_intel_hda_dev *hdev = pdata->hw_pdata;
+	u32 link_mask;
 	int ret = 0;
 
 	device_disable_async_suspend(bus->dev);
@@ -365,6 +462,27 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 		return ret;
 	}
 
+	/* scan SoundWire capabilities exposed by DSDT */
+	ret = hda_sdw_acpi_scan(sdev);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: SoundWire ACPI scan error\n");
+		return ret;
+	}
+
+	link_mask = hdev->info.link_mask;
+	if (!link_mask) {
+		/*
+		 * probe/allocated SoundWire resources.
+		 * The hardware configuration takes place in hda_sdw_startup
+		 * after power rails are enabled.
+		 */
+		ret = hda_sdw_probe(sdev);
+		if (ret < 0) {
+			dev_err(sdev->dev, "error: SoundWire probe error\n");
+			return ret;
+		}
+	}
+
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 	if (bus->mlcap)
 		snd_hdac_ext_bus_get_ml_capabilities(bus);
@@ -622,6 +740,8 @@ int hda_dsp_remove(struct snd_sof_dev *sdev)
 	snd_hdac_ext_bus_device_remove(bus);
 #endif
 
+	hda_sdw_exit(sdev);
+
 	if (!IS_ERR_OR_NULL(hda->dmic_dev))
 		platform_device_unregister(hda->dmic_dev);
 
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 2a57fc9f3e58..928a3432e9e6 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -11,6 +11,8 @@
 #ifndef __SOF_INTEL_HDA_H
 #define __SOF_INTEL_HDA_H
 
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_intel.h>
 #include <sound/compress_driver.h>
 #include <sound/hda_codec.h>
 #include <sound/hdaudio_ext.h>
@@ -436,6 +438,12 @@ struct sof_intel_hda_dev {
 
 	/* delayed work to enter D0I3 opportunistically */
 	struct delayed_work d0i3_work;
+
+	/* ACPI information stored between scan and probe steps */
+	struct sdw_intel_acpi_info info;
+
+	/* sdw context allocated by SoundWire driver */
+	struct sdw_intel_ctx *sdw;
 };
 
 static inline struct hdac_bus *sof_to_bus(struct snd_sof_dev *s)
@@ -654,6 +662,42 @@ int hda_dsp_trace_init(struct snd_sof_dev *sdev, u32 *stream_tag);
 int hda_dsp_trace_release(struct snd_sof_dev *sdev);
 int hda_dsp_trace_trigger(struct snd_sof_dev *sdev, int cmd);
 
+/*
+ * SoundWire support
+ */
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
+
+int hda_sdw_startup(struct snd_sof_dev *sdev);
+void hda_sdw_int_enable(struct snd_sof_dev *sdev, bool enable);
+
+#else
+
+static inline int hda_sdw_acpi_scan(struct snd_sof_dev *sdev)
+{
+	return 0;
+}
+
+static inline int hda_sdw_probe(struct snd_sof_dev *sdev)
+{
+	return 0;
+}
+
+static inline int hda_sdw_startup(struct snd_sof_dev *sdev)
+{
+	return 0;
+}
+
+static inline int hda_sdw_exit(struct snd_sof_dev *sdev)
+{
+	return 0;
+}
+
+static inline void hda_sdw_int_enable(struct snd_sof_dev *sdev, bool enable)
+{
+}
+
+#endif
+
 /* common dai driver */
 extern struct snd_soc_dai_driver skl_dai[];
 
-- 
2.20.1

