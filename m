Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D750C687BE4
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 12:14:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE08EDEF;
	Thu,  2 Feb 2023 12:13:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE08EDEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675336458;
	bh=5ZJypnJsPNPYc9u0thAv+6zbYFLafBHhEjfZWYcpWIY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jiPKo9caf2l4r+OJimh10bq3+0fyCMCIgA/0TCPdLIRvxsrdfWEeum2IrjQ6JfYj2
	 r/NIsIUl3KHPQQI8aDzHDtzBExto4krp9/AK1THIjH/4N/VNDQPJ2tCmDMRogK0Bvj
	 AEENCki4SLN9G4IBTotXMVKs1NWzsb4/6KdA/DKg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BDDCF8057B;
	Thu,  2 Feb 2023 12:11:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E9E3F8056F; Thu,  2 Feb 2023 12:11:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B98FFF80271
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 12:11:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B98FFF80271
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DMuEmgtq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675336305; x=1706872305;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5ZJypnJsPNPYc9u0thAv+6zbYFLafBHhEjfZWYcpWIY=;
 b=DMuEmgtqKbJi19hQyp/XYSKc/AJzps23durFCR3MEEHbPoFJv69gFlWA
 IGJU08JQjUuQQqWdL+cSzPy7onJicDy1qv/JE+ORu+RHpATLqKqkl/DJA
 Ul/2gJ0W2pewnVmLAflmjRNqn/GCXAp1M8w72HKeNyz9HzwWBpxarehC4
 ti5PFkodSgWYvjTGjwBtCUANjn1QL10GzdiowR/3T3GSmQeO/NGI9Og73
 gPdfS6WVkP5+xpDegtphBPgVz/yI4M4+9BW4chPHM7NDAu9C/Qs39rrNm
 HHZoU+xE9drVWGf8mEoA6fK+qoIcn/5cnVTi9crKhzZHCyHus5A/yY/AP Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="414625235"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="414625235"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 03:11:42 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="695747705"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="695747705"
Received: from jpdamery-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.1.104])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 03:11:39 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz
Subject: [PATCH v2 8/9] ASoC: SOF: Intel: mtl: add get_stream_position support
Date: Thu,  2 Feb 2023 13:11:22 +0200
Message-Id: <20230202111123.25231-9-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230202111123.25231-1-peter.ujfalusi@linux.intel.com>
References: <20230202111123.25231-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, rander.wang@intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Rander Wang <rander.wang@intel.com>

Get HDaudio link position for current stream delay calculation
from hda registers.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/mtl.c | 14 ++++++++++++++
 sound/soc/sof/intel/mtl.h |  6 ++++++
 2 files changed, 20 insertions(+)

diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 904ae42534e1..67b8ccbc2e94 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -581,6 +581,18 @@ static int mtl_dsp_disable_interrupts(struct snd_sof_dev *sdev)
 	return mtl_enable_interrupts(sdev, false);
 }
 
+static u64 mtl_dsp_get_stream_hda_link_position(struct snd_sof_dev *sdev,
+						struct snd_soc_component *component,
+						struct snd_pcm_substream *substream)
+{
+	struct hdac_stream *hstream = substream->runtime->private_data;
+	u32 llp_l, llp_u;
+
+	llp_l = snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR, MTL_PPLCLLPL(hstream->index));
+	llp_u = snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR, MTL_PPLCLLPU(hstream->index));
+	return ((u64)llp_u << 32) | llp_l;
+}
+
 /* Meteorlake ops */
 struct snd_sof_dsp_ops sof_mtl_ops;
 EXPORT_SYMBOL_NS(sof_mtl_ops, SND_SOC_SOF_INTEL_HDA_COMMON);
@@ -619,6 +631,8 @@ int sof_mtl_ops_init(struct snd_sof_dev *sdev)
 	/* dsp core get/put */
 	/* TODO: add core_get and core_put */
 
+	sof_mtl_ops.get_stream_position = mtl_dsp_get_stream_hda_link_position;
+
 	sdev->private = devm_kzalloc(sdev->dev, sizeof(struct sof_ipc4_fw_data), GFP_KERNEL);
 	if (!sdev->private)
 		return -ENOMEM;
diff --git a/sound/soc/sof/intel/mtl.h b/sound/soc/sof/intel/mtl.h
index 0fd4e6fe09b8..26418fb08807 100644
--- a/sound/soc/sof/intel/mtl.h
+++ b/sound/soc/sof/intel/mtl.h
@@ -6,6 +6,12 @@
  * Copyright(c) 2020-2022 Intel Corporation. All rights reserved.
  */
 
+/* HDA Registers */
+#define MTL_PPLCLLPL_BASE		0x948
+#define MTL_PPLCLLPU_STRIDE		0x10
+#define MTL_PPLCLLPL(x)			(MTL_PPLCLLPL_BASE + (x) * MTL_PPLCLLPU_STRIDE)
+#define MTL_PPLCLLPU(x)			(MTL_PPLCLLPL_BASE + 0x4 + (x) * MTL_PPLCLLPU_STRIDE)
+
 /* DSP Registers */
 #define MTL_HFDSSCS			0x1000
 #define MTL_HFDSSCS_SPA_MASK		BIT(16)
-- 
2.39.1

