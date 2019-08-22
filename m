Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F179A00D
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 21:30:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8BDC1692;
	Thu, 22 Aug 2019 21:29:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8BDC1692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566502230;
	bh=grHdB133iQz6iiZw9mWhAohXALPQh45P+JkLlqHvquc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FZHjILz7iiKmeF/a1Sakc/IjByzH8xaTaDsCFcIDaAzwFXdEaI+uQMtnP4GoObHwm
	 mLAGxZWIthTG6vtepBnqulYP6f8/c+VIsAySpUgYStO3ahN4HLtE109y9VrGrsDFMR
	 11xNle84zieWjhnQF29PxRbebhKnhkHNvMWiSDzg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64A11F8961A;
	Thu, 22 Aug 2019 21:07:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A07FF8067A; Thu, 22 Aug 2019 21:06:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D0CBF805A1
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 21:05:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D0CBF805A1
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 12:05:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="203524644"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2019 12:05:37 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 22 Aug 2019 21:04:25 +0200
Message-Id: <20190822190425.23001-36-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822190425.23001-1-cezary.rojewski@intel.com>
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 35/35] ASoC: Intel: Remove obsolete firmware
	fields
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

FW filename fields are now deprecated in favour of ones coming from
platform descriptors. This aligns with paradigm of FW being platform
specific, not board specific.
Any remaining deprecated survivors of the precedding tidal wave are
removed here too.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-bxt-match.c    |  2 --
 sound/soc/intel/common/soc-acpi-intel-byt-match.c    |  2 --
 sound/soc/intel/common/soc-acpi-intel-cnl-match.c    |  1 -
 sound/soc/intel/common/soc-acpi-intel-glk-match.c    |  3 ---
 sound/soc/intel/common/soc-acpi-intel-hda-match.c    |  2 --
 .../soc/intel/common/soc-acpi-intel-hsw-bdw-match.c  |  4 ----
 sound/soc/intel/common/soc-acpi-intel-icl-match.c    |  1 -
 sound/soc/intel/common/soc-acpi-intel-kbl-match.c    | 12 ------------
 sound/soc/intel/common/soc-acpi-intel-skl-match.c    |  3 ---
 sound/soc/intel/common/sst-dsp-priv.h                |  1 -
 sound/soc/intel/skylake/skl.h                        |  1 -
 11 files changed, 32 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-bxt-match.c b/sound/soc/intel/common/soc-acpi-intel-bxt-match.c
