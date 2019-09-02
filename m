Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AEAA55DC
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Sep 2019 14:25:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CA5C16C7;
	Mon,  2 Sep 2019 14:24:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CA5C16C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567427144;
	bh=Ns84Af/+RIeHEGzsWxid1AVCdVp1tqYToB5OgYlWuUc=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Tj8hoDNBdJ4Rm/43/rc0OC216uOpHLORZH1EhvyixhVdczlZfzHWXe97W9wF2tdDF
	 jcM7fai6knfBO5u9PlpfCIhkc6YTeb4cNinHhR8v/64h1mD7hfgnNCXdsFmx8CY+Bs
	 YkTNMHwwIv0l+UHa9pJyv90BWIdmdo0raZFBkiDI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1C03F803D0;
	Mon,  2 Sep 2019 14:24:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 872F7F8044A; Mon,  2 Sep 2019 14:23:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A90B6F80392
 for <alsa-devel@alsa-project.org>; Mon,  2 Sep 2019 14:23:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A90B6F80392
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="A0sHaEpm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=J3ImyrCWxLd18w8/wFzpExL11okTfQBV4ZtzEfNExpM=; b=A0sHaEpmEwNP
 0HWMNsSsvJoo/fEEsLbbYHurrLbTSIwd3RET2mneqYQ7IWdzM5wFpSzWtDkTSn0T2sI8DR21VX2KW
 o4A7MqNOFNP7UAAO3va62MyUC9YoqOMnyPPM0ZpcTFgwdqFy+sC8F+KhPhNvmSZaQZd5KT9vZN+y3
 VJcuk=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i4lNB-0003C0-2A; Mon, 02 Sep 2019 12:23:53 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 8AC3C2742CDC; Mon,  2 Sep 2019 13:23:52 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87r25c7lbo.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190902122352.8AC3C2742CDC@ypsilon.sirena.org.uk>
Date: Mon,  2 Sep 2019 13:23:52 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: dapm related setup at one
	place" to the asoc tree
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

   ASoC: soc-core: dapm related setup at one place

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

From b614beafa495c7f6fbc15cb6977e3fe48beea1e5 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 23 Aug 2019 09:58:47 +0900
Subject: [PATCH] ASoC: soc-core: dapm related setup at one place

Current ASoC setups some dapm related member at
snd_soc_component_initialize() which is called when component was
registered, and setups remaining member at soc_probe_component()
which is called when component was probed.
This kind of setup separation is no meanings, and it is very
difficult to read and confusable.
This patch setups all dapm settings at one place.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87r25c7lbo.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 8fa1cfcc6f17..21c005a044e8 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1019,12 +1019,19 @@ static int soc_probe_component(struct snd_soc_card *card,
 		return ret;
 
 	component->card = card;
-	dapm->card = card;
-	INIT_LIST_HEAD(&dapm->list);
 	soc_set_name_prefix(card, component);
 
 	soc_init_component_debugfs(component);
 
+	INIT_LIST_HEAD(&dapm->list);
+	dapm->card		= card;
+	dapm->dev		= component->dev;
+	dapm->component		= component;
+	dapm->bias_level	= SND_SOC_BIAS_OFF;
+	dapm->idle_bias_off	= !component->driver->idle_bias_on;
+	dapm->suspend_bias_off	= component->driver->suspend_bias_off;
+	list_add(&dapm->list, &card->dapm_list);
+
 	ret = snd_soc_dapm_new_controls(dapm,
 					component->driver->dapm_widgets,
 					component->driver->num_dapm_widgets);
@@ -1077,7 +1084,6 @@ static int soc_probe_component(struct snd_soc_card *card,
 	if (ret < 0)
 		goto err_probe;
 
-	list_add(&dapm->list, &card->dapm_list);
 	/* see for_each_card_components */
 	list_add(&component->card_list, &card->component_dev_list);
 
@@ -2649,8 +2655,6 @@ EXPORT_SYMBOL_GPL(snd_soc_register_dai);
 static int snd_soc_component_initialize(struct snd_soc_component *component,
 	const struct snd_soc_component_driver *driver, struct device *dev)
 {
-	struct snd_soc_dapm_context *dapm;
-
 	INIT_LIST_HEAD(&component->dai_list);
 	INIT_LIST_HEAD(&component->dobj_list);
 	INIT_LIST_HEAD(&component->card_list);
@@ -2665,13 +2669,6 @@ static int snd_soc_component_initialize(struct snd_soc_component *component,
 	component->dev = dev;
 	component->driver = driver;
 
-	dapm = snd_soc_component_get_dapm(component);
-	dapm->dev = dev;
-	dapm->component = component;
-	dapm->bias_level = SND_SOC_BIAS_OFF;
-	dapm->idle_bias_off = !driver->idle_bias_on;
-	dapm->suspend_bias_off = driver->suspend_bias_off;
-
 	return 0;
 }
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
