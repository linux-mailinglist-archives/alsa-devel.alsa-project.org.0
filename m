Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F0F8219D
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2019 18:24:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEE8B1688;
	Mon,  5 Aug 2019 18:23:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEE8B1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565022288;
	bh=I29Bnx/tHj3dvYV4hmAoqzb3GrOiYhKpHRB1gaQCgIA=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=tmgVD0d8JUe3YEfhfwIl30Qi1XD/ndUJb+hWJOutmoxqPD77bBd0w/mq0WsjTRe9S
	 oNphBVCmluZY82/hv4D+33K1y6zefd1aBk5ILFiLh4X4+9KTHBBV7q79QLV0IQyO3t
	 cnTb7QcOM2rcrs/UlwDOHLnR+3J+UQa0BEb9+B4I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20E08F8076F;
	Mon,  5 Aug 2019 18:10:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C70CF80671; Mon,  5 Aug 2019 18:10:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04048F805FC
 for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2019 18:10:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04048F805FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="QVFdLMNH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=M0ufObHDhXp5/NjlsCZdEQjQPPqpF4JF6J5hx79Of3c=; b=QVFdLMNHzYzC
 bSe30A/PapvqzoBZe7Re4Mylt8XniswiTzGxoxHTpcypjFBw4TKTI7g+foMe4iDOYFpQgylVj3tAb
 YKRcUHWMwgGVAWBFwkIpsNQ7ULbp5PiAlJmzliidARRNZwhlV+t9Wu6TK5wZvTp5C6LQBVg7ljmrh
 BEIo8=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hufYf-0000lm-AE; Mon, 05 Aug 2019 16:10:01 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 834A22742E44; Mon,  5 Aug 2019 17:10:00 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87blxh5rnf.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190805161000.834A22742E44@ypsilon.sirena.org.uk>
Date: Mon,  5 Aug 2019 17:10:00 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-component: add
	snd_soc_component_hw_params()" to the asoc tree
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

   ASoC: soc-component: add snd_soc_component_hw_params()

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

From 245c539a1206d74e8508a07550fb7c99d0817b8c Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 26 Jul 2019 13:50:19 +0900
Subject: [PATCH] ASoC: soc-component: add snd_soc_component_hw_params()

Current ALSA SoC is directly using component->driver->ops->xxx,
thus, it is deep nested, and makes code difficult to read,
and is not good for encapsulation.
This patch adds new snd_soc_component_hw_params() and use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87blxh5rnf.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-component.h |  3 +++
 sound/soc/soc-component.c     | 11 +++++++++++
 sound/soc/soc-pcm.c           |  6 +-----
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index ff8233014444..778a6e7d352d 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -345,5 +345,8 @@ int snd_soc_component_close(struct snd_soc_component *component,
 			    struct snd_pcm_substream *substream);
 int snd_soc_component_prepare(struct snd_soc_component *component,
 			      struct snd_pcm_substream *substream);
+int snd_soc_component_hw_params(struct snd_soc_component *component,
+				struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params);
 
 #endif /* __SOC_COMPONENT_H */
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 733d7139d875..7b6456370da5 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -315,3 +315,14 @@ int snd_soc_component_prepare(struct snd_soc_component *component,
 
 	return 0;
 }
+
+int snd_soc_component_hw_params(struct snd_soc_component *component,
+				struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params)
+{
+	if (component->driver->ops &&
+	    component->driver->ops->hw_params)
+		return component->driver->ops->hw_params(substream, params);
+
+	return 0;
+}
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index c7fee67bc0dc..8be1d22dc87a 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -951,11 +951,7 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
 	for_each_rtdcom(rtd, rtdcom) {
 		component = rtdcom->component;
 
-		if (!component->driver->ops ||
-		    !component->driver->ops->hw_params)
-			continue;
-
-		ret = component->driver->ops->hw_params(substream, params);
+		ret = snd_soc_component_hw_params(component, substream, params);
 		if (ret < 0) {
 			dev_err(component->dev,
 				"ASoC: %s hw params failed: %d\n",
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
