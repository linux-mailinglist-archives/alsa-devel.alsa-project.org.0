Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C53C837560D
	for <lists+alsa-devel@lfdr.de>; Thu,  6 May 2021 16:58:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51CFA1677;
	Thu,  6 May 2021 16:58:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51CFA1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620313139;
	bh=+UBUlrh2JT/AXKKj/71yGnjb7Y0vwqQOw65xcEIC9so=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=peRMCgsJ8TYLaj4H8S+sJ2nzIPaoDS0dzqnxOWcqA0qySA7vFCXFdH9n6/FeRrt5M
	 U7UBHMOJp9oeHVNDwOR9GDXNR4NMZ4si9zOYUcc8q8Sh2wKEYdO43pQdN86ONeS0t7
	 1K5i+0OLE/cmXrTSfGKYNGj4WrT4Xn9bI2GRJB7s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCA5FF80139;
	Thu,  6 May 2021 16:57:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 459F1F8021C; Thu,  6 May 2021 16:57:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD389F80139
 for <alsa-devel@alsa-project.org>; Thu,  6 May 2021 16:57:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD389F80139
IronPort-SDR: 2dDAdryO+Vyvw3ofW+0gbwugg2J4Zvbib02fvPcKPGEgzw5CW01hdgH79ddtQBlhCKd9EDGW1T
 +s6btMgcEKAA==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="178730786"
X-IronPort-AV: E=Sophos;i="5.82,277,1613462400"; d="scan'208";a="178730786"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 07:57:12 -0700
IronPort-SDR: Sja1nLrJS/dss2cvlJLJsJr/QmheJBzJsFCidBfywygAZaQNYOIIAWXNguhbzl+ONMKeQ05CU5
 2REUm4vdxHtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,277,1613462400"; d="scan'208";a="390743130"
Received: from kekkonen.fi.intel.com ([10.237.72.68])
 by orsmga006.jf.intel.com with ESMTP; 06 May 2021 07:57:09 -0700
From: Jaska Uimonen <jaska.uimonen@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v5] ASoC: topology: Add support for multiple kcontrol types to
 a widget
Date: Thu,  6 May 2021 17:38:42 +0300
Message-Id: <20210506143842.163823-1-jaska.uimonen@linux.intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
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

Current dapm widget has a single variable to describe its kcontrol's
type. As there can be many kcontrols in one widget it is inherently
presumed that the types are the same.

Lately there has been use cases where different types of kcontrols would
be needed for a single widget. Thus add pointer to dapm widget to hold
an array for different kcontrol types and modify the kcontrol creation
to operate in a loop based on individual kcontrol type.

Change control creation and deletion to use individual kcontrol types in
SOF driver. This is done in the same patch for not breaking bisect. SOF
driver is also currently the only one using the dapm widget
kcontrol_type.

Signed-off-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---

Hi,

This is a patch for enabling multiple different types of kcontrols for
a dapm widget. It refactors the dapm kcontrol parsing by lifting the
creation loop and memory allocation up one level and making the type
variable to hold multiple type values. Sof driver is modified to use
this type information in the same patch as it is quite cumbersome to
split the changes nicely.

changes since v4:
- change title from dapm -> topology
- remove cover letter
- cc maintainers, me learning list behavior, apologies for the noise

changes since v3:
- fix sparse warnings for not using le32_to_cpu

changes since v2:
- only 1 patch for not breaking bisect
- sof internal reviews -> minor changes + reviewed by tags
- no upstream comments after v2 -> assuming I'm on the right track here

Changes since v1:
- don't add kcontrol type to core i.e. to kcontrol and kcontrol_news
- extend existing dapm widget kcontrol_type into holding an array of
  types

include/sound/soc-topology.h |   2 +-
 sound/soc/soc-topology.c     | 467 +++++++++++++++++------------------
 sound/soc/sof/topology.c     |  15 +-
 3 files changed, 234 insertions(+), 250 deletions(-)

