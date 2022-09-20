Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 530435BE6DF
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 15:19:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72BCD3E8;
	Tue, 20 Sep 2022 15:18:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72BCD3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663679969;
	bh=BT8pmOMneLRWkd+hKvOMR7fBMS5FXlC8+PDxa0cZztA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CuDauQpur53j+hbjkzzeASTQf4MSjcmVJxxr/lkT2ghI+3HXYQBoAYVuB2BKEw1wK
	 cBbcDZ66UBmTTQgNDj2aSCmXJ1sqZff/5KvZHdl7gn7XacRWyRjbzUy7/pyxOQPkFi
	 KG5HyVddXpsww+V+2vPASGNGsYQpy03kQZsGaoPk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C38AF80552;
	Tue, 20 Sep 2022 15:17:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1619AF800C9; Tue, 20 Sep 2022 15:17:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA2ABF8012B
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 15:17:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA2ABF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Sd84FKS8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663679860; x=1695215860;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BT8pmOMneLRWkd+hKvOMR7fBMS5FXlC8+PDxa0cZztA=;
 b=Sd84FKS856tLtsEOt0c68ck4wlvULgD4bzJa6fG7I3RSge50X7tnP/vk
 LCqRo9hkXA9SSf0OqH7pXa2+GPuJXFRvzXA8qqlkb3bz4+lj10wSXBa2E
 nI+l1L0c3pw2TQm2F3fcPjhCjl7CUuPLFC/lgev2kMq/AKJP60GcKJ7Wo
 JnpIWW8AVBfbvPXvzAaecyWSNIfxYWjpCj0rNFnPOAsnqGMQmu/s/KQ/K
 L2aegpQTyhjQ1GGVYZ9mmuoUK6KdvPRItc8+125MRN8xOpoY0CapdrMjg
 TKQGxXrGr3SGYpa0u91VloDVJqagI87Yzp9cK/ESvyOE/VKji44C9amrj g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="282719170"
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; d="scan'208";a="282719170"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 06:17:27 -0700
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; d="scan'208";a="652089717"
Received: from atcamara-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.209.87])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 06:17:24 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 4/4] ASoC: SOF: Intel: add ops for SKL/KBL
Date: Tue, 20 Sep 2022 15:17:00 +0200
Message-Id: <20220920131700.133103-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920131700.133103-1-pierre-louis.bossart@linux.intel.com>
References: <20220920131700.133103-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

Add ops and ops_init for SKL and KBL.
Tested on Dell XPS-13-9350 and KBL NUC.

Note: currently only SOF_IPC4_MTRACE_INTEL_CAVS_2 type is supported by
the ipc4-mtrace driver, which is used by CAVS 2.x platforms (ICL, TGL,
ADL) and ACE (MTL).

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/pci-skl.c |  2 ++
 sound/soc/sof/intel/skl.c     | 64 ++++++++++++++++++++++++++++++-----
 2 files changed, 57 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sof/intel/pci-skl.c b/sound/soc/sof/intel/pci-skl.c
index 2b803f8b32e99..3a99dc444f92e 100644
--- a/sound/soc/sof/intel/pci-skl.c
+++ b/sound/soc/sof/intel/pci-skl.c
@@ -37,6 +37,7 @@ static struct sof_dev_desc skl_desc = {
 	},
 	.nocodec_tplg_filename = "sof-skl-nocodec.tplg",
 	.ops = &sof_skl_ops,
+	.ops_init = sof_skl_ops_init,
 };
 
 static struct sof_dev_desc kbl_desc = {
@@ -59,6 +60,7 @@ static struct sof_dev_desc kbl_desc = {
 	},
 	.nocodec_tplg_filename = "sof-kbl-nocodec.tplg",
 	.ops = &sof_skl_ops,
+	.ops_init = sof_skl_ops_init,
 };
 
 /* PCI IDs */
