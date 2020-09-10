Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FED264A1F
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Sep 2020 18:45:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF44716B0;
	Thu, 10 Sep 2020 18:44:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF44716B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599756334;
	bh=f4APOjuCp128c0K7W3GFu8XlHQJRsQQc8y8lTUpVmmA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NJ2xtOgFMULP3VoicB8S+cjBoDRLfSObkaigjuP4YSCjGvELBNfz/k5X6m7CLGSwQ
	 4Ml5QPBkrnfVBktEh2IkcnbjKgAa+ZMMQV/j1IkeGMi9z4EeWkiBMJrHkmuaS6zckT
	 k73ob+fGchhAm0Xdk5xcJ+wWQjCb39nZQ7cLb9oE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 795D3F802C2;
	Thu, 10 Sep 2020 18:43:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87243F8026F; Thu, 10 Sep 2020 18:43:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC167F800D0
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 18:42:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC167F800D0
IronPort-SDR: LsIX4/Lnk0UoAs2AlUGZfga1cBrr7JTHPWYthAJsHF0A7WCiUh+KhYscqwjsozL2fd2tVEHpQs
 pYc6/VXxLA7w==
X-IronPort-AV: E=McAfee;i="6000,8403,9740"; a="146278542"
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; d="scan'208";a="146278542"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 09:42:55 -0700
IronPort-SDR: ZhhMnDVn4XNivDjmTwOpUJyBr7kLS1vK9cPiA5KQTBgUF5I992UPWSmqmdPMWfZAzLLuIYgWrw
 aF1eEvdtUWnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; d="scan'208";a="304937895"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga006.jf.intel.com with ESMTP; 10 Sep 2020 09:42:52 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 2/4] ASoC: SOF: Intel: hda: modify core_power_up/down op
Date: Thu, 10 Sep 2020 19:41:23 +0300
Message-Id: <20200910164125.2033062-3-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200910164125.2033062-1-kai.vehmanen@linux.intel.com>
References: <20200910164125.2033062-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 kai.vehmanen@linux.intel.com, Keyon Jie <yang.jie@linux.intel.com>,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com,
 Rander Wang <rander.wang@linux.intel.com>
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Modify the core_power_up/down ops for HDA platforms to restrict
the core_mask to the ones allowed by chip->cores_mask. This is needed
because on some HDA platforms not all cores can be powered up/down
by the host and this must be handled internally in the FW.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Keyon Jie <yang.jie@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 18d726669c6f..18ff1c2f5376 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -239,10 +239,15 @@ bool hda_dsp_core_is_enabled(struct snd_sof_dev *sdev,
 
 int hda_dsp_enable_core(struct snd_sof_dev *sdev, unsigned int core_mask)
 {
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
+	const struct sof_intel_dsp_desc *chip = hda->desc;
 	int ret;
 
-	/* return if core is already enabled */
-	if (hda_dsp_core_is_enabled(sdev, core_mask))
+	/* restrict core_mask to host managed cores mask */
+	core_mask &= chip->host_managed_cores_mask;
+
+	/* return if core_mask is not valid or cores are already enabled */
+	if (!core_mask || hda_dsp_core_is_enabled(sdev, core_mask))
 		return 0;
 
 	/* power up */
@@ -259,8 +264,17 @@ int hda_dsp_enable_core(struct snd_sof_dev *sdev, unsigned int core_mask)
 int hda_dsp_core_reset_power_down(struct snd_sof_dev *sdev,
 				  unsigned int core_mask)
 {
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
+	const struct sof_intel_dsp_desc *chip = hda->desc;
 	int ret;
 
+	/* restrict core_mask to host managed cores mask */
+	core_mask &= chip->host_managed_cores_mask;
+
+	/* return if core_mask is not valid */
+	if (!core_mask)
+		return 0;
+
 	/* place core in reset prior to power down */
 	ret = hda_dsp_core_stall_reset(sdev, core_mask);
 	if (ret < 0) {
-- 
2.27.0

