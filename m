Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8354EECC6
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Apr 2022 14:03:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 043EC1A9A;
	Fri,  1 Apr 2022 14:02:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 043EC1A9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648814615;
	bh=bTqlN+kiraUXiYs4sXeMyi+zT47TUeeMb3O+bOgUBc4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FJeCuGSQyINshlkgzjBccoLSAm+tG18ZFdOHGMAclGu22OjR1Gg5Jxt4/0Z+KJIlI
	 YXDB6MvuajufrQaMQhcEIQq8o9l58agL2eVjBWCqghxUSLmS/ACAIA0Cpmewqf469D
	 JOg1r/Wt8fyiBHBkVHoH0kBNyjzThyWQl3yvBjMQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5D08F8051C;
	Fri,  1 Apr 2022 14:02:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2F37F8051C; Fri,  1 Apr 2022 14:02:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C76ADF8047D
 for <alsa-devel@alsa-project.org>; Fri,  1 Apr 2022 14:02:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C76ADF8047D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RApSgfne"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648814539; x=1680350539;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bTqlN+kiraUXiYs4sXeMyi+zT47TUeeMb3O+bOgUBc4=;
 b=RApSgfne5RKmqTWxogLSDc7K53/mOrVrIPLhiptBygFLNOjfPBu/m086
 OGENyn1zIwY9qup6XffS6DjayhGC011bKwUE7N5Rrz/WqJwwtEJYUTgFe
 Ggr7Amu0O7fh8bbiJVTwVf046YurmLyMJZhLqBGbOw5hQMKWmBnT3gEOf
 fYFN0xQ5/ZN+w7ndmCbCgKv4NVVB0X3Im6N1I8bHvhXAOD2oyC9wKCsO2
 H8LLOcENQ9e5Gg5H6feVf5IB+F7dZJB914MVC98gvG6b+79u7/nwwLdkL
 0923uuTfRMPkgmn/25ZAC5K7vK2KFI7JxAbZiF4szgAVyyNlY7bCI+Htx g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="258945844"
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="258945844"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 05:02:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="567431998"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by orsmga008.jf.intel.com with ESMTP; 01 Apr 2022 05:02:09 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/6] ASoC: topology: Remove unnecessary looping
Date: Fri,  1 Apr 2022 14:01:56 +0200
Message-Id: <20220401120200.4047867-3-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220401120200.4047867-1-amadeuszx.slawinski@linux.intel.com>
References: <20220401120200.4047867-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
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

Functions creating kcontrols as written allow for creation of multiple
kcontrols at the same time, but in practice they are called for each
kcontrol individually. Remove unnecessary loop as code always loops once
anyway. This reduces intendation level allowing for some code to be put
on one line instead of multiple lines.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 415 ++++++++++++++++++---------------------
 1 file changed, 192 insertions(+), 223 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index bd2155bb6532..f5446aac8ac6 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -676,175 +676,156 @@ static int soc_tplg_create_tlv(struct soc_tplg *tplg,
 	return 0;
 }
 
-static int soc_tplg_dbytes_create(struct soc_tplg *tplg, unsigned int count,
-	size_t size)
+static int soc_tplg_dbytes_create(struct soc_tplg *tplg, size_t size)
 {
 	struct snd_soc_tplg_bytes_control *be;
 	struct soc_bytes_ext *sbe;
 	struct snd_kcontrol_new kc;
-	int i;
-	int err = 0;
+	int ret = 0;
 
 	if (soc_tplg_check_elem_count(tplg,
 				      sizeof(struct snd_soc_tplg_bytes_control),
-				      count, size, "mixer bytes"))
+				      1, size, "mixer bytes"))
 		return -EINVAL;
 
