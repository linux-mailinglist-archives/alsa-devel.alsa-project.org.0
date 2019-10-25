Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF8DE56B3
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Oct 2019 00:54:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A29341924;
	Sat, 26 Oct 2019 00:53:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A29341924
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572044051;
	bh=fq6kz8/byJfQ33c1uoYgkSDvyaOcCEUC7DAy1eBPBGU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZnXNAQA8yVK2m66hf5hQbhGRR+YuSyPpV+WlgmQVJPa38Uyo9WoQ8khzpg2tMOdSw
	 haHGCArlaVhVBe7SKXNYPaMglVt5deR9F2M2J0i4g4djDle2fofA0IEuGxZH3re+dn
	 xVV7G1hiqgQCaWpQMMr6+PKtgxj5HfdDOKE8ns34=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F756F80752;
	Sat, 26 Oct 2019 00:42:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28A27F8063E; Sat, 26 Oct 2019 00:42:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31665F803A6
 for <alsa-devel@alsa-project.org>; Sat, 26 Oct 2019 00:41:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31665F803A6
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Oct 2019 15:41:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,230,1569308400"; d="scan'208";a="210458221"
Received: from archagam-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.139.180])
 by fmsmga001.fm.intel.com with ESMTP; 25 Oct 2019 15:41:46 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 25 Oct 2019 17:41:12 -0500
Message-Id: <20191025224122.7718-17-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191025224122.7718-1-pierre-louis.bossart@linux.intel.com>
References: <20191025224122.7718-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 16/26] ASoC: SOF: configure D0ix IPC flags in
	set_power_state
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

From: Keyon Jie <yang.jie@linux.intel.com>

The configuration for D0ix in FW is platform specific, let's do this and
send IPC in the platform set_power_state() ops.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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
