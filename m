Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 925D550EB7B
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 00:13:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34F89188A;
	Tue, 26 Apr 2022 00:12:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34F89188A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650924814;
	bh=EpSDWoXi+9cVbtEpSesimP/aZc/C+Nvv/BNAdGHG3Zk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jjC0blrewGvwGb7XrYcHw7ipGjyvn3m5kS4rKpnSjyNK00Rgxs8xUv80cctugJoRF
	 +RRWCeMEBxXmuGdCq56CMv1YI4j/SXIc91rmGRW/xfry2MrPidhVYrp1hgubNXvV32
	 FCN2Xr12pGajwfh3tq7rza9W2QeLnh1cx3xezR8A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 561CDF804FD;
	Tue, 26 Apr 2022 00:11:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 766A9F804FD; Tue, 26 Apr 2022 00:11:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40D2AF8016A
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 00:11:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40D2AF8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Z9OlhB57"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650924706; x=1682460706;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EpSDWoXi+9cVbtEpSesimP/aZc/C+Nvv/BNAdGHG3Zk=;
 b=Z9OlhB57smWc8VmGxgnjWQJIEBz1rYaqR3mcphDSxMNxcqWDZYMcUSNt
 8CWuRYE3wFDmBrc9FIPh6xtdMsqWHNuHsYxRR1hLW4fe7BHradn0Mr4cD
 /NJSx1bWfLtB77gvfSDEnsuF1sLQlh++8DD0Ce5S2pQzRtHCANfeFnptd
 19fiIW0fHZlWGM5jc6thvoIPSVzY9g09Iw5OsteGJkPy5uiAFdeC7HvbK
 mrfnCDOSVFCkuBlid6Uso6tEmVFE/ehjgfrh4vaH7ouxd/D7DzxjPUVzx
 MJw7JeAcktdEonAKPcX+l8I03PHKgCVec4inI/r8Geq7LjWuXPMzpbZ2Z g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="264897781"
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; d="scan'208";a="264897781"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 15:11:39 -0700
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; d="scan'208";a="729939953"
Received: from shivakax-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.59.189])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 15:11:39 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/10] ASoC: SOF: loader: Remove snd_sof_parse_module_memcpy()
 as it is not used
Date: Mon, 25 Apr 2022 15:11:28 -0700
Message-Id: <20220425221129.124615-10-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220425221129.124615-1-ranjani.sridharan@linux.intel.com>
References: <20220425221129.124615-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, tiwai@suse.com,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

The snd_sof_parse_module_memcpy() is no longer used and we have the
implementation of it in ipc3-loader.c which is a default mode to load
module(s) with IPC3 if the snd_sof_load_firmware_memcpy() is used for
loading the firmware.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/loader.c   | 85 ----------------------------------------
 sound/soc/sof/sof-priv.h |  2 -
 2 files changed, 87 deletions(-)

diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index 478c3a22dfca..8672dcc9cc1e 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -11,94 +11,9 @@
 //
 
 #include <linux/firmware.h>
-#include <sound/sof.h>
-#include <sound/sof/ext_manifest.h>
 #include "sof-priv.h"
 #include "ops.h"
 
-/* generic module parser for mmaped DSPs */
-int snd_sof_parse_module_memcpy(struct snd_sof_dev *sdev,
-				struct snd_sof_mod_hdr *module)
-{
-	struct snd_sof_blk_hdr *block;
-	int count, ret;
-	u32 offset;
-	size_t remaining;
-
-	dev_dbg(sdev->dev, "new module size 0x%x blocks 0x%x type 0x%x\n",
-		module->size, module->num_blocks, module->type);
-
-	block = (struct snd_sof_blk_hdr *)((u8 *)module + sizeof(*module));
-
-	/* module->size doesn't include header size */
-	remaining = module->size;
-	for (count = 0; count < module->num_blocks; count++) {
-		/* check for wrap */
-		if (remaining < sizeof(*block)) {
-			dev_err(sdev->dev, "error: not enough data remaining\n");
-			return -EINVAL;
-		}
-
-		/* minus header size of block */
-		remaining -= sizeof(*block);
-
-		if (block->size == 0) {
-			dev_warn(sdev->dev,
-				 "warning: block %d size zero\n", count);
-			dev_warn(sdev->dev, " type 0x%x offset 0x%x\n",
-				 block->type, block->offset);
-			continue;
-		}
-
-		switch (block->type) {
-		case SOF_FW_BLK_TYPE_RSRVD0:
-		case SOF_FW_BLK_TYPE_ROM...SOF_FW_BLK_TYPE_RSRVD14:
-			continue;	/* not handled atm */
-		case SOF_FW_BLK_TYPE_IRAM:
-		case SOF_FW_BLK_TYPE_DRAM:
-		case SOF_FW_BLK_TYPE_SRAM:
-			offset = block->offset;
-			break;
-		default:
-			dev_err(sdev->dev, "error: bad type 0x%x for block 0x%x\n",
-				block->type, count);
-			return -EINVAL;
-		}
-
-		dev_dbg(sdev->dev,
-			"block %d type 0x%x size 0x%x ==>  offset 0x%x\n",
-			count, block->type, block->size, offset);
-
-		/* checking block->size to avoid unaligned access */
-		if (block->size % sizeof(u32)) {
-			dev_err(sdev->dev, "error: invalid block size 0x%x\n",
-				block->size);
-			return -EINVAL;
-		}
-		ret = snd_sof_dsp_block_write(sdev, block->type, offset,
-					      block + 1, block->size);
-		if (ret < 0) {
-			dev_err(sdev->dev, "error: write to block type 0x%x failed\n",
-				block->type);
-			return ret;
-		}
-
-		if (remaining < block->size) {
-			dev_err(sdev->dev, "error: not enough data remaining\n");
-			return -EINVAL;
-		}
-
-		/* minus body size of block */
-		remaining -= block->size;
-		/* next block */
-		block = (struct snd_sof_blk_hdr *)((u8 *)block + sizeof(*block)
-			+ block->size);
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL(snd_sof_parse_module_memcpy);
-
 int snd_sof_load_firmware_raw(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_pdata *plat_data = sdev->pdata;
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 38cdca6a10fd..a1141ea8d907 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -608,8 +608,6 @@ extern struct snd_compress_ops sof_compressed_ops;
 int snd_sof_load_firmware_raw(struct snd_sof_dev *sdev);
 int snd_sof_load_firmware_memcpy(struct snd_sof_dev *sdev);
 int snd_sof_run_firmware(struct snd_sof_dev *sdev);
-int snd_sof_parse_module_memcpy(struct snd_sof_dev *sdev,
-				struct snd_sof_mod_hdr *module);
 void snd_sof_fw_unload(struct snd_sof_dev *sdev);
 
 /*
-- 
2.25.1

