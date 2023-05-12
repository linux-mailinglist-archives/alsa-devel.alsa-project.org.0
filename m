Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FEC700E1A
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 19:48:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF3E0EA0;
	Fri, 12 May 2023 19:48:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF3E0EA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683913735;
	bh=GPyB5hYoL6NUcQCPdbqVoFTExK4bHxVxYeWygZQmxs0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bzyTDjyHyR/AkZ1QujizQrJkbeExbBmZrr7TUKqhQwiilQYuMNkxUiCI8iE8zjw4u
	 DvW6ruv0/AUGYq5htJbhZJyEjnFFb3BIp8myD9kqZa0Js7W1T3hzC7GTYIMcYgUBxB
	 0/COU2xUr2xNKMq8111+9q2iOkx/ciYOW4wH27lo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8593F80544; Fri, 12 May 2023 19:48:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 65F55F8032D;
	Fri, 12 May 2023 19:48:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2FC4F80557; Fri, 12 May 2023 19:46:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CDBACF80534
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 19:46:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDBACF80534
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=f3ml3dBf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683913587; x=1715449587;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GPyB5hYoL6NUcQCPdbqVoFTExK4bHxVxYeWygZQmxs0=;
  b=f3ml3dBfgySuAIqKl0yPhUvGyIvVcFckjiYKydTlqrSBRgRwrzSJifm7
   GxHgMaQcFFmHQVmqNnJojXw3/3hR29MjRyaXuUZaMdBLpo4U0z7zB1Jce
   Vuddfp1ar3M/x4R6J+NG3arsQEbkG0mB+ND8nKun2LHqT1akeV6Gdr0BE
   ME/fzqH4VqhPPCekspMgaxWMxFIRW5C2t/VTcRLzsZs3gIzkKQ8auR9EC
   skmJaHdAz63y93JIjsczFmklo76qkPWPnMU+rA1zqoM02T7V4sdqKgugZ
   eFonj8jKx5jUnnlV0h7opMf6fSfDfBJ7iyOG6xTAhhFuAr+6/kGBw5gWl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="349688073"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="349688073"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 10:46:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="812167797"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="812167797"
Received: from winkelru-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.144.249])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 10:46:23 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vkoul@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [PATCH 5/6] ASoC: SOF: Intel: hda-mlink: initialize instance_offset
 member
Date: Fri, 12 May 2023 12:46:10 -0500
Message-Id: <20230512174611.84372-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230512174611.84372-1-pierre-louis.bossart@linux.intel.com>
References: <20230512174611.84372-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FWKUGUI4SNFRULNPTMQ3R65EBPJXHEPC
X-Message-ID-Hash: FWKUGUI4SNFRULNPTMQ3R65EBPJXHEPC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FWKUGUI4SNFRULNPTMQ3R65EBPJXHEPC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We defined the values but never initialized it for SoundWire/SSP, fix
this miss.

A Fixes: tag is not provided as instance_offset was not used so far,
so nothing was really broken. This patch is only required for the
SoundWire support in the following patch.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-mlink.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index c540b1d75451..2d0c5d5914b1 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -140,6 +140,7 @@ static int hdaml_lnk_enum(struct device *dev, struct hdac_ext2_link *h2link,
 
 	switch (h2link->elid) {
 	case AZX_REG_ML_LEPTR_ID_SDW:
+		h2link->instance_offset = AZX_REG_SDW_INSTANCE_OFFSET;
 		h2link->shim_offset = AZX_REG_SDW_SHIM_OFFSET;
 		h2link->ip_offset = AZX_REG_SDW_IP_OFFSET;
 		h2link->shim_vs_offset = AZX_REG_SDW_VS_SHIM_OFFSET;
@@ -154,6 +155,7 @@ static int hdaml_lnk_enum(struct device *dev, struct hdac_ext2_link *h2link,
 			link_idx, base_offset);
 		break;
 	case AZX_REG_ML_LEPTR_ID_INTEL_SSP:
+		h2link->instance_offset = AZX_REG_INTEL_SSP_INSTANCE_OFFSET;
 		h2link->shim_offset = AZX_REG_INTEL_SSP_SHIM_OFFSET;
 		h2link->ip_offset = AZX_REG_INTEL_SSP_IP_OFFSET;
 		h2link->shim_vs_offset = AZX_REG_INTEL_SSP_VS_SHIM_OFFSET;
-- 
2.37.2

