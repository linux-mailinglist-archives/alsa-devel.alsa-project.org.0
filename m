Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6507ACFAF6
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 15:10:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1F3A950;
	Tue,  8 Oct 2019 15:09:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1F3A950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570540209;
	bh=OVpr8dq6PHxu3vsY3OSMNvV1mZmcklpR75p2kjjbkso=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=hK5MPa7UDw8lLcdHTj7ORLAPqLGL4euy6WYolpUqKW1IFBus7hPIgHXoV6sMG5joc
	 e43soqzd/kMwQkuZDdJ8vsTTx+E8RnVgi6HHMhLlC6S91El5Dpg1ks1tGP8T0yYsZZ
	 czvzhhgSworV+/Kfx0KJoYiWJl5I5Hf6iigJNryU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE35DF80674;
	Tue,  8 Oct 2019 14:54:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9B64F80720; Tue,  8 Oct 2019 14:53:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31255F80638
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:53:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31255F80638
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="WgYOedNX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=HXQyT8nj1mYzTzp/v1FPWCnTp1dErjc+1xrienq1oa0=; b=WgYOedNXREFG
 jZZvZjtr+9UPIe04w4bWHHZ0k+CnN/qjDdJjrW4klffeuo+kpADBfPImLsp624qxcRc+l4p1yE7GD
 aJJMq9sBiD10uwWM/Te9lvm0t1VlNie8sJG+n0Rgl5Z/Mz0xCIX+XdIxha/7eSTc0iFYP1EGBMuWA
 N0aqo=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHoza-0008O2-Pr; Tue, 08 Oct 2019 12:53:30 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 462292740D4B; Tue,  8 Oct 2019 13:53:30 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <871rvvaf02.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191008125330.462292740D4B@ypsilon.sirena.org.uk>
Date: Tue,  8 Oct 2019 13:53:30 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: sh: rsnd: remove snd_pcm_ops" to the
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

   ASoC: sh: rsnd: remove snd_pcm_ops

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

From 9dcefa7232d3fd5a7141454849d46ed24c7af867 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:33:01 +0900
Subject: [PATCH] ASoC: sh: rsnd: remove snd_pcm_ops

snd_pcm_ops is no longer needed.
Let's use component driver callback.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/871rvvaf02.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sh/rcar/core.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index bda5b958d0dc..4bed26842095 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1373,8 +1373,9 @@ static int rsnd_dai_probe(struct rsnd_priv *priv)
 /*
  *		pcm ops
  */
-static int rsnd_hw_params(struct snd_pcm_substream *substream,
-			 struct snd_pcm_hw_params *hw_params)
+static int rsnd_hw_params(struct snd_soc_component *component,
+			  struct snd_pcm_substream *substream,
+			  struct snd_pcm_hw_params *hw_params)
 {
 	struct snd_soc_dai *dai = rsnd_substream_to_dai(substream);
 	struct rsnd_dai *rdai = rsnd_dai_to_rdai(dai);
@@ -1421,7 +1422,8 @@ static int rsnd_hw_params(struct snd_pcm_substream *substream,
 					params_buffer_bytes(hw_params));
 }
 
-static int rsnd_hw_free(struct snd_pcm_substream *substream)
+static int rsnd_hw_free(struct snd_soc_component *component,
+			struct snd_pcm_substream *substream)
 {
 	struct snd_soc_dai *dai = rsnd_substream_to_dai(substream);
 	struct rsnd_dai *rdai = rsnd_dai_to_rdai(dai);
@@ -1435,7 +1437,8 @@ static int rsnd_hw_free(struct snd_pcm_substream *substream)
 	return snd_pcm_lib_free_pages(substream);
 }
 
-static snd_pcm_uframes_t rsnd_pointer(struct snd_pcm_substream *substream)
+static snd_pcm_uframes_t rsnd_pointer(struct snd_soc_component *component,
+				      struct snd_pcm_substream *substream)
 {
 	struct snd_soc_dai *dai = rsnd_substream_to_dai(substream);
 	struct rsnd_dai *rdai = rsnd_dai_to_rdai(dai);
@@ -1447,13 +1450,6 @@ static snd_pcm_uframes_t rsnd_pointer(struct snd_pcm_substream *substream)
 	return pointer;
 }
 
-static const struct snd_pcm_ops rsnd_pcm_ops = {
-	.ioctl		= snd_pcm_lib_ioctl,
-	.hw_params	= rsnd_hw_params,
-	.hw_free	= rsnd_hw_free,
-	.pointer	= rsnd_pointer,
-};
-
 /*
  *		snd_kcontrol
  */
@@ -1647,8 +1643,11 @@ int rsnd_kctrl_new(struct rsnd_mod *mod,
  *		snd_soc_component
  */
 static const struct snd_soc_component_driver rsnd_soc_component = {
-	.ops		= &rsnd_pcm_ops,
 	.name		= "rsnd",
+	.ioctl		= snd_soc_pcm_lib_ioctl,
+	.hw_params	= rsnd_hw_params,
+	.hw_free	= rsnd_hw_free,
+	.pointer	= rsnd_pointer,
 };
 
 static int rsnd_rdai_continuance_probe(struct rsnd_priv *priv,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
