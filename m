Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B7018D329
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Mar 2020 16:43:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78A7D86F;
	Fri, 20 Mar 2020 16:42:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78A7D86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584719000;
	bh=ypn/OERoUpG1c3RInrBL42GgO22kfXAkU3XbwZw77e0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l7YQFanuu6yyJ8sfWxDfFmPcfAo+p62z3DDRbh8Oz7kOyWfZtZJF+gea6fuUoirAF
	 ga8Yc7X0mdB8UOVHLTNHfFSwRnoa0vdyjTJ2ICq59KMVNZ0SBhSfjiPa3uM5QYbZvj
	 dZzwpcRnwPti1nmlx9M2zXRw16pKRb18pjo7BnbU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 193ACF802BC;
	Fri, 20 Mar 2020 16:40:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83A6EF8028D; Fri, 20 Mar 2020 16:40:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC0C3F8015B;
 Fri, 20 Mar 2020 16:40:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC0C3F8015B
IronPort-SDR: ZxEFZ1A6qFKNmiKbjf5OE1BeSipLiG+ENlxMdfInj7ZYXkI1uIq8zPRsSUprBS6gqNwhWeQtv4
 JuiqiAscKeXQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2020 08:40:26 -0700
IronPort-SDR: v7PaI4O8YrEj9F5qgDPvJUpdBED+67mqFNBO2MvJXj0dhT4VBWttX2rzYoTvhCVQXPY5yUi9lA
 Sw4sXs9UsQFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,285,1580803200"; d="scan'208";a="237257380"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO
 ubuntu.ger.corp.intel.com) ([10.252.57.199])
 by fmsmga007.fm.intel.com with ESMTP; 20 Mar 2020 08:40:25 -0700
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 02/12] ASoC: SOF: extract firmware-related operation into a
 function
Date: Fri, 20 Mar 2020 16:40:11 +0100
Message-Id: <20200320154021.5964-3-guennadi.liakhovetski@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200320154021.5964-1-guennadi.liakhovetski@linux.intel.com>
References: <20200320154021.5964-1-guennadi.liakhovetski@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: sound-open-firmware@alsa-project.org
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

In the VirtIO guest case the SOF will not be dealing with the
firmware directly. Extract related functionality into a function to
make the separation easier.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 sound/soc/sof/core.c | 85 ++++++++++++++++++++++++++++++----------------------
 1 file changed, 49 insertions(+), 36 deletions(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 91acfae..ca30d67 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -135,6 +135,53 @@ void snd_sof_get_status(struct snd_sof_dev *sdev, u32 panic_code,
  *	(System Suspend/Runtime Suspend)
  */
 
+static int sof_load_and_run_firmware(struct snd_sof_dev *sdev)
+{
+	/* load the firmware */
+	int ret = snd_sof_load_firmware(sdev);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: failed to load DSP firmware %d\n",
+			ret);
+		return ret;
+	}
+
+	sdev->fw_state = SOF_FW_BOOT_IN_PROGRESS;
+
+	/*
+	 * Boot the firmware. The FW boot status will be modified
+	 * in snd_sof_run_firmware() depending on the outcome.
+	 */
+	ret = snd_sof_run_firmware(sdev);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: failed to boot DSP firmware %d\n",
+			ret);
+		goto fw_run_err;
+	}
+
+	if (IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_ENABLE_FIRMWARE_TRACE) ||
+	    (sof_core_debug & SOF_DBG_ENABLE_TRACE)) {
+		sdev->dtrace_is_supported = true;
+
+		/* init DMA trace */
+		ret = snd_sof_init_trace(sdev);
+		if (ret < 0) {
+			/* non fatal */
+			dev_warn(sdev->dev,
+				 "warning: failed to initialize trace %d\n",
+				 ret);
+		}
+	} else {
+		dev_dbg(sdev->dev, "SOF firmware trace disabled\n");
+	}
+
+	return 0;
+
+fw_run_err:
+	snd_sof_fw_unload(sdev);
+
+	return ret;
+}
+
 static int sof_probe_continue(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_pdata *plat_data = sdev->pdata;
@@ -180,42 +227,9 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 		goto ipc_err;
 	}
 
-	/* load the firmware */
-	ret = snd_sof_load_firmware(sdev);
-	if (ret < 0) {
-		dev_err(sdev->dev, "error: failed to load DSP firmware %d\n",
-			ret);
+	ret = sof_load_and_run_firmware(sdev);
+	if (ret < 0)
 		goto fw_load_err;
-	}
-
-	sdev->fw_state = SOF_FW_BOOT_IN_PROGRESS;
-
-	/*
-	 * Boot the firmware. The FW boot status will be modified
-	 * in snd_sof_run_firmware() depending on the outcome.
-	 */
-	ret = snd_sof_run_firmware(sdev);
-	if (ret < 0) {
-		dev_err(sdev->dev, "error: failed to boot DSP firmware %d\n",
-			ret);
-		goto fw_run_err;
-	}
-
-	if (IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_ENABLE_FIRMWARE_TRACE) ||
-	    (sof_core_debug & SOF_DBG_ENABLE_TRACE)) {
-		sdev->dtrace_is_supported = true;
-
-		/* init DMA trace */
-		ret = snd_sof_init_trace(sdev);
-		if (ret < 0) {
-			/* non fatal */
-			dev_warn(sdev->dev,
-				 "warning: failed to initialize trace %d\n",
-				 ret);
-		}
-	} else {
-		dev_dbg(sdev->dev, "SOF firmware trace disabled\n");
-	}
 
 	/* hereafter all FW boot flows are for PM reasons */
 	sdev->first_boot = false;
@@ -249,7 +263,6 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 
 fw_trace_err:
 	snd_sof_free_trace(sdev);
-fw_run_err:
 	snd_sof_fw_unload(sdev);
 fw_load_err:
 	snd_sof_ipc_free(sdev);
-- 
1.9.3

