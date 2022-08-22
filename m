Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA2D59C7BE
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 21:01:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F8B7166A;
	Mon, 22 Aug 2022 21:01:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F8B7166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661194911;
	bh=kaAAmkx7iP5OALaS8lXEWqptDm/29HsZXGDfo/Av3Ug=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oItUE0Q3f0yHxCcSZG5UEuNqVjBLVcZCB5WaYwSCbHWoku7vtMo5NUq/vkFg6k7dU
	 LO07MfAdMfFIwazJxQCbQhPOoRtUbWal+ziLvidGZ0J+N3xMGhAEVx8miowjZ5HSrw
	 BPpkPSRC/qLeOqLimfw9kQS0SCzXNiA9MS/KqLho=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0B6CF8054A;
	Mon, 22 Aug 2022 20:59:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 721C3F80549; Mon, 22 Aug 2022 20:59:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1334AF80152
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 20:59:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1334AF80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="BY9lNrGI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661194787; x=1692730787;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kaAAmkx7iP5OALaS8lXEWqptDm/29HsZXGDfo/Av3Ug=;
 b=BY9lNrGIcNVXjO86Y059T9u43+rRUDYhcnLqQ8+K3IUqNaZq3a/j+kI7
 dGlXcNy3G4XP9yLKKSBs3Lg5w5732w5Bfg+xI1mHpx+fvKJH6FaYrwKxZ
 33z+vKUfPW6oiweRWillqG1MoIBQKy1UdGYzuU5OamOh3oDZGWMfiQxTv
 t0+VdWelYqD2/Uh/7aaEGOr+YKfts2iy4XitVRnaJ67ZYY4gxJTNs71jQ
 0ZfxuX1MVHh2nRcxzB1c9GV9R1qZ0CoBhoK0BtOjMiS4SvzR26OKGRXwy
 VcNN5WuRqG9NKYMeG0LNSTEkkAHRhw8qGiX5/w7e5e0b07aPTaXCA0zdv g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="379786519"
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; d="scan'208";a="379786519"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 11:59:44 -0700
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; d="scan'208";a="669676593"
Received: from apascali-mobl2.ger.corp.intel.com (HELO pbossart-mobl3.home)
 ([10.252.42.21])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 11:59:42 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/4] ASoC: SOF: Intel: hda: refine SSP count support
Date: Mon, 22 Aug 2022 20:59:11 +0200
Message-Id: <20220822185911.170440-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822185911.170440-1-pierre-louis.bossart@linux.intel.com>
References: <20220822185911.170440-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

The SSP count is incorrect for TGL and MTL devices, the SSP count is
limited to 3 (I2SPC parameter in the Integration HAS).

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda.h | 2 ++
 sound/soc/sof/intel/mtl.c | 2 +-
 sound/soc/sof/intel/tgl.c | 8 ++++----
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 5ef3e8775e364..34c5ebd9556c1 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -441,6 +441,8 @@
 #define APL_SSP_COUNT		6
 #define CNL_SSP_COUNT		3
 #define ICL_SSP_COUNT		6
+#define TGL_SSP_COUNT		3
+#define MTL_SSP_COUNT		3
 
 /* SSP Registers */
 #define SSP_SSC1_OFFSET		0x4
diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 96239ebb1eedb..27add99b7f947 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -782,7 +782,7 @@ const struct sof_intel_dsp_desc mtl_chip_info = {
 	.ipc_ctl = MTL_DSP_REG_HFIPCXCTL,
 	.rom_status_reg = MTL_DSP_ROM_STS,
 	.rom_init_timeout	= 300,
-	.ssp_count = ICL_SSP_COUNT,
+	.ssp_count = MTL_SSP_COUNT,
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
 	.sdw_shim_base = SDW_SHIM_BASE_ACE,
 	.sdw_alh_base = SDW_ALH_BASE_ACE,
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index 6dfb4786c7824..2119973716809 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -121,7 +121,7 @@ const struct sof_intel_dsp_desc tgl_chip_info = {
 	.ipc_ctl = CNL_DSP_REG_HIPCCTL,
 	.rom_status_reg = HDA_DSP_SRAM_REG_ROM_STATUS,
 	.rom_init_timeout	= 300,
-	.ssp_count = ICL_SSP_COUNT,
+	.ssp_count = TGL_SSP_COUNT,
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
 	.sdw_shim_base = SDW_SHIM_BASE,
 	.sdw_alh_base = SDW_ALH_BASE,
@@ -144,7 +144,7 @@ const struct sof_intel_dsp_desc tglh_chip_info = {
 	.ipc_ctl = CNL_DSP_REG_HIPCCTL,
 	.rom_status_reg = HDA_DSP_SRAM_REG_ROM_STATUS,
 	.rom_init_timeout	= 300,
-	.ssp_count = ICL_SSP_COUNT,
+	.ssp_count = TGL_SSP_COUNT,
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
 	.sdw_shim_base = SDW_SHIM_BASE,
 	.sdw_alh_base = SDW_ALH_BASE,
@@ -167,7 +167,7 @@ const struct sof_intel_dsp_desc ehl_chip_info = {
 	.ipc_ctl = CNL_DSP_REG_HIPCCTL,
 	.rom_status_reg = HDA_DSP_SRAM_REG_ROM_STATUS,
 	.rom_init_timeout	= 300,
-	.ssp_count = ICL_SSP_COUNT,
+	.ssp_count = TGL_SSP_COUNT,
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
 	.sdw_shim_base = SDW_SHIM_BASE,
 	.sdw_alh_base = SDW_ALH_BASE,
@@ -190,7 +190,7 @@ const struct sof_intel_dsp_desc adls_chip_info = {
 	.ipc_ctl = CNL_DSP_REG_HIPCCTL,
 	.rom_status_reg = HDA_DSP_SRAM_REG_ROM_STATUS,
 	.rom_init_timeout	= 300,
-	.ssp_count = ICL_SSP_COUNT,
+	.ssp_count = TGL_SSP_COUNT,
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
 	.sdw_shim_base = SDW_SHIM_BASE,
 	.sdw_alh_base = SDW_ALH_BASE,
-- 
2.34.1

