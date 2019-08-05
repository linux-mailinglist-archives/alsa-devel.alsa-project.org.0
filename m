Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08436821A9
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2019 18:26:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95CAB167D;
	Mon,  5 Aug 2019 18:25:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95CAB167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565022407;
	bh=aXkiA9Dr9J2yd0H6+xYEtm18zLLlH9wcyxfsuIaJ7kY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=qFLxf6J46PO8D6DCvFI39ckWfsmNKL3piTy5JNLnLYeUen+WUseBO4PZvGsQDvb55
	 pgFG5MWFLxKHClNWhw2mxXttK6jJERTEZv7x9nmOrOOpU7yJvY4zd8kg+RkgO88d0M
	 avdz1DXD4enaU9ZzRAdHX0PNR6yavEKRrPndBRls=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED1DCF807D0;
	Mon,  5 Aug 2019 18:10:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61C8BF805FF; Mon,  5 Aug 2019 18:10:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29B49F805FD
 for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2019 18:10:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29B49F805FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="s8ggr4IR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=M+s7fR76lKAne3Xws+0LjJoMdk6p/CLULOmTlulok1A=; b=s8ggr4IRVQji
 4/0cKQUuhrFQtN+3dAY5/CemPGGHkMx1Wsa/h6ILJLwd1j8qORtXtOw76Mx0/xTR65pcgWTJAMgq5
 OSw+3pDUAlQ1t3ZRV/7M840oIk4JhLayMNVoJhRTr4ZzN6prBJ7tIO9Swf78ANq4Hhf0Nt/vAwQXE
 gqD10=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hufYf-0000lw-JN; Mon, 05 Aug 2019 16:10:01 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id F18472742D06; Mon,  5 Aug 2019 17:10:00 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ef2d5rnr.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190805161000.F18472742D06@ypsilon.sirena.org.uk>
Date: Mon,  5 Aug 2019 17:10:00 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-component: add
	snd_soc_component_close()" to the asoc tree
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

   ASoC: soc-component: add snd_soc_component_close()

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

From 3672beb8cad6beb7b8c017514aef0f4f507debcf Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 26 Jul 2019 13:50:07 +0900
Subject: [PATCH] ASoC: soc-component: add snd_soc_component_close()

Current ALSA SoC is directly using component->driver->ops->xxx,
thus, it is deep nested, and makes code difficult to read,
and is not good for encapsulation.
This patch adds new snd_soc_component_close() and use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87ef2d5rnr.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-component.h |  2 ++
 sound/soc/soc-component.c     | 10 ++++++++++
 sound/soc/soc-pcm.c           |  8 +++-----
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 156b1a5b6ddd..8dacac953884 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -341,5 +341,7 @@ int snd_soc_component_force_enable_pin_unlocked(
 /* component driver ops */
 int snd_soc_component_open(struct snd_soc_component *component,
 			   struct snd_pcm_substream *substream);
+int snd_soc_component_close(struct snd_soc_component *component,
+			    struct snd_pcm_substream *substream);
 
 #endif /* __SOC_COMPONENT_H */
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index ada46f9729b2..cee66183470d 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -295,3 +295,13 @@ int snd_soc_component_open(struct snd_soc_component *component,
 
 	return 0;
 }
+
+int snd_soc_component_close(struct snd_soc_component *component,
+			    struct snd_pcm_substream *substream)
+{
+	if (component->driver->ops &&
+	    component->driver->ops->close)
+		return component->driver->ops->close(substream);
+
+	return 0;
+}
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index caf7028cee62..4848642ef159 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -465,6 +465,7 @@ static int soc_pcm_components_close(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_rtdcom_list *rtdcom;
 	struct snd_soc_component *component;
+	int ret = 0;
 
 	for_each_rtdcom(rtd, rtdcom) {
 		component = rtdcom->component;
@@ -472,14 +473,11 @@ static int soc_pcm_components_close(struct snd_pcm_substream *substream,
 		if (component == last)
 			break;
 
-		if (component->driver->ops &&
-		    component->driver->ops->close)
-			component->driver->ops->close(substream);
-
+		ret |= snd_soc_component_close(component, substream);
 		snd_soc_component_module_put_when_close(component);
 	}
 
-	return 0;
+	return ret;
 }
 
 /*
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
