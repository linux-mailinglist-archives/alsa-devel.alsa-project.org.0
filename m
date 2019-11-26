Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F29EC10A07C
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Nov 2019 15:39:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8804E1763;
	Tue, 26 Nov 2019 15:38:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8804E1763
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574779166;
	bh=5LxiwrQbGymUPDe0dmxTk9zynzYKeqWjt+vIFyR1ge4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pt4aXcaY2qWvNygjZFomixbJf/2R23GCGMzIUXBhoa1Fa6dVxCAV6WKT4LayVb8Cv
	 6+WRNhmwmoWwjZY+fAF2gqLcJ5rg9ez0uzWJbOo30ipzuOx027B7CMBOK7JqNnqn2w
	 Jp6hH6Kj/eWij/MZeTeWlFsVDA8lIy0sWecIJ+qo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EE98F80216;
	Tue, 26 Nov 2019 15:32:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5932AF8020D; Tue, 26 Nov 2019 15:32:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FF77F801F2
 for <alsa-devel@alsa-project.org>; Tue, 26 Nov 2019 15:32:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FF77F801F2
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Nov 2019 06:32:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,246,1571727600"; d="scan'208";a="409995308"
Received: from vramali2-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.155.193])
 by fmsmga006.fm.intel.com with ESMTP; 26 Nov 2019 06:32:09 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 26 Nov 2019 08:32:04 -0600
Message-Id: <20191126143205.21987-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191126143205.21987-1-pierre-louis.bossart@linux.intel.com>
References: <20191126143205.21987-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, Jairaj Arava <jairaj.arava@intel.com>, broonie@kernel.org,
 Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 2/3] ASoC: intel: sof_rt5682: Add support for
	tgl-max98357a-rt5682
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

This patch adds the driver data and updates quirk info
for tgl with max98357a speaker amp and ALC5682 headset codec.

Signed-off-by: Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>
Signed-off-by: Jairaj Arava <jairaj.arava@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 57adadacbf43..ad8a2b4bc709 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -598,6 +598,9 @@ static int sof_audio_probe(struct platform_device *pdev)
 	if (!ctx)
 		return -ENOMEM;
 
+	if (pdev->id_entry && pdev->id_entry->driver_data)
+		sof_rt5682_quirk = (unsigned long)pdev->id_entry->driver_data;
+
 	dmi_check_system(sof_rt5682_quirk_table);
 
 	if (soc_intel_is_byt() || soc_intel_is_cht()) {
@@ -691,6 +694,21 @@ static int sof_rt5682_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct platform_device_id board_ids[] = {
+	{
+		.name = "sof_rt5682",
+	},
+	{
+		.name = "tgl_max98357a_rt5682",
+		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_SSP_CODEC(0) |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_RT5682_SSP_AMP(1) |
+					SOF_RT5682_NUM_HDMIDEV(4)),
+	},
+	{ }
+};
+
 static struct platform_driver sof_audio = {
 	.probe = sof_audio_probe,
 	.remove = sof_rt5682_remove,
@@ -698,6 +716,7 @@ static struct platform_driver sof_audio = {
 		.name = "sof_rt5682",
 		.pm = &snd_soc_pm_ops,
 	},
+	.id_table = board_ids,
 };
 module_platform_driver(sof_audio)
 
@@ -707,3 +726,4 @@ MODULE_AUTHOR("Bard Liao <bard.liao@intel.com>");
 MODULE_AUTHOR("Sathya Prakash M R <sathya.prakash.m.r@intel.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:sof_rt5682");
+MODULE_ALIAS("platform:tgl_max98357a_rt5682");
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
