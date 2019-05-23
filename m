Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77425274E1
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2019 06:00:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C72F71666;
	Thu, 23 May 2019 05:59:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C72F71666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558584036;
	bh=SWKaekSAESlpdzTMecBwHpwuVV9O6baWMPuvA5UVUeE=;
	h=To:From:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ghkI0xB70KHLs0R4T0oQ0wduzZoR5rB/OE0GkUqXvXZT70Ad27fKwnUtsqrcttCXy
	 XZl2aPsi0RNTgpbggpG3yR3X8SByVV8Dwy+gLqHF3a0Rxm+UYq7kufKO/lEgUgU4wL
	 JECsBkKyG5/yRVCVbCZDL8UYAShwfyLZY7VFXnV4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A75AF89674;
	Thu, 23 May 2019 05:58:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9788F89674; Thu, 23 May 2019 05:58:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61601F8079B
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 05:58:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61601F8079B
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=infradead.org header.i=@infradead.org header.b="KejvbuT5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=texO5kjCiEyRmA9j8g6TTKwQQkF5isv3f023B/uvzhs=; b=KejvbuT5ypOOy1kGXQohTsyf7
 FNfeMpU0pDrgoKMZww1WiKg/xa5W1ZRCiJZgImZ1b4SYOqY2sW4hAXtTHfZIFJC9FJG7vVsUz3pUc
 kY4Xq6DKYVHO/oaaMv0B2c15hoNaVgzYC5BUkQwVoP6UPSYsjO3CPiTKVsIoAz5MoPESZ91Kg1Vni
 a/uou4gXI6+Jx8uSLJyLYobPvknnVxdUPaHCD06JyiD7/EgpZvvS8BjXuibJzy6tnKYidtxGzSKs6
 v71HEPit5etVQrMYejPK1woKwOV7M9WXvskhQa15vVfNMEtSglArMQYGGVA2gmsL1t0dFR/varD/s
 KorAFxyHg==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16]
 helo=dragon.dunlab)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTesJ-00057R-Ai; Thu, 23 May 2019 03:58:39 +0000
To: LKML <linux-kernel@vger.kernel.org>,
 moderated for non-subscribers <alsa-devel@alsa-project.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <9019c87f-cf1a-b59f-d87e-8169b247cf88@infradead.org>
Date: Wed, 22 May 2019 20:58:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Jie Yang <yang.jie@linux.intel.com>,
 kbuild test robot <lkp@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH] ASoc: fix
 sound/soc/intel/skylake/slk-ssp-clk.c build error on IA64
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Randy Dunlap <rdunlap@infradead.org>

skl-ssp-clk.c does not build on IA64 because the driver
uses the common clock interface, so make the driver depend
on COMMON_CLK.

Fixes this build error:
../sound/soc/intel/skylake/skl-ssp-clk.c:26:16: error: field 'hw' has incomplete type
  struct clk_hw hw;
                ^~

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Cc: Jie Yang <yang.jie@linux.intel.com>
Cc: alsa-devel@alsa-project.org
---
 sound/soc/intel/Kconfig        |    3 ++-
 sound/soc/intel/boards/Kconfig |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

--- lnx-52-rc1.orig/sound/soc/intel/Kconfig
+++ lnx-52-rc1/sound/soc/intel/Kconfig
@@ -104,7 +104,7 @@ config SND_SST_ATOM_HIFI2_PLATFORM_ACPI
 config SND_SOC_INTEL_SKYLAKE
 	tristate "All Skylake/SST Platforms"
 	depends on PCI && ACPI
-	select SND_SOC_INTEL_SKL
+	select SND_SOC_INTEL_SKL if COMMON_CLK
 	select SND_SOC_INTEL_APL
 	select SND_SOC_INTEL_KBL
 	select SND_SOC_INTEL_GLK
@@ -120,6 +120,7 @@ config SND_SOC_INTEL_SKYLAKE
 config SND_SOC_INTEL_SKL
 	tristate "Skylake Platforms"
 	depends on PCI && ACPI
+	depends on COMMON_CLK
 	select SND_SOC_INTEL_SKYLAKE_FAMILY
 	help
 	  If you have a Intel Skylake platform with the DSP enabled
--- lnx-52-rc1.orig/sound/soc/intel/boards/Kconfig
+++ lnx-52-rc1/sound/soc/intel/boards/Kconfig
@@ -286,7 +286,7 @@ config SND_SOC_INTEL_KBL_RT5663_MAX98927
 	select SND_SOC_MAX98927
 	select SND_SOC_DMIC
 	select SND_SOC_HDAC_HDMI
-	select SND_SOC_INTEL_SKYLAKE_SSP_CLK
+	select SND_SOC_INTEL_SKYLAKE_SSP_CLK if COMMON_CLK
 	help
 	  This adds support for ASoC Onboard Codec I2S machine driver. This will
 	  create an alsa sound card for RT5663 + MAX98927.


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