diff --git a/include/sound/soc-topology.h b/include/sound/soc-topology.h
index 328cf763d9b4..4afd667e124c 100644
--- a/include/sound/soc-topology.h
+++ b/include/sound/soc-topology.h
@@ -54,7 +54,7 @@ struct snd_soc_dobj_control {
 
 /* dynamic widget object */
 struct snd_soc_dobj_widget {
-	unsigned int kcontrol_type;	/* kcontrol type: mixer, enum, bytes */
+	unsigned int *kcontrol_type;	/* kcontrol type: mixer, enum, bytes */
 };
 
 /* generic dynamic object - all dynamic objects belong to this struct */
diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 73076d425efb..2a10bf2cfb00 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1203,249 +1203,216 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
 	return ret;
 }
 
-static struct snd_kcontrol_new *soc_tplg_dapm_widget_dmixer_create(
-	struct soc_tplg *tplg, int num_kcontrols)
+static int soc_tplg_dapm_widget_dmixer_create(struct soc_tplg *tplg, struct snd_kcontrol_new *kc)
 {
-	struct snd_kcontrol_new *kc;
 	struct soc_mixer_control *sm;
 	struct snd_soc_tplg_mixer_control *mc;
-	int i, err;
-
-	kc = devm_kcalloc(tplg->dev, num_kcontrols, sizeof(*kc), GFP_KERNEL);
-	if (kc == NULL)
-		return NULL;
-
-	for (i = 0; i < num_kcontrols; i++) {
-		mc = (struct snd_soc_tplg_mixer_control *)tplg->pos;
-
-		/* validate kcontrol */
-		if (strnlen(mc->hdr.name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
-			SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
-			goto err_sm;
+	int err;
 
-		sm = devm_kzalloc(tplg->dev, sizeof(*sm), GFP_KERNEL);
-		if (sm == NULL)
-			goto err_sm;
+	mc = (struct snd_soc_tplg_mixer_control *)tplg->pos;
 
-		tplg->pos += (sizeof(struct snd_soc_tplg_mixer_control) +
-			      le32_to_cpu(mc->priv.size));
+	/* validate kcontrol */
+	if (strnlen(mc->hdr.name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
+	    SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
+		return -EINVAL;
 
-		dev_dbg(tplg->dev, " adding DAPM widget mixer control %s at %d\n",
-			mc->hdr.name, i);
+	sm = devm_kzalloc(tplg->dev, sizeof(*sm), GFP_KERNEL);
+	if (!sm)
+		return -ENOMEM;
 
-		kc[i].private_value = (long)sm;
-		kc[i].name = devm_kstrdup(tplg->dev, mc->hdr.name, GFP_KERNEL);
-		if (kc[i].name == NULL)
-			goto err_sm;
-		kc[i].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-		kc[i].access = le32_to_cpu(mc->hdr.access);
+	tplg->pos += sizeof(struct snd_soc_tplg_mixer_control) +
+		le32_to_cpu(mc->priv.size);
 
-		/* we only support FL/FR channel mapping atm */
-		sm->reg = tplc_chan_get_reg(tplg, mc->channel,
-			SNDRV_CHMAP_FL);
-		sm->rreg = tplc_chan_get_reg(tplg, mc->channel,
-			SNDRV_CHMAP_FR);
-		sm->shift = tplc_chan_get_shift(tplg, mc->channel,
-			SNDRV_CHMAP_FL);
-		sm->rshift = tplc_chan_get_shift(tplg, mc->channel,
-			SNDRV_CHMAP_FR);
+	dev_dbg(tplg->dev, " adding DAPM widget mixer control %s\n",
+		mc->hdr.name);
 
-		sm->max = le32_to_cpu(mc->max);
-		sm->min = le32_to_cpu(mc->min);
-		sm->invert = le32_to_cpu(mc->invert);
-		sm->platform_max = le32_to_cpu(mc->platform_max);
-		sm->dobj.index = tplg->index;
-		INIT_LIST_HEAD(&sm->dobj.list);
-
-		/* map io handlers */
-		err = soc_tplg_kcontrol_bind_io(&mc->hdr, &kc[i], tplg);
-		if (err) {
-			soc_control_err(tplg, &mc->hdr, mc->hdr.name);
-			goto err_sm;
-		}
+	kc->private_value = (long)sm;
+	kc->name = devm_kstrdup(tplg->dev, mc->hdr.name, GFP_KERNEL);
+	if (!kc->name)
+		return -ENOMEM;
+	kc->iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	kc->access = le32_to_cpu(mc->hdr.access);
+
+	/* we only support FL/FR channel mapping atm */
+	sm->reg = tplc_chan_get_reg(tplg, mc->channel,
+				    SNDRV_CHMAP_FL);
+	sm->rreg = tplc_chan_get_reg(tplg, mc->channel,
+				     SNDRV_CHMAP_FR);
+	sm->shift = tplc_chan_get_shift(tplg, mc->channel,
+					SNDRV_CHMAP_FL);
+	sm->rshift = tplc_chan_get_shift(tplg, mc->channel,
+					 SNDRV_CHMAP_FR);
+
+	sm->max = le32_to_cpu(mc->max);
+	sm->min = le32_to_cpu(mc->min);
+	sm->invert = le32_to_cpu(mc->invert);
+	sm->platform_max = le32_to_cpu(mc->platform_max);
+	sm->dobj.index = tplg->index;
+	INIT_LIST_HEAD(&sm->dobj.list);
+
+	/* map io handlers */
+	err = soc_tplg_kcontrol_bind_io(&mc->hdr, kc, tplg);
+	if (err) {
+		soc_control_err(tplg, &mc->hdr, mc->hdr.name);
+		return err;
+	}
 
-		/* create any TLV data */
-		err = soc_tplg_create_tlv(tplg, &kc[i], &mc->hdr);
-		if (err < 0) {
-			dev_err(tplg->dev, "ASoC: failed to create TLV %s\n",
-				mc->hdr.name);
-			goto err_sm;
-		}
+	/* create any TLV data */
+	err = soc_tplg_create_tlv(tplg, kc, &mc->hdr);
+	if (err < 0) {
+		dev_err(tplg->dev, "ASoC: failed to create TLV %s\n",
+			mc->hdr.name);
+		return err;
+	}
 
-		/* pass control to driver for optional further init */
-		err = soc_tplg_init_kcontrol(tplg, &kc[i],
-			(struct snd_soc_tplg_ctl_hdr *)mc);
-		if (err < 0) {
-			dev_err(tplg->dev, "ASoC: failed to init %s\n",
-				mc->hdr.name);
-			goto err_sm;
-		}
+	/* pass control to driver for optional further init */
+	err = soc_tplg_init_kcontrol(tplg, kc,
+				     (struct snd_soc_tplg_ctl_hdr *)mc);
+	if (err < 0) {
+		dev_err(tplg->dev, "ASoC: failed to init %s\n",
+			mc->hdr.name);
+		return err;
 	}
-	return kc;
 
-err_sm:
-	return NULL;
+	return 0;
 }
 
-static struct snd_kcontrol_new *soc_tplg_dapm_widget_denum_create(
-	struct soc_tplg *tplg, int num_kcontrols)
+static int soc_tplg_dapm_widget_denum_create(struct soc_tplg *tplg, struct snd_kcontrol_new *kc)
 {
-	struct snd_kcontrol_new *kc;
 	struct snd_soc_tplg_enum_control *ec;
 	struct soc_enum *se;
-	int i, err;
-
-	kc = devm_kcalloc(tplg->dev, num_kcontrols, sizeof(*kc), GFP_KERNEL);
-	if (kc == NULL)
-		return NULL;
-
-	for (i = 0; i < num_kcontrols; i++) {
-		ec = (struct snd_soc_tplg_enum_control *)tplg->pos;
-		/* validate kcontrol */
-		if (strnlen(ec->hdr.name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
-			    SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
-			goto err_se;
+	int err;
 
-		se = devm_kzalloc(tplg->dev, sizeof(*se), GFP_KERNEL);
-		if (se == NULL)
-			goto err_se;
+	ec = (struct snd_soc_tplg_enum_control *)tplg->pos;
+	/* validate kcontrol */
+	if (strnlen(ec->hdr.name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
+	    SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
+		return -EINVAL;
 
-		tplg->pos += (sizeof(struct snd_soc_tplg_enum_control) +
-			      le32_to_cpu(ec->priv.size));
+	se = devm_kzalloc(tplg->dev, sizeof(*se), GFP_KERNEL);
+	if (!se)
+		return -ENOMEM;
 
-		dev_dbg(tplg->dev, " adding DAPM widget enum control %s\n",
-			ec->hdr.name);
+	tplg->pos += (sizeof(struct snd_soc_tplg_enum_control) +
+		      le32_to_cpu(ec->priv.size));
 
-		kc[i].private_value = (long)se;
-		kc[i].name = devm_kstrdup(tplg->dev, ec->hdr.name, GFP_KERNEL);
-		if (kc[i].name == NULL)
-			goto err_se;
-		kc[i].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-		kc[i].access = le32_to_cpu(ec->hdr.access);
+	dev_dbg(tplg->dev, " adding DAPM widget enum control %s\n",
+		ec->hdr.name);
 
-		/* we only support FL/FR channel mapping atm */
-		se->reg = tplc_chan_get_reg(tplg, ec->channel, SNDRV_CHMAP_FL);
-		se->shift_l = tplc_chan_get_shift(tplg, ec->channel,
-						  SNDRV_CHMAP_FL);
-		se->shift_r = tplc_chan_get_shift(tplg, ec->channel,
-						  SNDRV_CHMAP_FR);
+	kc->private_value = (long)se;
+	kc->name = devm_kstrdup(tplg->dev, ec->hdr.name, GFP_KERNEL);
+	if (!kc->name)
+		return -ENOMEM;
+	kc->iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	kc->access = le32_to_cpu(ec->hdr.access);
 
-		se->items = le32_to_cpu(ec->items);
-		se->mask = le32_to_cpu(ec->mask);
-		se->dobj.index = tplg->index;
+	/* we only support FL/FR channel mapping atm */
+	se->reg = tplc_chan_get_reg(tplg, ec->channel, SNDRV_CHMAP_FL);
+	se->shift_l = tplc_chan_get_shift(tplg, ec->channel,
+					  SNDRV_CHMAP_FL);
+	se->shift_r = tplc_chan_get_shift(tplg, ec->channel,
+					  SNDRV_CHMAP_FR);
 
-		switch (le32_to_cpu(ec->hdr.ops.info)) {
-		case SND_SOC_TPLG_CTL_ENUM_VALUE:
-		case SND_SOC_TPLG_DAPM_CTL_ENUM_VALUE:
-			err = soc_tplg_denum_create_values(tplg, se, ec);
-			if (err < 0) {
-				dev_err(tplg->dev, "ASoC: could not create values for %s\n",
-					ec->hdr.name);
-				goto err_se;
-			}
-			fallthrough;
-		case SND_SOC_TPLG_CTL_ENUM:
-		case SND_SOC_TPLG_DAPM_CTL_ENUM_DOUBLE:
-		case SND_SOC_TPLG_DAPM_CTL_ENUM_VIRT:
-			err = soc_tplg_denum_create_texts(tplg, se, ec);
-			if (err < 0) {
-				dev_err(tplg->dev, "ASoC: could not create texts for %s\n",
-					ec->hdr.name);
-				goto err_se;
-			}
-			break;
-		default:
-			dev_err(tplg->dev, "ASoC: invalid enum control type %d for %s\n",
-				ec->hdr.ops.info, ec->hdr.name);
-			goto err_se;
-		}
+	se->items = le32_to_cpu(ec->items);
+	se->mask = le32_to_cpu(ec->mask);
+	se->dobj.index = tplg->index;
 
-		/* map io handlers */
-		err = soc_tplg_kcontrol_bind_io(&ec->hdr, &kc[i], tplg);
-		if (err) {
-			soc_control_err(tplg, &ec->hdr, ec->hdr.name);
-			goto err_se;
+	switch (le32_to_cpu(ec->hdr.ops.info)) {
+	case SND_SOC_TPLG_CTL_ENUM_VALUE:
+	case SND_SOC_TPLG_DAPM_CTL_ENUM_VALUE:
+		err = soc_tplg_denum_create_values(tplg, se, ec);
+		if (err < 0) {
+			dev_err(tplg->dev, "ASoC: could not create values for %s\n",
+				ec->hdr.name);
+			return err;
 		}
-
-		/* pass control to driver for optional further init */
-		err = soc_tplg_init_kcontrol(tplg, &kc[i],
-			(struct snd_soc_tplg_ctl_hdr *)ec);
+		fallthrough;
+	case SND_SOC_TPLG_CTL_ENUM:
+	case SND_SOC_TPLG_DAPM_CTL_ENUM_DOUBLE:
+	case SND_SOC_TPLG_DAPM_CTL_ENUM_VIRT:
+		err = soc_tplg_denum_create_texts(tplg, se, ec);
 		if (err < 0) {
-			dev_err(tplg->dev, "ASoC: failed to init %s\n",
+			dev_err(tplg->dev, "ASoC: could not create texts for %s\n",
 				ec->hdr.name);
-			goto err_se;
+			return err;
 		}
+		break;
+	default:
+		dev_err(tplg->dev, "ASoC: invalid enum control type %d for %s\n",
+			ec->hdr.ops.info, ec->hdr.name);
+		return -EINVAL;
 	}
 
-	return kc;
+	/* map io handlers */
+	err = soc_tplg_kcontrol_bind_io(&ec->hdr, kc, tplg);
+	if (err) {
+		soc_control_err(tplg, &ec->hdr, ec->hdr.name);
+		return err;
+	}
 
-err_se:
-	return NULL;
+	/* pass control to driver for optional further init */
+	err = soc_tplg_init_kcontrol(tplg, kc,
+				     (struct snd_soc_tplg_ctl_hdr *)ec);
+	if (err < 0) {
+		dev_err(tplg->dev, "ASoC: failed to init %s\n",
+			ec->hdr.name);
+		return err;
+	}
+
+	return 0;
 }
 
-static struct snd_kcontrol_new *soc_tplg_dapm_widget_dbytes_create(
-	struct soc_tplg *tplg, int num_kcontrols)
+static int soc_tplg_dapm_widget_dbytes_create(struct soc_tplg *tplg, struct snd_kcontrol_new *kc)
 {
 	struct snd_soc_tplg_bytes_control *be;
 	struct soc_bytes_ext *sbe;
-	struct snd_kcontrol_new *kc;
-	int i, err;
-
-	kc = devm_kcalloc(tplg->dev, num_kcontrols, sizeof(*kc), GFP_KERNEL);
-	if (!kc)
-		return NULL;
+	int err;
 
-	for (i = 0; i < num_kcontrols; i++) {
-		be = (struct snd_soc_tplg_bytes_control *)tplg->pos;
+	be = (struct snd_soc_tplg_bytes_control *)tplg->pos;
 
-		/* validate kcontrol */
-		if (strnlen(be->hdr.name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
-			SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
-			goto err_sbe;
+	/* validate kcontrol */
+	if (strnlen(be->hdr.name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
+	    SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
+		return -EINVAL;
 
-		sbe = devm_kzalloc(tplg->dev, sizeof(*sbe), GFP_KERNEL);
-		if (sbe == NULL)
-			goto err_sbe;
+	sbe = devm_kzalloc(tplg->dev, sizeof(*sbe), GFP_KERNEL);
+	if (!sbe)
+		return -ENOMEM;
 
-		tplg->pos += (sizeof(struct snd_soc_tplg_bytes_control) +
-			      le32_to_cpu(be->priv.size));
+	tplg->pos += (sizeof(struct snd_soc_tplg_bytes_control) +
+		      le32_to_cpu(be->priv.size));
 
-		dev_dbg(tplg->dev,
-			"ASoC: adding bytes kcontrol %s with access 0x%x\n",
-			be->hdr.name, be->hdr.access);
+	dev_dbg(tplg->dev,
+		"ASoC: adding bytes kcontrol %s with access 0x%x\n",
+		be->hdr.name, be->hdr.access);
 
-		kc[i].private_value = (long)sbe;
-		kc[i].name = devm_kstrdup(tplg->dev, be->hdr.name, GFP_KERNEL);
-		if (kc[i].name == NULL)
-			goto err_sbe;
-		kc[i].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-		kc[i].access = le32_to_cpu(be->hdr.access);
+	kc->private_value = (long)sbe;
+	kc->name = devm_kstrdup(tplg->dev, be->hdr.name, GFP_KERNEL);
+	if (!kc->name)
+		return -ENOMEM;
+	kc->iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	kc->access = le32_to_cpu(be->hdr.access);
 
-		sbe->max = le32_to_cpu(be->max);
-		INIT_LIST_HEAD(&sbe->dobj.list);
+	sbe->max = le32_to_cpu(be->max);
+	INIT_LIST_HEAD(&sbe->dobj.list);
 
-		/* map standard io handlers and check for external handlers */
-		err = soc_tplg_kcontrol_bind_io(&be->hdr, &kc[i], tplg);
-		if (err) {
-			soc_control_err(tplg, &be->hdr, be->hdr.name);
-			goto err_sbe;
-		}
-
-		/* pass control to driver for optional further init */
-		err = soc_tplg_init_kcontrol(tplg, &kc[i],
-			(struct snd_soc_tplg_ctl_hdr *)be);
-		if (err < 0) {
-			dev_err(tplg->dev, "ASoC: failed to init %s\n",
-				be->hdr.name);
-			goto err_sbe;
-		}
+	/* map standard io handlers and check for external handlers */
+	err = soc_tplg_kcontrol_bind_io(&be->hdr, kc, tplg);
+	if (err) {
+		soc_control_err(tplg, &be->hdr, be->hdr.name);
+		return err;
 	}
 
-	return kc;
-
-err_sbe:
+	/* pass control to driver for optional further init */
+	err = soc_tplg_init_kcontrol(tplg, kc,
+				     (struct snd_soc_tplg_ctl_hdr *)be);
+	if (err < 0) {
+		dev_err(tplg->dev, "ASoC: failed to init %s\n",
+			be->hdr.name);
+		return err;
+	}
 
-	return NULL;
+	return 0;
 }
 
 static int soc_tplg_dapm_widget_create(struct soc_tplg *tplg,
@@ -1455,8 +1422,13 @@ static int soc_tplg_dapm_widget_create(struct soc_tplg *tplg,
 	struct snd_soc_dapm_widget template, *widget;
 	struct snd_soc_tplg_ctl_hdr *control_hdr;
 	struct snd_soc_card *card = tplg->comp->card;
-	unsigned int kcontrol_type;
+	unsigned int *kcontrol_type;
+	struct snd_kcontrol_new *kc;
+	int mixer_count = 0;
+	int bytes_count = 0;
+	int enum_count = 0;
 	int ret = 0;
+	int i;
 
 	if (strnlen(w->name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
 		SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
@@ -1499,7 +1471,6 @@ static int soc_tplg_dapm_widget_create(struct soc_tplg *tplg,
 		 le32_to_cpu(w->priv.size));
 
 	if (w->num_kcontrols == 0) {
-		kcontrol_type = 0;
 		template.num_kcontrols = 0;
 		goto widget;
 	}
@@ -1508,57 +1479,66 @@ static int soc_tplg_dapm_widget_create(struct soc_tplg *tplg,
 	dev_dbg(tplg->dev, "ASoC: template %s has %d controls of type %x\n",
 		w->name, w->num_kcontrols, control_hdr->type);
 
-	switch (le32_to_cpu(control_hdr->ops.info)) {
-	case SND_SOC_TPLG_CTL_VOLSW:
-	case SND_SOC_TPLG_CTL_STROBE:
-	case SND_SOC_TPLG_CTL_VOLSW_SX:
-	case SND_SOC_TPLG_CTL_VOLSW_XR_SX:
-	case SND_SOC_TPLG_CTL_RANGE:
-	case SND_SOC_TPLG_DAPM_CTL_VOLSW:
-		kcontrol_type = SND_SOC_TPLG_TYPE_MIXER;  /* volume mixer */
-		template.num_kcontrols = le32_to_cpu(w->num_kcontrols);
-		template.kcontrol_news =
-			soc_tplg_dapm_widget_dmixer_create(tplg,
-			template.num_kcontrols);
-		if (!template.kcontrol_news) {
-			ret = -ENOMEM;
-			goto hdr_err;
-		}
-		break;
-	case SND_SOC_TPLG_CTL_ENUM:
-	case SND_SOC_TPLG_CTL_ENUM_VALUE:
-	case SND_SOC_TPLG_DAPM_CTL_ENUM_DOUBLE:
-	case SND_SOC_TPLG_DAPM_CTL_ENUM_VIRT:
-	case SND_SOC_TPLG_DAPM_CTL_ENUM_VALUE:
-		kcontrol_type = SND_SOC_TPLG_TYPE_ENUM;	/* enumerated mixer */
-		template.num_kcontrols = le32_to_cpu(w->num_kcontrols);
-		template.kcontrol_news =
-			soc_tplg_dapm_widget_denum_create(tplg,
-			template.num_kcontrols);
-		if (!template.kcontrol_news) {
-			ret = -ENOMEM;
-			goto hdr_err;
-		}
-		break;
-	case SND_SOC_TPLG_CTL_BYTES:
-		kcontrol_type = SND_SOC_TPLG_TYPE_BYTES; /* bytes control */
-		template.num_kcontrols = le32_to_cpu(w->num_kcontrols);
-		template.kcontrol_news =
-			soc_tplg_dapm_widget_dbytes_create(tplg,
-				template.num_kcontrols);
-		if (!template.kcontrol_news) {
-			ret = -ENOMEM;
+	template.num_kcontrols = le32_to_cpu(w->num_kcontrols);
+	kc = devm_kcalloc(tplg->dev, le32_to_cpu(w->num_kcontrols), sizeof(*kc), GFP_KERNEL);
+	if (!kc)
+		goto err;
+
+	kcontrol_type = devm_kcalloc(tplg->dev, le32_to_cpu(w->num_kcontrols), sizeof(unsigned int),
+				     GFP_KERNEL);
+	if (!kcontrol_type)
+		goto err;
+
+	for (i = 0; i < w->num_kcontrols; i++) {
+		control_hdr = (struct snd_soc_tplg_ctl_hdr *)tplg->pos;
+		switch (le32_to_cpu(control_hdr->ops.info)) {
+		case SND_SOC_TPLG_CTL_VOLSW:
+		case SND_SOC_TPLG_CTL_STROBE:
+		case SND_SOC_TPLG_CTL_VOLSW_SX:
+		case SND_SOC_TPLG_CTL_VOLSW_XR_SX:
+		case SND_SOC_TPLG_CTL_RANGE:
+		case SND_SOC_TPLG_DAPM_CTL_VOLSW:
+			/* volume mixer */
+			kc[i].index = mixer_count;
+			kcontrol_type[i] = SND_SOC_TPLG_TYPE_MIXER;
+			mixer_count++;
+			ret = soc_tplg_dapm_widget_dmixer_create(tplg, &kc[i]);
+			if (ret < 0)
+				goto hdr_err;
+			break;
+		case SND_SOC_TPLG_CTL_ENUM:
+		case SND_SOC_TPLG_CTL_ENUM_VALUE:
+		case SND_SOC_TPLG_DAPM_CTL_ENUM_DOUBLE:
+		case SND_SOC_TPLG_DAPM_CTL_ENUM_VIRT:
+		case SND_SOC_TPLG_DAPM_CTL_ENUM_VALUE:
+			/* enumerated mixer */
+			kc[i].index = enum_count;
+			kcontrol_type[i] = SND_SOC_TPLG_TYPE_ENUM;
+			enum_count++;
+			ret = soc_tplg_dapm_widget_denum_create(tplg, &kc[i]);
+			if (ret < 0)
+				goto hdr_err;
+			break;
+		case SND_SOC_TPLG_CTL_BYTES:
+			/* bytes control */
+			kc[i].index = bytes_count;
+			kcontrol_type[i] = SND_SOC_TPLG_TYPE_BYTES;
+			bytes_count++;
+			ret = soc_tplg_dapm_widget_dbytes_create(tplg, &kc[i]);
+			if (ret < 0)
+				goto hdr_err;
+			break;
+		default:
+			dev_err(tplg->dev, "ASoC: invalid widget control type %d:%d:%d\n",
+				control_hdr->ops.get, control_hdr->ops.put,
+				le32_to_cpu(control_hdr->ops.info));
+			ret = -EINVAL;
 			goto hdr_err;
 		}
-		break;
-	default:
-		dev_err(tplg->dev, "ASoC: invalid widget control type %d:%d:%d\n",
-			control_hdr->ops.get, control_hdr->ops.put,
-			le32_to_cpu(control_hdr->ops.info));
-		ret = -EINVAL;
-		goto hdr_err;
 	}
 
+	template.kcontrol_news = kc;
+
 widget:
 	ret = soc_tplg_widget_load(tplg, &template, w);
 	if (ret < 0)
@@ -1595,6 +1575,7 @@ static int soc_tplg_dapm_widget_create(struct soc_tplg *tplg,
 	snd_soc_dapm_free_widget(widget);
 hdr_err:
 	kfree(template.sname);
+	kfree(kc);
 err:
 	kfree(template.name);
 	return ret;
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 59abcfc9bd55..92d346bbd357 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1063,6 +1063,7 @@ static int sof_control_load_volume(struct snd_soc_component *scomp,
 	scontrol->min_volume_step = le32_to_cpu(mc->min);
 	scontrol->max_volume_step = le32_to_cpu(mc->max);
 	scontrol->num_channels = le32_to_cpu(mc->num_channels);
+	scontrol->control_data->index = kc->index;
 
 	/* set cmd for mixer control */
 	if (le32_to_cpu(mc->max) == 1) {
@@ -1140,7 +1141,7 @@ static int sof_control_load_enum(struct snd_soc_component *scomp,
 
 	scontrol->comp_id = sdev->next_comp_id;
 	scontrol->num_channels = le32_to_cpu(ec->num_channels);
-
+	scontrol->control_data->index = kc->index;
 	scontrol->cmd = SOF_CTRL_CMD_ENUM;
 
 	dev_dbg(scomp->dev, "tplg: load kcontrol index %d chans %d comp_id %d\n",
@@ -1188,6 +1189,7 @@ static int sof_control_load_bytes(struct snd_soc_component *scomp,
 
 	scontrol->comp_id = sdev->next_comp_id;
 	scontrol->cmd = SOF_CTRL_CMD_BINARY;
+	scontrol->control_data->index = kc->index;
 
 	dev_dbg(scomp->dev, "tplg: load kcontrol index %d chans %d\n",
 		scontrol->comp_id, scontrol->num_channels);
@@ -2133,7 +2135,7 @@ static int sof_get_control_data(struct snd_soc_component *scomp,
 	for (i = 0; i < widget->num_kcontrols; i++) {
 		kc = &widget->kcontrol_news[i];
 
-		switch (widget->dobj.widget.kcontrol_type) {
+		switch (widget->dobj.widget.kcontrol_type[i]) {
 		case SND_SOC_TPLG_TYPE_MIXER:
 			sm = (struct soc_mixer_control *)kc->private_value;
 			wdata[i].control = sm->dobj.private;
@@ -2147,8 +2149,8 @@ static int sof_get_control_data(struct snd_soc_component *scomp,
 			wdata[i].control = se->dobj.private;
 			break;
 		default:
-			dev_err(scomp->dev, "error: unknown kcontrol type %d in widget %s\n",
-				widget->dobj.widget.kcontrol_type,
+			dev_err(scomp->dev, "error: unknown kcontrol type %u in widget %s\n",
+				widget->dobj.widget.kcontrol_type[i],
 				widget->name);
 			return -EINVAL;
 		}
@@ -2164,7 +2166,8 @@ static int sof_get_control_data(struct snd_soc_component *scomp,
 			return -EINVAL;
 
 		/* make sure data is valid - data can be updated at runtime */
-		if (wdata[i].pdata->magic != SOF_ABI_MAGIC)
+		if (widget->dobj.widget.kcontrol_type[i] == SND_SOC_TPLG_TYPE_BYTES &&
+		    wdata[i].pdata->magic != SOF_ABI_MAGIC)
 			return -EINVAL;
 
 		*size += wdata[i].pdata->size;
@@ -2605,7 +2608,7 @@ static int sof_widget_unload(struct snd_soc_component *scomp,
 	}
 	for (i = 0; i < widget->num_kcontrols; i++) {
 		kc = &widget->kcontrol_news[i];
-		switch (dobj->widget.kcontrol_type) {
+		switch (widget->dobj.widget.kcontrol_type[i]) {
 		case SND_SOC_TPLG_TYPE_MIXER:
 			sm = (struct soc_mixer_control *)kc->private_value;
 			scontrol = sm->dobj.private;
-- 
2.24.1

