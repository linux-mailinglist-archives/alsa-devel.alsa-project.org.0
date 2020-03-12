Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C9B183A4B
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 21:08:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAF6D1770;
	Thu, 12 Mar 2020 21:07:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAF6D1770
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584043707;
	bh=T8ytAn550ucyBqQ7BMd2CqIvkRUlFqT6lzS9shxKK2U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XR2/ywRYe1fV9aXH6ZwsPY5TIzVNCinS6Fr83x1YDuUXI1zlE8qc7W6qUEVPsQs91
	 Bo3/OwfJ6+WHvmMOsoPP1IF1lj9HLNoepTinj/gdq7Zd84JU8jLe4DGh4WXd5dqINU
	 L8QLAtJz/XOFpv7HXnEOhssxY8Om1Hs1SsEHGGac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3E4BF801D9;
	Thu, 12 Mar 2020 21:06:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 918ADF8026F; Thu, 12 Mar 2020 21:06:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C589F800BE
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 21:06:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C589F800BE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2020 13:06:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,545,1574150400"; d="scan'208";a="444063049"
Received: from unknown (HELO pbossart-mobl3.amr.corp.intel.com)
 ([10.251.241.169])
 by fmsmga006.fm.intel.com with ESMTP; 12 Mar 2020 13:06:33 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/6] ASoC: SOF: Intel: hda-dai: add stream capability
Date: Thu, 12 Mar 2020 15:06:17 -0500
Message-Id: <20200312200622.24477-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312200622.24477-1-pierre-louis.bossart@linux.intel.com>
References: <20200312200622.24477-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre Bossart <pierre-louis.bossart@linux.intel.com>, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

snd_soc_dai_stream_valid() will check if the stream is valid by testing
stream->channels_min. So we do need the information in dai driver.

The stream name is not added since we want to sure
playback_widget/capture_widget will be created by topology.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 96 +++++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index ed5e7d2c0d43..b9e3ce65e778 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -422,56 +422,152 @@ static struct snd_soc_cdai_ops sof_probe_compr_ops = {
 struct snd_soc_dai_driver skl_dai[] = {
 {
 	.name = "SSP0 Pin",
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
 },
 {
 	.name = "SSP1 Pin",
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
 },
 {
 	.name = "SSP2 Pin",
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
 },
 {
 	.name = "SSP3 Pin",
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
 },
 {
 	.name = "SSP4 Pin",
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
 },
 {
 	.name = "SSP5 Pin",
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
 },
 {
 	.name = "DMIC01 Pin",
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 4,
+	},
 },
 {
 	.name = "DMIC16k Pin",
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 4,
+	},
 },
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 {
 	.name = "iDisp1 Pin",
 	.ops = &hda_link_dai_ops,
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
 },
 {
 	.name = "iDisp2 Pin",
 	.ops = &hda_link_dai_ops,
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
 },
 {
 	.name = "iDisp3 Pin",
 	.ops = &hda_link_dai_ops,
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
 },
 {
 	.name = "iDisp4 Pin",
 	.ops = &hda_link_dai_ops,
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
 },
 {
 	.name = "Analog CPU DAI",
 	.ops = &hda_link_dai_ops,
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 16,
+	},
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 16,
+	},
 },
 {
 	.name = "Digital CPU DAI",
 	.ops = &hda_link_dai_ops,
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 16,
+	},
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 16,
+	},
 },
 {
 	.name = "Alt Analog CPU DAI",
 	.ops = &hda_link_dai_ops,
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 16,
+	},
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 16,
+	},
 },
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_PROBES)
 {
-- 
2.20.1

