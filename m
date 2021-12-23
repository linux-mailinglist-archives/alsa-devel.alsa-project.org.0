Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2968947E26F
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Dec 2021 12:39:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC60E1836;
	Thu, 23 Dec 2021 12:39:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC60E1836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640259597;
	bh=qug7/Bs642W5WMlBVZV2yEIawy7bwW0RHu3h5f+1DcE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mX68zKf/RmSs8h8F1UJXxraPWau5j23T+oeLZvU/S6X1xtSBBkSb9VBQBoHvf2WLU
	 lv1XVNER4XOhwqs2Kla+0lcTqi3tjzllvso+CeDDn4bhXC931jnaS+hPyDLKRSmjKL
	 saAS3in7wkupqHGpMvHLSA5yVtHEjhIxjtYcaNSQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84EA4F80533;
	Thu, 23 Dec 2021 12:36:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78301F8051C; Thu, 23 Dec 2021 12:36:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 874EEF804FB
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 12:36:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 874EEF804FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="F0ZhRTzV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640259390; x=1671795390;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qug7/Bs642W5WMlBVZV2yEIawy7bwW0RHu3h5f+1DcE=;
 b=F0ZhRTzVKf09h/iV4qCmMZnTAmEkygU33z6jythVwV3gCdi4RBEic1bH
 P6zhNSav7MbFiwxrSHNo9b1Dgn+CO00CBp1AREmchN6uIwv9DxKQ1kxm6
 hrzolTqdTZ3+pgSS0Cv1v2jaxT/s27YolJJL/GedBemBRXwtAo+KZkqsg
 1JjdMkMPB7x6xxwtOGpGg98+AIH3O97IH7DdKMtHoqXjWOTkO4NuzLaEw
 u8yd7XSOQRlFI7RUEBGTVjmjC6MTgJBYtA/qas1lnYZpFqVWlsbGin83G
 XXC0ZsVpnrVO0io2iCe1KlZTcPpePg4C4syPQ9inmS+ukL6dG+Q01rb4T A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="304180824"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="304180824"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:36:29 -0800
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="522065123"
Received: from gcatala-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.214.126])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:36:26 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 08/20] ASoC: SOF: Introduce new firmware state:
 SOF_FW_BOOT_READY_OK
Date: Thu, 23 Dec 2021 13:36:16 +0200
Message-Id: <20211223113628.18582-9-peter.ujfalusi@linux.intel.com>
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

The SOF_FW_BOOT_READY_OK fw_state indicates that the boot ready message has
been received and there were no errors found.

The SOF_FW_BOOT_COMPLETE state will be reached after the
snd_sof_dsp_post_fw_run() completes without error.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Paul Olaru <paul.olaru@oss.nxp.com>
---
 sound/soc/sof/debug.c    | 1 +
 sound/soc/sof/ipc.c      | 2 +-
 sound/soc/sof/loader.c   | 7 ++++---
 sound/soc/sof/sof-priv.h | 1 +
 4 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index 5941316751dd..75aaf0da87a0 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -938,6 +938,7 @@ static const struct soc_fw_state_info {
 	{SOF_FW_BOOT_IN_PROGRESS, "SOF_FW_BOOT_IN_PROGRESS"},
 	{SOF_FW_BOOT_FAILED, "SOF_FW_BOOT_FAILED"},
 	{SOF_FW_BOOT_READY_FAILED, "SOF_FW_BOOT_READY_FAILED"},
+	{SOF_FW_BOOT_READY_OK, "SOF_FW_BOOT_READY_OK"},
 	{SOF_FW_BOOT_COMPLETE, "SOF_FW_BOOT_COMPLETE"},
 	{SOF_FW_CRASHED, "SOF_FW_CRASHED"},
 };
diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 898f261e8603..bbd539071ac5 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -536,7 +536,7 @@ void snd_sof_ipc_msgs_rx(struct snd_sof_dev *sdev)
 			if (err < 0)
 				sof_set_fw_state(sdev, SOF_FW_BOOT_READY_FAILED);
 			else
-				sof_set_fw_state(sdev, SOF_FW_BOOT_COMPLETE);
+				sof_set_fw_state(sdev, SOF_FW_BOOT_READY_OK);
 
 			/* wake up firmware loader */
 			wake_up(&sdev->boot_wait);
diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index 8977a65b5704..f81f24732799 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -842,9 +842,7 @@ int snd_sof_run_firmware(struct snd_sof_dev *sdev)
 		return -EIO;
 	}
 
-	if (sdev->fw_state == SOF_FW_BOOT_COMPLETE)
-		dev_dbg(sdev->dev, "firmware boot complete\n");
-	else
+	if (sdev->fw_state == SOF_FW_BOOT_READY_FAILED)
 		return -EIO; /* FW boots but fw_ready op failed */
 
 	/* perform post fw run operations */
@@ -854,6 +852,9 @@ int snd_sof_run_firmware(struct snd_sof_dev *sdev)
 		return ret;
 	}
 
+	dev_dbg(sdev->dev, "firmware boot complete\n");
+	sof_set_fw_state(sdev, SOF_FW_BOOT_COMPLETE);
+
 	return 0;
 }
 EXPORT_SYMBOL(snd_sof_run_firmware);
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 9bb30b2a516f..c92103a028ff 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -381,6 +381,7 @@ enum snd_sof_fw_state {
 	SOF_FW_BOOT_IN_PROGRESS,
 	SOF_FW_BOOT_FAILED,
 	SOF_FW_BOOT_READY_FAILED, /* firmware booted but fw_ready op failed */
+	SOF_FW_BOOT_READY_OK,
 	SOF_FW_BOOT_COMPLETE,
 	SOF_FW_CRASHED,
 };
-- 
2.34.1

