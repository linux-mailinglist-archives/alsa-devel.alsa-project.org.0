Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65799CFB00
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 15:11:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E88C71676;
	Tue,  8 Oct 2019 15:10:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E88C71676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570540286;
	bh=POPje3c1i1wCR2vzxnary021TuHTmLCs3I9qe9dVMZQ=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=qNEO3M5lT/VaB/ZFxik8qN3OeXDRwqZgi7QudHCq42vlWJ8+Y3sXCsjuFFEtNqh2s
	 UXj10Foe14JKGbmV7OWSIjIdECXRRPRUMlp2IjVed0ww6UuztGi1ER6NaaCJLReFMX
	 2hF5M3ZNgotlzUMZK4Urx8Le49pFMBf78nfRw1EE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA1A5F80863;
	Tue,  8 Oct 2019 14:54:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 477ACF80726; Tue,  8 Oct 2019 14:53:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1485AF80636
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:53:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1485AF80636
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="sPoBFdRW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=g88LvmOPBuyvTd3NBOtSdImolPCkRJ1GvMrvCn9sbKg=; b=sPoBFdRW4zAv
 3yPzZlr2w8wKMcg9k+nj8omGYAyqo6ZJ0pklf42oVjoepExdknuy/vGaH11SGMJRVcxmBCD4ZR810
 00GE8zU+0tEsh8uNCo+QTe96EW7vJ1C81xXkc9AV/pE5PKPaA6mzEdSgAKETYqnX5DuFk5D330XXT
 sjIkE=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHoza-0008Nw-Ho; Tue, 08 Oct 2019 12:53:30 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 0F0572740D4A; Tue,  8 Oct 2019 13:53:30 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87zhij90fh.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191008125330.0F0572740D4A@ypsilon.sirena.org.uk>
Date: Tue,  8 Oct 2019 13:53:30 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: sh: fsi: remove snd_pcm_ops" to the
	asoc tree
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

   ASoC: sh: fsi: remove snd_pcm_ops

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

From be513045d6fe8284e0e6f9060415d0c5189e179a Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:33:06 +0900
Subject: [PATCH] ASoC: sh: fsi: remove snd_pcm_ops

snd_pcm_ops is no longer needed.
Let's use component driver callback.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87zhij90fh.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sh/fsi.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/sound/soc/sh/fsi.c b/sound/soc/sh/fsi.c
index 3447dbdba1f1..e384fdc8d60e 100644
--- a/sound/soc/sh/fsi.c
+++ b/sound/soc/sh/fsi.c
@@ -1718,7 +1718,8 @@ static const struct snd_pcm_hardware fsi_pcm_hardware = {
 	.fifo_size		= 256,
 };
 
-static int fsi_pcm_open(struct snd_pcm_substream *substream)
+static int fsi_pcm_open(struct snd_soc_component *component,
+			struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int ret = 0;
@@ -1731,19 +1732,22 @@ static int fsi_pcm_open(struct snd_pcm_substream *substream)
 	return ret;
 }
 
-static int fsi_hw_params(struct snd_pcm_substream *substream,
+static int fsi_hw_params(struct snd_soc_component *component,
+			 struct snd_pcm_substream *substream,
 			 struct snd_pcm_hw_params *hw_params)
 {
 	return snd_pcm_lib_malloc_pages(substream,
 					params_buffer_bytes(hw_params));
 }
 
-static int fsi_hw_free(struct snd_pcm_substream *substream)
+static int fsi_hw_free(struct snd_soc_component *component,
+		       struct snd_pcm_substream *substream)
 {
 	return snd_pcm_lib_free_pages(substream);
 }
 
-static snd_pcm_uframes_t fsi_pointer(struct snd_pcm_substream *substream)
+static snd_pcm_uframes_t fsi_pointer(struct snd_soc_component *component,
+				     struct snd_pcm_substream *substream)
 {
 	struct fsi_priv *fsi = fsi_get_priv(substream);
 	struct fsi_stream *io = fsi_stream_get(fsi, substream);
@@ -1751,14 +1755,6 @@ static snd_pcm_uframes_t fsi_pointer(struct snd_pcm_substream *substream)
 	return fsi_sample2frame(fsi, io->buff_sample_pos);
 }
 
-static const struct snd_pcm_ops fsi_pcm_ops = {
-	.open		= fsi_pcm_open,
-	.ioctl		= snd_pcm_lib_ioctl,
-	.hw_params	= fsi_hw_params,
-	.hw_free	= fsi_hw_free,
-	.pointer	= fsi_pointer,
-};
-
 /*
  *		snd_soc_component
  */
@@ -1766,7 +1762,8 @@ static const struct snd_pcm_ops fsi_pcm_ops = {
 #define PREALLOC_BUFFER		(32 * 1024)
 #define PREALLOC_BUFFER_MAX	(32 * 1024)
 
-static int fsi_pcm_new(struct snd_soc_pcm_runtime *rtd)
+static int fsi_pcm_new(struct snd_soc_component *component,
+		       struct snd_soc_pcm_runtime *rtd)
 {
 	snd_pcm_lib_preallocate_pages_for_all(
 		rtd->pcm,
@@ -1817,8 +1814,12 @@ static struct snd_soc_dai_driver fsi_soc_dai[] = {
 
 static const struct snd_soc_component_driver fsi_soc_component = {
 	.name		= "fsi",
-	.ops		= &fsi_pcm_ops,
-	.pcm_new	= fsi_pcm_new,
+	.open		= fsi_pcm_open,
+	.ioctl		= snd_soc_pcm_lib_ioctl,
+	.hw_params	= fsi_hw_params,
+	.hw_free	= fsi_hw_free,
+	.pointer	= fsi_pointer,
+	.pcm_construct	= fsi_pcm_new,
 };
 
 /*
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
