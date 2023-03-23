Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A40AC6C5F0D
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 06:38:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC45EEED;
	Thu, 23 Mar 2023 06:37:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC45EEED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679549901;
	bh=TZ+6Ux/vWHTp7+2fBxz2s/j5BxjCv70QKxkw1tIhFkw=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T2Dtd2ihjTUo7JvuPS3k1ue0/kMAIA0WxuZ4eEw731y4qAOwLYf/bYNrDcF4B0xRL
	 jnJ9b6fSAcyDGttnTvtZAdK+Pf/OGLp72/9qQfzTJMVrKJA9rFKAsgXOAXlPNZHUKu
	 IV2Lb32lQS3f0kMoiTFlf542f68TaCWrr3Z/rIcM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BB802F800C9;
	Thu, 23 Mar 2023 06:33:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D32EF8027B; Thu, 23 Mar 2023 06:33:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8A4A9F80529
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 06:30:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A4A9F80529
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=O1zq7eT3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679549424; x=1711085424;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TZ+6Ux/vWHTp7+2fBxz2s/j5BxjCv70QKxkw1tIhFkw=;
  b=O1zq7eT3WT8YUtArdsvz7LFdSiVmcEuO8gyqPVoya1hpDJpFCs+/gU/O
   mtAxxCna7GDwOSh71D913WkN0oOHuHGyd3XUQu9f7DrPtFaL/dQTiuBPd
   z3G/eWFrB/w82lNQhpF7ZVFsaPfPqNdXD614/qxqb8Bo1jJ5lhfA9581Q
   Mby4Qgj5szwpLZ6pUyiy8QwuWMpFZ93386n6uphiJ1pAwx2YIIZ+uSnMs
   Z7NIunuSMgWyLBTDOGaZECbqQcKWHAlxBNGrLx54pNm6/Fp88qTemLe3o
   cobo0USUotSbc/g2G6JdAo9O5MAdHT7dnucy5sHBDNkdMwWNgcgSMI4zb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="327779372"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="327779372"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 22:30:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="675567055"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="675567055"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 22:30:08 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org,
	broonie@kernel.org
Subject: [PATCH 08/20] ASoC: SOF: Intel: hda: retrieve SoundWire eml_lock and
 pass pointer
Date: Thu, 23 Mar 2023 13:44:40 +0800
Message-Id: <20230323054452.1543233-9-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
References: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GF7TUGSA4A2A4WI3FF6SLLTRMCKYTOW6
X-Message-ID-Hash: GF7TUGSA4A2A4WI3FF6SLLTRMCKYTOW6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GF7TUGSA4A2A4WI3FF6SLLTRMCKYTOW6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Use new helper and interface to make sure the HDaudio and SoundWire
parts use the same mutex when accessing shared registers.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 22eba57bb3e6..f8cd5a9ebad1 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -215,6 +215,15 @@ static int hda_sdw_probe(struct snd_sof_dev *sdev)
 		res.alh_base = hdev->desc->sdw_alh_base;
 		res.ext = false;
 	} else {
+		/*
+		 * retrieve eml_lock needed to protect shared registers
+		 * in the HDaudio multi-link areas
+		 */
+		res.eml_lock = hdac_bus_eml_get_mutex(sof_to_bus(sdev), true,
+						      AZX_REG_ML_LEPTR_ID_SDW);
+		if (!res.eml_lock)
+			return -ENODEV;
+
 		res.mmio_base = sdev->bar[HDA_DSP_HDA_BAR];
 		/*
 		 * the SHIM and SoundWire register offsets are link-specific
-- 
2.25.1

