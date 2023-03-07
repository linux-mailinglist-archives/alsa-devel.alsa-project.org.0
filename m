Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AF66ADAF7
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 10:52:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4827E13F7;
	Tue,  7 Mar 2023 10:51:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4827E13F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678182762;
	bh=5PV34OHuirr6e/oVXEf82YmqHSUKYC/eDJ8OkRRB+V0=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tQRZy22iNTvw1MrQFn7d3UBPsqT9PI+HEWjS632ejF1Nq4pMXy5IWmhzAMnLe1VhI
	 gnxAFzpmbJF/EynPPZjf0kRnmx2geZiyqe4G5LgSlPyH+4OqsH9L99kaXxgj0DKDLJ
	 +LG4UStxRMzTf4biDV2MPbfgQe/cKD5B1tFBix28=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C244BF80236;
	Tue,  7 Mar 2023 10:51:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84B3DF8042F; Tue,  7 Mar 2023 10:51:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E1C7F80093
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 10:51:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E1C7F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Rczui0Qp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678182702; x=1709718702;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5PV34OHuirr6e/oVXEf82YmqHSUKYC/eDJ8OkRRB+V0=;
  b=Rczui0QpC1K57dxnxEdmLxTXSVx+lBSjyR2FV233QbBBncTwwYE87oWZ
   T47KUa+UJX6YRNk/Ftmo8102lQuyZijbdhowUZdM3ujmDw262mNFX7bbj
   ZWAcGBJYa4GUGQQiSxNEc6oHBxTmhWSZbxU2EzvkPnSZVa9CDiZYMe/aF
   Ep1M01WqP2PsWemaibqTxXIY5+VdgL5DO+BukHDR3HwcyxM4jtl1Ekk3N
   gRUmEwY8Xda58IKPebm2gwLpDnSa5E625NE5soShx7R+NCKYufdaBEZ8K
   CUuDjXu2w6G0foJZ+fXRI/QdCULyAGwjwqHNnocVGbqwdP0cbK6NbV+Et
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="363434941"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="363434941"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:51:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="850639519"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="850639519"
Received: from rganesh-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.47.75])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:51:36 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH resend] ASoC: SOF: Intel: hda-loader: use SOF helper for
 consistency
Date: Tue,  7 Mar 2023 11:51:58 +0200
Message-Id: <20230307095158.2818-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZAYCHEJ36YYISYSXYACXD6GSJY23RJ4J
X-Message-ID-Hash: ZAYCHEJ36YYISYSXYACXD6GSJY23RJ4J
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZAYCHEJ36YYISYSXYACXD6GSJY23RJ4J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Update code to remove mix between legacy and SOF definitions. No
functionality change.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
Hi Mark,

for some reason the original patch got missed:
https://lore.kernel.org/alsa-devel/20230117120830.23851-1-peter.ujfalusi@linux.intel.com/

Resending it after placing it on top of you for-next to be sure that it still
applies cleanly.

Regards,
Peter

 sound/soc/sof/intel/hda-loader.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index d680562edb35..de8d9ad89bc7 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -321,13 +321,13 @@ int hda_cl_copy_fw(struct snd_sof_dev *sdev, struct hdac_ext_stream *hext_stream
 int hda_dsp_cl_boot_firmware_iccmax(struct snd_sof_dev *sdev)
 {
 	struct hdac_ext_stream *iccmax_stream;
-	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct snd_dma_buffer dmab_bdl;
 	int ret, ret1;
 	u8 original_gb;
 
 	/* save the original LTRP guardband value */
-	original_gb = snd_hdac_chip_readb(bus, VS_LTRP) & HDA_VS_INTEL_LTRP_GB_MASK;
+	original_gb = snd_sof_dsp_read8(sdev, HDA_DSP_HDA_BAR, HDA_VS_INTEL_LTRP) &
+		HDA_VS_INTEL_LTRP_GB_MASK;
 
 	/*
 	 * Prepare capture stream for ICCMAX. We do not need to store
@@ -356,7 +356,8 @@ int hda_dsp_cl_boot_firmware_iccmax(struct snd_sof_dev *sdev)
 	}
 
 	/* restore the original guardband value after FW boot */
-	snd_hdac_chip_updateb(bus, VS_LTRP, HDA_VS_INTEL_LTRP_GB_MASK, original_gb);
+	snd_sof_dsp_update8(sdev, HDA_DSP_HDA_BAR, HDA_VS_INTEL_LTRP,
+			    HDA_VS_INTEL_LTRP_GB_MASK, original_gb);
 
 	return ret;
 }
-- 
2.39.2

