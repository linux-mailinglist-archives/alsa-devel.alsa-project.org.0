Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CA5720AB4
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 23:00:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 563E274C;
	Fri,  2 Jun 2023 22:59:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 563E274C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685739632;
	bh=Tkkq7ODMJDQwyRFINWRZ18sHvVC9DAhFsR52IuKp6mU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vr0Bpr1MuLLBa8+8ELDM71D8/ciu0gnN4d9pL4yXbogMwvYdw0KEp5RfR9SKj3yzs
	 s4kCBHtJiduTbvcowwynSW2Kma5/qAXfs3Q2cpYkNFql4bx3w8H7Gt8gt819EiyrwT
	 nTKX3oANny/PhsSsgcSLc9AgvpXudyruuWT7DzZ8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 623ACF805ED; Fri,  2 Jun 2023 22:57:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C624CF805E9;
	Fri,  2 Jun 2023 22:57:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D53CF80563; Fri,  2 Jun 2023 22:56:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BBF65F80527
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 22:56:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBF65F80527
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=eVT3vHcl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685739403; x=1717275403;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Tkkq7ODMJDQwyRFINWRZ18sHvVC9DAhFsR52IuKp6mU=;
  b=eVT3vHclhabsiE+JOnVQwqaSM9+ygkxOEwPgN+eJx57yFy6M1IhOuyqY
   X/A/dgW5mKIiI8BasebVrspFTf6/rTxrjQH7bo50VrXmYCgmClC0h0iR9
   bgow9RWFYOlvJXmrAa0t+qD6z220YdmXR+iogXyiROg3g0gCx9grajzPL
   6GP8O3TZGL/LWyl09EfPSsirOu7NPQykv2v1Br5g/VXP7rPwG9YIiduaz
   yxEdZtzyvudVHUVL1qiItFvPOYjfk07KPHrXEOAWNFtTnpo8TUMJTrVwo
   sBQjjoyNakqTsXYoHkqcsnA/alUUHbVQ3+NZT5ZQ2y15T7UHZORWQMAMp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="359272122"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="359272122"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:56:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="832092728"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="832092728"
Received: from sbalabha-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.190.110])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:56:38 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vinod.koul@intel.com,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 9/9] ASoC: SOF: Intel: hda: add helper to extract SoundWire
 link count
Date: Fri,  2 Jun 2023 15:56:20 -0500
Message-Id: <20230602205620.310879-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230602205620.310879-1-pierre-louis.bossart@linux.intel.com>
References: <20230602205620.310879-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 37M3BXDRHDGYVVENGPCPNLFP3VV3WUAC
X-Message-ID-Hash: 37M3BXDRHDGYVVENGPCPNLFP3VV3WUAC
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/37M3BXDRHDGYVVENGPCPNLFP3VV3WUAC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The register changed with the HDaudio integration, the information is
present in the extended link descriptor and not in the SHIM.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 25 +++++++++++++++++++++++++
 sound/soc/sof/intel/hda.h |  6 ++++++
 2 files changed, 31 insertions(+)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 94aa35f96f52..64bebe1a72bb 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -245,6 +245,31 @@ int hda_sdw_check_lcount_common(struct snd_sof_dev *sdev)
 	return 0;
 }
 
+int hda_sdw_check_lcount_ext(struct snd_sof_dev *sdev)
+{
+	struct sof_intel_hda_dev *hdev;
+	struct sdw_intel_ctx *ctx;
+	struct hdac_bus *bus;
+	u32 slcount;
+
+	bus = sof_to_bus(sdev);
+
+	hdev = sdev->pdata->hw_pdata;
+	ctx = hdev->sdw;
+
+	slcount = hdac_bus_eml_get_count(bus, true, AZX_REG_ML_LEPTR_ID_SDW);
+
+	/* Check HW supported vs property value */
+	if (slcount < ctx->count) {
+		dev_err(sdev->dev,
+			"%s: BIOS master count %d is larger than hardware capabilities %d\n",
+			__func__, ctx->count, slcount);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int hda_sdw_check_lcount(struct snd_sof_dev *sdev)
 {
 	const struct sof_intel_dsp_desc *chip;
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 8ca43303d97f..3f7c6fb05e5d 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -781,6 +781,7 @@ int hda_dsp_trace_trigger(struct snd_sof_dev *sdev, int cmd);
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
 
 int hda_sdw_check_lcount_common(struct snd_sof_dev *sdev);
+int hda_sdw_check_lcount_ext(struct snd_sof_dev *sdev);
 int hda_sdw_startup(struct snd_sof_dev *sdev);
 void hda_common_enable_sdw_irq(struct snd_sof_dev *sdev, bool enable);
 void hda_sdw_int_enable(struct snd_sof_dev *sdev, bool enable);
@@ -794,6 +795,11 @@ static inline int hda_sdw_check_lcount_common(struct snd_sof_dev *sdev)
 	return 0;
 }
 
+static inline int hda_sdw_check_lcount_ext(struct snd_sof_dev *sdev)
+{
+	return 0;
+}
+
 static inline int hda_sdw_startup(struct snd_sof_dev *sdev)
 {
 	return 0;
-- 
2.37.2

