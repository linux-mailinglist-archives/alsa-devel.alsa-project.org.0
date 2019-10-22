Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C547EE0C99
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2019 21:30:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50A2E165E;
	Tue, 22 Oct 2019 21:29:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50A2E165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571772646;
	bh=vrR520YOERese86Cehb+f8KZVKvv72j9AUPCgJw7Y84=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RrTtT0PGqRWN2I+YBTCFQppSze/I+hmrm5hg0ydnlsfqb+FEQ9FUqC+JwusM/z1gE
	 gsuXxJsqlkZZS44N060KDgRZbkkla7nqKDqYwLRi2Erwj881XiMWhUl+fhLN6Js9Ba
	 kmcEQHa0PUHYBXm7BMI3VdfBR0L6Vfly4t/+rAuA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC00FF80367;
	Tue, 22 Oct 2019 21:29:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07B34F80367; Tue, 22 Oct 2019 21:28:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17B43F802FB
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 21:28:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17B43F802FB
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Oct 2019 12:28:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,217,1569308400"; d="scan'208";a="281393565"
Received: from mssikder-mobl.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.254.68.44])
 by orsmga001.jf.intel.com with ESMTP; 22 Oct 2019 12:28:47 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 22 Oct 2019 14:28:43 -0500
Message-Id: <20191022192844.21022-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191022192844.21022-1-pierre-louis.bossart@linux.intel.com>
References: <20191022192844.21022-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 1/2] ASoC: SOF: Intel: hda-loader: improve
	error handling
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

If a ROM timeout is detected, we still stop the DMA but will return
the initial error should the DMA stop also fail.

Likewise the cleanup is handled regardless of the status, but we
return the initial error.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 65c2af3fcaab..7956dbf5be88 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -253,10 +253,16 @@ static int cl_copy_fw(struct snd_sof_dev *sdev, struct hdac_ext_stream *stream)
 					HDA_DSP_REG_POLL_INTERVAL_US,
 					HDA_DSP_BASEFW_TIMEOUT_US);
 
+	/*
+	 * even in case of errors we still need to stop the DMAs,
+	 * but we return the initial error should the DMA stop also fail
+	 */
+
 	ret = cl_trigger(sdev, stream, SNDRV_PCM_TRIGGER_STOP);
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: DMA trigger stop failed\n");
-		return ret;
+		if (!status)
+			status = ret;
 	}
 
 	return status;
@@ -341,13 +347,15 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 	/*
 	 * Perform codeloader stream cleanup.
 	 * This should be done even if firmware loading fails.
+	 * If the cleanup also fails, we return the initial error
 	 */
 	ret1 = cl_cleanup(sdev, &sdev->dmab, stream);
 	if (ret1 < 0) {
 		dev_err(sdev->dev, "error: Code loader DSP cleanup failed\n");
 
 		/* set return value to indicate cleanup failure */
-		ret = ret1;
+		if (!ret)
+			ret = ret1;
 	}
 
 	/*
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
