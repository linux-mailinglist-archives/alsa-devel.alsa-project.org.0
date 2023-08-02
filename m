Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B216F76D167
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 17:15:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AE40844;
	Wed,  2 Aug 2023 17:14:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AE40844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690989300;
	bh=BuzkKf/B/48DR4bVThwdqAiUG/Lv68wDwSaqjsCi8YE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NCx7oMtWThvbl97D8S7FIDy44hQ15y3zeDBsLpwXki+7XvjEhxevAN0UuKY9mSIda
	 I1LGRT2Z9YF25S43e+acezh0iFKLb4dKjvgdaMxpuq8bnhZIJGrSY0vGODmiHFIGGL
	 /KnagYFxecIzbn2h7XXWI06z/Vsrl3aBZjI6ObiA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 131F7F8059F; Wed,  2 Aug 2023 17:13:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BDBAF80588;
	Wed,  2 Aug 2023 17:13:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C433F80553; Wed,  2 Aug 2023 17:12:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RDNS_NONE,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A7988F80149
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 17:12:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7988F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NEnaaMG7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690989168; x=1722525168;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BuzkKf/B/48DR4bVThwdqAiUG/Lv68wDwSaqjsCi8YE=;
  b=NEnaaMG7YwGa7T2aPqj9vNYANJrmACXtU/f8jYUw3VJun2b6tOCw9Srf
   DKu7l7p4qGWlDVTXh04Cd94CY+uAQu7rVVmHHHwU555/ttDTN8NvVgq9x
   MpcfdE4E7YQenOyWPXOtzcVLcsq9hqC2rOQBmtRaxAUatX9kGu8EVuXyk
   6np7sBV4lpbvKi639sRN9COX/a7rc/LrMB3Dxlxre1Y/IekslF77zXSw0
   AVa0Yij4tlBqgvZCaxDuz0perLx5W7UAdwiLhJ5mR5YpnIJ6vT96i/dDz
   kcwZX8cHO5gT8RxDztn5ut+RdV7PJMgnOCBUSVBYYplpt0Qcak/vq8uYo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="369607269"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="369607269"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 08:01:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="732428683"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="732428683"
Received: from rickylop-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.125.114])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 08:01:14 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 3/5] ALSA: hda: intel-dsp-cfg: use common include for
 MeteorLake
Date: Wed,  2 Aug 2023 10:01:03 -0500
Message-Id: <20230802150105.24604-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802150105.24604-1-pierre-louis.bossart@linux.intel.com>
References: <20230802150105.24604-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4DC4LPNOSY4FEYOVV6O6KVQGMU2VQBG2
X-Message-ID-Hash: 4DC4LPNOSY4FEYOVV6O6KVQGMU2VQBG2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4DC4LPNOSY4FEYOVV6O6KVQGMU2VQBG2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This was not updated in Commit 0cd0a7c2c599 ("ALSA: intel-dsp-config: Convert to PCI device IDs defines")

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/hda/intel-dsp-config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index 48bd1fb06f26..1abe65f0ba1b 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -461,7 +461,7 @@ static const struct config_entry config_table[] = {
 	/* Meteorlake-P */
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
-		.device = 0x7e28,
+		.device = PCI_DEVICE_ID_INTEL_HDA_MTL,
 	},
 #endif
 
-- 
2.39.2

