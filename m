Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F354CDEED
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 21:59:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A80311F61;
	Fri,  4 Mar 2022 21:58:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A80311F61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646427573;
	bh=HFP7acc4WMx4H8pGUYOMyQgh8OidJg3D9atKa+1UoLY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lxILZSdZy/z7wIYW1hRQ3ttlc8cNDslWbEH3Rg711Oh+wehORtpxS6rEy9o6w0uKW
	 3g7HcUR1pbRAZ2Y31tzzeSR8jFSxmS03h2LZIu56s46FXegq5OjTqB3W1LDAW8Tiqz
	 UWVQdBn4xd7h+6qpydl/ZH1qUi/byTXTRxckphrQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99891F8051C;
	Fri,  4 Mar 2022 21:57:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71CADF801EC; Fri,  4 Mar 2022 21:57:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36629F800F2
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 21:57:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36629F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="UcaHE3lZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646427468; x=1677963468;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HFP7acc4WMx4H8pGUYOMyQgh8OidJg3D9atKa+1UoLY=;
 b=UcaHE3lZRNxgI9HLQfCAwIFMahxbEMDN8ji2VdLRhMOa58UfuP5oF08A
 Ya9jzaY8kfhTk26POKXGE0i9wMKfHTJFl2OJpo8N33a+iq4cI8Kq4kokM
 bYjTEeoRivrdObycZ39Mm6xVWXWACjF5QohQeu8uV/xxwR16ae0PmcUQI
 IsGXgAXr348UExWwbmflNG5VBIeHkVZYZ8SAZel5QGOkK4ew9iVUzgkbb
 lhQ/DALaWlJ6IpqWPu3oEEXIgFfz/XlRclMIctIw+qiUeabSWgSg0Eyjb
 uw5OwBseJB6BDr/g/UMRtgz1pT6KGUddjH7NwwdUSfK3dz6NT+582A7V0 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="340492549"
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="340492549"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 12:57:43 -0800
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="631271287"
Received: from grmundad-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.115.48])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 12:57:42 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/10] ASoC: SOF: amd: Do not set ipc_pcm_params ops as it is
 optional
Date: Fri,  4 Mar 2022 14:57:26 -0600
Message-Id: <20220304205733.62233-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304205733.62233-1-pierre-louis.bossart@linux.intel.com>
References: <20220304205733.62233-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Daniel Baluta <daniel.baluta@nxp.com>
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

The ipc_pcm_params() ops implementation for AMD is a NOP and since the
callback is marked now as optional, it can be dropped along with the
empty function.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/amd/acp-ipc.c | 8 --------
 sound/soc/sof/amd/acp.h     | 2 --
 sound/soc/sof/amd/renoir.c  | 1 -
 3 files changed, 11 deletions(-)

diff --git a/sound/soc/sof/amd/acp-ipc.c b/sound/soc/sof/amd/acp-ipc.c
index e132223b4c66..cd5af3d85002 100644
--- a/sound/soc/sof/amd/acp-ipc.c
+++ b/sound/soc/sof/amd/acp-ipc.c
@@ -170,14 +170,6 @@ int acp_sof_ipc_msg_data(struct snd_sof_dev *sdev, struct snd_pcm_substream *sub
 }
 EXPORT_SYMBOL_NS(acp_sof_ipc_msg_data, SND_SOC_SOF_AMD_COMMON);
 
-int acp_sof_ipc_pcm_params(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream,
-			   const struct sof_ipc_pcm_params_reply *reply)
-{
-	/* TODO: Implement stream hw params to validate stream offset */
-	return 0;
-}
-EXPORT_SYMBOL_NS(acp_sof_ipc_pcm_params, SND_SOC_SOF_AMD_COMMON);
-
 int acp_sof_ipc_get_mailbox_offset(struct snd_sof_dev *sdev)
 {
 	return ACP_SCRATCH_MEMORY_ADDRESS;
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index 7ceb8bee0d8f..8ed4e338467f 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -185,8 +185,6 @@ int acp_sof_ipc_send_msg(struct snd_sof_dev *sdev,
 			 struct snd_sof_ipc_msg *msg);
 int acp_sof_ipc_get_mailbox_offset(struct snd_sof_dev *sdev);
 int acp_sof_ipc_get_window_offset(struct snd_sof_dev *sdev, u32 id);
-int acp_sof_ipc_pcm_params(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream,
-			   const struct sof_ipc_pcm_params_reply *reply);
 void acp_mailbox_write(struct snd_sof_dev *sdev, u32 offset, void *message, size_t bytes);
 void acp_mailbox_read(struct snd_sof_dev *sdev, u32 offset, void *message, size_t bytes);
 
diff --git a/sound/soc/sof/amd/renoir.c b/sound/soc/sof/amd/renoir.c
index c3ecb9e9d5ba..409fd57448b8 100644
--- a/sound/soc/sof/amd/renoir.c
+++ b/sound/soc/sof/amd/renoir.c
@@ -150,7 +150,6 @@ const struct snd_sof_dsp_ops sof_renoir_ops = {
 	/*IPC */
 	.send_msg		= acp_sof_ipc_send_msg,
 	.ipc_msg_data		= acp_sof_ipc_msg_data,
-	.ipc_pcm_params		= acp_sof_ipc_pcm_params,
 	.get_mailbox_offset	= acp_sof_ipc_get_mailbox_offset,
 	.irq_thread		= acp_sof_ipc_irq_thread,
 	.fw_ready		= sof_fw_ready,
-- 
2.30.2

