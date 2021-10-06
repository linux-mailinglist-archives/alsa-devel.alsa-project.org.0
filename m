Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA8E423C22
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 13:10:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DDBE166A;
	Wed,  6 Oct 2021 13:09:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DDBE166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633518642;
	bh=abnA10flOCVWTSU8y5K7bW20YXteqF3aGutBNEnKPzU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PT4Dt1I/kka6PeaeQ+glj71+UTQpM+pqR2Hyjut7z+xPKpllCJhD0bItabeiWeSCi
	 1PmlRFP7m+q4vbcru3b/Mr7bYXCn1wLAlo9FbSBhDXkiPNQle4DOrFIjFj0MTW2Uz+
	 Kx8lmnTUzUWKn6/bVyDWgxaJaNbiH13WPuJn27co=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEA2BF8051D;
	Wed,  6 Oct 2021 13:07:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C26FF8051E; Wed,  6 Oct 2021 13:07:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CAE6F804EC
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 13:07:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CAE6F804EC
X-IronPort-AV: E=McAfee;i="6200,9189,10128"; a="223366461"
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="223366461"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 04:07:05 -0700
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="439081113"
Received: from byurovit-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.39.239])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 04:07:03 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 10/19] ASoC: SOF: Drop SOF_DBG_DUMP_FORCE_ERR_LEVEL and
 sof_dev_dbg_or_err
Date: Wed,  6 Oct 2021 14:06:36 +0300
Message-Id: <20211006110645.26679-11-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006110645.26679-1-peter.ujfalusi@linux.intel.com>
References: <20211006110645.26679-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

The sof_dev_dbg_or_err() is only used by intel/hda.c when dumping dsp
debug information.
It was used to print the extended rom status in either dev_dbg (during
retries) and finally with dev_err, but other lines were printed with
dev_err regardless.

Since we now only print the dump once, the flag and the macros is no longer
needed.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 11 +++--------
 sound/soc/sof/intel/hda.c        |  3 +--
 sound/soc/sof/loader.c           |  4 ++--
 sound/soc/sof/sof-priv.h         | 12 +-----------
 4 files changed, 7 insertions(+), 23 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index d2be02dc2801..10b37e8ad30b 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -180,14 +180,9 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag)
 	flags = SOF_DBG_DUMP_REGS | SOF_DBG_DUMP_PCI | SOF_DBG_DUMP_MBOX |
 		SOF_DBG_DUMP_OPTIONAL;
 
-	/*
-	 * after max boot attempts make sure that the dump is printed and error
-	 * log level is used
-	 */
-	if (hda->boot_iteration == HDA_FW_BOOT_ATTEMPTS) {
-		flags |= SOF_DBG_DUMP_FORCE_ERR_LEVEL;
+	/* after max boot attempts make sure that the dump is printed */
+	if (hda->boot_iteration == HDA_FW_BOOT_ATTEMPTS)
 		flags &= ~SOF_DBG_DUMP_OPTIONAL;
-	}
 
 	snd_sof_dsp_dbg_dump(sdev, flags);
 	snd_sof_dsp_core_power_down(sdev, chip->host_managed_cores_mask);
@@ -421,7 +416,7 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 		dev_dbg(sdev->dev, "Firmware download successful, booting...\n");
 	} else {
 		snd_sof_dsp_dbg_dump(sdev, SOF_DBG_DUMP_REGS | SOF_DBG_DUMP_PCI |
-				     SOF_DBG_DUMP_MBOX | SOF_DBG_DUMP_FORCE_ERR_LEVEL);
+				     SOF_DBG_DUMP_MBOX);
 		dev_err(sdev->dev, "error: load fw failed ret: %d\n", ret);
 	}
 
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 1463f3de01bc..c4dcab10e64b 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -532,8 +532,7 @@ static void hda_dsp_dump_ext_rom_status(struct snd_sof_dev *sdev, u32 flags)
 		len += snprintf(msg + len, sizeof(msg) - len, " 0x%x", value);
 	}
 
-	sof_dev_dbg_or_err(sdev->dev, flags & SOF_DBG_DUMP_FORCE_ERR_LEVEL,
-			   "extended rom status: %s", msg);
+	dev_err(sdev->dev, "error: extended rom status: %s", msg);
 
 }
 
diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index 144b72bf8190..a0ae174f9bb0 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -821,7 +821,7 @@ int snd_sof_run_firmware(struct snd_sof_dev *sdev)
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: failed to start DSP\n");
 		snd_sof_dsp_dbg_dump(sdev, SOF_DBG_DUMP_REGS | SOF_DBG_DUMP_MBOX |
-				     SOF_DBG_DUMP_PCI | SOF_DBG_DUMP_FORCE_ERR_LEVEL);
+				     SOF_DBG_DUMP_PCI);
 		return ret;
 	}
 
@@ -837,7 +837,7 @@ int snd_sof_run_firmware(struct snd_sof_dev *sdev)
 	if (ret == 0) {
 		dev_err(sdev->dev, "error: firmware boot failure\n");
 		snd_sof_dsp_dbg_dump(sdev, SOF_DBG_DUMP_REGS | SOF_DBG_DUMP_MBOX |
-			SOF_DBG_DUMP_TEXT | SOF_DBG_DUMP_PCI | SOF_DBG_DUMP_FORCE_ERR_LEVEL);
+				     SOF_DBG_DUMP_TEXT | SOF_DBG_DUMP_PCI);
 		sdev->fw_state = SOF_FW_BOOT_FAILED;
 		return -EIO;
 	}
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index d20ead47be1b..5c1939339936 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -39,8 +39,7 @@
 #define SOF_DBG_DUMP_MBOX		BIT(1)
 #define SOF_DBG_DUMP_TEXT		BIT(2)
 #define SOF_DBG_DUMP_PCI		BIT(3)
-#define SOF_DBG_DUMP_FORCE_ERR_LEVEL	BIT(4) /* used to dump dsp status with error log level */
-#define SOF_DBG_DUMP_OPTIONAL		BIT(5) /* only dump if SOF_DBG_PRINT_ALL_DUMPS is set */
+#define SOF_DBG_DUMP_OPTIONAL		BIT(4) /* only dump if SOF_DBG_PRINT_ALL_DUMPS is set */
 
 /* global debug state set by SOF_DBG_ flags */
 extern int sof_core_debug;
@@ -593,13 +592,4 @@ int intel_pcm_close(struct snd_sof_dev *sdev,
 		    struct snd_pcm_substream *substream);
 
 int sof_machine_check(struct snd_sof_dev *sdev);
-
-#define sof_dev_dbg_or_err(dev, is_err, fmt, ...)			\
-	do {								\
-		if (is_err)						\
-			dev_err(dev, "error: " fmt, __VA_ARGS__);	\
-		else							\
-			dev_dbg(dev, fmt, __VA_ARGS__);			\
-	} while (0)
-
 #endif
-- 
2.33.0

