Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB4047E285
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Dec 2021 12:43:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44C4F18C4;
	Thu, 23 Dec 2021 12:42:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44C4F18C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640259803;
	bh=7MiG0NjfYBU+ohUp456UJYb23lsZ1RDDBzqf8y+Kprc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mCxFDigRURvyul5QJzPPPp3pvbXcj3orHP5Sa5YonHBGlZp5Ta179lYMQ2IYAxnKM
	 uZB5mWYLWNBTZyPl/EMjVb4ZY11LvlBUk1uT+7P9AWiUc5OM7bK2OWHAEykC6zuRkO
	 Ai+wxaT6n4x3In9Qvvljv6TVYrinS/twCb9ORWmY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59EE2F805B0;
	Thu, 23 Dec 2021 12:37:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCA86F80568; Thu, 23 Dec 2021 12:37:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3905BF8055B
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 12:36:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3905BF8055B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Ta5JS92c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640259420; x=1671795420;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7MiG0NjfYBU+ohUp456UJYb23lsZ1RDDBzqf8y+Kprc=;
 b=Ta5JS92cTEAukkSgIjHjwtpvgUJbvF2i5C08p1C6xC3t7WTXV0Ilwj2x
 dFpvBxlrVQD8OVfsJjifo5uAKduiaMGAQuEfpPkGNPyu3RiFSBt3CkmWn
 xhNZk02xZRa3x9DfSRUoMVfX2bG5pnYhxOch8dsnl+VJ6iORavVgldPZI
 /eBndd0Nn4fY46BXt72FT8HN9rs6xIdnjOXLkfSbKWybayz1Tt1xxmPDM
 S0wBvDxkB2XRSsqIU+6U6lR3earE4lOE6k/E+AchSBDo1zAEsloUs1q96
 HpXblK/8xDRSbBgTvOIK58eQDBDJi1Z9Pp2LqopjwIZ3u7SI9rDsYbZoA g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="304180880"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="304180880"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:36:58 -0800
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="522065287"
Received: from gcatala-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.214.126])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:36:56 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 20/20] ASoC: SOF: Intel: hda: Use DEBUG log level for optional
 prints
Date: Thu, 23 Dec 2021 13:36:28 +0200
Message-Id: <20211223113628.18582-21-peter.ujfalusi@linux.intel.com>
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
 sound/soc/sof/intel/hda.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 97027530ecef..18abbd13d593 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -474,7 +474,7 @@ static const struct hda_dsp_msg_code hda_dsp_rom_msg[] = {
 	{HDA_DSP_ROM_NULL_FW_ENTRY,	"error: null FW entry point"},
 };
 
-static void hda_dsp_get_status(struct snd_sof_dev *sdev)
+static void hda_dsp_get_status(struct snd_sof_dev *sdev, const char *level)
 {
 	u32 status;
 	int i;
@@ -484,8 +484,8 @@ static void hda_dsp_get_status(struct snd_sof_dev *sdev)
 
 	for (i = 0; i < ARRAY_SIZE(hda_dsp_rom_msg); i++) {
 		if (status == hda_dsp_rom_msg[i].code) {
-			dev_err(sdev->dev, "%s - code %8.8x\n",
-				hda_dsp_rom_msg[i].msg, status);
+			dev_printk(level, sdev->dev, "%s - code %8.8x\n",
+				   hda_dsp_rom_msg[i].msg, status);
 			return;
 		}
 	}
@@ -523,7 +523,8 @@ static void hda_dsp_get_registers(struct snd_sof_dev *sdev,
 }
 
 /* dump the first 8 dwords representing the extended ROM status */
-static void hda_dsp_dump_ext_rom_status(struct snd_sof_dev *sdev, u32 flags)
+static void hda_dsp_dump_ext_rom_status(struct snd_sof_dev *sdev, const char *level,
+					u32 flags)
 {
 	char msg[128];
 	int len = 0;
@@ -535,18 +536,19 @@ static void hda_dsp_dump_ext_rom_status(struct snd_sof_dev *sdev, u32 flags)
 		len += snprintf(msg + len, sizeof(msg) - len, " 0x%x", value);
 	}
 
-	dev_err(sdev->dev, "extended rom status: %s", msg);
+	dev_printk(level, sdev->dev, "extended rom status: %s", msg);
 
 }
 
 void hda_dsp_dump(struct snd_sof_dev *sdev, u32 flags)
 {
+	char *level = flags & SOF_DBG_DUMP_OPTIONAL ? KERN_DEBUG : KERN_ERR;
 	struct sof_ipc_dsp_oops_xtensa xoops;
 	struct sof_ipc_panic_info panic_info;
 	u32 stack[HDA_DSP_STACK_DUMP_SIZE];
 
 	/* print ROM/FW status */
-	hda_dsp_get_status(sdev);
+	hda_dsp_get_status(sdev, level);
 
 	if (flags & SOF_DBG_DUMP_REGS) {
 		u32 status = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_SRAM_REG_FW_STATUS);
@@ -554,10 +556,10 @@ void hda_dsp_dump(struct snd_sof_dev *sdev, u32 flags)
 
 		hda_dsp_get_registers(sdev, &xoops, &panic_info, stack,
 				      HDA_DSP_STACK_DUMP_SIZE);
-		sof_print_oops_and_stack(sdev, KERN_ERR, status, panic, &xoops,
+		sof_print_oops_and_stack(sdev, level, status, panic, &xoops,
 					 &panic_info, stack, HDA_DSP_STACK_DUMP_SIZE);
 	} else {
-		hda_dsp_dump_ext_rom_status(sdev, flags);
+		hda_dsp_dump_ext_rom_status(sdev, level, flags);
 	}
 }
 
-- 
2.34.1