diff --git a/sound/soc/sof/intel/skl.c b/sound/soc/sof/intel/skl.c
index 446a7afddfdbe..f05905e00368c 100644
--- a/sound/soc/sof/intel/skl.c
+++ b/sound/soc/sof/intel/skl.c
@@ -23,8 +23,10 @@
 #include <sound/hdaudio_ext.h>
 #include <sound/pcm_params.h>
 #include <sound/sof.h>
+#include <sound/sof/ext_manifest4.h>
 
 #include "../sof-priv.h"
+#include "../ipc4-priv.h"
 #include "../ops.h"
 #include "hda.h"
 #include "../sof-audio.h"
@@ -37,21 +39,65 @@ static const __maybe_unused struct snd_sof_debugfs_map skl_dsp_debugfs[] = {
 	{"dsp", HDA_DSP_BAR,  0, 0x10000},
 };
 
-static int __maybe_unused skl_dsp_ipc_get_window_offset(struct snd_sof_dev *sdev, u32 id)
+static int skl_dsp_ipc_get_window_offset(struct snd_sof_dev *sdev, u32 id)
 {
 	return SRAM_MEMORY_WINDOW_BASE + (0x2000 * id);
 }
 
+static int skl_dsp_ipc_get_mailbox_offset(struct snd_sof_dev *sdev)
+{
+	return SRAM_MEMORY_WINDOW_BASE + 0x1000;
+}
+
 /* skylake ops */
-struct snd_sof_dsp_ops sof_skl_ops = {
-	/*
-	 * the ops are left empty at this stage since the SOF releases do not
-	 * support SKL/KBL.
-	 * The ops will be populated when support for the Intel IPC4 is added
-	 * to the SOF driver
-	 */
+struct snd_sof_dsp_ops sof_skl_ops;
+EXPORT_SYMBOL_NS(sof_skl_ops, SND_SOC_SOF_INTEL_HDA_COMMON);
+
+int sof_skl_ops_init(struct snd_sof_dev *sdev)
+{
+	struct sof_ipc4_fw_data *ipc4_data;
+
+	/* common defaults */
+	memcpy(&sof_skl_ops, &sof_hda_common_ops, sizeof(struct snd_sof_dsp_ops));
+
+	/* probe/remove/shutdown */
+	sof_skl_ops.shutdown	= hda_dsp_shutdown;
+
+	sdev->private = devm_kzalloc(sdev->dev, sizeof(*ipc4_data), GFP_KERNEL);
+	if (!sdev->private)
+		return -ENOMEM;
+
+	ipc4_data = sdev->private;
+	ipc4_data->manifest_fw_hdr_offset = SOF_MAN4_FW_HDR_OFFSET_CAVS_1_5;
+
+	ipc4_data->mtrace_type = SOF_IPC4_MTRACE_INTEL_CAVS_1_5;
+
+	sof_skl_ops.get_window_offset = skl_dsp_ipc_get_window_offset;
+	sof_skl_ops.get_mailbox_offset = skl_dsp_ipc_get_mailbox_offset;
+
+	/* doorbell */
+	sof_skl_ops.irq_thread	= hda_dsp_ipc4_irq_thread;
+
+	/* ipc */
+	sof_skl_ops.send_msg	= hda_dsp_ipc4_send_msg;
+
+	/* set DAI driver ops */
+	hda_set_dai_drv_ops(sdev, &sof_skl_ops);
+
+	/* debug */
+	sof_skl_ops.debug_map	= skl_dsp_debugfs;
+	sof_skl_ops.debug_map_count	= ARRAY_SIZE(skl_dsp_debugfs);
+	sof_skl_ops.ipc_dump	= hda_ipc_dump;
+
+	/* firmware run */
+	sof_skl_ops.run = hda_dsp_cl_boot_firmware_skl;
+
+	/* pre/post fw run */
+	sof_skl_ops.post_fw_run = hda_dsp_post_fw_run;
+
+	return 0;
 };
-EXPORT_SYMBOL(sof_skl_ops);
+EXPORT_SYMBOL_NS(sof_skl_ops_init, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 const struct sof_intel_dsp_desc skl_chip_info = {
 	.cores_num = 2,
-- 
2.34.1

