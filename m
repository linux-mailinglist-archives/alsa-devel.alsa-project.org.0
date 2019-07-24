Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E410A737C0
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2019 21:21:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4092A19FF;
	Wed, 24 Jul 2019 21:20:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4092A19FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563996092;
	bh=8EpInMjKNJhUiUzmm2i0JdRzRgzaVuF8BYvXufxIF2A=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=bzUJp09CNxtnJanvKA48gMTlyn3tCbc99o6GXa6PO67Cu31gQg01qblhRJKjKDCR9
	 3erT3qQD/0A6HQjJzO9b7sgR6SXYhK577E8QYS8e9LuRHUa/RJ72R2IVThQ8SjHoWj
	 KpLu4P5b5sfeZpBNU8AVZbf0/Wx5TBLaZIPiVhTk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31FD5F8049B;
	Wed, 24 Jul 2019 21:18:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BFD0F803D6; Wed, 24 Jul 2019 21:18:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D247DF803D6
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 21:17:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D247DF803D6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="XupVBnM/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=cTO/RSPQnQNiFoMgtxy++wVlgWf0hEbmQ5jOb+/qEkY=; b=XupVBnM/++01
 IbI3LW4Bx8XGR+fS3XZ+XEBLAEvTR+uEdVQi47yXMkWzUFHW7n9bCJuavb+xTCt9A9Vz7yhwqJJMn
 LbnRdEYOQghuVtYL8D9uwfOPMfamc2EwCeDQIESckDMd6Q/owTvc+nLdiYMzljgKo0O29DZrAmCT3
 Gb7Vg=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hqMlt-0008W2-6S; Wed, 24 Jul 2019 19:17:53 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id B671A2742B60; Wed, 24 Jul 2019 20:17:52 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <alpine.DEB.2.20.1907241132350.6338@lnxricardw1.se.axis.com>
X-Patchwork-Hint: ignore
Message-Id: <20190724191752.B671A2742B60@ypsilon.sirena.org.uk>
Date: Wed, 24 Jul 2019 20:17:52 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Ricard Wanderlof <ricardw@axis.com>
Subject: [alsa-devel] Applied "ASoC: Fail card instantiation if DAI format
	setup fails" to the asoc tree
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

   ASoC: Fail card instantiation if DAI format setup fails

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

From 40aa5383e393d72f6aa3943a4e7b1aae25a1e43b Mon Sep 17 00:00:00 2001
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
Date: Wed, 24 Jul 2019 11:38:44 +0200
Subject: [PATCH] ASoC: Fail card instantiation if DAI format setup fails

If the DAI format setup fails, there is no valid communication format
between CPU and CODEC, so fail card instantiation, rather than continue
with a card that will most likely not function properly.

Signed-off-by: Ricard Wanderlof <ricardw@axis.com>
Link: https://lore.kernel.org/r/alpine.DEB.2.20.1907241132350.6338@lnxricardw1.se.axis.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index c0a774d0a5ff..1486fb2eb921 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1511,8 +1511,11 @@ static int soc_probe_link_dais(struct snd_soc_card *card,
 		}
 	}
 
-	if (dai_link->dai_fmt)
-		snd_soc_runtime_set_dai_fmt(rtd, dai_link->dai_fmt);
+	if (dai_link->dai_fmt) {
+		ret = snd_soc_runtime_set_dai_fmt(rtd, dai_link->dai_fmt);
+		if (ret)
+			return ret;
+	}
 
 	ret = soc_post_component_init(rtd, dai_link->name);
 	if (ret)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
