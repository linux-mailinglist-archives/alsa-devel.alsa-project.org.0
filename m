Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0473998579
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2019 22:21:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8222F1654;
	Wed, 21 Aug 2019 22:20:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8222F1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566418860;
	bh=aCNG8THXIf6cFnGEu5a6t8iza+cy9kzXzqaHzg3W7KA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eN8lrB2XAwVXi8cO1JXoplCrqgVDlpwcjPsfm2wXnCrQev1z+eHzZs9YkLxNmDkC9
	 V3Jmon8Q4IHLU4dPTJImwm7B7HgHarBUf8J3/Zf109JXbTLJPCq1uU0CXTIK/D+AiL
	 FmfbZPD0XgcwP1FXTKq3W9mcLaCnpscpwtFfshXo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 945E3F805E1;
	Wed, 21 Aug 2019 22:17:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80838F805E2; Wed, 21 Aug 2019 22:17:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96AFEF8045E
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 22:17:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96AFEF8045E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Aug 2019 13:17:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,412,1559545200"; d="scan'208";a="186344150"
Received: from smasango-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.139.100])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Aug 2019 13:17:46 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 21 Aug 2019 15:17:17 -0500
Message-Id: <20190821201720.17768-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821201720.17768-1-pierre-louis.bossart@linux.intel.com>
References: <20190821201720.17768-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 tiwai@suse.de, Pan Xiuli <xiuli.pan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, srinivas.kandagatla@linaro.org,
 jank@cadence.com, Bard liao <yung-chuan.liao@linux.intel.com>,
 YueHaibing <yuehaibing@huawei.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 broonie@kernel.org, Daniel Baluta <daniel.baluta@nxp.com>,
 Zhu Yingjiang <yingjiang.zhu@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, gregkh@linuxfoundation.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, slawomir.blauciak@intel.com
Subject: [alsa-devel] [RFC PATCH 2/5] ASoC: SOF: Intel: hda: add helper to
	initialize SoundWire IP
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

The helper calls the SoundWire initializations and sets the resource
structure defined as an interface with the platform driver. The
resource deals with PCI base address, interrupts and the callback for
the stream configuration.

The interrupts are gated/ungated at the top-level with the
ADSPIPC2.SNDW field

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 63 +++++++++++++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.h |  1 +
 2 files changed, 64 insertions(+)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index c72e9a09eee1..a968890d0754 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -18,7 +18,9 @@
 #include <sound/hdaudio_ext.h>
 #include <sound/hda_register.h>
 
+#include <linux/acpi.h>
 #include <linux/module.h>
+#include <linux/soundwire/sdw_intel.h>
 #include <sound/intel-nhlt.h>
 #include <sound/sof.h>
 #include <sound/sof/xtensa.h>
@@ -35,6 +37,67 @@
 #define IS_CFL(pci) ((pci)->vendor == 0x8086 && (pci)->device == 0xa348)
 #define IS_CNL(pci) ((pci)->vendor == 0x8086 && (pci)->device == 0x9dc8)
 
+#if IS_ENABLED(CONFIG_SOUNDWIRE_INTEL)
+
+static void hda_sdw_int_enable(struct snd_sof_dev *sdev, bool enable)
+{
+	if (enable)
+		snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR,
+					HDA_DSP_REG_ADSPIC2,
+					HDA_DSP_ADSPIC2_SNDW,
+					HDA_DSP_ADSPIC2_SNDW);
+	else
+		snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR,
+					HDA_DSP_REG_ADSPIC2,
+					HDA_DSP_ADSPIC2_SNDW,
+					0);
+}
+
+static int hda_sdw_init(struct snd_sof_dev *sdev)
+{
+	acpi_handle handle;
+	struct sdw_intel_res res;
+
+	handle = ACPI_HANDLE(sdev->dev);
+
+	memset(&res, 0, sizeof(res));
+
+	res.mmio_base = sdev->bar[HDA_DSP_BAR];
+	res.irq = sdev->ipc_irq;
+	res.parent = sdev->dev;
+
+	hda_sdw_int_enable(sdev, true);
+
+	sdev->sdw = sdw_intel_init(handle, &res);
+	if (!sdev->sdw) {
+		dev_err(sdev->dev, "SDW Init failed\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int hda_sdw_exit(struct snd_sof_dev *sdev)
+{
+	hda_sdw_int_enable(sdev, false);
+
+	if (sdev->sdw)
+		sdw_intel_exit(sdev->sdw);
+
+	return 0;
+}
+#else
+static int hda_sdw_init(struct snd_sof_dev *sdev)
+{
+	return 0;
+}
+
+static int hda_sdw_exit(struct snd_sof_dev *sdev)
+{
+	return 0;
+}
+#endif
+
 /*
  * Debug
  */
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 5591841a1b6f..c8f93317aeb4 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -211,6 +211,7 @@
 
 #define HDA_DSP_ADSPIC_IPC			1
 #define HDA_DSP_ADSPIS_IPC			1
+#define HDA_DSP_ADSPIC2_SNDW			BIT(5)
 
 /* Intel HD Audio General DSP Registers */
 #define HDA_DSP_GEN_BASE		0x0
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
