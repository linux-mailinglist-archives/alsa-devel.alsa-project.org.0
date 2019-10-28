Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F40F2E7458
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 16:02:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E4751FA6;
	Mon, 28 Oct 2019 16:01:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E4751FA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572274948;
	bh=uDPM+Jra4pDKKvYT7lIA2vL0KNuELzJy/Uu5qQpaF/4=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=L1eJiF+ZvDBo9Z09pMWtsk1FjbDgdthqjfBihTJ625hBVJwE1E6uH1hdsRWV7dmNu
	 NAntlwVfXPiqDoLzyr0nTVWQeYK4lBty67NjABGpYrN1IR1erun6YmQ29SdSdvho4m
	 daViTmw3TG9iZtPS8/PrBZ40vZc0LQmvm5ywbU1w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 309E8F8060D;
	Mon, 28 Oct 2019 15:56:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F807F80673; Mon, 28 Oct 2019 15:56:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 098B4F805A1
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 15:56:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 098B4F805A1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="a4ACl72h"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=jdPBgIDnr1C3ksaMV1WI/QyTLYcq/JpTI73ol7qRCa0=; b=a4ACl72hMTzK
 gv/Opj+4m0rECGS6AVggkAt/KyF7j1w91fLQQczlP5xsO4g4quFa0F0CmDxjUdfXcon3jFKTCxG85
 OsagoNI/LP/xqK8g9hBJkmeLbNIzhzkn4zdQPzggJLve+aKTBvBDtqR25oJVvvSnhP6yfuXD5wygU
 owpV4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iP6Rb-0008P1-TH; Mon, 28 Oct 2019 14:56:32 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id D1E7127414F2; Mon, 28 Oct 2019 14:56:29 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Keyon Jie <yang.jie@linux.intel.com>
In-Reply-To: <20191025224122.7718-19-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191028145629.D1E7127414F2@ypsilon.sirena.org.uk>
Date: Mon, 28 Oct 2019 14:56:29 +0000 (GMT)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: CNL: add support for
	sending compact IPC" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: SOF: Intel: CNL: add support for sending compact IPC

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 0267de58acfe5059ace739741f1533dd605ed22f Mon Sep 17 00:00:00 2001
From: Keyon Jie <yang.jie@linux.intel.com>
Date: Fri, 25 Oct 2019 17:41:14 -0500
Subject: [PATCH] ASoC: SOF: Intel: CNL: add support for sending compact IPC

For compact IPCs, we will send the IPC header/command via the HIPCIDR
register and the first 32bit payload via the HIPCIDD register, no
mailbox will be used.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191025224122.7718-19-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/cnl.c | 42 ++++++++++++++++++++++++++++++++++-----
 sound/soc/sof/intel/hda.h |  1 +
 2 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 982b81a0b13a..0e1e265f3f3b 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -17,6 +17,7 @@
 
 #include "../ops.h"
 #include "hda.h"
+#include "hda-ipc.h"
 
 static const struct snd_sof_debugfs_map cnl_dsp_debugfs[] = {
 	{"hda", HDA_DSP_HDA_BAR, 0, 0x4000, SOF_DEBUGFS_ACCESS_ALWAYS},
@@ -150,14 +151,45 @@ static void cnl_ipc_dsp_done(struct snd_sof_dev *sdev)
 				CNL_DSP_REG_HIPCCTL_DONE);
 }
 
+static bool cnl_compact_ipc_compress(struct snd_sof_ipc_msg *msg,
+				     u32 *dr, u32 *dd)
+{
+	struct sof_ipc_pm_gate *pm_gate;
+
+	if (msg->header == (SOF_IPC_GLB_PM_MSG | SOF_IPC_PM_GATE)) {
+		pm_gate = msg->msg_data;
+
+		/* send the compact message via the primary register */
+		*dr = HDA_IPC_MSG_COMPACT | HDA_IPC_PM_GATE;
+
+		/* send payload via the extended data register */
+		*dd = pm_gate->flags;
+
+		return true;
+	}
+
+	return false;
+}
+
 static int cnl_ipc_send_msg(struct snd_sof_dev *sdev,
 			    struct snd_sof_ipc_msg *msg)
 {
-	/* send the message */
-	sof_mailbox_write(sdev, sdev->host_box.offset, msg->msg_data,
-			  msg->msg_size);
-	snd_sof_dsp_write(sdev, HDA_DSP_BAR, CNL_DSP_REG_HIPCIDR,
-			  CNL_DSP_REG_HIPCIDR_BUSY);
+	u32 dr = 0;
+	u32 dd = 0;
+
+	if (cnl_compact_ipc_compress(msg, &dr, &dd)) {
+		/* send the message via IPC registers */
+		snd_sof_dsp_write(sdev, HDA_DSP_BAR, CNL_DSP_REG_HIPCIDD,
+				  dd);
+		snd_sof_dsp_write(sdev, HDA_DSP_BAR, CNL_DSP_REG_HIPCIDR,
+				  CNL_DSP_REG_HIPCIDR_BUSY | dr);
+	} else {
+		/* send the message via mailbox */
+		sof_mailbox_write(sdev, sdev->host_box.offset, msg->msg_data,
+				  msg->msg_size);
+		snd_sof_dsp_write(sdev, HDA_DSP_BAR, CNL_DSP_REG_HIPCIDR,
+				  CNL_DSP_REG_HIPCIDR_BUSY);
+	}
 
 	return 0;
 }
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 99ec60218c16..52a87a47029d 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -312,6 +312,7 @@
 #define CNL_DSP_REG_HIPCTDD		(CNL_DSP_IPC_BASE + 0x08)
 #define CNL_DSP_REG_HIPCIDR		(CNL_DSP_IPC_BASE + 0x10)
 #define CNL_DSP_REG_HIPCIDA		(CNL_DSP_IPC_BASE + 0x14)
+#define CNL_DSP_REG_HIPCIDD		(CNL_DSP_IPC_BASE + 0x18)
 #define CNL_DSP_REG_HIPCCTL		(CNL_DSP_IPC_BASE + 0x28)
 
 /*  HIPCI */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
