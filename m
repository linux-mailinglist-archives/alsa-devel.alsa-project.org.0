Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 727A6602B53
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 14:10:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14FED9CA8;
	Tue, 18 Oct 2022 14:09:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14FED9CA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666095049;
	bh=+XpfkU+pI4/yK4ldqTjCWxPXlBniY1z8egEUiNnHfco=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hCbbQrANZ3GpiHPdoeYB+zm/XE0CN6Ua5q/+D2PNPgvd3L99GOuiMfsralYYuh3mu
	 ZfHfLkZx3owb8Nvhwqz38eDFdUm94KC4JqYUIXFMMnSh3DZhlpYBLbcKxLEPIjcrrO
	 /SF9p886XBAhuO8lrmyRIFDa7sdMW0b+CXzNiW9Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34C0DF80542;
	Tue, 18 Oct 2022 14:09:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A296F80542; Tue, 18 Oct 2022 14:09:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DC9AF804BD
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 14:09:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DC9AF804BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="SHzEeKAV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666094944; x=1697630944;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+XpfkU+pI4/yK4ldqTjCWxPXlBniY1z8egEUiNnHfco=;
 b=SHzEeKAV2rQdoxDJ3xa1nvJQqfm93i4AlgINUECUKHOwJOfzNCBI2rbz
 UIM8vOPNvVOMALZA/Tajn7ggD3E7VPzYlGGf0jOKyPrAM/xgXUY3hd+cL
 bXM1dHikE/q/AnjNlDsDI9YxwdJ1vu2e99V01tL10nnX1icAgq+68jaQx
 KrUdBsaVmRuKuETH0YnDQel3vIMVZxRUk+49lekddx54ZayNGd5T8gcoZ
 KcXAdshSYpPTPOBg5CdJKCIB9ViatvV5ugCp5gph1YhVbzYG71Q9P4jQP
 D2UxXk/xix1uUpRSXp9ulgOsU/R97tTzDNx4T1slNKxOMelAsawrosq4C w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="303697466"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="303697466"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:09:02 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="579757822"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="579757822"
Received: from mariaca1-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.27.127])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:09:00 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 03/19] ASoC: SOF: amd: Use the basefw firmware container
 directly
Date: Tue, 18 Oct 2022 15:09:00 +0300
Message-Id: <20221018120916.19820-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221018120916.19820-1-peter.ujfalusi@linux.intel.com>
References: <20221018120916.19820-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: chao.song@intel.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

Switch to access to the firmware struct via sdev->basefw container to
unblock the removal of the firmware information from plat_data.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/amd/acp-loader.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/amd/acp-loader.c b/sound/soc/sof/amd/acp-loader.c
index d1e74baf5d8b..090c8b18c83c 100644
--- a/sound/soc/sof/amd/acp-loader.c
+++ b/sound/soc/sof/amd/acp-loader.c
@@ -48,7 +48,6 @@ EXPORT_SYMBOL_NS(acp_dsp_block_read, SND_SOC_SOF_AMD_COMMON);
 int acp_dsp_block_write(struct snd_sof_dev *sdev, enum snd_sof_fw_blk_type blk_type,
 			u32 offset, void *src, size_t size)
 {
-	struct snd_sof_pdata *plat_data = sdev->pdata;
 	struct pci_dev *pci = to_pci_dev(sdev->dev);
 	const struct sof_amd_acp_desc *desc = get_chip_info(sdev->pdata);
 	struct acp_dev_data *adata;
@@ -61,7 +60,7 @@ int acp_dsp_block_write(struct snd_sof_dev *sdev, enum snd_sof_fw_blk_type blk_t
 	switch (blk_type) {
 	case SOF_FW_BLK_TYPE_IRAM:
 		if (!adata->bin_buf) {
-			size_fw = plat_data->fw->size;
+			size_fw = sdev->basefw.fw->size;
 			page_count = PAGE_ALIGN(size_fw) >> PAGE_SHIFT;
 			dma_size = page_count * ACP_PAGE_SIZE;
 			adata->bin_buf = dma_alloc_coherent(&pci->dev, dma_size,
@@ -152,7 +151,6 @@ static void configure_pte_for_fw_loading(int type, int num_pages, struct acp_dev
 int acp_dsp_pre_fw_run(struct snd_sof_dev *sdev)
 {
 	struct pci_dev *pci = to_pci_dev(sdev->dev);
-	struct snd_sof_pdata *plat_data = sdev->pdata;
 	struct acp_dev_data *adata;
 	unsigned int src_addr, size_fw;
 	u32 page_count, dma_size;
@@ -186,7 +184,7 @@ int acp_dsp_pre_fw_run(struct snd_sof_dev *sdev)
 		dev_err(sdev->dev, "acp dma transfer status: %d\n", ret);
 
 	/* Free memory once DMA is complete */
-	dma_size =  (PAGE_ALIGN(plat_data->fw->size) >> PAGE_SHIFT) * ACP_PAGE_SIZE;
+	dma_size =  (PAGE_ALIGN(sdev->basefw.fw->size) >> PAGE_SHIFT) * ACP_PAGE_SIZE;
 	dma_free_coherent(&pci->dev, dma_size, adata->bin_buf, adata->sha_dma_addr);
 	dma_free_coherent(&pci->dev, ACP_DEFAULT_DRAM_LENGTH, adata->data_buf, adata->dma_addr);
 	adata->bin_buf = NULL;
-- 
2.38.0

