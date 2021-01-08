Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3D12EF154
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jan 2021 12:34:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3256616D2;
	Fri,  8 Jan 2021 12:34:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3256616D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610105698;
	bh=ZtoZkyAeEjYwpv7ptYeFoyzW3GZdwxoxeSxlHQK3eFw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tk4swl8gp0ude5kLG5nGc927mHsQrA6sQA5QkcFDD20nGuaBfco6OslXB+8wVKxFx
	 eSRSzaXP5dV+dfy/S2ONt6+HfXaIJw57my4QgI8pNKvzJdqC5IuImwizr3yWQu5tBP
	 /i+RccRafzbO5oNdJZJ4bS9jBL7YZI8FXCeHXIqc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84133F804C3;
	Fri,  8 Jan 2021 12:32:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77AE3F8026F; Fri,  8 Jan 2021 12:32:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CB96F80165
 for <alsa-devel@alsa-project.org>; Fri,  8 Jan 2021 12:32:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CB96F80165
IronPort-SDR: CrGGm2OLN4JtzxYONTIsasnsFpXOpCVkdMJSkDhvprbHerFX/hv8InrSD1vQKf1I4W3mkKs2Kt
 dAua7wkJFMkg==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="175002634"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; d="scan'208";a="175002634"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2021 03:32:25 -0800
IronPort-SDR: 6UypKFSkESfb7RpTCyjP/xcUuvyt4jll0Yfi7JP9k1t7CFE1HogGtXgUUQqI4lLWmjiHXoA6R/
 ZfJPvXYfBTtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; d="scan'208";a="362310516"
Received: from kekkonen.fi.intel.com ([10.237.72.68])
 by orsmga002.jf.intel.com with ESMTP; 08 Jan 2021 03:32:24 -0800
From: Jaska Uimonen <jaska.uimonen@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 2/3] ASoC: soc-topology: enable use of multiple control
 types
Date: Fri,  8 Jan 2021 13:23:54 +0200
Message-Id: <20210108112355.2053917-3-jaska.uimonen@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20210108112355.2053917-1-jaska.uimonen@linux.intel.com>
References: <20210108112355.2053917-1-jaska.uimonen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jaska Uimonen <jaska.uimonen@linux.intel.com>
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

Modify the kcontrol creation and delete functions to operate based on
individual kcontrol type. Previously all kcontrols in a widget we're
assumed to have the same type.

Signed-off-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>
---
 sound/soc/soc-topology.c | 462 ++++++++++++++++++---------------------
 1 file changed, 218 insertions(+), 244 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index eb2633dd6454..096474c9ae51 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1194,249 +1194,219 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
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
+	kc->kcontrol_type = SND_SOC_TPLG_TYPE_MIXER;
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
+	kc->kcontrol_type = SND_SOC_TPLG_TYPE_ENUM;
 
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
-
-		sbe = devm_kzalloc(tplg->dev, sizeof(*sbe), GFP_KERNEL);
-		if (sbe == NULL)
-			goto err_sbe;
+	/* validate kcontrol */
+	if (strnlen(be->hdr.name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
+	    SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
+		return -EINVAL;
 
-		tplg->pos += (sizeof(struct snd_soc_tplg_bytes_control) +
-			      le32_to_cpu(be->priv.size));
+	sbe = devm_kzalloc(tplg->dev, sizeof(*sbe), GFP_KERNEL);
+	if (!sbe)
+		return -ENOMEM;
 
-		dev_dbg(tplg->dev,
-			"ASoC: adding bytes kcontrol %s with access 0x%x\n",
-			be->hdr.name, be->hdr.access);
+	tplg->pos += (sizeof(struct snd_soc_tplg_bytes_control) +
+		      le32_to_cpu(be->priv.size));
 
-		kc[i].private_value = (long)sbe;
-		kc[i].name = devm_kstrdup(tplg->dev, be->hdr.name, GFP_KERNEL);
-		if (kc[i].name == NULL)
-			goto err_sbe;
-		kc[i].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-		kc[i].access = le32_to_cpu(be->hdr.access);
+	dev_dbg(tplg->dev,
+		"ASoC: adding bytes kcontrol %s with access 0x%x\n",
+		be->hdr.name, be->hdr.access);
 
-		sbe->max = le32_to_cpu(be->max);
-		INIT_LIST_HEAD(&sbe->dobj.list);
+	kc->private_value = (long)sbe;
+	kc->name = devm_kstrdup(tplg->dev, be->hdr.name, GFP_KERNEL);
+	if (!kc->name)
+		return -ENOMEM;
+	kc->iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	kc->access = le32_to_cpu(be->hdr.access);
+	kc->kcontrol_type = SND_SOC_TPLG_TYPE_BYTES;
 
-		/* map standard io handlers and check for external handlers */
-		err = soc_tplg_kcontrol_bind_io(&be->hdr, &kc[i], tplg);
-		if (err) {
-			soc_control_err(tplg, &be->hdr, be->hdr.name);
-			goto err_sbe;
-		}
+	sbe->max = le32_to_cpu(be->max);
+	INIT_LIST_HEAD(&sbe->dobj.list);
 
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
@@ -1446,8 +1416,12 @@ static int soc_tplg_dapm_widget_create(struct soc_tplg *tplg,
 	struct snd_soc_dapm_widget template, *widget;
 	struct snd_soc_tplg_ctl_hdr *control_hdr;
 	struct snd_soc_card *card = tplg->comp->card;
-	unsigned int kcontrol_type;
+	struct snd_kcontrol_new *kc;
+	int mixer_count = 0;
+	int bytes_count = 0;
+	int enum_count = 0;
 	int ret = 0;
+	int i;
 
 	if (strnlen(w->name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
 		SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
@@ -1490,7 +1464,6 @@ static int soc_tplg_dapm_widget_create(struct soc_tplg *tplg,
 		 le32_to_cpu(w->priv.size));
 
 	if (w->num_kcontrols == 0) {
-		kcontrol_type = 0;
 		template.num_kcontrols = 0;
 		goto widget;
 	}
@@ -1499,57 +1472,58 @@ static int soc_tplg_dapm_widget_create(struct soc_tplg *tplg,
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
+	kc = devm_kcalloc(tplg->dev, w->num_kcontrols, sizeof(*kc), GFP_KERNEL);
+	if (!kc)
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
+			enum_count++;
+			ret = soc_tplg_dapm_widget_denum_create(tplg, &kc[i]);
+			if (ret < 0)
+				goto hdr_err;
+			break;
+		case SND_SOC_TPLG_CTL_BYTES:
+			/* bytes control */
+			kc[i].index = bytes_count;
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
@@ -1567,7 +1541,6 @@ static int soc_tplg_dapm_widget_create(struct soc_tplg *tplg,
 	}
 
 	widget->dobj.type = SND_SOC_DOBJ_WIDGET;
-	widget->dobj.widget.kcontrol_type = kcontrol_type;
 	widget->dobj.ops = tplg->ops;
 	widget->dobj.index = tplg->index;
 	list_add(&widget->dobj.list, &tplg->comp->dobj_list);
@@ -1586,6 +1559,7 @@ static int soc_tplg_dapm_widget_create(struct soc_tplg *tplg,
 	snd_soc_dapm_free_widget(widget);
 hdr_err:
 	kfree(template.sname);
+	kfree(kc);
 err:
 	kfree(template.name);
 	return ret;
-- 
2.24.1

