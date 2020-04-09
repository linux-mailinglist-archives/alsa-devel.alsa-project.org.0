Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC601A3A1D
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Apr 2020 21:01:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B249016A8;
	Thu,  9 Apr 2020 21:00:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B249016A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586458867;
	bh=nOx1ZATjM67MRIGj3/92/hb9FC3ACcVxqh5urHh46Mw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eJK8FWZgktettg4N1Rrs07BSjWP/xRL3FZ9u3Dx1zLfVt4JsF+b83grdMlUjP9gRJ
	 z8k17tdNfuQLtq1cR8UskBTWstmJZrdSP5Lpcxeb/BMAldjC74xmoEYpCpxcUoyjtC
	 CW1O8/6Z6ca1p025vwZ0kGiWXBArUYwRDT+OyASY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63F59F8028F;
	Thu,  9 Apr 2020 20:58:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19F67F80216; Thu,  9 Apr 2020 20:58:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CEF7F800CB
 for <alsa-devel@alsa-project.org>; Thu,  9 Apr 2020 20:58:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CEF7F800CB
IronPort-SDR: vezmbUl2gBauSq5Gef/LlYzKVkUpB34wEpFCAvxXzVObB9AMI9AwcfwXqyqbGkPbyhwUspoENz
 1ITzIwhQXjKQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2020 11:58:33 -0700
IronPort-SDR: YqZAexbdJwaJXCsQVpwxsL/UVus+w0Y5p/wygddB5RPCbMJ8jb8vupre+HaJFA1nP7f5uZLgp7
 5L31JUh8WbcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; d="scan'208";a="255248803"
Received: from davidadu-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.151.218])
 by orsmga006.jf.intel.com with ESMTP; 09 Apr 2020 11:58:32 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 01/13] ASoC: Intel: sof_da7219_max98373: Add BE dailink for
 dmic16k
Date: Thu,  9 Apr 2020 13:58:15 -0500
Message-Id: <20200409185827.16255-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409185827.16255-1-pierre-louis.bossart@linux.intel.com>
References: <20200409185827.16255-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Yong Zhi <yong.zhi@intel.com>
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

From: Yong Zhi <yong.zhi@intel.com>

Add dmic16k BE dailink for keyword detection support, FE is
added in topology tplg file.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_da7219_max98373.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/intel/boards/sof_da7219_max98373.c b/sound/soc/intel/boards/sof_da7219_max98373.c
index b707dd3b5625..8b5b74ba349f 100644
--- a/sound/soc/intel/boards/sof_da7219_max98373.c
+++ b/sound/soc/intel/boards/sof_da7219_max98373.c
@@ -265,6 +265,9 @@ SND_SOC_DAILINK_DEF(dmic_pin,
 SND_SOC_DAILINK_DEF(dmic_codec,
 	DAILINK_COMP_ARRAY(COMP_CODEC("dmic-codec", "dmic-hifi")));
 
+SND_SOC_DAILINK_DEF(dmic16k_pin,
+	DAILINK_COMP_ARRAY(COMP_CPU("DMIC16k Pin")));
+
 SND_SOC_DAILINK_DEF(idisp1_pin,
 	DAILINK_COMP_ARRAY(COMP_CPU("iDisp1 Pin")));
 SND_SOC_DAILINK_DEF(idisp1_codec,
@@ -337,6 +340,14 @@ static struct snd_soc_dai_link dais[] = {
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
+	{
+		.name = "dmic16k",
+		.id = 6,
+		.ignore_suspend = 1,
+		.dpcm_capture = 1,
+		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(dmic16k_pin, dmic_codec, platform),
+	}
 };
 
 static struct snd_soc_card card_da7219_m98373 = {
-- 
2.20.1

