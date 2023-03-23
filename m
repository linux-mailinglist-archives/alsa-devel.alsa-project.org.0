Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9646C5F0C
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 06:38:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B15AEC9;
	Thu, 23 Mar 2023 06:37:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B15AEC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679549893;
	bh=jSG2veXKUxcXyV1zpGUhKNlxMdGkTNUGl0TfqUCdrR0=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pMMaTa7HAGoU+MvsCwkPJ436sL6ZO0FX5LuIoXZle/anBYy/aPIPZ1jw2mM+gVtXl
	 637qvFUT/Wazta2Ev5dVR17RraVW6lbHvfmICpUbZtHiY+G0t85BWiycbVux9reglf
	 OIFL88prkqj7jfLhxqYT2igAWIRypYEWqOtvUj5k=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BA77F805BD;
	Thu, 23 Mar 2023 06:33:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA9EFF802E8; Thu, 23 Mar 2023 06:31:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1E42BF800C9
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 06:29:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E42BF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=YyG2Iom5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679549398; x=1711085398;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jSG2veXKUxcXyV1zpGUhKNlxMdGkTNUGl0TfqUCdrR0=;
  b=YyG2Iom5S7YNqmmSAu3JehZ0uBm9FTL8TDv5pIf/GbGQqXcPAY392LlU
   xdf2e2SOnLHNbDwlr+RqQ3Je+sbkbmy2OdNabkxdlTBo73mfPkG0Q+NLZ
   xvkH4Jkt/Iy6XslABGy1Iw23f5QcYnEu/B36hlH4oHRFf6ZQAdtDWFZ0X
   63KALiatlMyKn2yFiBtGmOYpAafYBP3/GECEXJN/25LAcbCDcXG2ZG6gs
   knsKk8BfoVqZw7uqZIK2PX8ePSeL06zgHfhRcfK5RaXn71peVK9SuhfVC
   f+wqDXdmMt91HhbbD/7hIl00//9SNza89xKHm1PtY6oFRRQblqkXJZJ12
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="327779281"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="327779281"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 22:29:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="675566986"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="675566986"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 22:29:50 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org,
	broonie@kernel.org
Subject: [PATCH 01/20] ASoC: SOF: Intel: shim: add enum for ACE 2.0 IP used in
 LunarLake
Date: Thu, 23 Mar 2023 13:44:33 +0800
Message-Id: <20230323054452.1543233-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
References: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FVHXE3QG7GB4ZYAUE7UOHTM6S2C6JAXS
X-Message-ID-Hash: FVHXE3QG7GB4ZYAUE7UOHTM6S2C6JAXS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FVHXE3QG7GB4ZYAUE7UOHTM6S2C6JAXS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Add the new enum needed for SoundWire IP selection. The LunarLake PCI
descriptors and DSP parts will be added at a later time.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/shim.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/intel/shim.h b/sound/soc/sof/intel/shim.h
index 48428ccbcfe0..207df48e27cf 100644
--- a/sound/soc/sof/intel/shim.h
+++ b/sound/soc/sof/intel/shim.h
@@ -21,6 +21,7 @@ enum sof_intel_hw_ip_version {
 	SOF_INTEL_CAVS_2_0,	/* IceLake, JasperLake */
 	SOF_INTEL_CAVS_2_5,	/* TigerLake, AlderLake */
 	SOF_INTEL_ACE_1_0,	/* MeteorLake */
+	SOF_INTEL_ACE_2_0,	/* LunarLake */
 };
 
 /*
-- 
2.25.1

