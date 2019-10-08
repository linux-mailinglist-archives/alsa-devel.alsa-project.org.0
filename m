Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFBFCFAE8
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 15:06:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63DFC1674;
	Tue,  8 Oct 2019 15:05:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63DFC1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570540009;
	bh=iPeSy6RnlZ+XjdlfOHrDCRRppqYm8LenFPvLgEHuisE=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=PS84urUSsBexFqSWEGAPKviX5gTsqXgSjm4NzGUGC+fnzCE/SSIlYxTkTpuIDwhlv
	 IotzLI4mPT6pxCD9/Qxl1dMfWMEkW0zX9OAr07BuvWVXerapg2tJvrj3zF8G1NQmtd
	 u4mH7VaqUuHN5/q9z6004K+eBo7dkh+ZuD+MzAEk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9725F80771;
	Tue,  8 Oct 2019 14:54:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55FC2F80716; Tue,  8 Oct 2019 14:53:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91F1EF8060D
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:53:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91F1EF8060D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="s2ksn9Xu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=uBcv8XILeaNU+eKErtknmtYPBjSwRaMR4JiU12iwSVs=; b=s2ksn9XuJCCJ
 v9WUCi2xqEB20DXzHwfs0XYlYP2AKy+QWXcE0EKRcgyWKrzd7xCT8evUjd6sH3iLwUGrnjRrgXFoD
 IBX/cJPecrcRFYndnSfj9grd4Ksc0Jy87INJbsCaRANbDXj9Qj5wFtrv3IArMaiGm6qG1JtNU7xfd
 tI4Pc=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHozZ-0008NT-Bh; Tue, 08 Oct 2019 12:53:29 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id DD8AD2740D4B; Tue,  8 Oct 2019 13:53:28 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87sgob90ep.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191008125328.DD8AD2740D4B@ypsilon.sirena.org.uk>
Date: Tue,  8 Oct 2019 13:53:28 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: qcom: q6routing: remove snd_pcm_ops" to
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

   ASoC: qcom: q6routing: remove snd_pcm_ops

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

From e198048bdc63b8a5f258c990b4d9ad8a08b7932a Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:33:34 +0900
Subject: [PATCH] ASoC: qcom: q6routing: remove snd_pcm_ops

snd_pcm_ops is no longer needed.
Let's use component driver callback.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87sgob90ep.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/qcom/qdsp6/q6routing.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
index ddcd9978cf57..20724102e85a 100644
--- a/sound/soc/qcom/qdsp6/q6routing.c
+++ b/sound/soc/qcom/qdsp6/q6routing.c
@@ -939,12 +939,12 @@ static const struct snd_soc_dapm_route intercon[] = {
 
 };
 
-static int routing_hw_params(struct snd_pcm_substream *substream,
-				     struct snd_pcm_hw_params *params)
+static int routing_hw_params(struct snd_soc_component *component,
+			     struct snd_pcm_substream *substream,
+			     struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *c = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
-	struct msm_routing_data *data = dev_get_drvdata(c->dev);
+	struct msm_routing_data *data = dev_get_drvdata(component->dev);
 	unsigned int be_id = rtd->cpu_dai->id;
 	struct session_data *session;
 	int path_type;
@@ -980,10 +980,6 @@ static int routing_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static struct snd_pcm_ops q6pcm_routing_ops = {
-	.hw_params = routing_hw_params,
-};
-
 static int msm_routing_probe(struct snd_soc_component *c)
 {
 	int i;
@@ -997,9 +993,9 @@ static int msm_routing_probe(struct snd_soc_component *c)
 }
 
 static const struct snd_soc_component_driver msm_soc_routing_component = {
-	.ops = &q6pcm_routing_ops,
 	.probe = msm_routing_probe,
 	.name = DRV_NAME,
+	.hw_params = routing_hw_params,
 	.dapm_widgets = msm_qdsp6_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(msm_qdsp6_widgets),
 	.dapm_routes = intercon,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
