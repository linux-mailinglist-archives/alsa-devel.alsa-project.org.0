Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCF382188
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2019 18:19:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50946167E;
	Mon,  5 Aug 2019 18:18:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50946167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565021960;
	bh=R1N71DsqdbnPw/gl3v5uCLZqMPQGIMuIczQRNduQiTQ=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=X/jbK9ntdQ8C38jX4R8uTU4KsGck0amIrlKAgHcnGbGzBoYnMpvymrzdvBT1+jYNT
	 JBLltmXW19CBqIy7MAjbn+gVfgc8i1yozDwD48cMEhETPdmGsxI8JaD4WfEtGSFc8p
	 dG38FVRF1/enzheVRmqoB5xWekpMzfTrw5ZzWtCw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 278EBF806ED;
	Mon,  5 Aug 2019 18:10:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48727F80639; Mon,  5 Aug 2019 18:10:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BF73F805E0
 for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2019 18:09:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BF73F805E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="H1gJ5i+y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=0QTAKp3KeHX9eoqW/ONqO2/vrxCxrYQImJNpUbOtnSI=; b=H1gJ5i+yNTyU
 uFntoCRrXHGtzWCcnp1fc93WY+qeD8kKVbgHyEbPl3Uqi2zt/YMvCxItU9/DrPVigEjFzlLHa+Fu0
 Hg7kBdPg4XZkM908nsDBpy59PEAXXbqFXVtPLqAtRlVlfrvG7zQpskLu1rHdPzt7v8BwuieItBIvP
 0UUBM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hufYc-0000km-Ee; Mon, 05 Aug 2019 16:09:58 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id D0A292742D06; Mon,  5 Aug 2019 17:09:57 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87v9vp4d0r.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190805160957.D0A292742D06@ypsilon.sirena.org.uk>
Date: Mon,  5 Aug 2019 17:09:57 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-component: move
	snd_soc_component_stream_event()" to the asoc tree
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

   ASoC: soc-component: move snd_soc_component_stream_event()

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

From 8e2a990d76aced95c6f01c2d67d8835c86f0ca67 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 26 Jul 2019 13:51:39 +0900
Subject: [PATCH] ASoC: soc-component: move snd_soc_component_stream_event()

Current soc-dapm / soc-core are using a long way round to call
.stream_event.

	if (driver->stream_event)
		dapm->stream_event = ...;
	...
	if (dapm->stream_event)
		ret = dapm->stream_event(...);

We can directly call it via driver->stream_event.
One note here is that both Card and Component have dapm,
but, Card's dapm doesn't have dapm->component.
We need to check it.

This patch moves snd_soc_component_stream_event() to soc-component.c
and updates parameters.
dapm->stream_event is no longer needed

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87v9vp4d0r.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-component.h |  2 ++
 include/sound/soc-dapm.h      |  1 -
 sound/soc/soc-component.c     |  9 +++++++++
 sound/soc/soc-core.c          | 10 ----------
 sound/soc/soc-dapm.c          |  9 +++++++--
 5 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 7ac903c1e33f..1f84f04e2670 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -283,6 +283,8 @@ int snd_soc_component_set_jack(struct snd_soc_component *component,
 
 void snd_soc_component_seq_notifier(struct snd_soc_component *component,
 				    enum snd_soc_dapm_type type, int subseq);
+int snd_soc_component_stream_event(struct snd_soc_component *component,
+				   int event);
 
 #ifdef CONFIG_REGMAP
 void snd_soc_component_init_regmap(struct snd_soc_component *component,
diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index a03db6f8faa8..c2f14a335891 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -670,7 +670,6 @@ struct snd_soc_dapm_context {
 	enum snd_soc_bias_level target_bias_level;
 	struct list_head list;
 
-	int (*stream_event)(struct snd_soc_dapm_context *dapm, int event);
 	int (*set_bias_level)(struct snd_soc_dapm_context *dapm,
 			      enum snd_soc_bias_level level);
 
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index ca0b28b1d918..f33dda8023ec 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -59,6 +59,15 @@ void snd_soc_component_seq_notifier(struct snd_soc_component *component,
 		component->driver->seq_notifier(component, type, subseq);
 }
 
+int snd_soc_component_stream_event(struct snd_soc_component *component,
+				   int event)
+{
+	if (component->driver->stream_event)
+		return component->driver->stream_event(component, event);
+
+	return 0;
+}
+
 int snd_soc_component_enable_pin(struct snd_soc_component *component,
 				 const char *pin)
 {
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index c618fecc3d45..8cfbe5fb5921 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2646,14 +2646,6 @@ int snd_soc_register_dai(struct snd_soc_component *component,
 }
 EXPORT_SYMBOL_GPL(snd_soc_register_dai);
 
-static int snd_soc_component_stream_event(struct snd_soc_dapm_context *dapm,
-	int event)
-{
-	struct snd_soc_component *component = dapm->component;
-
-	return component->driver->stream_event(component, event);
-}
-
 static int snd_soc_component_set_bias_level(struct snd_soc_dapm_context *dapm,
 					enum snd_soc_bias_level level)
 {
@@ -2682,8 +2674,6 @@ static int snd_soc_component_initialize(struct snd_soc_component *component,
 	dapm->bias_level = SND_SOC_BIAS_OFF;
 	dapm->idle_bias_off = !driver->idle_bias_on;
 	dapm->suspend_bias_off = driver->suspend_bias_off;
-	if (driver->stream_event)
-		dapm->stream_event = snd_soc_component_stream_event;
 	if (driver->set_bias_level)
 		dapm->set_bias_level = snd_soc_component_set_bias_level;
 
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 0b60f688b433..9288b2b43f98 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -1913,6 +1913,7 @@ static int dapm_power_widgets(struct snd_soc_card *card, int event)
 	LIST_HEAD(down_list);
 	ASYNC_DOMAIN_EXCLUSIVE(async_domain);
 	enum snd_soc_bias_level bias;
+	int ret;
 
 	lockdep_assert_held(&card->dapm_mutex);
 
@@ -2029,8 +2030,12 @@ static int dapm_power_widgets(struct snd_soc_card *card, int event)
 
 	/* do we need to notify any clients that DAPM event is complete */
 	list_for_each_entry(d, &card->dapm_list, list) {
-		if (d->stream_event)
-			d->stream_event(d, event);
+		if (!d->component)
+			continue;
+
+		ret = snd_soc_component_stream_event(d->component, event);
+		if (ret < 0)
+			return ret;
 	}
 
 	pop_dbg(card->dev, card->pop_time,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
