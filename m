Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A07CFB35
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 15:21:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3877C16AD;
	Tue,  8 Oct 2019 15:21:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3877C16AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570540916;
	bh=/AdJQ5AE/jZq9xMRxxDTaWsUUvyicrQFUc0ekfEXRH4=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=T7RL9mHnbNHVBHU6wRJj+Sv2Z4MNG+xmftS9Qgdj4lv0a9h/RPyf6Wdjdp2vsO4LN
	 CJSQkTalKNyWmPwJpJGNZDDIMVsnkM25HqGcXNPV0OYWh1NZ9dofKFHGv1FP+2QWG4
	 vLbKWwXMANN1ozL4LoznalnO4/ikjQJVtKHbykhw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4581DF8963B;
	Tue,  8 Oct 2019 14:54:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89685F80797; Tue,  8 Oct 2019 14:54:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFCA7F80659
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:53:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFCA7F80659
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ZEL6Wz1V"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=B0Nj2Kw9ukhjjdhGjo4U8NVq83If+b0T9FCafsmr+dw=; b=ZEL6Wz1VOMiR
 rfiyNxjt1D+fP3nz8os+BpFSqdR+Xrwdppvt7Io8yAjcgZHD1X9PwhohNjYhVjwidu3POKtxwtIyZ
 SCoX1sVwbFsPRMe6bbGL//kmgcnQ7FfpLLAcvZyNW3xTw8Iz/b4Xk1YVR4xdFD19WvMHHoXvRKHR7
 jkaIs=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHoze-0008PV-Bh; Tue, 08 Oct 2019 12:53:34 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id CD5112740D4B; Tue,  8 Oct 2019 13:53:33 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o8yzaf2f.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191008125333.CD5112740D4B@ypsilon.sirena.org.uk>
Date: Tue,  8 Oct 2019 13:53:33 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: intel: skl-pcm: remove snd_pcm_ops" to
	the asoc tree
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

   ASoC: intel: skl-pcm: remove snd_pcm_ops

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

From 3507bb5fe46d12f517b68ea612159376c7ccce09 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:31:36 +0900
Subject: [PATCH] ASoC: intel: skl-pcm: remove snd_pcm_ops

snd_pcm_ops is no longer needed.
Let's use component driver callback.

*Note*

Only Intel skl-pcm has .get_time_info implementation, but ALSA SoC
framework doesn't call it so far.
To keep its implementation, this patch keeps .get_time_info,
but it is still not called.
Intel guy need to support it in the future.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87o8yzaf2f.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/skylake/skl-pcm.c | 67 ++++++++++++++++++++-----------
 1 file changed, 44 insertions(+), 23 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
index 7f287424af9b..0850141c7d47 100644
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -1081,7 +1081,8 @@ int skl_dai_load(struct snd_soc_component *cmp, int index,
 	return 0;
 }
 
