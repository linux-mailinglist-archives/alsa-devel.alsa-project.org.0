Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D7B136E52
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jan 2020 14:41:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D4C41723;
	Fri, 10 Jan 2020 14:40:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D4C41723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578663662;
	bh=5/4VKszxRgGOvbHa/Hpf08eKHUXRjYUJwkRiA57he1U=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Rd/QGuC3pVkd+ZqZTsmABsEnD3MqqcOeN4LzXyL7loB1iVDHZhAgsAxMK4FbJR0dD
	 1PrxeWqggVFSwEQYdxWuTRSVrx0NK50lFGQGveG1FCobbEzi7D7wz9z6ZZ7fAuQN9V
	 3nAQzV4dQQORYWXHvY8G1C4orHbQaJnAyrqzOnjc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF9CEF8024A;
	Fri, 10 Jan 2020 14:37:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1142F801F4; Fri, 10 Jan 2020 14:37:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 961E5F80130
 for <alsa-devel@alsa-project.org>; Fri, 10 Jan 2020 14:37:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 961E5F80130
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D377DA7;
 Fri, 10 Jan 2020 05:37:46 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA0203F534;
 Fri, 10 Jan 2020 05:37:45 -0800 (PST)
Date: Fri, 10 Jan 2020 13:37:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <874kx4t4v6.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-874kx4t4v6.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: do pinctrl_pm_select_xxx() as
	component" to the asoc tree
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

   ASoC: soc-core: do pinctrl_pm_select_xxx() as component

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

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

From 76c39e867cba338d8982f6372b2c4e3189f6439b Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 10 Jan 2020 11:36:13 +0900
Subject: [PATCH] ASoC: soc-core: do pinctrl_pm_select_xxx() as component

ALSA SoC need to care pinctrl_pm_select_xxx().
It is called at soc-core and soc-pcm.
soc-pcm  is controlling it for activate DAI.
soc-core is controlling it for whole system
(= suspend/resume/probe/poweroff).

If we focus to soc-core side, it need to care about BIAS level.
Then, snd_soc_suspend() only is controlling it by Component base (a).
Other functions are DAI base (b).

(a)	pinctrl_pm_select_xxx(component->dev, xxx);
(b)	pinctrl_pm_select_xxx(dai->dev, xxx);

Because of these unbalance, the code is confusable.
Here, dai->dev and component->dev are same pointer.
Thus, we can replace it component base.

One note here is that it cared DAI (= CPU/Codec) pin before this patch,
after this patch, it cares Component (= CPU/Codec/Platform) pin.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-By: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/874kx4t4v6.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 46 +++++++++++---------------------------------
 sound/soc/soc-pcm.c  | 23 ++++++++--------------
 2 files changed, 19 insertions(+), 50 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 191b68732e56..3c729eaf0bbf 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -727,25 +727,16 @@ int snd_soc_resume(struct device *dev)
 	struct snd_soc_card *card = dev_get_drvdata(dev);
 	bool bus_control = false;
 	struct snd_soc_pcm_runtime *rtd;
-	struct snd_soc_dai *codec_dai;
-	int i;
+	struct snd_soc_component *component;
 
 	/* If the card is not initialized yet there is nothing to do */
 	if (!card->instantiated)
 		return 0;
 
 	/* activate pins from sleep state */
-	for_each_card_rtds(card, rtd) {
-		struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
-
-		if (cpu_dai->active)
-			pinctrl_pm_select_default_state(cpu_dai->dev);
-
-		for_each_rtd_codec_dai(rtd, i, codec_dai) {
-			if (codec_dai->active)
-				pinctrl_pm_select_default_state(codec_dai->dev);
-		}
-	}
+	for_each_card_components(card, component)
+		if (component->active)
+			pinctrl_pm_select_default_state(component->dev);
 
 	/*
 	 * DAIs that also act as the control bus master might have other drivers
@@ -1885,6 +1876,7 @@ static void snd_soc_unbind_card(struct snd_soc_card *card, bool unregister)
 static int snd_soc_bind_card(struct snd_soc_card *card)
 {
 	struct snd_soc_pcm_runtime *rtd;
+	struct snd_soc_component *component;
 	struct snd_soc_dai_link *dai_link;
 	int ret, i, card_probed = 0;
 
@@ -2036,17 +2028,9 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 	snd_soc_dapm_sync(&card->dapm);
 
 	/* deactivate pins to sleep state */
