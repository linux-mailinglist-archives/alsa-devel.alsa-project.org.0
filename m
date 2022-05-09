Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA3D51F742
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 10:50:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 026C318CF;
	Mon,  9 May 2022 10:50:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 026C318CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652086250;
	bh=UfWoqjovAsvkF1aDl8+a1rc//CdOXx1jcRS3x45mYKU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fJuVOjI3bIwoZumYg8zn2Szx3HKSWxXsllLTHMPIPTCxC7o/FVBzOXaZDIvGjN6D4
	 s2MCuqRMg6NWB8QY42ViDbuC+L9C85HwLh9bXHG0PPKN43n8wPftYjPRdKnK4fVRJc
	 4atto84/bo29Dc+Sn6Acder1dxsFObkizf6qN9v8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CEAAF8052D;
	Mon,  9 May 2022 10:48:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B860FF8051A; Mon,  9 May 2022 10:48:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 208F4F8011C
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 10:48:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 208F4F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="TvUnsnkw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652086125; x=1683622125;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UfWoqjovAsvkF1aDl8+a1rc//CdOXx1jcRS3x45mYKU=;
 b=TvUnsnkwkUMFbWaCbOiMA2ciuY9rY1QcZ4sIxU8KoM7SVLy1VWqdipG6
 /BzoUShUy+FcCsbemYTeBD2el2pDm3uo59Cf5gs9VwEQnGI9I8T0m8R45
 bTZaLv90RdNoQsZmqiriavcpIQVx1rZ229UGWlt5YK/vlAI3zwOilRe5b
 146i4/w3qJ/sQMmLTXGUr67Jg3x6ZjMHbBl0YQRFUpg6Z9mP4z2tq4c1o
 epBcxJunCjum+iD2wFrpjZbgKOY5QL+pGo5Q0e9jR3+8FTOGQkZr9TvyH
 QfjFeQtEcgVG8Ss8eOEm1oWQfNtND9xofZwlRuDQ/9Muy++QkAZTWQk9U Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="294208502"
X-IronPort-AV: E=Sophos;i="5.91,210,1647327600"; d="scan'208";a="294208502"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 01:48:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,210,1647327600"; d="scan'208";a="738068132"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga005.jf.intel.com with ESMTP; 09 May 2022 01:48:36 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 02/15] ASoC: Intel: avs: Generic soc component driver
Date: Mon,  9 May 2022 10:58:08 +0200
Message-Id: <20220509085821.3852259-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509085821.3852259-1-cezary.rojewski@intel.com>
References: <20220509085821.3852259-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 harshapriya.n@intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

Prepare for concrete PCM operations over HDA, DMIC and I2S interfaces by
providing generic soc component implementation. Interface-specific
components re-use this code as majority of flow is shared.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/soc-acpi.h     |   2 +
 sound/soc/intel/avs/Makefile |   2 +-
 sound/soc/intel/avs/pcm.c    | 275 +++++++++++++++++++++++++++++++++++
 3 files changed, 278 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/intel/avs/pcm.c

