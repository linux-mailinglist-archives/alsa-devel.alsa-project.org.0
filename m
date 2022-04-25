Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1781950DC43
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 11:18:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B32216D4;
	Mon, 25 Apr 2022 11:17:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B32216D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650878289;
	bh=YIXbn23XFVGqK+W1CJsF1EMzHhiZ+xq98kpIgWB3q0U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pCQmulF1ciXWGGMQmg/o2Tu5Y6LYN/B7SS2mPyL9kWptA/hz7Gg2vz9H9NGNyRz7e
	 QasnylkMiEdw47PyLXSiNpVBltv1VSODdyQqdIuyQYKMqukx5XAJ9p378QsDauZiKC
	 5p8c60y0eJfY2nyEv3kvcqYqulTOqx6TBaHxzls0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E9D2F80152;
	Mon, 25 Apr 2022 11:17:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98DD1F8016B; Mon, 25 Apr 2022 11:17:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FA8DF8014B
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 11:17:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FA8DF8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Y2gSGJDR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650878222; x=1682414222;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YIXbn23XFVGqK+W1CJsF1EMzHhiZ+xq98kpIgWB3q0U=;
 b=Y2gSGJDR2qUGOn+IviCfPL3iik/0nf6WesFKfmbwqG3c4pzLEeXsUkcs
 oYhjygkRs5rGYZvQdrDqTzC3g1LxqMuwJ3sZtGxf4B2+jpxulX/52k6kb
 bWJACL1EkAS1GlU0QN01/1CMNeD+5m0F63AYuRpfz2XzS5cZcdL8g4VQL
 8Lirbv7mCTPwOfwXkJHv7nVidY6C5W/JF/sjD9B/NhcGUwLiGPcErBzK9
 LgpA5KD8fmLE5sVgxkHTi0eBQUZgLIJtyqbmACwP6nn8QqCUUXK1g0lsw
 2TkknpQk5XIgxTMwM7kazvgNr3ybxX12+3Wd/eIc+2UOjNImdwuk34izM A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10327"; a="351640276"
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; d="scan'208";a="351640276"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 02:16:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; d="scan'208";a="579185821"
Received: from dev2.igk.intel.com ([10.237.148.94])
 by orsmga008.jf.intel.com with ESMTP; 25 Apr 2022 02:16:40 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 1/2] ASoC: Intel: avs: Enable AVS driver only on x86
 platforms
Date: Mon, 25 Apr 2022 11:16:45 +0200
Message-Id: <20220425091646.545216-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
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
for it to be enabled on other architectures. Allow exception for compile
tests.

Fixes: 274d79e51875 ("ASoC: Intel: avs: Configure modules according to their type")
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---

Changes in v2:
 * Actually fix the problem reported by kernel test robot in following
   patch
 * Add COMPILE_TEST to allow test building on other architectures

---
 sound/soc/intel/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index c364ddf22267..4ef9a1fee121 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -211,7 +211,8 @@ config SND_SOC_INTEL_KEEMBAY
 
 config SND_SOC_INTEL_AVS
 	tristate "Intel AVS driver"
-	depends on PCI && ACPI
+	depends on (X86 && ACPI) || COMPILE_TEST
+	depends on PCI
 	depends on COMMON_CLK
 	select SND_SOC_ACPI
 	select SND_SOC_TOPOLOGY
-- 
2.25.1

