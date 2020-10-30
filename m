Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A89CC2A0595
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 13:40:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5058B1671;
	Fri, 30 Oct 2020 13:39:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5058B1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604061616;
	bh=yeq7lMKKzJ+WZpMFLCMt/3qiMWLa8zqA5ctJ4XooUJY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B66aboze6W8zOqjhFQzM70cl7OE6j8iPe+cmZC6fotsFYa2JCm4ThfzAsqLGsBm87
	 CGLV5X/vtdxqJcY5dZuDAPXb6mFKw4fdady9IJ5sxGhFV78mAUtsBRdb7XASHKWj+S
	 LsYzS5pSa3QpFaFtVMJzcMtZzd3HMyOr2//xX6v4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34A75F8026D;
	Fri, 30 Oct 2020 13:37:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 574F3F804BD; Fri, 30 Oct 2020 13:37:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9B6CF8026D
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 13:37:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9B6CF8026D
IronPort-SDR: ZrlCnQsZ2rZNZWZhODdYfm7ofBZES/iPINfluskGqXi35nE571OrYkZWeiB+CO/wzOXtWILY6q
 EbHGUW0lSfVQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="230234012"
X-IronPort-AV: E=Sophos;i="5.77,433,1596524400"; d="scan'208";a="230234012"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2020 05:37:41 -0700
IronPort-SDR: XiuXhVbMfScBc1fJWpiuz+NwfduREvGepruaSLd4IT7WjfjVNU5bV2iWgim6uGJ89vJFSyNv52
 HuiMejgK8qNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,433,1596524400"; d="scan'208";a="362433727"
Received: from pi-desktop.igk.intel.com ([10.237.148.102])
 by orsmga007.jf.intel.com with ESMTP; 30 Oct 2020 05:37:38 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 4/6] ASoC: topology: Change allocations to resource managed
Date: Fri, 30 Oct 2020 10:54:25 -0400
Message-Id: <20201030145427.3497990-5-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201030145427.3497990-1-amadeuszx.slawinski@linux.intel.com>
References: <20201030145427.3497990-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

In order for topology to be resource managed, change all allocations to
be resource managed:
k*alloc -> devm_k*alloc
kstrdup -> devm_kstrdup

Exceptions where non resource managed allocation is left is
soc_tplg_dapm_widget_create(), as it uses pointer to memory locally and
frees it up after use, as well as soc_tplg_dapm_graph_elems_load(),
which has temporary pointer to table of routes.

After conversion all redundant calls in error and clean up paths were
removed.

