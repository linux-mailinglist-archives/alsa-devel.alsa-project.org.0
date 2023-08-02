Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6275476D15A
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 17:14:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8920B836;
	Wed,  2 Aug 2023 17:13:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8920B836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690989277;
	bh=9bjYS8EbcpbOLglUOTbR7e45YjiztEBMTDXiB90OGkM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gA4ePc2O5oTsb7xaZ18+YwjDtAJ1GBSquuXwt06SC6F/GzPrHZsg2apBrSpIa0/0K
	 YJrifoV8KKWBvCxCBYD67fvLqmaxpcfpaQhIhryie14lexVQCNUl2RCxakLUz9oAao
	 MUyw9G/jxuLkD+97KMUP47yUYnS6z0SLPOvc6d7c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36EE2F8016D; Wed,  2 Aug 2023 17:12:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 34028F80563;
	Wed,  2 Aug 2023 17:12:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8333F80520; Wed,  2 Aug 2023 17:12:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RDNS_NONE,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 895C6F802BE
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 17:12:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 895C6F802BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=YVJd4bhT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690989165; x=1722525165;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9bjYS8EbcpbOLglUOTbR7e45YjiztEBMTDXiB90OGkM=;
  b=YVJd4bhTfZD4amjHTceLkjQAjudI43VuRLDFGi0cDoB03xgvzHRnU8uJ
   JuTasjNBjNTzA1q93hqDK0AO8Ao+C4zg7PhE4RF9JRSClSTOS7XvN4KhO
   JOZ8/kGzap5APdQMswLrRqsWdualBDbcratJXj2MUcl4zuYjqw4D320OL
   GHI8AIPOsQJMZ52DSTtuqMh8kNsmWBhoGNWGsI2+0HWhHrFawio5EEbMd
   4/Sh0S0qWLpMsFLw0BgDgiz4npfdQrIhLZjvt4En4KePWPTo/KQZLsOVk
   SJa8UhgO3fK0PxzCMJwQMZ1mirt6wpONaQ65l4e94M8Ygqj0lRcLpwCkU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="369607259"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="369607259"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 08:01:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="732428680"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="732428680"
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
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 2/5] ALSA: hda: add HD Audio PCI ID for Intel Arrow Lake-S
Date: Wed,  2 Aug 2023 10:01:02 -0500
Message-Id: <20230802150105.24604-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802150105.24604-1-pierre-louis.bossart@linux.intel.com>
References: <20230802150105.24604-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: X7EMBIPFLVWDTV6PVHOSF63YXBN5UFC7
X-Message-ID-Hash: X7EMBIPFLVWDTV6PVHOSF63YXBN5UFC7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X7EMBIPFLVWDTV6PVHOSF63YXBN5UFC7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Add HD Audio PCI ID for Intel Arrow Lake-S platform.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/pci/hda/hda_intel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 176567f0d0e0..765d95e79861 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2499,6 +2499,8 @@ static const struct pci_device_id azx_ids[] = {
 	{ PCI_DEVICE_DATA(INTEL, HDA_MTL, AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE) },
 	/* Lunarlake-P */
 	{ PCI_DEVICE_DATA(INTEL, HDA_LNL_P, AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE) },
+	/* Arrow Lake-S */
+	{ PCI_DEVICE_DATA(INTEL, HDA_ARL_S, AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE) },
 	/* Apollolake (Broxton-P) */
 	{ PCI_DEVICE_DATA(INTEL, HDA_APL, AZX_DRIVER_SKL | AZX_DCAPS_INTEL_BROXTON) },
 	/* Gemini-Lake */
-- 
2.39.2

