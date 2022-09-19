Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C1E5BCBF8
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 14:38:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14785163E;
	Mon, 19 Sep 2022 14:38:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14785163E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663591138;
	bh=UKoV2bzXCLNUU+R/bmDWIWa+qfELb3R32OMts7LYeYA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V+gu8jnnHUUHwED+yten2l3jlJXE4tfhHPgtnj37M/GKxNbpn9VCZxRIyIdhFKou0
	 aXXrKe5/tZ8rnaiVX6wgmLU8H5K/sRzvFT5m+UFGJr9GX/cdYtObqxiion8KWcmtiS
	 Vg6s4l0/M2lTdvYSHIoLFyJIL2jiWcFdw2k/aDDM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83F13F80558;
	Mon, 19 Sep 2022 14:37:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6919FF8054A; Mon, 19 Sep 2022 14:37:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5B3DF8053B
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 14:37:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5B3DF8053B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="jHpi393k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663591022; x=1695127022;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UKoV2bzXCLNUU+R/bmDWIWa+qfELb3R32OMts7LYeYA=;
 b=jHpi393kIIT+iFJGz9qwoA2pWQY7pRHr++jrnmR/vu+jzzgdt8mQjpFA
 B6sKO2244fkFtzTArTsbbfoxzNdvCWvHdvQlb40JkX1fNq3jEvvooS00N
 Glr+rlyL88CoXkbHQm0+AL2yLi9+ttBErJUJNTMwoczFJXK+Q5AOZvroz
 FFz/QQAQU6B+vNwvDXEFL2ElV/HLH0epD84dBcYOvf328z9J1hH0TUTNq
 NmfOHABG5816I0yMRcF+ImYvwUfrJ/jMNmL2wixx+/ir1j0VwfxPXmpy4
 u3lGyUSpltDRGfpq9ZAnbnRvyWhkWIVdRa0s3yzjidLG7XfroEusxWfjo A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="300760511"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="300760511"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 05:37:00 -0700
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="707549807"
Received: from amagnus-mobl2.ger.corp.intel.com (HELO pbossart-mobl3.home)
 ([10.249.46.168])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 05:36:55 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/4] ASoC: SOF: Intel: add ops for SKL/KBL
Date: Mon, 19 Sep 2022 14:36:17 +0200
Message-Id: <20220919123617.44096-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220919123617.44096-1-pierre-louis.bossart@linux.intel.com>
References: <20220919123617.44096-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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
Tested on Dell XPS-13-9350

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/pci-skl.c |  2 ++
 sound/soc/sof/intel/skl.c     | 62 ++++++++++++++++++++++++++++++-----
 2 files changed, 55 insertions(+), 9 deletions(-)

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
index 446a7afddfdbe..12c60dc75767b 100644
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
@@ -37,21 +39,63 @@ static const __maybe_unused struct snd_sof_debugfs_map skl_dsp_debugfs[] = {
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