Also removed some variables which become unneeded when there is no calls
using them.

Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 171 +++++++++------------------------------
 1 file changed, 40 insertions(+), 131 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 9d95c1b01c5a..6ef508f56a5f 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -359,9 +359,6 @@ static void remove_mixer(struct snd_soc_component *comp,
 	struct snd_soc_dobj *dobj, int pass)
 {
 	struct snd_card *card = comp->card->snd_card;
-	struct soc_mixer_control *sm =
-		container_of(dobj, struct soc_mixer_control, dobj);
-	const unsigned int *p = NULL;
 
 	if (pass != SOC_TPLG_PASS_MIXER)
 		return;
@@ -369,12 +366,8 @@ static void remove_mixer(struct snd_soc_component *comp,
 	if (dobj->ops && dobj->ops->control_unload)
 		dobj->ops->control_unload(comp, dobj);
 
-	if (dobj->control.kcontrol->tlv.p)
-		p = dobj->control.kcontrol->tlv.p;
 	snd_ctl_remove(card, dobj->control.kcontrol);
 	list_del(&dobj->list);
-	kfree(sm);
-	kfree(p);
 }
 
 /* remove an enum kcontrol */
@@ -395,7 +388,6 @@ static void remove_enum(struct snd_soc_component *comp,
 
 	soc_tplg_denum_remove_values(se);
 	soc_tplg_denum_remove_texts(se);
-	kfree(se);
 }
 
 /* remove a byte kcontrol */
@@ -403,8 +395,6 @@ static void remove_bytes(struct snd_soc_component *comp,
 	struct snd_soc_dobj *dobj, int pass)
 {
 	struct snd_card *card = comp->card->snd_card;
-	struct soc_bytes_ext *sb =
-		container_of(dobj, struct soc_bytes_ext, dobj);
 
 	if (pass != SOC_TPLG_PASS_MIXER)
 		return;
@@ -414,16 +404,12 @@ static void remove_bytes(struct snd_soc_component *comp,
 
 	snd_ctl_remove(card, dobj->control.kcontrol);
 	list_del(&dobj->list);
-	kfree(sb);
 }
 
 /* remove a route */
 static void remove_route(struct snd_soc_component *comp,
 			 struct snd_soc_dobj *dobj, int pass)
 {
-	struct snd_soc_dapm_route *route =
-		container_of(dobj, struct snd_soc_dapm_route, dobj);
-
 	if (pass != SOC_TPLG_PASS_GRAPH)
 		return;
 
@@ -431,7 +417,6 @@ static void remove_route(struct snd_soc_component *comp,
 		dobj->ops->dapm_route_unload(comp, dobj);
 
 	list_del(&dobj->list);
-	kfree(route);
 }
 
 /* remove a widget and it's kcontrols - routes must be removed first */
@@ -469,30 +454,17 @@ static void remove_widget(struct snd_soc_component *comp,
 			soc_tplg_denum_remove_values(se);
 			soc_tplg_denum_remove_texts(se);
 
-			kfree(se);
-			kfree(w->kcontrol_news[i].name);
 		}
 	} else {
 		/* volume mixer or bytes controls */
 		for (i = 0; w->kcontrols != NULL && i < w->num_kcontrols; i++) {
 			struct snd_kcontrol *kcontrol = w->kcontrols[i];
 
-			if (dobj->widget.kcontrol_type
-			    == SND_SOC_TPLG_TYPE_MIXER)
-				kfree(kcontrol->tlv.p);
-
-			/* Private value is used as struct soc_mixer_control
-			 * for volume mixers or soc_bytes_ext for bytes
-			 * controls.
-			 */
-			kfree((void *)kcontrol->private_value);
 			snd_ctl_remove(card, kcontrol);
-			kfree(w->kcontrol_news[i].name);
 		}
 	}
 
 free_news:
-	kfree(w->kcontrol_news);
 
 	list_del(&dobj->list);
 
@@ -517,11 +489,7 @@ static void remove_dai(struct snd_soc_component *comp,
 		if (dai->driver == dai_drv)
 			dai->driver = NULL;
 
-	kfree(dai_drv->playback.stream_name);
-	kfree(dai_drv->capture.stream_name);
-	kfree(dai_drv->name);
 	list_del(&dobj->list);
-	kfree(dai_drv);
 }
 
 /* remove link configurations */
@@ -540,11 +508,6 @@ static void remove_link(struct snd_soc_component *comp,
 	list_del(&dobj->list);
 	snd_soc_remove_pcm_runtime(comp->card,
 			snd_soc_get_pcm_runtime(comp->card, link));
-
-	kfree(link->name);
-	kfree(link->stream_name);
-	kfree(link->cpus->dai_name);
-	kfree(link);
 }
 
 /* unload dai link */
@@ -699,7 +662,7 @@ static int soc_tplg_create_tlv_db_scale(struct soc_tplg *tplg,
 	unsigned int item_len = 2 * sizeof(unsigned int);
 	unsigned int *p;
 
-	p = kzalloc(item_len + 2 * sizeof(unsigned int), GFP_KERNEL);
+	p = devm_kzalloc(tplg->dev, item_len + 2 * sizeof(unsigned int), GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
 
@@ -743,7 +706,6 @@ static int soc_tplg_create_tlv(struct soc_tplg *tplg,
 static inline void soc_tplg_free_tlv(struct soc_tplg *tplg,
 	struct snd_kcontrol_new *kc)
 {
-	kfree(kc->tlv.p);
 }
 
 static int soc_tplg_dbytes_create(struct soc_tplg *tplg, unsigned int count,
@@ -771,7 +733,7 @@ static int soc_tplg_dbytes_create(struct soc_tplg *tplg, unsigned int count,
 			SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
 			return -EINVAL;
 
-		sbe = kzalloc(sizeof(*sbe), GFP_KERNEL);
+		sbe = devm_kzalloc(tplg->dev, sizeof(*sbe), GFP_KERNEL);
 		if (sbe == NULL)
 			return -ENOMEM;
 
@@ -797,7 +759,6 @@ static int soc_tplg_dbytes_create(struct soc_tplg *tplg, unsigned int count,
 		err = soc_tplg_kcontrol_bind_io(&be->hdr, &kc, tplg);
 		if (err) {
 			soc_control_err(tplg, &be->hdr, be->hdr.name);
-			kfree(sbe);
 			break;
 		}
 
@@ -807,7 +768,6 @@ static int soc_tplg_dbytes_create(struct soc_tplg *tplg, unsigned int count,
 		if (err < 0) {
 			dev_err(tplg->dev, "ASoC: failed to init %s\n",
 				be->hdr.name);
-			kfree(sbe);
 			break;
 		}
 
@@ -817,7 +777,6 @@ static int soc_tplg_dbytes_create(struct soc_tplg *tplg, unsigned int count,
 		if (err < 0) {
 			dev_err(tplg->dev, "ASoC: failed to add %s\n",
 				be->hdr.name);
-			kfree(sbe);
 			break;
 		}
 
@@ -853,7 +812,7 @@ static int soc_tplg_dmixer_create(struct soc_tplg *tplg, unsigned int count,
 			SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
 			return -EINVAL;
 
-		sm = kzalloc(sizeof(*sm), GFP_KERNEL);
+		sm = devm_kzalloc(tplg->dev, sizeof(*sm), GFP_KERNEL);
 		if (sm == NULL)
 			return -ENOMEM;
 		tplg->pos += (sizeof(struct snd_soc_tplg_mixer_control) +
@@ -892,7 +851,6 @@ static int soc_tplg_dmixer_create(struct soc_tplg *tplg, unsigned int count,
 		err = soc_tplg_kcontrol_bind_io(&mc->hdr, &kc, tplg);
 		if (err) {
 			soc_control_err(tplg, &mc->hdr, mc->hdr.name);
-			kfree(sm);
 			break;
 		}
 
@@ -901,7 +859,6 @@ static int soc_tplg_dmixer_create(struct soc_tplg *tplg, unsigned int count,
 		if (err < 0) {
 			dev_err(tplg->dev, "ASoC: failed to create TLV %s\n",
 				mc->hdr.name);
-			kfree(sm);
 			break;
 		}
 
@@ -912,7 +869,6 @@ static int soc_tplg_dmixer_create(struct soc_tplg *tplg, unsigned int count,
 			dev_err(tplg->dev, "ASoC: failed to init %s\n",
 				mc->hdr.name);
 			soc_tplg_free_tlv(tplg, &kc);
-			kfree(sm);
 			break;
 		}
 
@@ -923,7 +879,6 @@ static int soc_tplg_dmixer_create(struct soc_tplg *tplg, unsigned int count,
 			dev_err(tplg->dev, "ASoC: failed to add %s\n",
 				mc->hdr.name);
 			soc_tplg_free_tlv(tplg, &kc);
-			kfree(sm);
 			break;
 		}
 
@@ -933,13 +888,13 @@ static int soc_tplg_dmixer_create(struct soc_tplg *tplg, unsigned int count,
 	return err;
 }
 
-static int soc_tplg_denum_create_texts(struct soc_enum *se,
-	struct snd_soc_tplg_enum_control *ec)
+static int soc_tplg_denum_create_texts(struct soc_tplg *tplg, struct soc_enum *se,
+				       struct snd_soc_tplg_enum_control *ec)
 {
 	int i, ret;
 
 	se->dobj.control.dtexts =
-		kcalloc(le32_to_cpu(ec->items), sizeof(char *), GFP_KERNEL);
+		devm_kcalloc(tplg->dev, le32_to_cpu(ec->items), sizeof(char *), GFP_KERNEL);
 	if (se->dobj.control.dtexts == NULL)
 		return -ENOMEM;
 
@@ -951,7 +906,7 @@ static int soc_tplg_denum_create_texts(struct soc_enum *se,
 			goto err;
 		}
 
-		se->dobj.control.dtexts[i] = kstrdup(ec->texts[i], GFP_KERNEL);
+		se->dobj.control.dtexts[i] = devm_kstrdup(tplg->dev, ec->texts[i], GFP_KERNEL);
 		if (!se->dobj.control.dtexts[i]) {
 			ret = -ENOMEM;
 			goto err;
@@ -970,22 +925,17 @@ static int soc_tplg_denum_create_texts(struct soc_enum *se,
 
 static inline void soc_tplg_denum_remove_texts(struct soc_enum *se)
 {
-	int i = se->items;
-
-	for (--i; i >= 0; i--)
-		kfree(se->dobj.control.dtexts[i]);
-	kfree(se->dobj.control.dtexts);
 }
 
-static int soc_tplg_denum_create_values(struct soc_enum *se,
-	struct snd_soc_tplg_enum_control *ec)
+static int soc_tplg_denum_create_values(struct soc_tplg *tplg, struct soc_enum *se,
+					struct snd_soc_tplg_enum_control *ec)
 {
 	int i;
 
 	if (le32_to_cpu(ec->items) > sizeof(*ec->values))
 		return -EINVAL;
 
-	se->dobj.control.dvalues = kzalloc(le32_to_cpu(ec->items) *
+	se->dobj.control.dvalues = devm_kzalloc(tplg->dev, le32_to_cpu(ec->items) *
 					   sizeof(u32),
 					   GFP_KERNEL);
 	if (!se->dobj.control.dvalues)
@@ -1001,7 +951,6 @@ static int soc_tplg_denum_create_values(struct soc_enum *se,
 
 static inline void soc_tplg_denum_remove_values(struct soc_enum *se)
 {
-	kfree(se->dobj.control.dvalues);
 }
 
 static int soc_tplg_denum_create(struct soc_tplg *tplg, unsigned int count,
@@ -1030,7 +979,7 @@ static int soc_tplg_denum_create(struct soc_tplg *tplg, unsigned int count,
 			SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
 			return -EINVAL;
 
-		se = kzalloc((sizeof(*se)), GFP_KERNEL);
+		se = devm_kzalloc(tplg->dev, (sizeof(*se)), GFP_KERNEL);
 		if (se == NULL)
 			return -ENOMEM;
 
@@ -1061,7 +1010,7 @@ static int soc_tplg_denum_create(struct soc_tplg *tplg, unsigned int count,
 		switch (le32_to_cpu(ec->hdr.ops.info)) {
 		case SND_SOC_TPLG_DAPM_CTL_ENUM_VALUE:
 		case SND_SOC_TPLG_CTL_ENUM_VALUE:
-			err = soc_tplg_denum_create_values(se, ec);
+			err = soc_tplg_denum_create_values(tplg, se, ec);
 			if (err < 0) {
 				dev_err(tplg->dev,
 					"ASoC: could not create values for %s\n",
@@ -1072,7 +1021,7 @@ static int soc_tplg_denum_create(struct soc_tplg *tplg, unsigned int count,
 		case SND_SOC_TPLG_CTL_ENUM:
 		case SND_SOC_TPLG_DAPM_CTL_ENUM_DOUBLE:
 		case SND_SOC_TPLG_DAPM_CTL_ENUM_VIRT:
-			err = soc_tplg_denum_create_texts(se, ec);
+			err = soc_tplg_denum_create_texts(tplg, se, ec);
 			if (err < 0) {
 				dev_err(tplg->dev,
 					"ASoC: could not create texts for %s\n",
@@ -1118,7 +1067,6 @@ static int soc_tplg_denum_create(struct soc_tplg *tplg, unsigned int count,
 	return 0;
 
 err_denum:
-	kfree(se);
 	return err;
 }
 
@@ -1195,7 +1143,7 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
 	struct snd_soc_dapm_context *dapm = &tplg->comp->dapm;
 	struct snd_soc_tplg_dapm_graph_elem *elem;
 	struct snd_soc_dapm_route **routes;
-	int count, i, j;
+	int count, i;
 	int ret = 0;
 
 	count = le32_to_cpu(hdr->count);
@@ -1224,15 +1172,9 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
 	 * each route can be freed when it is removed in remove_route().
 	 */
 	for (i = 0; i < count; i++) {
-		routes[i] = kzalloc(sizeof(*routes[i]), GFP_KERNEL);
-		if (!routes[i]) {
-			/* free previously allocated memory */
-			for (j = 0; j < i; j++)
-				kfree(routes[j]);
-
-			kfree(routes);
+		routes[i] = devm_kzalloc(tplg->dev, sizeof(*routes[i]), GFP_KERNEL);
+		if (!routes[i])
 			return -ENOMEM;
-		}
 	}
 
 	for (i = 0; i < count; i++) {
@@ -1289,15 +1231,6 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
 		snd_soc_dapm_add_routes(dapm, routes[i], 1);
 	}
 
-	/*
-	 * free memory allocated for all dapm routes not added to the
-	 * list in case of error
-	 */
-	if (ret < 0) {
-		while (i < count)
-			kfree(routes[i++]);
-	}
-
 	/*
 	 * free pointer to array of dapm routes as this is no longer needed.
 	 * The memory allocated for each dapm route will be freed
@@ -1316,7 +1249,7 @@ static struct snd_kcontrol_new *soc_tplg_dapm_widget_dmixer_create(
 	struct snd_soc_tplg_mixer_control *mc;
 	int i, err;
 
-	kc = kcalloc(num_kcontrols, sizeof(*kc), GFP_KERNEL);
+	kc = devm_kcalloc(tplg->dev, num_kcontrols, sizeof(*kc), GFP_KERNEL);
 	if (kc == NULL)
 		return NULL;
 
@@ -1328,7 +1261,7 @@ static struct snd_kcontrol_new *soc_tplg_dapm_widget_dmixer_create(
 			SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
 			goto err_sm;
 
-		sm = kzalloc(sizeof(*sm), GFP_KERNEL);
+		sm = devm_kzalloc(tplg->dev, sizeof(*sm), GFP_KERNEL);
 		if (sm == NULL)
 			goto err_sm;
 
@@ -1339,7 +1272,7 @@ static struct snd_kcontrol_new *soc_tplg_dapm_widget_dmixer_create(
 			mc->hdr.name, i);
 
 		kc[i].private_value = (long)sm;
-		kc[i].name = kstrdup(mc->hdr.name, GFP_KERNEL);
+		kc[i].name = devm_kstrdup(tplg->dev, mc->hdr.name, GFP_KERNEL);
 		if (kc[i].name == NULL)
 			goto err_sm;
 		kc[i].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
@@ -1391,11 +1324,7 @@ static struct snd_kcontrol_new *soc_tplg_dapm_widget_dmixer_create(
 err_sm:
 	for (; i >= 0; i--) {
 		soc_tplg_free_tlv(tplg, &kc[i]);
-		sm = (struct soc_mixer_control *)kc[i].private_value;
-		kfree(sm);
-		kfree(kc[i].name);
 	}
-	kfree(kc);
 
 	return NULL;
 }
@@ -1408,7 +1337,7 @@ static struct snd_kcontrol_new *soc_tplg_dapm_widget_denum_create(
 	struct soc_enum *se;
 	int i, err;
 
-	kc = kcalloc(num_kcontrols, sizeof(*kc), GFP_KERNEL);
+	kc = devm_kcalloc(tplg->dev, num_kcontrols, sizeof(*kc), GFP_KERNEL);
 	if (kc == NULL)
 		return NULL;
 
@@ -1419,7 +1348,7 @@ static struct snd_kcontrol_new *soc_tplg_dapm_widget_denum_create(
 			    SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
 			goto err_se;
 
-		se = kzalloc(sizeof(*se), GFP_KERNEL);
+		se = devm_kzalloc(tplg->dev, sizeof(*se), GFP_KERNEL);
 		if (se == NULL)
 			goto err_se;
 
@@ -1430,7 +1359,7 @@ static struct snd_kcontrol_new *soc_tplg_dapm_widget_denum_create(
 			ec->hdr.name);
 
 		kc[i].private_value = (long)se;
-		kc[i].name = kstrdup(ec->hdr.name, GFP_KERNEL);
+		kc[i].name = devm_kstrdup(tplg->dev, ec->hdr.name, GFP_KERNEL);
 		if (kc[i].name == NULL)
 			goto err_se;
 		kc[i].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
@@ -1450,7 +1379,7 @@ static struct snd_kcontrol_new *soc_tplg_dapm_widget_denum_create(
 		switch (le32_to_cpu(ec->hdr.ops.info)) {
 		case SND_SOC_TPLG_CTL_ENUM_VALUE:
 		case SND_SOC_TPLG_DAPM_CTL_ENUM_VALUE:
-			err = soc_tplg_denum_create_values(se, ec);
+			err = soc_tplg_denum_create_values(tplg, se, ec);
 			if (err < 0) {
 				dev_err(tplg->dev, "ASoC: could not create values for %s\n",
 					ec->hdr.name);
@@ -1460,7 +1389,7 @@ static struct snd_kcontrol_new *soc_tplg_dapm_widget_denum_create(
 		case SND_SOC_TPLG_CTL_ENUM:
 		case SND_SOC_TPLG_DAPM_CTL_ENUM_DOUBLE:
 		case SND_SOC_TPLG_DAPM_CTL_ENUM_VIRT:
-			err = soc_tplg_denum_create_texts(se, ec);
+			err = soc_tplg_denum_create_texts(tplg, se, ec);
 			if (err < 0) {
 				dev_err(tplg->dev, "ASoC: could not create texts for %s\n",
 					ec->hdr.name);
@@ -1502,10 +1431,7 @@ static struct snd_kcontrol_new *soc_tplg_dapm_widget_denum_create(
 			soc_tplg_denum_remove_texts(se);
 		}
 
-		kfree(se);
-		kfree(kc[i].name);
 	}
-	kfree(kc);
 
 	return NULL;
 }
@@ -1518,7 +1444,7 @@ static struct snd_kcontrol_new *soc_tplg_dapm_widget_dbytes_create(
 	struct snd_kcontrol_new *kc;
 	int i, err;
 
-	kc = kcalloc(num_kcontrols, sizeof(*kc), GFP_KERNEL);
+	kc = devm_kcalloc(tplg->dev, num_kcontrols, sizeof(*kc), GFP_KERNEL);
 	if (!kc)
 		return NULL;
 
@@ -1530,7 +1456,7 @@ static struct snd_kcontrol_new *soc_tplg_dapm_widget_dbytes_create(
 			SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
 			goto err_sbe;
 
-		sbe = kzalloc(sizeof(*sbe), GFP_KERNEL);
+		sbe = devm_kzalloc(tplg->dev, sizeof(*sbe), GFP_KERNEL);
 		if (sbe == NULL)
 			goto err_sbe;
 
@@ -1542,7 +1468,7 @@ static struct snd_kcontrol_new *soc_tplg_dapm_widget_dbytes_create(
 			be->hdr.name, be->hdr.access);
 
 		kc[i].private_value = (long)sbe;
-		kc[i].name = kstrdup(be->hdr.name, GFP_KERNEL);
+		kc[i].name = devm_kstrdup(tplg->dev, be->hdr.name, GFP_KERNEL);
 		if (kc[i].name == NULL)
 			goto err_sbe;
 		kc[i].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
@@ -1571,12 +1497,6 @@ static struct snd_kcontrol_new *soc_tplg_dapm_widget_dbytes_create(
 	return kc;
 
 err_sbe:
-	for (; i >= 0; i--) {
-		sbe = (struct soc_bytes_ext *)kc[i].private_value;
-		kfree(sbe);
-		kfree(kc[i].name);
-	}
-	kfree(kc);
 
 	return NULL;
 }
@@ -1783,10 +1703,10 @@ static int soc_tplg_dapm_complete(struct soc_tplg *tplg)
 	return 0;
 }
 
-static int set_stream_info(struct snd_soc_pcm_stream *stream,
-	struct snd_soc_tplg_stream_caps *caps)
+static int set_stream_info(struct soc_tplg *tplg, struct snd_soc_pcm_stream *stream,
+			   struct snd_soc_tplg_stream_caps *caps)
 {
-	stream->stream_name = kstrdup(caps->name, GFP_KERNEL);
+	stream->stream_name = devm_kstrdup(tplg->dev, caps->name, GFP_KERNEL);
 	if (!stream->stream_name)
 		return -ENOMEM;
 
@@ -1830,12 +1750,12 @@ static int soc_tplg_dai_create(struct soc_tplg *tplg,
 		snd_soc_component_get_dapm(tplg->comp);
 	int ret;
 
-	dai_drv = kzalloc(sizeof(struct snd_soc_dai_driver), GFP_KERNEL);
+	dai_drv = devm_kzalloc(tplg->dev, sizeof(struct snd_soc_dai_driver), GFP_KERNEL);
 	if (dai_drv == NULL)
 		return -ENOMEM;
 
 	if (strlen(pcm->dai_name)) {
-		dai_drv->name = kstrdup(pcm->dai_name, GFP_KERNEL);
+		dai_drv->name = devm_kstrdup(tplg->dev, pcm->dai_name, GFP_KERNEL);
 		if (!dai_drv->name) {
 			ret = -ENOMEM;
 			goto err;
@@ -1846,7 +1766,7 @@ static int soc_tplg_dai_create(struct soc_tplg *tplg,
 	if (pcm->playback) {
 		stream = &dai_drv->playback;
 		caps = &pcm->caps[SND_SOC_TPLG_STREAM_PLAYBACK];
-		ret = set_stream_info(stream, caps);
+		ret = set_stream_info(tplg, stream, caps);
 		if (ret < 0)
 			goto err;
 	}
@@ -1854,7 +1774,7 @@ static int soc_tplg_dai_create(struct soc_tplg *tplg,
 	if (pcm->capture) {
 		stream = &dai_drv->capture;
 		caps = &pcm->caps[SND_SOC_TPLG_STREAM_CAPTURE];
-		ret = set_stream_info(stream, caps);
+		ret = set_stream_info(tplg, stream, caps);
 		if (ret < 0)
 			goto err;
 	}
@@ -1889,11 +1809,6 @@ static int soc_tplg_dai_create(struct soc_tplg *tplg,
 	return 0;
 
 err:
-	kfree(dai_drv->playback.stream_name);
-	kfree(dai_drv->capture.stream_name);
-	kfree(dai_drv->name);
-	kfree(dai_drv);
-
 	return ret;
 }
 
@@ -1929,7 +1844,7 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 	int ret;
 
 	/* link + cpu + codec + platform */
-	link = kzalloc(sizeof(*link) + (3 * sizeof(*dlc)), GFP_KERNEL);
+	link = devm_kzalloc(tplg->dev, sizeof(*link) + (3 * sizeof(*dlc)), GFP_KERNEL);
 	if (link == NULL)
 		return -ENOMEM;
 
@@ -1948,8 +1863,8 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 	link->dobj.type = SND_SOC_DOBJ_DAI_LINK;
 
 	if (strlen(pcm->pcm_name)) {
-		link->name = kstrdup(pcm->pcm_name, GFP_KERNEL);
-		link->stream_name = kstrdup(pcm->pcm_name, GFP_KERNEL);
+		link->name = devm_kstrdup(tplg->dev, pcm->pcm_name, GFP_KERNEL);
+		link->stream_name = devm_kstrdup(tplg->dev, pcm->pcm_name, GFP_KERNEL);
 		if (!link->name || !link->stream_name) {
 			ret = -ENOMEM;
 			goto err;
@@ -1958,7 +1873,7 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 	link->id = le32_to_cpu(pcm->pcm_id);
 
 	if (strlen(pcm->dai_name)) {
-		link->cpus->dai_name = kstrdup(pcm->dai_name, GFP_KERNEL);
+		link->cpus->dai_name = devm_kstrdup(tplg->dev, pcm->dai_name, GFP_KERNEL);
 		if (!link->cpus->dai_name) {
 			ret = -ENOMEM;
 			goto err;
@@ -1996,10 +1911,6 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 
 	return 0;
 err:
-	kfree(link->name);
-	kfree(link->stream_name);
-	kfree(link->cpus->dai_name);
-	kfree(link);
 	return ret;
 }
 
@@ -2472,7 +2383,7 @@ static int soc_tplg_dai_config(struct soc_tplg *tplg,
 	if (d->playback) {
 		stream = &dai_drv->playback;
 		caps = &d->caps[SND_SOC_TPLG_STREAM_PLAYBACK];
-		ret = set_stream_info(stream, caps);
+		ret = set_stream_info(tplg, stream, caps);
 		if (ret < 0)
 			goto err;
 	}
@@ -2480,7 +2391,7 @@ static int soc_tplg_dai_config(struct soc_tplg *tplg,
 	if (d->capture) {
 		stream = &dai_drv->capture;
 		caps = &d->caps[SND_SOC_TPLG_STREAM_CAPTURE];
-		ret = set_stream_info(stream, caps);
+		ret = set_stream_info(tplg, stream, caps);
 		if (ret < 0)
 			goto err;
 	}
@@ -2500,8 +2411,6 @@ static int soc_tplg_dai_config(struct soc_tplg *tplg,
 	return 0;
 
 err:
-	kfree(dai_drv->playback.stream_name);
-	kfree(dai_drv->capture.stream_name);
 	return ret;
 }
 
-- 
2.25.1

