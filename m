Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEE6C3F42
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 20:02:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 722B41682;
	Tue,  1 Oct 2019 20:02:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 722B41682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569952979;
	bh=A6USRrCYv7synLGjX0w/1hW2OFCPwINAzLRPEaNnBpY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=a1C7d4ZAHJKmzIA6ySqWUeu11fbMCpxhC38z3nBlGvD9Z6XQsxWlgROBegt38I2mz
	 RkcFPIb7759WvaGHimLhUdJxzIkwfhf+9dVVrELSItbxyMKhwpO4flqI4fPzTb+Mes
	 /+fFAI2alNaN6C2mVqdIIO9AxukJwvzm/40o2ojQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4584F80677;
	Tue,  1 Oct 2019 19:57:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33E95F80676; Tue,  1 Oct 2019 19:56:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50601F80637
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 19:56:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50601F80637
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="G2+l4MY0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=DEfXYrKjS6J2FIDss+6rZUiZXHq1vTtLYaASeO4Exsw=; b=G2+l4MY0L2Vv
 9guPutQG3Og6+sMU0gKjlMjJIexVH3WqkK0ow+6mMpEJu1OjxZ1wVrwHAv5EzcWVZ63L6XfjyBddT
 mIqgDQ3qqONY7IC2x2FKCF53puBJwb58cLqfFIvIdPl5bHK3/jP6lVMQJ79yh5uGW902Nwe5OlxT7
 YMGko=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iFMOF-0005sc-7u; Tue, 01 Oct 2019 17:56:47 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id BDBAE2742A10; Tue,  1 Oct 2019 18:56:46 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>
In-Reply-To: <20190927200538.660-5-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191001175646.BDBAE2742A10@ypsilon.sirena.org.uk>
Date: Tue,  1 Oct 2019 18:56:46 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: ipc: retain DSP context after FW
	exception." to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: SOF: ipc: retain DSP context after FW exception.

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 9a06508bf7824ba34f2e1e9e08df505ac14a44c2 Mon Sep 17 00:00:00 2001
From: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Date: Fri, 27 Sep 2019 15:05:29 -0500
Subject: [PATCH] ASoC: SOF: ipc: retain DSP context after FW exception.

Add config option to prevent DSP entering D3 after any FW exception.
This can then be used to dump FW context for debug.

Signed-off-by: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190927200538.660-5-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
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
