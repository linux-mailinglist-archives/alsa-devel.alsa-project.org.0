Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFE246D1FD
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 12:18:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F46F25FA;
	Wed,  8 Dec 2021 12:18:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F46F25FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638962337;
	bh=/qSawSSIyk0mX0KQgXEW/fbdCpuZOAsM/kC13zEe1bg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UK0hZDBh5/y9gFuvpe/15C4ZJ+PJmTssP8wz6Y3E//gX7sz3DfjUNYaEHp/jj/4mM
	 CV1IV1KR54hpBVf7s+Zfkmfg30HnLBTOZZG3oSbRx1qVO0N7qC/ieTnP6NMybR9UFJ
	 3AKjVewyttwaMBo2tYbW9ZI4t8AW87ztMYsa3O4s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EBD8F805C2;
	Wed,  8 Dec 2021 12:12:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20645F805C0; Wed,  8 Dec 2021 12:12:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0E98F8058C
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 12:11:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0E98F8058C
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="236548390"
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="236548390"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 03:11:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="600600277"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Dec 2021 03:11:53 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC 19/37] ASoC: Intel: avs: Path management
Date: Wed,  8 Dec 2021 12:12:43 +0100
Message-Id: <20211208111301.1817725-20-cezary.rojewski@intel.com>
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

To implement ASoC PCM operations, DSP path handling is needed. With path
template concept present, information carried by topology file can be
converted into runtime path representation. Each may be composed of
several pipelines and each pipeline can contain a number of processing
modules inside. Number of templates and variants found within topology
may vastly outnumber the total amount of pipelines and modules supported
by AudioDSP firmware simultaneously (in runtime) so none of the IDs are
specified in the topology. These are assigned dynamically when needed
and account for limitations described by FIRMWARE_CONFIG and
HARDWARE_CONFIG basefw parameters.

Paths are created on ->hw_params() and are freed on ->hw_free() ALSA PCM
operations. This choice is based on firmware expectations - need for
complete set of information when attempting to instantiate pipelines and
modules on AudioDSP side. With DMA and audio format provided, search
mechanism tests all path variants available in given path template until
a matching variant is found. Once found, information already available
is combined with all avs_tplg_* pieces pointed by matching path variant.
This finally allows to begin a cascade of IPCs which goes is to reserve
resources and prepare DSP for upcoming audio streaming.

DSP pipelines follow simple state machine scheme:
CREATE -> RESET -> PAUSE -> RUNNING -> PAUSE -> RESET -> DELETE

There is no STOP, PAUSE serves for both. Helpers are provided to ease
with state changing for all objects found in the path.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 .../ABI/testing/sysfs-bus-pci-devices-avs     |   24 +
 sound/soc/intel/Kconfig                       |    1 +
 sound/soc/intel/avs/Makefile                  |    2 +-
 sound/soc/intel/avs/avs.h                     |    7 +
 sound/soc/intel/avs/path.c                    | 1012 +++++++++++++++++
 sound/soc/intel/avs/path.h                    |   72 ++
 6 files changed, 1117 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-pci-devices-avs
 create mode 100644 sound/soc/intel/avs/path.c
 create mode 100644 sound/soc/intel/avs/path.h

diff --git a/Documentation/ABI/testing/sysfs-bus-pci-devices-avs b/Documentation/ABI/testing/sysfs-bus-pci-devices-avs
new file mode 100644
index 000000000000..785e680ac1a3
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-pci-devices-avs
@@ -0,0 +1,24 @@
+What:		/sys/devices/pci0000:00/<dev>/<tplg_name>/<path_template>:<path>/<pipeline>/state
+Date:		December 2021
+Contact:	Cezary Rojewski <cezary.rojewski@intel.com>
+Description:
+		File is only present when specific pipeline is instantiated in
+		driver. It is used to check or change pipeline state. Possible
+		read values: invalid, uninitialized, reset, paused, running,
+		eos, error_stop, saved, restored.
+		Allows only to set state to: reset, paused, running.
+
+What:		/sys/devices/pci0000:00/<dev>/<tplg_name>/<path_template>:<path>/<pipeline>/<module>/fw_id
+Date:		December 2021
+Contact:	Cezary Rojewski <cezary.rojewski@intel.com>
+Description:
+		File is only present when specific module is instantiated in
+		driver. Used to get module id used by FW for module in question.
+
+What:		/sys/devices/pci0000:00/<dev>/<tplg_name>/<path_template>:<path>/<pipeline>/<module>/fw_instance
+Date:		December 2021
+Contact:	Cezary Rojewski <cezary.rojewski@intel.com>
+Description:
+		File is only present when specific module is instantiated in
+		driver. Used to get instance id assigned from pool of ids
+		for module in question.
diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index dddd2cc8fef3..d549ce83a9c4 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -218,6 +218,7 @@ config SND_SOC_INTEL_AVS
 	select SND_SOC_ACPI
 	select SND_SOC_TOPOLOGY
 	select SND_HDA_EXT_CORE
+	select SND_INTEL_NHLT
 	help
 	  Enable support for Intel(R) cAVS 1.5 platforms with DSP
 	  capabilities. This includes Skylake, Kabylake, Amberlake and
diff --git a/sound/soc/intel/avs/Makefile b/sound/soc/intel/avs/Makefile
index c7f1623264af..41a11506e5b8 100644
--- a/sound/soc/intel/avs/Makefile
+++ b/sound/soc/intel/avs/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-snd-soc-avs-objs := dsp.o ipc.o messages.o utils.o topology.o
+snd-soc-avs-objs := dsp.o ipc.o messages.o utils.o topology.o path.o
 
 obj-$(CONFIG_SND_SOC_INTEL_AVS) += snd-soc-avs.o
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 701802017423..45861db1a4c3 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -79,6 +79,13 @@ struct avs_dev {
 	atomic_t *core_refs;
 
 	struct completion fw_ready;
+
+	struct nhlt_acpi_table *nhlt;
+	struct list_head comp_list;
+	struct mutex comp_list_mutex;
+	struct list_head path_list;
+	spinlock_t path_list_lock;
+	struct mutex path_mutex;
 };
 
 /* from hda_bus to avs_dev */
diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
new file mode 100644
index 000000000000..b27ec9686a9b
--- /dev/null
+++ b/sound/soc/intel/avs/path.c
@@ -0,0 +1,1012 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2021 Intel Corporation. All rights reserved.
+//
+// Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+//          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+//
+
+#include <sound/intel-nhlt.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include "avs.h"
+#include "path.h"
+#include "topology.h"
+
+/* Must be called with adev->comp_list_mutex held. */
+static struct avs_tplg *
+avs_path_find_tplg(struct avs_dev *adev, const char *name)
+{
+	struct avs_soc_component *acomp;
+
+	list_for_each_entry(acomp, &adev->comp_list, node)
+		if (!strcmp(acomp->tplg->name, name))
+			return acomp->tplg;
+	return NULL;
+}
+
+static struct avs_path_module *
+avs_path_find_module(struct avs_path_pipeline *ppl, u32 template_id)
+{
+	struct avs_path_module *mod;
+
+	list_for_each_entry(mod, &ppl->mod_list, node)
+		if (mod->template->id == template_id)
+			return mod;
+	return NULL;
+}
+
+static struct avs_path_pipeline *
+avs_path_find_pipeline(struct avs_path *path, u32 template_id)
+{
+	struct avs_path_pipeline *ppl;
+
+	list_for_each_entry(ppl, &path->ppl_list, node)
+		if (ppl->template->id == template_id)
+			return ppl;
+	return NULL;
+}
+
+static struct avs_path *
+avs_path_find_path(struct avs_dev *adev, const char *name, u32 template_id)
+{
+	struct avs_tplg_path_template *pos, *template = NULL;
+	struct avs_tplg *tplg;
+	struct avs_path *path;
+
+	tplg = avs_path_find_tplg(adev, name);
+	if (!tplg)
+		return NULL;
+
+	list_for_each_entry(pos, &tplg->path_tmpl_list, node) {
+		if (pos->id == template_id) {
+			template = pos;
+			break;
+		}
+	}
+	if (!template)
+		return NULL;
+
+	spin_lock(&adev->path_list_lock);
+	/* Only one variant of given path template may be instantiated at a time. */
+	list_for_each_entry(path, &adev->path_list, node) {
+		if (path->template->owner == template) {
+			spin_unlock(&adev->path_list_lock);
+			return path;
+		}
+	}
+
+	spin_unlock(&adev->path_list_lock);
+	return NULL;
+}
+
+static bool avs_test_hw_params(struct snd_pcm_hw_params *params,
+			       struct avs_audio_format *fmt)
+{
+	return (params_rate(params) == fmt->sampling_freq &&
+		params_channels(params) == fmt->num_channels &&
+		params_physical_width(params) == fmt->bit_depth &&
+		params_width(params) == fmt->valid_bit_depth);
+}
+
+static struct avs_tplg_path *
+avs_path_find_variant(struct avs_dev *adev,
+		      struct avs_tplg_path_template *template,
+		      struct snd_pcm_hw_params *fe_params,
+		      struct snd_pcm_hw_params *be_params)
+{
+	struct avs_tplg_path *variant;
+
+	list_for_each_entry(variant, &template->path_list, node) {
+		dev_dbg(adev->dev, "check FE rate %d chn %d vbd %d bd %d\n",
+			variant->fe_fmt->sampling_freq, variant->fe_fmt->num_channels,
+			variant->fe_fmt->valid_bit_depth, variant->fe_fmt->bit_depth);
+		dev_dbg(adev->dev, "check BE rate %d chn %d vbd %d bd %d\n",
+			variant->be_fmt->sampling_freq, variant->be_fmt->num_channels,
+			variant->be_fmt->valid_bit_depth, variant->be_fmt->bit_depth);
+
+		if (variant->fe_fmt && avs_test_hw_params(fe_params, variant->fe_fmt) &&
+		    variant->be_fmt && avs_test_hw_params(be_params, variant->be_fmt))
+			return variant;
+	}
+
+	return NULL;
+}
+
+__maybe_unused
+static bool avs_dma_type_is_host(u32 dma_type)
+{
+	return dma_type == AVS_DMA_HDA_HOST_OUTPUT ||
+	       dma_type == AVS_DMA_HDA_HOST_INPUT;
+}
+
+__maybe_unused
+static bool avs_dma_type_is_link(u32 dma_type)
+{
+	return !avs_dma_type_is_host(dma_type);
+}
+
+__maybe_unused
+static bool avs_dma_type_is_output(u32 dma_type)
+{
+	return dma_type == AVS_DMA_HDA_HOST_OUTPUT ||
+	       dma_type == AVS_DMA_HDA_LINK_OUTPUT ||
+	       dma_type == AVS_DMA_I2S_LINK_OUTPUT;
+}
+
+__maybe_unused
+static bool avs_dma_type_is_input(u32 dma_type)
+{
+	return !avs_dma_type_is_output(dma_type);
+}
+
+static int avs_copier_create(struct avs_dev *adev, struct avs_path_module *mod)
+{
+	struct nhlt_acpi_table *nhlt = adev->nhlt;
+	struct avs_tplg_module *t = mod->template;
+	struct avs_copier_cfg *cfg;
+	struct nhlt_specific_cfg *ep_blob;
+	union avs_connector_node_id node_id = {0};
+	size_t cfg_size, data_size = 0;
+	void *data = NULL;
+	u32 dma_type;
+	int ret;
+
+	dma_type = t->cfg_ext->copier.dma_type;
+	node_id.dma_type = dma_type;
+
+	switch (dma_type) {
+		struct avs_audio_format *fmt;
+		int direction;
+
+	case AVS_DMA_I2S_LINK_OUTPUT:
+	case AVS_DMA_I2S_LINK_INPUT:
+		if (avs_dma_type_is_input(dma_type))
+			direction = SNDRV_PCM_STREAM_CAPTURE;
+		else
+			direction = SNDRV_PCM_STREAM_PLAYBACK;
+
+		if (t->cfg_ext->copier.blob_fmt)
+			fmt = t->cfg_ext->copier.blob_fmt;
+		else if (direction == SNDRV_PCM_STREAM_CAPTURE)
+			fmt = t->in_fmt;
+		else
+			fmt = t->cfg_ext->copier.out_fmt;
+
+		ep_blob = intel_nhlt_get_endpoint_blob(adev->dev,
+			nhlt, t->cfg_ext->copier.vindex.i2s.instance,
+			NHLT_LINK_SSP, fmt->valid_bit_depth, fmt->bit_depth,
+			fmt->num_channels, fmt->sampling_freq, direction,
+			NHLT_DEVICE_I2S);
+		if (!ep_blob) {
+			dev_err(adev->dev, "no I2S ep_blob found\n");
+			return -ENOENT;
+		}
+
+		data = ep_blob->caps;
+		data_size = ep_blob->size;
+		/* I2S gateway's vindex is statically assigned in topology */
+		node_id.vindex = t->cfg_ext->copier.vindex.val;
+
+		break;
+
+	case AVS_DMA_DMIC_LINK_INPUT:
+		direction = SNDRV_PCM_STREAM_CAPTURE;
+
+		if (t->cfg_ext->copier.blob_fmt)
+			fmt = t->cfg_ext->copier.blob_fmt;
+		else
+			fmt = t->in_fmt;
+
+		ep_blob = intel_nhlt_get_endpoint_blob(adev->dev, nhlt, 0,
+				NHLT_LINK_DMIC, fmt->valid_bit_depth,
+				fmt->bit_depth, fmt->num_channels,
+				fmt->sampling_freq, direction, NHLT_DEVICE_DMIC);
+		if (!ep_blob) {
+			dev_err(adev->dev, "no DMIC ep_blob found\n");
+			return -ENOENT;
+		}
+
+		data = ep_blob->caps;
+		data_size = ep_blob->size;
+		/* DMIC gateway's vindex is statically assigned in topology */
+		node_id.vindex = t->cfg_ext->copier.vindex.val;
+
+		break;
+
+	case AVS_DMA_HDA_HOST_OUTPUT:
+	case AVS_DMA_HDA_HOST_INPUT:
+		/* HOST gateway's vindex is dynamically assigned with DMA id */
+		node_id.vindex = mod->owner->owner->dma_id;
+		break;
+
+	case AVS_DMA_HDA_LINK_OUTPUT:
+	case AVS_DMA_HDA_LINK_INPUT:
+		node_id.vindex = t->cfg_ext->copier.vindex.val |
+				 mod->owner->owner->dma_id;
+		break;
+
+	case INVALID_OBJECT_ID:
+	default:
+		node_id = INVALID_NODE_ID;
+		break;
+	}
+
+	cfg_size = sizeof(*cfg);
+	if (data_size) {
+		/* Gateway attributes are path of every config-BLOB. */
+		cfg_size -= sizeof(cfg->gtw_cfg.config.attrs);
+		cfg_size += data_size;
+	}
+
+	cfg = kzalloc(cfg_size, GFP_KERNEL);
+	if (!cfg)
+		return -ENOMEM;
+
+	cfg->base.cpc = t->cfg_base->cpc;
+	cfg->base.ibs = t->cfg_base->ibs;
+	cfg->base.obs = t->cfg_base->obs;
+	cfg->base.is_pages = t->cfg_base->is_pages;
+	cfg->base.audio_fmt = *t->in_fmt;
+	cfg->out_fmt = *t->cfg_ext->copier.out_fmt;
+	cfg->feature_mask = t->cfg_ext->copier.feature_mask;
+	cfg->gtw_cfg.node_id = node_id;
+	cfg->gtw_cfg.dma_buffer_size = t->cfg_ext->copier.dma_buffer_size;
+	if (data) {
+		/* config_length in DWORDs */
+		memcpy(&cfg->gtw_cfg.config, data, data_size);
+		cfg->gtw_cfg.config_length = DIV_ROUND_UP(data_size, 4);
+	}
+
+	mod->gtw_attrs = cfg->gtw_cfg.config.attrs;
+
+	ret = avs_dsp_init_module(adev, mod->module_id, mod->owner->instance_id,
+				  t->core_id, t->domain, cfg, cfg_size,
+				  &mod->instance_id);
+	kfree(cfg);
+	return ret;
+}
+
+static int avs_updown_mix_create(struct avs_dev *adev, struct avs_path_module *mod)
+{
+	struct avs_tplg_module *t = mod->template;
+	struct avs_updown_mixer_cfg cfg;
+	int i;
+
+	cfg.base.cpc = t->cfg_base->cpc;
+	cfg.base.ibs = t->cfg_base->ibs;
+	cfg.base.obs = t->cfg_base->obs;
+	cfg.base.is_pages = t->cfg_base->is_pages;
+	cfg.base.audio_fmt = *t->in_fmt;
+	cfg.out_channel_config = t->cfg_ext->updown_mix.out_channel_config;
+	cfg.coefficients_select = t->cfg_ext->updown_mix.coefficients_select;
+	for (i = 0; i < AVS_CHANNELS_MAX; i++)
+		cfg.coefficients[i] = t->cfg_ext->updown_mix.coefficients[i];
+	cfg.channel_map = t->cfg_ext->updown_mix.channel_map;
+
+	return avs_dsp_init_module(adev, mod->module_id, mod->owner->instance_id,
+				   t->core_id, t->domain, &cfg, sizeof(cfg),
+				   &mod->instance_id);
+}
+
+static int avs_src_create(struct avs_dev *adev, struct avs_path_module *mod)
+{
+	struct avs_tplg_module *t = mod->template;
+	struct avs_src_cfg cfg;
+
+	cfg.base.cpc = t->cfg_base->cpc;
+	cfg.base.ibs = t->cfg_base->ibs;
+	cfg.base.obs = t->cfg_base->obs;
+	cfg.base.is_pages = t->cfg_base->is_pages;
+	cfg.base.audio_fmt = *t->in_fmt;
+	cfg.out_freq = t->cfg_ext->src.out_freq;
+
+	return avs_dsp_init_module(adev, mod->module_id, mod->owner->instance_id,
+				   t->core_id, t->domain, &cfg, sizeof(cfg),
+				   &mod->instance_id);
+}
+
+static int avs_asrc_create(struct avs_dev *adev, struct avs_path_module *mod)
+{
+	struct avs_tplg_module *t = mod->template;
+	struct avs_asrc_cfg cfg;
+
+	cfg.base.cpc = t->cfg_base->cpc;
+	cfg.base.ibs = t->cfg_base->ibs;
+	cfg.base.obs = t->cfg_base->obs;
+	cfg.base.is_pages = t->cfg_base->is_pages;
+	cfg.base.audio_fmt = *t->in_fmt;
+	cfg.out_freq = t->cfg_ext->asrc.out_freq;
+	cfg.mode = t->cfg_ext->asrc.mode;
+	cfg.disable_jitter_buffer = t->cfg_ext->asrc.disable_jitter_buffer;
+
+	return avs_dsp_init_module(adev, mod->module_id, mod->owner->instance_id,
+				   t->core_id, t->domain, &cfg, sizeof(cfg),
+				   &mod->instance_id);
+}
+
+static int avs_aec_create(struct avs_dev *adev, struct avs_path_module *mod)
+{
+	struct avs_tplg_module *t = mod->template;
+	struct avs_aec_cfg cfg;
+
+	cfg.base.cpc = t->cfg_base->cpc;
+	cfg.base.ibs = t->cfg_base->ibs;
+	cfg.base.obs = t->cfg_base->obs;
+	cfg.base.is_pages = t->cfg_base->is_pages;
+	cfg.base.audio_fmt = *t->in_fmt;
+	cfg.ref_fmt = *t->cfg_ext->aec.ref_fmt;
+	cfg.out_fmt = *t->cfg_ext->aec.out_fmt;
+	cfg.cpc_lp_mode = t->cfg_ext->aec.cpc_lp_mode;
+
+	return avs_dsp_init_module(adev, mod->module_id, mod->owner->instance_id,
+				   t->core_id, t->domain, &cfg, sizeof(cfg),
+				   &mod->instance_id);
+}
+
+static int avs_mux_create(struct avs_dev *adev, struct avs_path_module *mod)
+{
+	struct avs_tplg_module *t = mod->template;
+	struct avs_aec_cfg cfg;
+
+	cfg.base.cpc = t->cfg_base->cpc;
+	cfg.base.ibs = t->cfg_base->ibs;
+	cfg.base.obs = t->cfg_base->obs;
+	cfg.base.is_pages = t->cfg_base->is_pages;
+	cfg.base.audio_fmt = *t->in_fmt;
+	cfg.ref_fmt = *t->cfg_ext->mux.ref_fmt;
+	cfg.out_fmt = *t->cfg_ext->mux.out_fmt;
+
+	return avs_dsp_init_module(adev, mod->module_id, mod->owner->instance_id,
+				   t->core_id, t->domain, &cfg, sizeof(cfg),
+				   &mod->instance_id);
+}
+
+static int avs_wov_create(struct avs_dev *adev, struct avs_path_module *mod)
+{
+	struct avs_tplg_module *t = mod->template;
+	struct avs_wov_cfg cfg;
+
+	cfg.base.cpc = t->cfg_base->cpc;
+	cfg.base.ibs = t->cfg_base->ibs;
+	cfg.base.obs = t->cfg_base->obs;
+	cfg.base.is_pages = t->cfg_base->is_pages;
+	cfg.base.audio_fmt = *t->in_fmt;
+	cfg.cpc_lp_mode = t->cfg_ext->wov.cpc_lp_mode;
+
+	return avs_dsp_init_module(adev, mod->module_id, mod->owner->instance_id,
+				   t->core_id, t->domain, &cfg, sizeof(cfg),
+				   &mod->instance_id);
+}
+
+static int avs_micsel_create(struct avs_dev *adev, struct avs_path_module *mod)
+{
+	struct avs_tplg_module *t = mod->template;
+	struct avs_micsel_cfg cfg;
+
+	cfg.base.cpc = t->cfg_base->cpc;
+	cfg.base.ibs = t->cfg_base->ibs;
+	cfg.base.obs = t->cfg_base->obs;
+	cfg.base.is_pages = t->cfg_base->is_pages;
+	cfg.base.audio_fmt = *t->in_fmt;
+	cfg.out_fmt = *t->cfg_ext->micsel.out_fmt;
+
+	return avs_dsp_init_module(adev, mod->module_id, mod->owner->instance_id,
+				   t->core_id, t->domain, &cfg, sizeof(cfg),
+				   &mod->instance_id);
+}
+
+static int avs_modbase_create(struct avs_dev *adev, struct avs_path_module *mod)
+{
+	struct avs_tplg_module *t = mod->template;
+	struct avs_modcfg_base cfg;
+
+	cfg.cpc = t->cfg_base->cpc;
+	cfg.ibs = t->cfg_base->ibs;
+	cfg.obs = t->cfg_base->obs;
+	cfg.is_pages = t->cfg_base->is_pages;
+	cfg.audio_fmt = *t->in_fmt;
+
+	return avs_dsp_init_module(adev, mod->module_id, mod->owner->instance_id,
+				   t->core_id, t->domain, &cfg, sizeof(cfg),
+				   &mod->instance_id);
+}
+
+static int avs_modext_create(struct avs_dev *adev, struct avs_path_module *mod)
+{
+	struct avs_tplg_module *t = mod->template;
+	struct avs_tplg_modcfg_ext *tcfg = t->cfg_ext;
+	struct avs_modcfg_ext *cfg;
+	size_t cfg_size, num_pins;
+	int ret, i;
+
+	num_pins = tcfg->generic.num_input_pins + tcfg->generic.num_output_pins;
+	cfg_size = sizeof(*cfg) + sizeof(*cfg->pin_fmts) * num_pins;
+
+	cfg = kzalloc(cfg_size, GFP_KERNEL);
+	if (!cfg)
+		return -ENOMEM;
+
+	cfg->base.cpc = t->cfg_base->cpc;
+	cfg->base.ibs = t->cfg_base->ibs;
+	cfg->base.obs = t->cfg_base->obs;
+	cfg->base.is_pages = t->cfg_base->is_pages;
+	cfg->base.audio_fmt = *t->in_fmt;
+	cfg->num_input_pins = tcfg->generic.num_input_pins;
+	cfg->num_output_pins = tcfg->generic.num_output_pins;
+
+	/* configure pin formats */
+	for (i = 0; i < num_pins; i++) {
+		struct avs_tplg_pin_format *tpin = &tcfg->generic.pin_fmts[i];
+		struct avs_pin_format *pin = &cfg->pin_fmts[i];
+
+		pin->pin_index = tpin->pin_index;
+		pin->iobs = tpin->iobs;
+		pin->audio_fmt = *tpin->fmt;
+	}
+
+	ret = avs_dsp_init_module(adev, mod->module_id, mod->owner->instance_id,
+				  t->core_id, t->domain, cfg, cfg_size,
+				  &mod->instance_id);
+	kfree(cfg);
+	return ret;
+}
+
+static int avs_path_module_type_create(struct avs_dev *adev, struct avs_path_module *mod)
+{
+	const guid_t *type = &mod->template->cfg_ext->type;
+
+	if (guid_equal(type, &AVS_MIXIN_MOD_UUID) ||
+	    guid_equal(type, &AVS_MIXOUT_MOD_UUID) ||
+	    guid_equal(type, &AVS_KPBUFF_MOD_UUID))
+		return avs_modbase_create(adev, mod);
+	if (guid_equal(type, &AVS_COPIER_MOD_UUID))
+		return avs_copier_create(adev, mod);
+	if (guid_equal(type, &AVS_MICSEL_MOD_UUID))
+		return avs_micsel_create(adev, mod);
+	if (guid_equal(type, &AVS_MUX_MOD_UUID))
+		return avs_mux_create(adev, mod);
+	if (guid_equal(type, &AVS_UPDWMIX_MOD_UUID))
+		return avs_updown_mix_create(adev, mod);
+	if (guid_equal(type, &AVS_SRCINTC_MOD_UUID))
+		return avs_src_create(adev, mod);
+	if (guid_equal(type, &AVS_AEC_MOD_UUID))
+		return avs_aec_create(adev, mod);
+	if (guid_equal(type, &AVS_ASRC_MOD_UUID))
+		return avs_asrc_create(adev, mod);
+	if (guid_equal(type, &AVS_INTELWOV_MOD_UUID))
+		return avs_wov_create(adev, mod);
+
+	if (guid_equal(type, &AVS_PROBE_MOD_UUID)) {
+		dev_err(adev->dev, "Probe module can't be instantiated by topology");
+		return -EINVAL;
+	}
+
+	return avs_modext_create(adev, mod);
+}
+
+static void avs_path_module_free(struct avs_dev *adev, struct avs_path_module *mod)
+{
+	kfree(mod);
+}
+
+static struct avs_path_module *
+avs_path_module_create(struct avs_dev *adev,
+		       struct avs_path_pipeline *owner,
+		       struct avs_tplg_module *template)
+{
+	struct avs_path_module *mod;
+	int module_id, ret;
+
+	module_id = avs_get_module_id(adev, &template->cfg_ext->type);
+	if (module_id < 0)
+		return ERR_PTR(module_id);
+
+	mod = kzalloc(sizeof(*mod), GFP_KERNEL);
+	if (!mod)
+		return ERR_PTR(-ENOMEM);
+
+	mod->template = template;
+	mod->module_id = module_id;
+	mod->owner = owner;
+	INIT_LIST_HEAD(&mod->node);
+
+	ret = avs_path_module_type_create(adev, mod);
+	if (ret) {
+		dev_err(adev->dev, "module-type create failed: %d\n", ret);
+		kfree(mod);
+		return ERR_PTR(ret);
+	}
+
+	return mod;
+}
+
+static void avs_path_binding_free(struct avs_dev *adev, struct avs_path_binding *binding)
+{
+	kfree(binding);
+}
+
+static struct avs_path_binding *avs_path_binding_create(struct avs_dev *adev,
+							struct avs_path_pipeline *owner,
+							struct avs_tplg_binding *t)
+{
+	struct avs_path_binding *binding;
+
+	binding = kzalloc(sizeof(*binding), GFP_KERNEL);
+	if (!binding)
+		return ERR_PTR(-ENOMEM);
+
+	binding->template = t;
+	binding->owner = owner;
+	INIT_LIST_HEAD(&binding->node);
+
+	return binding;
+}
+
+static int avs_path_binding_arm(struct avs_dev *adev, struct avs_path_binding *binding)
+{
+	struct avs_path_module *this_mod, *target_mod;
+	struct avs_path_pipeline *target_ppl;
+	struct avs_path *target_path;
+	struct avs_tplg_binding *t;
+
+	t = binding->template;
+	this_mod = avs_path_find_module(binding->owner,
+					t->mod_id);
+	if (!this_mod) {
+		dev_err(adev->dev, "path mod %d not found\n", t->mod_id);
+		return -EINVAL;
+	}
+
+	/* update with target_tplg_name too */
+	target_path = avs_path_find_path(adev, t->target_tplg_name,
+					 t->target_path_tmpl_id);
+	if (!target_path) {
+		dev_err(adev->dev, "target path %s:%d not found\n",
+			t->target_tplg_name, t->target_path_tmpl_id);
+		return -EINVAL;
+	}
+
+	target_ppl = avs_path_find_pipeline(target_path,
+					    t->target_ppl_id);
+	if (!target_ppl) {
+		dev_err(adev->dev, "target ppl %d not found\n", t->target_ppl_id);
+		return -EINVAL;
+	}
+
+	target_mod = avs_path_find_module(target_ppl, t->target_mod_id);
+	if (!target_mod) {
+		dev_err(adev->dev, "target mod %d not found\n", t->target_mod_id);
+		return -EINVAL;
+	}
+
+	if (t->is_sink) {
+		binding->sink = this_mod;
+		binding->sink_pin = t->mod_pin;
+		binding->source = target_mod;
+		binding->source_pin = t->target_mod_pin;
+	} else {
+		binding->sink = target_mod;
+		binding->sink_pin = t->target_mod_pin;
+		binding->source = this_mod;
+		binding->source_pin = t->mod_pin;
+	}
+
+	return 0;
+}
+
+static void avs_path_pipeline_free(struct avs_dev *adev,
+				   struct avs_path_pipeline *ppl)
+{
+	struct avs_path_binding *binding, *bsave;
+	struct avs_path_module *mod, *save;
+
+	list_for_each_entry_safe(binding, bsave, &ppl->binding_list, node) {
+		list_del(&binding->node);
+		avs_path_binding_free(adev, binding);
+	}
+
+	avs_dsp_delete_pipeline(adev, ppl->instance_id);
+
+	/* Unload resources occupied by owned modules */
+	list_for_each_entry_safe(mod, save, &ppl->mod_list, node) {
+		avs_dsp_delete_module(adev, mod->module_id, mod->instance_id,
+				      mod->owner->instance_id,
+				      mod->template->core_id);
+		avs_path_module_free(adev, mod);
+	}
+
+	list_del(&ppl->node);
+	kfree(ppl);
+}
+
+static int avs_path_pipeline_arm(struct avs_dev *adev,
+				 struct avs_path_pipeline *ppl)
+{
+	struct avs_path_module *mod;
+
+	list_for_each_entry(mod, &ppl->mod_list, node) {
+		struct avs_path_module *source, *sink;
+		int ret;
+
+		/*
+		 * Only one module (so it's implicitly last) or it is the last
+		 * one, either way we don't have next module to bind it to.
+		 */
+		if (mod == list_last_entry(&ppl->mod_list,
+					   struct avs_path_module, node))
+			break;
+
+		/* bind current module to next module on list */
+		source = mod;
+		sink = list_next_entry(mod, node);
+		if (!source || !sink)
+			return -EINVAL;
+
+		ret = avs_ipc_bind(adev, source->module_id, source->instance_id,
+				   sink->module_id, sink->instance_id, 0, 0);
+		if (ret)
+			return AVS_IPC_RET(ret);
+	}
+
+	return 0;
+}
+
+static struct avs_path_pipeline *
+avs_path_pipeline_create(struct avs_dev *adev,
+			 struct avs_path *owner,
+			 struct avs_tplg_pipeline *template)
+{
+	struct avs_path_pipeline *ppl;
+	struct avs_tplg_pplcfg *cfg = template->cfg;
+	struct avs_tplg_module *tmod;
+	int ret, i;
+
+	ppl = kzalloc(sizeof(*ppl), GFP_KERNEL);
+	if (!ppl)
+		return ERR_PTR(-ENOMEM);
+
+	ppl->template = template;
+	ppl->owner = owner;
+	INIT_LIST_HEAD(&ppl->binding_list);
+	INIT_LIST_HEAD(&ppl->mod_list);
+	INIT_LIST_HEAD(&ppl->node);
+
+	ret = avs_dsp_create_pipeline(adev, cfg->req_size, cfg->priority,
+				      cfg->lp, cfg->attributes,
+				      &ppl->instance_id);
+	if (ret) {
+		dev_err(adev->dev, "error creating pipeline %d\n", ret);
+		kfree(ppl);
+		return ERR_PTR(ret);
+	}
+
+	list_for_each_entry(tmod, &template->mod_list, node) {
+		struct avs_path_module *mod;
+
+		mod = avs_path_module_create(adev, ppl, tmod);
+		if (IS_ERR(mod)) {
+			ret = PTR_ERR(mod);
+			dev_err(adev->dev, "error creating module %d\n", ret);
+			goto init_err;
+		}
+
+		list_add_tail(&mod->node, &ppl->mod_list);
+	}
+
+	for (i = 0; i < template->num_bindings; i++) {
+		struct avs_path_binding *binding;
+
+		binding = avs_path_binding_create(adev, ppl, template->bindings[i]);
+		if (IS_ERR(binding)) {
+			ret = PTR_ERR(binding);
+			dev_err(adev->dev, "error creating binding %d\n", ret);
+			goto init_err;
+		}
+
+		list_add_tail(&binding->node, &ppl->binding_list);
+	}
+
+	return ppl;
+
+init_err:
+	avs_path_pipeline_free(adev, ppl);
+	return ERR_PTR(ret);
+}
+
+static int avs_path_init(struct avs_dev *adev, struct avs_path *path,
+			 struct avs_tplg_path *template, u32 dma_id)
+{
+	struct avs_tplg_pipeline *tppl;
+
+	path->owner = adev;
+	path->template = template;
+	path->dma_id = dma_id;
+	INIT_LIST_HEAD(&path->ppl_list);
+	INIT_LIST_HEAD(&path->node);
+
+	/* create all the pipelines */
+	list_for_each_entry(tppl, &template->ppl_list, node) {
+		struct avs_path_pipeline *ppl;
+
+		ppl = avs_path_pipeline_create(adev, path, tppl);
+		if (IS_ERR(ppl))
+			return PTR_ERR(ppl);
+
+		list_add_tail(&ppl->node, &path->ppl_list);
+	}
+
+	spin_lock(&adev->path_list_lock);
+	list_add_tail(&path->node, &adev->path_list);
+	spin_unlock(&adev->path_list_lock);
+
+	return 0;
+}
+
+static int avs_path_arm(struct avs_dev *adev, struct avs_path *path)
+{
+	struct avs_path_pipeline *ppl;
+	struct avs_path_binding *binding;
+	int ret;
+
+	list_for_each_entry(ppl, &path->ppl_list, node) {
+		/*
+		 * Arm all ppl bindings before binding internal modules
+		 * as it costs no IPCs which isn't true for the latter.
+		 */
+		list_for_each_entry(binding, &ppl->binding_list, node) {
+			ret = avs_path_binding_arm(adev, binding);
+			if (ret < 0)
+				return ret;
+		}
+
+		ret = avs_path_pipeline_arm(adev, ppl);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static void avs_path_free_unlocked(struct avs_path *path)
+{
+	struct avs_path_pipeline *ppl, *save;
+
+	spin_lock(&path->owner->path_list_lock);
+	list_del(&path->node);
+	spin_unlock(&path->owner->path_list_lock);
+
+	list_for_each_entry_safe(ppl, save, &path->ppl_list, node)
+		avs_path_pipeline_free(path->owner, ppl);
+
+	kfree(path);
+}
+
+static struct avs_path *avs_path_create_unlocked(struct avs_dev *adev, u32 dma_id,
+						 struct avs_tplg_path *template)
+{
+	struct avs_soc_component *acomp;
+	struct avs_path *path;
+	int ret;
+
+	acomp = to_avs_soc_component(template->owner->owner->comp);
+
+	path = kzalloc(sizeof(*path), GFP_KERNEL);
+	if (!path)
+		return ERR_PTR(-ENOMEM);
+
+	ret = avs_path_init(adev, path, template, dma_id);
+	if (ret < 0)
+		goto err;
+
+	ret = avs_path_arm(adev, path);
+	if (ret < 0)
+		goto err;
+
+	path->state = AVS_PPL_STATE_INVALID;
+	return path;
+err:
+	avs_path_free_unlocked(path);
+	return ERR_PTR(ret);
+}
+
+struct avs_path *avs_path_create(struct avs_dev *adev, u32 dma_id,
+				 struct avs_tplg_path_template *template,
+				 struct snd_pcm_hw_params *fe_params,
+				 struct snd_pcm_hw_params *be_params)
+{
+	struct avs_tplg_path *variant;
+	struct avs_path *path;
+
+	variant = avs_path_find_variant(adev, template, fe_params, be_params);
+	if (!variant) {
+		dev_err(adev->dev, "no matching variant found\n");
+		return ERR_PTR(-ENOENT);
+	}
+
+	/* Serialize path and its components creation. */
+	mutex_lock(&adev->path_mutex);
+	/* Satisfy needs of avs_path_find_tplg(). */
+	mutex_lock(&adev->comp_list_mutex);
+
+	path = avs_path_create_unlocked(adev, dma_id, variant);
+
+	mutex_unlock(&adev->comp_list_mutex);
+	mutex_unlock(&adev->path_mutex);
+
+	return path;
+}
+
+void avs_path_free(struct avs_path *path)
+{
+	struct avs_dev *adev = path->owner;
+
+	mutex_lock(&adev->path_mutex);
+	avs_path_free_unlocked(path);
+	mutex_unlock(&adev->path_mutex);
+}
+
+static int avs_path_bind_prepare(struct avs_dev *adev,
+				 struct avs_path_binding *binding)
+{
+	const struct avs_audio_format *src_fmt, *sink_fmt;
+	struct avs_tplg_module *tsource = binding->source->template;
+	struct avs_path_module *source = binding->source;
+	int ret;
+
+	/*
+	 * only copier modules about to be bound
+	 * to output pin other than 0 need preparation
+	 */
+	if (!binding->source_pin)
+		return 0;
+	if (!guid_equal(&tsource->cfg_ext->type, &AVS_COPIER_MOD_UUID))
+		return 0;
+
+	src_fmt = tsource->in_fmt;
+	sink_fmt = binding->sink->template->in_fmt;
+
+	ret = avs_ipc_copier_set_sink_format(adev, source->module_id,
+					     source->instance_id, binding->source_pin,
+					     src_fmt, sink_fmt);
+	if (ret) {
+		dev_err(adev->dev, "config copier failed: %d\n", ret);
+		return AVS_IPC_RET(ret);
+	}
+
+	return 0;
+}
+
+int avs_path_bind(struct avs_path *path)
+{
+	struct avs_path_pipeline *ppl;
+	struct avs_dev *adev = path->owner;
+	int ret;
+
+	list_for_each_entry(ppl, &path->ppl_list, node) {
+		struct avs_path_binding *binding;
+
+		list_for_each_entry(binding, &ppl->binding_list, node) {
+			struct avs_path_module *source, *sink;
+
+			source = binding->source;
+			sink = binding->sink;
+
+			ret = avs_path_bind_prepare(adev, binding);
+			if (ret < 0)
+				return ret;
+
+			ret = avs_ipc_bind(adev, source->module_id,
+					   source->instance_id, sink->module_id,
+					   sink->instance_id, binding->sink_pin,
+					   binding->source_pin);
+			if (ret) {
+				dev_err(adev->dev, "bind path failed: %d\n", ret);
+				return AVS_IPC_RET(ret);
+			}
+		}
+	}
+
+	return 0;
+}
+
+int avs_path_unbind(struct avs_path *path)
+{
+	struct avs_path_pipeline *ppl;
+	struct avs_dev *adev = path->owner;
+	int ret;
+
+	list_for_each_entry(ppl, &path->ppl_list, node) {
+		struct avs_path_binding *binding;
+
+		list_for_each_entry(binding, &ppl->binding_list, node) {
+			struct avs_path_module *source, *sink;
+
+			source = binding->source;
+			sink = binding->sink;
+
+			ret = avs_ipc_unbind(adev, source->module_id,
+					     source->instance_id, sink->module_id,
+					     sink->instance_id, binding->sink_pin,
+					     binding->source_pin);
+			if (ret) {
+				dev_err(adev->dev, "unbind path failed: %d\n", ret);
+				return AVS_IPC_RET(ret);
+			}
+		}
+	}
+
+	return 0;
+}
+
+int avs_path_reset(struct avs_path *path)
+{
+	struct avs_path_pipeline *ppl;
+	struct avs_dev *adev = path->owner;
+	int ret;
+
+	if (path->state == AVS_PPL_STATE_RESET)
+		return 0;
+
+	list_for_each_entry(ppl, &path->ppl_list, node) {
+		ret = avs_ipc_set_pipeline_state(adev, ppl->instance_id,
+						 AVS_PPL_STATE_RESET);
+		if (ret) {
+			dev_err(adev->dev, "reset path failed: %d\n", ret);
+			path->state = AVS_PPL_STATE_INVALID;
+			return AVS_IPC_RET(ret);
+		}
+	}
+
+	path->state = AVS_PPL_STATE_RESET;
+	return 0;
+}
+
+int avs_path_pause(struct avs_path *path)
+{
+	struct avs_path_pipeline *ppl;
+	struct avs_dev *adev = path->owner;
+	int ret;
+
+	if (path->state == AVS_PPL_STATE_PAUSED)
+		return 0;
+
+	list_for_each_entry_reverse(ppl, &path->ppl_list, node) {
+		ret = avs_ipc_set_pipeline_state(adev, ppl->instance_id,
+						 AVS_PPL_STATE_PAUSED);
+		if (ret) {
+			dev_err(adev->dev, "pause path failed: %d\n", ret);
+			path->state = AVS_PPL_STATE_INVALID;
+			return AVS_IPC_RET(ret);
+		}
+	}
+
+	path->state = AVS_PPL_STATE_PAUSED;
+	return 0;
+}
+
+int avs_path_run(struct avs_path *path, int trigger)
+{
+	struct avs_path_pipeline *ppl;
+	struct avs_dev *adev = path->owner;
+	int ret;
+
+	if (path->state == AVS_PPL_STATE_RUNNING && trigger == AVS_TPLG_TRIGGER_AUTO)
+		return 0;
+
+	list_for_each_entry(ppl, &path->ppl_list, node) {
+		if (ppl->template->cfg->trigger != trigger)
+			continue;
+
+		ret = avs_ipc_set_pipeline_state(adev, ppl->instance_id,
+						 AVS_PPL_STATE_RUNNING);
+		if (ret) {
+			dev_err(adev->dev, "run path failed: %d\n", ret);
+			path->state = AVS_PPL_STATE_INVALID;
+			return AVS_IPC_RET(ret);
+		}
+	}
+
+	path->state = AVS_PPL_STATE_RUNNING;
+	return 0;
+}
diff --git a/sound/soc/intel/avs/path.h b/sound/soc/intel/avs/path.h
new file mode 100644
index 000000000000..c30ff44c07ca
--- /dev/null
+++ b/sound/soc/intel/avs/path.h
@@ -0,0 +1,72 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright(c) 2021 Intel Corporation. All rights reserved.
+ *
+ * Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+ *          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+ */
+
+#ifndef __SOUND_SOC_INTEL_AVS_PATH_H
+#define __SOUND_SOC_INTEL_AVS_PATH_H
+
+#include <linux/list.h>
+#include "avs.h"
+#include "topology.h"
+
+struct avs_path {
+	u32 dma_id;
+	struct list_head ppl_list;
+	u32 state;
+
+	struct avs_tplg_path *template;
+	struct avs_dev *owner;
+	/* device path management */
+	struct list_head node;
+};
+
+struct avs_path_pipeline {
+	u8 instance_id;
+	struct list_head mod_list;
+	struct list_head binding_list;
+
+	struct avs_tplg_pipeline *template;
+	struct avs_path *owner;
+	/* path pipelines management */
+	struct list_head node;
+};
+
+struct avs_path_module {
+	u16 module_id;
+	u16 instance_id;
+	union avs_gtw_attributes gtw_attrs;
+
+	struct avs_tplg_module *template;
+	struct avs_path_pipeline *owner;
+	/* pipeline modules management */
+	struct list_head node;
+};
+
+struct avs_path_binding {
+	struct avs_path_module *source;
+	u8 source_pin;
+	struct avs_path_module *sink;
+	u8 sink_pin;
+
+	struct avs_tplg_binding *template;
+	struct avs_path_pipeline *owner;
+	/* pipeline bindings management */
+	struct list_head node;
+};
+
+struct avs_path *avs_path_create(struct avs_dev *adev, u32 dma_id,
+				 struct avs_tplg_path_template *template,
+				 struct snd_pcm_hw_params *fe_params,
+				 struct snd_pcm_hw_params *be_params);
+void avs_path_free(struct avs_path *path);
+int avs_path_bind(struct avs_path *path);
+int avs_path_unbind(struct avs_path *path);
+int avs_path_reset(struct avs_path *path);
+int avs_path_pause(struct avs_path *path);
+int avs_path_run(struct avs_path *path, int trigger);
+
+#endif
-- 
2.25.1

