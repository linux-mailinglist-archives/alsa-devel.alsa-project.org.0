Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EFD4C9511
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Mar 2022 20:51:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD65B1B25;
	Tue,  1 Mar 2022 20:50:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD65B1B25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646164293;
	bh=UVNXeTcoIHJuKBwX8l7GptzK/hiLaPfG6iKCrFs23rw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hfflauT+FLS7ZyI0MlRW2LVTycuCtw6sD8IYj44ZlqLmlMOcGuCh6rzRWfvNynNMc
	 0efknl4Ba2NLacoo3My+a9Cof6QDDAM7d9gvEaMJHCD6r3s1s0/wFVR48cWl3ZN5t5
	 xHQ2JRhJKcHqYuUoh/1M0LZADvNH/004QM++cFLk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6ED6F80516;
	Tue,  1 Mar 2022 20:49:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E4B6F80518; Tue,  1 Mar 2022 20:49:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A85E6F802D2
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 20:49:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A85E6F802D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="fRRDbHWQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646164161; x=1677700161;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UVNXeTcoIHJuKBwX8l7GptzK/hiLaPfG6iKCrFs23rw=;
 b=fRRDbHWQUwiAsYwS3/vAFxkrZjfvZxXpqidfNjeuEayikopz1tDnf/iL
 +Sfm3J21DNHAGaEjLq1pZiirh8UaaJ7+YRS7xciOssMfuEhJQsVdMM0iZ
 96shgcoJ2jWiJAFJRAUL/XnKXP75stfRDnC4FqecjS9rw5IkkDln7NAjv
 z7H1ULi/Y87d4XC6V1MH7ejArIEu70ERw7BG1MTQXX0l3i0ZmYZdyzOpU
 9CQnItHtKZOnUJMsPjfNn6qgB9e5mrAo/dPIFJUlMGZ8djzDTatLWTWxM
 QT+hKKZkLi+4zk3sAMWdK688reaW+zvj2mZMMrvazIcRxIFNrC8rgEdAy g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="233841067"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="233841067"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 11:49:15 -0800
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="630131854"
Received: from rbrosius-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.131.146])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 11:49:15 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/8] ASoC: Intel: boards: create sof-realtek-common module
Date: Tue,  1 Mar 2022 13:48:59 -0600
Message-Id: <20220301194903.60859-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301194903.60859-1-pierre-louis.bossart@linux.intel.com>
References: <20220301194903.60859-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: Brent Lu <brent.lu@intel.com>

Move sof_realtek_common.o to a dedicated module like the module to
support maxim amplifiers.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig              | 4 ++++
 sound/soc/intel/boards/Makefile             | 7 +++++--
 sound/soc/intel/boards/sof_realtek_common.c | 9 +++++++++
 sound/soc/intel/boards/sof_rt5682.c         | 1 +
 4 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index ad0664ca4915..cdf94b09c372 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -32,6 +32,9 @@ config SND_SOC_INTEL_HDA_DSP_COMMON
 config SND_SOC_INTEL_SOF_MAXIM_COMMON
 	tristate
 
+config SND_SOC_INTEL_SOF_REALTEK_COMMON
+	tristate
+
 if SND_SOC_INTEL_CATPT
 
 config SND_SOC_INTEL_HASWELL_MACH
@@ -477,6 +480,7 @@ config SND_SOC_INTEL_SOF_RT5682_MACH
 	select SND_SOC_HDAC_HDMI
 	select SND_SOC_INTEL_HDA_DSP_COMMON
 	select SND_SOC_INTEL_SOF_MAXIM_COMMON
+	select SND_SOC_INTEL_SOF_REALTEK_COMMON
 	help
 	   This adds support for ASoC machine driver for SOF platforms
 	   with rt5682 codec.
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 9f044290b420..b2966020e7ed 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -19,10 +19,10 @@ snd-soc-sst-byt-cht-cx2072x-objs := bytcht_cx2072x.o
 snd-soc-sst-byt-cht-da7213-objs := bytcht_da7213.o
 snd-soc-sst-byt-cht-es8316-objs := bytcht_es8316.o
 snd-soc-sst-byt-cht-nocodec-objs := bytcht_nocodec.o
-snd-soc-sof_rt5682-objs := sof_rt5682.o sof_realtek_common.o
+snd-soc-sof_rt5682-objs := sof_rt5682.o
 snd-soc-sof_cs42l42-objs := sof_cs42l42.o
 snd-soc-sof_es8336-objs := sof_es8336.o
