Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5FB50DC45
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 11:18:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9685216EA;
	Mon, 25 Apr 2022 11:17:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9685216EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650878323;
	bh=N/DuUqRGMyHy96Bytp4oxziXljWI+an5AESRzGZphA0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SZB/EP66bMfakWjOrljAb0OQ1YLdq8M9iKuLEPkh+2rFcCeeDmc/u8sbZ4w1z/JQi
	 vRUEldkCTPXDMGKb0A5fgvAn2EaH6CPopYVXt//9W+i6p1iaSesMe7W0Jdj0Nhw9AN
	 P66tT5t/Qj1rbv9ROH7Fyv7DaSaaVZDYrCDSm8Vg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49285F804AA;
	Mon, 25 Apr 2022 11:17:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82F61F8016B; Mon, 25 Apr 2022 11:17:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1259F80152
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 11:17:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1259F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="eMn8C7Jl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650878224; x=1682414224;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N/DuUqRGMyHy96Bytp4oxziXljWI+an5AESRzGZphA0=;
 b=eMn8C7Jl0I95AVOv2NsZUcgw070xDJQLuitXBiK5Q47eNXnilL/6V5Ke
 2sHIt4urxDdIdogW5zoWhB97qUitflXmfGMQynr0O/pXqgFBiEpDfnW8H
 3XpRiVCK8BH2bS3zxNe1mllaGORdhA2E1TGj3qwqjwUgUHa1lssg3G8aO
 KwiSI40gvR/Ep94+3q07q62LDqulcb8dMJ8jJmpJRY6jwu8E0RtqolRJU
 4slBW6Ssp6p9piYmsl28MHh0BIFf/h7lgQpSI48O5Y8O3dVRy+MfQmZJ+
 I8y3vNN8GhJTZvCECGKRGRHbL4IfpndVUsVq8unWBu/VMl5DRmKK64bxC A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10327"; a="351640277"
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; d="scan'208";a="351640277"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 02:16:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; d="scan'208";a="579185825"
Received: from dev2.igk.intel.com ([10.237.148.94])
 by orsmga008.jf.intel.com with ESMTP; 25 Apr 2022 02:16:42 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 2/2] ASoC: Intel: avs: Depend on SND_INTEL_DSP_CONFIG
Date: Mon, 25 Apr 2022 11:16:46 +0200
Message-Id: <20220425091646.545216-2-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220425091646.545216-1-amadeuszx.slawinski@linux.intel.com>
References: <20220425091646.545216-1-amadeuszx.slawinski@linux.intel.com>
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

In order to enable NHLT support one must select SND_INTEL_DSP_CONFIG,
which will select SND_INTEL_NHLT. Otherwise the file containing NHLT
code doesn't get build leading to errors when linking.

Fixes: 274d79e51875 ("ASoC: Intel: avs: Configure modules according to their type")
Reported-by: kernel test robot <lkp@intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index 4ef9a1fee121..be42c4eff165 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -218,7 +218,7 @@ config SND_SOC_INTEL_AVS
 	select SND_SOC_TOPOLOGY
 	select SND_HDA_EXT_CORE
 	select SND_HDA_DSP_LOADER
-	select SND_INTEL_NHLT
+	select SND_INTEL_DSP_CONFIG
 	help
 	  Enable support for Intel(R) cAVS 1.5 platforms with DSP
 	  capabilities. This includes Skylake, Kabylake, Amberlake and
-- 
2.25.1

