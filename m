Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00116605FDB
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 14:14:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FCEFB947;
	Thu, 20 Oct 2022 14:13:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FCEFB947
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666268057;
	bh=1qbKHJJho+8U2DcJP4CjhSXlJ20v1KeVwZ9/XQgrRo8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QNZLwnfoyyWVLNiDQ6boNZHpoa2ZJUZSRjk+9XE5Yugp9mreq5+Qk4t4yPBihvgRY
	 q18yWp2GZdHK9PaI6/zeXk2+u+aTkZk6HQHBAnSutOB+aYYM6n05u8G3vdLtUafY1n
	 7Ui5zxy1cHXnlKSQnxrFiBVQl7SkY8Cqvh7SSRF4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 847A7F8055A;
	Thu, 20 Oct 2022 14:12:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2557EF80553; Thu, 20 Oct 2022 14:12:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6805EF800B5
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 14:12:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6805EF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="UFqAcw0O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666267947; x=1697803947;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1qbKHJJho+8U2DcJP4CjhSXlJ20v1KeVwZ9/XQgrRo8=;
 b=UFqAcw0OAdJTg9RJyZ3vi1L+uYob63WdWwSK1ClzyGtboOfp472nq1oB
 p3j5sIkmIdxI01nZXmTFRNiTppHEDh2S++0F8rKOla7e7twhwEeug3TEE
 XK8EeZE/LLqx6VTEymuimMA234mao5S+zc6unKMhC711E0aH9vjb9x/BZ
 R0R4m73W6+zvFSvpaTeufuFJIc1i9kgAd3lOHi62mqVMtK0+eVVoDO9Zu
 d+Td3OsEKYU4OKAvpbwm/EN2sewLkF4N82l63MbTr/wG1H7jf8HGaEVDP
 yHgPViJXiU/XeN1MiqZiAS2/n2DvvCvB+LGGyZBvbwZhgoCdyydtWuLDa Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="333256298"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="333256298"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 05:12:25 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="663009876"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="663009876"
Received: from awrynn-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.12.86])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 05:12:23 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2 03/19] ASoC: SOF: amd: Use the basefw firmware container
 directly
Date: Thu, 20 Oct 2022 15:12:22 +0300
Message-Id: <20221020121238.18339-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221020121238.18339-1-peter.ujfalusi@linux.intel.com>
References: <20221020121238.18339-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 chao.song@intel.com
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
2.38.1

