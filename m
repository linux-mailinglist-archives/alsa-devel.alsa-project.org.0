Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBBC1593F2
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 16:53:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2802086E;
	Tue, 11 Feb 2020 16:52:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2802086E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581436398;
	bh=kVbdSJUAL2W0zcWQisO1KdizK1cR4SCAGVR8tEDtnf0=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=lP30gSXmfsr4rrWJPRXSCmIqbYst8mAJ7pq55ntflH0CTk4qFOAkl8bw01JoQHRPq
	 05oSB8UtFv64kMnHPOi/GvnEw8+hTxZSAgrVc9hwjr4H2OZvhHv4r3VmvZAOf2AlG8
	 2VaJ6eGlktGS+F5yESNA5uN8r7CI6s4a/dnaGkyg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76749F802A1;
	Tue, 11 Feb 2020 16:48:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E56FEF8028D; Tue, 11 Feb 2020 16:48:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id D7AA4F80276
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 16:48:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7AA4F80276
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 12AC631B;
 Tue, 11 Feb 2020 07:48:33 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8BFD63F68E;
 Tue, 11 Feb 2020 07:48:32 -0800 (PST)
Date: Tue, 11 Feb 2020 15:48:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87blq7ceyq.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87blq7ceyq.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-pcm: add snd_soc_runtime_action()"
	to the asoc tree
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

   ASoC: soc-pcm: add snd_soc_runtime_action()

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.7

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

From 7a5aaba4a4f45acc8192beb8a4b1bd4a58b67ce3 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 10 Feb 2020 12:14:12 +0900
Subject: [PATCH] ASoC: soc-pcm: add snd_soc_runtime_action()

ALSA SoC has snd_soc_runtime_activate() / snd_soc_runtime_deactivate().
These increment or decrement DAI/Component activity, but the code
difference is only +1 or -1.
This patch adds common snd_soc_runtime_action() which can get +1 or -1 as
parameter, and use it from snd_soc_runtime_activate/deactivate() to
avoid duplicate implementation.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/87blq7ceyq.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-pcm.c | 67 ++++++++++++++++++---------------------------
 1 file changed, 26 insertions(+), 41 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index ff1b7c7078e5..4d26558fcbfc 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -82,17 +82,8 @@ static int soc_rtd_trigger(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 
-/**
- * snd_soc_runtime_activate() - Increment active count for PCM runtime components
- * @rtd: ASoC PCM runtime that is activated
- * @stream: Direction of the PCM stream
- *
- * Increments the active count for all the DAIs and components attached to a PCM
- * runtime. Should typically be called when a stream is opened.
- *
- * Must be called with the rtd->card->pcm_mutex being held
- */
-void snd_soc_runtime_activate(struct snd_soc_pcm_runtime *rtd, int stream)
+static void snd_soc_runtime_action(struct snd_soc_pcm_runtime *rtd,
+				   int stream, int action)
 {
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
 	struct snd_soc_dai *codec_dai;
@@ -101,23 +92,38 @@ void snd_soc_runtime_activate(struct snd_soc_pcm_runtime *rtd, int stream)
 	lockdep_assert_held(&rtd->card->pcm_mutex);
 
 	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		cpu_dai->playback_active++;
+		cpu_dai->playback_active += action;
 		for_each_rtd_codec_dai(rtd, i, codec_dai)
-			codec_dai->playback_active++;
+			codec_dai->playback_active += action;
 	} else {
-		cpu_dai->capture_active++;
+		cpu_dai->capture_active += action;
 		for_each_rtd_codec_dai(rtd, i, codec_dai)
-			codec_dai->capture_active++;
+			codec_dai->capture_active += action;
 	}
 
-	cpu_dai->active++;
-	cpu_dai->component->active++;
+	cpu_dai->active += action;
+	cpu_dai->component->active += action;
 	for_each_rtd_codec_dai(rtd, i, codec_dai) {
-		codec_dai->active++;
-		codec_dai->component->active++;
+		codec_dai->active += action;
+		codec_dai->component->active += action;
 	}
 }
 
+/**
+ * snd_soc_runtime_activate() - Increment active count for PCM runtime components
+ * @rtd: ASoC PCM runtime that is activated
+ * @stream: Direction of the PCM stream
+ *
+ * Increments the active count for all the DAIs and components attached to a PCM
+ * runtime. Should typically be called when a stream is opened.
+ *
+ * Must be called with the rtd->card->pcm_mutex being held
+ */
+void snd_soc_runtime_activate(struct snd_soc_pcm_runtime *rtd, int stream)
+{
+	snd_soc_runtime_action(rtd, stream, 1);
+}
+
 /**
  * snd_soc_runtime_deactivate() - Decrement active count for PCM runtime components
  * @rtd: ASoC PCM runtime that is deactivated
@@ -130,28 +136,7 @@ void snd_soc_runtime_activate(struct snd_soc_pcm_runtime *rtd, int stream)
  */
 void snd_soc_runtime_deactivate(struct snd_soc_pcm_runtime *rtd, int stream)
 {
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
-	struct snd_soc_dai *codec_dai;
-	int i;
-
-	lockdep_assert_held(&rtd->card->pcm_mutex);
-
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		cpu_dai->playback_active--;
-		for_each_rtd_codec_dai(rtd, i, codec_dai)
-			codec_dai->playback_active--;
-	} else {
-		cpu_dai->capture_active--;
-		for_each_rtd_codec_dai(rtd, i, codec_dai)
-			codec_dai->capture_active--;
-	}
-
-	cpu_dai->active--;
-	cpu_dai->component->active--;
-	for_each_rtd_codec_dai(rtd, i, codec_dai) {
-		codec_dai->component->active--;
-		codec_dai->active--;
-	}
+	snd_soc_runtime_action(rtd, stream, -1);
 }
 
 /**
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
