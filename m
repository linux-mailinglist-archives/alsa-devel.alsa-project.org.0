Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7865B36A0
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 13:46:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBD6D16A0;
	Fri,  9 Sep 2022 13:45:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBD6D16A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662723967;
	bh=70bFugLDqqluSHsKMcU5B2AX6oUgUJLS2J/d5Dxhhgc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pCc8MIGzVhvANUZNgL/9VoLuzLwdeswuYO8ErybgpBxFMSdGsQcWPQVEvfmzrKk0Z
	 +uZ/++yFrtUhBAgBF1tfP6ntsLwDf12p8xVm77DEzo6+Er3pPDRnjMmkRwRUojKDvN
	 gEtiAfZuFHipOWLBv7dNRyet0nxJeccVllMKZJUM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E4EAF80552;
	Fri,  9 Sep 2022 13:43:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E3A3F80537; Fri,  9 Sep 2022 13:43:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3C4AF8011C
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 13:43:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3C4AF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="cGb05KQl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662723825; x=1694259825;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=70bFugLDqqluSHsKMcU5B2AX6oUgUJLS2J/d5Dxhhgc=;
 b=cGb05KQlgf+Fu3ZZztZb5hSH8LffgGr2I3bhg5F5cApVuI2bGrMbh5Uy
 IN7RGxOUxFGmmprhe9PVTyV9rVxCzLvir/qJ4iSNFcj29eEFcD79i3fBF
 mjYn3Xt0wFey5BjsCFXle20hTdN8u8tKHt2oUtlMOD6zs0OMNaTWxU92x
 4xUxSidrQlzfP/O+mbujoacmaFEf5uD+3Guy9yze8UPSjVxUs1yD0Kkx8
 5VA2hyGWCeaq1goVWSO2/jXbk5TW6HSIaGNdBQJQsu9xBaMYfkdEir2cK
 4SDbXvFPFgZzwL4l/9cGevyeHW5rj3YfqBmSCk4utysosqMZ58RMXPU5e g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="359180101"
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="359180101"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 04:43:40 -0700
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="683613870"
Received: from desharpe-mobl1.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.0.89])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 04:43:38 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 4/7] ASoC: SOF: ipc4: Configure the debug box offset
Date: Fri,  9 Sep 2022 14:43:29 +0300
Message-Id: <20220909114332.31393-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220909114332.31393-1-peter.ujfalusi@linux.intel.com>
References: <20220909114332.31393-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, rander.wang@intel.com
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

The debug window for IPC4 compatible firmware is always window #2,
set the debug_box.offset accordingly.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-priv.h | 1 +
 sound/soc/sof/ipc4.c      | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/sound/soc/sof/ipc4-priv.h b/sound/soc/sof/ipc4-priv.h
index f3dbcc2e6331..4599dd95f17d 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -15,6 +15,7 @@
 
 /* The DSP window indices are fixed */
 #define SOF_IPC4_OUTBOX_WINDOW_IDX	1
+#define SOF_IPC4_DEBUG_WINDOW_IDX	2
 
 /**
  * struct sof_ipc4_fw_data - IPC4-specific data
diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index 58aa054663bf..4f7ec18ae7fa 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -545,10 +545,14 @@ static int ipc4_fw_ready(struct snd_sof_dev *sdev, struct sof_ipc4_msg *ipc4_msg
 	sdev->host_box.offset = outbox_offset;
 	sdev->host_box.size = outbox_size;
 
+	sdev->debug_box.offset = snd_sof_dsp_get_window_offset(sdev,
+							SOF_IPC4_DEBUG_WINDOW_IDX);
+
 	dev_dbg(sdev->dev, "mailbox upstream 0x%x - size 0x%x\n",
 		inbox_offset, inbox_size);
 	dev_dbg(sdev->dev, "mailbox downstream 0x%x - size 0x%x\n",
 		outbox_offset, outbox_size);
+	dev_dbg(sdev->dev, "debug box 0x%x\n", sdev->debug_box.offset);
 
 	return sof_ipc4_init_msg_memory(sdev);
 }
-- 
2.37.3

