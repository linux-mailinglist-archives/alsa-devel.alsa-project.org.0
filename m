Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B9D47E274
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Dec 2021 12:41:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4FF418B7;
	Thu, 23 Dec 2021 12:40:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4FF418B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640259667;
	bh=3ZfFbKHtDj+9P2sJmTmZOWlZSZXoq42p7CpvnWEfmM4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NUj//mWyx8J30Vq86bKYIAs29jmKBKS7S/lwCrAQBibXs1P6I7cPLc/GJV8KQHxhl
	 EUEa+v/b89s3yI7TJSL+6/w8SYSTkQKPuTBjaNagRM8EnVZuEiyx6y12nvVCItKoor
	 Na/lhbRbtxxh/vMNfgMCBKB2p6wcJkILkSxnhCWk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08996F8055C;
	Thu, 23 Dec 2021 12:36:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53943F80548; Thu, 23 Dec 2021 12:36:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 640D3F80548
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 12:36:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 640D3F80548
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="LGbp6UR4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640259410; x=1671795410;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3ZfFbKHtDj+9P2sJmTmZOWlZSZXoq42p7CpvnWEfmM4=;
 b=LGbp6UR4IQ65zHHxAM7OdQC2ai+Iu+0uqoIQYq6MUIi06MfYemxMHgDj
 SsXgHesfc/vHZw5qNurfoARaPX5QPJ0wMEPmesme4hFNOb4hXIIKFGxyy
 fNIGiM0DObyXTdogm5RWr3JVwi5Y8e41mEFM8Og6geh6tQzPraT/EFQLp
 KB0r9xtE0QieRRTJZbBb1jOei4Hp+i+j2rQuHL2kJCKGTHE2IADhlQO1I
 BAAl+W1PMc/qzZigNTGpOK/mbZLvls7s2dddb/98brZLHYS6ytogSIa6s
 GGFqOoC5nYdRp3MewdUI2Ji/tW+lgypwADMdd3VI2SNOUhwwkjjRLihx+ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="304180838"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="304180838"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:36:38 -0800
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="522065173"
Received: from gcatala-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.214.126])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:36:36 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 12/20] ASoC: SOF: Set SOF_FW_BOOT_FAILED in case we have
 failure during boot
Date: Thu, 23 Dec 2021 13:36:20 +0200
Message-Id: <20211223113628.18582-13-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211223113628.18582-1-peter.ujfalusi@linux.intel.com>
References: <20211223113628.18582-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 chao.song@intel.com, daniel.baluta@nxp.com
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

Change the fw_state to SOF_FW_BOOT_FAILED if we encountered an error during
booting the firmware.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/core.c   | 2 ++
 sound/soc/sof/loader.c | 1 -
 sound/soc/sof/pm.c     | 2 ++
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 00f8ffee2866..aa7a721f34e4 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -202,6 +202,7 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: failed to load DSP firmware %d\n",
 			ret);
+		sof_set_fw_state(sdev, SOF_FW_BOOT_FAILED);
 		goto fw_load_err;
 	}
 
@@ -215,6 +216,7 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: failed to boot DSP firmware %d\n",
 			ret);
+		sof_set_fw_state(sdev, SOF_FW_BOOT_FAILED);
 		goto fw_run_err;
 	}
 
diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index f81f24732799..697f03565a70 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -838,7 +838,6 @@ int snd_sof_run_firmware(struct snd_sof_dev *sdev)
 		snd_sof_dsp_dbg_dump(sdev, "Firmware boot failure due to timeout",
 				     SOF_DBG_DUMP_REGS | SOF_DBG_DUMP_MBOX |
 				     SOF_DBG_DUMP_TEXT | SOF_DBG_DUMP_PCI);
-		sof_set_fw_state(sdev, SOF_FW_BOOT_FAILED);
 		return -EIO;
 	}
 
diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index f22b5ee23478..022b19669735 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -130,6 +130,7 @@ static int sof_resume(struct device *dev, bool runtime_resume)
 		dev_err(sdev->dev,
 			"error: failed to load DSP firmware after resume %d\n",
 			ret);
+		sof_set_fw_state(sdev, SOF_FW_BOOT_FAILED);
 		return ret;
 	}
 
@@ -144,6 +145,7 @@ static int sof_resume(struct device *dev, bool runtime_resume)
 		dev_err(sdev->dev,
 			"error: failed to boot DSP firmware after resume %d\n",
 			ret);
+		sof_set_fw_state(sdev, SOF_FW_BOOT_FAILED);
 		return ret;
 	}
 
-- 
2.34.1