index 4a5adae1d785..eda799e49113 100644
--- a/sound/soc/intel/common/soc-acpi-intel-bxt-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-bxt-match.c
@@ -50,14 +50,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_bxt_machines[] = {
 	{
 		.id = "INT343A",
 		.drv_name = "bxt_alc298s_i2s",
-		.fw_filename = "intel/dsp_fw_bxtn.bin",
 		.sof_fw_filename = "sof-apl.ri",
 		.sof_tplg_filename = "sof-apl-rt298.tplg",
 	},
 	{
 		.id = "DLGS7219",
 		.drv_name = "bxt_da7219_max98357a",
-		.fw_filename = "intel/dsp_fw_bxtn.bin",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &bxt_codecs,
 		.sof_fw_filename = "sof-apl.ri",
diff --git a/sound/soc/intel/common/soc-acpi-intel-byt-match.c b/sound/soc/intel/common/soc-acpi-intel-byt-match.c
index 1cc801ba92eb..4d2ba663ee33 100644
--- a/sound/soc/intel/common/soc-acpi-intel-byt-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-byt-match.c
@@ -124,12 +124,10 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_baytrail_legacy_machines[] = {
 	{
 		.id = "10EC5640",
 		.drv_name = "byt-rt5640",
-		.fw_filename = "intel/fw_sst_0f28.bin-48kHz_i2s_master",
 	},
 	{
 		.id = "193C9890",
 		.drv_name = "byt-max98090",
-		.fw_filename = "intel/fw_sst_0f28.bin-48kHz_i2s_master",
 	},
 	{}
 };
diff --git a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
index 771b0ef21051..edc44a0dc96f 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
@@ -23,7 +23,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cnl_machines[] = {
 	{
 		.id = "INT34C2",
 		.drv_name = "cnl_rt274",
-		.fw_filename = "intel/dsp_fw_cnl.bin",
 		.pdata = &cnl_pdata,
 		.sof_fw_filename = "sof-cnl.ri",
 		.sof_tplg_filename = "sof-cnl-rt274.tplg",
diff --git a/sound/soc/intel/common/soc-acpi-intel-glk-match.c b/sound/soc/intel/common/soc-acpi-intel-glk-match.c
index 60dea358fa04..370487d13c85 100644
--- a/sound/soc/intel/common/soc-acpi-intel-glk-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-glk-match.c
@@ -18,14 +18,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_glk_machines[] = {
 	{
 		.id = "INT343A",
 		.drv_name = "glk_alc298s_i2s",
-		.fw_filename = "intel/dsp_fw_glk.bin",
 		.sof_fw_filename = "sof-glk.ri",
 		.sof_tplg_filename = "sof-glk-alc298.tplg",
 	},
 	{
 		.id = "DLGS7219",
 		.drv_name = "glk_da7219_max98357a",
-		.fw_filename = "intel/dsp_fw_glk.bin",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &glk_codecs,
 		.sof_fw_filename = "sof-glk.ri",
@@ -34,7 +32,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_glk_machines[] = {
 	{
 		.id = "10EC5682",
 		.drv_name = "glk_rt5682_max98357a",
-		.fw_filename = "intel/dsp_fw_glk.bin",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &glk_codecs,
 		.sof_fw_filename = "sof-glk.ri",
diff --git a/sound/soc/intel/common/soc-acpi-intel-hda-match.c b/sound/soc/intel/common/soc-acpi-intel-hda-match.c
index cc972d2ac691..39827d2e8634 100644
--- a/sound/soc/intel/common/soc-acpi-intel-hda-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-hda-match.c
@@ -19,8 +19,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_hda_machines[] = {
 		/* .id is not used in this file */
 		.drv_name = "skl_hda_dsp_generic",
 
-		/* .fw_filename is dynamically set in skylake driver */
-
 		/* .sof_fw_filename is dynamically set in sof/intel driver */
 
 		.sof_tplg_filename = "sof-hda-generic.tplg",
diff --git a/sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c b/sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c
index 34eb0baaa951..6b113c32aff0 100644
--- a/sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c
@@ -13,7 +13,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_haswell_machines[] = {
 	{
 		.id = "INT33CA",
 		.drv_name = "haswell-audio",
-		.fw_filename = "intel/IntcSST1.bin",
 		.sof_fw_filename = "sof-hsw.ri",
 		.sof_tplg_filename = "sof-hsw.tplg",
 	},
@@ -25,21 +24,18 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_broadwell_machines[] = {
 	{
 		.id = "INT343A",
 		.drv_name = "broadwell-audio",
-		.fw_filename =  "intel/IntcSST2.bin",
 		.sof_fw_filename = "sof-bdw.ri",
 		.sof_tplg_filename = "sof-bdw-rt286.tplg",
 	},
 	{
 		.id = "RT5677CE",
 		.drv_name = "bdw-rt5677",
-		.fw_filename =  "intel/IntcSST2.bin",
 		.sof_fw_filename = "sof-bdw.ri",
 		.sof_tplg_filename = "sof-bdw-rt5677.tplg",
 	},
 	{
 		.id = "INT33CA",
 		.drv_name = "haswell-audio",
-		.fw_filename = "intel/IntcSST2.bin",
 		.sof_fw_filename = "sof-bdw.ri",
 		.sof_tplg_filename = "sof-bdw-rt5640.tplg",
 	},
diff --git a/sound/soc/intel/common/soc-acpi-intel-icl-match.c b/sound/soc/intel/common/soc-acpi-intel-icl-match.c
index 38977669b576..04a17da96f6a 100644
--- a/sound/soc/intel/common/soc-acpi-intel-icl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-icl-match.c
@@ -18,7 +18,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_icl_machines[] = {
 	{
 		.id = "INT34C2",
 		.drv_name = "icl_rt274",
-		.fw_filename = "intel/dsp_fw_icl.bin",
 		.pdata = &icl_pdata,
 		.sof_fw_filename = "sof-icl.ri",
 		.sof_tplg_filename = "sof-icl-rt274.tplg",
diff --git a/sound/soc/intel/common/soc-acpi-intel-kbl-match.c b/sound/soc/intel/common/soc-acpi-intel-kbl-match.c
index e200baa11011..fe82d5472aa3 100644
--- a/sound/soc/intel/common/soc-acpi-intel-kbl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-kbl-match.c
@@ -46,12 +46,10 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_kbl_machines[] = {
 	{
 		.id = "INT343A",
 		.drv_name = "kbl_alc286s_i2s",
-		.fw_filename = "intel/dsp_fw_kbl.bin",
 	},
 	{
 		.id = "INT343B",
 		.drv_name = "kbl_n88l25_s4567",
-		.fw_filename = "intel/dsp_fw_kbl.bin",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &kbl_codecs,
 		.pdata = &skl_dmic_data,
@@ -59,7 +57,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_kbl_machines[] = {
 	{
 		.id = "MX98357A",
 		.drv_name = "kbl_n88l25_m98357a",
-		.fw_filename = "intel/dsp_fw_kbl.bin",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &kbl_codecs,
 		.pdata = &skl_dmic_data,
@@ -67,7 +64,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_kbl_machines[] = {
 	{
 		.id = "MX98927",
 		.drv_name = "kbl_r5514_5663_max",
-		.fw_filename = "intel/dsp_fw_kbl.bin",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &kbl_5663_5514_codecs,
 		.pdata = &skl_dmic_data,
@@ -75,7 +71,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_kbl_machines[] = {
 	{
 		.id = "MX98927",
 		.drv_name = "kbl_rt5663_m98927",
-		.fw_filename = "intel/dsp_fw_kbl.bin",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &kbl_poppy_codecs,
 		.pdata = &skl_dmic_data,
@@ -83,12 +78,10 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_kbl_machines[] = {
 	{
 		.id = "10EC5663",
 		.drv_name = "kbl_rt5663",
-		.fw_filename = "intel/dsp_fw_kbl.bin",
 	},
 	{
 		.id = "DLGS7219",
 		.drv_name = "kbl_da7219_max98357a",
-		.fw_filename = "intel/dsp_fw_kbl.bin",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &kbl_7219_98357_codecs,
 		.pdata = &skl_dmic_data,
@@ -96,7 +89,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_kbl_machines[] = {
 	{
 		.id = "DLGS7219",
 		.drv_name = "kbl_da7219_max98927",
-		.fw_filename = "intel/dsp_fw_kbl.bin",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &kbl_7219_98927_codecs,
 		.pdata = &skl_dmic_data
@@ -104,17 +96,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_kbl_machines[] = {
 	{
 		.id = "10EC5660",
 		.drv_name = "kbl_rt5660",
-		.fw_filename = "intel/dsp_fw_kbl.bin",
 	},
 	{
 		.id = "10EC3277",
 		.drv_name = "kbl_rt5660",
-		.fw_filename = "intel/dsp_fw_kbl.bin",
 	},
 	{
 		.id = "DLGS7219",
 		.drv_name = "kbl_da7219_max98373",
-		.fw_filename = "intel/dsp_fw_kbl.bin",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &kbl_7219_98373_codecs,
 		.pdata = &skl_dmic_data
@@ -122,7 +111,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_kbl_machines[] = {
 	{
 		.id = "MX98373",
 		.drv_name = "kbl_max98373",
-		.fw_filename = "intel/dsp_fw_kbl.bin",
 		.pdata = &skl_dmic_data
 	},
 	{},
diff --git a/sound/soc/intel/common/soc-acpi-intel-skl-match.c b/sound/soc/intel/common/soc-acpi-intel-skl-match.c
index 42fa40a8d932..ec969044706c 100644
--- a/sound/soc/intel/common/soc-acpi-intel-skl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-skl-match.c
@@ -21,12 +21,10 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_skl_machines[] = {
 	{
 		.id = "INT343A",
 		.drv_name = "skl_alc286s_i2s",
-		.fw_filename = "intel/dsp_fw_release.bin",
 	},
 	{
 		.id = "INT343B",
 		.drv_name = "skl_n88l25_s4567",
-		.fw_filename = "intel/dsp_fw_release.bin",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &skl_codecs,
 		.pdata = &skl_dmic_data,
@@ -34,7 +32,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_skl_machines[] = {
 	{
 		.id = "MX98357A",
 		.drv_name = "skl_n88l25_m98357a",
-		.fw_filename = "intel/dsp_fw_release.bin",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &skl_codecs,
 		.pdata = &skl_dmic_data,
diff --git a/sound/soc/intel/common/sst-dsp-priv.h b/sound/soc/intel/common/sst-dsp-priv.h
index a4628a89d47d..1a208ef65fa8 100644
--- a/sound/soc/intel/common/sst-dsp-priv.h
+++ b/sound/soc/intel/common/sst-dsp-priv.h
@@ -306,7 +306,6 @@ struct sst_dsp {
 	int sst_state;
 	struct skl_cl_dev cl_dev;
 	u32 intr_status;
-	const struct firmware *fw;
 	struct snd_dma_buffer dmab;
 };
 
diff --git a/sound/soc/intel/skylake/skl.h b/sound/soc/intel/skylake/skl.h
index 218e8bda6cae..7b283c2bb7b5 100644
--- a/sound/soc/intel/skylake/skl.h
+++ b/sound/soc/intel/skylake/skl.h
@@ -76,7 +76,6 @@ struct skl_dev {
 	struct list_head ppl_list;
 	struct list_head bind_list;
 
-	const char *fw_name;
 	char tplg_name[64];
 	unsigned short pci_id;
 	const struct firmware *tplg;
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
