Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B2317FF8D
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Mar 2020 14:53:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D9CF1672;
	Tue, 10 Mar 2020 14:52:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D9CF1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583848426;
	bh=TAs76LktZXzoGPPn2Se16aHdwgmYNpIDJ1m9EPk2yeQ=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=gZgRfN7rTUFEmMgwp+RUQNiq35NXkHFR7DLJb+q4laN7kiW13+S2J6JvZpQBWy1tR
	 4URjyxjjqlWhi5fR/GhUT6kBGvwXLJe79iqUXWCssFmof724LiRyzvf2b1rR7W/r9F
	 FetXiuggtxVaN/ykfEnPGb/ktnJ6pwwaS3UJCM5g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34CC6F80247;
	Tue, 10 Mar 2020 14:51:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91751F80247; Tue, 10 Mar 2020 14:51:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id CA54AF8020C
 for <alsa-devel@alsa-project.org>; Tue, 10 Mar 2020 14:51:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA54AF8020C
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5593D30E;
 Tue, 10 Mar 2020 06:51:16 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CCC583F6CF;
 Tue, 10 Mar 2020 06:51:15 -0700 (PDT)
Date: Tue, 10 Mar 2020 13:51:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: soc-dapm: add for_each_card_widgets() macro" to the
 asoc tree
In-Reply-To: <87r1y2goga.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87r1y2goga.wl-kuninori.morimoto.gx@renesas.com>
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

   ASoC: soc-dapm: add for_each_card_widgets() macro

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

From 14596692631eadbefba8419698cccfc23bfccd2b Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 9 Mar 2020 13:08:21 +0900
Subject: [PATCH] ASoC: soc-dapm: add for_each_card_widgets() macro

