Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 113BD904C40
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 09:01:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99EADFAA;
	Wed, 12 Jun 2024 09:01:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99EADFAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718175709;
	bh=crewVMHSfJKgeI4smrQVHU61rtSFJP+uy4uxd/EJzag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RoSVPyDf/5nj0m4lUrWl0EnURoFPFIffd9vHVmFYmpQtpnoU51X5tODwZzfdMfbd5
	 PKixqNVhJt5cDsb15UB6V9jjPYvftLv+DFu+G9/IcYEwtuNNBTjE9Drx0D1AmZbMVi
	 QiIVD9BTUsZaBTmxCE7oaS2xPa0xOOFuSlaw3v1s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9436AF805D6; Wed, 12 Jun 2024 09:01:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DF94F805DF;
	Wed, 12 Jun 2024 09:01:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1774F80580; Wed, 12 Jun 2024 09:01:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E5E70F8057A
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 08:59:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5E70F8057A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DzA1VL/h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718175569; x=1749711569;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=crewVMHSfJKgeI4smrQVHU61rtSFJP+uy4uxd/EJzag=;
  b=DzA1VL/hBPsZ0DSznYLvTJWV2aRJU+2VTHnq7fxasOOeebn8dq5LN/jB
   eaXNCnq8yrnJqeS5no66qrWaMNPJ+Vy2MrLjwp7K3b20eznxqhKUlBYn9
   g4ZILf1YNHUs9Ri7vijURubK4wa1vawxdSSXx7fV3STr8Tm8vw2DnagIm
   xW1KNezHQvTVmuSkNPYKziQIoSpV1MDJbKKVijkVLd6nwGTNVaPInVkJ1
   3lMPRXhmROmsgupWLHSgOdmynjdR15qPpQIPsmmpM8yZD5PMgsUo5yiq/
   YQw4r9jZ5nysUBbtdH7o7v8I/79NuoIjZT8L0raPL0v1EqgnI13vRUpVu
   Q==;
X-CSE-ConnectionGUID: lMtC21GTQ8671dzrjZDTjg==
X-CSE-MsgGUID: E1NgF6A4QuSbKH0e9aPOsQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="15147425"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000";
   d="scan'208";a="15147425"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 23:59:27 -0700
X-CSE-ConnectionGUID: /tB3R0R4SZ2p05eNkahrNA==
X-CSE-MsgGUID: iExHUtZWQaawL98siFUsHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000";
   d="scan'208";a="70486853"
Received: from iklimasz-mobl1.ger.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.245.246.56])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 23:59:24 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Fred Oh <fred.oh@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 1/5] ASoC: SOF: Intel: add PTL specific power control register
Date: Wed, 12 Jun 2024 08:58:54 +0200
Message-ID: <20240612065858.53041-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240612065858.53041-1-pierre-louis.bossart@linux.intel.com>
References: <20240612065858.53041-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QC3H74YVJVRP5GCXG3IK5YCXPJMH724A
X-Message-ID-Hash: QC3H74YVJVRP5GCXG3IK5YCXPJMH724A
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QC3H74YVJVRP5GCXG3IK5YCXPJMH724A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Fred Oh <fred.oh@linux.intel.com>

PTL has some differences from MTL/LNL. Need to use different register
to power up.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Fred Oh <fred.oh@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/mtl.c | 16 ++++++++++++++--
 sound/soc/sof/intel/mtl.h |  2 ++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 1bf274509ee6..2b9d22ccf345 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -245,6 +245,18 @@ int mtl_dsp_pre_fw_run(struct snd_sof_dev *sdev)
 	u32 cpa;
 	u32 pgs;
 	int ret;
+	u32 dsppwrctl;
+	u32 dsppwrsts;
+	const struct sof_intel_dsp_desc *chip;
+
+	chip = get_chip_info(sdev->pdata);
+	if (chip->hw_ip_version > SOF_INTEL_ACE_2_0) {
+		dsppwrctl = PTL_HFPWRCTL2;
+		dsppwrsts = PTL_HFPWRSTS2;
+	} else {
+		dsppwrctl = MTL_HFPWRCTL;
+		dsppwrsts = MTL_HFPWRSTS;
+	}
 
 	/* Set the DSP subsystem power on */
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, MTL_HFDSSCS,
@@ -264,14 +276,14 @@ int mtl_dsp_pre_fw_run(struct snd_sof_dev *sdev)
 	}
 
 	/* Power up gated-DSP-0 domain in order to access the DSP shim register block. */
-	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, MTL_HFPWRCTL,
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, dsppwrctl,
 				MTL_HFPWRCTL_WPDSPHPXPG, MTL_HFPWRCTL_WPDSPHPXPG);
 
 	usleep_range(1000, 1010);
 
 	/* poll with timeout to check if operation successful */
 	pgs = MTL_HFPWRSTS_DSPHPXPGS_MASK;
-	ret = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR, MTL_HFPWRSTS, dsphfpwrsts,
+	ret = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR, dsppwrsts, dsphfpwrsts,
 					    (dsphfpwrsts & pgs) == pgs,
 					    HDA_DSP_REG_POLL_INTERVAL_US,
 					    HDA_DSP_RESET_TIMEOUT_US);
diff --git a/sound/soc/sof/intel/mtl.h b/sound/soc/sof/intel/mtl.h
index 7acaa7e724f4..9ab4b21c960e 100644
--- a/sound/soc/sof/intel/mtl.h
+++ b/sound/soc/sof/intel/mtl.h
@@ -12,9 +12,11 @@
 #define MTL_HFDSSCS_CPA_MASK		BIT(24)
 #define MTL_HFSNDWIE			0x114C
 #define MTL_HFPWRCTL			0x1D18
+#define PTL_HFPWRCTL2			0x1D20
 #define MTL_HfPWRCTL_WPIOXPG(x)		BIT((x) + 8)
 #define MTL_HFPWRCTL_WPDSPHPXPG		BIT(0)
 #define MTL_HFPWRSTS			0x1D1C
+#define PTL_HFPWRSTS2			0x1D24
 #define MTL_HFPWRSTS_DSPHPXPGS_MASK	BIT(0)
 #define MTL_HFINTIPPTR			0x1108
 #define MTL_IRQ_INTEN_L_HOST_IPC_MASK	BIT(0)
-- 
2.43.0

