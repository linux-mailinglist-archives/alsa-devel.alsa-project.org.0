Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B068E5E7C02
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 15:37:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC06C825;
	Fri, 23 Sep 2022 15:36:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC06C825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663940231;
	bh=HvYNsvlok+RU+Wk3bol1LDURCPosUvc8hrylzY0u54c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n0kYqNg68Gc6Nw/xwhbvQovKNsZACpWYhJku12tDy+TyO8QoGKZRELcKJNI1Rrgwo
	 6WDYMD0JnNEdLeR5Yq/qjP+K/Ra9SKNnZQoPAzRu7a08P7O2WtzLtzptXtT3gI8k2l
	 FQnMgwYKK0t1SyOK5UJ1U5b8+mWO9/Pa7GpuSrP4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5BAEF8053B;
	Fri, 23 Sep 2022 15:36:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7DA6F80538; Fri, 23 Sep 2022 15:36:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1EE3CF80124
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 15:36:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EE3CF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="e2e5Ccbq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663940173; x=1695476173;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HvYNsvlok+RU+Wk3bol1LDURCPosUvc8hrylzY0u54c=;
 b=e2e5CcbqnbZRfaL33YOn4dN4N04H4tpCqPZSCYjqohB66i9YzKQRBz2K
 dy9Z7ZO9uqogp/ulEc0G9Zh/dudcnfj/hmlPkbs5/rnhfQw7OAiRRyTnr
 ORXQm8cIId3Knmf2niXzvRRnQx2bLCRvl2C6moVpQ5GRD+k5CAT5uRK+p
 FtM+PZVOKEhCXLqEarIFzcLyAId/HGfcZ87Hih+6d+1kgVtdLIlgfM88k
 kfqtrzsmIbyM9TFOJ0f/ZCC1lZL+gz6ZAU7B1abHLIlkbMORQbjItF+G2
 vyWLSQPPYQJ8W7zs9BOzs7+R8xKf57I4rOsJ0y+mAbXc7vkER03y2kHDf Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10479"; a="300575612"
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="300575612"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 06:36:10 -0700
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="571375291"
Received: from acarr-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.3.209])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 06:36:07 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 1/6] ASoC: SOF: Intel: cnl: Add separate ops for ipc_dump for
 IPC4
Date: Fri, 23 Sep 2022 16:36:11 +0300
Message-Id: <20220923133616.26267-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923133616.26267-1-peter.ujfalusi@linux.intel.com>
References: <20220923133616.26267-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, rander.wang@intel.com
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

The use of the IPC registers are different between IPC3 and IPC4.
The ipc_dump needs to use different prints depending on the used IPC
protocol.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/sof/intel/cnl.c     | 28 +++++++++++++++++++++++++++-
 sound/soc/sof/intel/hda-ipc.h |  1 +
 sound/soc/sof/intel/icl.c     |  7 ++++++-
 sound/soc/sof/intel/tgl.c     |  7 ++++++-
 4 files changed, 40 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 180001d0a38a..1e71f6dc604e 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -332,6 +332,27 @@ void cnl_ipc_dump(struct snd_sof_dev *sdev)
 		hipcida, hipctdr, hipcctl);
 }
 
+void cnl_ipc4_dump(struct snd_sof_dev *sdev)
+{
+	u32 hipcidr, hipcidd, hipcida, hipctdr, hipctdd, hipctda, hipcctl;
+
+	hda_ipc_irq_dump(sdev);
+
+	hipcidr = snd_sof_dsp_read(sdev, HDA_DSP_BAR, CNL_DSP_REG_HIPCIDR);
+	hipcidd = snd_sof_dsp_read(sdev, HDA_DSP_BAR, CNL_DSP_REG_HIPCIDD);
+	hipcida = snd_sof_dsp_read(sdev, HDA_DSP_BAR, CNL_DSP_REG_HIPCIDA);
+	hipctdr = snd_sof_dsp_read(sdev, HDA_DSP_BAR, CNL_DSP_REG_HIPCTDR);
+	hipctdd = snd_sof_dsp_read(sdev, HDA_DSP_BAR, CNL_DSP_REG_HIPCTDD);
+	hipctda = snd_sof_dsp_read(sdev, HDA_DSP_BAR, CNL_DSP_REG_HIPCTDA);
+	hipcctl = snd_sof_dsp_read(sdev, HDA_DSP_BAR, CNL_DSP_REG_HIPCCTL);
+
+	/* dump the IPC regs */
+	/* TODO: parse the raw msg */
+	dev_err(sdev->dev,
+		"Host IPC initiator: %#x|%#x|%#x, target: %#x|%#x|%#x, ctl: %#x\n",
+		hipcidr, hipcidd, hipcida, hipctdr, hipctdd, hipctda, hipcctl);
+}
+
 /* cannonlake ops */
 struct snd_sof_dsp_ops sof_cnl_ops;
 EXPORT_SYMBOL_NS(sof_cnl_ops, SND_SOC_SOF_INTEL_HDA_COMMON);
