Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB9814A3AC
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jan 2020 13:20:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5EB71664;
	Mon, 27 Jan 2020 13:19:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5EB71664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580127614;
	bh=R0gxYwXup/jFoQrgoY2SDqqpi/KjgAFsoSVRSpq92nI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LvAyrMcMjaD/BvFxzzh0CPNkcNQ9FwJChWxOh9uuhLMEyEgr8e0NeNsjh83gVFcG3
	 2KrSFbGUEKlUhPomOg7R1ZFd0qmb1u6Vvp7eNiKO5JHtwvb9YFwUd4rduXklrE2vr+
	 dkDygA4DkSf5u4OPOjUS+LTcYrV/dBFWohbuSaZs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E76AF802DF;
	Mon, 27 Jan 2020 13:13:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93448F802A8; Mon, 27 Jan 2020 13:13:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9170CF80277
 for <alsa-devel@alsa-project.org>; Mon, 27 Jan 2020 13:13:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9170CF80277
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jan 2020 04:13:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,369,1574150400"; d="scan'208";a="261029693"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga002.fm.intel.com with ESMTP; 27 Jan 2020 04:13:34 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 27 Jan 2020 13:12:41 +0100
Message-Id: <20200127121243.15813-10-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200127121243.15813-1-cezary.rojewski@intel.com>
References: <20200127121243.15813-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH v2 09/11] ASoC: SOF: Intel: Probe compress
	operations
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add HDA handlers for soc_compr_ops and snd_compr_ops which cover probe
related operations. Implementation supports both connection purposes.
These merely define stream setups as core flow is covered by SOF
compress core.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---

Changes in v2:
- probes over HDA no longer require SND_SOC_SOF_HDA_LINK enabled


 sound/soc/sof/intel/Kconfig        |   9 ++
 sound/soc/sof/intel/Makefile       |   1 +
 sound/soc/sof/intel/apl.c          |   9 ++
 sound/soc/sof/intel/cnl.c          |   9 ++
 sound/soc/sof/intel/hda-compress.c | 132 +++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.h          |  24 ++++++
 6 files changed, 184 insertions(+)
 create mode 100644 sound/soc/sof/intel/hda-compress.c

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 56a837d2cb95..3bc64dee7c39 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -305,6 +305,15 @@ config SND_SOC_SOF_HDA_AUDIO_CODEC
 	  Say Y if you want to enable HDAudio codecs with SOF.
 	  If unsure select "N".
 
+config SND_SOC_SOF_HDA_PROBES
+	bool "SOF enable probes over HDA"
+	depends on SND_SOC_SOF_DEBUG_PROBES
+	help
+	  This option enables the data probing for Intel(R).
+		  Intel(R) Skylake and newer platforms.
+	  Say Y if you want to enable probes.
+	  If unsure, select "N".
+
 config SND_SOC_SOF_HDA_ALWAYS_ENABLE_DMI_L1
 	bool "SOF enable DMI Link L1"
 	help
diff --git a/sound/soc/sof/intel/Makefile b/sound/soc/sof/intel/Makefile
index b8f58e006e29..cee02a2e00f4 100644
--- a/sound/soc/sof/intel/Makefile
+++ b/sound/soc/sof/intel/Makefile
@@ -9,6 +9,7 @@ snd-sof-intel-hda-common-objs := hda.o hda-loader.o hda-stream.o hda-trace.o \
 				 hda-dsp.o hda-ipc.o hda-ctrl.o hda-pcm.o \
 				 hda-dai.o hda-bus.o \
 				 apl.o cnl.o
+snd-sof-intel-hda-common-$(CONFIG_SND_SOC_SOF_HDA_PROBES) += hda-compress.o
 
 snd-sof-intel-hda-objs := hda-codec.o
 
diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index 2483b15699e7..02218d22e51f 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -73,6 +73,15 @@ const struct snd_sof_dsp_ops sof_apl_ops = {
 	.pcm_trigger	= hda_dsp_pcm_trigger,
 	.pcm_pointer	= hda_dsp_pcm_pointer,
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_PROBES)
+	/* probe callbacks */
+	.probe_assign	= hda_probe_compr_assign,
+	.probe_free	= hda_probe_compr_free,
+	.probe_set_params	= hda_probe_compr_set_params,
+	.probe_trigger	= hda_probe_compr_trigger,
+	.probe_pointer	= hda_probe_compr_pointer,
+#endif
+
 	/* firmware loading */
 	.load_firmware = snd_sof_load_firmware_raw,
 
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 9e2d8afe0535..74d07a7b5e34 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -259,6 +259,15 @@ const struct snd_sof_dsp_ops sof_cnl_ops = {
 	.pcm_trigger	= hda_dsp_pcm_trigger,
 	.pcm_pointer	= hda_dsp_pcm_pointer,
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_PROBES)
+	/* probe callbacks */
+	.probe_assign	= hda_probe_compr_assign,
+	.probe_free	= hda_probe_compr_free,
+	.probe_set_params	= hda_probe_compr_set_params,
+	.probe_trigger	= hda_probe_compr_trigger,
+	.probe_pointer	= hda_probe_compr_pointer,
+#endif
+
 	/* firmware loading */
 	.load_firmware = snd_sof_load_firmware_raw,
 
