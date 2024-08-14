Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A599516E0
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2024 10:45:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0872C27AB;
	Wed, 14 Aug 2024 10:45:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0872C27AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723625133;
	bh=qlozRJ3xQk/1szgD7uZbvh9GJmSvk2Z3IeOSOhy/+M8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tBsJG2Lr1Jl4xGrJ9v+nt5yfGFiCiXkFSrmlKXCRCms8p3nRdBfhfq78bA2d9aMZs
	 4FYf778mckmgT5/zBPPQUlaIYZLfaL93APRj04Jn/FWOFFRz6O8WjMxalnge76WYZP
	 cAeXg5/ItrcHCEUqCk2mqt+ti43mhZcNEk0Dx9/E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DFE9F805EC; Wed, 14 Aug 2024 10:44:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D88DF805D6;
	Wed, 14 Aug 2024 10:44:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A34B8F80589; Wed, 14 Aug 2024 10:40:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 62AD5F80423
	for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2024 10:40:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62AD5F80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=K6PHbFVs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723624807; x=1755160807;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qlozRJ3xQk/1szgD7uZbvh9GJmSvk2Z3IeOSOhy/+M8=;
  b=K6PHbFVsOylRjuuGuDRzZ9QM9S6ZtQDylLI+3eWcGf7YoAiFAWSVxsUB
   gC7Pl1bSHKgJDbR5s36mhYXXs2IUn0gFQQbkQa3dKcT0cjK7H3D9BhvgN
   H4o8pxOlgbgfhQFdlXu1eLnk4FUx+2oLhYVqN1TwvE0hHJsmAzFN0K2+W
   7S/PIsESIOLkISo5N2FfIrNKnpAARVMv/XaHhjl3mrcVseqYgNQciTkFe
   ta6z71JXPx1rLxOd3Z2MFmAt5hU4nUstI1DR+mUgQfvuFh+OxJtrrzXJD
   mUgnC8sAZ5XOYC/qObsEUUFGF/g4krmisBbulA5UIxqzaqHkFDHNnFKzm
   Q==;
X-CSE-ConnectionGUID: rB98EZbkQEqdT45qgBB3hA==
X-CSE-MsgGUID: lKLDqpq8RkW7jX0Pdq7tWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="24735122"
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800";
   d="scan'208";a="24735122"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 01:40:03 -0700
X-CSE-ConnectionGUID: G8eThFI9S+CXYZZmjUaVhQ==
X-CSE-MsgGUID: awWq5zn0QmmYmy2QECY+NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800";
   d="scan'208";a="63867912"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa004.jf.intel.com with ESMTP; 14 Aug 2024 01:40:00 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	andriy.shevchenko@linux.intel.com,
	cujomalainey@chromium.org,
	lmajczak@google.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 02/14] ASoC: Intel: Drop skl_machine_pdata usage
Date: Wed, 14 Aug 2024 10:39:17 +0200
Message-Id: <20240814083929.1217319-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240814083929.1217319-1-cezary.rojewski@intel.com>
References: <20240814083929.1217319-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DF4SKXYK773PZFATLVZF75NDLXBIVENR
X-Message-ID-Hash: DF4SKXYK773PZFATLVZF75NDLXBIVENR
X-MailFrom: cezary.rojewski@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DF4SKXYK773PZFATLVZF75NDLXBIVENR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Preparation step in the skylake-driver removal process.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-cnl-match.c |  6 ------
 sound/soc/intel/common/soc-acpi-intel-ehl-match.c |  1 -
 sound/soc/intel/common/soc-acpi-intel-hda-match.c |  6 ------
 sound/soc/intel/common/soc-acpi-intel-icl-match.c |  6 ------
 sound/soc/intel/common/soc-acpi-intel-kbl-match.c | 11 -----------
 sound/soc/intel/common/soc-acpi-intel-skl-match.c |  5 -----
 6 files changed, 35 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
