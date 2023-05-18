Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64923707803
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 04:23:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B64F182B;
	Thu, 18 May 2023 04:22:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B64F182B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684376587;
	bh=5R52rMefrg7AC6InG7PmqTlOvY+GWOInNf87oqgcKqM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=R+LLtazEWeIWCqLTCxhfAppwCjJHuOts1+5C1wh3TOhLy4+5R8Rif8vvLJhtaK8Si
	 bKiqAzInoyMxm9d+f+xtV2124R6GIP7Wa0TCl9nohfkjfk6Dma+Hi178aVKqNQUUlQ
	 QDz9lMYTt3njIhUSJnkpQwI+e+rGaiIOhLLJ5+Zg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C6D0F80552; Thu, 18 May 2023 04:22:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7ACF8F8025A;
	Thu, 18 May 2023 04:22:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11A6CF802E8; Thu, 18 May 2023 04:22:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BFA22F8025A
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 04:21:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFA22F8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lDTFwXMj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684376517; x=1715912517;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5R52rMefrg7AC6InG7PmqTlOvY+GWOInNf87oqgcKqM=;
  b=lDTFwXMjOvbmPcAcZUxxX6Zmsx4rcNEL6pXerSrmKWC+Ho9cM2gTiiAe
   zaJYlesjU2K0FRd8QGEFJZupSNBHc2tMv3qXOTD5AHMoTSp3axLZipg+9
   NYKBudA8PU3PlD5y+IduulPbgRrEOtkrav2ov7r8weBSsMLWo5510Pxup
   K/xuSMYzJmhdCCpppWHMuJTMrxWg0e6fLIeptnT8wPbqihwrSjS7EkeM/
   IofiTyHJ1vYXr0yqj2en+U67xxtBspy3DJaiHIz//xLA4EOozHRu+6tmS
   9xaWIKIJJogo5BUNfF4ADXQSPU7e1pbYpoX3j8BiR0JLusNnVOacs7pTl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="341339096"
X-IronPort-AV: E=Sophos;i="5.99,284,1677571200";
   d="scan'208";a="341339096"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 19:21:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="876255299"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200";
   d="scan'208";a="876255299"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 19:21:26 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH] soundwire: intel_bus_common: update error log
Date: Thu, 18 May 2023 10:42:15 +0800
Message-Id: <20230518024215.164281-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2IXE7IOBUOUEGB2OPXENBB7MCHWYBFH7
X-Message-ID-Hash: 2IXE7IOBUOUEGB2OPXENBB7MCHWYBFH7
X-MailFrom: yung-chuan.liao@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2IXE7IOBUOUEGB2OPXENBB7MCHWYBFH7/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

We use __func__ in all calls of sdw_cdns_check_self_clearing_bits(),
except in one case. Likely an editing miss when the code was
refactored.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel_bus_common.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/soundwire/intel_bus_common.c b/drivers/soundwire/intel_bus_common.c
index be0c93106fc8..e5ac3cc7cb79 100644
--- a/drivers/soundwire/intel_bus_common.c
+++ b/drivers/soundwire/intel_bus_common.c
@@ -182,8 +182,7 @@ int intel_start_bus_after_clock_stop(struct sdw_intel *sdw)
 		return ret;
 	}
 
-	sdw_cdns_check_self_clearing_bits(cdns, "intel_resume_runtime no_quirks",
-					  true, INTEL_MASTER_RESET_ITERATIONS);
+	sdw_cdns_check_self_clearing_bits(cdns, __func__, true, INTEL_MASTER_RESET_ITERATIONS);
 
 	return 0;
 }
-- 
2.25.1

