Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC0B37FE3
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 23:49:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E47A71697;
	Thu,  6 Jun 2019 23:49:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E47A71697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559857794;
	bh=yHbIAImtUt3gIdYmAV29+WdBEvMnsGwQ8mYKdVF7m1s=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=rNOidi3BRhlwED7wFuFi7Ihd1JDhF55yQ0lOUegO7r9SWhT1mzwqt15NepeFCRdad
	 xMnTMxAXl/t2mApTPJ2e28E212f0/qV5LSuJ2QaVQruKR/zD3jWjdxtYvztkNIY7Hg
	 YcQPqP34Vd1vekliLFrz/h0CgMxY0zDflCF+rfZo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B26AFF89844;
	Thu,  6 Jun 2019 23:28:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 061A7F897D9; Thu,  6 Jun 2019 23:26:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D10BDF89756
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:26:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D10BDF89756
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="CZ7xCNdF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=hYY8vwGyyDH6ZCZr2i8ZHAlQfvpbl+eE4lEMRPFY/vQ=; b=CZ7xCNdFh30j
 TbZ2oWq0bo+pvAEre9MJdIvugvb2HrKdsW4QljiMuQf3fg3oNLs9bG38n8EkZb16UotHiUk6Uq483
 6SIKTalYAZ30AC3UQi8U726f2oA71T3zIL6bobv9EyYUAuD3sF5ONswlevQjoo42oT5pliQ8Pq00H
 vXmMQ=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYztm-0007Jw-Ia; Thu, 06 Jun 2019 21:26:14 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 07E01440049; Thu,  6 Jun 2019 22:26:14 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87tvd3fjgj.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212614.07E01440049@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:26:13 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: vc4: vc4_htmi: use modern dai_link
	style" to the asoc tree
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

   ASoC: vc4: vc4_htmi: use modern dai_link style

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From 0467d8ef0f61c91774f49a2d287b4d6fe58d5bdb Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:19:19 +0900
Subject: [PATCH] ASoC: vc4: vc4_htmi: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 99fc8569e0f5..6beac1ca1f27 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -69,6 +69,9 @@
 struct vc4_hdmi_audio {
 	struct snd_soc_card card;
 	struct snd_soc_dai_link link;
+	struct snd_soc_dai_link_component cpu;
+	struct snd_soc_dai_link_component codec;
+	struct snd_soc_dai_link_component platform;
 	int samplerate;
 	int channels;
 	struct snd_dmaengine_dai_dma_data dma_data;
@@ -1096,12 +1099,20 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *hdmi)
 		return ret;
 	}
 
+	dai_link->cpus		= &hdmi->audio.cpu;
+	dai_link->codecs	= &hdmi->audio.codec;
+	dai_link->platforms	= &hdmi->audio.platform;
+
+	dai_link->num_cpus	= 1;
+	dai_link->num_codecs	= 1;
+	dai_link->num_platforms	= 1;
+
 	dai_link->name = "MAI";
 	dai_link->stream_name = "MAI PCM";
-	dai_link->codec_dai_name = vc4_hdmi_audio_codec_dai_drv.name;
-	dai_link->cpu_dai_name = dev_name(dev);
-	dai_link->codec_name = dev_name(dev);
-	dai_link->platform_name = dev_name(dev);
+	dai_link->codecs->dai_name = vc4_hdmi_audio_codec_dai_drv.name;
+	dai_link->cpus->dai_name = dev_name(dev);
+	dai_link->codecs->name = dev_name(dev);
+	dai_link->platforms->name = dev_name(dev);
 
 	card->dai_link = dai_link;
 	card->num_links = 1;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
