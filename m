Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F2642D7D
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 19:29:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3867417D3;
	Wed, 12 Jun 2019 19:28:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3867417D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560360580;
	bh=X1eE7wDFG5F7LDDogCzPo3oQThkM5lMVN4VEQvJe+3M=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=piqlrjl9BZA2dnAc/h5FRetauRSeGWyK3DYBEjDN7TcgCn0SayvrNKIZW1oCmp2jD
	 RkqfAjL/4lvvH96Oc7fjqEr8Juc3Agyn7N8Ir7PjASGKhniFYfvN2k3dAloQjRJmA7
	 IwUcsi2f04jr+HbmQmBYEXj4Fe351DsDU+8TKaFs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EBF2F89744;
	Wed, 12 Jun 2019 19:24:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7AAEF8973F; Wed, 12 Jun 2019 19:24:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E7DEF89734
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 19:24:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E7DEF89734
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jun 2019 10:23:57 -0700
X-ExtLoop1: 1
Received: from adorrell-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.133.122])
 by fmsmga008.fm.intel.com with ESMTP; 12 Jun 2019 10:23:57 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 12 Jun 2019 12:23:42 -0500
Message-Id: <20190612172347.22338-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612172347.22338-1-pierre-louis.bossart@linux.intel.com>
References: <20190612172347.22338-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Zhu Yingjiang <yingjiang.zhu@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 10/15] ASoC: SOF: Intel: hda: use the SOF
	defined ppcap functions
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

From: Zhu Yingjiang <yingjiang.zhu@linux.intel.com>

Unify ppcap function setup by using SOF common functions
for both HDA and non-HDA cases.

Signed-off-by: Zhu Yingjiang <yingjiang.zhu@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index c6eea3079ab7..883134d535b3 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -307,18 +307,14 @@ static int hda_suspend(struct snd_sof_dev *sdev, int state)
 		return ret;
 	}
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 	/* disable ppcap interrupt */
-	snd_hdac_ext_bus_ppcap_int_enable(bus, false);
-	snd_hdac_ext_bus_ppcap_enable(bus, false);
+	hda_dsp_ctrl_ppcap_enable(sdev, false);
+	hda_dsp_ctrl_ppcap_int_enable(sdev, false);
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 	/* disable hda bus irq and i/o */
 	snd_hdac_bus_stop_chip(bus);
 #else
-	/* disable ppcap interrupt */
-	hda_dsp_ctrl_ppcap_enable(sdev, false);
-	hda_dsp_ctrl_ppcap_int_enable(sdev, false);
-
 	/* disable hda bus irq */
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, SOF_HDA_INTCTL,
 				SOF_HDA_INT_CTRL_EN | SOF_HDA_INT_GLOBAL_EN,
@@ -370,10 +366,6 @@ static int hda_resume(struct snd_sof_dev *sdev)
 		bus->io_ops->reg_writel(0, hlink->ml_addr + AZX_REG_ML_LOSIDV);
 
 	hda_dsp_ctrl_misc_clock_gating(sdev, true);
-
-	/* enable ppcap interrupt */
-	snd_hdac_ext_bus_ppcap_enable(bus, true);
-	snd_hdac_ext_bus_ppcap_int_enable(bus, true);
 #else
 
 	hda_dsp_ctrl_misc_clock_gating(sdev, false);
@@ -400,11 +392,11 @@ static int hda_resume(struct snd_sof_dev *sdev)
 				SOF_HDA_INT_CTRL_EN | SOF_HDA_INT_GLOBAL_EN);
 
 	hda_dsp_ctrl_misc_clock_gating(sdev, true);
+#endif
 
 	/* enable ppcap interrupt */
 	hda_dsp_ctrl_ppcap_enable(sdev, true);
 	hda_dsp_ctrl_ppcap_int_enable(sdev, true);
-#endif
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 	/* turn off the links that were off before suspend */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
