Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C6B82194
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2019 18:22:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F3E21683;
	Mon,  5 Aug 2019 18:21:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F3E21683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565022124;
	bh=YOni1XuzjXCQuAAg2e3sm8FdfYuQukPrwE0M7h0EU40=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=MQnciTYhANUT3qXl6SUjUTqCkspFAvyxaGiNeKyZiHoCTESlnHDFmlyElmCHhQ/yD
	 gHVMiZdFini2jyaYpkJwMG/0zApVWP3EyuH5OM+wJMSMnu085bjMhchOGC8ZIspN/Q
	 6InqdnxqpjSq+JCi8Jnro/7CpUzMfhn0XMKIrJHc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13C74F80733;
	Mon,  5 Aug 2019 18:10:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FEA7F80641; Mon,  5 Aug 2019 18:10:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8E68F805F5
 for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2019 18:10:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8E68F805F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="JCEJKTZq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=k2Mxrd5F7n/W9OsYCyde2oOlkAdOyCRZ6KdDFmQY9vc=; b=JCEJKTZq0LMm
 mkqsKgMf9yygY9V4CL3gMO9V8KSh7mJsvY8WWaQzvNGEEzyiWD2CVaxk7kw4wCYkBDoOVKvnP6l6l
 nTa9/zqwc9J4ySHbPAc6NIIfWkeffu3le2mwzYaQuJb/RD0aSwcGfUUarmfH0YTZ9y3sf9t4DSkSg
 h9M50=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hufYe-0000lR-6y; Mon, 05 Aug 2019 16:10:00 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 868D82742E44; Mon,  5 Aug 2019 17:09:59 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <875znp5rm2.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190805160959.868D82742E44@ypsilon.sirena.org.uk>
Date: Mon,  5 Aug 2019 17:09:59 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-component: add
	snd_soc_component_resume()" to the asoc tree
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

   ASoC: soc-component: add snd_soc_component_resume()

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

From 9a840cbac77a90e8406296aaa132ebf2c84ed9e3 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 26 Jul 2019 13:51:08 +0900
Subject: [PATCH] ASoC: soc-component: add snd_soc_component_resume()

Current ALSA SoC is directly using component->driver->xxx,
thus, it is deep nested, and makes code difficult to read,
and is not good for encapsulation.
This patch adds new snd_soc_component_resume() and use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/875znp5rm2.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-component.h | 1 +
 sound/soc/soc-component.c     | 7 +++++++
 sound/soc/soc-core.c          | 4 +---
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index cdb014f41fd1..1e3b70855ba7 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -354,5 +354,6 @@ int snd_soc_component_trigger(struct snd_soc_component *component,
 			      struct snd_pcm_substream *substream,
 			      int cmd);
 void snd_soc_component_suspend(struct snd_soc_component *component);
+void snd_soc_component_resume(struct snd_soc_component *component);
 
 #endif /* __SOC_COMPONENT_H */
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index f0e63cd991c8..cbae7672b72d 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -354,3 +354,10 @@ void snd_soc_component_suspend(struct snd_soc_component *component)
 		component->driver->suspend(component);
 	component->suspended = 1;
 }
+
+void snd_soc_component_resume(struct snd_soc_component *component)
+{
+	if (component->driver->resume)
+		component->driver->resume(component);
+	component->suspended = 0;
+}
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 855b19abc1d2..6cdfe7b2fe06 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -593,9 +593,7 @@ static void soc_resume_deferred(struct work_struct *work)
 
 	for_each_card_components(card, component) {
 		if (component->suspended) {
-			if (component->driver->resume)
-				component->driver->resume(component);
-			component->suspended = 0;
+			snd_soc_component_resume(component);
 		}
 	}
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
