Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 707CA4CDF56
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 22:01:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12691FA;
	Fri,  4 Mar 2022 22:00:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12691FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646427677;
	bh=GpGb6XGYSFak51cPRJ81OCjkpIJLIgCTh3m6S1l/VzM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fSq8Tg7nJCz4PokTZFai1ioDTaMUC+9c0XJZyuEGbTDFMALzk+8Zrj0PF+P8oCOqh
	 6NCkO1pwSFbaiQqcprLvX9jngnYsfF1/zJnoxrT+Dxz+p1CrOpfET2TOgcTlvUMda7
	 CqWi0RopTdlO0WsMriaEQW5z6NQwyUWRSpCCDJnE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDE33F80537;
	Fri,  4 Mar 2022 21:58:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E14EF8051F; Fri,  4 Mar 2022 21:57:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22E29F801F5
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 21:57:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22E29F801F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="QbS1NjeJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646427470; x=1677963470;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GpGb6XGYSFak51cPRJ81OCjkpIJLIgCTh3m6S1l/VzM=;
 b=QbS1NjeJ+IsWtzHZcWO+FQ24NWtCRZq2DgTqG6eU2/KmVeNMK+Ii5cYR
 tEGkAPRPvMUlzKclmEP8WMttaFq0cB4eS6JZSK7tHfRFuMg0T6fGtylGM
 cNLKH2/eHa/8X3ySKBgtKGpBJCVW6ksmkU1wsPaii6+H45vZ/ADkbdvhS
 e21swDnb361eS5iNW9d751DSTz/NaytANuSewVaB0SNQb2rBs2kLXdfud
 9ZX7wWcVGo9mxcN8r+c2BUTNKH0JNq2AS35xSklxpIsHHFjSprSFxFCxx
 VyXbhaKA24UqJ+wEXdb8b0wjxt/PrL0yGxJeC89lERQT03NnLodj1PiXK g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="340492552"
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="340492552"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 12:57:45 -0800
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="631271292"
Received: from grmundad-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.115.48])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 12:57:45 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 06/10] ASoC: SOF: amd: Move group register configuration to
 acp-loader
Date: Fri,  4 Mar 2022 14:57:29 -0600
Message-Id: <20220304205733.62233-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304205733.62233-1-pierre-louis.bossart@linux.intel.com>
References: <20220304205733.62233-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
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

From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>

We are using PTE_GRP1 for DMA operations to load firmware binaries
but we are enabling PTE_GRP and flushing ATU cache much before in
probe callbacks. This can cause issue if we try to load firmware
runtime during system resume as probe callback will not be invoked
hence PTE_GRP will not be enabled. Moreover it makes more sense to
flush the cache after register configuration.

Move PTE group register configuration to acp-loader within pre_fw_run
callback to avoid such issue.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/amd/acp-loader.c |  9 +++++++++
 sound/soc/sof/amd/acp.c        | 14 --------------
 2 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/sound/soc/sof/amd/acp-loader.c b/sound/soc/sof/amd/acp-loader.c
index 2dc15ae38155..7ca51e0f3b1b 100644
--- a/sound/soc/sof/amd/acp-loader.c
+++ b/sound/soc/sof/amd/acp-loader.c
@@ -127,6 +127,12 @@ static void configure_pte_for_fw_loading(int type, int num_pages, struct acp_dev
 		return;
 	}
 
+	/* Group Enable */
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACPAXI2AXI_ATU_BASE_ADDR_GRP_1,
+			  ACP_SRAM_PTE_OFFSET | BIT(31));
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACPAXI2AXI_ATU_PAGE_SIZE_GRP_1,
+			  PAGE_SIZE_4K_ENABLE);
+
 	for (page_idx = 0; page_idx < num_pages; page_idx++) {
 		low = lower_32_bits(addr);
 		high = upper_32_bits(addr);
@@ -136,6 +142,9 @@ static void configure_pte_for_fw_loading(int type, int num_pages, struct acp_dev
 		offset += 8;
 		addr += PAGE_SIZE;
 	}
+
+	/* Flush ATU Cache after PTE Update */
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACPAXI2AXI_ATU_CTRL, ACP_ATU_CACHE_INVALID);
 }
 
 /* pre fw run operations */
diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index ba8b6427b59f..66ca05545be2 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -36,19 +36,6 @@ static int smn_read(struct pci_dev *dev, u32 smn_addr, u32 *data)
 	return 0;
 }
 
-static void configure_acp_groupregisters(struct acp_dev_data *adata)
-{
-	struct snd_sof_dev *sdev = adata->dev;
-
-	/* Group Enable */
-	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACPAXI2AXI_ATU_BASE_ADDR_GRP_1,
-			  ACP_SRAM_PTE_OFFSET | BIT(31));
-	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACPAXI2AXI_ATU_PAGE_SIZE_GRP_1,
-			  PAGE_SIZE_4K_ENABLE);
-
-	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACPAXI2AXI_ATU_CTRL, ACP_ATU_CACHE_INVALID);
-}
-
 static void init_dma_descriptor(struct acp_dev_data *adata)
 {
 	struct snd_sof_dev *sdev = adata->dev;
@@ -264,7 +251,6 @@ static int acp_memory_init(struct snd_sof_dev *sdev)
 
 	snd_sof_dsp_update_bits(sdev, ACP_DSP_BAR, ACP_DSP_SW_INTR_CNTL,
 				ACP_DSP_INTR_EN_MASK, ACP_DSP_INTR_EN_MASK);
-	configure_acp_groupregisters(adata);
 	init_dma_descriptor(adata);
 
 	return 0;
-- 
2.30.2

