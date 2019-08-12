Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBAA89F84
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2019 15:21:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FCC01697;
	Mon, 12 Aug 2019 15:20:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FCC01697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565616087;
	bh=eieZflaocjRgQGFQX/tszEnlLCGIxi8bKwrYnWMKTYo=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=jip+TL/vMT7zAyQi4sGHTGaF1yu/zwy0f9kUSCA3OkvKFM058NtCqK47W9+0gqaWA
	 hSTzR2reDWwPuMvfnj/Wp/NC3Qa0ah5tlnzdCHA88qx5xKE2d2V2rvHz83G5SueJrH
	 qhCW/7IislC4TbZoEtTBcmOgJ4nyzE9yv74R3GCM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 934F2F80635;
	Mon, 12 Aug 2019 15:15:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3202F80612; Mon, 12 Aug 2019 15:10:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5229FF80214
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 15:09:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5229FF80214
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="A1TurQ9w"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=6TnakXqahRT3mlCzXOrxJG2h9dVHcAbNSAJsNrV89OI=; b=A1TurQ9w1/fS
 /+S7GW5O0P1FtRY5RDDrae2QZgoFGdILOB4mKhRe+WzC/7b0JbhLAehgTBIrz7HewbwPyyAzrhX4L
 HgUEnYiDB6YOyEhezovdxk0DKLKArgBFKPCPsxFODQVEB36X+qzRywYaIUl1xPnZ1Mwa+pv8P78fT
 d19kY=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hxA5A-0001MP-SR; Mon, 12 Aug 2019 13:09:52 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 62DDF2740CED; Mon, 12 Aug 2019 14:09:52 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ftmc6w8s.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190812130952.62DDF2740CED@ypsilon.sirena.org.uk>
Date: Mon, 12 Aug 2019 14:09:52 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Heiko Stuebner <heiko@sntech.de>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Jie Yang <yang.jie@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Richard Fontana <rfontana@redhat.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Anders Roxell <anders.roxell@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, YueHaibing <yuehaibing@huawei.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Tzung-Bi Shih <tzungbi@google.com>,
 Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>,
 Danny Milosavljevic <dannym@scratchpost.org>,
 Georgii Staroselski i <georgii.staroselskii@emlid.com>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Alexios Zavras <alexios.zavras@intel.com>, Sangbeom Kim <sbkim73@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jarkko Nikula <jarkko.nikula@bitmer.com>
Subject: [alsa-devel] Applied "ASoC: soc-core: add for_each_xxx macro for
	aux_dev" to the asoc tree
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

   ASoC: soc-core: add for_each_xxx macro for aux_dev

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

From c2b71c71037bea7765aa6ff37824520d19108769 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 8 Aug 2019 14:54:44 +0900
Subject: [PATCH] ASoC: soc-core: add for_each_xxx macro for aux_dev

