Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FE663387F
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Nov 2022 10:31:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 874251663;
	Tue, 22 Nov 2022 10:30:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 874251663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669109467;
	bh=CYBGgKZa3V7R4jeaL1Zz2bLgJGSPjHevyvScslfBpTs=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OvqzwAXvu19F2W+X8tRJUP+9s1rper/E6BXwnN4/Z4L37SbKHO84ArsrYdIp2oY08
	 yQpcgOiyim54C5aSbRYV8Y1Q9ix+STGHw/j00swFvElF+h7sSsnVx98SR0oxPUVQhm
	 GSinaOG9EnwIJdtvDDZmR7gXXSPoMw3m6qys36bc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30A0DF805AB;
	Tue, 22 Nov 2022 10:27:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37E26F8028D; Mon, 21 Nov 2022 11:46:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4205F800F3
 for <alsa-devel@alsa-project.org>; Mon, 21 Nov 2022 11:46:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4205F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="cz3hKvJz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669027611; x=1700563611;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CYBGgKZa3V7R4jeaL1Zz2bLgJGSPjHevyvScslfBpTs=;
 b=cz3hKvJzuljBWKYNyN51Aggv6GGdGDsxm+/ximXOcANrx6wIDrQy0RyG
 GK5lV0hOej1e1WSAcnBEyQ/SxrrAALqtiT7uS/WMGmRBWRZUmOd5vBYrn
 chRkLL4xasKVVX2E4r47Vzyk5nYLJEuOTFkGDerk2GdcJvqCAu8NVfPxk
 FFRlo1K8spN9n//HsMWKwEPPnmEaNCKVGEXca1qOPaH9pEcAkoJPRL6j4
 T6wI8m+/cwYhxFg1SKpBuIGU9R7tq2CKXNgr32WtueEWZY/uxa859+jQk
 YjB+QyyAqslxChSW0hThJFNnFyhM4DzNYAIs99BKh54mVS2FXiY8jVdTL w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="312231236"
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; d="scan'208";a="312231236"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 02:46:42 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="729964350"
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; d="scan'208";a="729964350"
Received: from lili-desktop.bj.intel.com ([10.238.144.122])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 02:46:40 -0800
From: lili.li@intel.com
To: tiwai@suse.com, perex@perex.cz, broonie@kernel.org,
 cezary.rojewski@intel.com, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: Intel: Skylake: Fix Kconfig dependency
Date: Mon, 21 Nov 2022 18:47:42 +0800
Message-Id: <20221121104742.1007486-1-lili.li@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 22 Nov 2022 10:27:20 +0100
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

From: Lili Li <lili.li@intel.com>

Commit e4746d94d00c ("ASoC: Intel: Skylake: Introduce HDA codec init and
exit routines") introduced HDA codec init routine which depends on SND_HDA.
Select SND_SOC_HDAC_HDA unconditionally to fix following compile error:
ERROR: modpost: "snd_hda_codec_device_init" [sound/soc/intel/skylake/snd-soc-skl.ko] undefined!

Fixes: e4746d94d00c ("ASoC: Intel: Skylake: Introduce HDA codec init and exit routines")
Reviewed-by: Junxiao Chang <junxiao.chang@intel.com>
Suggested-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Lili Li <lili.li@intel.com>
---
 sound/soc/intel/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index d2ca710ac3fa..ac799de4f7fd 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -177,7 +177,7 @@ config SND_SOC_INTEL_SKYLAKE_COMMON
 	select SND_HDA_DSP_LOADER
 	select SND_SOC_TOPOLOGY
 	select SND_SOC_INTEL_SST
-	select SND_SOC_HDAC_HDA if SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC
+	select SND_SOC_HDAC_HDA
 	select SND_SOC_ACPI_INTEL_MATCH
 	select SND_INTEL_DSP_CONFIG
 	help
-- 
2.25.1

