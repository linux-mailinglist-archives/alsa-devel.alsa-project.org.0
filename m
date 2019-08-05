Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F5382199
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2019 18:23:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D544F16A9;
	Mon,  5 Aug 2019 18:22:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D544F16A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565022209;
	bh=TMMP3CrVkkyAEqhY+Zt+Wat3chUb62BQ/Bm5z+Sdlpg=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=CLTtJ3YdWnl96OBMvNXBzmRuuHeBhj5c0ITWmDAdhGs3Co4iezAfAdAnMmrmZlzat
	 vn2F/sEhRzJFJ38awUutzCHNIkbPDyRtuo/u7RG2SvJXUL+sj9HNr1Js9iGpiJZ6EB
	 p8p74yH+XRFU8GTXSysGt5NzO9Vqrc0CgMncifAs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C268F8075C;
	Mon,  5 Aug 2019 18:10:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4154F8065D; Mon,  5 Aug 2019 18:10:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90453F80529
 for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2019 18:10:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90453F80529
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="UmGTen0M"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=qxu33x+vGNPyDbLDs5HwGKaKlOK+rtGWZVK4uIdpAZo=; b=UmGTen0M2DCi
 qw4C8/HHW+BGN8t8qPmfKSH8Oj3/zCmphHtDPGjwb9L5Ka3NlXL2GtZVaXxJGXaMaUs21EcxUBzod
 ArkdMVuTADikjxK+5HN7i4KQ//JWOB/UkrJG8bhmTj6wjRAJDcCGzZcEV4koSmzk2iN49r7B2jW7F
 RWGdA=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hufYe-0000ld-OP; Mon, 05 Aug 2019 16:10:00 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 06B7C2742D06; Mon,  5 Aug 2019 17:09:59 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <878ssl5rn5.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190805161000.06B7C2742D06@ypsilon.sirena.org.uk>
Date: Mon,  5 Aug 2019 17:09:59 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-component: add
	snd_soc_component_trigger()" to the asoc tree
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

   ASoC: soc-component: add snd_soc_component_trigger()

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

From 5693d50c830272cb3c4a04d2ce4db502debd1259 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 26 Jul 2019 13:50:29 +0900
Subject: [PATCH] ASoC: soc-component: add snd_soc_component_trigger()

Current ALSA SoC is directly using component->driver->ops->xxx,
thus, it is deep nested, and makes code difficult to read,
and is not good for encapsulation.
This patch adds new snd_soc_component_trigger() and use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/878ssl5rn5.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-component.h |  3 +++
 sound/soc/soc-component.c     | 11 +++++++++++
 sound/soc/soc-pcm.c           |  6 +-----
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index fbcd911ac25e..302e27a89d47 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -350,5 +350,8 @@ int snd_soc_component_hw_params(struct snd_soc_component *component,
 				struct snd_pcm_hw_params *params);
 int snd_soc_component_hw_free(struct snd_soc_component *component,
 			      struct snd_pcm_substream *substream);
+int snd_soc_component_trigger(struct snd_soc_component *component,
+			      struct snd_pcm_substream *substream,
+			      int cmd);
 
 #endif /* __SOC_COMPONENT_H */
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index e2bc34efe547..cf0d20a877e6 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -336,3 +336,14 @@ int snd_soc_component_hw_free(struct snd_soc_component *component,
 
 	return 0;
 }
+
+int snd_soc_component_trigger(struct snd_soc_component *component,
+			      struct snd_pcm_substream *substream,
+			      int cmd)
+{
+	if (component->driver->ops &&
+	    component->driver->ops->trigger)
+		return component->driver->ops->trigger(substream, cmd);
+
+	return 0;
+}
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 8c5289904f20..cd49c2d688c3 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1065,11 +1065,7 @@ static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 	for_each_rtdcom(rtd, rtdcom) {
 		component = rtdcom->component;
 
-		if (!component->driver->ops ||
-		    !component->driver->ops->trigger)
-			continue;
-
-		ret = component->driver->ops->trigger(substream, cmd);
+		ret = snd_soc_component_trigger(component, substream, cmd);
 		if (ret < 0)
 			return ret;
 	}
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
