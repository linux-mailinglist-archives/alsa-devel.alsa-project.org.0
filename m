Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F181593C6
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 16:51:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C695615E2;
	Tue, 11 Feb 2020 16:50:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C695615E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581436277;
	bh=Lwqz8ekwLjbFqtD9pgQqkH7Lr5Wi0Ih4EN6J1yKCsD4=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ILCsPUoWq/2IGkKW90bIFcPxH0I1v7ahsAqu0+Dv/UBQ7vHeVOCavVlYXGwO9Yaic
	 XR2l+/g0DME8NVk1gS+vYmDN/hxkNHWjfjjDjqhbI1zwNZiflDvUdIkR4mGK4uWbtH
	 M6G//35VqGzo8/DJ8y8+yJ4wdJuEj3tN6f2mmwsE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD563F80147;
	Tue, 11 Feb 2020 16:48:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF569F80276; Tue, 11 Feb 2020 16:48:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 975DFF80147
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 16:48:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 975DFF80147
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D20E1045;
 Tue, 11 Feb 2020 07:48:28 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E657B3F68E;
 Tue, 11 Feb 2020 07:48:27 -0800 (PST)
Date: Tue, 11 Feb 2020 15:48:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <878slbceyg.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-878slbceyg.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-pcm: add for_each_dapm_widgets()
	macro" to the asoc tree
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

   ASoC: soc-pcm: add for_each_dapm_widgets() macro

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.7

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

From 09e88f8a5c56ac5258935a5a543868c20a55d4dd Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 10 Feb 2020 12:14:22 +0900
Subject: [PATCH] ASoC: soc-pcm: add for_each_dapm_widgets() macro

This patch adds new for_each_dapm_widgets() macro and use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/878slbceyg.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-dapm.h |  5 +++++
 sound/soc/soc-dapm.c     |  8 ++------
 sound/soc/soc-pcm.c      | 17 +++++++++--------
 3 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 2a306c6f3fbc..9439e75945f6 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -693,6 +693,11 @@ struct snd_soc_dapm_widget_list {
 	struct snd_soc_dapm_widget *widgets[0];
 };
 
+#define for_each_dapm_widgets(list, i, widget)				\
+	for ((i) = 0;							\
+	     (i) < list->num_widgets && (widget = list->widgets[i]);	\
+	     (i)++)
+
 struct snd_soc_dapm_stats {
 	int power_checks;
 	int path_checks;
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index bc20ad9abf8b..cc17a3730d3d 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -1724,9 +1724,7 @@ static void dapm_widget_update(struct snd_soc_card *card)
 
 	wlist = dapm_kcontrol_get_wlist(update->kcontrol);
 
-	for (wi = 0; wi < wlist->num_widgets; wi++) {
-		w = wlist->widgets[wi];
-
+	for_each_dapm_widgets(wlist, wi, w) {
 		if (w->event && (w->event_flags & SND_SOC_DAPM_PRE_REG)) {
 			ret = w->event(w, update->kcontrol, SND_SOC_DAPM_PRE_REG);
 			if (ret != 0)
@@ -1753,9 +1751,7 @@ static void dapm_widget_update(struct snd_soc_card *card)
 				w->name, ret);
 	}
 
-	for (wi = 0; wi < wlist->num_widgets; wi++) {
-		w = wlist->widgets[wi];
-
+	for_each_dapm_widgets(wlist, wi, w) {
 		if (w->event && (w->event_flags & SND_SOC_DAPM_POST_REG)) {
 			ret = w->event(w, update->kcontrol, SND_SOC_DAPM_POST_REG);
 			if (ret != 0)
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 2a4f7ac5f563..7a490c05d4e9 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1306,12 +1306,12 @@ static inline struct snd_soc_dapm_widget *
 static int widget_in_list(struct snd_soc_dapm_widget_list *list,
 		struct snd_soc_dapm_widget *widget)
 {
+	struct snd_soc_dapm_widget *w;
 	int i;
 
-	for (i = 0; i < list->num_widgets; i++) {
-		if (widget == list->widgets[i])
+	for_each_dapm_widgets(list, i, w)
+		if (widget == w)
 			return 1;
-	}
 
 	return 0;
 }
@@ -1422,12 +1422,13 @@ static int dpcm_add_paths(struct snd_soc_pcm_runtime *fe, int stream,
 	struct snd_soc_card *card = fe->card;
 	struct snd_soc_dapm_widget_list *list = *list_;
 	struct snd_soc_pcm_runtime *be;
+	struct snd_soc_dapm_widget *widget;
 	int i, new = 0, err;
 
 	/* Create any new FE <--> BE connections */
-	for (i = 0; i < list->num_widgets; i++) {
+	for_each_dapm_widgets(list, i, widget) {
 
-		switch (list->widgets[i]->id) {
+		switch (widget->id) {
 		case snd_soc_dapm_dai_in:
 			if (stream != SNDRV_PCM_STREAM_PLAYBACK)
 				continue;
@@ -1441,10 +1442,10 @@ static int dpcm_add_paths(struct snd_soc_pcm_runtime *fe, int stream,
 		}
 
 		/* is there a valid BE rtd for this widget */
-		be = dpcm_get_be(card, list->widgets[i], stream);
+		be = dpcm_get_be(card, widget, stream);
 		if (!be) {
 			dev_err(fe->dev, "ASoC: no BE found for %s\n",
-					list->widgets[i]->name);
+					widget->name);
 			continue;
 		}
 
@@ -1460,7 +1461,7 @@ static int dpcm_add_paths(struct snd_soc_pcm_runtime *fe, int stream,
 		err = dpcm_be_connect(fe, be, stream);
 		if (err < 0) {
 			dev_err(fe->dev, "ASoC: can't connect %s\n",
-				list->widgets[i]->name);
+				widget->name);
 			break;
 		} else if (err == 0) /* already connected */
 			continue;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
