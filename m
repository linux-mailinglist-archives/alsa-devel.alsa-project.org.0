Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AB0821AD
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2019 18:27:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91C2C1678;
	Mon,  5 Aug 2019 18:26:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91C2C1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565022447;
	bh=fk/plsGCOfDlW3NEXIp+mMF25A6tbv9tQQ/rZXOkWko=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=pDBwNgNzeDf5JJUAzJq9mclGup053TgeciM7Pk+ccFY6U5XiwMmNu2k7q+qiVIPIm
	 EhLPqRkmQ3wl/tdKxgcEdBJCocU+tv2AtrqQsTbls2YE7duv51frvgMJClPdMIJP9C
	 BZUkCkJIHAYecTv+mOsJpmZFsrGKRXCu1atCO1qU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20212F80859;
	Mon,  5 Aug 2019 18:10:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9732AF805FF; Mon,  5 Aug 2019 18:10:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 280E2F8060E
 for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2019 18:10:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 280E2F8060E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="mF72OyyG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=OdDWV3ArzNdVWW+hlIR1OOMECH8t4ylJP/JhZQy5AOA=; b=mF72OyyGSfBf
 0x3d+gFIlrhhd5utEUM3/mZ2js2Rpi2zswMwORHLlSWCXHp/uMbfrH7o+/wKkhHe4a+WTdr03FLfq
 cHxSxb5ZRmLE4i4HL3bO/TRBw++036RNatX24EJaNu6zt4tJlcFQlymrTAV28OpwUXUsp2k3zqPCa
 JAKfc=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hufYg-0000mA-7f; Mon, 05 Aug 2019 16:10:02 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 77C822742E44; Mon,  5 Aug 2019 17:10:01 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87h8795ro4.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190805161001.77C822742E44@ypsilon.sirena.org.uk>
Date: Mon,  5 Aug 2019 17:10:01 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-component: add
	snd_soc_component_get/put()" to the asoc tree
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

   ASoC: soc-component: add snd_soc_component_get/put()

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

From 4a81e8f30d0b422b7f10562952124d719f73b071 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 26 Jul 2019 13:49:54 +0900
Subject: [PATCH] ASoC: soc-component: add snd_soc_component_get/put()

ALSA SoC is calling try_module_get()/module_put() based on
component->driver->module_get_upon_open.
To keep simple and readable code, we should create its function.
This patch adds new snd_soc_component_get/put().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87h8795ro4.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-component.h | 13 +++++++++++++
 sound/soc/soc-component.c     | 18 ++++++++++++++++++
 sound/soc/soc-core.c          |  9 ++++-----
 sound/soc/soc-pcm.c           | 10 ++++------
 4 files changed, 39 insertions(+), 11 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index a97d499e5d7a..a76cadf49a16 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -287,6 +287,19 @@ void snd_soc_component_init_regmap(struct snd_soc_component *component,
 void snd_soc_component_exit_regmap(struct snd_soc_component *component);
 #endif
 
+#define snd_soc_component_module_get_when_probe(component)\
+	snd_soc_component_module_get(component, 0)
+#define snd_soc_component_module_get_when_open(component)	\
+	snd_soc_component_module_get(component, 1)
+int snd_soc_component_module_get(struct snd_soc_component *component,
+				 int upon_open);
+#define snd_soc_component_module_put_when_remove(component)	\
+	snd_soc_component_module_put(component, 0)
+#define snd_soc_component_module_put_when_close(component)	\
+	snd_soc_component_module_put(component, 1)
+void snd_soc_component_module_put(struct snd_soc_component *component,
+				  int upon_open);
+
 static inline void snd_soc_component_set_drvdata(struct snd_soc_component *c,
 						 void *data)
 {
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index e19f78bfb919..ac2d7bd5d844 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -5,6 +5,7 @@
 // Copyright (C) 2019 Renesas Electronics Corp.
 // Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
 //
+#include <linux/module.h>
 #include <sound/soc.h>
 
 /**
@@ -267,3 +268,20 @@ int snd_soc_component_set_jack(struct snd_soc_component *component,
 	return -ENOTSUPP;
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_set_jack);
+
+int snd_soc_component_module_get(struct snd_soc_component *component,
+				 int upon_open)
+{
+	if (component->driver->module_get_upon_open == !!upon_open &&
+	    !try_module_get(component->dev->driver->owner))
+		return -ENODEV;
+
+	return 0;
+}
+
+void snd_soc_component_module_put(struct snd_soc_component *component,
+				  int upon_open)
+{
+	if (component->driver->module_get_upon_open == !!upon_open)
+		module_put(component->dev->driver->owner);
+}
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index dc3e45547da2..9ba19efcc56c 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -926,8 +926,7 @@ static void soc_cleanup_component(struct snd_soc_component *component)
 	snd_soc_dapm_free(snd_soc_component_get_dapm(component));
 	soc_cleanup_component_debugfs(component);
 	component->card = NULL;
-	if (!component->driver->module_get_upon_open)
-		module_put(component->dev->driver->owner);
+	snd_soc_component_module_put_when_close(component);
 }
 
 static void soc_remove_component(struct snd_soc_component *component)
@@ -1255,9 +1254,9 @@ static int soc_probe_component(struct snd_soc_card *card,
 		return 0;
 	}
 
-	if (!component->driver->module_get_upon_open &&
-	    !try_module_get(component->dev->driver->owner))
-		return -ENODEV;
+	ret = snd_soc_component_module_get_when_probe(component);
+	if (ret < 0)
+		return ret;
 
 	component->card = card;
 	dapm->card = card;
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 1e6c4e226933..5fef18507286 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -15,7 +15,6 @@
 #include <linux/delay.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pm_runtime.h>
-#include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/workqueue.h>
 #include <linux/export.h>
@@ -440,12 +439,12 @@ static int soc_pcm_components_open(struct snd_pcm_substream *substream,
 		component = rtdcom->component;
 		*last = component;
 
-		if (component->driver->module_get_upon_open &&
-		    !try_module_get(component->dev->driver->owner)) {
+		ret = snd_soc_component_module_get_when_open(component);
+		if (ret < 0) {
 			dev_err(component->dev,
 				"ASoC: can't get module %s\n",
 				component->name);
-			return -ENODEV;
+			return ret;
 		}
 
 		if (!component->driver->ops ||
@@ -481,8 +480,7 @@ static int soc_pcm_components_close(struct snd_pcm_substream *substream,
 		    component->driver->ops->close)
 			component->driver->ops->close(substream);
 
-		if (component->driver->module_get_upon_open)
-			module_put(component->dev->driver->owner);
+		snd_soc_component_module_put_when_close(component);
 	}
 
 	return 0;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
