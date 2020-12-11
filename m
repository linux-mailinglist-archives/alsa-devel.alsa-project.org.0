Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0072D7391
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Dec 2020 11:13:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA19B1726;
	Fri, 11 Dec 2020 11:12:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA19B1726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607681587;
	bh=ej5vnF7IUYjFuh52FGXoHNOCVctJ5+gD7y3xPzQJtMA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mRJvn6mqre6SHCXSCoU97Ucy2Xi/GNbD8xN6opKR//Z3kEgcd8lbMYSR9Jbq59D41
	 5/x3wsMBfXVYyII+UYIKR8RyagCETvnWvctmnAJWud2wYloXsMlIFPIrTLISzYzqCV
	 vkNT4pH85C8tMuGjegmbtevNcwoQkACnz0qtT6LA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A909F804CB;
	Fri, 11 Dec 2020 11:10:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B59AFF804CA; Fri, 11 Dec 2020 11:10:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E92FF80240
 for <alsa-devel@alsa-project.org>; Fri, 11 Dec 2020 11:10:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E92FF80240
IronPort-SDR: ifXTeUAZzxATv6RQtkLTTpb9AZT6eHQvcmoVeodl6IXOccPpYMLpc27UN0ZSO8/Ge8d30e+01z
 GSNivcA0UufQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="174554256"
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="174554256"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2020 02:10:29 -0800
IronPort-SDR: LAPdIhfFZGNO6vy3TCBb1r7MKkrQuQkY1vx11zg4qbGBWM6qihS4qaI5SNpEec6Iwlb/naR50D
 2NrtgsmjjMhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="376450983"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga007.jf.intel.com with ESMTP; 11 Dec 2020 02:10:27 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 2/3] ASoC: SOF: modify the SOF_DBG flags
Date: Fri, 11 Dec 2020 12:07:42 +0200
Message-Id: <20201211100743.3188821-3-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201211100743.3188821-1-kai.vehmanen@linux.intel.com>
References: <20201211100743.3188821-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com, daniel.baluta@nxp.com,
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

The SOF_DBG_* macros are used for dual purposes right now, for the
sof_core_debug module parameter and for the dbg_dump() ops. So, separate
these two types of flags into different types to avoid confusion.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/debug.c            |  2 +-
 sound/soc/sof/intel/byt.c        |  2 +-
 sound/soc/sof/intel/hda-loader.c |  4 ++--
 sound/soc/sof/loader.c           |  4 ++--
 sound/soc/sof/ops.c              |  2 +-
 sound/soc/sof/sof-priv.h         | 11 ++++++-----
 6 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index 143117334ae5..30213a1beaaa 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -817,7 +817,7 @@ void snd_sof_handle_fw_exception(struct snd_sof_dev *sdev)
 	}
 
 	/* dump vital information to the logs */
-	snd_sof_dsp_dbg_dump(sdev, SOF_DBG_REGS | SOF_DBG_MBOX);
+	snd_sof_dsp_dbg_dump(sdev, SOF_DBG_DUMP_REGS | SOF_DBG_DUMP_MBOX);
 	snd_sof_ipc_dump(sdev);
 	snd_sof_trace_notify_for_error(sdev);
 }
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index 186736ee5fc2..19260dbecac5 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -336,7 +336,7 @@ static int byt_run(struct snd_sof_dev *sdev)
 	}
 	if (tries < 0) {
 		dev_err(sdev->dev, "error:  unable to run DSP firmware\n");
-		byt_dump(sdev, SOF_DBG_REGS | SOF_DBG_MBOX);
+		byt_dump(sdev, SOF_DBG_DUMP_REGS | SOF_DBG_DUMP_MBOX);
 		return -ENODEV;
 	}
 
diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index d8fb4e277c19..c4dcbe500635 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -175,7 +175,7 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag)
 			__func__);
 
 err:
-	hda_dsp_dump(sdev, SOF_DBG_REGS | SOF_DBG_PCI | SOF_DBG_MBOX);
+	hda_dsp_dump(sdev, SOF_DBG_DUMP_REGS | SOF_DBG_DUMP_PCI | SOF_DBG_DUMP_MBOX);
 	hda_dsp_core_reset_power_down(sdev, chip->host_managed_cores_mask);
 
 	return ret;
@@ -411,7 +411,7 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 	if (!ret) {
 		dev_dbg(sdev->dev, "Firmware download successful, booting...\n");
 	} else {
-		hda_dsp_dump(sdev, SOF_DBG_REGS | SOF_DBG_PCI | SOF_DBG_MBOX);
+		hda_dsp_dump(sdev, SOF_DBG_DUMP_REGS | SOF_DBG_DUMP_PCI | SOF_DBG_DUMP_MBOX);
 		dev_err(sdev->dev, "error: load fw failed ret: %d\n", ret);
 	}
 
diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index cbce484b6469..df39f477239a 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -856,8 +856,8 @@ int snd_sof_run_firmware(struct snd_sof_dev *sdev)
 				 msecs_to_jiffies(sdev->boot_timeout));
 	if (ret == 0) {
 		dev_err(sdev->dev, "error: firmware boot failure\n");
-		snd_sof_dsp_dbg_dump(sdev, SOF_DBG_REGS | SOF_DBG_MBOX |
-			SOF_DBG_TEXT | SOF_DBG_PCI);
+		snd_sof_dsp_dbg_dump(sdev, SOF_DBG_DUMP_REGS | SOF_DBG_DUMP_MBOX |
+			SOF_DBG_DUMP_TEXT | SOF_DBG_DUMP_PCI);
 		sdev->fw_state = SOF_FW_BOOT_FAILED;
 		return -EIO;
 	}
diff --git a/sound/soc/sof/ops.c b/sound/soc/sof/ops.c
index 1a394b4c6a2f..11ecebd07907 100644
--- a/sound/soc/sof/ops.c
+++ b/sound/soc/sof/ops.c
@@ -157,7 +157,7 @@ void snd_sof_dsp_panic(struct snd_sof_dev *sdev, u32 offset)
 		dev_dbg(sdev->dev, "panic: dsp_oops_offset %zu offset %d\n",
 			sdev->dsp_oops_offset, offset);
 
-	snd_sof_dsp_dbg_dump(sdev, SOF_DBG_REGS | SOF_DBG_MBOX);
+	snd_sof_dsp_dbg_dump(sdev, SOF_DBG_DUMP_REGS | SOF_DBG_DUMP_MBOX);
 	snd_sof_trace_notify_for_error(sdev);
 }
 EXPORT_SYMBOL(snd_sof_dsp_panic);
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 9ba3e3ceed01..ba317d3b8e53 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -22,11 +22,12 @@
 
 /* debug flags */
 #define SOF_DBG_ENABLE_TRACE	BIT(0)
-#define SOF_DBG_REGS		BIT(1)
-#define SOF_DBG_MBOX		BIT(2)
-#define SOF_DBG_TEXT		BIT(3)
-#define SOF_DBG_PCI		BIT(4)
-#define SOF_DBG_RETAIN_CTX	BIT(5)	/* prevent DSP D3 on FW exception */
+#define SOF_DBG_RETAIN_CTX	BIT(1)	/* prevent DSP D3 on FW exception */
+
+#define SOF_DBG_DUMP_REGS		BIT(0)
+#define SOF_DBG_DUMP_MBOX		BIT(1)
+#define SOF_DBG_DUMP_TEXT		BIT(2)
+#define SOF_DBG_DUMP_PCI		BIT(3)
 
 /* global debug state set by SOF_DBG_ flags */
 extern int sof_core_debug;
-- 
2.29.2

