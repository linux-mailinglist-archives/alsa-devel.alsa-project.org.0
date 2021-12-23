Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 429B647E281
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Dec 2021 12:43:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E495318E5;
	Thu, 23 Dec 2021 12:42:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E495318E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640259787;
	bh=pXAg2RS9zKPl0urDuDGaL5TkLHez5NZ9ihB9p9XZn0o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LpLtoVF9FpJPk2l7qVvw/CMOwLsA5h4RhbxvSCzwNJFZMg7LgGBx1xwRsHSXqD7Pr
	 geXophlN7M+SIzeIK9+WadyL9WRhnqA0lDkN1oHJ7hMZiWeB5TbIv3cDRiL1iLB1L1
	 7hICBoVAhzxhlpvTR7OBQ23ADlu6b0ueoX+rVyso=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB497F805A8;
	Thu, 23 Dec 2021 12:37:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A846F80548; Thu, 23 Dec 2021 12:37:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A2BBF80548
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 12:36:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A2BBF80548
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ZE5LknqS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640259418; x=1671795418;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pXAg2RS9zKPl0urDuDGaL5TkLHez5NZ9ihB9p9XZn0o=;
 b=ZE5LknqSmizihBGxZCnqfS6aTfVC6lSlThk+sHkt7dZblU6rEzb3ErQG
 RTtR4T16CpVPMcRp+8n9HDmSfFarXtmkAa/9yvGrs8uM40GIOyKPIVSCT
 m0MggncBHRDDNqSXCpoRCNJdddXO613HPoguZk1or/bb11+ZsKxHE2eaD
 hUF0s6IwJjhUalZ8V0MhUrQfrPeKR4MxPpEk1reXEg1gTzhhuTzMmaJcP
 6PirEPHD4h3jemWbvo5d/t6Xz0IpCfIXHHxUb8CdAbm1p7qF7GcciaoN4
 2KLpHJNzg2wEPkqBRPMydv5WxPUNQBVDq7+PTVRp4a4C9ozB9xwyXv1Y1 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="304180873"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="304180873"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:36:56 -0800
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="522065272"
Received: from gcatala-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.214.126])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:36:53 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 19/20] ASoC: SOF: debug: Use DEBUG log level for optional
 prints
Date: Thu, 23 Dec 2021 13:36:27 +0200
Message-Id: <20211223113628.18582-20-peter.ujfalusi@linux.intel.com>
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

If the user requested to see all dumps (even the optional ones) then use
KERN_DEBUG level for the optional dumps as they are only for debugging
purposes.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/debug.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index d3640ff33134..6d6757075f7c 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -943,38 +943,42 @@ static const struct soc_fw_state_info {
 	{SOF_FW_CRASHED, "SOF_FW_CRASHED"},
 };
 
-static void snd_sof_dbg_print_fw_state(struct snd_sof_dev *sdev)
+static void snd_sof_dbg_print_fw_state(struct snd_sof_dev *sdev, const char *level)
 {
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(fw_state_dbg); i++) {
 		if (sdev->fw_state == fw_state_dbg[i].state) {
-			dev_err(sdev->dev, "fw_state: %s (%d)\n", fw_state_dbg[i].name, i);
+			dev_printk(level, sdev->dev, "fw_state: %s (%d)\n",
+				   fw_state_dbg[i].name, i);
 			return;
 		}
 	}
 
-	dev_err(sdev->dev, "fw_state: UNKNOWN (%d)\n", sdev->fw_state);
+	dev_printk(level, sdev->dev, "fw_state: UNKNOWN (%d)\n", sdev->fw_state);
 }
 
 void snd_sof_dsp_dbg_dump(struct snd_sof_dev *sdev, const char *msg, u32 flags)
 {
+	char *level = flags & SOF_DBG_DUMP_OPTIONAL ? KERN_DEBUG : KERN_ERR;
 	bool print_all = sof_debug_check_flag(SOF_DBG_PRINT_ALL_DUMPS);
 
 	if (flags & SOF_DBG_DUMP_OPTIONAL && !print_all)
 		return;
 
 	if (sof_ops(sdev)->dbg_dump && !sdev->dbg_dump_printed) {
-		dev_err(sdev->dev, "------------[ DSP dump start ]------------\n");
+		dev_printk(level, sdev->dev,
+			   "------------[ DSP dump start ]------------\n");
 		if (msg)
-			dev_err(sdev->dev, "%s\n", msg);
-		snd_sof_dbg_print_fw_state(sdev);
+			dev_printk(level, sdev->dev, "%s\n", msg);
+		snd_sof_dbg_print_fw_state(sdev, level);
 		sof_ops(sdev)->dbg_dump(sdev, flags);
-		dev_err(sdev->dev, "------------[ DSP dump end ]------------\n");
+		dev_printk(level, sdev->dev,
+			   "------------[ DSP dump end ]------------\n");
 		if (!print_all)
 			sdev->dbg_dump_printed = true;
 	} else if (msg) {
-		dev_err(sdev->dev, "%s\n", msg);
+		dev_printk(level, sdev->dev, "%s\n", msg);
 	}
 }
 EXPORT_SYMBOL(snd_sof_dsp_dbg_dump);
-- 
2.34.1

