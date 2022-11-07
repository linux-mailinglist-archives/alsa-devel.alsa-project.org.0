Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA9461FA30
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Nov 2022 17:44:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 801AD857;
	Mon,  7 Nov 2022 17:43:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 801AD857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667839452;
	bh=pmvnGaAmyGbD2seuoaYirUc1xCguKpVtZjj4gxJViZ4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hdmeHCX5mAmAL30KSJg9P4df1C6EzJ0La86OCY85Ig1+Klx81ml+5N1Iag1Nn1htc
	 TP3JWk3kP6HyDgKNgmSxvYPSDpqcemx2BvSNkmAeLdWzXG/mEHQv4wlZd6E45BwWru
	 3x1utGzFRQMtcW0aY1Tk3V8+aoTpmwI/P2zq4/Es=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25AC9F80557;
	Mon,  7 Nov 2022 17:42:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5874CF804D0; Mon,  7 Nov 2022 17:42:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 677C1F8024C
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 17:42:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 677C1F8024C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="h2evc8vb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667839346; x=1699375346;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pmvnGaAmyGbD2seuoaYirUc1xCguKpVtZjj4gxJViZ4=;
 b=h2evc8vb3YrP29eOHIfSyW8AiVk1uO4A92wb0PL2sQM32QvAZ24kv4vJ
 pETbtTcgXCJPgEBEdldC4PUgU4o4iKuYmHU9oHHo8S+adXojVS/6Em17N
 RPpX/MtKYhFLIdlskGpMswYpnmpKtZ1q09prmIv1R5s+DU4y23zw1BbBB
 8HbDEkG4Q+9gfdgcjTqzIxiOY3gYzBIX+nDtjEABy+irX3qVoQFfPBCwC
 PotucgD1/kdwERk5OPJt7tg9Oed1CkUgjmV3VwDj9Fhh5DmbdL6j+nLQ6
 1GV6a8urAS0rcxnHTNrXEK/3zTrn6gUw/VGSg4nOiGTG07/RHRHoQHYyM A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="308081278"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="308081278"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 08:42:19 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="778554126"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="778554126"
Received: from seanabue-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.82.80])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 08:42:18 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/3] ASoC: SOF: Intel: set d0i3 register with d0i3_offset
Date: Mon,  7 Nov 2022 10:41:54 -0600
Message-Id: <20221107164154.21925-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221107164154.21925-1-pierre-louis.bossart@linux.intel.com>
References: <20221107164154.21925-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>
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

From: Rander Wang <rander.wang@intel.com>

Set the d0i3 with d0i3_offset for different platforms

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 6d5c26a2147e..5fa29df54b42 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -348,8 +348,12 @@ void hda_dsp_ipc_int_disable(struct snd_sof_dev *sdev)
 static int hda_dsp_wait_d0i3c_done(struct snd_sof_dev *sdev)
 {
 	int retry = HDA_DSP_REG_POLL_RETRY_COUNT;
+	struct snd_sof_pdata *pdata = sdev->pdata;
+	const struct sof_intel_dsp_desc *chip;
 
-	while (snd_sof_dsp_read8(sdev, HDA_DSP_HDA_BAR, SOF_HDA_VS_D0I3C) & SOF_HDA_VS_D0I3C_CIP) {
+	chip = get_chip_info(pdata);
+	while (snd_sof_dsp_read8(sdev, HDA_DSP_HDA_BAR, chip->d0i3_offset) &
+		SOF_HDA_VS_D0I3C_CIP) {
 		if (!retry--)
 			return -ETIMEDOUT;
 		usleep_range(10, 15);
@@ -377,29 +381,32 @@ static int hda_dsp_send_pm_gate_ipc(struct snd_sof_dev *sdev, u32 flags)
 
 static int hda_dsp_update_d0i3c_register(struct snd_sof_dev *sdev, u8 value)
 {
-	struct hdac_bus *bus = sof_to_bus(sdev);
+	struct snd_sof_pdata *pdata = sdev->pdata;
+	const struct sof_intel_dsp_desc *chip;
 	int ret;
 	u8 reg;
 
+	chip = get_chip_info(pdata);
+
 	/* Write to D0I3C after Command-In-Progress bit is cleared */
 	ret = hda_dsp_wait_d0i3c_done(sdev);
 	if (ret < 0) {
-		dev_err(bus->dev, "CIP timeout before D0I3C update!\n");
+		dev_err(sdev->dev, "CIP timeout before D0I3C update!\n");
 		return ret;
 	}
 
 	/* Update D0I3C register */
-	snd_sof_dsp_update8(sdev, HDA_DSP_HDA_BAR,
-			    SOF_HDA_VS_D0I3C, SOF_HDA_VS_D0I3C_I3, value);
+	snd_sof_dsp_update8(sdev, HDA_DSP_HDA_BAR, chip->d0i3_offset,
+			    SOF_HDA_VS_D0I3C_I3, value);
 
 	/* Wait for cmd in progress to be cleared before exiting the function */
 	ret = hda_dsp_wait_d0i3c_done(sdev);
 	if (ret < 0) {
-		dev_err(bus->dev, "CIP timeout after D0I3C update!\n");
+		dev_err(sdev->dev, "CIP timeout after D0I3C update!\n");
 		return ret;
 	}
 
-	reg = snd_sof_dsp_read8(sdev, HDA_DSP_HDA_BAR, SOF_HDA_VS_D0I3C);
+	reg = snd_sof_dsp_read8(sdev, HDA_DSP_HDA_BAR, chip->d0i3_offset);
 	trace_sof_intel_D0I3C_updated(sdev, reg);
 
 	return 0;
-- 
2.34.1