To be more readable code, this patch adds
new for_each_card_widgets() macro, and replace existing code to it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/87r1y2goga.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc.h      |  5 +++++
 sound/soc/soc-dapm.c     | 25 +++++++++++++------------
 sound/soc/soc-topology.c |  2 +-
 3 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 3aee33c8249e..03054bf9cd37 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1120,6 +1120,11 @@ struct snd_soc_card {
 #define for_each_card_dapms(card, dapm)					\
 	list_for_each_entry(dapm, &card->dapm_list, list)
 
+#define for_each_card_widgets(card, w)\
+	list_for_each_entry(w, &card->widgets, list)
+#define for_each_card_widgets_safe(card, w, _w)	\
+	list_for_each_entry_safe(w, _w, &card->widgets, list)
+
 /* SoC machine DAI configuration, glues a codec and cpu DAI together */
 struct snd_soc_pcm_runtime {
 	struct device *dev;
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index ac48303ea26d..e00a465a7c32 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -302,7 +302,7 @@ void dapm_mark_endpoints_dirty(struct snd_soc_card *card)
 
 	mutex_lock(&card->dapm_mutex);
 
-	list_for_each_entry(w, &card->widgets, list) {
+	for_each_card_widgets(card, w) {
 		if (w->is_ep) {
 			dapm_mark_dirty(w, "Rechecking endpoints");
 			if (w->is_ep & SND_SOC_DAPM_EP_SINK)
@@ -589,7 +589,7 @@ static void dapm_reset(struct snd_soc_card *card)
 
 	memset(&card->dapm_stats, 0, sizeof(card->dapm_stats));
 
-	list_for_each_entry(w, &card->widgets, list) {
+	for_each_card_widgets(card, w) {
 		w->new_power = w->power;
 		w->power_checked = false;
 	}
@@ -833,7 +833,7 @@ static int dapm_is_shared_kcontrol(struct snd_soc_dapm_context *dapm,
 
 	*kcontrol = NULL;
 
-	list_for_each_entry(w, &dapm->card->widgets, list) {
+	for_each_card_widgets(dapm->card, w) {
 		if (w == kcontrolw || w->dapm != kcontrolw->dapm)
 			continue;
 		for (i = 0; i < w->num_kcontrols; i++) {
@@ -1967,7 +1967,7 @@ static int dapm_power_widgets(struct snd_soc_card *card, int event)
 		dapm_power_one_widget(w, &up_list, &down_list);
 	}
 
-	list_for_each_entry(w, &card->widgets, list) {
+	for_each_card_widgets(card, w) {
 		switch (w->id) {
 		case snd_soc_dapm_pre:
 		case snd_soc_dapm_post:
@@ -2376,7 +2376,7 @@ static ssize_t dapm_widget_show_component(struct snd_soc_component *cmpnt,
 	if (!cmpnt->card)
 		return 0;
 
-	list_for_each_entry(w, &cmpnt->card->widgets, list) {
+	for_each_card_widgets(cmpnt->card, w) {
 		if (w->dapm != dapm)
 			continue;
 
@@ -2496,7 +2496,7 @@ static void dapm_free_widgets(struct snd_soc_dapm_context *dapm)
 {
 	struct snd_soc_dapm_widget *w, *next_w;
 
-	list_for_each_entry_safe(w, next_w, &dapm->card->widgets, list) {
+	for_each_card_widgets_safe(dapm->card, w, next_w) {
 		if (w->dapm != dapm)
 			continue;
 		snd_soc_dapm_free_widget(w);
@@ -2511,7 +2511,7 @@ static struct snd_soc_dapm_widget *dapm_find_widget(
 	struct snd_soc_dapm_widget *w;
 	struct snd_soc_dapm_widget *fallback = NULL;
 
-	list_for_each_entry(w, &dapm->card->widgets, list) {
+	for_each_card_widgets(dapm->card, w) {
 		if (!strcmp(w->name, pin)) {
 			if (w->dapm == dapm)
 				return w;
@@ -2910,7 +2910,7 @@ static int snd_soc_dapm_add_route(struct snd_soc_dapm_context *dapm,
 	 * find src and dest widgets over all widgets but favor a widget from
 	 * current DAPM context
 	 */
-	list_for_each_entry(w, &dapm->card->widgets, list) {
+	for_each_card_widgets(dapm->card, w) {
 		if (!wsink && !(strcmp(w->name, sink))) {
 			wtsink = w;
 			if (w->dapm == dapm) {
@@ -3189,7 +3189,7 @@ int snd_soc_dapm_new_widgets(struct snd_soc_card *card)
 
 	mutex_lock_nested(&card->dapm_mutex, SND_SOC_DAPM_CLASS_INIT);
 
-	list_for_each_entry(w, &card->widgets, list)
+	for_each_card_widgets(card, w)
 	{
 		if (w->new)
 			continue;
@@ -3703,6 +3703,7 @@ snd_soc_dapm_new_control_unlocked(struct snd_soc_dapm_context *dapm,
 	w->dapm = dapm;
 	INIT_LIST_HEAD(&w->list);
 	INIT_LIST_HEAD(&w->dirty);
+	/* see for_each_card_widgets */
 	list_add_tail(&w->list, &dapm->card->widgets);
 
 	snd_soc_dapm_for_each_direction(dir) {
@@ -4227,7 +4228,7 @@ int snd_soc_dapm_link_dai_widgets(struct snd_soc_card *card)
 	struct snd_soc_dai *dai;
 
 	/* For each DAI widget... */
-	list_for_each_entry(dai_w, &card->widgets, list) {
+	for_each_card_widgets(card, dai_w) {
 		switch (dai_w->id) {
 		case snd_soc_dapm_dai_in:
 		case snd_soc_dapm_dai_out:
@@ -4246,7 +4247,7 @@ int snd_soc_dapm_link_dai_widgets(struct snd_soc_card *card)
 		dai = dai_w->priv;
 
 		/* ...find all widgets with the same stream and link them */
-		list_for_each_entry(w, &card->widgets, list) {
+		for_each_card_widgets(card, w) {
 			if (w->dapm != dai_w->dapm)
 				continue;
 
@@ -4789,7 +4790,7 @@ static void soc_dapm_shutdown_dapm(struct snd_soc_dapm_context *dapm)
 
 	mutex_lock(&card->dapm_mutex);
 
-	list_for_each_entry(w, &dapm->card->widgets, list) {
+	for_each_card_widgets(dapm->card, w) {
 		if (w->dapm != dapm)
 			continue;
 		if (w->power) {
diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 575da6aba807..33909afd3bbc 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -2774,7 +2774,7 @@ void snd_soc_tplg_widget_remove_all(struct snd_soc_dapm_context *dapm,
 {
 	struct snd_soc_dapm_widget *w, *next_w;
 
-	list_for_each_entry_safe(w, next_w, &dapm->card->widgets, list) {
+	for_each_card_widgets_safe(dapm->card, w, next_w) {
 
 		/* make sure we are a widget with correct context */
 		if (w->dobj.type != SND_SOC_DOBJ_WIDGET || w->dapm != dapm)
-- 
2.20.1

