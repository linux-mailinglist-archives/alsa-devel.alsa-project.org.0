Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC001E3020
	for <lists+alsa-devel@lfdr.de>; Tue, 26 May 2020 22:39:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B472A170A;
	Tue, 26 May 2020 22:38:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B472A170A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590525581;
	bh=CeNo+MJjcqRa6VK7vE4l5MaIgpmkRUK1jLqUgS+RPfQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PHl3Oa8y2r1oZjQGJBGo+S9ZIWDfcTNxOBlV0FIN042EFA4hr1pJh5FMjyiFK+Lyc
	 FaE65u4K8R/vEQ5e2xOVaqebXVAta1D3aRcojjHsuanySnKZRioSXrHngNMm5HrmX4
	 x0oqsbiJ3071ELRVS1MsoMi6fFKUI/YAkILcHdVw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEA99F8015D;
	Tue, 26 May 2020 22:37:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5B4EF80299; Tue, 26 May 2020 22:37:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05480F80150
 for <alsa-devel@alsa-project.org>; Tue, 26 May 2020 22:36:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05480F80150
IronPort-SDR: Z/aWCagyNm98nlwgxu2tK3d8x7wQabd7n9cFEotS1XgxIQJERJgPJK52Boq/tOzCKMXN+pF4fF
 bUzsiol/J2dw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2020 13:36:49 -0700
IronPort-SDR: o2pRXH+3HLm+tw4JisqTGc3rzAhBoGBW5qVUVyiwKbE2v7cuJw7uudWLus8WbYJ5JXRvx9w6eC
 0CIutSohS5Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,437,1583222400"; d="scan'208";a="270208877"
Received: from lfnguyen-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.229.61])
 by orsmga006.jf.intel.com with ESMTP; 26 May 2020 13:36:48 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/8] ASoC: Intel: bytcr_rt5640/51: remove .ignore_suspend
Date: Tue, 26 May 2020 15:36:35 -0500
Message-Id: <20200526203640.25980-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200526203640.25980-1-pierre-louis.bossart@linux.intel.com>
References: <20200526203640.25980-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

Low-power playback was never enabled on Baytrail devices, remove what
looks like copy/paste from other machine drivers which were never
submitted upstream.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 4 ----
 sound/soc/intel/boards/bytcr_rt5651.c | 3 ---
 2 files changed, 7 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index fbfd53874b47..d7e42bd9b308 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -910,9 +910,6 @@ static int byt_rt5640_init(struct snd_soc_pcm_runtime *runtime)
 	if (ret)
 		return ret;
 
-	snd_soc_dapm_ignore_suspend(&card->dapm, "Headphone");
-	snd_soc_dapm_ignore_suspend(&card->dapm, "Speaker");
-
 	if (byt_rt5640_quirk & BYT_RT5640_MCLK_EN) {
 		/*
 		 * The firmware might enable the clock at
@@ -1065,7 +1062,6 @@ static struct snd_soc_dai_link byt_rt5640_dais[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 						| SND_SOC_DAIFMT_CBS_CFS,
 		.be_hw_params_fixup = byt_rt5640_codec_fixup,
-		.ignore_suspend = 1,
 		.nonatomic = true,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index 214ef41e23e6..0468fc35445f 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -601,8 +601,6 @@ static int byt_rt5651_init(struct snd_soc_pcm_runtime *runtime)
 		dev_err(card->dev, "unable to add card controls\n");
 		return ret;
 	}
-	snd_soc_dapm_ignore_suspend(&card->dapm, "Headphone");
-	snd_soc_dapm_ignore_suspend(&card->dapm, "Speaker");
 
 	if (byt_rt5651_quirk & BYT_RT5651_MCLK_EN) {
 		/*
@@ -775,7 +773,6 @@ static struct snd_soc_dai_link byt_rt5651_dais[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 						| SND_SOC_DAIFMT_CBS_CFS,
 		.be_hw_params_fixup = byt_rt5651_codec_fixup,
-		.ignore_suspend = 1,
 		.nonatomic = true,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
-- 
2.20.1

