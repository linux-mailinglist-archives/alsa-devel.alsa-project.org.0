Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C492CFB0D
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 15:13:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6FD61654;
	Tue,  8 Oct 2019 15:12:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6FD61654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570540405;
	bh=1U9c7FSYM8gunpmlrfpci9SNxdyPW9vw2Ywp0puRrBQ=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=h1CXIvUKEg1yaK/WMth7nj1AQJ4Z5++QXqkqjM2ByzT+fN48W/d9gYaG8TsNElfjv
	 z5tYcnLirf97+2wLGQFUHonkXHs5ae+LMVbl1Ci3G/Ur5lZu1Wg7Wy7P17hHFRsQH4
	 jPECw9+eQauc2eweMnILw0MK0c59ctv5AOxuCEzk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 301AAF808AF;
	Tue,  8 Oct 2019 14:54:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4453F80753; Tue,  8 Oct 2019 14:54:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B46B7F8063A
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:53:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B46B7F8063A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="tEUWmBCu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=UMM8E8WKevKXSwXRRQgIDF0ccpgajz5KlSVK7l2LkWA=; b=tEUWmBCu4bL3
 Ga8b8Gm15jhP3n7TRiKBJGVQXZJ0uhxzTBAhcW0POTrnbZrIfqOz6ZySDmOAa36Vv1/QV+W45l2A2
 HRs7Soj0SyJjiMTqraB0rqUF8ciX0iqgqj/cTw4+IIdjQN87k1xavhyf4yfCZujeZGnfu2iPDi/iB
 zZS+4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHozb-0008OK-EG; Tue, 08 Oct 2019 12:53:31 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id E96B22740D4B; Tue,  8 Oct 2019 13:53:30 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <875zl7af0h.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191008125330.E96B22740D4B@ypsilon.sirena.org.uk>
Date: Tue,  8 Oct 2019 13:53:30 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: stm: stm32_adfsdm: remove snd_pcm_ops"
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

   ASoC: stm: stm32_adfsdm: remove snd_pcm_ops

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

From 21499089765f1e8f69998c0506f69158db821c14 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:32:46 +0900
Subject: [PATCH] ASoC: stm: stm32_adfsdm: remove snd_pcm_ops

snd_pcm_ops is no longer needed.
Let's use component driver callback.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/875zl7af0h.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/stm/stm32_adfsdm.c | 42 ++++++++++++++++++++----------------
 1 file changed, 23 insertions(+), 19 deletions(-)

diff --git a/sound/soc/stm/stm32_adfsdm.c b/sound/soc/stm/stm32_adfsdm.c
index 3c9a9deec9af..81c407da15c5 100644
--- a/sound/soc/stm/stm32_adfsdm.c
+++ b/sound/soc/stm/stm32_adfsdm.c
@@ -210,7 +210,8 @@ static int stm32_afsdm_pcm_cb(const void *data, size_t size, void *private)
 	return 0;
 }
 
-static int stm32_adfsdm_trigger(struct snd_pcm_substream *substream, int cmd)
+static int stm32_adfsdm_trigger(struct snd_soc_component *component,
+				struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct stm32_adfsdm_priv *priv =
@@ -230,7 +231,8 @@ static int stm32_adfsdm_trigger(struct snd_pcm_substream *substream, int cmd)
 	return -EINVAL;
 }
 
-static int stm32_adfsdm_pcm_open(struct snd_pcm_substream *substream)
+static int stm32_adfsdm_pcm_open(struct snd_soc_component *component,
+				 struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct stm32_adfsdm_priv *priv = snd_soc_dai_get_drvdata(rtd->cpu_dai);
@@ -243,7 +245,8 @@ static int stm32_adfsdm_pcm_open(struct snd_pcm_substream *substream)
 	return ret;
 }
 
-static int stm32_adfsdm_pcm_close(struct snd_pcm_substream *substream)
+static int stm32_adfsdm_pcm_close(struct snd_soc_component *component,
+				  struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct stm32_adfsdm_priv *priv =
@@ -256,6 +259,7 @@ static int stm32_adfsdm_pcm_close(struct snd_pcm_substream *substream)
 }
 
 static snd_pcm_uframes_t stm32_adfsdm_pcm_pointer(
+					    struct snd_soc_component *component,
 					    struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
@@ -265,7 +269,8 @@ static snd_pcm_uframes_t stm32_adfsdm_pcm_pointer(
 	return bytes_to_frames(substream->runtime, priv->pos);
 }
 
-static int stm32_adfsdm_pcm_hw_params(struct snd_pcm_substream *substream,
+static int stm32_adfsdm_pcm_hw_params(struct snd_soc_component *component,
+				      struct snd_pcm_substream *substream,
 				      struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
@@ -282,23 +287,16 @@ static int stm32_adfsdm_pcm_hw_params(struct snd_pcm_substream *substream,
 						   params_period_size(params));
 }
 
-static int stm32_adfsdm_pcm_hw_free(struct snd_pcm_substream *substream)
+static int stm32_adfsdm_pcm_hw_free(struct snd_soc_component *component,
+				    struct snd_pcm_substream *substream)
 {
 	snd_pcm_lib_free_pages(substream);
 
 	return 0;
 }
 
-static struct snd_pcm_ops stm32_adfsdm_pcm_ops = {
-	.open		= stm32_adfsdm_pcm_open,
-	.close		= stm32_adfsdm_pcm_close,
-	.hw_params	= stm32_adfsdm_pcm_hw_params,
-	.hw_free	= stm32_adfsdm_pcm_hw_free,
-	.trigger	= stm32_adfsdm_trigger,
-	.pointer	= stm32_adfsdm_pcm_pointer,
-};
-
-static int stm32_adfsdm_pcm_new(struct snd_soc_pcm_runtime *rtd)
+static int stm32_adfsdm_pcm_new(struct snd_soc_component *component,
+				struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_pcm *pcm = rtd->pcm;
 	struct stm32_adfsdm_priv *priv =
@@ -310,7 +308,8 @@ static int stm32_adfsdm_pcm_new(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
-static void stm32_adfsdm_pcm_free(struct snd_pcm *pcm)
+static void stm32_adfsdm_pcm_free(struct snd_soc_component *component,
+				  struct snd_pcm *pcm)
 {
 	struct snd_pcm_substream *substream;
 
@@ -320,9 +319,14 @@ static void stm32_adfsdm_pcm_free(struct snd_pcm *pcm)
 }
 
 static struct snd_soc_component_driver stm32_adfsdm_soc_platform = {
-	.ops		= &stm32_adfsdm_pcm_ops,
-	.pcm_new	= stm32_adfsdm_pcm_new,
-	.pcm_free	= stm32_adfsdm_pcm_free,
+	.open		= stm32_adfsdm_pcm_open,
+	.close		= stm32_adfsdm_pcm_close,
+	.hw_params	= stm32_adfsdm_pcm_hw_params,
+	.hw_free	= stm32_adfsdm_pcm_hw_free,
+	.trigger	= stm32_adfsdm_trigger,
+	.pointer	= stm32_adfsdm_pcm_pointer,
+	.pcm_construct	= stm32_adfsdm_pcm_new,
+	.pcm_destruct	= stm32_adfsdm_pcm_free,
 };
 
 static const struct of_device_id stm32_adfsdm_of_match[] = {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
