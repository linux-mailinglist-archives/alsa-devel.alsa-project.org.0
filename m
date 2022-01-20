Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 152644956A5
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jan 2022 00:18:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95A572DDB;
	Fri, 21 Jan 2022 00:17:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95A572DDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642720682;
	bh=4PTUF6/qmJ0PMpiYWsr1Co7Ecg5LxiC0TpA+G7NfGN4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eVYm57M2wZRtawUG6LFIXuUMc89gWHK6z99AU+dg2TL7D2t8Tk6YduRsQvRcB89zw
	 Gq1ujPP7V/GzVa6FCDGn9n37SkJDFghP0kn/SCit7xBhi0JEtmSgUC7/1DiY64PyHa
	 pOn/Zi9Bii5WyBju7UpqzluvKfAMETYTmzvmWKQQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92896F80516;
	Fri, 21 Jan 2022 00:16:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FD75F80518; Fri, 21 Jan 2022 00:16:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43B90F80128
 for <alsa-devel@alsa-project.org>; Fri, 21 Jan 2022 00:15:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43B90F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RTPoa/vv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642720553; x=1674256553;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4PTUF6/qmJ0PMpiYWsr1Co7Ecg5LxiC0TpA+G7NfGN4=;
 b=RTPoa/vvQkO1o90Gof/BWqjkijaNSPVuAjd9KLJ5EiDY65gIWDcVUKib
 qRzjRr5kqtxAceeUsc8+D8SXu5BWeNfJz7oclSQqHpLYjM7dWJxH6qH2l
 p3HZj83V06w62piCD0qL2viCMVkT5IhC6V25prNk4C+tEuNuModHjW7u6
 O/GJX9wLAWyNPSfmy+RQ/icxNd/Wfj+Wa8pSVNGPgQbTsLsrtdrCqAO7D
 eCNVV7WS3ZMVlHjmJSsUQXfT5z+bOU3ZmB0NCDgS+JxyDEQnqEPfhYJFE
 xMfy7z6wd9NpPE8wp61bbv3CwfHozxUvOOqKJCrU7zfvvqWkGp2XTSQs3 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="245721378"
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="245721378"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 15:15:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="672741396"
Received: from sthambit-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.64.44])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 15:15:42 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/5] ASoC: SOF: Intel: hda-loader: add IMR restore support
Date: Thu, 20 Jan 2022 17:15:31 -0600
Message-Id: <20220120231532.196926-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120231532.196926-1-pierre-louis.bossart@linux.intel.com>
References: <20220120231532.196926-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Keyon Jie <yang.jie@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org,
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

From: Keyon Jie <yang.jie@linux.intel.com>

If the firmware declares the IMR restore feature, we only need to do a
simple powering up to resume from D3, no firmware re-downloading
needed - the context is saved/restored to/from IMR without needing
driver support.

Add a hda_dsp_boot_imr() helper for this simple DSP reboot, and use it
when it is available.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 38 ++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 7f1b1d0f2422..baf2ff146f50 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -353,6 +353,38 @@ int hda_dsp_cl_boot_firmware_iccmax(struct snd_sof_dev *sdev)
 	return ret;
 }
 
+static int hda_dsp_boot_imr(struct snd_sof_dev *sdev)
+{
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
+	const struct sof_intel_dsp_desc *chip = hda->desc;
+	unsigned long mask;
+	u32 j;
+	int ret;
+
+	/* power up & unstall/run the cores to run the firmware */
+	ret = hda_dsp_enable_core(sdev, chip->init_core_mask);
+	if (ret < 0) {
+		dev_err(sdev->dev, "dsp core start failed %d\n", ret);
+		return -EIO;
+	}
+
+	/* set enabled cores mask and increment ref count for cores in init_core_mask */
+	sdev->enabled_cores_mask |= chip->init_core_mask;
+	mask = sdev->enabled_cores_mask;
+	for_each_set_bit(j, &mask, SOF_MAX_DSP_NUM_CORES)
+		sdev->dsp_core_ref_count[j]++;
+
+	hda_ssp_set_cbp_cfp(sdev);
+
+	/* enable IPC interrupts */
+	hda_dsp_ipc_int_enable(sdev);
+
+	/* process wakes */
+	hda_sdw_process_wakeen(sdev);
+
+	return ret;
+}
+
 int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 {
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
@@ -363,6 +395,12 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 	struct firmware stripped_firmware;
 	int ret, ret1, i;
 
+	if ((sdev->fw_ready.flags & SOF_IPC_INFO_D3_PERSISTENT) &&
+	    !sdev->first_boot) {
+		dev_dbg(sdev->dev, "IMR restore supported, booting from IMR directly\n");
+		return hda_dsp_boot_imr(sdev);
+	}
+
 	chip_info = desc->chip_info;
 
 	if (plat_data->fw->size <= plat_data->fw_offset) {
-- 
2.25.1

