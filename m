Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2462195A41
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 16:49:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88CA6166E;
	Fri, 27 Mar 2020 16:48:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88CA6166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585324165;
	bh=mcvQodYlJa/4szEazk/qI8HhlRWwKVtdwB7Y1xC/YKM=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Uk20gXDhv9w2JoAiWZy9zZxlumLsm+0dm/lgxot1usgEWxSIe9MGbEDuxiDNUE9lp
	 5xnYAIdihigwxwTIzRz5JVZe16d+1Dw6oyrOZWAlnt4KeTN2X1OXd9B1ueFa6MsYCJ
	 B94zIWPsED+JZh0O9MNnSI+U/GoexgUVFbDUgyY8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87D35F8037F;
	Fri, 27 Mar 2020 16:35:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CAFC9F80371; Fri, 27 Mar 2020 16:35:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id DEC1EF8037E
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 16:35:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEC1EF8037E
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BAB231B;
 Fri, 27 Mar 2020 08:35:15 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 933013F71F;
 Fri, 27 Mar 2020 08:35:14 -0700 (PDT)
Date: Fri, 27 Mar 2020 15:35:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: sof: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro
 for DAI pointer" to the asoc tree
In-Reply-To: <87d093ir4q.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87d093ir4q.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

   ASoC: sof: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer

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

From be3e8de706b9219c0074eb780400a167ed7633e3 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 23 Mar 2020 14:20:37 +0900
Subject: [PATCH] ASoC: sof: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro
 for DAI pointer

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/87d093ir4q.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-dai.c | 6 +++---
 sound/soc/sof/intel/hda-dsp.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index b9e3ce65e778..833dc303b394 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -204,7 +204,7 @@ static int hda_link_hw_params(struct snd_pcm_substream *substream,
 	struct hdac_bus *bus = hstream->bus;
 	struct hdac_ext_stream *link_dev;
 	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	struct sof_intel_hda_stream *hda_stream;
 	struct hda_pipe_params p_params = {0};
 	struct hdac_ext_link *link;
@@ -293,7 +293,7 @@ static int hda_link_pcm_trigger(struct snd_pcm_substream *substream,
 	bus = hstream->bus;
 	rtd = snd_pcm_substream_chip(substream);
 
-	link = snd_hdac_ext_bus_get_link(bus, rtd->codec_dai->component->name);
+	link = snd_hdac_ext_bus_get_link(bus, asoc_rtd_to_codec(rtd, 0)->component->name);
 	if (!link)
 		return -EINVAL;
 
@@ -374,7 +374,7 @@ static int hda_link_hw_free(struct snd_pcm_substream *substream,
 	if (ret < 0)
 		return ret;
 
-	link = snd_hdac_ext_bus_get_link(bus, rtd->codec_dai->component->name);
+	link = snd_hdac_ext_bus_get_link(bus, asoc_rtd_to_codec(rtd, 0)->component->name);
 	if (!link)
 		return -EINVAL;
 
diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index c396b7ef0328..725be6ccd710 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -845,7 +845,7 @@ int hda_dsp_set_hw_params_upon_resume(struct snd_sof_dev *sdev)
 		 */
 		if (stream->link_substream) {
 			rtd = snd_pcm_substream_chip(stream->link_substream);
-			name = rtd->codec_dai->component->name;
+			name = asoc_rtd_to_codec(rtd, 0)->component->name;
 			link = snd_hdac_ext_bus_get_link(bus, name);
 			if (!link)
 				return -EINVAL;
-- 
2.20.1

