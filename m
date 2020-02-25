Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B93AF16F523
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2020 02:39:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57BE81671;
	Wed, 26 Feb 2020 02:38:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57BE81671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582681170;
	bh=eY4w8dI89IUyQHePB4G7Eg7A3dFEQP7UUh29ktLNjic=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rgk2eTCjwnzjKH2E44mahvt8fUXur7zSaZEHEWUWJyC9o41Zk71CE5/25Nzc6DHil
	 jbemav2Bu7dXAERZkYne+dwc+He9S4iA3mAGE8UHRxLXzmgb2cfOL0qFWRiCuvHC0o
	 LI9PovjbikEZ+N7k+XWmst9d8hZ8d1N0HBpZ4y4c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F06AAF802A1;
	Wed, 26 Feb 2020 02:35:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8056F80278; Wed, 26 Feb 2020 02:35:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CC12F8025E
 for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2020 02:35:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CC12F8025E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Feb 2020 17:35:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,486,1574150400"; d="scan'208";a="436460995"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga005.fm.intel.com with ESMTP; 25 Feb 2020 17:35:16 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH v5 4/6] ASoC: Add multiple CPU DAI support in DAPM
Date: Tue, 25 Feb 2020 21:39:15 +0800
Message-Id: <20200225133917.21314-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200225133917.21314-1-yung-chuan.liao@linux.intel.com>
References: <20200225133917.21314-1-yung-chuan.liao@linux.intel.com>
Cc: liam.r.girdwood@linux.intel.com, alsa-devel@alsa-project.org,
 bard.liao@intel.com, pierre-louis.bossart@linux.intel.com,
 kuninori.morimoto.gx@renesas.com
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

From: Shreyas NC <shreyas.nc@intel.com>

DAPM handles DAIs during soc_dapm_stream_event() and during addition
and creation of DAI widgets i.e., dapm_add_valid_dai_widget() and
dapm_connect_dai_link_widgets().

Extend these functions to handle multiple cpu dai.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Shreyas NC <shreyas.nc@intel.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/soc-dapm.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 539a1eaebeac..6ce024d52170 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4361,9 +4361,19 @@ static void dapm_connect_dai_link_widgets(struct snd_soc_card *card,
 	struct snd_soc_dai *codec_dai;
 	int i;
 
-	for_each_rtd_codec_dai(rtd, i, codec_dai)
-		dapm_add_valid_dai_widget(card, rtd,
-					  codec_dai, rtd->cpu_dais[0]);
+	if (rtd->num_cpus == 1) {
+		for_each_rtd_codec_dai(rtd, i, codec_dai)
+			dapm_add_valid_dai_widget(card, rtd, codec_dai,
+						  rtd->cpu_dais[0]);
+	} else if (rtd->num_codecs == rtd->num_cpus) {
+		for_each_rtd_codec_dai(rtd, i, codec_dai)
+			dapm_add_valid_dai_widget(card, rtd, codec_dai,
+						  rtd->cpu_dais[i]);
+	} else {
+		dev_err(card->dev,
+			"N cpus to M codecs link is not supported yet\n");
+	}
+
 }
 
 static void soc_dapm_dai_stream_event(struct snd_soc_dai *dai, int stream,
@@ -4424,9 +4434,11 @@ static void soc_dapm_stream_event(struct snd_soc_pcm_runtime *rtd, int stream,
 	int event)
 {
 	struct snd_soc_dai *codec_dai;
+	struct snd_soc_dai *cpu_dai;
 	int i;
 
-	soc_dapm_dai_stream_event(rtd->cpu_dai, stream, event);
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai)
+		soc_dapm_dai_stream_event(rtd->cpu_dai, stream, event);
 	for_each_rtd_codec_dai(rtd, i, codec_dai)
 		soc_dapm_dai_stream_event(codec_dai, stream, event);
 
-- 
2.17.1

