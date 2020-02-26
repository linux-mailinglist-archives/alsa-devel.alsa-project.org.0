Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AA3170816
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2020 19:54:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC553166A;
	Wed, 26 Feb 2020 19:53:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC553166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582743250;
	bh=ujsHoetCb26dRu7uV+O4lGWnUXe3BuajfXc+9KCl8Xs=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=sl4rZpT83BvyQMfXY5lF0FHUEHDHtIzrFHN93fkaqpvAIhSOr9n1tzusZguLHVPqP
	 B8o/Wkx9iJdzBxhxLUFN6nJN9QKGxvFU3v+l29yF31MVNIaJGe2C4clFp1QRMqZJ2V
	 BKj6PpJrZ8OH1bCImxXVuHVqocpyjbG04vdyRWPY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BECBF802F7;
	Wed, 26 Feb 2020 19:48:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 055B0F802E7; Wed, 26 Feb 2020 19:47:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 03140F802DB
 for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2020 19:47:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03140F802DB
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBA7B31B;
 Wed, 26 Feb 2020 10:47:52 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 435773F881;
 Wed, 26 Feb 2020 10:47:52 -0800 (PST)
Date: Wed, 26 Feb 2020 18:47:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Shreyas NC <shreyas.nc@intel.com>
Subject: Applied "ASoC: Add multiple CPU DAI support in DAPM" to the asoc tree
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
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

The patch

   ASoC: Add multiple CPU DAI support in DAPM

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From de6214a33633d8ce1c1490336f8e798e75ccd004 Mon Sep 17 00:00:00 2001
From: Shreyas NC <shreyas.nc@intel.com>
Date: Tue, 25 Feb 2020 21:39:15 +0800
Subject: [PATCH] ASoC: Add multiple CPU DAI support in DAPM

DAPM handles DAIs during soc_dapm_stream_event() and during addition
and creation of DAI widgets i.e., dapm_add_valid_dai_widget() and
dapm_connect_dai_link_widgets().

Extend these functions to handle multiple cpu dai.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Shreyas NC <shreyas.nc@intel.com>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Link: https://lore.kernel.org/r/20200225133917.21314-5-yung-chuan.liao@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
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
2.20.1

