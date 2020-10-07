Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F34E72860C3
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Oct 2020 15:59:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88D9C16B8;
	Wed,  7 Oct 2020 15:59:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88D9C16B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602079195;
	bh=oGOFvsCmgJAoVsFtTByVT1gUUdcVQeBHqd++7G09mVI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f98CutduGz/USPZfLmFexgonO1zKzt8y0wa2iINepwRWj+KEDb2PzT7yO8JOuMb6i
	 GeIFZUDoHVF3Y/EmQXXpovqez/1whZNvqYs1bZAPntmpVSPLfJwbad4cgawF5lIv0r
	 2cVmWmd3mneBpJKIPPUOsmGG0uQlF4NhQij5dJKo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18A81F8019D;
	Wed,  7 Oct 2020 15:57:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13B20F80087; Wed,  7 Oct 2020 15:57:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DDE4F80087
 for <alsa-devel@alsa-project.org>; Wed,  7 Oct 2020 15:57:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DDE4F80087
IronPort-SDR: 2/9uSBWCAyuRM8ar5z2qlIEzmcf8sUNNLOniPctcuzLcMlOIBoQ8iJKszSih870s/PLGZumzKw
 hctxwsH9a84Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9767"; a="249657131"
X-IronPort-AV: E=Sophos;i="5.77,347,1596524400"; d="scan'208";a="249657131"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2020 06:57:22 -0700
IronPort-SDR: 77ci4tyivgNuU2WsPnX/POdAmza8scCPrldG7jxC+QaDNsPCnriRjX8tduPLSyreDSjCuZ0Kfh
 KR7mtZCZjShA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,347,1596524400"; d="scan'208";a="518844583"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga005.fm.intel.com with ESMTP; 07 Oct 2020 06:57:20 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ASoC: Intel: catpt: Add explicit DMADEVICES kconfig
 dependency
Date: Wed,  7 Oct 2020 15:57:01 +0200
Message-Id: <20201007135701.20372-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201007135701.20372-1-cezary.rojewski@intel.com>
References: <20201007135701.20372-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, rdunlap@infradead.org,
 lgirdwood@gmail.com, tiwai@suse.com, broonie@kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

catpt selects DW_DMAC_CORE which requires DMADEVICES. Fix unmet direct
dependencies warning by updating driver's depends-on list.

Fixes: 6cbfa11d2694 ("ASoC: Intel: Select catpt and deprecate haswell")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index 1278bea4e1be..a5b446d5af19 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -21,7 +21,7 @@ config SND_SOC_INTEL_SST
 config SND_SOC_INTEL_CATPT
 	tristate "Haswell and Broadwell"
 	depends on ACPI || COMPILE_TEST
-	depends on SND_DMA_SGBUF
+	depends on DMADEVICES && SND_DMA_SGBUF
 	select DW_DMAC_CORE
 	select SND_SOC_ACPI_INTEL_MATCH
 	help
-- 
2.17.1

