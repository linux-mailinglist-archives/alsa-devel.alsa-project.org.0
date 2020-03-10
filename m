Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9335717FF8E
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Mar 2020 14:54:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32FB11668;
	Tue, 10 Mar 2020 14:53:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32FB11668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583848443;
	bh=wWsOf3H+ZkvZUz+lavrYUOAGqRXDGejBtHHkkPnxi+U=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=NFhYqieDV58NBk2zPVFJGb41edWPP3g9jgUYCGzuFv4aJIx7SSe7VS7HHKt8nfxCr
	 gLQZsaOinN8Dq6dYmyqkxGgd/rMxUc0fF1o5Sqwf/qYP1VsJN/k+/1TpDQKuxvX/Gx
	 y6M/gnm/hzKy0pWQrbxdBPdpmbgTVbvYCTy2Bgbc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82378F8028C;
	Tue, 10 Mar 2020 14:51:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 952D3F8028B; Tue, 10 Mar 2020 14:51:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 76949F8023F
 for <alsa-devel@alsa-project.org>; Tue, 10 Mar 2020 14:51:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76949F8023F
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E975630E;
 Tue, 10 Mar 2020 06:51:20 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6CAE03F6CF;
 Tue, 10 Mar 2020 06:51:20 -0700 (PDT)
Date: Tue, 10 Mar 2020 13:51:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: soc-dapm: add for_each_card_dapms() macro" to the asoc
 tree
In-Reply-To: <87sgiigogf.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87sgiigogf.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: soc-dapm: add for_each_card_dapms() macro

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From df817f8e71e3a0256bd3d2d3a4e5399b409698f4 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 9 Mar 2020 13:08:16 +0900
Subject: [PATCH] ASoC: soc-dapm: add for_each_card_dapms() macro

To be more readable code, this patch adds
new for_each_card_dapms() macro, and replace existing code to it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/87sgiigogf.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc.h  |  3 +++
 sound/soc/soc-dapm.c | 18 +++++++++---------
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 5e1b4ef1543c..3aee33c8249e 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1117,6 +1117,9 @@ struct snd_soc_card {
 #define for_each_card_components(card, component)			\
 	list_for_each_entry(component, &(card)->component_dev_list, card_list)
 
+#define for_each_card_dapms(card, dapm)					\
+	list_for_each_entry(dapm, &card->dapm_list, list)
+
 /* SoC machine DAI configuration, glues a codec and cpu DAI together */
 struct snd_soc_pcm_runtime {
 	struct device *dev;
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 7374829c6675..ac48303ea26d 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -1716,9 +1716,8 @@ static void dapm_seq_run(struct snd_soc_card *card,
 					i, cur_subseq);
 	}
 
-	list_for_each_entry(d, &card->dapm_list, list) {
+	for_each_card_dapms(card, d)
 		soc_dapm_async_complete(d);
-	}
 }
 
 static void dapm_widget_update(struct snd_soc_card *card)
@@ -1949,7 +1948,7 @@ static int dapm_power_widgets(struct snd_soc_card *card, int event)
 
 	trace_snd_soc_dapm_start(card);
 
-	list_for_each_entry(d, &card->dapm_list, list) {
+	for_each_card_dapms(card, d) {
 		if (dapm_idle_bias_off(d))
 			d->target_bias_level = SND_SOC_BIAS_OFF;
 		else
@@ -2013,10 +2012,10 @@ static int dapm_power_widgets(struct snd_soc_card *card, int event)
 	 * they're not ground referenced.
 	 */
 	bias = SND_SOC_BIAS_OFF;
-	list_for_each_entry(d, &card->dapm_list, list)
+	for_each_card_dapms(card, d)
 		if (d->target_bias_level > bias)
 			bias = d->target_bias_level;
-	list_for_each_entry(d, &card->dapm_list, list)
+	for_each_card_dapms(card, d)
 		if (!dapm_idle_bias_off(d))
 			d->target_bias_level = bias;
 
@@ -2025,7 +2024,7 @@ static int dapm_power_widgets(struct snd_soc_card *card, int event)
 	/* Run card bias changes at first */
 	dapm_pre_sequence_async(&card->dapm, 0);
 	/* Run other bias changes in parallel */
-	list_for_each_entry(d, &card->dapm_list, list) {
+	for_each_card_dapms(card, d) {
 		if (d != &card->dapm && d->bias_level != d->target_bias_level)
 			async_schedule_domain(dapm_pre_sequence_async, d,
 						&async_domain);
@@ -2049,7 +2048,7 @@ static int dapm_power_widgets(struct snd_soc_card *card, int event)
 	dapm_seq_run(card, &up_list, event, true);
 
 	/* Run all the bias changes in parallel */
-	list_for_each_entry(d, &card->dapm_list, list) {
+	for_each_card_dapms(card, d) {
 		if (d != &card->dapm && d->bias_level != d->target_bias_level)
 			async_schedule_domain(dapm_post_sequence_async, d,
 						&async_domain);
@@ -2059,7 +2058,7 @@ static int dapm_power_widgets(struct snd_soc_card *card, int event)
 	dapm_post_sequence_async(&card->dapm, 0);
 
 	/* do we need to notify any clients that DAPM event is complete */
-	list_for_each_entry(d, &card->dapm_list, list) {
+	for_each_card_dapms(card, d) {
 		if (!d->component)
 			continue;
 
@@ -4776,6 +4775,7 @@ void snd_soc_dapm_init(struct snd_soc_dapm_context *dapm,
 	}
 
 	INIT_LIST_HEAD(&dapm->list);
+	/* see for_each_card_dapms */
 	list_add(&dapm->list, &card->dapm_list);
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_init);
@@ -4822,7 +4822,7 @@ void snd_soc_dapm_shutdown(struct snd_soc_card *card)
 {
 	struct snd_soc_dapm_context *dapm;
 
-	list_for_each_entry(dapm, &card->dapm_list, list) {
+	for_each_card_dapms(card, dapm) {
 		if (dapm != &card->dapm) {
 			soc_dapm_shutdown_dapm(dapm);
 			if (dapm->bias_level == SND_SOC_BIAS_STANDBY)
-- 
2.20.1

