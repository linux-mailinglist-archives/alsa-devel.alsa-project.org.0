Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3BCA55FD
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Sep 2019 14:27:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F18E216D7;
	Mon,  2 Sep 2019 14:26:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F18E216D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567427256;
	bh=8bak8ijg4ZMSO7BPzjn1mUgb++qpzLARXAVx3t7secg=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=a7luRtw1zGJSXF9L4tBfEsv9nB0EdhNAW4re6L0MlYJX4UrNwUwNVSkoByrT5y9Vz
	 tQQzvBfwdrLv8igG7tusTEp4UgWvosd+DLRadgryciuWBLBMTtjpN/YH7O2gPMhQTb
	 i3rqFUKkSdmbMFTNyRNdtMFzo6aRy9sA17l49H6c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BCCDF805FE;
	Mon,  2 Sep 2019 14:24:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9886F80529; Mon,  2 Sep 2019 14:24:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4024F803D0
 for <alsa-devel@alsa-project.org>; Mon,  2 Sep 2019 14:23:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4024F803D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="i4SI4YAk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=6cfaHn0Y6vWY1f2erjfrMS9ttArcmKNx0Cs1mjFmOes=; b=i4SI4YAkXMAE
 ybBMp6stj36QrDNiZxvR5hOzkKM/Co6z3Y7F5tfxq+5C5ZOTzE/W7oo55BaGlS1hEm0/qHNZFWnSj
 iLW+noNy9+rhRmJVE1WwDHAoa12R6vpOST9ebKA24dtuXbO/2FnspIU4bskxVcmD6ogBMC85/+teY
 p6iRM=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i4lNA-0003Bz-V0; Mon, 02 Sep 2019 12:23:53 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 59C572742CCC; Mon,  2 Sep 2019 13:23:52 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87pnkw7lbj.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190902122352.59C572742CCC@ypsilon.sirena.org.uk>
Date: Mon,  2 Sep 2019 13:23:52 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: add snd_soc_dapm_init()" to
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

   ASoC: soc-core: add snd_soc_dapm_init()

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

From 95c267dd20431f0eb54ca204bd73a7d85c532a37 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 23 Aug 2019 09:58:52 +0900
Subject: [PATCH] ASoC: soc-core: add snd_soc_dapm_init()

It is easy to read code if it is cleanly using paired function/naming,
like start <-> stop, register <-> unregister, etc, etc.
But, current ALSA SoC code is very random, unbalance, not paired, etc.
It is easy to create bug at the such code, and it will be difficult to
debug.

soc-dapm has snd_soc_dapm_free() which cleanups debugfs, widgets, list.
But, there is no paired initialize function.
This patch adds snd_soc_dapm_init() and initilaizing dapm

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87pnkw7lbj.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-dapm.h |  3 +++
 sound/soc/soc-core.c     | 14 ++------------
 sound/soc/soc-dapm.c     | 21 +++++++++++++++++++++
 3 files changed, 26 insertions(+), 12 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 2aa73d6dd7be..dd993dd29229 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -416,6 +416,9 @@ int snd_soc_dapm_update_dai(struct snd_pcm_substream *substream,
 /* dapm path setup */
 int snd_soc_dapm_new_widgets(struct snd_soc_card *card);
 void snd_soc_dapm_free(struct snd_soc_dapm_context *dapm);
+void snd_soc_dapm_init(struct snd_soc_dapm_context *dapm,
+		       struct snd_soc_card *card,
+		       struct snd_soc_component *component);
 int snd_soc_dapm_add_routes(struct snd_soc_dapm_context *dapm,
 			    const struct snd_soc_dapm_route *route, int num);
 int snd_soc_dapm_del_routes(struct snd_soc_dapm_context *dapm,
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 21c005a044e8..8e831ae59eb8 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1023,14 +1023,7 @@ static int soc_probe_component(struct snd_soc_card *card,
 
 	soc_init_component_debugfs(component);
 
-	INIT_LIST_HEAD(&dapm->list);
-	dapm->card		= card;
-	dapm->dev		= component->dev;
-	dapm->component		= component;
-	dapm->bias_level	= SND_SOC_BIAS_OFF;
-	dapm->idle_bias_off	= !component->driver->idle_bias_on;
-	dapm->suspend_bias_off	= component->driver->suspend_bias_off;
-	list_add(&dapm->list, &card->dapm_list);
+	snd_soc_dapm_init(dapm, card, component);
 
 	ret = snd_soc_dapm_new_controls(dapm,
 					component->driver->dapm_widgets,
@@ -1937,10 +1930,7 @@ static int snd_soc_instantiate_card(struct snd_soc_card *card)
 	}
 	mutex_lock_nested(&card->mutex, SND_SOC_CARD_CLASS_INIT);
 
-	card->dapm.bias_level = SND_SOC_BIAS_OFF;
-	card->dapm.dev = card->dev;
-	card->dapm.card = card;
-	list_add(&card->dapm.list, &card->dapm_list);
+	snd_soc_dapm_init(&card->dapm, card, NULL);
 
 	/* check whether any platform is ignore machine FE and using topology */
 	soc_check_tplg_fes(card);
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 10819b3e0b98..b6378f025836 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4717,6 +4717,27 @@ void snd_soc_dapm_free(struct snd_soc_dapm_context *dapm)
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_free);
 
+void snd_soc_dapm_init(struct snd_soc_dapm_context *dapm,
+		       struct snd_soc_card *card,
+		       struct snd_soc_component *component)
+{
+	dapm->card		= card;
+	dapm->component		= component;
+	dapm->bias_level	= SND_SOC_BIAS_OFF;
+
+	if (component) {
+		dapm->dev		= component->dev;
+		dapm->idle_bias_off	= !component->driver->idle_bias_on,
+		dapm->suspend_bias_off	= component->driver->suspend_bias_off;
+	} else {
+		dapm->dev		= card->dev;
+	}
+
+	INIT_LIST_HEAD(&dapm->list);
+	list_add(&dapm->list, &card->dapm_list);
+}
+EXPORT_SYMBOL_GPL(snd_soc_dapm_init);
+
 static void soc_dapm_shutdown_dapm(struct snd_soc_dapm_context *dapm)
 {
 	struct snd_soc_card *card = dapm->card;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
