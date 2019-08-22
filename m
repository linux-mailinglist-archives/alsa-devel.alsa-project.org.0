Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C47929A005
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 21:29:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BEB21607;
	Thu, 22 Aug 2019 21:28:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BEB21607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566502149;
	bh=JPvMTGYCUfmlWnRBtFWtFLYtVVZKQTHqVALOLaPJ92k=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qNpIpYhU5Tzq2VcGccgXpLb1xrnbhsoanz8T39u8Y7NMvhSqEv8cdBr8KL/qPWdRx
	 Qp+GnTYmIWsRtqIGGgiLGGZKjZhcUSTjYaYlAfbV7OT18dwMWPH7H9InActeo54Evn
	 EQosYCIgT2U8RH/D43cQqdPcyu5PadO7GQ50/t3Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE316F80CBF;
	Thu, 22 Aug 2019 21:07:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E873F8074D; Thu, 22 Aug 2019 21:06:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08B75F8068A
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 21:05:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08B75F8068A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 12:05:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="203524636"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2019 12:05:35 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 22 Aug 2019 21:04:24 +0200
Message-Id: <20190822190425.23001-35-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822190425.23001-1-cezary.rojewski@intel.com>
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 34/35] ASoC: Intel: Skylake: Merge
	skl_sst_ctx_init into skl_init_dsp
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

skl_init_dsp and skl_sst_ctx_init share the exact same purpose: trigger
for sst_dsp creation. Merge them together. While adding code, change
reorders certain blocks, so skl_dev instance is always initialized
before sst_dsp_new cascade begins.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/skl-messages.c  | 21 +++++++++++++++------
 sound/soc/intel/skylake/skl-sst-dsp.h   |  1 -
 sound/soc/intel/skylake/skl-sst-utils.c | 23 -----------------------
 3 files changed, 15 insertions(+), 30 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-messages.c b/sound/soc/intel/skylake/skl-messages.c
index 5f63c3052db9..7a161bbf8f26 100644
--- a/sound/soc/intel/skylake/skl-messages.c
+++ b/sound/soc/intel/skylake/skl-messages.c
@@ -142,18 +142,27 @@ int skl_dsp_cleanup(struct device *dev,
 
 int skl_init_dsp(struct skl_dev *skl, struct sst_pdata *pdata)
 {
+	struct sst_dsp *dsp;
 	struct hdac_bus *bus = skl_to_bus(skl);
-	int ret;
+	struct device *dev = skl->dev;
 
 	/* enable ppcap interrupt */
 	snd_hdac_ext_bus_ppcap_enable(bus, true);
 	snd_hdac_ext_bus_ppcap_int_enable(bus, true);
 
-	ret = skl_sst_ctx_init(skl, pdata);
-	if (ret < 0)
-		return ret;
-
-	dev_dbg(bus->dev, "dsp registration status=%d\n", ret);
+	skl->is_first_boot = true;
+	INIT_LIST_HEAD(&skl->uuid_list);
+	init_waitqueue_head(&skl->mod_load_wait);
+
+	pdata->id = skl->pci->device;
+	pdata->irq = skl->pci->irq;
+	pdata->dma_base = -1;
+	pdata->dsp = skl;
+	dsp = sst_dsp_new(dev, pdata);
+	if (!dsp) {
+		dev_err(dev, "%s: no device\n", __func__);
+		return -ENODEV;
+	}
 
 	return 0;
 }
diff --git a/sound/soc/intel/skylake/skl-sst-dsp.h b/sound/soc/intel/skylake/skl-sst-dsp.h
index 3294826d5cf7..eb8cc5606fc6 100644
--- a/sound/soc/intel/skylake/skl-sst-dsp.h
+++ b/sound/soc/intel/skylake/skl-sst-dsp.h
@@ -221,7 +221,6 @@ int skl_dsp_strip_extended_manifest(struct firmware *fw);
 
 void skl_dsp_set_astate_cfg(struct skl_dev *skl, u32 cnt, void *data);
 
-int skl_sst_ctx_init(struct skl_dev *skl, struct sst_pdata *pdata);
 int skl_prepare_lib_load(struct skl_dev *skl, struct skl_lib_info *linfo,
 			struct firmware *stripped_fw,
 			unsigned int hdr_offset, int index);
diff --git a/sound/soc/intel/skylake/skl-sst-utils.c b/sound/soc/intel/skylake/skl-sst-utils.c
index ea5419012312..34ac21b85cd9 100644
--- a/sound/soc/intel/skylake/skl-sst-utils.c
+++ b/sound/soc/intel/skylake/skl-sst-utils.c
@@ -354,29 +354,6 @@ int skl_dsp_strip_extended_manifest(struct firmware *fw)
 	return 0;
 }
 
-int skl_sst_ctx_init(struct skl_dev *skl, struct sst_pdata *pdata)
-{
-	struct sst_dsp *sst;
-	struct device *dev = skl->dev;
-
-	pdata->id = skl->pci->device;
-	pdata->irq = skl->pci->irq;
-	pdata->dma_base = -1;
-	pdata->dsp = skl;
-	INIT_LIST_HEAD(&skl->uuid_list);
-	sst = sst_dsp_new(dev, pdata);
-	if (!sst) {
-		dev_err(dev, "%s: no device\n", __func__);
-		return -ENODEV;
-	}
-
-	skl->dsp = sst;
-	init_waitqueue_head(&skl->mod_load_wait);
-	skl->is_first_boot = true;
-
-	return 0;
-}
-
 int skl_prepare_lib_load(struct skl_dev *skl, struct skl_lib_info *linfo,
 		struct firmware *stripped_fw,
 		unsigned int hdr_offset, int index)
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