@@ -351,6 +372,9 @@ int sof_cnl_ops_init(struct snd_sof_dev *sdev)
 
 		/* ipc */
 		sof_cnl_ops.send_msg	= cnl_ipc_send_msg;
+
+		/* debug */
+		sof_cnl_ops.ipc_dump	= cnl_ipc_dump;
 	}
 
 	if (sdev->pdata->ipc_type == SOF_INTEL_IPC4) {
@@ -370,6 +394,9 @@ int sof_cnl_ops_init(struct snd_sof_dev *sdev)
 
 		/* ipc */
 		sof_cnl_ops.send_msg	= cnl_ipc4_send_msg;
+
+		/* debug */
+		sof_cnl_ops.ipc_dump	= cnl_ipc4_dump;
 	}
 
 	/* set DAI driver ops */
@@ -378,7 +405,6 @@ int sof_cnl_ops_init(struct snd_sof_dev *sdev)
 	/* debug */
 	sof_cnl_ops.debug_map	= cnl_dsp_debugfs;
 	sof_cnl_ops.debug_map_count	= ARRAY_SIZE(cnl_dsp_debugfs);
-	sof_cnl_ops.ipc_dump	= cnl_ipc_dump;
 
 	/* pre/post fw run */
 	sof_cnl_ops.post_fw_run = hda_dsp_post_fw_run;
diff --git a/sound/soc/sof/intel/hda-ipc.h b/sound/soc/sof/intel/hda-ipc.h
index 10fbca5939db..8ec5e9f6f8d7 100644
--- a/sound/soc/sof/intel/hda-ipc.h
+++ b/sound/soc/sof/intel/hda-ipc.h
@@ -51,5 +51,6 @@
 irqreturn_t cnl_ipc_irq_thread(int irq, void *context);
 int cnl_ipc_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg);
 void cnl_ipc_dump(struct snd_sof_dev *sdev);
+void cnl_ipc4_dump(struct snd_sof_dev *sdev);
 
 #endif
diff --git a/sound/soc/sof/intel/icl.c b/sound/soc/sof/intel/icl.c
index 59ce3132fada..f1018c6db5c2 100644
--- a/sound/soc/sof/intel/icl.c
+++ b/sound/soc/sof/intel/icl.c
@@ -113,6 +113,9 @@ int sof_icl_ops_init(struct snd_sof_dev *sdev)
 
 		/* ipc */
 		sof_icl_ops.send_msg	= cnl_ipc_send_msg;
+
+		/* debug */
+		sof_icl_ops.ipc_dump	= cnl_ipc_dump;
 	}
 
 	if (sdev->pdata->ipc_type == SOF_INTEL_IPC4) {
@@ -132,12 +135,14 @@ int sof_icl_ops_init(struct snd_sof_dev *sdev)
 
 		/* ipc */
 		sof_icl_ops.send_msg	= cnl_ipc4_send_msg;
+
+		/* debug */
+		sof_icl_ops.ipc_dump	= cnl_ipc4_dump;
 	}
 
 	/* debug */
 	sof_icl_ops.debug_map	= icl_dsp_debugfs;
 	sof_icl_ops.debug_map_count	= ARRAY_SIZE(icl_dsp_debugfs);
-	sof_icl_ops.ipc_dump	= cnl_ipc_dump;
 
 	/* pre/post fw run */
 	sof_icl_ops.post_fw_run = icl_dsp_post_fw_run;
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index 5135e1c7e6cf..c606c3691de7 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -68,6 +68,9 @@ int sof_tgl_ops_init(struct snd_sof_dev *sdev)
 
 		/* ipc */
 		sof_tgl_ops.send_msg	= cnl_ipc_send_msg;
+
+		/* debug */
+		sof_tgl_ops.ipc_dump	= cnl_ipc_dump;
 	}
 
 	if (sdev->pdata->ipc_type == SOF_INTEL_IPC4) {
@@ -87,6 +90,9 @@ int sof_tgl_ops_init(struct snd_sof_dev *sdev)
 
 		/* ipc */
 		sof_tgl_ops.send_msg	= cnl_ipc4_send_msg;
+
+		/* debug */
+		sof_tgl_ops.ipc_dump	= cnl_ipc4_dump;
 	}
 
 	/* set DAI driver ops */
@@ -95,7 +101,6 @@ int sof_tgl_ops_init(struct snd_sof_dev *sdev)
 	/* debug */
 	sof_tgl_ops.debug_map	= tgl_dsp_debugfs;
 	sof_tgl_ops.debug_map_count	= ARRAY_SIZE(tgl_dsp_debugfs);
-	sof_tgl_ops.ipc_dump	= cnl_ipc_dump;
 
 	/* pre/post fw run */
 	sof_tgl_ops.post_fw_run = hda_dsp_post_fw_run;
-- 
2.37.3

