Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CAD184C74
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 17:26:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D41A184B;
	Fri, 13 Mar 2020 17:25:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D41A184B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584116804;
	bh=SopXVLCjaUKo7eqgQucD4GVV8aGHjGOvu5M30hnJUB0=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=k28Fct0I47m4gyDwg1P5uHDzOuALZNfJI+Cf0ZCTMYKEKUUYsvEJfpqjrGVFx1OL3
	 Dc/DFgoJSLjXP4UP1vyauKhCul31breAJufnyzW621e1MfxeUikRiFOL2wdc/GYU88
	 G+Nzh3Uz39zXNQP4BaNmcTfJbosifimARUQ7dqD4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFDB2F8032A;
	Fri, 13 Mar 2020 17:19:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9812EF802F8; Fri, 13 Mar 2020 17:18:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id CACB2F802EC
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 17:18:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CACB2F802EC
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBFB2FEC;
 Fri, 13 Mar 2020 09:18:10 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6111C3F6CF;
 Fri, 13 Mar 2020 09:18:10 -0700 (PDT)
Date: Fri, 13 Mar 2020 16:18:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Applied "ASoC: SOF: topology: connect dai widget to all cpu-dais" to
 the asoc tree
In-Reply-To: <20200312200622.24477-7-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200312200622.24477-7-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
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

The patch

   ASoC: SOF: topology: connect dai widget to all cpu-dais

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

From c59aca98c912e570e907b448d4f1b1b49ef9572e Mon Sep 17 00:00:00 2001
From: Bard Liao <yung-chuan.liao@linux.intel.com>
Date: Thu, 12 Mar 2020 15:06:22 -0500
Subject: [PATCH] ASoC: SOF: topology: connect dai widget to all cpu-dais

Extend code from single cpu-dai to multi-dai

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200312200622.24477-7-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/topology.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 9f4f8868b386..058de94fb8cf 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1240,6 +1240,8 @@ static int sof_connect_dai_widget(struct snd_soc_component *scomp,
 {
 	struct snd_soc_card *card = scomp->card;
 	struct snd_soc_pcm_runtime *rtd;
+	struct snd_soc_dai *cpu_dai;
+	int i;
 
 	list_for_each_entry(rtd, &card->rtd_list, list) {
 		dev_vdbg(scomp->dev, "tplg: check widget: %s stream: %s dai stream: %s\n",
@@ -1254,13 +1256,15 @@ static int sof_connect_dai_widget(struct snd_soc_component *scomp,
 
 		switch (w->id) {
 		case snd_soc_dapm_dai_out:
-			rtd->cpu_dai->capture_widget = w;
+			for_each_rtd_cpu_dais(rtd, i, cpu_dai)
+				cpu_dai->capture_widget = w;
 			dai->name = rtd->dai_link->name;
 			dev_dbg(scomp->dev, "tplg: connected widget %s -> DAI link %s\n",
 				w->name, rtd->dai_link->name);
 			break;
 		case snd_soc_dapm_dai_in:
-			rtd->cpu_dai->playback_widget = w;
+			for_each_rtd_cpu_dais(rtd, i, cpu_dai)
+				cpu_dai->playback_widget = w;
 			dai->name = rtd->dai_link->name;
 			dev_dbg(scomp->dev, "tplg: connected widget %s -> DAI link %s\n",
 				w->name, rtd->dai_link->name);
-- 
2.20.1

