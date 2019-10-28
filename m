Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5238E745F
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 16:04:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 761C71F8E;
	Mon, 28 Oct 2019 16:03:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 761C71F8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572275058;
	bh=Ba9+sfd9LZcjdc5TCwOJQRmJOK8aYGcaO0uPk39xA9E=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=eGMjmqasel2BHGzOZVT+VmakrML1v7ZJMdWX2wQfxwQKiBHxAcGmwSi41zAmw8KbN
	 n9MJOeLtOZHSSsoglQESSSj/tDo/ddzEP65s/P0rtO0/xLSD/Jy8Rn1gipDkR0/M4b
	 LGlxFxaWDGJPiJ0UP7crRlxZgFyift8CKa9anhSk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 382ACF80635;
	Mon, 28 Oct 2019 15:57:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDD6FF80672; Mon, 28 Oct 2019 15:56:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2754FF805FB
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 15:56:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2754FF805FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="FMbfZIzY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=x6lxz6NfTklp1MjZAFE8vP2TB8vU5639mtMX8K0SysM=; b=FMbfZIzYir24
 gRNhhgejoBxwVeAHLs3j3NP/trTldRo1ZxRoIBEHGsRm7ywOAbuEJ/7U7BFO+8eOjJMw0iNsnFQii
 QRVoaSPkuiA+87/OH4ky/OA4/VjO6nNdVRqrXxrH5HnAogQ7xa5G7zqWjJzofw8/Q4ivkgjZBzROu
 2VGDQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iP6Rb-0008P2-TP; Mon, 28 Oct 2019 14:56:32 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 45E4F2741533; Mon, 28 Oct 2019 14:56:30 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Keyon Jie <yang.jie@linux.intel.com>
In-Reply-To: <20191025224122.7718-17-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191028145630.45E4F2741533@ypsilon.sirena.org.uk>
Date: Mon, 28 Oct 2019 14:56:30 +0000 (GMT)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: configure D0ix IPC flags in
	set_power_state" to the asoc tree
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

   ASoC: SOF: configure D0ix IPC flags in set_power_state

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

From 534037fddd34b58be86a826d449a5a6635ecdbf5 Mon Sep 17 00:00:00 2001
From: Keyon Jie <yang.jie@linux.intel.com>
Date: Fri, 25 Oct 2019 17:41:12 -0500
Subject: [PATCH] ASoC: SOF: configure D0ix IPC flags in set_power_state

The configuration for D0ix in FW is platform specific, let's do this and
send IPC in the platform set_power_state() ops.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191025224122.7718-17-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-dsp.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 936361bd25e9..b5070409a5e3 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -19,6 +19,7 @@
 #include <sound/hda_register.h>
 #include "../ops.h"
 #include "hda.h"
+#include "hda-ipc.h"
 
 /*
  * DSP Core control.
@@ -319,10 +320,28 @@ static int hda_dsp_wait_d0i3c_done(struct snd_sof_dev *sdev, int retry)
 	return 0;
 }
 
+static int hda_dsp_send_pm_gate_ipc(struct snd_sof_dev *sdev, u32 flags)
+{
+	struct sof_ipc_pm_gate pm_gate;
+	struct sof_ipc_reply reply;
+
+	memset(&pm_gate, 0, sizeof(pm_gate));
+
+	/* configure pm_gate ipc message */
+	pm_gate.hdr.size = sizeof(pm_gate);
+	pm_gate.hdr.cmd = SOF_IPC_GLB_PM_MSG | SOF_IPC_PM_GATE;
+	pm_gate.flags = flags;
+
+	/* send pm_gate ipc to dsp */
+	return sof_ipc_tx_message(sdev->ipc, pm_gate.hdr.cmd, &pm_gate,
+				  sizeof(pm_gate), &reply, sizeof(reply));
+}
+
 int hda_dsp_set_power_state(struct snd_sof_dev *sdev,
 			    enum sof_d0_substate d0_substate)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
+	u32 flags;
 	int ret;
 	u8 value;
 
@@ -347,7 +366,18 @@ int hda_dsp_set_power_state(struct snd_sof_dev *sdev,
 	dev_vdbg(bus->dev, "D0I3C updated, register = 0x%x\n",
 		 snd_hdac_chip_readb(bus, VS_D0I3C));
 
-	return 0;
+	if (d0_substate == SOF_DSP_D0I0)
+		flags = HDA_PM_PPG;/* prevent power gating in D0 */
+	else
+		flags = HDA_PM_NO_DMA_TRACE;/* disable DMA trace in D0I3*/
+
+	/* sending pm_gate IPC */
+	ret = hda_dsp_send_pm_gate_ipc(sdev, flags);
+	if (ret < 0)
+		dev_err(sdev->dev,
+			"error: PM_GATE ipc error %d\n", ret);
+
+	return ret;
 }
 
 static int hda_suspend(struct snd_sof_dev *sdev, bool runtime_suspend)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
