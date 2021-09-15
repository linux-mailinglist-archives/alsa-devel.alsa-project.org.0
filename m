Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D77A40BFF1
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 08:57:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C24A91817;
	Wed, 15 Sep 2021 08:56:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C24A91817
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631689058;
	bh=PZLdwzHEi2gPkxuaCtyCBS4cLtCyVI/dhF9xELidmqc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RFDRwcYIPPHRFyF2GRit+4MAJZ/kUC8CeiHD+HcvJjr4bv3YKwQBpGDdjZnnXdS+9
	 7O6vqRApINfIT0JGFm2yfVr0fjeOrjBStpxa1IhEQ980QdUMwk848nG9opY22Os1Nq
	 F11bbXcLoFVaFVNj4Bmikxx0GPFSP/BohGxwYflU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DC2CF804BD;
	Wed, 15 Sep 2021 08:56:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB0E8F8049E; Wed, 15 Sep 2021 08:55:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2B38F80227
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 08:55:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2B38F80227
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="221901781"
X-IronPort-AV: E=Sophos;i="5.85,294,1624345200"; d="scan'208";a="221901781"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 23:55:47 -0700
X-IronPort-AV: E=Sophos;i="5.85,294,1624345200"; d="scan'208";a="544604202"
Received: from msavu-mobl1.ti.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.216.36])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 23:55:45 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 1/2] ASoC: SOF: intel: Do no initialize resindex_dma_base
Date: Wed, 15 Sep 2021 09:55:40 +0300
Message-Id: <20210915065541.1178-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210915065541.1178-1-peter.ujfalusi@linux.intel.com>
References: <20210915065541.1178-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 daniel.baluta@nxp.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

.resindex_dma_base is not used by the code and in all instances it is set
to -1.
To make it possible to remove it from the sof_dev_desc struct, first remove
all references from the intel drivers (initialization).

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/pci-apl.c | 2 --
 sound/soc/sof/intel/pci-cnl.c | 3 ---
 sound/soc/sof/intel/pci-icl.c | 2 --
 sound/soc/sof/intel/pci-tgl.c | 5 -----
 sound/soc/sof/intel/pci-tng.c | 1 -
 5 files changed, 13 deletions(-)

