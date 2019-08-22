Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B56B9A002
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 21:27:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C2E41697;
	Thu, 22 Aug 2019 21:26:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C2E41697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566502036;
	bh=Ts+7SjCPUuCpZ7Ma+5Pd7lUxXncpUwI+DS3JoVcKoaM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iCUt4IJR5UNm1orJuPUAOh4r/u0JLPs6jsmZXKP9lMRt80Jn7tBftx7jYtKFbKFDQ
	 pCuLldz7C5nXgeXe22gW4FMa0/y+ckWACc898x3gfff2PDCvd+v2Fy/UPPPa9kAjI4
	 Z54131T3fBHcU3vaibBmK1JQFaacfLwGPLpdXhzE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB295F80CB1;
	Thu, 22 Aug 2019 21:07:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1504F80736; Thu, 22 Aug 2019 21:06:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89C5FF80673
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 21:05:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89C5FF80673
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 12:05:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="203524606"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2019 12:05:29 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 22 Aug 2019 21:04:20 +0200
Message-Id: <20190822190425.23001-31-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822190425.23001-1-cezary.rojewski@intel.com>
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 30/35] ASoC: Intel: Reuse sst_pdata::fw_name
	field
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

struct sst_pdata is equipped with fw_name field - a platform specific
filename for basefw module. Usage of such allows for suther
simplification of declaration of handlers directly involved with Skylake
initialization procedure.

This change invalidates mach::fw_filename field and skl::fw_name.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/common/sst-acpi.c       | 5 ++---
 sound/soc/intel/common/sst-firmware.c   | 1 +
 sound/soc/intel/skylake/skl-messages.c  | 2 +-
 sound/soc/intel/skylake/skl-sst-dsp.h   | 3 +--
 sound/soc/intel/skylake/skl-sst-utils.c | 4 +---
 sound/soc/intel/skylake/skl.c           | 4 ----
 6 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/sound/soc/intel/common/sst-acpi.c b/sound/soc/intel/common/sst-acpi.c
index 53ac23f05966..15f2b27e643f 100644
--- a/sound/soc/intel/common/sst-acpi.c
+++ b/sound/soc/intel/common/sst-acpi.c
@@ -28,11 +28,10 @@ static void sst_acpi_fw_cb(const struct firmware *fw, void *context)
 	struct sst_acpi_priv *sst_acpi = platform_get_drvdata(pdev);
 	struct sst_acpi_desc *desc = sst_acpi->desc;
 	struct sst_pdata *sst_pdata = desc->pdata;
-	struct snd_soc_acpi_mach *mach = sst_acpi->mach;
 
 	sst_pdata->fw = fw;
 	if (!fw) {
-		dev_err(dev, "Cannot load firmware %s\n", mach->fw_filename);
+		dev_err(dev, "Cannot load firmware %s\n", sst_pdata->fw_name);
 		return;
 	}
 
@@ -119,7 +118,7 @@ int sst_acpi_probe(struct platform_device *pdev)
 		return PTR_ERR(sst_acpi->pdev_mach);
 
 	/* continue SST probing after firmware is loaded */
-	ret = request_firmware_nowait(THIS_MODULE, true, mach->fw_filename,
+	ret = request_firmware_nowait(THIS_MODULE, true, sst_pdata->fw_name,
 				      dev, GFP_KERNEL, pdev, sst_acpi_fw_cb);
 	if (ret)
 		platform_device_unregister(sst_acpi->pdev_mach);
diff --git a/sound/soc/intel/common/sst-firmware.c b/sound/soc/intel/common/sst-firmware.c
index 61d3e6e46b98..cc88849eb10f 100644
--- a/sound/soc/intel/common/sst-firmware.c
+++ b/sound/soc/intel/common/sst-firmware.c
@@ -1218,6 +1218,7 @@ struct sst_dsp *sst_dsp_new(struct device *dev, struct sst_pdata *pdata)
 	sst->thread_context = pdata->dsp;
 	sst->id = pdata->id;
 	sst->irq = pdata->irq;
+	sst->fw_name = pdata->fw_name;
 	sst->ops = pdata->ops;
 	sst->pdata = pdata;
 	INIT_LIST_HEAD(&sst->used_block_list);
diff --git a/sound/soc/intel/skylake/skl-messages.c b/sound/soc/intel/skylake/skl-messages.c
index 372c5fb83ddb..e401edd8d44b 100644
--- a/sound/soc/intel/skylake/skl-messages.c
+++ b/sound/soc/intel/skylake/skl-messages.c
@@ -201,7 +201,7 @@ int skl_init_dsp(struct skl_dev *skl, struct sst_pdata *pdata)
 	if (!ops)
 		return -EIO;
 
-	ret = skl_sst_ctx_init(skl, skl->fw_name, pdata);
+	ret = skl_sst_ctx_init(skl, pdata);
 	if (ret < 0)
 		return ret;
 
diff --git a/sound/soc/intel/skylake/skl-sst-dsp.h b/sound/soc/intel/skylake/skl-sst-dsp.h
index 8483c60f29ba..a3714b706b8e 100644
--- a/sound/soc/intel/skylake/skl-sst-dsp.h
+++ b/sound/soc/intel/skylake/skl-sst-dsp.h
@@ -223,8 +223,7 @@ int skl_dsp_strip_extended_manifest(struct firmware *fw);
 
 void skl_dsp_set_astate_cfg(struct skl_dev *skl, u32 cnt, void *data);
 
-int skl_sst_ctx_init(struct skl_dev *skl, const char *fw_name,
-		struct sst_pdata *pdata);
+int skl_sst_ctx_init(struct skl_dev *skl, struct sst_pdata *pdata);
 int skl_prepare_lib_load(struct skl_dev *skl, struct skl_lib_info *linfo,
 			struct firmware *stripped_fw,
 			unsigned int hdr_offset, int index);
diff --git a/sound/soc/intel/skylake/skl-sst-utils.c b/sound/soc/intel/skylake/skl-sst-utils.c
index a4ad213d34e0..ea5419012312 100644
--- a/sound/soc/intel/skylake/skl-sst-utils.c
+++ b/sound/soc/intel/skylake/skl-sst-utils.c
@@ -354,8 +354,7 @@ int skl_dsp_strip_extended_manifest(struct firmware *fw)
 	return 0;
 }
 
-int skl_sst_ctx_init(struct skl_dev *skl, const char *fw_name,
-	struct sst_pdata *pdata)
+int skl_sst_ctx_init(struct skl_dev *skl, struct sst_pdata *pdata)
 {
 	struct sst_dsp *sst;
 	struct device *dev = skl->dev;
@@ -372,7 +371,6 @@ int skl_sst_ctx_init(struct skl_dev *skl, const char *fw_name,
 	}
 
 	skl->dsp = sst;
-	sst->fw_name = fw_name;
 	init_waitqueue_head(&skl->mod_load_wait);
 	skl->is_first_boot = true;
 
diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index 39442c80a179..3225f4f8793e 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -491,9 +491,6 @@ static struct snd_soc_acpi_mach *skl_find_hda_machine(struct skl_dev *skl,
 	/* point to common table */
 	mach = snd_soc_acpi_intel_hda_machines;
 
-	/* all entries in the machine table use the same firmware */
-	mach->fw_filename = machines->fw_filename;
-
 	return mach;
 }
 
@@ -514,7 +511,6 @@ static int skl_find_machine(struct skl_dev *skl, void *driver_data)
 	}
 
 	skl->mach = mach;
-	skl->fw_name = mach->fw_filename;
 	pdata = mach->pdata;
 
 	if (pdata) {
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
