Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B92F4D2173
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 20:29:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA5DE186C;
	Tue,  8 Mar 2022 20:28:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA5DE186C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646767749;
	bh=IobSk3F+STlIDLS2O75yeurr2/eBvU5LL2S2mVAIBMQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tc8CkYBtQwxyResomLscXzCf8VgiEd4zq5iJm/QtY5i0cAUmSX+dqjyAn+XqYqACl
	 oAqadSzeF3u8c07bhq86Rp1PQJVEES9zbn/5jAdhrcfbIhcWS5GCB6WKXha1R7zmNk
	 mba3dKVY+ix+q//f/uuTaEb0DdezCbIiUtWt4rJI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 611A6F80272;
	Tue,  8 Mar 2022 20:26:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08802F80528; Tue,  8 Mar 2022 20:26:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89941F8025E
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 20:26:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89941F8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="kNDjYnk/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646767604; x=1678303604;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IobSk3F+STlIDLS2O75yeurr2/eBvU5LL2S2mVAIBMQ=;
 b=kNDjYnk/mxXdLDBBcD/BSsiXNNudIR9Ns3CpA/A5DkBUmoq8yLaAom9Z
 v/xjLG3xmfkUSK8w02lQyFT2PgnruN6eFhCkX9kNfyuFIHZox86thremC
 6CX8OPXEiQG6WAKHVZZr9vk7bt+JOIFZmM7fD7+N5zuuqj6PX3KCEuYYe
 mO/ta2mC5fWfORUKKgjVBK0Jy1r0e4HlIiC6KR3Qky9lj2fNFaMEManGQ
 306sjvLM1fHJSUcGIGAdAQprLhVeZmk0g6u3feNEsIlr8PcvKME0QeVar
 XlTxSuXE7I20DQ/h1+PgQpxXiKtjpb3y1rVUTKGeh+r5aB2VRoKcALgDx g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="252363680"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="252363680"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 11:26:39 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="495573938"
Received: from jhaskins-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.53.149])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 11:26:38 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/20] ASoC: SOF: Intel: hda: retrieve DMIC number for I2S
 boards
Date: Tue,  8 Mar 2022 13:25:53 -0600
Message-Id: <20220308192610.392950-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220308192610.392950-1-pierre-louis.bossart@linux.intel.com>
References: <20220308192610.392950-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Huajun Li <huajun.li@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Nikolai Kostrigin <nickel@altlinux.org>, broonie@kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

We currently extract the DMIC number only for HDaudio or SoundWire
platforms. For I2S/TDM platforms, this wasn't necessary until now, but
with devices with ES8336 we need to find a solution to detect dmics
more reliably than with a DMI quirk.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 46 +++++++++++++++++++++------------------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index a99e6608f0b6..711d14a821bb 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -432,11 +432,9 @@ static char *hda_model;
 module_param(hda_model, charp, 0444);
 MODULE_PARM_DESC(hda_model, "Use the given HDA board model.");
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA) || IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
-static int hda_dmic_num = -1;
-module_param_named(dmic_num, hda_dmic_num, int, 0444);
+static int dmic_num_override = -1;
+module_param_named(dmic_num, dmic_num_override, int, 0444);
 MODULE_PARM_DESC(dmic_num, "SOF HDA DMIC number");
-#endif
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 static bool hda_codec_use_common_hdmi = IS_ENABLED(CONFIG_SND_HDA_CODEC_HDMI);
@@ -644,24 +642,35 @@ static int hda_init(struct snd_sof_dev *sdev)
 	return ret;
 }
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA) || IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
-
-static int check_nhlt_dmic(struct snd_sof_dev *sdev)
+static int check_dmic_num(struct snd_sof_dev *sdev)
 {
 	struct nhlt_acpi_table *nhlt;
-	int dmic_num;
+	int dmic_num = 0;
 
 	nhlt = intel_nhlt_init(sdev->dev);
 	if (nhlt) {
 		dmic_num = intel_nhlt_get_dmic_geo(sdev->dev, nhlt);
 		intel_nhlt_free(nhlt);
-		if (dmic_num >= 1 && dmic_num <= 4)
-			return dmic_num;
 	}
 
-	return 0;
+	/* allow for module parameter override */
+	if (dmic_num_override != -1) {
+		dev_dbg(sdev->dev,
+			"overriding DMICs detected in NHLT tables %d by kernel param %d\n",
+			dmic_num, dmic_num_override);
+		dmic_num = dmic_num_override;
+	}
+
+	if (dmic_num < 0 || dmic_num > 4) {
+		dev_dbg(sdev->dev, "invalid dmic_number %d\n", dmic_num);
+		dmic_num = 0;
+	}
+
+	return dmic_num;
 }
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA) || IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
+
 static const char *fixup_tplg_name(struct snd_sof_dev *sdev,
 				   const char *sof_tplg_filename,
 				   const char *idisp_str,
@@ -697,16 +706,8 @@ static int dmic_topology_fixup(struct snd_sof_dev *sdev,
 	const char *dmic_str;
 	int dmic_num;
 
-	/* first check NHLT for DMICs */
-	dmic_num = check_nhlt_dmic(sdev);
-
-	/* allow for module parameter override */
-	if (hda_dmic_num != -1) {
-		dev_dbg(sdev->dev,
-			"overriding DMICs detected in NHLT tables %d by kernel param %d\n",
-			dmic_num, hda_dmic_num);
-		dmic_num = hda_dmic_num;
-	}
+	/* first check for DMICs (using NHLT or module parameter) */
+	dmic_num = check_dmic_num(sdev);
 
 	switch (dmic_num) {
 	case 1:
@@ -1383,6 +1384,9 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 		if (!sof_pdata->tplg_filename)
 			sof_pdata->tplg_filename = mach->sof_tplg_filename;
 
+		/* report to machine driver if any DMICs are found */
+		mach->mach_params.dmic_num = check_dmic_num(sdev);
+
 		if (mach->link_mask) {
 			mach->mach_params.links = mach->links;
 			mach->mach_params.link_mask = mach->link_mask;
-- 
2.30.2

