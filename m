Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1457510A07B
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Nov 2019 15:38:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A06DB1739;
	Tue, 26 Nov 2019 15:37:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A06DB1739
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574779125;
	bh=NHQlxWl38xlE46ou7/feHuXfdP/TJl8wDw5YPQUIGTM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mL9EC/ZQR3A9VBzF4juVjh3rFkDNP+4On7Fp32m7lO8YQzK6Im7pEDCZa+duRKIFR
	 5VqN5kLcmn2HK2nh/Pbl/UTAOiCbZ5aXfecnraZLCHepglymvhl/3fCJP7Gqb1wBCU
	 BMxrrO2LQNCTKrsCJ1iGYKT1rO5dzgNVIMpPviuw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE9EEF801F5;
	Tue, 26 Nov 2019 15:32:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15852F80212; Tue, 26 Nov 2019 15:32:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97844F800DD
 for <alsa-devel@alsa-project.org>; Tue, 26 Nov 2019 15:32:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97844F800DD
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Nov 2019 06:32:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,246,1571727600"; d="scan'208";a="409995300"
Received: from vramali2-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.155.193])
 by fmsmga006.fm.intel.com with ESMTP; 26 Nov 2019 06:32:08 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 26 Nov 2019 08:32:03 -0600
Message-Id: <20191126143205.21987-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191126143205.21987-1-pierre-louis.bossart@linux.intel.com>
References: <20191126143205.21987-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, Jairaj Arava <jairaj.arava@intel.com>, broonie@kernel.org,
 Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 1/3] ASoC: intel: sof_rt5682: Add quirk for
	number of HDMI DAI's
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

From: Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>

TGL supports one more HDMI DAI than previous models.
So add quirk support for number of HDMI DAI's.

Signed-off-by: Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>
Signed-off-by: Jairaj Arava <jairaj.arava@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 751b8ea6ae1f..57adadacbf43 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -35,6 +35,10 @@
 #define SOF_RT5682_SSP_AMP(quirk)	\
 	(((quirk) << SOF_RT5682_SSP_AMP_SHIFT) & SOF_RT5682_SSP_AMP_MASK)
 #define SOF_RT5682_MCLK_BYTCHT_EN		BIT(9)
+#define SOF_RT5682_NUM_HDMIDEV_SHIFT		10
+#define SOF_RT5682_NUM_HDMIDEV_MASK		(GENMASK(12, 10))
+#define SOF_RT5682_NUM_HDMIDEV(quirk)	\
+	((quirk << SOF_RT5682_NUM_HDMIDEV_SHIFT) & SOF_RT5682_NUM_HDMIDEV_MASK)
 
 /* Default: MCLK on, MCLK 19.2M, SSP0  */
 static unsigned long sof_rt5682_quirk = SOF_RT5682_MCLK_EN |
@@ -594,6 +598,8 @@ static int sof_audio_probe(struct platform_device *pdev)
 	if (!ctx)
 		return -ENOMEM;
 
+	dmi_check_system(sof_rt5682_quirk_table);
+
 	if (soc_intel_is_byt() || soc_intel_is_cht()) {
 		is_legacy_cpu = 1;
 		dmic_be_num = 0;
@@ -604,11 +610,13 @@ static int sof_audio_probe(struct platform_device *pdev)
 						SOF_RT5682_SSP_CODEC(2);
 	} else {
 		dmic_be_num = 2;
-		hdmi_num = 3;
+		hdmi_num = (sof_rt5682_quirk & SOF_RT5682_NUM_HDMIDEV_MASK) >>
+			 SOF_RT5682_NUM_HDMIDEV_SHIFT;
+		/* default number of HDMI DAI's */
+		if (!hdmi_num)
+			hdmi_num = 3;
 	}
 
-	dmi_check_system(sof_rt5682_quirk_table);
-
 	/* need to get main clock from pmc */
 	if (sof_rt5682_quirk & SOF_RT5682_MCLK_BYTCHT_EN) {
 		ctx->mclk = devm_clk_get(&pdev->dev, "pmc_plt_clk_3");
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