To be more readable code, this patch adds
new for_each_xxx() macro for aux_dev.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87ftmc6w8s.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc.h        | 10 ++++++++++
 sound/soc/meson/axg-card.c |  7 ++++---
 sound/soc/soc-core.c       | 15 ++++++++-------
 3 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 2fc56e5963f3..b1fe5ebea257 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1087,6 +1087,10 @@ struct snd_soc_card {
 	for ((i) = 0;							\
 	     ((i) < (card)->num_links) && ((link) = &(card)->dai_link[i]); \
 	     (i)++)
+#define for_each_card_pre_auxs(card, i, aux)				\
+	for ((i) = 0;							\
+	     ((i) < (card)->num_aux_devs) && ((aux) = &(card)->aux_dev[i]); \
+	     (i)++)
 
 #define for_each_card_links(card, link)				\
 	list_for_each_entry(link, &(card)->dai_link_list, list)
@@ -1098,6 +1102,12 @@ struct snd_soc_card {
 #define for_each_card_rtds_safe(card, rtd, _rtd)	\
 	list_for_each_entry_safe(rtd, _rtd, &(card)->rtd_list, list)
 
+#define for_each_card_auxs(card, component)			\
+	list_for_each_entry(component, &card->aux_comp_list, card_aux_list)
+#define for_each_card_auxs_safe(card, component, _comp)	\
+	list_for_each_entry_safe(component, _comp,	\
+				 &card->aux_comp_list, card_aux_list)
+
 #define for_each_card_components(card, component)			\
 	list_for_each_entry(component, &(card)->component_dev_list, card_list)
 
diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 6283e5025548..1f698adde506 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -111,6 +111,7 @@ static void axg_card_clean_references(struct axg_card *priv)
 	struct snd_soc_card *card = &priv->card;
 	struct snd_soc_dai_link *link;
 	struct snd_soc_dai_link_component *codec;
+	struct snd_soc_aux_dev *aux;
 	int i, j;
 
 	if (card->dai_link) {
@@ -123,8 +124,8 @@ static void axg_card_clean_references(struct axg_card *priv)
 	}
 
 	if (card->aux_dev) {
-		for (i = 0; i < card->num_aux_devs; i++)
-			of_node_put(card->aux_dev[i].dlc.of_node);
+		for_each_card_pre_auxs(card, i, aux)
+			of_node_put(aux->dlc.of_node);
 	}
 
 	kfree(card->dai_link);
@@ -157,7 +158,7 @@ static int axg_card_add_aux_devices(struct snd_soc_card *card)
 	card->aux_dev = aux;
 	card->num_aux_devs = num;
 
-	for (i = 0; i < card->num_aux_devs; i++, aux++) {
+	for_each_card_pre_auxs(card, i, aux) {
 		aux->dlc.of_node =
 			of_parse_phandle(node, "audio-aux-devs", i);
 		if (!aux->dlc.of_node)
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 4af382d52675..e9f44505cc3e 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1533,9 +1533,9 @@ static int soc_probe_link_dais(struct snd_soc_card *card,
 	return ret;
 }
 
-static int soc_bind_aux_dev(struct snd_soc_card *card, int num)
+static int soc_bind_aux_dev(struct snd_soc_card *card,
+			    struct snd_soc_aux_dev *aux_dev)
 {
-	struct snd_soc_aux_dev *aux_dev = &card->aux_dev[num];
 	struct snd_soc_component *component;
 
 	/* codecs, usually analog devices */
@@ -1544,6 +1544,7 @@ static int soc_bind_aux_dev(struct snd_soc_card *card, int num)
 		return -EPROBE_DEFER;
 
 	component->init = aux_dev->init;
+	/* see for_each_card_auxs */
 	list_add(&component->card_aux_list, &card->aux_comp_list);
 
 	return 0;
@@ -1556,7 +1557,7 @@ static int soc_probe_aux_devices(struct snd_soc_card *card)
 	int ret;
 
 	for_each_comp_order(order) {
-		list_for_each_entry(comp, &card->aux_comp_list, card_aux_list) {
+		for_each_card_auxs(card, comp) {
 			if (comp->driver->probe_order == order) {
 				ret = soc_probe_component(card,	comp);
 				if (ret < 0) {
@@ -1578,8 +1579,7 @@ static void soc_remove_aux_devices(struct snd_soc_card *card)
 	int order;
 
 	for_each_comp_order(order) {
-		list_for_each_entry_safe(comp, _comp,
-			&card->aux_comp_list, card_aux_list) {
+		for_each_card_auxs_safe(card, comp, _comp) {
 
 			if (comp->driver->remove_order == order) {
 				soc_remove_component(comp);
@@ -1913,6 +1913,7 @@ static int snd_soc_instantiate_card(struct snd_soc_card *card)
 {
 	struct snd_soc_pcm_runtime *rtd;
 	struct snd_soc_dai_link *dai_link;
+	struct snd_soc_aux_dev *aux;
 	int ret, i, order;
 
 	mutex_lock(&client_mutex);
@@ -1943,8 +1944,8 @@ static int snd_soc_instantiate_card(struct snd_soc_card *card)
 	}
 
 	/* bind aux_devs too */
-	for (i = 0; i < card->num_aux_devs; i++) {
-		ret = soc_bind_aux_dev(card, i);
+	for_each_card_pre_auxs(card, i, aux) {
+		ret = soc_bind_aux_dev(card, aux);
 		if (ret != 0)
 			goto probe_end;
 	}
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