diff --git a/sound/soc/sof/intel/hda-compress.c b/sound/soc/sof/intel/hda-compress.c
new file mode 100644
index 000000000000..da7de867d0af
--- /dev/null
+++ b/sound/soc/sof/intel/hda-compress.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2019-2020 Intel Corporation. All rights reserved.
+//
+// Author: Cezary Rojewski <cezary.rojewski@intel.com>
+//
+
+#include <sound/hdaudio_ext.h>
+#include <sound/soc.h>
+#include "../sof-priv.h"
+#include "hda.h"
+
+static inline struct hdac_ext_stream *
+hda_compr_get_stream(struct snd_compr_stream *cstream)
+{
+	return cstream->runtime->private_data;
+}
+
+int hda_probe_compr_assign(struct snd_sof_dev *sdev,
+			   struct snd_compr_stream *cstream,
+			   struct snd_soc_dai *dai)
+{
+	struct hdac_ext_stream *stream;
+	struct hdac_bus *bus = sof_to_bus(sdev);
+
+	stream = snd_hdac_ext_cstream_assign(bus, cstream);
+	if (!stream)
+		return -EBUSY;
+
+	hdac_stream(stream)->curr_pos = 0;
+	cstream->runtime->private_data = stream;
+
+	return hdac_stream(stream)->stream_tag;
+}
+
+int hda_probe_compr_free(struct snd_sof_dev *sdev,
+			 struct snd_compr_stream *cstream,
+			 struct snd_soc_dai *dai)
+{
+	struct hdac_ext_stream *stream = hda_compr_get_stream(cstream);
+
+	snd_hdac_stream_cleanup(hdac_stream(stream));
+	hdac_stream(stream)->prepared = 0;
+	snd_hdac_ext_stream_release(stream, HDAC_EXT_STREAM_TYPE_HOST);
+
+	return 0;
+}
+
+int hda_probe_compr_set_params(struct snd_sof_dev *sdev,
+			       struct snd_compr_stream *cstream,
+			       struct snd_compr_params *params,
+			       struct snd_soc_dai *dai)
+{
+	struct hdac_ext_stream *stream = hda_compr_get_stream(cstream);
+	unsigned int format_val;
+	int bps, ret;
+	/* compr params do not store bit depth, default to S32_LE */
+	snd_pcm_format_t format = SNDRV_PCM_FORMAT_S32_LE;
+
+	hdac_stream(stream)->bufsize = 0;
+	hdac_stream(stream)->period_bytes = 0;
+	hdac_stream(stream)->format_val = 0;
+
+	bps = snd_pcm_format_physical_width(format);
+	if (bps < 0)
+		return bps;
+	format_val = snd_hdac_calc_stream_format(params->codec.sample_rate,
+			params->codec.ch_out, format, bps, 0);
+	ret = snd_hdac_stream_set_params(hdac_stream(stream), format_val);
+	if (ret < 0)
+		return ret;
+	ret = snd_hdac_stream_setup(hdac_stream(stream));
+	if (ret < 0)
+		return ret;
+
+	hdac_stream(stream)->prepared = 1;
+
+	return 0;
+}
+
+int hda_probe_compr_trigger(struct snd_sof_dev *sdev,
+			    struct snd_compr_stream *cstream, int cmd,
+			    struct snd_soc_dai *dai)
+{
+	struct hdac_ext_stream *stream = hda_compr_get_stream(cstream);
+	struct hdac_bus *bus = sof_to_bus(sdev);
+	unsigned long cookie;
+
+	if (!hdac_stream(stream)->prepared)
+		return -EPIPE;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+	case SNDRV_PCM_TRIGGER_RESUME:
+		spin_lock_irqsave(&bus->reg_lock, cookie);
+		snd_hdac_stream_start(hdac_stream(stream), true);
+		spin_unlock_irqrestore(&bus->reg_lock, cookie);
+		break;
+
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_STOP:
+		spin_lock_irqsave(&bus->reg_lock, cookie);
+		snd_hdac_stream_stop(hdac_stream(stream));
+		spin_unlock_irqrestore(&bus->reg_lock, cookie);
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int hda_probe_compr_pointer(struct snd_sof_dev *sdev,
+			    struct snd_compr_stream *cstream,
+			    struct snd_compr_tstamp *tstamp,
+			    struct snd_soc_dai *dai)
+{
+	struct hdac_ext_stream *stream = hda_compr_get_stream(cstream);
+	struct snd_soc_pcm_stream *pstream;
+
+	pstream = &dai->driver->capture;
+	tstamp->copied_total = hdac_stream(stream)->curr_pos;
+	tstamp->sampling_rate = snd_pcm_rate_bit_to_rate(pstream->rates);
+
+	return 0;
+}
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index a4d030bfeee1..80aaf4172e34 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -11,6 +11,7 @@
 #ifndef __SOF_INTEL_HDA_H
 #define __SOF_INTEL_HDA_H
 
+#include <sound/compress_driver.h>
 #include <sound/hda_codec.h>
 #include <sound/hdaudio_ext.h>
 #include "shim.h"
@@ -533,6 +534,29 @@ int hda_ipc_pcm_params(struct snd_sof_dev *sdev,
 		       struct snd_pcm_substream *substream,
 		       const struct sof_ipc_pcm_params_reply *reply);
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_PROBES)
+/*
+ * Probe Compress Operations.
+ */
+int hda_probe_compr_assign(struct snd_sof_dev *sdev,
+			   struct snd_compr_stream *cstream,
+			   struct snd_soc_dai *dai);
+int hda_probe_compr_free(struct snd_sof_dev *sdev,
+			 struct snd_compr_stream *cstream,
+			 struct snd_soc_dai *dai);
+int hda_probe_compr_set_params(struct snd_sof_dev *sdev,
+			       struct snd_compr_stream *cstream,
+			       struct snd_compr_params *params,
+			       struct snd_soc_dai *dai);
+int hda_probe_compr_trigger(struct snd_sof_dev *sdev,
+			    struct snd_compr_stream *cstream, int cmd,
+			    struct snd_soc_dai *dai);
+int hda_probe_compr_pointer(struct snd_sof_dev *sdev,
+			    struct snd_compr_stream *cstream,
+			    struct snd_compr_tstamp *tstamp,
+			    struct snd_soc_dai *dai);
+#endif
+
 /*
  * DSP IPC Operations.
  */
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