diff --git a/include/sound/soc-acpi.h b/include/sound/soc-acpi.h
index d33cf8df14b1..b38fd25c5729 100644
--- a/include/sound/soc-acpi.h
+++ b/include/sound/soc-acpi.h
@@ -156,6 +156,7 @@ struct snd_soc_acpi_link_adr {
  * @links: array of link _ADR descriptors, null terminated.
  * @drv_name: machine driver name
  * @fw_filename: firmware file name. Used when SOF is not enabled.
+ * @tplg_filename: topology file name. Used when SOF is not enabled.
  * @board: board name
  * @machine_quirk: pointer to quirk, usually based on DMI information when
  * ACPI ID alone is not sufficient, wrong or misleading
@@ -174,6 +175,7 @@ struct snd_soc_acpi_mach {
 	const struct snd_soc_acpi_link_adr *links;
 	const char *drv_name;
 	const char *fw_filename;
+	const char *tplg_filename;
 	const char *board;
 	struct snd_soc_acpi_mach * (*machine_quirk)(void *arg);
 	const void *quirk_data;
diff --git a/sound/soc/intel/avs/Makefile b/sound/soc/intel/avs/Makefile
index 952f51977656..62b3581d6cdb 100644
--- a/sound/soc/intel/avs/Makefile
+++ b/sound/soc/intel/avs/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 snd-soc-avs-objs := dsp.o ipc.o messages.o utils.o core.o loader.o \
-		    topology.o path.o
+		    topology.o path.o pcm.o
 snd-soc-avs-objs += cldma.o
 
 obj-$(CONFIG_SND_SOC_INTEL_AVS) += snd-soc-avs.o
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
new file mode 100644
index 000000000000..cda2ec6f5da3
--- /dev/null
+++ b/sound/soc/intel/avs/pcm.c
@@ -0,0 +1,275 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+//
+// Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+//          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+//
+
+#include <linux/debugfs.h>
+#include <linux/device.h>
+#include <sound/hda_register.h>
+#include <sound/hdaudio_ext.h>
+#include <sound/soc-acpi.h>
+#include <sound/soc-acpi-intel-match.h>
+#include <sound/soc-component.h>
+#include "avs.h"
+#include "path.h"
+#include "topology.h"
+
+struct avs_dma_data {
+	struct avs_tplg_path_template *template;
+	struct avs_path *path;
+	/*
+	 * link stream is stored within substream's runtime
+	 * private_data to fulfill the needs of codec BE path
+	 *
+	 * host stream assigned
+	 */
+	struct hdac_ext_stream *host_stream;
+};
+
+static ssize_t topology_name_read(struct file *file, char __user *user_buf, size_t count,
+				  loff_t *ppos)
+{
+	struct snd_soc_component *component = file->private_data;
+	struct snd_soc_card *card = component->card;
+	struct snd_soc_acpi_mach *mach = dev_get_platdata(card->dev);
+	char buf[64];
+	size_t len;
+
+	len = snprintf(buf, sizeof(buf), "%s/%s\n", component->driver->topology_name_prefix,
+		       mach->tplg_filename);
+
+	return simple_read_from_buffer(user_buf, count, ppos, buf, len);
+}
+
+static const struct file_operations topology_name_fops = {
+	.open = simple_open,
+	.read = topology_name_read,
+	.llseek = default_llseek,
+};
+
+static int avs_component_load_libraries(struct avs_soc_component *acomp)
+{
+	struct avs_tplg *tplg = acomp->tplg;
+	struct avs_dev *adev = to_avs_dev(acomp->base.dev);
+	int ret;
+
+	if (!tplg->num_libs)
+		return 0;
+
+	/* Parent device may be asleep and library loading involves IPCs. */
+	ret = pm_runtime_resume_and_get(adev->dev);
+	if (ret < 0)
+		return ret;
+
+	avs_hda_clock_gating_enable(adev, false);
+	avs_hda_l1sen_enable(adev, false);
+
+	ret = avs_dsp_load_libraries(adev, tplg->libs, tplg->num_libs);
+
+	avs_hda_l1sen_enable(adev, true);
+	avs_hda_clock_gating_enable(adev, true);
+
+	if (!ret)
+		ret = avs_module_info_init(adev, false);
+
+	pm_runtime_mark_last_busy(adev->dev);
+	pm_runtime_put_autosuspend(adev->dev);
+
+	return ret;
+}
+
+static int avs_component_probe(struct snd_soc_component *component)
+{
+	struct snd_soc_card *card = component->card;
+	struct snd_soc_acpi_mach *mach;
+	struct avs_soc_component *acomp;
+	struct avs_dev *adev;
+	char *filename;
+	int ret;
+
+	dev_dbg(card->dev, "probing %s card %s\n", component->name, card->name);
+	mach = dev_get_platdata(card->dev);
+	acomp = to_avs_soc_component(component);
+	adev = to_avs_dev(component->dev);
+
+	acomp->tplg = avs_tplg_new(component);
+	if (!acomp->tplg)
+		return -ENOMEM;
+
+	if (!mach->tplg_filename)
+		goto finalize;
+
+	/* Load specified topology and create debugfs for it. */
+	filename = kasprintf(GFP_KERNEL, "%s/%s", component->driver->topology_name_prefix,
+			     mach->tplg_filename);
+	if (!filename)
+		return -ENOMEM;
+
+	ret = avs_load_topology(component, filename);
+	kfree(filename);
+	if (ret < 0)
+		return ret;
+
+	ret = avs_component_load_libraries(acomp);
+	if (ret < 0) {
+		dev_err(card->dev, "libraries loading failed: %d\n", ret);
+		goto err_load_libs;
+	}
+
+finalize:
+	debugfs_create_file("topology_name", 0444, component->debugfs_root, component,
+			    &topology_name_fops);
+
+	mutex_lock(&adev->comp_list_mutex);
+	list_add_tail(&acomp->node, &adev->comp_list);
+	mutex_unlock(&adev->comp_list_mutex);
+
+	return 0;
+
+err_load_libs:
+	avs_remove_topology(component);
+	return ret;
+}
+
+static void avs_component_remove(struct snd_soc_component *component)
+{
+	struct avs_soc_component *acomp = to_avs_soc_component(component);
+	struct snd_soc_acpi_mach *mach;
+	struct avs_dev *adev = to_avs_dev(component->dev);
+	int ret;
+
+	mach = dev_get_platdata(component->card->dev);
+
+	mutex_lock(&adev->comp_list_mutex);
+	list_del(&acomp->node);
+	mutex_unlock(&adev->comp_list_mutex);
+
+	if (mach->tplg_filename) {
+		ret = avs_remove_topology(component);
+		if (ret < 0)
+			dev_err(component->dev, "unload topology failed: %d\n", ret);
+	}
+}
+
+static int avs_component_open(struct snd_soc_component *component,
+			      struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
+	struct snd_pcm_hardware hwparams;
+
+	/* only FE DAI links are handled here */
+	if (rtd->dai_link->no_pcm)
+		return 0;
+
+	hwparams.info = SNDRV_PCM_INFO_MMAP |
+			SNDRV_PCM_INFO_MMAP_VALID |
+			SNDRV_PCM_INFO_INTERLEAVED |
+			SNDRV_PCM_INFO_PAUSE |
+			SNDRV_PCM_INFO_NO_PERIOD_WAKEUP;
+
+	hwparams.formats = SNDRV_PCM_FMTBIT_S16_LE |
+			   SNDRV_PCM_FMTBIT_S24_LE |
+			   SNDRV_PCM_FMTBIT_S32_LE;
+	hwparams.period_bytes_min = 128;
+	hwparams.period_bytes_max = AZX_MAX_BUF_SIZE / 2;
+	hwparams.periods_min = 2;
+	hwparams.periods_max = AZX_MAX_FRAG;
+	hwparams.buffer_bytes_max = AZX_MAX_BUF_SIZE;
+	hwparams.fifo_size = 0;
+
+	return snd_soc_set_runtime_hwparams(substream, &hwparams);
+}
+
+static unsigned int avs_hda_stream_dpib_read(struct hdac_ext_stream *stream)
+{
+	return readl(hdac_stream(stream)->bus->remap_addr + AZX_REG_VS_SDXDPIB_XBASE +
+		     (AZX_REG_VS_SDXDPIB_XINTERVAL * hdac_stream(stream)->index));
+}
+
+static snd_pcm_uframes_t
+avs_component_pointer(struct snd_soc_component *component, struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
+	struct avs_dma_data *data;
+	struct hdac_ext_stream *host_stream;
+	unsigned int pos;
+
+	data = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+	if (!data->host_stream)
+		return 0;
+
+	host_stream = data->host_stream;
+	pos = avs_hda_stream_dpib_read(host_stream);
+
+	if (pos >= hdac_stream(host_stream)->bufsize)
+		pos = 0;
+
+	return bytes_to_frames(substream->runtime, pos);
+}
+
+static int avs_component_mmap(struct snd_soc_component *component,
+			      struct snd_pcm_substream *substream,
+			      struct vm_area_struct *vma)
+{
+	return snd_pcm_lib_default_mmap(substream, vma);
+}
+
+#define MAX_PREALLOC_SIZE	(32 * 1024 * 1024)
+
+static int avs_component_construct(struct snd_soc_component *component,
+				   struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_dai *dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_pcm *pcm = rtd->pcm;
+
+	if (dai->driver->playback.channels_min)
+		snd_pcm_set_managed_buffer(pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream,
+					   SNDRV_DMA_TYPE_DEV_SG, component->dev, 0,
+					   MAX_PREALLOC_SIZE);
+
+	if (dai->driver->capture.channels_min)
+		snd_pcm_set_managed_buffer(pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream,
+					   SNDRV_DMA_TYPE_DEV_SG, component->dev, 0,
+					   MAX_PREALLOC_SIZE);
+
+	return 0;
+}
+
+static const struct snd_soc_component_driver avs_component_driver = {
+	.name			= "avs-pcm",
+	.probe			= avs_component_probe,
+	.remove			= avs_component_remove,
+	.open			= avs_component_open,
+	.pointer		= avs_component_pointer,
+	.mmap			= avs_component_mmap,
+	.pcm_construct		= avs_component_construct,
+	.module_get_upon_open	= 1, /* increment refcount when a pcm is opened */
+	.topology_name_prefix	= "intel/avs",
+	.non_legacy_dai_naming	= true,
+};
+
+__maybe_unused
+static int avs_soc_component_register(struct device *dev, const char *name,
+				      const struct snd_soc_component_driver *drv,
+				      struct snd_soc_dai_driver *cpu_dais, int num_cpu_dais)
+{
+	struct avs_soc_component *acomp;
+	int ret;
+
+	acomp = devm_kzalloc(dev, sizeof(*acomp), GFP_KERNEL);
+	if (!acomp)
+		return -ENOMEM;
+
+	ret = snd_soc_component_initialize(&acomp->base, drv, dev);
+	if (ret < 0)
+		return ret;
+
+	/* force name change after ASoC is done with its init */
+	acomp->base.name = name;
+	INIT_LIST_HEAD(&acomp->node);
+
+	return snd_soc_add_component(&acomp->base, cpu_dais, num_cpu_dais);
+}
-- 
2.25.1

