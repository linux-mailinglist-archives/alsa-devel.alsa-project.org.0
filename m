Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 232E26AE1B7
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 15:08:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8179C1478;
	Tue,  7 Mar 2023 15:07:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8179C1478
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678198081;
	bh=vtXLWNbD3OV37Bfgy6FBFsrZOWr6YlSoTGI9IBBm7yc=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kidMCJAJC9ZwlJ7JpfOKKjhkCNC1uAygDoTon8rgJY4tDkN+vHfdyXXaWtt9Ap6Ni
	 +l8PkWoaU/bM7D2x/qXWE0p8CZ7KgWL4J5eDU1m4KOiVPhbf8FXo7T0lTxxUerrgun
	 CzdGBCTxhmmrBYdpwmz0cQq7atQbQEgg+aqmHLo4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F933F8057A;
	Tue,  7 Mar 2023 15:04:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2EA00F80533; Tue,  7 Mar 2023 15:04:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 06165F800C9
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 15:04:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06165F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BezuHFiQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678197877; x=1709733877;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vtXLWNbD3OV37Bfgy6FBFsrZOWr6YlSoTGI9IBBm7yc=;
  b=BezuHFiQAiQ5hMVFhsZc/XYjy1QUxfqyOQKTn1HpupOAjT8OpyEuw1Wf
   /prFt63/p6VU2Uaz6iA+vkH7FkC/nChSL0EgAy6TAclCmzVdX0buxH3qG
   xWEiDJxhHvu8q9khy5g1Yd6+GsgwjmVRnMCStw/YRC4S9IeU5sgshOytZ
   yDR3Jub6PAiXTDRSN/ehjv33DWbbCdxEDpYGdCG49FGNtHL5N3DDw53LM
   2MigDrv6P04jV5PE49pqF2+MyCVcl+RwHAuXtaAbQ0o7Znc5wTlaoVtTr
   xQzXUr6kHtHp7MVsJ4PZTxOAsxFYY/Q4jqkihUpAorSnXe/XDHVUIpHt2
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="316255264"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400";
   d="scan'208";a="316255264"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 06:04:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="786706970"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400";
   d="scan'208";a="786706970"
Received: from rganesh-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.47.75])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 06:04:32 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 08/14] ASoC: SOF: Intel: hda-dai: Define and set the HDA DAI
 widget DMA ops
Date: Tue,  7 Mar 2023 16:04:29 +0200
Message-Id: <20230307140435.2808-9-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307140435.2808-1-peter.ujfalusi@linux.intel.com>
References: <20230307140435.2808-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NNQNURDHF6TM5OAZ5KIRHN75T4LEE6SN
X-Message-ID-Hash: NNQNURDHF6TM5OAZ5KIRHN75T4LEE6SN
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, yung-chuan.liao@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NNQNURDHF6TM5OAZ5KIRHN75T4LEE6SN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Define and set the get_hext_stream, assign_hext_stream and
release_hext_stream DMA ops for HDA DAIs.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/Makefile      |   2 +-
 sound/soc/sof/intel/hda-dai-ops.c | 183 +++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda-dai.c     | 188 +++++++++++-------------------
 sound/soc/sof/intel/hda.h         |   4 +
 4 files changed, 259 insertions(+), 118 deletions(-)
 create mode 100644 sound/soc/sof/intel/hda-dai-ops.c

diff --git a/sound/soc/sof/intel/Makefile b/sound/soc/sof/intel/Makefile
index 8201cbdd654c..38ab86b6a9fe 100644
--- a/sound/soc/sof/intel/Makefile
+++ b/sound/soc/sof/intel/Makefile
@@ -5,7 +5,7 @@ snd-sof-acpi-intel-bdw-objs := bdw.o
 
 snd-sof-intel-hda-common-objs := hda.o hda-loader.o hda-stream.o hda-trace.o \
 				 hda-dsp.o hda-ipc.o hda-ctrl.o hda-pcm.o \
