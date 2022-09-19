Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5D35BCB3D
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 13:56:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 831FC1679;
	Mon, 19 Sep 2022 13:55:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 831FC1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663588590;
	bh=n1Cz8V+eh6GXXapCl/0cNmJDQ+xTNWczKRdbA04p498=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jKf8G9NvwbfN5tKkG/VXjOJjEseOQbeGjFoj/JhWmtMoN2D/Nzc+RJTtOyH2DZ3Qs
	 RQY/MthJwC0wVBwvCuhiG5v4GU2QGERxfac2GW2/EKKUwJyAAE1+2vNO8YpA2TjiYm
	 pb91ecSBO7jv3gWreLJAV8XoniMlF4B63UUNSosc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7A54F80558;
	Mon, 19 Sep 2022 13:54:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B5F1F80557; Mon, 19 Sep 2022 13:54:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 074AAF8053C
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 13:54:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 074AAF8053C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Sr89I6Hn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663588468; x=1695124468;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n1Cz8V+eh6GXXapCl/0cNmJDQ+xTNWczKRdbA04p498=;
 b=Sr89I6HnTemsEUjfTmuabOQsg0/xwPklzwzW84/vOJjkIE58ckHuuhKq
 wRspvOBbXnu7pOMaqdJIds2Rc6T9udr8/OJuuh+9grHjf/AZa2rO7azPm
 6eHeEL2aCoaNpEdNkl1Ryy55HsLnzPtN1dJoQhLsDUAKREw1/9mX3/qDC
 2kb2qMqdZn9JWsjLpdq2M93HH6VHfpmk//z0e8kQR3sCCGUwdAd6PDrH/
 y8yx8pBIQdBXOFnelG9+vWMjGN7a6PD0Z7ZU6LtLE0ZLd6tcw9fn0bxOF
 cbi8eSfvstK5QmyMolIv23eKyT6V9t5+5/ED02wssKTm5Z05SfSWg470P g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10474"; a="300198293"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="300198293"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 04:54:24 -0700
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="744086919"
Received: from amagnus-mobl2.ger.corp.intel.com (HELO pbossart-mobl3.home)
 ([10.249.46.168])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 04:54:21 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 4/4] ASoC: SOF: Intel: hda: override mclk_id after parsing
 NHLT SSP blob
Date: Mon, 19 Sep 2022 13:53:50 +0200
Message-Id: <20220919115350.43104-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220919115350.43104-1-pierre-louis.bossart@linux.intel.com>
References: <20220919115350.43104-1-pierre-louis.bossart@linux.intel.com>
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
 sound/soc/sof/intel/hda.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index ada2e67757494..dfb3b424fb5e3 100644
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
@@ -1557,6 +1570,21 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 
 			sof_pdata->tplg_filename = tplg_filename;
 			add_extension = true;
+
+			mclk_mask = check_nhlt_ssp_mclk_mask(sdev, ssp_num);
+
+			if (mclk_mask < 0) {
+				dev_err(sdev->dev, "Invalid MCLK configuration\n");
+				return NULL;
+			}
+
+			dev_dbg(sdev->dev, "MCLK mask %#x found in NHLT\n", mclk_mask);
+
+			if (mclk_mask) {
+				dev_info(sdev->dev, "Overriding topology with MCLK mask %#x from NHLT\n", mclk_mask);
+				sdev->mclk_id_override = true;
+				sdev->mclk_id_quirk = (mclk_mask & BIT(0)) ? 0 : 1;
+			}
 		}
 
 		if (tplg_fixup && add_extension) {
-- 
2.34.1

