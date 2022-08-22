Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CA659C7C0
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 21:02:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE587839;
	Mon, 22 Aug 2022 21:01:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE587839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661194923;
	bh=eOpm986iXtVUkDVU20tDY31pNcq5sSSBsntUs7MV7+8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ePUTTRYVBAbLKE2fDKyIcjr+M+3paZolNYHF0Ren0dc50N+Jb2ZDy/WtLHnO7PG1d
	 z6vOvbMsr3/lhocATIp1wk5RKrO+rWSv8ifX7GyOss7mtbBB77OIVZTA8obNh1siNI
	 1gaeHwr5X9ocrjy+IXA1Dn3MWGoEbV3Wm4JsZV+Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D9A0F80553;
	Mon, 22 Aug 2022 20:59:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDA56F80552; Mon, 22 Aug 2022 20:59:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 244B0F8052F
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 20:59:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 244B0F8052F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="L6r7igR+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661194785; x=1692730785;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eOpm986iXtVUkDVU20tDY31pNcq5sSSBsntUs7MV7+8=;
 b=L6r7igR+IkcT4HrcRmfI4V7UrpGMESYeDcebG6ISNa1P3cDbyNSFQS2E
 qkbRK1gQVY3CUxzqNf5X1nyzCeefHrERb/xbvjVhdoRM985cRuv9LfU/5
 TwZfgu3xl6PfQQZcltXtlQvu1Y8PGlmwSl3OyT1omXNlM5th6aDX7bNL1
 bqyuzxMnjl7NfAcTupKQ70v6+sx0jwLmV2DxJMY3jv1Ee94wRYzp6kRZd
 jET58cVn9biqfz1oe7zpp6silm2EeyQM18NN80/yB4Y1COoUtBqPXXh4J
 9JAzAwjzK1+oMuYyqZFdAYgSCsTpMYOWwEmHko3A7yoPaXZF+qrKa4X7Z g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="379786513"
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; d="scan'208";a="379786513"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 11:59:42 -0700
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; d="scan'208";a="669676562"
Received: from apascali-mobl2.ger.corp.intel.com (HELO pbossart-mobl3.home)
 ([10.252.42.21])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 11:59:39 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/4] ASoC: SOF: Intel: hda: override mclk_id after parsing
 NHLT SSP blob
Date: Mon, 22 Aug 2022 20:59:10 +0200
Message-Id: <20220822185911.170440-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822185911.170440-1-pierre-louis.bossart@linux.intel.com>
References: <20220822185911.170440-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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

The NHLT is already used to determine which SSP is connected to an
audio codec, we can parse the SSP blob to get the mclk_id from NHLT.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index ada2e67757494..9048cc842d3f2 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -753,6 +753,18 @@ static int check_nhlt_ssp_mask(struct snd_sof_dev *sdev)
 	return ssp_mask;
 }
 
+static int check_nhlt_ssp_mclk_mask(struct snd_sof_dev *sdev, int ssp_num)
+{
+	struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
+	struct nhlt_acpi_table *nhlt;
+
+	nhlt = hdev->nhlt;
+	if (!nhlt)
+		return 0;
+
+	return intel_nhlt_ssp_mclk_mask(nhlt, ssp_num);
+}
+
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA) || IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
 
 static const char *fixup_tplg_name(struct snd_sof_dev *sdev,
@@ -1533,6 +1545,7 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 		    mach->mach_params.i2s_link_mask) {
 			const struct sof_intel_dsp_desc *chip = get_chip_info(sdev->pdata);
 			int ssp_num;
+			int mclk_mask;
 
 			if (hweight_long(mach->mach_params.i2s_link_mask) > 1 &&
 			    !(mach->tplg_quirk_mask & SND_SOC_ACPI_TPLG_INTEL_SSP_MSB))
@@ -1557,6 +1570,16 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 
 			sof_pdata->tplg_filename = tplg_filename;
 			add_extension = true;
+
+			mclk_mask = check_nhlt_ssp_mclk_mask(sdev, ssp_num);
+
+			dev_dbg(sdev->dev, "MCLK mask %#x found in NHLT\n", mclk_mask);
+
+			if (mclk_mask && mclk_mask != GENMASK(1, 0)) {
+				dev_info(sdev->dev, "Overriding topology with MCLK mask %#x from NHLT\n", mclk_mask);
+				sdev->mclk_id_override = true;
+				sdev->mclk_id_quirk = (mclk_mask & BIT(0)) ? 0 : 1;
+			}
 		}
 
 		if (tplg_fixup && add_extension) {
-- 
2.34.1

