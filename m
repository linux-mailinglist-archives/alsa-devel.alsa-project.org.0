Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 767CB82177
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2019 18:16:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FD1A167E;
	Mon,  5 Aug 2019 18:15:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FD1A167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565021786;
	bh=cbBOekg+PNUuSfaRzp2XGNg28SUI+472jEl/W/i5Zvs=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=cPje4zDMbKyyRcev8XtS08ZWbGcvTXQCN/eFaXvUiUvGppFDjqob6AxLcfH7uWDIY
	 whVKbWstmBU2C5kaM6vNxl4i3wnsgrsvs7dSCs8qR4gacxmd1S0pguHL7CA8uhAEZR
	 ghzwuocTnLNCjiBjdBy+xJRb+U62ag9l1aTf1fBo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6592DF80672;
	Mon,  5 Aug 2019 18:10:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC076F8063C; Mon,  5 Aug 2019 18:10:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88F3DF8011B
 for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2019 18:09:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88F3DF8011B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="fbNj9W89"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=yNMUVzKtI955m2kTTzpkttUnIP1d7AkFv14f6QN1Z7Y=; b=fbNj9W89bmcD
 /5x+GZ4v43DzQBArnj+SIYwh8rUR8cEYuT8gU9ZvJlo4umtK08RvllnDVOlRmxCMipxBFJ9MFFeLg
 4aOH104yRoMSalDWjI+5MiKFHMAX4W7wnetu17w8IixbT17RN8wL389uuZrdt3oBRap4j5W3z8VPg
 FzEto=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hufYd-0000l1-4t; Mon, 05 Aug 2019 16:09:59 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 9006E2742D06; Mon,  5 Aug 2019 17:09:58 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87zhl14d14.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190805160958.9006E2742D06@ypsilon.sirena.org.uk>
Date: Mon,  5 Aug 2019 17:09:58 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-component: add
	snd_soc_component_of_xlate_dai_id()" to the asoc tree
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

   ASoC: soc-component: add snd_soc_component_of_xlate_dai_id()

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

From 2c7b1704819435d188c7697c6815f788bf9e6200 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 26 Jul 2019 13:51:26 +0900
Subject: [PATCH] ASoC: soc-component: add snd_soc_component_of_xlate_dai_id()

Current ALSA SoC is directly using component->driver->xxx,
thus, it is deep nested, and makes code difficult to read,
and is not good for encapsulation.
This patch adds new snd_soc_component_of_xlate_dai_id() and use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87zhl14d14.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-component.h | 2 ++
 sound/soc/soc-component.c     | 9 +++++++++
 sound/soc/soc-core.c          | 5 ++---
 3 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index b8480d947901..3f4acd337c4a 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -358,5 +358,7 @@ void snd_soc_component_resume(struct snd_soc_component *component);
 int snd_soc_component_is_suspended(struct snd_soc_component *component);
 int snd_soc_component_probe(struct snd_soc_component *component);
 void snd_soc_component_remove(struct snd_soc_component *component);
+int snd_soc_component_of_xlate_dai_id(struct snd_soc_component *component,
+				      struct device_node *ep);
 
 #endif /* __SOC_COMPONENT_H */
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index eba77ea2b62d..faf49992f661 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -380,3 +380,12 @@ void snd_soc_component_remove(struct snd_soc_component *component)
 	if (component->driver->remove)
 		component->driver->remove(component);
 }
+
+int snd_soc_component_of_xlate_dai_id(struct snd_soc_component *component,
+				      struct device_node *ep)
+{
+	if (component->driver->of_xlate_dai_id)
+		return component->driver->of_xlate_dai_id(component, ep);
+
+	return -ENOTSUPP;
+}
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 6a6403ddf62d..f63d09dd55f4 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3334,9 +3334,8 @@ int snd_soc_get_dai_id(struct device_node *ep)
 	ret = -ENOTSUPP;
 	mutex_lock(&client_mutex);
 	component = soc_find_component(&dlc);
-	if (component &&
-	    component->driver->of_xlate_dai_id)
-		ret = component->driver->of_xlate_dai_id(component, ep);
+	if (component)
+		ret = snd_soc_component_of_xlate_dai_id(component, ep);
 	mutex_unlock(&client_mutex);
 
 	of_node_put(dlc.of_node);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
