Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D760E56A8
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Oct 2019 00:50:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9869E18D3;
	Sat, 26 Oct 2019 00:49:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9869E18D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572043847;
	bh=SNAdnh0c3mM2kLwrXIkjj6aqvAdeonTGupBfpjSTJnM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XFZvPqSEmYWWuzT4QiOgCwqbIdgAKLWlXWQcmaWg4+ybGmb4jg0MY6n7I0DhTKWCB
	 X94Uzil/OmrBnCwbGYQAPfzoXodi6OkMI6B3lbrnAIEe4fS1f5787ClOt6i7KCWBEQ
	 EdulVCQhHFXxuZJAR4wBGU2oUroAzZmpoAPujzRo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F00E7F806F5;
	Sat, 26 Oct 2019 00:42:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3D71F80635; Sat, 26 Oct 2019 00:41:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5E01F80600
 for <alsa-devel@alsa-project.org>; Sat, 26 Oct 2019 00:41:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5E01F80600
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Oct 2019 15:41:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,230,1569308400"; d="scan'208";a="210458205"
Received: from archagam-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.139.180])
 by fmsmga001.fm.intel.com with ESMTP; 25 Oct 2019 15:41:42 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 25 Oct 2019 17:41:07 -0500
Message-Id: <20191025224122.7718-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191025224122.7718-1-pierre-louis.bossart@linux.intel.com>
References: <20191025224122.7718-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 11/26] ASoC: SOF: Intel: HDA: use macro for
	register polling retry count
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

Define macro and use it for the register polling retry count.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c | 6 ++----
 sound/soc/sof/intel/hda.h     | 1 +
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 74805a066183..936361bd25e9 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -323,12 +323,11 @@ int hda_dsp_set_power_state(struct snd_sof_dev *sdev,
 			    enum sof_d0_substate d0_substate)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
-	int retry = 50;
 	int ret;
 	u8 value;
 
 	/* Write to D0I3C after Command-In-Progress bit is cleared */
-	ret = hda_dsp_wait_d0i3c_done(sdev, retry);
+	ret = hda_dsp_wait_d0i3c_done(sdev, HDA_DSP_REG_POLL_RETRY_COUNT);
 	if (ret < 0) {
 		dev_err(bus->dev, "CIP timeout before D0I3C update!\n");
 		return ret;
@@ -339,8 +338,7 @@ int hda_dsp_set_power_state(struct snd_sof_dev *sdev,
 	snd_hdac_chip_updateb(bus, VS_D0I3C, SOF_HDA_VS_D0I3C_I3, value);
 
 	/* Wait for cmd in progress to be cleared before exiting the function */
-	retry = 50;
-	ret = hda_dsp_wait_d0i3c_done(sdev, retry);
+	ret = hda_dsp_wait_d0i3c_done(sdev, HDA_DSP_REG_POLL_RETRY_COUNT);
 	if (ret < 0) {
 		dev_err(bus->dev, "CIP timeout after D0I3C update!\n");
 		return ret;
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 0e7c366b8f71..99ec60218c16 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -214,6 +214,7 @@
 #define HDA_DSP_CTRL_RESET_TIMEOUT		100
 #define HDA_DSP_WAIT_TIMEOUT		500	/* 500 msec */
 #define HDA_DSP_REG_POLL_INTERVAL_US		500	/* 0.5 msec */
+#define HDA_DSP_REG_POLL_RETRY_COUNT		50
 
 #define HDA_DSP_ADSPIC_IPC			1
 #define HDA_DSP_ADSPIS_IPC			1
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
