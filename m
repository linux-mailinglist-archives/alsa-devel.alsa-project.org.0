Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECDC69C63C
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Feb 2023 09:02:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70244EB6;
	Mon, 20 Feb 2023 09:01:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70244EB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676880166;
	bh=NxxuL35qJPr+B6qjnCFUkKo9tOTNUWkP+2cD/7tSF3w=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lNsdUwUqjAQXsDvRVAWlAgOB7VUZYN3rwEMk1IWMx1C26hStb33wbuqdqWpYXRQWO
	 l/EYfi/WxcTnYmaHqm/hhrIG7yUzHuBIJO6lRCylnPNqePdGd4anapTzPm7xwp6dx7
	 sxxvMP/lOUU5B3fzUFHDAw9jLxe06spQx6Ei2NSo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7951FF80496;
	Mon, 20 Feb 2023 09:01:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D47BF802DB; Mon, 20 Feb 2023 08:58:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A89B0F8025A
	for <alsa-devel@alsa-project.org>; Mon, 20 Feb 2023 08:58:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A89B0F8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Y+nqxNfI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676879883; x=1708415883;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NxxuL35qJPr+B6qjnCFUkKo9tOTNUWkP+2cD/7tSF3w=;
  b=Y+nqxNfIuoglCyMhs8i8ReaVMc+cnwhIIiK4YnCdxOs6YyM2vLK00Rwq
   vs83CY1lHr9kzY8sj7t8Ro2Uy/+mGOxChr79myy3Xp0iRtk+wkztnumMA
   BCd2uArw579xB9Ohcf+bnTUXpF/fyYmXTsxBXrjnGE/8DwUpIEIU40j3P
   TQfQ192e5f1oaqrLJeXowjt+umwOO8jkrsD6khaMP32AjuAyFyJj28son
   R80+KcH9Cpc2Bvr/M9QseAW/Qq/M51q/QhOi8RIimuvzQjJNtTzyvfLLY
   S8nGyXMWCKtxP5U6C7q61WdVSKR8Re1eYeO4unged8Ipchnis3pQQuMZ3
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="394827760"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000";
   d="scan'208";a="394827760"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2023 23:58:01 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="845239779"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000";
   d="scan'208";a="845239779"
Received: from mmocanu-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.214.33])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2023 23:57:58 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 3/3] ASoC: SOF: Intel: MTL: Enable DMI L1
Date: Mon, 20 Feb 2023 09:58:04 +0200
Message-Id: <20230220075804.4829-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230220075804.4829-1-peter.ujfalusi@linux.intel.com>
References: <20230220075804.4829-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VZO4GQF5PVTB6VCIBIA2OIHHNKPP7F5N
X-Message-ID-Hash: VZO4GQF5PVTB6VCIBIA2OIHHNKPP7F5N
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, yung-chuan.liao@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

DMI L1 should be enabled unconditionally after FW boot is complete.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/mtl.c | 3 +++
 sound/soc/sof/intel/mtl.h | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 307faad2ecf4..216fd07a3a93 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -280,6 +280,9 @@ static int mtl_dsp_post_fw_run(struct snd_sof_dev *sdev)
 	}
 
 	hda_sdw_int_enable(sdev, true);
+
+	/* enable DMI L1 */
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, MTL_EM2, MTL_EM2_L1SEN, MTL_EM2_L1SEN);
 	return 0;
 }
 
diff --git a/sound/soc/sof/intel/mtl.h b/sound/soc/sof/intel/mtl.h
index 26418fb08807..ddc05304a9d5 100644
--- a/sound/soc/sof/intel/mtl.h
+++ b/sound/soc/sof/intel/mtl.h
@@ -28,6 +28,8 @@
 #define MTL_HFINTIPPTR_PTR_MASK		GENMASK(20, 0)
 
 #define MTL_HDA_VS_D0I3C		0x1D4A
+#define MTL_EM2				0x1c44
+#define MTL_EM2_L1SEN			BIT(13)
 
 #define MTL_DSP2CXCAP_PRIMARY_CORE	0x178D00
 #define MTL_DSP2CXCTL_PRIMARY_CORE	0x178D04
-- 
2.39.2