-static int skl_platform_open(struct snd_pcm_substream *substream)
+static int skl_platform_soc_open(struct snd_soc_component *component,
+				 struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
@@ -1167,8 +1168,9 @@ static int skl_coupled_trigger(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int skl_platform_pcm_trigger(struct snd_pcm_substream *substream,
-					int cmd)
+static int skl_platform_soc_trigger(struct snd_soc_component *component,
+				    struct snd_pcm_substream *substream,
+				    int cmd)
 {
 	struct hdac_bus *bus = get_bus_ctx(substream);
 
@@ -1178,8 +1180,9 @@ static int skl_platform_pcm_trigger(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static snd_pcm_uframes_t skl_platform_pcm_pointer
-			(struct snd_pcm_substream *substream)
+static snd_pcm_uframes_t skl_platform_soc_pointer(
+	struct snd_soc_component *component,
+	struct snd_pcm_substream *substream)
 {
 	struct hdac_ext_stream *hstream = get_hdac_ext_stream(substream);
 	struct hdac_bus *bus = get_bus_ctx(substream);
@@ -1225,6 +1228,24 @@ static snd_pcm_uframes_t skl_platform_pcm_pointer
 	return bytes_to_frames(substream->runtime, pos);
 }
 
+static int skl_platform_soc_mmap(struct snd_soc_component *component,
+				 struct snd_pcm_substream *substream,
+				 struct vm_area_struct *area)
+{
+	return snd_pcm_lib_default_mmap(substream, area);
+}
+
+#ifdef CONFIG_SND_DMA_SGBUF
+static struct page *skl_platform_soc_page(struct snd_soc_component *component,
+					  struct snd_pcm_substream *substream,
+					  unsigned long offset)
+{
+	return snd_pcm_sgbuf_ops_page(substream, offset);
+}
+#else
+#define skl_platform_soc_page NULL
+#endif /* CONFIG_SND_DMA_SGBUF */
+
 static u64 skl_adjust_codec_delay(struct snd_pcm_substream *substream,
 				u64 nsec)
 {
@@ -1245,7 +1266,9 @@ static u64 skl_adjust_codec_delay(struct snd_pcm_substream *substream,
 	return (nsec > codec_nsecs) ? nsec - codec_nsecs : 0;
 }
 
-static int skl_get_time_info(struct snd_pcm_substream *substream,
+static int skl_platform_soc_get_time_info(
+			struct snd_soc_component *component,
+			struct snd_pcm_substream *substream,
 			struct timespec *system_ts, struct timespec *audio_ts,
 			struct snd_pcm_audio_tstamp_config *audio_tstamp_config,
 			struct snd_pcm_audio_tstamp_report *audio_tstamp_report)
@@ -1277,24 +1300,16 @@ static int skl_get_time_info(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static const struct snd_pcm_ops skl_platform_ops = {
-	.open = skl_platform_open,
-	.ioctl = snd_pcm_lib_ioctl,
-	.trigger = skl_platform_pcm_trigger,
-	.pointer = skl_platform_pcm_pointer,
-	.get_time_info =  skl_get_time_info,
-	.mmap = snd_pcm_lib_default_mmap,
-	.page = snd_pcm_sgbuf_ops_page,
-};
-
-static void skl_pcm_free(struct snd_pcm *pcm)
+static void skl_platform_soc_free(struct snd_soc_component *component,
+				  struct snd_pcm *pcm)
 {
 	snd_pcm_lib_preallocate_free_for_all(pcm);
 }
 
 #define MAX_PREALLOC_SIZE	(32 * 1024 * 1024)
 
-static int skl_pcm_new(struct snd_soc_pcm_runtime *rtd)
+static int skl_platform_soc_new(struct snd_soc_component *component,
+				struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dai *dai = rtd->cpu_dai;
 	struct hdac_bus *bus = dev_get_drvdata(dai->dev);
@@ -1458,7 +1473,7 @@ static int skl_platform_soc_probe(struct snd_soc_component *component)
 	return 0;
 }
 
-static void skl_pcm_remove(struct snd_soc_component *component)
+static void skl_platform_soc_remove(struct snd_soc_component *component)
 {
 	struct hdac_bus *bus = dev_get_drvdata(component->dev);
 	struct skl_dev *skl = bus_to_skl(bus);
@@ -1471,10 +1486,16 @@ static void skl_pcm_remove(struct snd_soc_component *component)
 static const struct snd_soc_component_driver skl_component  = {
 	.name		= "pcm",
 	.probe		= skl_platform_soc_probe,
-	.remove		= skl_pcm_remove,
-	.ops		= &skl_platform_ops,
-	.pcm_new	= skl_pcm_new,
-	.pcm_free	= skl_pcm_free,
+	.remove		= skl_platform_soc_remove,
+	.open		= skl_platform_soc_open,
+	.ioctl		= snd_soc_pcm_lib_ioctl,
+	.trigger	= skl_platform_soc_trigger,
+	.pointer	= skl_platform_soc_pointer,
+	.get_time_info	= skl_platform_soc_get_time_info,
+	.mmap		= skl_platform_soc_mmap,
+	.page		= skl_platform_soc_page,
+	.pcm_construct	= skl_platform_soc_new,
+	.pcm_destruct	= skl_platform_soc_free,
 	.module_get_upon_open = 1, /* increment refcount when a pcm is opened */
 };
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
