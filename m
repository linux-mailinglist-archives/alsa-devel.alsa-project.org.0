Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2258913AB14
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:29:30 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 094E824A3;
	Mon, 13 Jan 2020 22:11:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 094E824A3
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38893F802E2;
	Mon, 13 Jan 2020 22:05:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D07D5F80291; Mon, 13 Jan 2020 22:05:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3EF90F800B9
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 22:04:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EF90F800B9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2020 13:04:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,430,1571727600"; d="scan'208";a="213112671"
Received: from pboliset-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.152.72])
 by orsmga007.jf.intel.com with ESMTP; 13 Jan 2020 13:04:44 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 13 Jan 2020 15:04:15 -0600
Message-Id: <20200113210428.27457-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200113210428.27457-1-pierre-louis.bossart@linux.intel.com>
References: <20200113210428.27457-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 05/18] ASoC: Intel: kbl_da7219_max98357a:
	rename shadowed variable
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

Fix cppcheck warning:

[sound/soc/intel/boards/kbl_da7219_max98357a.c:257] ->
[sound/soc/intel/boards/kbl_da7219_max98357a.c:144]: (style) Local
variable 'channels' shadows outer variable

[sound/soc/intel/boards/kbl_da7219_max98357a.c:257] ->
[sound/soc/intel/boards/kbl_da7219_max98357a.c:308]: (style) Local
variable 'channels' shadows outer variable

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/kbl_da7219_max98357a.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/boards/kbl_da7219_max98357a.c b/sound/soc/intel/boards/kbl_da7219_max98357a.c
index 0d55319a0773..bc7f9a9ce9af 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98357a.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98357a.c
@@ -141,13 +141,13 @@ static int kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
 {
 	struct snd_interval *rate = hw_param_interval(params,
 			SNDRV_PCM_HW_PARAM_RATE);
-	struct snd_interval *channels = hw_param_interval(params,
+	struct snd_interval *chan = hw_param_interval(params,
 			SNDRV_PCM_HW_PARAM_CHANNELS);
 	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
 
 	/* The ADSP will convert the FE rate to 48k, stereo */
 	rate->min = rate->max = 48000;
-	channels->min = channels->max = DUAL_CHANNEL;
+	chan->min = chan->max = DUAL_CHANNEL;
 
 	/* set SSP to 24 bit */
 	snd_mask_none(fmt);
@@ -305,7 +305,7 @@ static const struct snd_soc_ops kabylake_da7219_fe_ops = {
 static int kabylake_dmic_fixup(struct snd_soc_pcm_runtime *rtd,
 		struct snd_pcm_hw_params *params)
 {
-	struct snd_interval *channels = hw_param_interval(params,
+	struct snd_interval *chan = hw_param_interval(params,
 				SNDRV_PCM_HW_PARAM_CHANNELS);
 
 	/*
@@ -313,9 +313,9 @@ static int kabylake_dmic_fixup(struct snd_soc_pcm_runtime *rtd,
 	 */
 
 	if (params_channels(params) == 2)
-		channels->min = channels->max = 2;
+		chan->min = chan->max = 2;
 	else
-		channels->min = channels->max = 4;
+		chan->min = chan->max = 4;
 
 	return 0;
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