index 3df89e4511da..8bbb1052faf2 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
@@ -8,7 +8,6 @@
 
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
-#include "../skylake/skl.h"
 #include "soc-acpi-intel-sdw-mockup-match.h"
 
 static const struct snd_soc_acpi_codecs essx_83x6 = {
@@ -16,16 +15,11 @@ static const struct snd_soc_acpi_codecs essx_83x6 = {
 	.codecs = { "ESSX8316", "ESSX8326", "ESSX8336"},
 };
 
-static struct skl_machine_pdata cnl_pdata = {
-	.use_tplg_pcm = true,
-};
-
 struct snd_soc_acpi_mach snd_soc_acpi_intel_cnl_machines[] = {
 	{
 		.id = "INT34C2",
 		.drv_name = "cnl_rt274",
 		.fw_filename = "intel/dsp_fw_cnl.bin",
-		.pdata = &cnl_pdata,
 		.sof_tplg_filename = "sof-cnl-rt274.tplg",
 	},
 	{
diff --git a/sound/soc/intel/common/soc-acpi-intel-ehl-match.c b/sound/soc/intel/common/soc-acpi-intel-ehl-match.c
index 84639c41a268..78255d56b08c 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ehl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ehl-match.c
@@ -8,7 +8,6 @@
 
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
-#include "../skylake/skl.h"
 
 struct snd_soc_acpi_mach snd_soc_acpi_intel_ehl_machines[] = {
 	{
diff --git a/sound/soc/intel/common/soc-acpi-intel-hda-match.c b/sound/soc/intel/common/soc-acpi-intel-hda-match.c
index 2017fd0d676f..007ccd8a60e5 100644
--- a/sound/soc/intel/common/soc-acpi-intel-hda-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-hda-match.c
@@ -8,11 +8,6 @@
 
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
-#include "../skylake/skl.h"
-
-static struct skl_machine_pdata hda_pdata = {
-	.use_tplg_pcm = true,
-};
 
 struct snd_soc_acpi_mach snd_soc_acpi_intel_hda_machines[] = {
 	{
@@ -28,7 +23,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_hda_machines[] = {
 		 * can be used if we need a more complicated machine driver
 		 * combining HDA+other device (e.g. DMIC).
 		 */
-		.pdata = &hda_pdata,
 	},
 	{},
 };
diff --git a/sound/soc/intel/common/soc-acpi-intel-icl-match.c b/sound/soc/intel/common/soc-acpi-intel-icl-match.c
index 39875d67dcd1..6ce75fbb842e 100644
--- a/sound/soc/intel/common/soc-acpi-intel-icl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-icl-match.c
@@ -8,23 +8,17 @@
 
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
-#include "../skylake/skl.h"
 
 static const struct snd_soc_acpi_codecs essx_83x6 = {
 	.num_codecs = 3,
 	.codecs = { "ESSX8316", "ESSX8326", "ESSX8336"},
 };
 
-static struct skl_machine_pdata icl_pdata = {
-	.use_tplg_pcm = true,
-};
-
 struct snd_soc_acpi_mach snd_soc_acpi_intel_icl_machines[] = {
 	{
 		.id = "INT34C2",
 		.drv_name = "icl_rt274",
 		.fw_filename = "intel/dsp_fw_icl.bin",
-		.pdata = &icl_pdata,
 		.sof_tplg_filename = "sof-icl-rt274.tplg",
 	},
 	{
diff --git a/sound/soc/intel/common/soc-acpi-intel-kbl-match.c b/sound/soc/intel/common/soc-acpi-intel-kbl-match.c
index 4e817f559d38..d4c158d8441b 100644
--- a/sound/soc/intel/common/soc-acpi-intel-kbl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-kbl-match.c
@@ -8,9 +8,6 @@
 
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
-#include "../skylake/skl.h"
-
-static struct skl_machine_pdata skl_dmic_data;
 
 static const struct snd_soc_acpi_codecs kbl_codecs = {
 	.num_codecs = 1,
@@ -54,7 +51,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_kbl_machines[] = {
 		.fw_filename = "intel/dsp_fw_kbl.bin",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &kbl_codecs,
-		.pdata = &skl_dmic_data,
 	},
 	{
 		.id = "MX98357A",
@@ -62,7 +58,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_kbl_machines[] = {
 		.fw_filename = "intel/dsp_fw_kbl.bin",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &kbl_codecs,
-		.pdata = &skl_dmic_data,
 	},
 	{
 		.id = "MX98927",
@@ -70,7 +65,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_kbl_machines[] = {
 		.fw_filename = "intel/dsp_fw_kbl.bin",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &kbl_5663_5514_codecs,
-		.pdata = &skl_dmic_data,
 	},
 	{
 		.id = "MX98927",
@@ -78,7 +72,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_kbl_machines[] = {
 		.fw_filename = "intel/dsp_fw_kbl.bin",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &kbl_poppy_codecs,
-		.pdata = &skl_dmic_data,
 	},
 	{
 		.id = "10EC5663",
@@ -91,7 +84,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_kbl_machines[] = {
 		.fw_filename = "intel/dsp_fw_kbl.bin",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &kbl_7219_98357_codecs,
-		.pdata = &skl_dmic_data,
 	},
 	{
 		.id = "DLGS7219",
@@ -99,7 +91,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_kbl_machines[] = {
 		.fw_filename = "intel/dsp_fw_kbl.bin",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &kbl_7219_98927_codecs,
-		.pdata = &skl_dmic_data
 	},
 	{
 		.id = "10EC5660",
@@ -117,13 +108,11 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_kbl_machines[] = {
 		.fw_filename = "intel/dsp_fw_kbl.bin",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &kbl_7219_98373_codecs,
-		.pdata = &skl_dmic_data
 	},
 	{
 		.id = "MX98373",
 		.drv_name = "kbl_max98373",
 		.fw_filename = "intel/dsp_fw_kbl.bin",
-		.pdata = &skl_dmic_data
 	},
 	{},
 };
diff --git a/sound/soc/intel/common/soc-acpi-intel-skl-match.c b/sound/soc/intel/common/soc-acpi-intel-skl-match.c
index 75302e956742..ee6463202918 100644
--- a/sound/soc/intel/common/soc-acpi-intel-skl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-skl-match.c
@@ -8,9 +8,6 @@
 
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
-#include "../skylake/skl.h"
-
-static struct skl_machine_pdata skl_dmic_data;
 
 static const struct snd_soc_acpi_codecs skl_codecs = {
 	.num_codecs = 1,
@@ -29,7 +26,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_skl_machines[] = {
 		.fw_filename = "intel/dsp_fw_release.bin",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &skl_codecs,
-		.pdata = &skl_dmic_data,
 	},
 	{
 		.id = "MX98357A",
@@ -37,7 +33,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_skl_machines[] = {
 		.fw_filename = "intel/dsp_fw_release.bin",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &skl_codecs,
-		.pdata = &skl_dmic_data,
 	},
 	{},
 };
-- 
2.25.1

