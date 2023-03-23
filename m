Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFE76C5EF4
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 06:33:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90667EC5;
	Thu, 23 Mar 2023 06:32:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90667EC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679549616;
	bh=yZvrzQd70YjHlJlmhsCqEtarCH/SM9v+ndjTDzenB98=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F5C5YS6p9tQNQF809GFLWHkUfreffIEfIavmEKa1O+qghNbO5RUE6H8Nb7ZELzFix
	 JwpBeqUENL6ZkQO42GskkZoBF5U0G367snz2YASE1jDC2IAWHZm5vGi8qFhN9oJiqH
	 gu/28Pci4saReRtzU+cKleZ7CWjiIny00tAYmBP8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43AB2F8027B;
	Thu, 23 Mar 2023 06:32:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E91B5F8053D; Thu, 23 Mar 2023 06:30:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B4389F80254
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 06:30:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4389F80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=g98uJldm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679549418; x=1711085418;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yZvrzQd70YjHlJlmhsCqEtarCH/SM9v+ndjTDzenB98=;
  b=g98uJldmxFKa6ipHAayDfifYmkiK5xFPek1U8Ta4fsnBUz+5UI3yg0iv
   MD3AbzbHqZL0k+9TX76+WxTnknQkLvOqPolFA7njIXje/usZGSHci06oG
   dYW4FpuJ5palNN5Lk29FOT+00tVPSffF/9eMBWswR8jDEhTgPQobXeT/6
   9f2yK4ck1jun5nuuXcQtHQH995/OEyfRVj2iF2eyx0dTpxJppQDPVRBno
   HlSGJbJ+MG17O1PhI0Jrls9Q7bXH4zLMx3hBWFP1OVIXQExz4bx6JJ0nq
   KlQxwNnmNXxqF6UEJlust5kuH/BBNkG2ih5r15xY/Sk8eaDf65BvgM8iR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="327779289"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="327779289"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 22:29:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="675566989"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="675566989"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 22:29:53 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org,
	broonie@kernel.org
Subject: [PATCH 02/20] soundwire: intel: add ACE2.x SHIM definitions
Date: Thu, 23 Mar 2023 13:44:34 +0800
Message-Id: <20230323054452.1543233-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
References: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Q5QZLQ5XUVE5LZLE57QE45WZ2ZKLF2G2
X-Message-ID-Hash: Q5QZLQ5XUVE5LZLE57QE45WZ2ZKLF2G2
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com, tiwai@suse.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q5QZLQ5XUVE5LZLE57QE45WZ2ZKLF2G2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

With the HDaudio extended link integration, the SHIM and IP registers
are split in blocks

a) SHIM generic registers
b) IP registers (same offsets for Cadence IP as before)
c) SHIM vendor-specific registers

Add offsets and definitions as defined in the hardware specifications.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/linux/soundwire/sdw_intel.h | 75 +++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 207701aeeb47..8e6183e029fa 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -7,6 +7,10 @@
 #include <linux/irqreturn.h>
 #include <linux/soundwire/sdw.h>
 
+/*********************************************************************
+ * cAVS and ACE1.x definitions
+ *********************************************************************/
+
 #define SDW_SHIM_BASE			0x2C000
 #define SDW_ALH_BASE			0x2C800
 #define SDW_SHIM_BASE_ACE		0x38000
@@ -101,6 +105,77 @@
 #define SDW_ALH_STRMZCFG_DMAT		GENMASK(7, 0)
 #define SDW_ALH_STRMZCFG_CHN		GENMASK(19, 16)
 
