Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65873546F69
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 23:47:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CB6F1F0F;
	Fri, 10 Jun 2022 23:46:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CB6F1F0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654897646;
	bh=TqcR+TXL8N6vbmztyhpZfaY2CkzoGC7lK0D+fm1J0VU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pgh/4Z2V5vLNgkZ/e3FFFIrHnlKf5qG2OFySUqvhPskjsMWapD0wzgbKz15/oDMLt
	 C2xzaB0hD+nBTk2bRTq6vAzqnQkRcc+5aoWNR23Lny3MOHqTk2mF6bbKJIafkRD1Ee
	 QO80CPrga1IxrZt3kIUOQbJaeKZsvJNPg+saP5uI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89B60F800DF;
	Fri, 10 Jun 2022 23:46:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BD7DF804D2; Fri, 10 Jun 2022 23:46:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00FB6F804CF
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 23:46:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00FB6F804CF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Y5uW5PTd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654897579; x=1686433579;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TqcR+TXL8N6vbmztyhpZfaY2CkzoGC7lK0D+fm1J0VU=;
 b=Y5uW5PTdeBUuc8x/PHVUiPTJzGFIoqI2JYgseWUzvZFh4ADEXzm/f0iS
 2kCoOXXZX4xNumsEOPcGX9FrRexCO8mkH04e3BUJ5SVuwoTw0sjNRKnT4
 8oe+0kneqNkXY+vc8dwOplnWXKkuz6rqi88f58N6q+Z7sWNlmX0soYOGD
 lU3wvOKRPARjYl8HAiIdf/AYTYba4mc5dssO3wFGKYdRk496ZFMjVDmaT
 iWdG83p9aT+nugBK48xsTYmDBi/UVf0DuMw1PFTQwBv2TuwHBKpq6syhh
 gerdOXtzeqH19yD0hDcu8kq0KJmJo1Ld/DFV6yPzv0tKWYyd0axH2VuZX w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="341812893"
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; d="scan'208";a="341812893"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 14:46:13 -0700
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; d="scan'208";a="828457150"
Received: from andrewri-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.126.97])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 14:46:12 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF: reduce default verbosity of IPC logs
Date: Fri, 10 Jun 2022 16:46:01 -0500
Message-Id: <20220610214601.43005-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

We currently log the initiation of an IPC as well at its success.

[ 3906.106987] kernel: sof-audio-pci-intel-tgl 0000:00:1f.3: ipc tx: 0x80010000: GLB_DAI_MSG: CONFIG
[ 3906.107189] kernel: sof-audio-pci-intel-tgl 0000:00:1f.3: ipc tx succeeded: 0x80010000: GLB_DAI_MSG: CONFIG

This is overkill in most cases, we already have a message thrown in
case of errors and have tracepoints enabled to check for IPC
duration. The only case where this might be useful is to check if
there is an interleaved IPC RX. Add a flag and only print those logs
if enabled.

In addition, the DMA_POSITION_UPDATE for traces brings limited
information in most cases and pollutes the logs for no good reason.

[ 3906.322256] kernel: sof-audio-pci-intel-tgl 0000:00:1f.3: ipc rx: 0x90020000: GLB_TRACE_MSG: DMA_POSITION
[ 3906.322308] kernel: sof-audio-pci-intel-tgl 0000:00:1f.3: ipc rx done: 0x90020000: GLB_TRACE_MSG: DMA_POSITION
[ 3906.822261] kernel: sof-audio-pci-intel-tgl 0000:00:1f.3: ipc rx: 0x90020000: GLB_TRACE_MSG: DMA_POSITION
[ 3906.822319] kernel: sof-audio-pci-intel-tgl 0000:00:1f.3: ipc rx done: 0x90020000: GLB_TRACE_MSG: DMA_POSITION
[ 3907.822261] kernel: sof-audio-pci-intel-tgl 0000:00:1f.3: ipc rx: 0x90020000: GLB_TRACE_MSG: DMA_POSITION
[ 3907.822319] kernel: sof-audio-pci-intel-tgl 0000:00:1f.3: ipc rx done: 0x90020000: GLB_TRACE_MSG: DMA_POSITION
[ 3908.822251] kernel: sof-audio-pci-intel-tgl 0000:00:1f.3: ipc rx: 0x90020000: GLB_TRACE_MSG: DMA_POSITION
[ 3908.822309] kernel: sof-audio-pci-intel-tgl 0000:00:1f.3: ipc rx done: 0x90020000: GLB_TRACE_MSG: DMA_POSITION

This information is only helpful when debugging the trace support, not
when using the trace. Add a flag to only print DMA position update
logs if enabled.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc3.c     | 5 ++++-
 sound/soc/sof/sof-priv.h | 6 ++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc3.c b/sound/soc/sof/ipc3.c
index dff5feaad3703..7608a3b0aeb21 100644
--- a/sound/soc/sof/ipc3.c
+++ b/sound/soc/sof/ipc3.c
@@ -147,6 +147,8 @@ static void ipc3_log_header(struct device *dev, u8 *text, u32 cmd)
 		case SOF_IPC_TRACE_DMA_PARAMS:
 			str2 = "DMA_PARAMS"; break;
 		case SOF_IPC_TRACE_DMA_POSITION:
+			if (!sof_debug_check_flag(SOF_DBG_PRINT_DMA_POSITION_UPDATE_LOGS))
+				return;
 			str2 = "DMA_POSITION"; break;
 		case SOF_IPC_TRACE_DMA_PARAMS_EXT:
 			str2 = "DMA_PARAMS_EXT"; break;
@@ -299,7 +301,8 @@ static int ipc3_wait_tx_done(struct snd_sof_ipc *ipc, void *reply_data)
 				"ipc tx error for %#x (msg/reply size: %d/%zu): %d\n",
 				hdr->cmd, hdr->size, msg->reply_size, ret);
 		} else {
-			ipc3_log_header(sdev->dev, "ipc tx succeeded", hdr->cmd);
+			if (sof_debug_check_flag(SOF_DBG_PRINT_IPC_SUCCESS_LOGS))
+				ipc3_log_header(sdev->dev, "ipc tx succeeded", hdr->cmd);
 			if (msg->reply_size)
 				/* copy the data returned from DSP */
 				memcpy(reply_data, msg->reply_data,
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 9d7f53ff9c70e..afbb37ec841ea 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -37,6 +37,12 @@
 #define SOF_DBG_IGNORE_D3_PERSISTENT		BIT(7) /* ignore the DSP D3 persistent capability
 							* and always download firmware upon D3 exit
 							*/
+#define SOF_DBG_PRINT_DMA_POSITION_UPDATE_LOGS	BIT(8) /* print DMA position updates
+							* in dmesg logs
+							*/
+#define SOF_DBG_PRINT_IPC_SUCCESS_LOGS		BIT(9) /* print IPC success
+							* in dmesg logs
+							*/
 
 /* Flag definitions used for controlling the DSP dump behavior */
 #define SOF_DBG_DUMP_REGS		BIT(0)
-- 
2.34.1

