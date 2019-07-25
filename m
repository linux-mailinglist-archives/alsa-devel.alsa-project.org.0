Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA9975609
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 19:47:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A86E71F0C;
	Thu, 25 Jul 2019 19:46:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A86E71F0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564076838;
	bh=5mDwW8psiPhpyrjOF8hHy75jSC3yd9jLZpsszkNyoFs=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=g7GRb9o+O0oJKQRMH6alE8F3DjKkTmmdtKS/clzZDWfa81hLX/BZq5/Dywm2fNjUP
	 j/PCXjicpA4ZnBgilzwtqjrpPK5cdLT1Jn94DTpnoaTVdQArbaN23YKGrpJgFuL318
	 UIT1QWhZiN3Nmu/oN5rEUIIV4K1w9FsqSJ1PmGF4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC411F804AA;
	Thu, 25 Jul 2019 19:43:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EA12F8048D; Thu, 25 Jul 2019 19:43:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAE39F80448
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 19:43:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAE39F80448
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="T8D604aq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=ANMpYSDNY6oEnY6y25VTsTy96X4rP+mF/SNqvsiqdGc=; b=T8D604aqzVVJ
 Duk4kaKnMxAxRnPCj5r5XAKqalKsudgHJe3rBjW8ZdIA+LY6CYgSBE4CdJolyW8qJqlau0KJXR++/
 +VdCXXyqPRgg4UrjpEeNhJ62/GQD0ROtsaFD07lLC2sVFNgBfsBKAeJZG6u7dMK2X83q2Mquxcnrf
 zo+a0=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hqhmG-0003NG-MR; Thu, 25 Jul 2019 17:43:40 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id BAF9D2742B60; Thu, 25 Jul 2019 18:43:39 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20190725165949.29699-3-jbrunet@baylibre.com>
X-Patchwork-Hint: ignore
Message-Id: <20190725174339.BAF9D2742B60@ypsilon.sirena.org.uk>
Date: Thu, 25 Jul 2019 18:43:39 +0100 (BST)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: codec2codec: name link using stream
	direction" to the asoc tree
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

   ASoC: codec2codec: name link using stream direction

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From 054d65004c6a008dfefbdae4fc1b46a3ad4e94c1 Mon Sep 17 00:00:00 2001
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 25 Jul 2019 18:59:45 +0200
Subject: [PATCH] ASoC: codec2codec: name link using stream direction

At the moment, codec to codec dai link widgets are named after the
cpu dai and the 1st codec valid on the link. This might be confusing
if there is multiple valid codecs on the link for one stream
direction.

Instead, use the dai link name and the stream direction to name the
the dai link widget

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Link: https://lore.kernel.org/r/20190725165949.29699-3-jbrunet@baylibre.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-dapm.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 034b31fd2ecb..7db4abd9a0a5 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4056,8 +4056,7 @@ snd_soc_dapm_alloc_kcontrol(struct snd_soc_card *card,
 
 static struct snd_soc_dapm_widget *
 snd_soc_dapm_new_dai(struct snd_soc_card *card, struct snd_soc_pcm_runtime *rtd,
-		     struct snd_soc_dapm_widget *source,
-		     struct snd_soc_dapm_widget *sink)
+		     char *id)
 {
 	struct snd_soc_dapm_widget template;
 	struct snd_soc_dapm_widget *w;
@@ -4067,7 +4066,7 @@ snd_soc_dapm_new_dai(struct snd_soc_card *card, struct snd_soc_pcm_runtime *rtd,
 	int ret;
 
 	link_name = devm_kasprintf(card->dev, GFP_KERNEL, "%s-%s",
-				   source->name, sink->name);
+				   rtd->dai_link->name, id);
 	if (!link_name)
 		return ERR_PTR(-ENOMEM);
 
@@ -4247,15 +4246,13 @@ static void dapm_connect_dai_link_widgets(struct snd_soc_card *card,
 	}
 
 	for_each_rtd_codec_dai(rtd, i, codec_dai) {
-
 		/* connect BE DAI playback if widgets are valid */
 		codec = codec_dai->playback_widget;
 
 		if (playback_cpu && codec) {
 			if (!playback) {
 				playback = snd_soc_dapm_new_dai(card, rtd,
-								playback_cpu,
-								codec);
+								"playback");
 				if (IS_ERR(playback)) {
 					dev_err(rtd->dev,
 						"ASoC: Failed to create DAI %s: %ld\n",
@@ -4284,8 +4281,7 @@ static void dapm_connect_dai_link_widgets(struct snd_soc_card *card,
 		if (codec && capture_cpu) {
 			if (!capture) {
 				capture = snd_soc_dapm_new_dai(card, rtd,
-							       codec,
-							       capture_cpu);
+							       "capture");
 				if (IS_ERR(capture)) {
 					dev_err(rtd->dev,
 						"ASoC: Failed to create DAI %s: %ld\n",
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
