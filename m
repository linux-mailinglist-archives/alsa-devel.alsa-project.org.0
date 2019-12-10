Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7A61189C0
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 14:27:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1751F1654;
	Tue, 10 Dec 2019 14:26:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1751F1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575984467;
	bh=L2YdUPRYZieiioTkxswcb+lohAE+6GW+Gk5XAILNINQ=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=dZhIKJ78974dkPh3kdoTEEbcMmvFi4atW6kE7vGj8Wvv3KFoCfwGOQuUBurr9sylr
	 ugTrUnls7YIg7ql/F121q0/bkqeX8A0j+pYBN4S7yMXmeXKEzX6CUkf7KMz31xmF8J
	 yaFcDNUmAzJw9Wixwesy6pMMqwE5P6sUPTrCOTiM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABA6EF8027C;
	Tue, 10 Dec 2019 14:22:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6132EF80273; Tue, 10 Dec 2019 14:22:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PRX_BODY_76, SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 6522AF80266
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 14:22:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6522AF80266
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A871911B3;
 Tue, 10 Dec 2019 05:22:44 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 286AF3F52E;
 Tue, 10 Dec 2019 05:22:44 -0800 (PST)
Date: Tue, 10 Dec 2019 13:22:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <871rtdyq5g.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-871rtdyq5g.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: soc-core: move soc_link_init()" to the
	asoc tree
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

   ASoC: soc-core: move soc_link_init()

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

From 46496acbe1c43cd26f5515b51b5d3c46a97d785d Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Tue, 10 Dec 2019 09:34:36 +0900
Subject: [PATCH] ASoC: soc-core: move soc_link_init()

This patch moves soc_link_init() to upper side.
This is prepare for its cleanup.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/871rtdyq5g.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 144 +++++++++++++++++++++----------------------
 1 file changed, 72 insertions(+), 72 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 81164b54632a..04cb69072f80 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1123,6 +1123,78 @@ static int soc_dai_pcm_new(struct snd_soc_dai **dais, int num_dais,
 	return 0;
 }
 
+static int soc_link_init(struct snd_soc_card *card,
+			 struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_dai_link *dai_link = rtd->dai_link;
+	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_rtdcom_list *rtdcom;
+	struct snd_soc_component *component;
+	int ret, num;
+
+	/* set default power off timeout */
+	rtd->pmdown_time = pmdown_time;
+
+	/* do machine specific initialization */
+	if (dai_link->init) {
+		ret = dai_link->init(rtd);
+		if (ret < 0) {
+			dev_err(card->dev, "ASoC: failed to init %s: %d\n",
+				dai_link->name, ret);
+			return ret;
+		}
+	}
+
+	if (dai_link->dai_fmt) {
+		ret = snd_soc_runtime_set_dai_fmt(rtd, dai_link->dai_fmt);
+		if (ret)
+			return ret;
+	}
+
+	/* add DPCM sysfs entries */
+	soc_dpcm_debugfs_add(rtd);
+
+	num = rtd->num;
+
+	/*
+	 * most drivers will register their PCMs using DAI link ordering but
+	 * topology based drivers can use the DAI link id field to set PCM
+	 * device number and then use rtd + a base offset of the BEs.
+	 */
+	for_each_rtd_components(rtd, rtdcom, component) {
+		if (!component->driver->use_dai_pcm_id)
+			continue;
+
+		if (rtd->dai_link->no_pcm)
+			num += component->driver->be_pcm_base;
+		else
+			num = rtd->dai_link->id;
+	}
+
+	/* create compress_device if possible */
+	ret = snd_soc_dai_compress_new(cpu_dai, rtd, num);
+	if (ret != -ENOTSUPP) {
+		if (ret < 0)
+			dev_err(card->dev, "ASoC: can't create compress %s\n",
+				dai_link->stream_name);
+		return ret;
+	}
+
+	/* create the pcm */
+	ret = soc_new_pcm(rtd, num);
+	if (ret < 0) {
+		dev_err(card->dev, "ASoC: can't create pcm %s :%d\n",
+			dai_link->stream_name, ret);
+		return ret;
+	}
+	ret = soc_dai_pcm_new(&cpu_dai, 1, rtd);
+	if (ret < 0)
+		return ret;
+	ret = soc_dai_pcm_new(rtd->codec_dais,
+			      rtd->num_codecs, rtd);
+	return ret;
+}
+
 static void soc_set_of_name_prefix(struct snd_soc_component *component)
 {
 	struct device_node *of_node = soc_component_to_node(component);
@@ -1400,78 +1472,6 @@ static int soc_probe_link_components(struct snd_soc_card *card)
 	return 0;
 }
 
-static int soc_link_init(struct snd_soc_card *card,
-			 struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_dai_link *dai_link = rtd->dai_link;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
-	struct snd_soc_rtdcom_list *rtdcom;
-	struct snd_soc_component *component;
-	int ret, num;
-
-	/* set default power off timeout */
-	rtd->pmdown_time = pmdown_time;
-
-	/* do machine specific initialization */
-	if (dai_link->init) {
-		ret = dai_link->init(rtd);
-		if (ret < 0) {
-			dev_err(card->dev, "ASoC: failed to init %s: %d\n",
-				dai_link->name, ret);
-			return ret;
-		}
-	}
-
-	if (dai_link->dai_fmt) {
-		ret = snd_soc_runtime_set_dai_fmt(rtd, dai_link->dai_fmt);
-		if (ret)
-			return ret;
-	}
-
-	/* add DPCM sysfs entries */
-	soc_dpcm_debugfs_add(rtd);
-
-	num = rtd->num;
-
-	/*
-	 * most drivers will register their PCMs using DAI link ordering but
-	 * topology based drivers can use the DAI link id field to set PCM
-	 * device number and then use rtd + a base offset of the BEs.
-	 */
-	for_each_rtd_components(rtd, rtdcom, component) {
-		if (!component->driver->use_dai_pcm_id)
-			continue;
-
-		if (rtd->dai_link->no_pcm)
-			num += component->driver->be_pcm_base;
-		else
-			num = rtd->dai_link->id;
-	}
-
-	/* create compress_device if possible */
-	ret = snd_soc_dai_compress_new(cpu_dai, rtd, num);
-	if (ret != -ENOTSUPP) {
-		if (ret < 0)
-			dev_err(card->dev, "ASoC: can't create compress %s\n",
-					 dai_link->stream_name);
-		return ret;
-	}
-
-	/* create the pcm */
-	ret = soc_new_pcm(rtd, num);
-	if (ret < 0) {
-		dev_err(card->dev, "ASoC: can't create pcm %s :%d\n",
-			dai_link->stream_name, ret);
-		return ret;
-	}
-	ret = soc_dai_pcm_new(&cpu_dai, 1, rtd);
-	if (ret < 0)
-		return ret;
-	ret = soc_dai_pcm_new(rtd->codec_dais,
-			      rtd->num_codecs, rtd);
-	return ret;
-}
-
 static void soc_unbind_aux_dev(struct snd_soc_card *card)
 {
 	struct snd_soc_component *component, *_component;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