-	for (i = 0; i < count; i++) {
-		be = (struct snd_soc_tplg_bytes_control *)tplg->pos;
+	be = (struct snd_soc_tplg_bytes_control *)tplg->pos;
 
-		/* validate kcontrol */
-		if (strnlen(be->hdr.name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
-			SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
-			return -EINVAL;
+	/* validate kcontrol */
+	if (strnlen(be->hdr.name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
+		SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
+		return -EINVAL;
 
-		sbe = devm_kzalloc(tplg->dev, sizeof(*sbe), GFP_KERNEL);
-		if (sbe == NULL)
-			return -ENOMEM;
+	sbe = devm_kzalloc(tplg->dev, sizeof(*sbe), GFP_KERNEL);
+	if (sbe == NULL)
+		return -ENOMEM;
 
-		tplg->pos += (sizeof(struct snd_soc_tplg_bytes_control) +
-			      le32_to_cpu(be->priv.size));
+	tplg->pos += (sizeof(struct snd_soc_tplg_bytes_control) +
+		      le32_to_cpu(be->priv.size));
 
-		dev_dbg(tplg->dev,
-			"ASoC: adding bytes kcontrol %s with access 0x%x\n",
-			be->hdr.name, be->hdr.access);
-
-		memset(&kc, 0, sizeof(kc));
-		kc.name = be->hdr.name;
-		kc.private_value = (long)sbe;
-		kc.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-		kc.access = le32_to_cpu(be->hdr.access);
-
-		sbe->max = le32_to_cpu(be->max);
-		sbe->dobj.type = SND_SOC_DOBJ_BYTES;
-		sbe->dobj.ops = tplg->ops;
-		INIT_LIST_HEAD(&sbe->dobj.list);
-
-		/* map io handlers */
-		err = soc_tplg_kcontrol_bind_io(&be->hdr, &kc, tplg);
-		if (err) {
-			soc_control_err(tplg, &be->hdr, be->hdr.name);
-			break;
-		}
+	dev_dbg(tplg->dev,
+		"ASoC: adding bytes kcontrol %s with access 0x%x\n",
+		be->hdr.name, be->hdr.access);
 
-		/* pass control to driver for optional further init */
-		err = soc_tplg_init_kcontrol(tplg, &kc,
-			(struct snd_soc_tplg_ctl_hdr *)be);
-		if (err < 0) {
-			dev_err(tplg->dev, "ASoC: failed to init %s\n",
-				be->hdr.name);
-			break;
-		}
+	memset(&kc, 0, sizeof(kc));
+	kc.name = be->hdr.name;
+	kc.private_value = (long)sbe;
+	kc.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	kc.access = le32_to_cpu(be->hdr.access);
 
-		/* register control here */
-		err = soc_tplg_add_kcontrol(tplg, &kc,
-			&sbe->dobj.control.kcontrol);
-		if (err < 0) {
-			dev_err(tplg->dev, "ASoC: failed to add %s\n",
-				be->hdr.name);
-			break;
-		}
+	sbe->max = le32_to_cpu(be->max);
+	sbe->dobj.type = SND_SOC_DOBJ_BYTES;
+	sbe->dobj.ops = tplg->ops;
+	INIT_LIST_HEAD(&sbe->dobj.list);
 
-		list_add(&sbe->dobj.list, &tplg->comp->dobj_list);
+	/* map io handlers */
+	ret = soc_tplg_kcontrol_bind_io(&be->hdr, &kc, tplg);
+	if (ret) {
+		soc_control_err(tplg, &be->hdr, be->hdr.name);
+		goto err;
 	}
-	return err;
 
+	/* pass control to driver for optional further init */
+	ret = soc_tplg_init_kcontrol(tplg, &kc, (struct snd_soc_tplg_ctl_hdr *)be);
+	if (ret < 0) {
+		dev_err(tplg->dev, "ASoC: failed to init %s\n", be->hdr.name);
+		goto err;
+	}
+
+	/* register control here */
+	ret = soc_tplg_add_kcontrol(tplg, &kc, &sbe->dobj.control.kcontrol);
+	if (ret < 0) {
+		dev_err(tplg->dev, "ASoC: failed to add %s\n", be->hdr.name);
+		goto err;
+	}
+
+	list_add(&sbe->dobj.list, &tplg->comp->dobj_list);
+
+err:
+	return ret;
 }
 
-static int soc_tplg_dmixer_create(struct soc_tplg *tplg, unsigned int count,
-	size_t size)
+static int soc_tplg_dmixer_create(struct soc_tplg *tplg, size_t size)
 {
 	struct snd_soc_tplg_mixer_control *mc;
 	struct soc_mixer_control *sm;
 	struct snd_kcontrol_new kc;
-	int i;
-	int err = 0;
+	int ret = 0;
 
 	if (soc_tplg_check_elem_count(tplg,
 				      sizeof(struct snd_soc_tplg_mixer_control),
-				      count, size, "mixers"))
+				      1, size, "mixers"))
 		return -EINVAL;
 
-	for (i = 0; i < count; i++) {
-		mc = (struct snd_soc_tplg_mixer_control *)tplg->pos;
+	mc = (struct snd_soc_tplg_mixer_control *)tplg->pos;
 
-		/* validate kcontrol */
-		if (strnlen(mc->hdr.name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
-			SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
-			return -EINVAL;
+	/* validate kcontrol */
+	if (strnlen(mc->hdr.name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
+		SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
+		return -EINVAL;
 
-		sm = devm_kzalloc(tplg->dev, sizeof(*sm), GFP_KERNEL);
-		if (sm == NULL)
-			return -ENOMEM;
-		tplg->pos += (sizeof(struct snd_soc_tplg_mixer_control) +
-			      le32_to_cpu(mc->priv.size));
+	sm = devm_kzalloc(tplg->dev, sizeof(*sm), GFP_KERNEL);
+	if (sm == NULL)
+		return -ENOMEM;
+	tplg->pos += (sizeof(struct snd_soc_tplg_mixer_control) +
+		      le32_to_cpu(mc->priv.size));
 
-		dev_dbg(tplg->dev,
-			"ASoC: adding mixer kcontrol %s with access 0x%x\n",
-			mc->hdr.name, mc->hdr.access);
-
-		memset(&kc, 0, sizeof(kc));
-		kc.name = mc->hdr.name;
-		kc.private_value = (long)sm;
-		kc.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-		kc.access = le32_to_cpu(mc->hdr.access);
-
-		/* we only support FL/FR channel mapping atm */
-		sm->reg = tplc_chan_get_reg(tplg, mc->channel,
-			SNDRV_CHMAP_FL);
-		sm->rreg = tplc_chan_get_reg(tplg, mc->channel,
-			SNDRV_CHMAP_FR);
-		sm->shift = tplc_chan_get_shift(tplg, mc->channel,
-			SNDRV_CHMAP_FL);
-		sm->rshift = tplc_chan_get_shift(tplg, mc->channel,
-			SNDRV_CHMAP_FR);
-
-		sm->max = le32_to_cpu(mc->max);
-		sm->min = le32_to_cpu(mc->min);
-		sm->invert = le32_to_cpu(mc->invert);
-		sm->platform_max = le32_to_cpu(mc->platform_max);
-		sm->dobj.index = tplg->index;
-		sm->dobj.ops = tplg->ops;
-		sm->dobj.type = SND_SOC_DOBJ_MIXER;
-		INIT_LIST_HEAD(&sm->dobj.list);
-
-		/* map io handlers */
-		err = soc_tplg_kcontrol_bind_io(&mc->hdr, &kc, tplg);
-		if (err) {
-			soc_control_err(tplg, &mc->hdr, mc->hdr.name);
-			break;
-		}
+	dev_dbg(tplg->dev,
+		"ASoC: adding mixer kcontrol %s with access 0x%x\n",
+		mc->hdr.name, mc->hdr.access);
 
-		/* create any TLV data */
-		err = soc_tplg_create_tlv(tplg, &kc, &mc->hdr);
-		if (err < 0) {
-			dev_err(tplg->dev, "ASoC: failed to create TLV %s\n",
-				mc->hdr.name);
-			break;
-		}
+	memset(&kc, 0, sizeof(kc));
+	kc.name = mc->hdr.name;
+	kc.private_value = (long)sm;
+	kc.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	kc.access = le32_to_cpu(mc->hdr.access);
 
-		/* pass control to driver for optional further init */
-		err = soc_tplg_init_kcontrol(tplg, &kc,
-			(struct snd_soc_tplg_ctl_hdr *) mc);
-		if (err < 0) {
-			dev_err(tplg->dev, "ASoC: failed to init %s\n",
-				mc->hdr.name);
-			break;
-		}
+	/* we only support FL/FR channel mapping atm */
+	sm->reg = tplc_chan_get_reg(tplg, mc->channel, SNDRV_CHMAP_FL);
+	sm->rreg = tplc_chan_get_reg(tplg, mc->channel, SNDRV_CHMAP_FR);
+	sm->shift = tplc_chan_get_shift(tplg, mc->channel, SNDRV_CHMAP_FL);
+	sm->rshift = tplc_chan_get_shift(tplg, mc->channel, SNDRV_CHMAP_FR);
 
-		/* register control here */
-		err = soc_tplg_add_kcontrol(tplg, &kc,
-			&sm->dobj.control.kcontrol);
-		if (err < 0) {
-			dev_err(tplg->dev, "ASoC: failed to add %s\n",
-				mc->hdr.name);
-			break;
-		}
+	sm->max = le32_to_cpu(mc->max);
+	sm->min = le32_to_cpu(mc->min);
+	sm->invert = le32_to_cpu(mc->invert);
+	sm->platform_max = le32_to_cpu(mc->platform_max);
+	sm->dobj.index = tplg->index;
+	sm->dobj.ops = tplg->ops;
+	sm->dobj.type = SND_SOC_DOBJ_MIXER;
+	INIT_LIST_HEAD(&sm->dobj.list);
+
+	/* map io handlers */
+	ret = soc_tplg_kcontrol_bind_io(&mc->hdr, &kc, tplg);
+	if (ret) {
+		soc_control_err(tplg, &mc->hdr, mc->hdr.name);
+		goto err;
+	}
 
-		list_add(&sm->dobj.list, &tplg->comp->dobj_list);
+	/* create any TLV data */
+	ret = soc_tplg_create_tlv(tplg, &kc, &mc->hdr);
+	if (ret < 0) {
+		dev_err(tplg->dev, "ASoC: failed to create TLV %s\n", mc->hdr.name);
+		goto err;
 	}
 
-	return err;
+	/* pass control to driver for optional further init */
+	ret = soc_tplg_init_kcontrol(tplg, &kc, (struct snd_soc_tplg_ctl_hdr *)mc);
+	if (ret < 0) {
+		dev_err(tplg->dev, "ASoC: failed to init %s\n", mc->hdr.name);
+		goto err;
+	}
+
+	/* register control here */
+	ret = soc_tplg_add_kcontrol(tplg, &kc, &sm->dobj.control.kcontrol);
+	if (ret < 0) {
+		dev_err(tplg->dev, "ASoC: failed to add %s\n", mc->hdr.name);
+		goto err;
+	}
+
+	list_add(&sm->dobj.list, &tplg->comp->dobj_list);
+
+err:
+	return ret;
 }
 
 static int soc_tplg_denum_create_texts(struct soc_tplg *tplg, struct soc_enum *se,
@@ -911,117 +892,108 @@ static int soc_tplg_denum_create_values(struct soc_tplg *tplg, struct soc_enum *
 	return 0;
 }
 
-static int soc_tplg_denum_create(struct soc_tplg *tplg, unsigned int count,
-	size_t size)
+static int soc_tplg_denum_create(struct soc_tplg *tplg, size_t size)
 {
 	struct snd_soc_tplg_enum_control *ec;
 	struct soc_enum *se;
 	struct snd_kcontrol_new kc;
-	int i;
-	int err = 0;
+	int ret = 0;
 
 	if (soc_tplg_check_elem_count(tplg,
 				      sizeof(struct snd_soc_tplg_enum_control),
-				      count, size, "enums"))
+				      1, size, "enums"))
 		return -EINVAL;
 
-	for (i = 0; i < count; i++) {
-		ec = (struct snd_soc_tplg_enum_control *)tplg->pos;
+	ec = (struct snd_soc_tplg_enum_control *)tplg->pos;
 
-		/* validate kcontrol */
-		if (strnlen(ec->hdr.name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
-			SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
-			return -EINVAL;
+	/* validate kcontrol */
+	if (strnlen(ec->hdr.name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
+		SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
+		return -EINVAL;
 
-		se = devm_kzalloc(tplg->dev, (sizeof(*se)), GFP_KERNEL);
-		if (se == NULL)
-			return -ENOMEM;
+	se = devm_kzalloc(tplg->dev, (sizeof(*se)), GFP_KERNEL);
+	if (se == NULL)
+		return -ENOMEM;
 
-		tplg->pos += (sizeof(struct snd_soc_tplg_enum_control) +
-			      le32_to_cpu(ec->priv.size));
+	tplg->pos += (sizeof(struct snd_soc_tplg_enum_control) +
+		      le32_to_cpu(ec->priv.size));
 
-		dev_dbg(tplg->dev, "ASoC: adding enum kcontrol %s size %d\n",
-			ec->hdr.name, ec->items);
+	dev_dbg(tplg->dev, "ASoC: adding enum kcontrol %s size %d\n",
+		ec->hdr.name, ec->items);
 
-		memset(&kc, 0, sizeof(kc));
-		kc.name = ec->hdr.name;
-		kc.private_value = (long)se;
-		kc.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-		kc.access = le32_to_cpu(ec->hdr.access);
+	memset(&kc, 0, sizeof(kc));
+	kc.name = ec->hdr.name;
+	kc.private_value = (long)se;
+	kc.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	kc.access = le32_to_cpu(ec->hdr.access);
 
-		se->reg = tplc_chan_get_reg(tplg, ec->channel, SNDRV_CHMAP_FL);
-		se->shift_l = tplc_chan_get_shift(tplg, ec->channel,
-			SNDRV_CHMAP_FL);
-		se->shift_r = tplc_chan_get_shift(tplg, ec->channel,
-			SNDRV_CHMAP_FL);
+	se->reg = tplc_chan_get_reg(tplg, ec->channel, SNDRV_CHMAP_FL);
+	se->shift_l = tplc_chan_get_shift(tplg, ec->channel,
+		SNDRV_CHMAP_FL);
+	se->shift_r = tplc_chan_get_shift(tplg, ec->channel,
+		SNDRV_CHMAP_FL);
 
-		se->mask = le32_to_cpu(ec->mask);
-		se->dobj.index = tplg->index;
-		se->dobj.type = SND_SOC_DOBJ_ENUM;
-		se->dobj.ops = tplg->ops;
-		INIT_LIST_HEAD(&se->dobj.list);
+	se->mask = le32_to_cpu(ec->mask);
+	se->dobj.index = tplg->index;
+	se->dobj.type = SND_SOC_DOBJ_ENUM;
+	se->dobj.ops = tplg->ops;
+	INIT_LIST_HEAD(&se->dobj.list);
 
-		switch (le32_to_cpu(ec->hdr.ops.info)) {
-		case SND_SOC_TPLG_DAPM_CTL_ENUM_VALUE:
-		case SND_SOC_TPLG_CTL_ENUM_VALUE:
-			err = soc_tplg_denum_create_values(tplg, se, ec);
-			if (err < 0) {
-				dev_err(tplg->dev,
-					"ASoC: could not create values for %s\n",
-					ec->hdr.name);
-				goto err_denum;
-			}
-			fallthrough;
-		case SND_SOC_TPLG_CTL_ENUM:
-		case SND_SOC_TPLG_DAPM_CTL_ENUM_DOUBLE:
-		case SND_SOC_TPLG_DAPM_CTL_ENUM_VIRT:
-			err = soc_tplg_denum_create_texts(tplg, se, ec);
-			if (err < 0) {
-				dev_err(tplg->dev,
-					"ASoC: could not create texts for %s\n",
-					ec->hdr.name);
-				goto err_denum;
-			}
-			break;
-		default:
-			err = -EINVAL;
+	switch (le32_to_cpu(ec->hdr.ops.info)) {
+	case SND_SOC_TPLG_DAPM_CTL_ENUM_VALUE:
+	case SND_SOC_TPLG_CTL_ENUM_VALUE:
+		ret = soc_tplg_denum_create_values(tplg, se, ec);
+		if (ret < 0) {
 			dev_err(tplg->dev,
-				"ASoC: invalid enum control type %d for %s\n",
-				ec->hdr.ops.info, ec->hdr.name);
-			goto err_denum;
-		}
-
-		/* map io handlers */
-		err = soc_tplg_kcontrol_bind_io(&ec->hdr, &kc, tplg);
-		if (err) {
-			soc_control_err(tplg, &ec->hdr, ec->hdr.name);
-			goto err_denum;
-		}
-
-		/* pass control to driver for optional further init */
-		err = soc_tplg_init_kcontrol(tplg, &kc,
-			(struct snd_soc_tplg_ctl_hdr *) ec);
-		if (err < 0) {
-			dev_err(tplg->dev, "ASoC: failed to init %s\n",
+				"ASoC: could not create values for %s\n",
 				ec->hdr.name);
-			goto err_denum;
+			goto err;
 		}
-
-		/* register control here */
-		err = soc_tplg_add_kcontrol(tplg,
-					    &kc, &se->dobj.control.kcontrol);
-		if (err < 0) {
-			dev_err(tplg->dev, "ASoC: could not add kcontrol %s\n",
+		fallthrough;
+	case SND_SOC_TPLG_CTL_ENUM:
+	case SND_SOC_TPLG_DAPM_CTL_ENUM_DOUBLE:
+	case SND_SOC_TPLG_DAPM_CTL_ENUM_VIRT:
+		ret = soc_tplg_denum_create_texts(tplg, se, ec);
+		if (ret < 0) {
+			dev_err(tplg->dev,
+				"ASoC: could not create texts for %s\n",
 				ec->hdr.name);
-			goto err_denum;
+			goto err;
 		}
+		break;
+	default:
+		ret = -EINVAL;
+		dev_err(tplg->dev,
+			"ASoC: invalid enum control type %d for %s\n",
+			ec->hdr.ops.info, ec->hdr.name);
+		goto err;
+	}
 
-		list_add(&se->dobj.list, &tplg->comp->dobj_list);
+	/* map io handlers */
+	ret = soc_tplg_kcontrol_bind_io(&ec->hdr, &kc, tplg);
+	if (ret) {
+		soc_control_err(tplg, &ec->hdr, ec->hdr.name);
+		goto err;
 	}
-	return 0;
 
-err_denum:
-	return err;
+	/* pass control to driver for optional further init */
+	ret = soc_tplg_init_kcontrol(tplg, &kc, (struct snd_soc_tplg_ctl_hdr *)ec);
+	if (ret < 0) {
+		dev_err(tplg->dev, "ASoC: failed to init %s\n", ec->hdr.name);
+		goto err;
+	}
+
+	/* register control here */
+	ret = soc_tplg_add_kcontrol(tplg, &kc, &se->dobj.control.kcontrol);
+	if (ret < 0) {
+		dev_err(tplg->dev, "ASoC: could not add kcontrol %s\n", ec->hdr.name);
+		goto err;
+	}
+
+	list_add(&se->dobj.list, &tplg->comp->dobj_list);
+
+err:
+	return ret;
 }
 
 static int soc_tplg_kcontrol_elems_load(struct soc_tplg *tplg,
@@ -1049,20 +1021,17 @@ static int soc_tplg_kcontrol_elems_load(struct soc_tplg *tplg,
 		case SND_SOC_TPLG_CTL_RANGE:
 		case SND_SOC_TPLG_DAPM_CTL_VOLSW:
 		case SND_SOC_TPLG_DAPM_CTL_PIN:
-			ret = soc_tplg_dmixer_create(tplg, 1,
-					le32_to_cpu(hdr->payload_size));
+			ret = soc_tplg_dmixer_create(tplg, le32_to_cpu(hdr->payload_size));
 			break;
 		case SND_SOC_TPLG_CTL_ENUM:
 		case SND_SOC_TPLG_CTL_ENUM_VALUE:
 		case SND_SOC_TPLG_DAPM_CTL_ENUM_DOUBLE:
 		case SND_SOC_TPLG_DAPM_CTL_ENUM_VIRT:
 		case SND_SOC_TPLG_DAPM_CTL_ENUM_VALUE:
-			ret = soc_tplg_denum_create(tplg, 1,
-					le32_to_cpu(hdr->payload_size));
+			ret = soc_tplg_denum_create(tplg, le32_to_cpu(hdr->payload_size));
 			break;
 		case SND_SOC_TPLG_CTL_BYTES:
-			ret = soc_tplg_dbytes_create(tplg, 1,
-					le32_to_cpu(hdr->payload_size));
+			ret = soc_tplg_dbytes_create(tplg, le32_to_cpu(hdr->payload_size));
 			break;
 		default:
 			soc_bind_err(tplg, control_hdr, i);
-- 
2.25.1

