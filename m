Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 046035446D9
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 11:01:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6971A1FC1;
	Thu,  9 Jun 2022 11:00:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6971A1FC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654765275;
	bh=pwPHaLY5r0s5+1YQ3aUeu8oYFPtMm3xy6krR66Fxhh8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O/yBXUyYt5X/ojqeyd9DxMbXgeOakr6ifzs55kYRWJ5VMblXudP9RhMTlVOXGR5fb
	 AdAkngagcVecVzr4TCxqxh/oUMGA++ZhD93AIGyX1GWDK62N+d2x1xPkE7OG+vVuLh
	 zqXIu1d2CYM8SzS+I7JGEIBfmMdgTrujo3aFH+OU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F132F80529;
	Thu,  9 Jun 2022 10:59:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5B53F80529; Thu,  9 Jun 2022 10:59:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BFC5FF8019D
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 10:59:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFC5FF8019D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="n5IHSpDc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654765170; x=1686301170;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pwPHaLY5r0s5+1YQ3aUeu8oYFPtMm3xy6krR66Fxhh8=;
 b=n5IHSpDc20po0OgDg1za5326U0IgBsmBh5e5D/ZwWVa7BbLJtP8NH8HW
 ZpJrSZQ6D+Uot2YBnrUtCcChQ9GWMKTRoaZYXMmawnc2sT7q0ImA1F5jZ
 9fW+kEZN2zj3wT3X+h2u3BVhGX+R1t9nckIQ2XS4VwIzuHFNIK8DUVB2V
 RiUxOe5wXWY1ZNzdUjDj4fpLhiH9H+OHBiNrcAEY/vLp7/1L4QdoVSyPu
 wBsjG1f4t8v5NRso96feGrZfYuHTfxq6k4a4eeBz0KnPh7QKXt4a/58yo
 426dCW5te5bIrsiqB3pdZowHCtuRqE7FNsCec1Q9fRhUVfSqZpkMgrRGV w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="274732382"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="274732382"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 01:59:18 -0700
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="637369164"
Received: from ekoledex-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.94])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 01:59:16 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 1/3] ASoC: SOF: Intel: hda-dsp: Expose hda_dsp_core_power_up()
Date: Thu,  9 Jun 2022 11:59:47 +0300
Message-Id: <20220609085949.29062-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220609085949.29062-1-peter.ujfalusi@linux.intel.com>
References: <20220609085949.29062-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

The hda_dsp_core_power_up() needs to be exposed so that it can be used in
hda-loader.c to correct the boot flow.
The first step must not unstall the core, it should only power up the
core(s).

Add sanity check for the core_mask while exposing it to be safe.

Complements: 2a68ff846164 ("ASoC: SOF: Intel: hda: Revisit IMR boot sequence")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c | 10 +++++++++-
 sound/soc/sof/intel/hda.h     |  1 +
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 000ea906670c..e24eea725acb 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -181,12 +181,20 @@ int hda_dsp_core_run(struct snd_sof_dev *sdev, unsigned int core_mask)
  * Power Management.
  */
 
-static int hda_dsp_core_power_up(struct snd_sof_dev *sdev, unsigned int core_mask)
+int hda_dsp_core_power_up(struct snd_sof_dev *sdev, unsigned int core_mask)
 {
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
+	const struct sof_intel_dsp_desc *chip = hda->desc;
 	unsigned int cpa;
 	u32 adspcs;
 	int ret;
 
+	/* restrict core_mask to host managed cores mask */
+	core_mask &= chip->host_managed_cores_mask;
+	/* return if core_mask is not valid */
+	if (!core_mask)
+		return 0;
+
 	/* update bits */
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, HDA_DSP_REG_ADSPCS,
 				HDA_DSP_ADSPCS_SPA_MASK(core_mask),
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 3e0f7b0c586a..0f57ef5d9b8e 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -497,6 +497,7 @@ struct sof_intel_hda_stream {
  */
 int hda_dsp_probe(struct snd_sof_dev *sdev);
 int hda_dsp_remove(struct snd_sof_dev *sdev);
+int hda_dsp_core_power_up(struct snd_sof_dev *sdev, unsigned int core_mask);
 int hda_dsp_core_run(struct snd_sof_dev *sdev, unsigned int core_mask);
 int hda_dsp_enable_core(struct snd_sof_dev *sdev, unsigned int core_mask);
 int hda_dsp_core_reset_power_down(struct snd_sof_dev *sdev,
-- 
2.36.1

