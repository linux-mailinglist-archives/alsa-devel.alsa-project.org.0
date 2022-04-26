Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D11D9510987
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 22:07:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 736F01853;
	Tue, 26 Apr 2022 22:06:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 736F01853
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651003642;
	bh=NzK314Nib1aAhTnYubOE8y+ivu+PU2RrCUv42tj8wBc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oj34QYlCoeOQTdbqFbIzS+4cb+uwfu8OFjZYpI4X2slYqvxYCTvcaVK550YjNmDXj
	 vAXWYrRVc7odlF0xGWpVCvjHBQYZXEkHFgvhzWlm+us+JpK4gvc2t2ElauauqLFssl
	 o1u5HUaSq4EvUISj3fowsuB2MUXZBBvk2sqWEhMc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9ACF7F8027D;
	Tue, 26 Apr 2022 22:05:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B72FF80152; Tue, 26 Apr 2022 22:05:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D072F80105
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 22:05:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D072F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="j7955WHx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651003542; x=1682539542;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NzK314Nib1aAhTnYubOE8y+ivu+PU2RrCUv42tj8wBc=;
 b=j7955WHxbhCqiEwDSqBhewpGJnFcdf+Fmu6GXiJ+M77KC3/c65BNSkjk
 qwoccg/y6H37QQnqDM0ZK3fDREe/NoBQ9qBDVKkM+AtHIDi3AxVNtX++Z
 syVdWzeF2hnpPNO74AKxAL8TeJaTBUBLS4KMsX4K64hszXzHc8gCW18xW
 WRPI1w3PzApQKuVNhTMTaCNjeIJtmhX5Tx1yP6hDKmBsfZ9LDK1qbNL4J
 pl/aj7RMMi9M4HqBfCJelBfdbNYuRiXaTM9c45lpklz+e6PnRqkWMCtbW
 fKaEFQqTsW0KTDcow8tn7jm9/vMFm09UOX4yaQ67vfPblLiamM1OwOBpR A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="265230435"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="265230435"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 13:05:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="679173597"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by orsmga004.jf.intel.com with ESMTP; 26 Apr 2022 13:05:35 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 2/2] ASoC: Intel: avs: Drop direct ACPI dependency
Date: Tue, 26 Apr 2022 22:05:39 +0200
Message-Id: <20220426200539.894010-2-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426200539.894010-1-amadeuszx.slawinski@linux.intel.com>
References: <20220426200539.894010-1-amadeuszx.slawinski@linux.intel.com>
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

With previous patch this allows for building driver on architectures
without ACPI support present, when building with COMPILE_TEST enabled.

Fixes: 47a1886a610a ("ASoC: Intel: avs: Enable AVS driver only on x86 platforms")
Reported-by: kernel test robot <lkp@intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index be42c4eff165..039b45a4a799 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -211,10 +211,10 @@ config SND_SOC_INTEL_KEEMBAY
 
 config SND_SOC_INTEL_AVS
 	tristate "Intel AVS driver"
-	depends on (X86 && ACPI) || COMPILE_TEST
+	depends on X86 || COMPILE_TEST
 	depends on PCI
 	depends on COMMON_CLK
-	select SND_SOC_ACPI
+	select SND_SOC_ACPI if ACPI
 	select SND_SOC_TOPOLOGY
 	select SND_HDA_EXT_CORE
 	select SND_HDA_DSP_LOADER
-- 
2.25.1

