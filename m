Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FFD93222C
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jul 2024 10:46:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DFBE852;
	Tue, 16 Jul 2024 10:46:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DFBE852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721119583;
	bh=E3F8GX9XsVaD+UNETRzSdWDAuCtSV1L6+rhJUkx9X4E=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=pxocsSH/FEbRDlADPUMHKhCQ79LfDBqofDUvBmKfF7tjez7ORBt7gGNveJpTocaK8
	 S4p3bKfn9P/WtZ3pZp4GCCi1huNtOqSD1eFYfp0R2DwB0xSMRxAwRXiJKYBbpbBxG1
	 gA9U7YXL30Rnj8AlV/XmS7B/WaZ0dN1GFV1qIJtE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5BF7F805A9; Tue, 16 Jul 2024 10:45:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CA246F805AF;
	Tue, 16 Jul 2024 10:45:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36E64F8026D; Tue, 16 Jul 2024 10:45:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B7AFBF800C1
	for <alsa-devel@alsa-project.org>; Tue, 16 Jul 2024 10:45:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7AFBF800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Kdlo1mt5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721119547; x=1752655547;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=E3F8GX9XsVaD+UNETRzSdWDAuCtSV1L6+rhJUkx9X4E=;
  b=Kdlo1mt5YhiPNelHbjYTBiKw8GYwEeNn9WTaK+c33nxuv7YnfT+UufyX
   jsxIhdPg+JofA9DXSoV9kIlZquOuh+89cL6Q8mfK7v3rqX9TarScUybiL
   Ztz7tKQ4a9CayQ+iRpggyNJkvcEHlkyL27CJGfB5qu8v3UyytzzVPKcnn
   ueXObeOzMOsSAwxXIEFOWfx/jQMOHtq1Xc5jwbA4v8XmyJ7QUmPqzsHC9
   ruva4FnnIckCkWrJQzE38hnzgaOV+r9O9PDU5zGkZtJkz2iaFlH1OUvxk
   C+NZY7TNTGwZ+ygQDUCcQ215RB04RQ+uS64nODgvUrer7StG6dpLlMv94
   g==;
X-CSE-ConnectionGUID: ZYw7NqsDSq2/KFHsfKnddg==
X-CSE-MsgGUID: W9qy0bR5RymgI8bYyXE80g==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="18679892"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800";
   d="scan'208";a="18679892"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 01:45:43 -0700
X-CSE-ConnectionGUID: OBwj4gdwT9upZ6kFNJfPQg==
X-CSE-MsgGUID: Pxy8EW8vRqGodw27O9SEKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800";
   d="scan'208";a="54768495"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.245.246.211])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 01:45:40 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mike Krinkin <krinkin.m.u@gmail.com>,
	Todd Brandt <todd.e.brandt@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH] ASOC: SOF: Intel: hda-loader: only wait for HDaudio IOC for
 IPC4 devices
Date: Tue, 16 Jul 2024 10:45:30 +0200
Message-ID: <20240716084530.300829-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: K75ZPCTD745EMFOULJWXTZIJBIIMKCIF
X-Message-ID-Hash: K75ZPCTD745EMFOULJWXTZIJBIIMKCIF
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K75ZPCTD745EMFOULJWXTZIJBIIMKCIF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Multiple users report a regression bisected to commit d5263dbbd8af
("ASoC: SOF: Intel: don't ignore IOC interrupts for non-audio
transfers"). The firmware version is the likely suspect, as these
users relied on SOF 2.0 while Intel only tested with the 2.2 release.

Rather than completely disable the wait_for_completion(), which can
help us gather timing information on the different stages of the boot
process, the simplest course of action is to just disable it for older
IPC versions which are no longer under active development.

Closes: https://github.com/thesofproject/linux/issues/5072
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218961
Fixes: d5263dbbd8af ("ASoC: SOF: Intel: don't ignore IOC interrupts for non-audio transfers")
Tested-by: Mike Krinkin <krinkin.m.u@gmail.com>
Tested-by: Todd Brandt <todd.e.brandt@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index b8b914eaf7e0..75f6240cf3e1 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -310,15 +310,19 @@ int hda_cl_copy_fw(struct snd_sof_dev *sdev, struct hdac_ext_stream *hext_stream
 		return ret;
 	}
 
-	/* Wait for completion of transfer */
-	time_left = wait_for_completion_timeout(&hda_stream->ioc,
-						msecs_to_jiffies(HDA_CL_DMA_IOC_TIMEOUT_MS));
+	if (sdev->pdata->ipc_type == SOF_IPC_TYPE_4) {
+		/* Wait for completion of transfer */
+		time_left = wait_for_completion_timeout(&hda_stream->ioc,
+							msecs_to_jiffies(HDA_CL_DMA_IOC_TIMEOUT_MS));
 
-	if (!time_left) {
-		dev_err(sdev->dev, "Code loader DMA did not complete\n");
-		return -ETIMEDOUT;
+		if (!time_left) {
+			dev_err(sdev->dev, "Code loader DMA did not complete\n");
+			return -ETIMEDOUT;
+		}
+		dev_dbg(sdev->dev, "Code loader DMA done\n");
 	}
-	dev_dbg(sdev->dev, "Code loader DMA done, waiting for FW_ENTERED status\n");
+
+	dev_dbg(sdev->dev, "waiting for FW_ENTERED status\n");
 
 	status = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR,
 					chip->rom_status_reg, reg,
-- 
2.43.0

