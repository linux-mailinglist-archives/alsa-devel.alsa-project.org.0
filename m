Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB48C19D361
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Apr 2020 11:18:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D1131693;
	Fri,  3 Apr 2020 11:17:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D1131693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585905519;
	bh=ypn/OERoUpG1c3RInrBL42GgO22kfXAkU3XbwZw77e0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fDrsv58x9tZRnMBRt8r6HhT6S7w17B7soBLmL6uXqBtEYNBZxTfWBGEjji5yfEmwK
	 F7LC3J5rhU7fttQZReAEaTt9HAC+k3bGO9g3vbs3fLn0sH/FCPA8NUZuN1lneTPfHs
	 7lBVhSaeRr6Lh8p8uJXms+a+G1B7dyUUn0KlfZE8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF45EF802D2;
	Fri,  3 Apr 2020 11:14:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B5E9F80299; Fri,  3 Apr 2020 11:14:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F9ECF800E4;
 Fri,  3 Apr 2020 11:14:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F9ECF800E4
IronPort-SDR: 2KlW0af+Nou8W6e72BUrmnsLZ7SVgMv3xj2Y9BF41tnu+1NpqiKEwEs/P6SSGIUwdxypb4c96G
 qR9yOycExaQA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2020 02:14:13 -0700
IronPort-SDR: hwptRmh1wOUSp0gzRh/t7hYfPEBwQvzG4k9Lxt80ArNgIIqw/Ed+x1599IxlTix0BirPXjDO5y
 pJkXDtTC6jrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,339,1580803200"; d="scan'208";a="451234934"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO
 ubuntu.ger.corp.intel.com) ([10.249.36.113])
 by fmsmga006.fm.intel.com with ESMTP; 03 Apr 2020 02:14:11 -0700
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 02/12] [RESEND] ASoC: SOF: extract firmware-related
 operation into a function
Date: Fri,  3 Apr 2020 11:13:56 +0200
Message-Id: <20200403091406.22381-3-guennadi.liakhovetski@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200403091406.22381-1-guennadi.liakhovetski@linux.intel.com>
References: <20200403091406.22381-1-guennadi.liakhovetski@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 sound-open-firmware@alsa-project.org
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