-	for_each_card_rtds(card, rtd) {
-		struct snd_soc_dai *dai;
-
-		for_each_rtd_codec_dai(rtd, i, dai) {
-			if (!dai->active)
-				pinctrl_pm_select_sleep_state(dai->dev);
-		}
-
-		if (!rtd->cpu_dai->active)
-			pinctrl_pm_select_sleep_state(rtd->cpu_dai->dev);
-	}
+	for_each_card_components(card, component)
+		if (!component->active)
+			pinctrl_pm_select_sleep_state(component->dev);
 
 probe_end:
 	if (ret < 0)
@@ -2092,7 +2076,7 @@ static int soc_remove(struct platform_device *pdev)
 int snd_soc_poweroff(struct device *dev)
 {
 	struct snd_soc_card *card = dev_get_drvdata(dev);
-	struct snd_soc_pcm_runtime *rtd;
+	struct snd_soc_component *component;
 
 	if (!card->instantiated)
 		return 0;
@@ -2106,16 +2090,8 @@ int snd_soc_poweroff(struct device *dev)
 	snd_soc_dapm_shutdown(card);
 
 	/* deactivate pins to sleep state */
-	for_each_card_rtds(card, rtd) {
-		struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
-		struct snd_soc_dai *codec_dai;
-		int i;
-
-		pinctrl_pm_select_sleep_state(cpu_dai->dev);
-		for_each_rtd_codec_dai(rtd, i, codec_dai) {
-			pinctrl_pm_select_sleep_state(codec_dai->dev);
-		}
-	}
+	for_each_card_components(card, component)
+		pinctrl_pm_select_sleep_state(component->dev);
 
 	return 0;
 }
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 9c6c7533a508..68f72051f8e3 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -487,9 +487,8 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 	const char *codec_dai_name = "multicodec";
 	int i, ret = 0;
 
-	pinctrl_pm_select_default_state(cpu_dai->dev);
-	for_each_rtd_codec_dai(rtd, i, codec_dai)
-		pinctrl_pm_select_default_state(codec_dai->dev);
+	for_each_rtd_components(rtd, i, component)
+		pinctrl_pm_select_default_state(component->dev);
 
 	for_each_rtd_components(rtd, i, component)
 		pm_runtime_get_sync(component->dev);
@@ -618,12 +617,9 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 		pm_runtime_put_autosuspend(component->dev);
 	}
 
-	for_each_rtd_codec_dai(rtd, i, codec_dai) {
-		if (!codec_dai->active)
-			pinctrl_pm_select_sleep_state(codec_dai->dev);
-	}
-	if (!cpu_dai->active)
-		pinctrl_pm_select_sleep_state(cpu_dai->dev);
+	for_each_rtd_components(rtd, i, component)
+		if (!component->active)
+			pinctrl_pm_select_sleep_state(component->dev);
 
 	return ret;
 }
@@ -728,12 +724,9 @@ static int soc_pcm_close(struct snd_pcm_substream *substream)
 		pm_runtime_put_autosuspend(component->dev);
 	}
 
-	for_each_rtd_codec_dai(rtd, i, codec_dai) {
-		if (!codec_dai->active)
-			pinctrl_pm_select_sleep_state(codec_dai->dev);
-	}
-	if (!cpu_dai->active)
-		pinctrl_pm_select_sleep_state(cpu_dai->dev);
+	for_each_rtd_components(rtd, i, component)
+		if (!component->active)
+			pinctrl_pm_select_sleep_state(component->dev);
 
 	return 0;
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
