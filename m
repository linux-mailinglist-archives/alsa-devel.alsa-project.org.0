Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1B142CE5
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 19:02:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E21C21791;
	Wed, 12 Jun 2019 19:01:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E21C21791
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560358938;
	bh=ztzqBTaYEvZnm+T6XjMlEb/Bsgdbh6YhU064yErUuUw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YTaHvrs9L4DL3/Wl4t7vf9osz7WhSwrS2wjuPiLmpzStq/g764OvJxvSynWulh7hh
	 jdbAENURsrrPoX6riMONgyWH3BKuqbiwOyiT7f+ZZBVfqrKaVSRnVnuS9gGrVHzGv1
	 Ev8eSS5KiuATdBf5KSvrJj0kVdOGpj5A7V3l+pR8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F538F89742;
	Wed, 12 Jun 2019 18:57:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60E2DF89735; Wed, 12 Jun 2019 18:57:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B5E9F8970C
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 18:57:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B5E9F8970C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jun 2019 09:57:11 -0700
X-ExtLoop1: 1
Received: from adorrell-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.133.122])
 by orsmga002.jf.intel.com with ESMTP; 12 Jun 2019 09:57:10 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 12 Jun 2019 11:57:03 -0500
Message-Id: <20190612165705.1858-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612165705.1858-1-pierre-louis.bossart@linux.intel.com>
References: <20190612165705.1858-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [alsa-devel] [PATCH 3/5] ASoC: SOF: intel: extend IPC dump
	information
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

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Extend the HDA IPC dump implementation with status of key IRQ
registers. This is useful to debug IPC timeouts and similar
issues.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/cnl.c |  2 ++
 sound/soc/sof/intel/hda.c | 29 +++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.h |  2 ++
 3 files changed, 33 insertions(+)

diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 9a4927b6b6ae..d59305787fc3 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -168,6 +168,8 @@ static void cnl_ipc_dump(struct snd_sof_dev *sdev)
 	u32 hipcida;
 	u32 hipctdr;
 
+	hda_ipc_irq_dump(sdev);
+
 	/* read IPC status */
 	hipcida = snd_sof_dsp_read(sdev, HDA_DSP_BAR, CNL_DSP_REG_HIPCIDA);
 	hipcctl = snd_sof_dsp_read(sdev, HDA_DSP_BAR, CNL_DSP_REG_HIPCCTL);
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index a09dafa35fdb..140b1424f291 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -15,6 +15,9 @@
  * Hardware interface for generic Intel audio DSP HDA IP
  */
 
+#include <sound/hdaudio_ext.h>
+#include <sound/hda_register.h>
+
 #include <linux/module.h>
 #include <sound/hdaudio_ext.h>
 #include <sound/sof.h>
@@ -186,12 +189,38 @@ void hda_dsp_dump(struct snd_sof_dev *sdev, u32 flags)
 	}
 }
 
+void hda_ipc_irq_dump(struct snd_sof_dev *sdev)
+{
+	struct hdac_bus *bus = sof_to_bus(sdev);
+	u32 adspis;
+	u32 intsts;
+	u32 intctl;
+	u32 ppsts;
+	u8 rirbsts;
+
+	/* read key IRQ stats and config registers */
+	adspis = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_ADSPIS);
+	intsts = snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR, SOF_HDA_INTSTS);
+	intctl = snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR, SOF_HDA_INTCTL);
+	ppsts = snd_sof_dsp_read(sdev, HDA_DSP_PP_BAR, SOF_HDA_REG_PP_PPSTS);
+	rirbsts = snd_hdac_chip_readb(bus, RIRBSTS);
+
+	dev_err(sdev->dev,
+		"error: hda irq intsts 0x%8.8x intlctl 0x%8.8x rirb %2.2x\n",
+		intsts, intctl, rirbsts);
+	dev_err(sdev->dev,
+		"error: dsp irq ppsts 0x%8.8x adspis 0x%8.8x\n",
+		ppsts, adspis);
+}
+
 void hda_ipc_dump(struct snd_sof_dev *sdev)
 {
 	u32 hipcie;
 	u32 hipct;
 	u32 hipcctl;
 
+	hda_ipc_irq_dump(sdev);
+
 	/* read IPC status */
 	hipcie = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCIE);
 	hipct = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCT);
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 455046612b94..6c7dee2627d0 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -61,6 +61,7 @@
 #define SOF_HDA_PP_CAP_ID		0x3
 #define SOF_HDA_REG_PP_PPCH		0x10
 #define SOF_HDA_REG_PP_PPCTL		0x04
+#define SOF_HDA_REG_PP_PPSTS		0x08
 #define SOF_HDA_PPCTL_PIE		BIT(31)
 #define SOF_HDA_PPCTL_GPROCEN		BIT(30)
 
@@ -449,6 +450,7 @@ void hda_dsp_set_hw_params_upon_resume(struct snd_sof_dev *sdev);
 void hda_dsp_dump_skl(struct snd_sof_dev *sdev, u32 flags);
 void hda_dsp_dump(struct snd_sof_dev *sdev, u32 flags);
 void hda_ipc_dump(struct snd_sof_dev *sdev);
+void hda_ipc_irq_dump(struct snd_sof_dev *sdev);
 
 /*
  * DSP PCM Operations.
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
