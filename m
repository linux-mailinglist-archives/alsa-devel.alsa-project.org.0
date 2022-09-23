Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E685E7C03
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 15:37:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7951420C;
	Fri, 23 Sep 2022 15:36:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7951420C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663940237;
	bh=c1uRWvjMaU36ufmDOGK9V1tkqGszO2YYsllnQkagJck=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FTSCv2ocrIvDrgKxMtrNFTc5HgsVEDmw12b/MswSP9QqQhuFoz8n0YcZ3T3zMTFUm
	 j4LtzhcVHyShTbZp2lwe/IAy1Swd5EKCPoUQSS/jRMAyHZfeGrqscu4fkU3udHABYY
	 XVg47GPzZRNQGar0xtkmN7CYb/Own6rD7Gm2iwjs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0225F80539;
	Fri, 23 Sep 2022 15:36:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3500F8053A; Fri, 23 Sep 2022 15:36:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F7F6F80269
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 15:36:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F7F6F80269
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Ni5bV6Z1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663940175; x=1695476175;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c1uRWvjMaU36ufmDOGK9V1tkqGszO2YYsllnQkagJck=;
 b=Ni5bV6Z1lKwhL78/WUTVbfsR3P9ewqMBYTy/gYWZXJzJm6yEQynmIcv2
 e64lYgwaFVX3+99fL/sjwo5FD8wDOqzOu4pqOCTj0XeOW5s5g57ZItpss
 S0xejPnWZhI8Qfss7MUZfGKCo8w44xGdSucW7QZLuZ5ki9RSrzvvg18/3
 MYtv9KhG2JDt/tr8/Fij13dfotKz7RPDzX/VkNx62u1vk448Ru7WAKx0q
 hic/PdW9WCijORx3JHlHflUq+kEWK6Dbd/VJkXzsJrZmjs3v9tnNM16CS
 BOTcfNYFW8jxoGJc05yx6yp4fvia8/XDKvEZs9WKcWQa7TiffCoYduKXC Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10479"; a="300575619"
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="300575619"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 06:36:12 -0700
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="571375299"
Received: from acarr-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.3.209])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 06:36:10 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 2/6] ASoC: SOF: Intel: hda: Add separate ops for ipc_dump for
 IPC4
Date: Fri, 23 Sep 2022 16:36:12 +0300
Message-Id: <20220923133616.26267-3-peter.ujfalusi@linux.intel.com>
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
 sound/soc/sof/intel/apl.c |  7 ++++++-
 sound/soc/sof/intel/hda.c | 18 ++++++++++++++++++
 sound/soc/sof/intel/hda.h |  1 +
 3 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index 295df44be271..37d12e821c10 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -45,6 +45,9 @@ int sof_apl_ops_init(struct snd_sof_dev *sdev)
 
 		/* ipc */
 		sof_apl_ops.send_msg	= hda_dsp_ipc_send_msg;
+
+		/* debug */
+		sof_apl_ops.ipc_dump	= hda_ipc_dump;
 	}
 
 	if (sdev->pdata->ipc_type == SOF_INTEL_IPC4) {
@@ -64,6 +67,9 @@ int sof_apl_ops_init(struct snd_sof_dev *sdev)
 
 		/* ipc */
 		sof_apl_ops.send_msg	= hda_dsp_ipc4_send_msg;
+
+		/* debug */
+		sof_apl_ops.ipc_dump	= hda_ipc4_dump;
 	}
 
 	/* set DAI driver ops */
@@ -72,7 +78,6 @@ int sof_apl_ops_init(struct snd_sof_dev *sdev)
 	/* debug */
 	sof_apl_ops.debug_map	= apl_dsp_debugfs;
 	sof_apl_ops.debug_map_count	= ARRAY_SIZE(apl_dsp_debugfs);
-	sof_apl_ops.ipc_dump	= hda_ipc_dump;
 
 	/* firmware run */
 	sof_apl_ops.run = hda_dsp_cl_boot_firmware;
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index f7068a7e2e81..ca648d2a9da7 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -662,6 +662,24 @@ void hda_ipc_dump(struct snd_sof_dev *sdev)
 		hipcie, hipct, hipcctl);
 }
 
+void hda_ipc4_dump(struct snd_sof_dev *sdev)
+{
+	u32 hipci, hipcie, hipct, hipcte, hipcctl;
+
+	hda_ipc_irq_dump(sdev);
+
+	hipci = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCI);
+	hipcie = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCIE);
+	hipct = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCT);
+	hipcte = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCTE);
+	hipcctl = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCCTL);
+
+	/* dump the IPC regs */
+	/* TODO: parse the raw msg */
+	dev_err(sdev->dev, "Host IPC initiator: %#x|%#x, target: %#x|%#x, ctl: %#x\n",
+		hipci, hipcie, hipct, hipcte, hipcctl);
+}
+
 static int hda_init(struct snd_sof_dev *sdev)
 {
 	struct hda_bus *hbus;
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 2013a94020c6..c3a9f89b726d 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -851,6 +851,7 @@ irqreturn_t cnl_ipc4_irq_thread(int irq, void *context);
 int cnl_ipc4_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg);
 irqreturn_t hda_dsp_ipc4_irq_thread(int irq, void *context);
 int hda_dsp_ipc4_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg);
+void hda_ipc4_dump(struct snd_sof_dev *sdev);
 extern struct sdw_intel_ops sdw_callback;
 
 #endif
-- 
2.37.3

