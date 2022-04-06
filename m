Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8E94F6A31
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Apr 2022 21:43:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08E8D172F;
	Wed,  6 Apr 2022 21:42:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08E8D172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649274205;
	bh=sH4/bDXN0EtfABLxfyRPn5r+jLwoQhUogpWs2PSXaI0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mR5K+1LgOwSXu7xNnmavlR+IZtcO5fzPc4RPU9oNzhpg5otL0TQsB/fK9CRcNuuH6
	 FWvMEkaYn9/58S7dW2qaS6DVor+SjKqnpRUU0jFY4b3WEGlODmXqDb9+Ac5wMF9Xxy
	 LGdP7dVAbKrwbMIdgU52WlfpNIpy4gfCKWo7SQlE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0401F80161;
	Wed,  6 Apr 2022 21:41:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6336F80520; Wed,  6 Apr 2022 21:41:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FA46F80161
 for <alsa-devel@alsa-project.org>; Wed,  6 Apr 2022 21:41:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FA46F80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Mj3KtonN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649274068; x=1680810068;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sH4/bDXN0EtfABLxfyRPn5r+jLwoQhUogpWs2PSXaI0=;
 b=Mj3KtonNEWMtxFRXuzvi+R2DBNSOYBS3ho6T+sQunaKZ6sMJPkrTe1tO
 BbbbMpKoXwtZYfEBjaMc1QLmNWfBR1ZGI+qMpThc4hHOJm9U4oYoU3VZL
 wM/7yst02RZfMfK9/oBKkud+6eKi6qV/p0NWfVxM6P6y0DLh+XpiK+5WS
 fq0ZOLkR+SLD8CLiNAEfNf6mcBa0FOek7lLaUpJv3Xg/E9UXh60EaNhSz
 Kki6JsD3ZaLeMSvjXvSIp50JIF/d7MOCjpmXKWGZPMRe2Pay3KciTO2Wi
 lFu2EML32fhV8+J1B0tI8DB1ur9ee//hK/iey4U7rsKgjTIm0ASSBeljg A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="347582624"
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; d="scan'208";a="347582624"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 12:41:02 -0700
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; d="scan'208";a="570713315"
Received: from cbok-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.252.137.86])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 12:41:01 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/4] ASoC: SOF: amd: Use dedicated MBOX for ACP and PSP
 communication
Date: Wed,  6 Apr 2022 14:40:48 -0500
Message-Id: <20220406194048.289787-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220406194048.289787-1-pierre-louis.bossart@linux.intel.com>
References: <20220406194048.289787-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>

We are currently using generic PSP Mailbox register for sending SHA
complete command to PSP but observe random arbitration issue during
PSP validation as MP0_C2PMSG_26_REG used by other kernel modules.

Use separate mailbox registers and doorbell mechanism to send SHA_DMA
complete command to PSP. This fixes such validation issues and added
flexibility for sending more ACP commands to PSP in future as new mbox
registers i.e MP0_C2PMSG_114_REG and MP0_C2PMSG_73_REG are dedicated
by PSP for ACP communications.

Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/amd/acp.c | 23 ++++++++++++++++++++---
 sound/soc/sof/amd/acp.h |  6 ++++--
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index 461f9b0ce49e..0c272573df97 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -152,7 +152,7 @@ static int psp_mbox_ready(struct acp_dev_data *adata, bool ack)
 
 	for (timeout = ACP_PSP_TIMEOUT_COUNTER; timeout > 0; timeout--) {
 		msleep(20);
-		smn_read(adata->smn_dev, MP0_C2PMSG_26_REG, &data);
+		smn_read(adata->smn_dev, MP0_C2PMSG_114_REG, &data);
 		if (data & MBOX_READY_MASK)
 			return 0;
 	}
@@ -174,17 +174,34 @@ static int psp_mbox_ready(struct acp_dev_data *adata, bool ack)
 static int psp_send_cmd(struct acp_dev_data *adata, int cmd)
 {
 	struct snd_sof_dev *sdev = adata->dev;
-	int ret;
+	int ret, timeout;
+	u32 data;
 
 	if (!cmd)
 		return -EINVAL;
 
+	/* Get a non-zero Doorbell value from PSP */
+	for (timeout = ACP_PSP_TIMEOUT_COUNTER; timeout > 0; timeout--) {
+		msleep(MBOX_DELAY);
+		smn_read(adata->smn_dev, MP0_C2PMSG_73_REG, &data);
+		if (data)
+			break;
+	}
+
+	if (!timeout) {
+		dev_err(sdev->dev, "Failed to get Doorbell from MBOX %x\n", MP0_C2PMSG_73_REG);
+		return -EINVAL;
+	}
+
 	/* Check if PSP is ready for new command */
 	ret = psp_mbox_ready(adata, 0);
 	if (ret)
 		return ret;
 
-	smn_write(adata->smn_dev, MP0_C2PMSG_26_REG, cmd);
+	smn_write(adata->smn_dev, MP0_C2PMSG_114_REG, cmd);
+
+	/* Ring the Doorbell for PSP */
+	smn_write(adata->smn_dev, MP0_C2PMSG_73_REG, data);
 
 	/* Check MBOX ready as PSP ack */
 	ret = psp_mbox_ready(adata, 1);
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index 35e46fe6676a..eb4e2a9a9c25 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -57,8 +57,10 @@
 #define ACP_SHA_STAT				0x8000
 #define ACP_PSP_TIMEOUT_COUNTER			5
 #define ACP_EXT_INTR_ERROR_STAT			0x20000000
-#define MP0_C2PMSG_26_REG			0x03810570
-#define MBOX_ACP_SHA_DMA_COMMAND		0x330000
+#define MP0_C2PMSG_114_REG			0x3810AC8
+#define MP0_C2PMSG_73_REG			0x3810A24
+#define MBOX_ACP_SHA_DMA_COMMAND		0x70000
+#define MBOX_DELAY				1000
 #define MBOX_READY_MASK				0x80000000
 #define MBOX_STATUS_MASK			0xFFFF
 
-- 
2.30.2