-				 hda-dai.o hda-bus.o hda-mlink.o \
+				 hda-dai.o hda-dai-ops.o hda-bus.o hda-mlink.o \
 				 skl.o hda-loader-skl.o \
 				 apl.o cnl.o tgl.o icl.o mtl.o hda-common-ops.o
 
diff --git a/sound/soc/sof/intel/hda-dai-ops.c b/sound/soc/sof/intel/hda-dai-ops.c
new file mode 100644
index 000000000000..9dfcafeab9e4
--- /dev/null
+++ b/sound/soc/sof/intel/hda-dai-ops.c
@@ -0,0 +1,183 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2022 Intel Corporation. All rights reserved.
+
+#include <sound/pcm_params.h>
+#include <sound/hdaudio_ext.h>
+#include <sound/sof/ipc4/header.h>
+#include <uapi/sound/sof/header.h>
+#include "../ipc4-priv.h"
+#include "../ipc4-topology.h"
+#include "../sof-priv.h"
+#include "../sof-audio.h"
+#include "hda.h"
+
+/* These ops are only applicable for the HDA DAI's in their current form */
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
+/*
+ * This function checks if the host dma channel corresponding
+ * to the link DMA stream_tag argument is assigned to one
+ * of the FEs connected to the BE DAI.
+ */
+static bool hda_check_fes(struct snd_soc_pcm_runtime *rtd,
+			  int dir, int stream_tag)
+{
+	struct snd_pcm_substream *fe_substream;
+	struct hdac_stream *fe_hstream;
+	struct snd_soc_dpcm *dpcm;
+
+	for_each_dpcm_fe(rtd, dir, dpcm) {
+		fe_substream = snd_soc_dpcm_get_substream(dpcm->fe, dir);
+		fe_hstream = fe_substream->runtime->private_data;
+		if (fe_hstream->stream_tag == stream_tag)
+			return true;
+	}
+
+	return false;
+}
+
+static struct hdac_ext_stream *
+hda_link_stream_assign(struct hdac_bus *bus, struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct sof_intel_hda_stream *hda_stream;
+	const struct sof_intel_dsp_desc *chip;
+	struct snd_sof_dev *sdev;
+	struct hdac_ext_stream *res = NULL;
+	struct hdac_stream *hstream = NULL;
+
+	int stream_dir = substream->stream;
+
+	if (!bus->ppcap) {
+		dev_err(bus->dev, "stream type not supported\n");
+		return NULL;
+	}
+
+	spin_lock_irq(&bus->reg_lock);
+	list_for_each_entry(hstream, &bus->stream_list, list) {
+		struct hdac_ext_stream *hext_stream =
+			stream_to_hdac_ext_stream(hstream);
+		if (hstream->direction != substream->stream)
+			continue;
+
+		hda_stream = hstream_to_sof_hda_stream(hext_stream);
+		sdev = hda_stream->sdev;
+		chip = get_chip_info(sdev->pdata);
+
+		/* check if link is available */
+		if (!hext_stream->link_locked) {
+			/*
+			 * choose the first available link for platforms that do not have the
+			 * PROCEN_FMT_QUIRK set.
+			 */
+			if (!(chip->quirks & SOF_INTEL_PROCEN_FMT_QUIRK)) {
+				res = hext_stream;
+				break;
+			}
+
+			if (hstream->opened) {
+				/*
+				 * check if the stream tag matches the stream
+				 * tag of one of the connected FEs
+				 */
+				if (hda_check_fes(rtd, stream_dir,
+						  hstream->stream_tag)) {
+					res = hext_stream;
+					break;
+				}
+			} else {
+				res = hext_stream;
+
+				/*
+				 * This must be a hostless stream.
+				 * So reserve the host DMA channel.
+				 */
+				hda_stream->host_reserved = 1;
+				break;
+			}
+		}
+	}
+
+	if (res) {
+		/* Make sure that host and link DMA is decoupled. */
+		snd_hdac_ext_stream_decouple_locked(bus, res, true);
+
+		res->link_locked = 1;
+		res->link_substream = substream;
+	}
+	spin_unlock_irq(&bus->reg_lock);
+
+	return res;
+}
+
+static struct hdac_ext_stream *hda_get_hext_stream(struct snd_sof_dev *sdev,
+						   struct snd_soc_dai *cpu_dai,
+						   struct snd_pcm_substream *substream)
+{
+	return snd_soc_dai_get_dma_data(cpu_dai, substream);
+}
+
+static struct hdac_ext_stream *hda_assign_hext_stream(struct snd_sof_dev *sdev,
+						      struct snd_soc_dai *cpu_dai,
+						      struct snd_pcm_substream *substream)
+{
+	struct hdac_ext_stream *hext_stream;
+
+	hext_stream = hda_link_stream_assign(sof_to_bus(sdev), substream);
+	if (!hext_stream)
+		return NULL;
+
+	snd_soc_dai_set_dma_data(cpu_dai, substream, (void *)hext_stream);
+
+	return hext_stream;
+}
+
+static void hda_release_hext_stream(struct snd_sof_dev *sdev, struct snd_soc_dai *cpu_dai,
+				    struct snd_pcm_substream *substream)
+{
+	struct hdac_ext_stream *hext_stream = hda_get_hext_stream(sdev, cpu_dai, substream);
+
+	snd_soc_dai_set_dma_data(cpu_dai, substream, NULL);
+	snd_hdac_ext_stream_release(hext_stream, HDAC_EXT_STREAM_TYPE_LINK);
+}
+
+static const struct hda_dai_widget_dma_ops hda_dma_ops = {
+	.get_hext_stream = hda_get_hext_stream,
+	.assign_hext_stream = hda_assign_hext_stream,
+	.release_hext_stream = hda_release_hext_stream,
+};
+
+#endif
+
+const struct hda_dai_widget_dma_ops *
+hda_select_dai_widget_ops(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
+{
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
+	struct snd_sof_dai *sdai = swidget->private;
+
+	switch (sdev->pdata->ipc_type) {
+	case SOF_IPC:
+	{
+		struct sof_dai_private_data *private = sdai->private;
+
+		if (private->dai_config->type == SOF_DAI_INTEL_HDA)
+			return &hda_dma_ops;
+		break;
+	}
+	case SOF_INTEL_IPC4:
+	{
+		struct sof_ipc4_copier *ipc4_copier = sdai->private;
+
+		if (ipc4_copier->dai_type == SOF_DAI_INTEL_HDA)
+			return &hda_dma_ops;
+		break;
+	}
+	default:
+		break;
+	}
+#endif
+	return NULL;
+}
diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 49f25e55b15d..963c40d8a10b 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -29,101 +29,30 @@ MODULE_PARM_DESC(sof_use_tplg_nhlt, "SOF topology nhlt override");
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 
-/*
- * This function checks if the host dma channel corresponding
- * to the link DMA stream_tag argument is assigned to one
- * of the FEs connected to the BE DAI.
- */
-static bool hda_check_fes(struct snd_soc_pcm_runtime *rtd,
-			  int dir, int stream_tag)
-{
-	struct snd_pcm_substream *fe_substream;
-	struct hdac_stream *fe_hstream;
-	struct snd_soc_dpcm *dpcm;
-
-	for_each_dpcm_fe(rtd, dir, dpcm) {
-		fe_substream = snd_soc_dpcm_get_substream(dpcm->fe, dir);
-		fe_hstream = fe_substream->runtime->private_data;
-		if (fe_hstream->stream_tag == stream_tag)
-			return true;
-	}
-
-	return false;
-}
-
-static struct hdac_ext_stream *
-hda_link_stream_assign(struct hdac_bus *bus,
-		       struct snd_pcm_substream *substream)
+static const struct hda_dai_widget_dma_ops *
+hda_dai_get_ops(struct snd_pcm_substream *substream, struct snd_soc_dai *cpu_dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct sof_intel_hda_stream *hda_stream;
-	const struct sof_intel_dsp_desc *chip;
-	struct snd_sof_dev *sdev;
-	struct hdac_ext_stream *res = NULL;
-	struct hdac_stream *hstream = NULL;
-
-	int stream_dir = substream->stream;
+	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(cpu_dai, substream->stream);
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(cpu_dai->component);
+	struct snd_sof_widget *swidget = w->dobj.private;
+	struct snd_sof_dai *sdai = swidget->private;
 
-	if (!bus->ppcap) {
-		dev_err(bus->dev, "stream type not supported\n");
-		return NULL;
-	}
+	/* select and set the DAI widget ops if not set already */
+	if (!sdai->platform_private) {
+		const struct hda_dai_widget_dma_ops *ops =
+			hda_select_dai_widget_ops(sdev, swidget);
 
-	spin_lock_irq(&bus->reg_lock);
-	list_for_each_entry(hstream, &bus->stream_list, list) {
-		struct hdac_ext_stream *hext_stream =
-			stream_to_hdac_ext_stream(hstream);
-		if (hstream->direction != substream->stream)
-			continue;
-
-		hda_stream = hstream_to_sof_hda_stream(hext_stream);
-		sdev = hda_stream->sdev;
-		chip = get_chip_info(sdev->pdata);
-
-		/* check if link is available */
-		if (!hext_stream->link_locked) {
-			/*
-			 * choose the first available link for platforms that do not have the
-			 * PROCEN_FMT_QUIRK set.
-			 */
-			if (!(chip->quirks & SOF_INTEL_PROCEN_FMT_QUIRK)) {
-				res = hext_stream;
-				break;
-			}
-
-			if (hstream->opened) {
-				/*
-				 * check if the stream tag matches the stream
-				 * tag of one of the connected FEs
-				 */
-				if (hda_check_fes(rtd, stream_dir,
-						  hstream->stream_tag)) {
-					res = hext_stream;
-					break;
-				}
-			} else {
-				res = hext_stream;
-
-				/*
-				 * This must be a hostless stream.
-				 * So reserve the host DMA channel.
-				 */
-				hda_stream->host_reserved = 1;
-				break;
-			}
-		}
-	}
+		if (!ops)
+			return NULL;
 
-	if (res) {
-		/* Make sure that host and link DMA is decoupled. */
-		snd_hdac_ext_stream_decouple_locked(bus, res, true);
+		/* check if mandatory ops are set */
+		if (!ops || !ops->get_hext_stream)
+			return NULL;
 
-		res->link_locked = 1;
-		res->link_substream = substream;
+		sdai->platform_private = ops;
 	}
-	spin_unlock_irq(&bus->reg_lock);
 
-	return res;
+	return sdai->platform_private;
 }
 
 static int hda_link_dma_cleanup(struct snd_pcm_substream *substream,
@@ -131,6 +60,8 @@ static int hda_link_dma_cleanup(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *cpu_dai,
 				struct snd_soc_dai *codec_dai)
 {
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(cpu_dai->component);
+	const struct hda_dai_widget_dma_ops *ops = hda_dai_get_ops(substream, cpu_dai);
 	struct hdac_stream *hstream = &hext_stream->hstream;
 	struct hdac_bus *bus = hstream->bus;
 	struct sof_intel_hda_stream *hda_stream;
@@ -145,8 +76,10 @@ static int hda_link_dma_cleanup(struct snd_pcm_substream *substream,
 		stream_tag = hdac_stream(hext_stream)->stream_tag;
 		snd_hdac_ext_bus_link_clear_stream_id(hlink, stream_tag);
 	}
-	snd_soc_dai_set_dma_data(cpu_dai, substream, NULL);
-	snd_hdac_ext_stream_release(hext_stream, HDAC_EXT_STREAM_TYPE_LINK);
+
+	if (ops->release_hext_stream)
+		ops->release_hext_stream(sdev, cpu_dai, substream);
+
 	hext_stream->link_prepared = 0;
 
 	/* free the host DMA channel reserved by hostless streams */
@@ -159,6 +92,7 @@ static int hda_link_dma_cleanup(struct snd_pcm_substream *substream,
 static int hda_link_dma_hw_params(struct snd_pcm_substream *substream,
 				  struct snd_pcm_hw_params *params, struct snd_soc_dai *cpu_dai)
 {
+	const struct hda_dai_widget_dma_ops *ops = hda_dai_get_ops(substream, cpu_dai);
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	struct hdac_ext_stream *hext_stream;
@@ -168,7 +102,7 @@ static int hda_link_dma_hw_params(struct snd_pcm_substream *substream,
 	struct hdac_bus *bus;
 	unsigned int format_val;
 	unsigned int link_bps;
-	unsigned char stream_tag;
+	int stream_tag;
 
 	sdev = snd_soc_component_get_drvdata(cpu_dai->component);
 	bus = sof_to_bus(sdev);
@@ -177,15 +111,16 @@ static int hda_link_dma_hw_params(struct snd_pcm_substream *substream,
 	if (!hlink)
 		return -EINVAL;
 
-	hext_stream = snd_soc_dai_get_dma_data(cpu_dai, substream);
-	if (!hext_stream) {
-		hext_stream = hda_link_stream_assign(bus, substream);
-		if (!hext_stream)
-			return -EBUSY;
+	hext_stream = ops->get_hext_stream(sdev, cpu_dai, substream);
 
-		snd_soc_dai_set_dma_data(cpu_dai, substream, (void *)hext_stream);
+	if (!hext_stream) {
+		if (ops->assign_hext_stream)
+			hext_stream = ops->assign_hext_stream(sdev, cpu_dai, substream);
 	}
 
+	if (!hext_stream)
+		return -EBUSY;
+
 	hstream = &hext_stream->hstream;
 	stream_tag = hstream->stream_tag;
 
@@ -226,11 +161,15 @@ static int hda_link_dma_prepare(struct snd_pcm_substream *substream, struct snd_
 static int hda_link_dma_trigger(struct snd_pcm_substream *substream, struct snd_soc_dai *cpu_dai,
 				int cmd)
 {
+	const struct hda_dai_widget_dma_ops *ops = hda_dai_get_ops(substream, cpu_dai);
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(cpu_dai->component);
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct hdac_ext_stream *hext_stream = snd_soc_dai_get_dma_data(cpu_dai, substream);
+	struct hdac_ext_stream *hext_stream;
 	int ret;
 
+	hext_stream = ops->get_hext_stream(sdev, cpu_dai, substream);
+
 	if (!hext_stream)
 		return 0;
 
@@ -259,11 +198,18 @@ static int hda_link_dma_trigger(struct snd_pcm_substream *substream, struct snd_
 
 static int hda_link_dma_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *cpu_dai)
 {
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(cpu_dai->component);
+	const struct hda_dai_widget_dma_ops *ops = hda_dai_get_ops(substream, cpu_dai);
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	struct hdac_ext_stream *hext_stream;
 
-	hext_stream = snd_soc_dai_get_dma_data(cpu_dai, substream);
+	if (!ops) {
+		dev_err(sdev->dev, "DAI widget ops not set\n");
+		return -EINVAL;
+	}
+
+	hext_stream = ops->get_hext_stream(sdev, cpu_dai, substream);
 	if (!hext_stream)
 		return 0;
 
@@ -288,18 +234,18 @@ static int hda_dai_hw_params_update(struct snd_pcm_substream *substream,
 				    struct snd_pcm_hw_params *params,
 				    struct snd_soc_dai *dai)
 {
+	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(dai, substream->stream);
+	const struct hda_dai_widget_dma_ops *ops = hda_dai_get_ops(substream, dai);
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(dai->component);
 	struct hdac_ext_stream *hext_stream;
-	struct snd_soc_dapm_widget *w;
 	int stream_tag;
 
-	hext_stream = snd_soc_dai_get_dma_data(dai, substream);
+	hext_stream = ops->get_hext_stream(sdev, dai, substream);
 	if (!hext_stream)
 		return -EINVAL;
 
 	stream_tag = hdac_stream(hext_stream)->stream_tag;
 
-	w = snd_soc_dai_get_widget(dai, substream->stream);
-
 	/* set up the DAI widget and send the DAI_CONFIG with the new tag */
 	return hda_dai_widget_update(w, stream_tag - 1, true);
 }
@@ -308,10 +254,17 @@ static int hda_dai_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params,
 			     struct snd_soc_dai *dai)
 {
-	struct hdac_ext_stream *hext_stream =
-				snd_soc_dai_get_dma_data(dai, substream);
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(dai->component);
+	const struct hda_dai_widget_dma_ops *ops = hda_dai_get_ops(substream, dai);
+	struct hdac_ext_stream *hext_stream;
 	int ret;
 
+	if (!ops) {
+		dev_err(sdev->dev, "DAI widget ops not set\n");
+		return -EINVAL;
+	}
+
+	hext_stream = ops->get_hext_stream(sdev, dai, substream);
 	if (hext_stream && hext_stream->link_prepared)
 		return 0;
 
@@ -343,13 +296,14 @@ static int hda_dai_config_pause_push_ipc(struct snd_soc_dapm_widget *w)
 
 static int hda_dai_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
-	struct hdac_ext_stream *hext_stream =
-				snd_soc_dai_get_dma_data(dai, substream);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(dai->component);
+	const struct hda_dai_widget_dma_ops *ops = hda_dai_get_ops(substream, dai);
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct hdac_ext_stream *hext_stream;
 	int stream = substream->stream;
 	int ret;
 
+	hext_stream = ops->get_hext_stream(sdev, dai, substream);
 	if (hext_stream && hext_stream->link_prepared)
 		return 0;
 
@@ -418,27 +372,27 @@ static int ipc3_hda_dai_trigger(struct snd_pcm_substream *substream,
 static int ipc4_hda_dai_trigger(struct snd_pcm_substream *substream,
 				int cmd, struct snd_soc_dai *dai)
 {
-	struct hdac_ext_stream *hext_stream = snd_soc_dai_get_dma_data(dai, substream);
+	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(dai, substream->stream);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(dai->component);
-	struct snd_sof_widget *pipe_widget;
-	struct sof_ipc4_pipeline *pipeline;
+	const struct hda_dai_widget_dma_ops *ops = hda_dai_get_ops(substream, dai);
+	struct snd_sof_widget *swidget = w->dobj.private;
+	struct hdac_ext_stream *hext_stream;
+	struct snd_sof_widget *pipe_widget = swidget->spipe->pipe_widget;
+	struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
 	struct snd_soc_pcm_runtime *rtd;
-	struct snd_sof_widget *swidget;
-	struct snd_soc_dapm_widget *w;
 	struct snd_soc_dai *codec_dai;
 	int ret;
 
 	dev_dbg(dai->dev, "cmd=%d dai %s direction %d\n", cmd,
 		dai->name, substream->stream);
 
+	hext_stream = ops->get_hext_stream(sdev, dai, substream);
+	if (!hext_stream)
+		return -EINVAL;
+
 	rtd = asoc_substream_to_rtd(substream);
 	codec_dai = asoc_rtd_to_codec(rtd, 0);
 
-	w = snd_soc_dai_get_widget(dai, substream->stream);
-	swidget = w->dobj.private;
-	pipe_widget = swidget->spipe->pipe_widget;
-	pipeline = pipe_widget->private;
-
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index c6243827f8d0..e0469f86fa63 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -959,4 +959,8 @@ struct hda_dai_widget_dma_ops {
 	int (*post_trigger)(struct snd_sof_dev *sdev, struct snd_soc_dai *cpu_dai,
 			    struct snd_pcm_substream *substream, int cmd);
 };
+
+const struct hda_dai_widget_dma_ops *
+hda_select_dai_widget_ops(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget);
+
 #endif
-- 
2.39.2

