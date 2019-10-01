Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 883DAC32D0
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 13:42:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 141E0166F;
	Tue,  1 Oct 2019 13:41:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 141E0166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569930160;
	bh=Eby4/eyhjXD8gWUpUQeUHDrtAotC6ys/ECmuefkog30=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=HLWi76Bot5Y+NOGwgJ/+gxNN1xu3/T6Un/5ZivOaTdy0zQ3aymvdg9i2lgeeuTyWY
	 3MA5cylWNoHs3rXQCOAtPS1JeA1Thw0yrY8oviIJCyOGyf6FhFVTumwV4As2S85X7K
	 AL748eZD4xQrGt9YAFHjmn4Qvv60GZj/KxsKns10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48272F8063D;
	Tue,  1 Oct 2019 13:40:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98DDCF805FE; Tue,  1 Oct 2019 13:40:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93381F800D0
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 13:40:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93381F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="K1/NLJIz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=ZvGw8/uoJRphIfhJ0LqVgcvpfsqfHsblu0820aGetRQ=; b=K1/NLJIzAOvM
 tVaMkhxx/ISVqhHGPvxVImvYhJAGDXL+n7YBdiws1LK0a40dWc7n2PW0N+eCEjxCkP3Jni8eSNuQv
 Kn4vw2GT8BWhDjoBTDwWnBAhD7tNAl9iI/4VUs/bdohZvC58EdJ7V3f3Q+ttDSyUE7C1kjNM7veK/
 2h7K8=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iFGWL-0004SP-Ma; Tue, 01 Oct 2019 11:40:45 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 25F9B2742A10; Tue,  1 Oct 2019 12:40:45 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
In-Reply-To: <20190927071646.22319-1-peter.ujfalusi@ti.com>
X-Patchwork-Hint: ignore
Message-Id: <20191001114045.25F9B2742A10@ypsilon.sirena.org.uk>
Date: Tue,  1 Oct 2019 12:40:45 +0100 (BST)
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 tiwai@suse.de, pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-pcm: Use different sequence for
	start/stop trigger" to the asoc tree
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

   ASoC: soc-pcm: Use different sequence for start/stop trigger

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From 4378f1fbe924054a09ff0d4e39e1a581b9245252 Mon Sep 17 00:00:00 2001
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Fri, 27 Sep 2019 10:16:46 +0300
Subject: [PATCH] ASoC: soc-pcm: Use different sequence for start/stop trigger

On stream stop currently we stop the DMA first followed by the CPU DAI.
This can cause underflow (playback) or overflow (capture) on the DAI side
as the DMA is no longer feeding data while the DAI is still active.
It can be observed easily if the DAI side does not have FIFO (or it is
disabled) to survive the time while the DMA is stopped, but still can
happen on relatively slow CPUs when relatively high sampling rate is used:
the FIFO is drained between the time the DMA is stopped and the DAI is
stopped.

It can only fixed by using different sequence within trigger for 'stop' and
'start':
case SNDRV_PCM_TRIGGER_START:
case SNDRV_PCM_TRIGGER_RESUME:
case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
	Trigger order: dai_link, DMA, CPU DAI then the codec

case SNDRV_PCM_TRIGGER_STOP:
case SNDRV_PCM_TRIGGER_SUSPEND:
case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
	Trigger order: codec, CPU DAI, DMA then dai_link

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190927071646.22319-1-peter.ujfalusi@ti.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-pcm.c | 64 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 61 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index e163dde5eab1..e7a04c892817 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1047,7 +1047,7 @@ static int soc_pcm_hw_free(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
+static int soc_pcm_trigger_start(struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_component *component;
@@ -1056,8 +1056,8 @@ static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 	struct snd_soc_dai *codec_dai;
 	int i, ret;
 
-	for_each_rtd_codec_dai(rtd, i, codec_dai) {
-		ret = snd_soc_dai_trigger(codec_dai, substream, cmd);
+	if (rtd->dai_link->ops->trigger) {
+		ret = rtd->dai_link->ops->trigger(substream, cmd);
 		if (ret < 0)
 			return ret;
 	}
@@ -1074,6 +1074,42 @@ static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 	if (ret < 0)
 		return ret;
 
+	for_each_rtd_codec_dai(rtd, i, codec_dai) {
+		ret = snd_soc_dai_trigger(codec_dai, substream, cmd);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int soc_pcm_trigger_stop(struct snd_pcm_substream *substream, int cmd)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_component *component;
+	struct snd_soc_rtdcom_list *rtdcom;
+	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *codec_dai;
+	int i, ret;
+
+	for_each_rtd_codec_dai(rtd, i, codec_dai) {
+		ret = snd_soc_dai_trigger(codec_dai, substream, cmd);
+		if (ret < 0)
+			return ret;
+	}
+
+	ret = snd_soc_dai_trigger(cpu_dai, substream, cmd);
+	if (ret < 0)
+		return ret;
+
+	for_each_rtdcom(rtd, rtdcom) {
+		component = rtdcom->component;
+
+		ret = snd_soc_component_trigger(component, substream, cmd);
+		if (ret < 0)
+			return ret;
+	}
+
 	if (rtd->dai_link->ops->trigger) {
 		ret = rtd->dai_link->ops->trigger(substream, cmd);
 		if (ret < 0)
@@ -1083,6 +1119,28 @@ static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 	return 0;
 }
 
+static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
+{
+	int ret;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		ret = soc_pcm_trigger_start(substream, cmd);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		ret = soc_pcm_trigger_stop(substream, cmd);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return ret;
+}
+
 static int soc_pcm_bespoke_trigger(struct snd_pcm_substream *substream,
 				   int cmd)
 {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