+/*********************************************************************
+ * ACE2.x definitions for SHIM registers - only accessible when the
+ * HDAudio extended link LCTL.SPA/CPA = 1.
+ *********************************************************************/
+/* x variable is link index */
+#define SDW_SHIM2_GENERIC_BASE(x)	(0x00030000 + 0x8000 * (x))
+#define SDW_IP_BASE(x)			(0x00030100 + 0x8000 * (x))
+#define SDW_SHIM2_VS_BASE(x)		(0x00036000 + 0x8000 * (x))
+
+/* SHIM2 Generic Registers */
+/* Read-only capabilities */
+#define SDW_SHIM2_LECAP			0x00
+#define SDW_SHIM2_LECAP_HDS		BIT(0)		/* unset -> Host mode */
+#define SDW_SHIM2_LECAP_MLC		GENMASK(3, 1)	/* Number of Lanes */
+
+/* PCM Stream capabilities */
+#define SDW_SHIM2_PCMSCAP		0x10
+#define SDW_SHIM2_PCMSCAP_ISS		GENMASK(3, 0)	/* Input-only streams */
+#define SDW_SHIM2_PCMSCAP_OSS		GENMASK(7, 4)	/* Output-only streams */
+#define SDW_SHIM2_PCMSCAP_BSS		GENMASK(12, 8)	/* Bidirectional streams */
+
+/* Read-only PCM Stream Channel Count, y variable is stream */
+#define SDW_SHIM2_PCMSYCHC(y)		(0x14 + (0x4 * (y)))
+#define SDW_SHIM2_PCMSYCHC_CS		GENMASK(3, 0)	/* Channels Supported */
+
+/* PCM Stream Channel Map */
+#define SDW_SHIM2_PCMSYCHM(y)		(0x16 + (0x4 * (y)))
+#define SDW_SHIM2_PCMSYCHM_LCHAN	GENMASK(3, 0)	/* Lowest channel used by the FIFO port */
+#define SDW_SHIM2_PCMSYCHM_HCHAN	GENMASK(7, 4)	/* Lowest channel used by the FIFO port */
+#define SDW_SHIM2_PCMSYCHM_STRM		GENMASK(13, 8)	/* HDaudio stream tag */
+#define SDW_SHIM2_PCMSYCHM_DIR		BIT(15)		/* HDaudio stream direction */
+
+/* SHIM2 vendor-specific registers */
+#define SDW_SHIM2_INTEL_VS_LVSCTL	0x04
+#define SDW_SHIM2_INTEL_VS_LVSCTL_FCG	BIT(26)
+#define SDW_SHIM2_INTEL_VS_LVSCTL_MLCS	GENMASK(29, 27)
+#define SDW_SHIM2_INTEL_VS_LVSCTL_DCGD	BIT(30)
+#define SDW_SHIM2_INTEL_VS_LVSCTL_ICGD	BIT(31)
+
+#define SDW_SHIM2_MLCS_XTAL_CLK		0x0
+#define SDW_SHIM2_MLCS_CARDINAL_CLK	0x1
+#define SDW_SHIM2_MLCS_AUDIO_PLL_CLK	0x2
+#define SDW_SHIM2_MLCS_MCLK_INPUT_CLK	0x3
+#define SDW_SHIM2_MLCS_WOV_RING_OSC_CLK 0x4
+
+#define SDW_SHIM2_INTEL_VS_WAKEEN	0x08
+#define SDW_SHIM2_INTEL_VS_WAKEEN_PWE	BIT(0)
+
+#define SDW_SHIM2_INTEL_VS_WAKESTS	0x0A
+#define SDW_SHIM2_INTEL_VS_WAKEEN_PWS	BIT(0)
+
+#define SDW_SHIM2_INTEL_VS_IOCTL	0x0C
+#define SDW_SHIM2_INTEL_VS_IOCTL_MIF	BIT(0)
+#define SDW_SHIM2_INTEL_VS_IOCTL_CO	BIT(1)
+#define SDW_SHIM2_INTEL_VS_IOCTL_COE	BIT(2)
+#define SDW_SHIM2_INTEL_VS_IOCTL_DO	BIT(3)
+#define SDW_SHIM2_INTEL_VS_IOCTL_DOE	BIT(4)
+#define SDW_SHIM2_INTEL_VS_IOCTL_BKE	BIT(5)
+#define SDW_SHIM2_INTEL_VS_IOCTL_WPDD	BIT(6)
+#define SDW_SHIM2_INTEL_VS_IOCTL_ODC	BIT(7)
+#define SDW_SHIM2_INTEL_VS_IOCTL_CIBD	BIT(8)
+#define SDW_SHIM2_INTEL_VS_IOCTL_DIBD	BIT(9)
+#define SDW_SHIM2_INTEL_VS_IOCTL_HAMIFD	BIT(10)
+
+#define SDW_SHIM2_INTEL_VS_ACTMCTL	0x0E
+#define SDW_SHIM2_INTEL_VS_ACTMCTL_DACTQE	BIT(0)
+#define SDW_SHIM2_INTEL_VS_ACTMCTL_DODS		BIT(1)
+#define SDW_SHIM2_INTEL_VS_ACTMCTL_DODSE	BIT(2)
+#define SDW_SHIM2_INTEL_VS_ACTMCTL_DOAIS	GENMASK(4, 3)
+#define SDW_SHIM2_INTEL_VS_ACTMCTL_DOAISE	BIT(5)
+
 /**
  * struct sdw_intel_stream_params_data: configuration passed during
  * the @params_stream callback, e.g. for interaction with DSP
-- 
2.25.1

