Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0312CE5696
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Oct 2019 00:46:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7418B18E8;
	Sat, 26 Oct 2019 00:45:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7418B18E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572043609;
	bh=4q1r9uaighTkschpi6yEus1FaNEvo6SY1uEB39ahK+U=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PbmIMHHnN5XqbJD6uFgpNAnwf1yYMZ940FC9tLjb1t0eP+dOOMrzIkbopuRjpwFzU
	 PWb2e+tDyYxG5jq8L+XhCAyx17Q1RQ/iEhPpT6tosHH5mwQ3G6t1U8HL2iTix8s1bR
	 RmyOukuIWdW71yKbPHgI7mxYITysNxBSX55AkXbk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B21E9F803A6;
	Sat, 26 Oct 2019 00:42:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECA30F80611; Sat, 26 Oct 2019 00:41:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A4E8F80368
 for <alsa-devel@alsa-project.org>; Sat, 26 Oct 2019 00:41:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A4E8F80368
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Oct 2019 15:41:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,230,1569308400"; d="scan'208";a="210458185"
Received: from archagam-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.139.180])
 by fmsmga001.fm.intel.com with ESMTP; 25 Oct 2019 15:41:36 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 25 Oct 2019 17:41:00 -0500
Message-Id: <20191025224122.7718-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191025224122.7718-1-pierre-louis.bossart@linux.intel.com>
References: <20191025224122.7718-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 04/26] ASoC: SOF: Intel: hda-dsp: Add helper
	for setting DSP D0ix substate
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

Adding helper to implement setting dsp to d0i3 or d0i0 status, this will
be needed for driver D0ix support.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c | 46 +++++++++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.h     | 10 ++++++++
 2 files changed, 56 insertions(+)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 3ea401646e0c..fa2f1f66c72c 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -306,6 +306,52 @@ void hda_dsp_ipc_int_disable(struct snd_sof_dev *sdev)
 			HDA_DSP_REG_HIPCCTL_BUSY | HDA_DSP_REG_HIPCCTL_DONE, 0);
 }
 
+static int hda_dsp_wait_d0i3c_done(struct snd_sof_dev *sdev, int retry)
+{
+	struct hdac_bus *bus = sof_to_bus(sdev);
+
+	while (snd_hdac_chip_readb(bus, VS_D0I3C) & SOF_HDA_VS_D0I3C_CIP) {
+		if (!retry--)
+			return -ETIMEDOUT;
+		usleep_range(10, 15);
+	}
+
+	return 0;
+}
+
+int hda_dsp_set_power_state(struct snd_sof_dev *sdev,
+			    enum sof_d0_substate d0_substate)
+{
+	struct hdac_bus *bus = sof_to_bus(sdev);
+	int retry = 50;
+	int ret;
+	u8 value;
+
+	/* Write to D0I3C after Command-In-Progress bit is cleared */
+	ret = hda_dsp_wait_d0i3c_done(sdev, retry);
+	if (ret < 0) {
+		dev_err(bus->dev, "CIP timeout before update D0I3C!\n");
+		return ret;
+	}
+
+	/* Update D0I3C register */
+	value = d0_substate == SOF_DSP_D0I3 ? SOF_HDA_VS_D0I3C_I3 : 0;
+	snd_hdac_chip_updateb(bus, VS_D0I3C, SOF_HDA_VS_D0I3C_I3, value);
+
+	/* Wait for cmd in progress to be cleared before exiting the function */
+	retry = 50;
+	ret = hda_dsp_wait_d0i3c_done(sdev, retry);
+	if (ret < 0) {
+		dev_err(bus->dev, "CIP timeout after D0I3C updated!\n");
+		return ret;
+	}
+
+	dev_vdbg(bus->dev, "D0I3C updated, register = 0x%x\n",
+		 snd_hdac_chip_readb(bus, VS_D0I3C));
+
+	return 0;
+}
+
 static int hda_suspend(struct snd_sof_dev *sdev, bool runtime_suspend)
 {
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index ea02bf40cb25..0e7c366b8f71 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -64,6 +64,13 @@
 #define SOF_HDA_PPCTL_PIE		BIT(31)
 #define SOF_HDA_PPCTL_GPROCEN		BIT(30)
 
+/*Vendor Specific Registers*/
+#define SOF_HDA_VS_D0I3C		0x104A
+
+/* D0I3C Register fields */
+#define SOF_HDA_VS_D0I3C_CIP		BIT(0) /* Command-In-Progress */
+#define SOF_HDA_VS_D0I3C_I3		BIT(2) /* D0i3 enable bit */
+
 /* DPIB entry size: 8 Bytes = 2 DWords */
 #define SOF_HDA_DPIB_ENTRY_SIZE	0x8
 
@@ -455,6 +462,9 @@ int hda_dsp_core_reset_power_down(struct snd_sof_dev *sdev,
 void hda_dsp_ipc_int_enable(struct snd_sof_dev *sdev);
 void hda_dsp_ipc_int_disable(struct snd_sof_dev *sdev);
 
+int hda_dsp_set_power_state(struct snd_sof_dev *sdev,
+			    enum sof_d0_substate d0_substate);
+
 int hda_dsp_suspend(struct snd_sof_dev *sdev);
 int hda_dsp_resume(struct snd_sof_dev *sdev);
 int hda_dsp_runtime_suspend(struct snd_sof_dev *sdev);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
