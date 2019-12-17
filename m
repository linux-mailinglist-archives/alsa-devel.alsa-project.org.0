Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C73123745
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2019 21:27:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16A01166D;
	Tue, 17 Dec 2019 21:26:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16A01166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576614437;
	bh=kzNDiMLdM5PKISWBhQMySZ6SoF9XnwpPzpcCyZ7XvOs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g2acMEor2QWr6lHBvpqoFE+ujW4V26PzO/Yps1SAR98KmcpEqiz60lP9X1JzhgDfE
	 aTjFm21x2jQa8jwpUS/smcUDJD8STvPKS/n7OrI3Zrwuj1k5lA5mp92BKJLJo8+4tB
	 hRCaA7J9VpOXZg6GhudzNTdSYLp8p3lZUoIEvsaI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B13D2F8028F;
	Tue, 17 Dec 2019 21:23:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58B8BF80273; Tue, 17 Dec 2019 21:23:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0DA75F80256
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 21:22:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DA75F80256
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 12:22:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,326,1571727600"; d="scan'208";a="266679234"
Received: from smcdonal-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.83.42])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Dec 2019 12:22:52 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 17 Dec 2019 14:22:28 -0600
Message-Id: <20191217202231.18259-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191217202231.18259-1-pierre-louis.bossart@linux.intel.com>
References: <20191217202231.18259-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 5/8] ASoC: SOF: Intel: add namespace for
	HDA_COMMON
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

Define namespace and include it in PCI top-level module.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/apl.c   |  4 ++--
 sound/soc/sof/intel/cnl.c   | 12 ++++++------
 sound/soc/sof/sof-pci-dev.c |  1 +
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index aeed1422900b..97831d2c9df6 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -112,7 +112,7 @@ const struct snd_sof_dsp_ops sof_apl_ops = {
 			SNDRV_PCM_INFO_PAUSE |
 			SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
 };
-EXPORT_SYMBOL(sof_apl_ops);
+EXPORT_SYMBOL_NS(sof_apl_ops, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 const struct sof_intel_dsp_desc apl_chip_info = {
 	/* Apollolake */
@@ -128,4 +128,4 @@ const struct sof_intel_dsp_desc apl_chip_info = {
 	.ssp_count = APL_SSP_COUNT,
 	.ssp_base_offset = APL_SSP_BASE_OFFSET,
 };
-EXPORT_SYMBOL(apl_chip_info);
+EXPORT_SYMBOL_NS(apl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 6b44f6d02082..b27088e67c7b 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -298,7 +298,7 @@ const struct snd_sof_dsp_ops sof_cnl_ops = {
 			SNDRV_PCM_INFO_PAUSE |
 			SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
 };
-EXPORT_SYMBOL(sof_cnl_ops);
+EXPORT_SYMBOL_NS(sof_cnl_ops, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 const struct sof_intel_dsp_desc cnl_chip_info = {
 	/* Cannonlake */
@@ -317,7 +317,7 @@ const struct sof_intel_dsp_desc cnl_chip_info = {
 	.ssp_count = CNL_SSP_COUNT,
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
 };
-EXPORT_SYMBOL(cnl_chip_info);
+EXPORT_SYMBOL_NS(cnl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 const struct sof_intel_dsp_desc icl_chip_info = {
 	/* Icelake */
@@ -336,7 +336,7 @@ const struct sof_intel_dsp_desc icl_chip_info = {
 	.ssp_count = ICL_SSP_COUNT,
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
 };
-EXPORT_SYMBOL(icl_chip_info);
+EXPORT_SYMBOL_NS(icl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 const struct sof_intel_dsp_desc tgl_chip_info = {
 	/* Tigerlake */
@@ -352,7 +352,7 @@ const struct sof_intel_dsp_desc tgl_chip_info = {
 	.ssp_count = ICL_SSP_COUNT,
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
 };
-EXPORT_SYMBOL(tgl_chip_info);
+EXPORT_SYMBOL_NS(tgl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 const struct sof_intel_dsp_desc ehl_chip_info = {
 	/* Elkhartlake */
@@ -368,7 +368,7 @@ const struct sof_intel_dsp_desc ehl_chip_info = {
 	.ssp_count = ICL_SSP_COUNT,
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
 };
-EXPORT_SYMBOL(ehl_chip_info);
+EXPORT_SYMBOL_NS(ehl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 const struct sof_intel_dsp_desc jsl_chip_info = {
 	/* Jasperlake */
@@ -385,4 +385,4 @@ const struct sof_intel_dsp_desc jsl_chip_info = {
 	.ssp_count = ICL_SSP_COUNT,
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
 };
-EXPORT_SYMBOL(jsl_chip_info);
+EXPORT_SYMBOL_NS(jsl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 3defbb6c0e86..17a959da525a 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -420,3 +420,4 @@ module_pci_driver(snd_sof_pci_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_IMPORT_NS(SND_SOC_SOF_MERRIFIELD);
+MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_COMMON);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
