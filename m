Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72471BC704
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2019 13:43:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC0821687;
	Tue, 24 Sep 2019 13:42:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC0821687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569325381;
	bh=cbmKwseRdvcFoX8W0ptCVQSC5a37TrSWrWy7IMFMY/8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tlmTK3jVtCWwvnGWyGq+ZSfOcGC4AFWe7NRmcyG1Bty8wkO/aqDskkdSU5uFK5I8E
	 7M7uOJxG/3sSgW4bgCHdv8A6jQ4fIVdfnNf5hDzptuNEoiQb6vEwBCSqOvOfJTO9xG
	 /SLIwfyYR3q3OKU/Nx7WJOmk022jsmKLrQHzpz/0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 535D1F8048D;
	Tue, 24 Sep 2019 13:41:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 237C4F8045F; Tue, 24 Sep 2019 13:41:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E2EAF802BD
 for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2019 13:41:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E2EAF802BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Fkwsefpm"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8OBf7aR122746;
 Tue, 24 Sep 2019 06:41:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1569325267;
 bh=FhhJNnitdBuAjMrCRFigNGOWOuhTB01Qx3/X9Vv9CJQ=;
 h=From:To:CC:Subject:Date;
 b=FkwsefpmwabyEUVFH2TUsAxR92P75+CEhu70exVsgyPTAqGQAkx47UXOKYTrtgi+9
 SHbpzYCIzbcLGMTzXzJ2Yej0fyfm+p+5sWTj0UeB7q3B4H9I9bhgGMf6JkjmNpoXVN
 c9Mxr+DdUALBEtSUmhfpTdI/rWmN0K5l0Is/96tI=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8OBf7PL084631
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 24 Sep 2019 06:41:07 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 24
 Sep 2019 06:41:00 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 24 Sep 2019 06:41:00 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8OBf4Vs102889;
 Tue, 24 Sep 2019 06:41:04 -0500
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Tue, 24 Sep 2019 14:41:46 +0300
Message-ID: <20190924114146.8116-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com
Subject: [alsa-devel] [RFC] ASoC: soc-pcm: Use different sequence for
	start/stop trigger
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
	Start DMA first followed by CPU DAI (currently used sequence)

case SNDRV_PCM_TRIGGER_STOP:
case SNDRV_PCM_TRIGGER_SUSPEND:
case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
	Stop CPU DAI first followed by DMA

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
Hi,

on a new TI platform (j721e) where we can disable the McASP FIFO (the CPU dai)
since the UDMA + PDMA provides the buffering I have started to see error
interrupts right after pcm_trigger:STOP and in rare cases even on PAUSE that
McASP underruns.
I was also able to reproduce the same issue on am335x board, but it is much
harder to trigger it.

With this patch the underrun after trigger:STOP is gone.

If I think about the issue, I'm not sure why it was not noticed before as the
behavior makes sense:
we stop the DMA first then we stop the CPU DAI. If between the DMA stop and DAI
stop we would need a sample in the DAI (which is still running) then for sure we
will underrun in the HW (or overrun in case of capture).

When I run the ALSA conformance test [1] it is easier to trigger.

Not sure if anyone else have seen such underrun/overrun when stopping a stream,
but the fact that I have seen it with both UDMA+PDMA and EDMA on different
platforms makes me wonder if the issue can be seen on other platforms as well.

[1] https://chromium.googlesource.com/chromiumos/platform/audiotest/+/master/alsa_conformance_test.md

Regards,
Peter
---
 sound/soc/soc-pcm.c | 66 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 62 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index e163dde5eab1..c96430e70752 100644
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
@@ -1056,24 +1056,60 @@ static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 	struct snd_soc_dai *codec_dai;
 	int i, ret;
 
+	for_each_rtdcom(rtd, rtdcom) {
+		component = rtdcom->component;
+
+		ret = snd_soc_component_trigger(component, substream, cmd);
+		if (ret < 0)
+			return ret;
+	}
+
 	for_each_rtd_codec_dai(rtd, i, codec_dai) {
 		ret = snd_soc_dai_trigger(codec_dai, substream, cmd);
 		if (ret < 0)
 			return ret;
 	}
 
-	for_each_rtdcom(rtd, rtdcom) {
-		component = rtdcom->component;
+	snd_soc_dai_trigger(cpu_dai, substream, cmd);
+	if (ret < 0)
+		return ret;
 
-		ret = snd_soc_component_trigger(component, substream, cmd);
+	if (rtd->dai_link->ops->trigger) {
+		ret = rtd->dai_link->ops->trigger(substream, cmd);
 		if (ret < 0)
 			return ret;
 	}
 
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
 	snd_soc_dai_trigger(cpu_dai, substream, cmd);
 	if (ret < 0)
 		return ret;
 
+	for_each_rtd_codec_dai(rtd, i, codec_dai) {
+		ret = snd_soc_dai_trigger(codec_dai, substream, cmd);
+		if (ret < 0)
+			return ret;
+	}
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
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