diff --git a/sound/soc/sof/intel/pci-apl.c b/sound/soc/sof/intel/pci-apl.c
index f89e746c2570..a023b3cc0af4 100644
--- a/sound/soc/sof/intel/pci-apl.c
+++ b/sound/soc/sof/intel/pci-apl.c
@@ -26,7 +26,6 @@ static const struct sof_dev_desc bxt_desc = {
 	.resindex_pcicfg_base	= -1,
 	.resindex_imr_base	= -1,
 	.irqindex_host_ipc	= -1,
-	.resindex_dma_base	= -1,
 	.chip_info = &apl_chip_info,
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
@@ -42,7 +41,6 @@ static const struct sof_dev_desc glk_desc = {
 	.resindex_pcicfg_base	= -1,
 	.resindex_imr_base	= -1,
 	.irqindex_host_ipc	= -1,
-	.resindex_dma_base	= -1,
 	.chip_info = &apl_chip_info,
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
diff --git a/sound/soc/sof/intel/pci-cnl.c b/sound/soc/sof/intel/pci-cnl.c
index f23257adf2ab..40cf1cd00042 100644
--- a/sound/soc/sof/intel/pci-cnl.c
+++ b/sound/soc/sof/intel/pci-cnl.c
@@ -27,7 +27,6 @@ static const struct sof_dev_desc cnl_desc = {
 	.resindex_pcicfg_base	= -1,
 	.resindex_imr_base	= -1,
 	.irqindex_host_ipc	= -1,
-	.resindex_dma_base	= -1,
 	.chip_info = &cnl_chip_info,
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
@@ -44,7 +43,6 @@ static const struct sof_dev_desc cfl_desc = {
 	.resindex_pcicfg_base	= -1,
 	.resindex_imr_base	= -1,
 	.irqindex_host_ipc	= -1,
-	.resindex_dma_base	= -1,
 	.chip_info = &cnl_chip_info,
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
@@ -61,7 +59,6 @@ static const struct sof_dev_desc cml_desc = {
 	.resindex_pcicfg_base	= -1,
 	.resindex_imr_base	= -1,
 	.irqindex_host_ipc	= -1,
-	.resindex_dma_base	= -1,
 	.chip_info = &cnl_chip_info,
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
diff --git a/sound/soc/sof/intel/pci-icl.c b/sound/soc/sof/intel/pci-icl.c
index 2f60c28ae81f..39c84121b313 100644
--- a/sound/soc/sof/intel/pci-icl.c
+++ b/sound/soc/sof/intel/pci-icl.c
@@ -27,7 +27,6 @@ static const struct sof_dev_desc icl_desc = {
 	.resindex_pcicfg_base   = -1,
 	.resindex_imr_base      = -1,
 	.irqindex_host_ipc      = -1,
-	.resindex_dma_base      = -1,
 	.chip_info = &icl_chip_info,
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
@@ -43,7 +42,6 @@ static const struct sof_dev_desc jsl_desc = {
 	.resindex_pcicfg_base   = -1,
 	.resindex_imr_base      = -1,
 	.irqindex_host_ipc      = -1,
-	.resindex_dma_base      = -1,
 	.chip_info = &jsl_chip_info,
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
diff --git a/sound/soc/sof/intel/pci-tgl.c b/sound/soc/sof/intel/pci-tgl.c
index d04ce84fe7cc..f2ea34df9741 100644
--- a/sound/soc/sof/intel/pci-tgl.c
+++ b/sound/soc/sof/intel/pci-tgl.c
@@ -27,7 +27,6 @@ static const struct sof_dev_desc tgl_desc = {
 	.resindex_pcicfg_base   = -1,
 	.resindex_imr_base      = -1,
 	.irqindex_host_ipc      = -1,
-	.resindex_dma_base      = -1,
 	.chip_info = &tgl_chip_info,
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
@@ -44,7 +43,6 @@ static const struct sof_dev_desc tglh_desc = {
 	.resindex_pcicfg_base   = -1,
 	.resindex_imr_base      = -1,
 	.irqindex_host_ipc      = -1,
-	.resindex_dma_base      = -1,
 	.chip_info = &tglh_chip_info,
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
@@ -60,7 +58,6 @@ static const struct sof_dev_desc ehl_desc = {
 	.resindex_pcicfg_base   = -1,
 	.resindex_imr_base      = -1,
 	.irqindex_host_ipc      = -1,
-	.resindex_dma_base      = -1,
 	.chip_info = &ehl_chip_info,
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
@@ -77,7 +74,6 @@ static const struct sof_dev_desc adls_desc = {
 	.resindex_pcicfg_base   = -1,
 	.resindex_imr_base      = -1,
 	.irqindex_host_ipc      = -1,
-	.resindex_dma_base      = -1,
 	.chip_info = &adls_chip_info,
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
@@ -94,7 +90,6 @@ static const struct sof_dev_desc adl_desc = {
 	.resindex_pcicfg_base   = -1,
 	.resindex_imr_base      = -1,
 	.irqindex_host_ipc      = -1,
-	.resindex_dma_base      = -1,
 	.chip_info = &tgl_chip_info,
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
diff --git a/sound/soc/sof/intel/pci-tng.c b/sound/soc/sof/intel/pci-tng.c
index 4bded668b672..2f14082bd0ad 100644
--- a/sound/soc/sof/intel/pci-tng.c
+++ b/sound/soc/sof/intel/pci-tng.c
@@ -201,7 +201,6 @@ static const struct sof_dev_desc tng_desc = {
 	.resindex_pcicfg_base	= -1,
 	.resindex_imr_base	= 0,
 	.irqindex_host_ipc	= -1,
-	.resindex_dma_base	= -1,
 	.chip_info = &tng_chip_info,
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
-- 
2.33.0

