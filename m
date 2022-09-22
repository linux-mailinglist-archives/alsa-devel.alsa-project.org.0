Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E105E6E7E
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Sep 2022 23:38:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAFEC201;
	Thu, 22 Sep 2022 23:37:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAFEC201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663882723;
	bh=uwM/6v1OsHSLAZBJ4B8yuARido8x01Z0IXgCTSCkYtQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UrzQQ9p+2gW7WvBG/dccOVrZNh2z6zkV+6ht3V//yj7ReeDDWFZAICVhr/VkbpKPu
	 KzLgcdXLiWcub3y+DYcQKri04UmdDZZfXOwFVDA9O1uXvayfHaGnW9ssCUeIqGi3IQ
	 y2+3ICUyffMZCud8ogfU6ANY4UPn5OYZH1+Iz0qg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB077F8053D;
	Thu, 22 Sep 2022 23:37:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC748F8053C; Thu, 22 Sep 2022 23:37:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69197F8027B
 for <alsa-devel@alsa-project.org>; Thu, 22 Sep 2022 23:36:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69197F8027B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="QXHzkGb3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663882617; x=1695418617;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uwM/6v1OsHSLAZBJ4B8yuARido8x01Z0IXgCTSCkYtQ=;
 b=QXHzkGb3c/K7EOTWPnCDsR5PNb887DndmGgsR7LBdmkuPZRvYhuvQphK
 IS+WwYdCoYD2PLb+rl3xsY2CT2G09wgQ58BZFyIZ6WNH16hEHrLhcipX5
 m5EubglIa5eJ6LlZbpx1Rg5RtLJ37Kg3M1dBtnzpOkj/HWksAddxZKlIc
 IssafHsDkg5tFxOc1GPW532t2+MWt0q64Ci988WdG5UziRoFR3kllDJfG
 HIF4JbYzvKlZdrDT0AbEmji5/zqcr9zwkoF6pMaHQG4XbUnpd868XuRHP
 m/tyHncadeWv9Uwkwh7eVF2gc2lY4zt1tFUNe55BFs3C2GO7ajEeXfzO0 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="386725772"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="386725772"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 14:36:51 -0700
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="745550846"
Received: from jpwarner-mobl2.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.13.62])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 14:36:50 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/10] ASoC: SOF: Intel: mtl: define and set power_down_dsp op
Date: Thu, 22 Sep 2022 14:36:37 -0700
Message-Id: <20220922213644.666315-4-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922213644.666315-1-ranjani.sridharan@linux.intel.com>
References: <20220922213644.666315-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, Fred Oh <fred.oh@linux.intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>
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

From: Fred Oh <fred.oh@linux.intel.com>

For MTL platform, dsp cores need to go power down first then dsp subsystem
also need to set power down.

Signed-off-by: Fred Oh <fred.oh@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/mtl.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 5408c34b04ef..8cc20e617117 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -406,6 +406,33 @@ static int mtl_dsp_core_power_down(struct snd_sof_dev *sdev, int core)
 	return ret;
 }
 
+static int mtl_power_down_dsp(struct snd_sof_dev *sdev)
+{
+	u32 dsphfdsscs, cpa;
+	int ret;
+
+	/* first power down core */
+	ret = mtl_dsp_core_power_down(sdev, SOF_DSP_PRIMARY_CORE);
+	if (ret) {
+		dev_err(sdev->dev, "mtl dsp power down error, %d\n", ret);
+		return ret;
+	}
+
+	/* Set the DSP subsystem power down */
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, MTL_HFDSSCS,
+				MTL_HFDSSCS_SPA_MASK, 0);
+
+	/* Wait for unstable CPA read (1 then 0 then 1) just after setting SPA bit */
+	usleep_range(1000, 1010);
+
+	/* poll with timeout to check if operation successful */
+	cpa = MTL_HFDSSCS_CPA_MASK;
+	dsphfdsscs = snd_sof_dsp_read(sdev, HDA_DSP_BAR, MTL_HFDSSCS);
+	return snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR, MTL_HFDSSCS, dsphfdsscs,
+					     (dsphfdsscs & cpa) == 0, HDA_DSP_REG_POLL_INTERVAL_US,
+					     HDA_DSP_RESET_TIMEOUT_US);
+}
+
 static int mtl_dsp_cl_init(struct snd_sof_dev *sdev, int stream_tag, bool imr_boot)
 {
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
@@ -792,6 +819,7 @@ const struct sof_intel_dsp_desc mtl_chip_info = {
 	.check_sdw_irq = mtl_dsp_check_sdw_irq,
 	.check_ipc_irq = mtl_dsp_check_ipc_irq,
 	.cl_init = mtl_dsp_cl_init,
+	.power_down_dsp = mtl_power_down_dsp,
 	.hw_ip_version = SOF_INTEL_ACE_1_0,
 };
 EXPORT_SYMBOL_NS(mtl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
-- 
2.25.1

