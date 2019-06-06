Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4069537F93
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 23:29:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 786CB1607;
	Thu,  6 Jun 2019 23:28:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 786CB1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559856556;
	bh=AGCDXFUE9aoxgDwzl/aa/D+NmKqvS0MYB6Arr6yJSbI=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=r0LGR7sy8QabibsI0MpYKBSUWfX4Th+MHVaXu3d+8VpKW/5PbO4KyYht5l8OXyPcJ
	 P/b088GpYwj5iVZlUmxjhK7qOJnisT8FyU+RzFTvI4TWdQWUukgNT5wrDcE3OFV9BC
	 60DhlknZTaPJIvEpok03d1JrkCdk5CxkrdsPYHx8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7F44F8974F;
	Thu,  6 Jun 2019 23:26:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB619F89744; Thu,  6 Jun 2019 23:26:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E027BF8072A
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:25:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E027BF8072A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="FefpjuQl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=lZo4Mn7VYejy94fsgZWU46d0sBpBd6XKku+WfRNlGVw=; b=FefpjuQl8gYp
 mpePVe8pl0LAzo1H3KnP35zNLQZCqpGIiJBgcrFMZt17PmREIMSO+Vv3o1+tbTVJr5yIM/D1mcZ8P
 SrPO8k9cd85qgbz4QKyX1+tyqT/u/BIWeQgsa3r56L9keLccJ0/TY6EEwDklOSLHphYIhLRNIMqWb
 TUiWs=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYztV-0007Gu-68; Thu, 06 Jun 2019 21:25:57 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id A8D89440049; Thu,  6 Jun 2019 22:25:56 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87muive4r8.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212556.A8D89440049@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:25:56 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: Intel: sof_rt5682: use modern dai_link
	style" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: Intel: sof_rt5682: use modern dai_link style

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From e1684073ef2142c241375487b1e158abe169ce61 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:22:14 +0900
Subject: [PATCH] ASoC: Intel: sof_rt5682: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/sof_rt5682.c | 57 +++++++++++++++++------------
 1 file changed, 34 insertions(+), 23 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 355fd9730a44..e2e5f97d9920 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -331,12 +331,15 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 							  int hdmi_num)
 {
 	struct snd_soc_dai_link_component *idisp_components;
+	struct snd_soc_dai_link_component *cpus;
 	struct snd_soc_dai_link *links;
 	int i, id = 0;
 
 	links = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link) *
 			     sof_audio_card_rt5682.num_links, GFP_KERNEL);
-	if (!links)
+	cpus = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link_component) *
+			     sof_audio_card_rt5682.num_links, GFP_KERNEL);
+	if (!links || !cpus)
 		goto devm_err;
 
 	/* codec SSP */
@@ -356,11 +359,13 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 	links[id].dpcm_playback = 1;
 	links[id].dpcm_capture = 1;
 	links[id].no_pcm = 1;
+	links[id].cpus = &cpus[id];
+	links[id].num_cpus = 1;
 	if (is_legacy_cpu) {
-		links[id].cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL,
-							"ssp%d-port",
-							ssp_codec);
-		if (!links[id].cpu_dai_name)
+		links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
+							  "ssp%d-port",
+							  ssp_codec);
+		if (!links[id].cpus->dai_name)
 			goto devm_err;
 	} else {
 		/*
@@ -373,10 +378,10 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		 * It can be removed once we can control MCLK by driver.
 		 */
 		links[id].ignore_pmdown_time = 1;
-		links[id].cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL,
-							"SSP%d Pin",
-							ssp_codec);
-		if (!links[id].cpu_dai_name)
+		links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
+							  "SSP%d Pin",
+							  ssp_codec);
+		if (!links[id].cpus->dai_name)
 			goto devm_err;
 	}
 	id++;
@@ -389,9 +394,11 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 			goto devm_err;
 
 		links[id].id = id;
-		links[id].cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL,
-							"DMIC%02d Pin", i);
-		if (!links[id].cpu_dai_name)
+		links[id].cpus = &cpus[id];
+		links[id].num_cpus = 1;
+		links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
+							  "DMIC%02d Pin", i);
+		if (!links[id].cpus->dai_name)
 			goto devm_err;
 
 		links[id].codecs = dmic_component;
@@ -419,9 +426,11 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 			goto devm_err;
 
 		links[id].id = id;
-		links[id].cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL,
-							"iDisp%d Pin", i);
-		if (!links[id].cpu_dai_name)
+		links[id].cpus = &cpus[id];
+		links[id].num_cpus = 1;
+		links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
+							  "iDisp%d Pin", i);
+		if (!links[id].cpus->dai_name)
 			goto devm_err;
 
 		idisp_components[i - 1].name = "ehdaudio0D2";
@@ -458,18 +467,20 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].nonatomic = true;
 		links[id].dpcm_playback = 1;
 		links[id].no_pcm = 1;
+		links[id].cpus = &cpus[id];
+		links[id].num_cpus = 1;
 		if (is_legacy_cpu) {
-			links[id].cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL,
-								"ssp%d-port",
-								ssp_amp);
-			if (!links[id].cpu_dai_name)
+			links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
+								  "ssp%d-port",
+								  ssp_amp);
+			if (!links[id].cpus->dai_name)
 				goto devm_err;
 
 		} else {
-			links[id].cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL,
-								"SSP%d Pin",
-								ssp_amp);
-			if (!links[id].cpu_dai_name)
+			links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
+								  "SSP%d Pin",
+								  ssp_amp);
+			if (!links[id].cpus->dai_name)
 				goto devm_err;
 		}
 	}
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
