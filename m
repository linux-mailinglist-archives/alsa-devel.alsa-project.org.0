Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4179DC0C69
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Sep 2019 22:11:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE17D1677;
	Fri, 27 Sep 2019 22:10:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE17D1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569615066;
	bh=e+xHwBesdKFU+8Knud/oGUEu0w3WufbTrI64CJENvEo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZVIusXga29I3prTu/ehHmIoO8On7ETTEKwlHwAtpZ/3Kqnyt/F+hqlsLqYhex/Ccy
	 CdpLqhkb78cHN3RIqn2XbHQEM3ggzkYmNHmNlgDqZeBbQdadQSK6VkHAHN1vKUUPHo
	 /csE/ibCg7SqqJ5/M8EhjVWV8wcutCDNOWelop+4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B689AF80636;
	Fri, 27 Sep 2019 22:06:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B7B4F8060E; Fri, 27 Sep 2019 22:06:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89FE6F800B3
 for <alsa-devel@alsa-project.org>; Fri, 27 Sep 2019 22:06:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89FE6F800B3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Sep 2019 13:05:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,556,1559545200"; d="scan'208";a="190444255"
Received: from wcui-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.251.146.136])
 by fmsmga007.fm.intel.com with ESMTP; 27 Sep 2019 13:05:46 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 27 Sep 2019 15:05:29 -0500
Message-Id: <20190927200538.660-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190927200538.660-1-pierre-louis.bossart@linux.intel.com>
References: <20190927200538.660-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 04/13] ASoC: SOF: ipc: retain DSP context after
	FW exception.
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

From: Liam Girdwood <liam.r.girdwood@linux.intel.com>

Add config option to prevent DSP entering D3 after any FW exception.
This can then be used to dump FW context for debug.

Signed-off-by: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/Kconfig    |  8 ++++++++
 sound/soc/sof/debug.c    | 16 ++++++++++++++++
 sound/soc/sof/ipc.c      |  4 +---
 sound/soc/sof/sof-priv.h |  2 ++
 4 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index cc592bcadae7..56a3ab66b46b 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -158,6 +158,14 @@ config SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST
 	  Say Y if you want to enable IPC flood test.
 	  If unsure, select "N".
 
+config SND_SOC_SOF_DEBUG_RETAIN_DSP_CONTEXT
+	bool "SOF retain DSP context on any FW exceptions"
+	help
+	  This option keeps the DSP in D0 state so that firmware debug
+	  information can be retained and dumped to userspace.
+	  Say Y if you want to retain DSP context for FW exceptions.
+	  If unsure, select "N".
+
 endif ## SND_SOC_SOF_DEBUG
 
 endif ## SND_SOC_SOF_OPTIONS
diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index 54cd431faab7..b8a4e899154c 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -461,3 +461,19 @@ void snd_sof_free_debug(struct snd_sof_dev *sdev)
 	debugfs_remove_recursive(sdev->debugfs_root);
 }
 EXPORT_SYMBOL_GPL(snd_sof_free_debug);
+
+void snd_sof_handle_fw_exception(struct snd_sof_dev *sdev)
+{
+	if (IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_RETAIN_DSP_CONTEXT) ||
+	    (sof_core_debug & SOF_DBG_RETAIN_CTX)) {
+		/* should we prevent DSP entering D3 ? */
+		dev_info(sdev->dev, "info: preventing DSP entering D3 state to preserve context\n");
+		pm_runtime_get_noresume(sdev->dev);
+	}
+
+	/* dump vital information to the logs */
+	snd_sof_dsp_dbg_dump(sdev, SOF_DBG_REGS | SOF_DBG_MBOX);
+	snd_sof_ipc_dump(sdev);
+	snd_sof_trace_notify_for_error(sdev);
+}
+EXPORT_SYMBOL(snd_sof_handle_fw_exception);
diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index b2f359d2f7e5..b946c81197a1 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -210,9 +210,7 @@ static int tx_wait_done(struct snd_sof_ipc *ipc, struct snd_sof_ipc_msg *msg,
 	if (ret == 0) {
 		dev_err(sdev->dev, "error: ipc timed out for 0x%x size %d\n",
 			hdr->cmd, hdr->size);
-		snd_sof_dsp_dbg_dump(ipc->sdev, SOF_DBG_REGS | SOF_DBG_MBOX);
-		snd_sof_ipc_dump(ipc->sdev);
-		snd_sof_trace_notify_for_error(ipc->sdev);
+		snd_sof_handle_fw_exception(ipc->sdev);
 		ret = -ETIMEDOUT;
 	} else {
 		/* copy the data returned from DSP */
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index d5b1a4f895da..348759035dd0 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -33,6 +33,7 @@
 #define SOF_DBG_MBOX		BIT(2)
 #define SOF_DBG_TEXT		BIT(3)
 #define SOF_DBG_PCI		BIT(4)
+#define SOF_DBG_RETAIN_CTX	BIT(5)	/* prevent DSP D3 on FW exception */
 
 /* global debug state set by SOF_DBG_ flags */
 extern int sof_core_debug;
@@ -580,6 +581,7 @@ void snd_sof_get_status(struct snd_sof_dev *sdev, u32 panic_code,
 			struct sof_ipc_panic_info *panic_info,
 			void *stack, size_t stack_words);
 int snd_sof_init_trace_ipc(struct snd_sof_dev *sdev);
+void snd_sof_handle_fw_exception(struct snd_sof_dev *sdev);
 
 /*
  * Platform specific ops.
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
