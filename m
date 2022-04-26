Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFFF50FC58
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 13:56:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98EA31877;
	Tue, 26 Apr 2022 13:55:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98EA31877
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650974159;
	bh=qQH/PUPBW7jkGZAW36UYdakzLd3+/TslqdTXNQxSp48=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LaFVes99yflQ1ie3Cjs0EWM0dUfocmEp4Pe1L4a4Y85U0abVGX8o9CuyuQTmN5q3/
	 dnAFci0VVWc4eeP4CuIFYzAfSGmsZu9c9FwGXdFS607wh9yoiPxMPdVMEO3d1ePokJ
	 1aEkZooLWxZMx+IkO26iDhrcLXYpHJKhGn4PlOg0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DB8AF80171;
	Tue, 26 Apr 2022 13:55:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA653F80105; Tue, 26 Apr 2022 13:54:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F27AF80105
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 13:54:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F27AF80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="iWDEOS4D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650974096; x=1682510096;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qQH/PUPBW7jkGZAW36UYdakzLd3+/TslqdTXNQxSp48=;
 b=iWDEOS4Db7jQsgLJ9ALzeKhvcwHmCWnmWDZPzl9cUibGAr81J/wY0rXR
 /LTW9xPNH7cbZrshAuyE0hhndWAGNilXaZ1NoAtgEQ3t6XtDFk8so8UD9
 zFieyqAYNZsv625G8f6GwNZMt8eLAM9YwZM8bgs5htb0cCl5S/7QFBENd
 uGr0jQXlyNrUPyGjJhohjxKMfEPGCGttnmXhC0yK324L7bfKrCcrWXoas
 MeTxeet2exS4IXEHbsnTa9bX9qU+/bCRzgBU1pXfms6g+rWyfLHpFI0Dw
 Dzedcxh2ceX+5K+ER2fN0gKUHZ2M1z1S+48tClKTv49QofuhlPxhgT+4r A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="265075119"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="265075119"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 04:54:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="564547877"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by fmsmga007.fm.intel.com with ESMTP; 26 Apr 2022 04:54:46 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: Intel: avs: Depend on CONFIG_ACPI
Date: Tue, 26 Apr 2022 13:54:54 +0200
Message-Id: <20220426115454.685787-1-amadeuszx.slawinski@linux.intel.com>
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

Apparently the assumption that driver can build without ACPI was too
optimistic as avs selects SND_SOC_ACPI which requires working ACPI
implementation. So depend on ACPI without COMPILE_TEST alternative.

Fixes: 47a1886a610a ("ASoC: Intel: avs: Enable AVS driver only on x86 platforms")
Reported-by: kernel test robot <lkp@intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index be42c4eff165..9fdd6e32951f 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -211,8 +211,8 @@ config SND_SOC_INTEL_KEEMBAY
 
 config SND_SOC_INTEL_AVS
 	tristate "Intel AVS driver"
-	depends on (X86 && ACPI) || COMPILE_TEST
-	depends on PCI
+	depends on X86 || COMPILE_TEST
+	depends on PCI && ACPI
 	depends on COMMON_CLK
 	select SND_SOC_ACPI
 	select SND_SOC_TOPOLOGY
-- 
2.25.1

