Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3121250B95C
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 16:00:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD84C1895;
	Fri, 22 Apr 2022 15:59:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD84C1895
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650636011;
	bh=LHjYlWVCwRLavC996Hlwz4+YYNWJwANRGuhcIgmi7nE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CfCTv6wKmNs5PoSP5LPY0WL2vTpsUm1HKM+8fIIfk4JJsUae/4wKwNvfE6Ex25WwQ
	 dDxvifJKTucBNRTiEkd6e0/ZrNSRdsC4C1qVbDh/SLWzcCmuqExyBPsPnjFQmWMous
	 TAKxDBDtjXBnYs0Jr8mZgzdixv/L3DNCSN5CPAzI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8866DF80538;
	Fri, 22 Apr 2022 15:34:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B983F80538; Fri, 22 Apr 2022 15:34:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E005EF80527
 for <alsa-devel@alsa-project.org>; Fri, 22 Apr 2022 15:34:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E005EF80527
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="eSJQNaBN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650634452; x=1682170452;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LHjYlWVCwRLavC996Hlwz4+YYNWJwANRGuhcIgmi7nE=;
 b=eSJQNaBNHVgj/MA6s6MkZDRCT3IGNir+E17b63FkVztXXWSO3Vn1vSXG
 GouXe2qnnWhu2V1XQZGmRHDF2fD/JsQ/gx6J0qUpu148Xi11FHbvm+YAb
 qg11VMhR+SprE503thOw1GrDa3SEaPXPt1h5PunxxtJf9EimIQJTDBwI4
 71KyLMfJQmZmzX4pg3H8y56PPpnqjzbhVXZ88wGkCfK+ZJ2TqMzXpwyiJ
 MPzIOLmlwSx7WFqpkYJt9fKEcDQnNkDRuGD1Pb9K3VazEaRtRCxhO7W6v
 WJuJDB+NMcef0u+An7Nz5bXO29sQrYglM7A0c2YyLagdibb9Hw2l320JY Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="351113893"
X-IronPort-AV: E=Sophos;i="5.90,281,1643702400"; d="scan'208";a="351113893"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2022 06:34:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,281,1643702400"; d="scan'208";a="594146008"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by orsmga001.jf.intel.com with ESMTP; 22 Apr 2022 06:34:06 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: Intel: avs: Enable AVS driver only on x86 platforms
Date: Fri, 22 Apr 2022 15:34:11 +0200
Message-Id: <20220422133411.169007-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, kernel test robot <lkp@intel.com>,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

Only supported platform for AVS are x86 machines, so there is no reason
for it to build on other architectures.

Fixes: 274d79e51875 ("ASoC: Intel: avs: Configure modules according to their type")
Reported-by: kernel test robot <lkp@intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index c364ddf22267..5dc075673b97 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -211,7 +211,7 @@ config SND_SOC_INTEL_KEEMBAY
 
 config SND_SOC_INTEL_AVS
 	tristate "Intel AVS driver"
-	depends on PCI && ACPI
+	depends on X86 && PCI && ACPI
 	depends on COMMON_CLK
 	select SND_SOC_ACPI
 	select SND_SOC_TOPOLOGY
-- 
2.25.1

