Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A0A12811A
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2019 18:07:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AC9F1654;
	Fri, 20 Dec 2019 18:06:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AC9F1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576861649;
	bh=5PMPmkp7hX6FOiebQwMZWgve8VlEcyRJK2E3l40obBo=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=A//VtLrDt/LsZGLjNrCIjgygUKOv9eBIz8XTlVGbvdBASF9BhQFP8jZ/cHhCUECDP
	 tG1wEBECLMi0a/cjsHP1N/6EprqKaKFshdrnPUW/K9X3Tl4nwjjm7mMYO1qNurGr9c
	 nvkMpU7etHlswiiriiWgh2MM+2O6j5JUNAMUsC8s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7D5BF8022C;
	Fri, 20 Dec 2019 18:05:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A0E5F8015A; Fri, 20 Dec 2019 18:05:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_29,SPF_HELO_NONE,
 SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00FD8F80059
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 18:05:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00FD8F80059
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Dec 2019 09:05:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,336,1571727600"; d="scan'208";a="213344434"
Received: from landre-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.133.224])
 by fmsmga007.fm.intel.com with ESMTP; 20 Dec 2019 09:05:34 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 20 Dec 2019 11:05:31 -0600
Message-Id: <20191220170531.10423-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH] ASoC: SOF: imx8: Fix dsp_box offset
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

From: Daniel Baluta <daniel.baluta@nxp.com>

dsp_box is used to keep DSP initiated messages. The value of dsp_offset
is set by the DSP with the first message, so we need a way to bootstrap
it in order to get the first message.

We do this by setting the correct default dsp_box offset which on i.MX8
is not zero.

Very interesting is why it has worked until now.

On i.MX8, DSP communicates with ARM core using a shared SDRAM memory
area. Actually, there are two shared areas:
	* SDRAM0 - starting at 0x92400000, size 0x800000
	* SDRAM1 - starting at 0x92C00000, size 0x800000

SDRAM0 keeps the data sections, starting with .rodata. By chance
fw_ready structure was placed at the beginning of .rodata.

dsp_box_base is defined as SDRAM0 + dsp_box_offset and it is placed
at the beginning of SDRAM1 (dsp_box_offset should be 0x800000). But
because it is zero initialized by default it points to SDRAM0 where
by chance the fw_ready was placed in the SOF firmware.

Anyhow, SOF commit 7466bee378dd811b ("clk: make freq arrays constant")
fw_ready is no longer at the beginning of SDRAM0 and everything shows
how lucky we were until now.

Fix this by properly setting the default dsp_box offset.

Fixes: 202acc565a1f050 ("ASoC: SOF: imx: Add i.MX8 HW support")
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/imx/imx8.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index cfefcfd92798..dca85cf07ffa 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -304,6 +304,9 @@ static int imx8_probe(struct snd_sof_dev *sdev)
 	}
 	sdev->mailbox_bar = SOF_FW_BLK_TYPE_SRAM;
 
+	/* set default mailbox offset for FW ready message */
+	sdev->dsp_box.offset = MBOX_OFFSET;
+
 	return 0;
 
 exit_pdev_unregister:
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
