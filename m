Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E3D545E20
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 10:05:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D20A31F19;
	Fri, 10 Jun 2022 10:04:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D20A31F19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654848299;
	bh=Y6njyXAkEzvCKA5OoWSOeJB4odNLPQ1pRVzOdGh04GE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q9QVYakFQH5lLZ8fPc3VwmrqxR6RP7j7UF7DYiRtaitb013TDBW2aBxEm2CnsdWgX
	 1sG1hXhqQNOqX5yAdiqDIY0Ut+wltmyNYGb5h4MPSWrnGbf8OmEzUZSCt6Iw/k7vlU
	 d5Ia75w5s6VGMtXZCg1/YsypYQ/7MytasgmI4wuo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58E42F804D8;
	Fri, 10 Jun 2022 10:04:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30F8AF804CF; Fri, 10 Jun 2022 10:03:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA56DF800C7
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 10:03:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA56DF800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IgcsBwxQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654848234; x=1686384234;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y6njyXAkEzvCKA5OoWSOeJB4odNLPQ1pRVzOdGh04GE=;
 b=IgcsBwxQwYOSuaUZzimqp/TZ9toR1ziSRQxbpFAf4yJlA8DozHG0zj9G
 ju9PaybbJa6rxs/mGOg3Ei4a+7H5XOsxWpnRCZ9/Erehfif3ze/dPBAEV
 Nt7UtxqxonjwSBIdvVcyfEOsKGY340MNXXQRwtEp14QYX1WOVlzChMYnk
 WhwT0uru9c2nN4+YKqLwSorUhMNBVDQguTbAneH0S/hpYtgdQU250er3K
 E4urFw0WNbwMTD28zqYzJhKi9AyuhOBpkTaiAudDcYJ392qZDzxWuWV/H
 edZL612LdnWX80foxNIxf2W+pxq637dl+kbfIsPHfGEwGFKR5KwQnQfNg A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="275082921"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="275082921"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 01:03:49 -0700
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="616383386"
Received: from nuribebu-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.215.108])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 01:03:45 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH] ASoC: SOF: debug: Clarify the IPC timeout handling path
Date: Fri, 10 Jun 2022 11:04:21 +0300
Message-Id: <20220610080421.31453-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, daniel.baluta@nxp.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yc.hung@mediatek.com
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

The dmesg log message of "Firmware exception" causes lots of confusion as
the snd_sof_handle_fw_exception() is only called in case of an IPC tx
timeout, where such a message does not make much sense.

To not limit the snd_sof_handle_fw_exception() handler to just one error
case, add a parameter to allow the caller to specify a meaningful message
to be printed.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Yaochun Hung <yc.hung@mediatek.com>
---
 sound/soc/sof/debug.c    | 5 ++---
 sound/soc/sof/ipc3.c     | 2 +-
 sound/soc/sof/sof-priv.h | 2 +-
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index cf1271eb29b2..c5d797e97c02 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -428,7 +428,7 @@ static void snd_sof_ipc_dump(struct snd_sof_dev *sdev)
 	}
 }
 
-void snd_sof_handle_fw_exception(struct snd_sof_dev *sdev)
+void snd_sof_handle_fw_exception(struct snd_sof_dev *sdev, const char *msg)
 {
 	if (IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_RETAIN_DSP_CONTEXT) ||
 	    sof_debug_check_flag(SOF_DBG_RETAIN_CTX)) {
@@ -441,8 +441,7 @@ void snd_sof_handle_fw_exception(struct snd_sof_dev *sdev)
 
 	/* dump vital information to the logs */
 	snd_sof_ipc_dump(sdev);
-	snd_sof_dsp_dbg_dump(sdev, "Firmware exception",
-			     SOF_DBG_DUMP_REGS | SOF_DBG_DUMP_MBOX);
+	snd_sof_dsp_dbg_dump(sdev, msg, SOF_DBG_DUMP_REGS | SOF_DBG_DUMP_MBOX);
 	sof_fw_trace_fw_crashed(sdev);
 }
 EXPORT_SYMBOL(snd_sof_handle_fw_exception);
diff --git a/sound/soc/sof/ipc3.c b/sound/soc/sof/ipc3.c
index dff5feaad370..ef8019e009b7 100644
--- a/sound/soc/sof/ipc3.c
+++ b/sound/soc/sof/ipc3.c
@@ -290,7 +290,7 @@ static int ipc3_wait_tx_done(struct snd_sof_ipc *ipc, void *reply_data)
 		dev_err(sdev->dev,
 			"ipc tx timed out for %#x (msg/reply size: %d/%zu)\n",
 			hdr->cmd, hdr->size, msg->reply_size);
-		snd_sof_handle_fw_exception(ipc->sdev);
+		snd_sof_handle_fw_exception(ipc->sdev, "IPC timeout");
 		ret = -ETIMEDOUT;
 	} else {
 		ret = msg->reply_error;
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 9d7f53ff9c70..32c152528f1d 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -655,7 +655,7 @@ void sof_print_oops_and_stack(struct snd_sof_dev *sdev, const char *level,
 			      u32 panic_code, u32 tracep_code, void *oops,
 			      struct sof_ipc_panic_info *panic_info,
 			      void *stack, size_t stack_words);
-void snd_sof_handle_fw_exception(struct snd_sof_dev *sdev);
+void snd_sof_handle_fw_exception(struct snd_sof_dev *sdev, const char *msg);
 int snd_sof_dbg_memory_info_init(struct snd_sof_dev *sdev);
 int snd_sof_debugfs_add_region_item_iomem(struct snd_sof_dev *sdev,
 		enum snd_sof_fw_blk_type blk_type, u32 offset, size_t size,
-- 
2.36.1

