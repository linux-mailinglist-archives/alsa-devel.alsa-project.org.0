Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A781382190
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2019 18:21:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FAC9166A;
	Mon,  5 Aug 2019 18:20:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FAC9166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565022080;
	bh=dgfA+d1sM9YmNBckqtDwxDT1H0JxqHd1IWxANanF0WY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=OyQu3wZb1gBSp18i1NfNLwkf1AN1DSdEkQh8CytST63PAoBCtEcmm3JfHM2fLqA7f
	 LnqUbTT83AWFUBzhhZ0qTWe7X+W3sbeJjLdsihVlXxMtGoGVKny2QVcZrajnwwbtHE
	 zxZwvhGmBmFBwgEcpJK03Fk5213aR8eBhGztckv8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED5F3F8072A;
	Mon,  5 Aug 2019 18:10:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31348F80642; Mon,  5 Aug 2019 18:10:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B79DF805E2
 for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2019 18:10:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B79DF805E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="rMI+O4Ym"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=JCW5LYwMirSmtrQ8MX3dyIuwKDWTbj0FY66OmRw/Pig=; b=rMI+O4YmxInu
 K7NmD4gy9LmMlk5SJyHZMjUPmV7PWE/y4sgbn3FPWvYWnGmuJVB7F7zvBhvYiAPepspV6SNam0LwF
 HQ2BTIpnBj0PH/uyIarPpGr26TTwQjrVVpdEAUayoWIWhPiLODNvb089kzFrdcsqRxZixzBXTMw9U
 KKqkI=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hufYd-0000lL-SC; Mon, 05 Aug 2019 16:09:59 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 4B5E42742D06; Mon,  5 Aug 2019 17:09:59 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <874l395rlx.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190805160959.4B5E42742D06@ypsilon.sirena.org.uk>
Date: Mon,  5 Aug 2019 17:09:59 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-component: add
	snd_soc_component_is_suspended()" to the asoc tree
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

   ASoC: soc-component: add snd_soc_component_is_suspended()

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

From e40fadbcef583808c11d2e86b8ac1c652731468e Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 26 Jul 2019 13:51:13 +0900
Subject: [PATCH] ASoC: soc-component: add snd_soc_component_is_suspended()

Current ALSA SoC is directly using component->xxx,
But, it is not good for encapsulation.
This patch adds new snd_soc_component_is_suspended() and use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/874l395rlx.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-component.h | 1 +
 sound/soc/soc-component.c     | 5 +++++
 sound/soc/soc-core.c          | 5 ++---
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 1e3b70855ba7..9600dc4ca6b4 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -355,5 +355,6 @@ int snd_soc_component_trigger(struct snd_soc_component *component,
 			      int cmd);
 void snd_soc_component_suspend(struct snd_soc_component *component);
 void snd_soc_component_resume(struct snd_soc_component *component);
+int snd_soc_component_is_suspended(struct snd_soc_component *component);
 
 #endif /* __SOC_COMPONENT_H */
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index cbae7672b72d..0a9ca84d7ac6 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -361,3 +361,8 @@ void snd_soc_component_resume(struct snd_soc_component *component)
 		component->driver->resume(component);
 	component->suspended = 0;
 }
+
+int snd_soc_component_is_suspended(struct snd_soc_component *component)
+{
+	return component->suspended;
+}
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 6cdfe7b2fe06..ea93edd328a2 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -503,7 +503,7 @@ int snd_soc_suspend(struct device *dev)
 		 * If there are paths active then the COMPONENT will be held
 		 * with bias _ON and should not be suspended.
 		 */
-		if (!component->suspended) {
+		if (!snd_soc_component_is_suspended(component)) {
 			switch (snd_soc_dapm_get_bias_level(dapm)) {
 			case SND_SOC_BIAS_STANDBY:
 				/*
@@ -592,9 +592,8 @@ static void soc_resume_deferred(struct work_struct *work)
 	}
 
 	for_each_card_components(card, component) {
-		if (component->suspended) {
+		if (snd_soc_component_is_suspended(component))
 			snd_soc_component_resume(component);
-		}
 	}
 
 	for_each_card_rtds(card, rtd) {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
