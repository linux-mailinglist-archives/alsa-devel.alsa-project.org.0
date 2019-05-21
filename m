Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D85A25974
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2019 22:50:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13E5115E0;
	Tue, 21 May 2019 22:49:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13E5115E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558471835;
	bh=PNgdN35zqU630XAtYVLkL1coCtDha1SGc3cOjKtqpvg=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=I7g09T3Os1I4DDC8AUc17GQgTCkefXIBse9/9KBsqLmGVUTuLOGhPt8n78gwEcy4Z
	 noO5WhwpTIR+yIL6v6x0DG7ttSeJzgiEfWpmz7azO5QMzcDA/NdLw6k2A/3SSIZdvf
	 oXDVE6hZEZt4bbaSGyvaa2+MuJfpf8tyrwBgzNNY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 474A0F89757;
	Tue, 21 May 2019 22:46:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEA5AF89756; Tue, 21 May 2019 22:46:17 +0200 (CEST)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD2FAF8972F
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 22:32:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD2FAF8972F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="EQbmVnqu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=BpMeRTd/F8q1dOpvDmitJNfki4ESxULIectbpG0jLiY=; b=EQbmVnquoClr
 Nmg6u0hwMJ4gHPZuOprbUXJv2tqD28pAZJdfpFrBBoYsfF6Ocnp7+yUO1DczTw21IPSx8OETbF5oK
 K6rmAF7yu+jf2Txefg38BnpWqGfe+S+PFUWyg2OU+QpEW33lcQ2MQpsRLb2TjV6BpcZBIRCZV0+5t
 11Fzk=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hTBRI-0001yl-05; Tue, 21 May 2019 20:32:48 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id D31411126D24; Tue, 21 May 2019 21:32:43 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87mujl3n4t.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190521203243.D31411126D24@debutante.sirena.org.uk>
Date: Tue, 21 May 2019 21:32:43 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [alsa-devel] Applied "ASoC: soc-dpm: fixup DAI active unbalance" to
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

   ASoC: soc-dpm: fixup DAI active unbalance

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.2

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

From f7c4842abfa1a219554a3ffd8c317e8fdd979bec Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 17 May 2019 10:21:12 +0900
Subject: [PATCH] ASoC: soc-dpm: fixup DAI active unbalance

snd_soc_dai_link_event() is updating snd_soc_dai :: active,
but it is unbalance.
It counts up if it has startup callback.

	case SND_SOC_DAPM_PRE_PMU:
		...
		snd_soc_dapm_widget_for_each_source_path(w, path) {
			...
			if (source->driver->ops->startup) {
				...
=>				source->active++;
			}
			...
		}
		...

But, always counts down

	case SND_SOC_DAPM_PRE_PMD:
		...
		snd_soc_dapm_widget_for_each_source_path(w, path) {
			...
=>			source->active--;
			...
		}

This patch always counts up when SND_SOC_DAPM_PRE_PMD.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-dapm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 65ee0bb5dd0b..62e27defce56 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3828,8 +3828,8 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 						ret);
 					goto out;
 				}
-				source->active++;
 			}
+			source->active++;
 			ret = soc_dai_hw_params(&substream, params, source);
 			if (ret < 0)
 				goto out;
@@ -3850,8 +3850,8 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 						ret);
 					goto out;
 				}
-				sink->active++;
 			}
+			sink->active++;
 			ret = soc_dai_hw_params(&substream, params, sink);
 			if (ret < 0)
 				goto out;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
