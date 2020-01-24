Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 298B5149044
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jan 2020 22:41:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC4FF1678;
	Fri, 24 Jan 2020 22:40:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC4FF1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579902061;
	bh=BtxPyj5VErXwBCFW+4as14ZWCUAQQXvd6QvU8wfSRl0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O5KCh2lTOMUoUZkIDJ8TuDlFMaKX0tkgoGb0L3gebXL/VTywpgZ2ApDM4IbLJpvqA
	 +wKZ/t1QfzDYM4x2UN8tW4rSwEAiDvtB/04mz/H4le5trhC64bx/pcsP9/SZgkBq9s
	 QVlmLOKwPb3Ub+yiqiEQjajIpPUw9/qZ8qp7ZYIQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A800FF8028D;
	Fri, 24 Jan 2020 22:36:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B74ADF80277; Fri, 24 Jan 2020 22:36:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09718F801D8
 for <alsa-devel@alsa-project.org>; Fri, 24 Jan 2020 22:36:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09718F801D8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jan 2020 13:36:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,359,1574150400"; d="scan'208";a="294313450"
Received: from sascates-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.4.164])
 by fmsmga001.fm.intel.com with ESMTP; 24 Jan 2020 13:36:30 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 24 Jan 2020 15:36:20 -0600
Message-Id: <20200124213625.30186-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200124213625.30186-1-pierre-louis.bossart@linux.intel.com>
References: <20200124213625.30186-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [alsa-devel] [PATCH 2/7] ASoC: SOF: core: free trace on errors
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

free_trace() is not called on probe errors, fix

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 44f9c04d54aa..f517ab448a1d 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -224,12 +224,12 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 	if (ret < 0) {
 		dev_err(sdev->dev,
 			"error: failed to register DSP DAI driver %d\n", ret);
-		goto fw_run_err;
+		goto fw_trace_err;
 	}
 
 	ret = snd_sof_machine_register(sdev, plat_data);
 	if (ret < 0)
-		goto fw_run_err;
+		goto fw_trace_err;
 
 	/*
 	 * Some platforms in SOF, ex: BYT, may not have their platform PM
@@ -245,6 +245,8 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 	return 0;
 
 #if !IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE)
+fw_trace_err:
+	snd_sof_free_trace(sdev);
 fw_run_err:
 	snd_sof_fw_unload(sdev);
 fw_load_err:
@@ -262,6 +264,7 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 	 * snd_sof_device_remove() when the PCI/ACPI device is removed
 	 */
 
+fw_trace_err:
 fw_run_err:
 fw_load_err:
 ipc_err:
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
