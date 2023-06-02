Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84692720A4B
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 22:29:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F19FA839;
	Fri,  2 Jun 2023 22:28:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F19FA839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685737764;
	bh=p9wu4yKSwyYSMarwbgrzIPvNBsmCjQJZ4D0HlcoY1Zg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gNM2f+cPKY24U1FlWlcNvnMq469RWAA1FKhlBAkDZ0WoFw5CUp2RFAua/ZF4V4qn+
	 jXETRLa2OvT5D1MBi+sjgGxdsv/SDIS4OPlp8WHduLAtjuYImdviWf4OD24zrLMCaD
	 dvlTptV/KEMI55kxPLBHx3w//PYvqflf2lQS0QHw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D0C1F80655; Fri,  2 Jun 2023 22:24:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AFACFF80641;
	Fri,  2 Jun 2023 22:24:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B27CDF8060C; Fri,  2 Jun 2023 22:23:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A352F80563
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 22:23:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A352F80563
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RcLhtAqS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685737396; x=1717273396;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p9wu4yKSwyYSMarwbgrzIPvNBsmCjQJZ4D0HlcoY1Zg=;
  b=RcLhtAqS53ufDsUIj7RS9dz7T6ARQ54Hie2bATgPklP37jPsnaPDiam8
   o0XnOuU4BL4CBAPCf1i6qLsG5rQerVR8+/HY7g9ljLs+Qv+0IeKV0s0Bo
   5VT+HTkuBeJKv0lz786hprJYq+0rJ7X1Wm0E5r0qEfGIRcuRCs0ZDUIHV
   BoKVCL92ALRm6a+jBq81jjyNavIzGDO7Qh2eGhMmAvdsopw8FjtZhaWIB
   0LPIhEMGzF/xypGZc6xsUQwMYLmfKWCu1iz7tht2jO0nob4lCfafJmlXB
   7nE0WuFlgOYwNwGiwyq7mql7Fa7UOvOBmJcWKmaFzbpb7DoQndWZEGo9h
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="354811310"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="354811310"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:23:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="773020040"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="773020040"
Received: from clatorre-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.190.110])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:22:59 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Balamurugan C <balamurugan.c@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 21/28] ASoC: Intel: Sof_ssp_amp: Correcting author name.
Date: Fri,  2 Jun 2023 15:22:18 -0500
Message-Id: <20230602202225.249209-22-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
References: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3AKRTQAUTPZ5IUSWAEENQUJZXJCR45RC
X-Message-ID-Hash: 3AKRTQAUTPZ5IUSWAEENQUJZXJCR45RC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3AKRTQAUTPZ5IUSWAEENQUJZXJCR45RC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Balamurugan C <balamurugan.c@intel.com>

Corrected the author name camel case and initial.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Balamurugan C <balamurugan.c@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_ssp_amp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
index 56fa0c196daf..0aef718e82b2 100644
--- a/sound/soc/intel/boards/sof_ssp_amp.c
+++ b/sound/soc/intel/boards/sof_ssp_amp.c
@@ -487,7 +487,7 @@ static struct platform_driver sof_ssp_amp_driver = {
 module_platform_driver(sof_ssp_amp_driver);
 
 MODULE_DESCRIPTION("ASoC Intel(R) SOF Amplifier Machine driver");
-MODULE_AUTHOR("balamurugan.c <balamurugan.c@intel.com>");
+MODULE_AUTHOR("Balamurugan C <balamurugan.c@intel.com>");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
-- 
2.37.2

