Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB2D10348
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2019 01:24:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE16216B6;
	Wed,  1 May 2019 01:23:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE16216B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556666664;
	bh=wRc5jZQifCxyoHrANybCSbT0lr9472blNee7m4gFDKg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tCw6Xgls5OfZVJyhU0fp/uhcBpiA04ldrBn87ol8CIrvW3gnFuc9nQKjs6GHEczUr
	 mDYbfFEcdq3i4gMTkg7wNIpTmDKwnJqQKYAvIMJ7Mx/WuEJNS61eJxtkvsKkpiKtxJ
	 UV8Pa0rZFs6VHyU13yr/csbO+0R7PnN1+EXjgK+s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FFEBF89780;
	Wed,  1 May 2019 01:10:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4ACDBF89741; Wed,  1 May 2019 01:10:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 554CAF89732
 for <alsa-devel@alsa-project.org>; Wed,  1 May 2019 01:10:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 554CAF89732
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Apr 2019 16:10:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,415,1549958400"; d="scan'208";a="166540991"
Received: from slawsonx-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.133.128])
 by fmsmga004.fm.intel.com with ESMTP; 30 Apr 2019 16:10:03 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 30 Apr 2019 18:09:33 -0500
Message-Id: <20190430230934.4321-19-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430230934.4321-1-pierre-louis.bossart@linux.intel.com>
References: <20190430230934.4321-1-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, broonie@kernel.org, Pan Xiuli <xiuli.pan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 18/19] ASoC: SOF: Intel: APL: add ipc dump
	function
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

From: Pan Xiuli <xiuli.pan@linux.intel.com>

Add IPC dump function for APL plaform

Signed-off-by: Pan Xiuli <xiuli.pan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/apl.c |  1 +
 sound/soc/sof/intel/hda.c | 18 ++++++++++++++++++
 sound/soc/sof/intel/hda.h |  1 +
 3 files changed, 20 insertions(+)

diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index d1fb2f2ba1e1..f215d80dce2c 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -55,6 +55,7 @@ const struct snd_sof_dsp_ops sof_apl_ops = {
 	.debug_map	= apl_dsp_debugfs,
 	.debug_map_count	= ARRAY_SIZE(apl_dsp_debugfs),
 	.dbg_dump	= hda_dsp_dump,
+	.ipc_dump	= hda_ipc_dump,
 
 	/* stream callbacks */
 	.pcm_open	= hda_dsp_pcm_open,
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index b8fc19790f3b..c7d419d340c8 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -179,6 +179,24 @@ void hda_dsp_dump(struct snd_sof_dev *sdev, u32 flags)
 	}
 }
 
+void hda_ipc_dump(struct snd_sof_dev *sdev)
+{
+	u32 hipcie;
+	u32 hipct;
+	u32 hipcctl;
+
+	/* read IPC status */
+	hipcie = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCIE);
+	hipct = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCT);
+	hipcctl = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCCTL);
+
+	/* dump the IPC regs */
+	/* TODO: parse the raw msg */
+	dev_err(sdev->dev,
+		"error: host status 0x%8.8x dsp status 0x%8.8x mask 0x%8.8x\n",
+		hipcie, hipct, hipcctl);
+}
+
 static int hda_init(struct snd_sof_dev *sdev)
 {
 	struct hda_bus *hbus;
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 4b00e5d88565..92d45c43b4b1 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -447,6 +447,7 @@ int hda_dsp_runtime_resume(struct snd_sof_dev *sdev);
 void hda_dsp_set_hw_params_upon_resume(struct snd_sof_dev *sdev);
 void hda_dsp_dump_skl(struct snd_sof_dev *sdev, u32 flags);
 void hda_dsp_dump(struct snd_sof_dev *sdev, u32 flags);
+void hda_ipc_dump(struct snd_sof_dev *sdev);
 
 /*
  * DSP PCM Operations.
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