-snd-soc-sof_nau8825-objs := sof_nau8825.o sof_realtek_common.o
+snd-soc-sof_nau8825-objs := sof_nau8825.o
 snd-soc-cml_rt1011_rt5682-objs := cml_rt1011_rt5682.o
 snd-soc-kbl_da7219_max98357a-objs := kbl_da7219_max98357a.o
 snd-soc-kbl_da7219_max98927-objs := kbl_da7219_max98927.o
@@ -88,3 +88,6 @@ obj-$(CONFIG_SND_SOC_INTEL_HDA_DSP_COMMON) += snd-soc-intel-hda-dsp-common.o
 
 snd-soc-intel-sof-maxim-common-objs += sof_maxim_common.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_MAXIM_COMMON) += snd-soc-intel-sof-maxim-common.o
+
+snd-soc-intel-sof-realtek-common-objs += sof_realtek_common.o
+obj-$(CONFIG_SND_SOC_INTEL_SOF_REALTEK_COMMON) += snd-soc-intel-sof-realtek-common.o
diff --git a/sound/soc/intel/boards/sof_realtek_common.c b/sound/soc/intel/boards/sof_realtek_common.c
index 4cf131310ad3..669e44c73c17 100644
--- a/sound/soc/intel/boards/sof_realtek_common.c
+++ b/sound/soc/intel/boards/sof_realtek_common.c
@@ -132,12 +132,14 @@ void sof_rt1011_dai_link(struct snd_soc_dai_link *link)
 	link->init = rt1011_init;
 	link->ops = &rt1011_ops;
 }
+EXPORT_SYMBOL_NS(sof_rt1011_dai_link, SND_SOC_INTEL_SOF_REALTEK_COMMON);
 
 void sof_rt1011_codec_conf(struct snd_soc_card *card)
 {
 	card->codec_conf = rt1011_codec_confs;
 	card->num_configs = ARRAY_SIZE(rt1011_codec_confs);
 }
+EXPORT_SYMBOL_NS(sof_rt1011_codec_conf, SND_SOC_INTEL_SOF_REALTEK_COMMON);
 
 /*
  * rt1015:  i2c mode driver for ALC1015 and ALC1015Q
@@ -233,6 +235,7 @@ void sof_rt1015p_dai_link(struct snd_soc_dai_link *link)
 	link->init = rt1015p_init;
 	link->ops = &rt1015p_ops;
 }
+EXPORT_SYMBOL_NS(sof_rt1015p_dai_link, SND_SOC_INTEL_SOF_REALTEK_COMMON);
 
 void sof_rt1015p_codec_conf(struct snd_soc_card *card)
 {
@@ -242,6 +245,7 @@ void sof_rt1015p_codec_conf(struct snd_soc_card *card)
 	card->codec_conf = rt1015p_codec_confs;
 	card->num_configs = ARRAY_SIZE(rt1015p_codec_confs);
 }
+EXPORT_SYMBOL_NS(sof_rt1015p_codec_conf, SND_SOC_INTEL_SOF_REALTEK_COMMON);
 
 /*
  * RT1015 audio amplifier
@@ -343,6 +347,7 @@ void sof_rt1015_codec_conf(struct snd_soc_card *card)
 	card->codec_conf = rt1015_amp_conf;
 	card->num_configs = ARRAY_SIZE(rt1015_amp_conf);
 }
+EXPORT_SYMBOL_NS(sof_rt1015_codec_conf, SND_SOC_INTEL_SOF_REALTEK_COMMON);
 
 void sof_rt1015_dai_link(struct snd_soc_dai_link *link, unsigned int fs)
 {
@@ -354,3 +359,7 @@ void sof_rt1015_dai_link(struct snd_soc_dai_link *link, unsigned int fs)
 	if (fs == 100)
 		rt1015_ops.hw_params = rt1015_hw_params_pll_and_tdm;
 }
+EXPORT_SYMBOL_NS(sof_rt1015_dai_link, SND_SOC_INTEL_SOF_REALTEK_COMMON);
+
+MODULE_DESCRIPTION("ASoC Intel SOF Realtek helpers");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 2fcd22272900..ebec4d15edaa 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -1081,3 +1081,4 @@ MODULE_AUTHOR("Mac Chiang <mac.chiang@intel.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_MAXIM_COMMON);
+MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_REALTEK_COMMON);
-- 
2.25.1

