Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E90512EAC2
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jan 2020 21:03:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C05D785D;
	Thu,  2 Jan 2020 21:02:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C05D785D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577995409;
	bh=WPvdnC8d2cnUfbxMxS4JKLhrGqzwy9Oih0//xFAUtDQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MoBhveSBJMk+pYIOCYwJTmSH1rQrk/YwVN2dThoHc5IFVguw3KJmwvhfPrm4TdF+a
	 6OIgqkVZv+EZ1McwtdIhp9UpQX9+4v7vzFfO/EL7OJCbd4dBOttBGAwIX2fu7yGY9N
	 yGZZCknMl97wWS458egCWnOwEltCQqdnYjaQSE+g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4550BF8026F;
	Thu,  2 Jan 2020 21:00:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EF4EF8020B; Thu,  2 Jan 2020 21:00:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F158F8011E
 for <alsa-devel@alsa-project.org>; Thu,  2 Jan 2020 21:00:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F158F8011E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Jan 2020 12:00:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,388,1571727600"; d="scan'208";a="252353268"
Received: from mjamatan-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.98.106])
 by fmsmga002.fm.intel.com with ESMTP; 02 Jan 2020 12:00:06 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu,  2 Jan 2020 13:59:52 -0600
Message-Id: <20200102195952.9465-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200102195952.9465-1-pierre-louis.bossart@linux.intel.com>
References: <20200102195952.9465-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 2/2] ASoC: soc-topology: fix endianness issues
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Sparse complains about a series of easy warnings, fix.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/soc-topology.c | 42 +++++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 69d6a52d0066..107ba3ed5440 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -605,9 +605,11 @@ static int soc_tplg_kcontrol_bind_io(struct snd_soc_tplg_ctl_hdr *hdr,
 		ext_ops = tplg->bytes_ext_ops;
 		num_ops = tplg->bytes_ext_ops_count;
 		for (i = 0; i < num_ops; i++) {
-			if (!sbe->put && ext_ops[i].id == be->ext_ops.put)
+			if (!sbe->put &&
+			    ext_ops[i].id == le32_to_cpu(be->ext_ops.put))
 				sbe->put = ext_ops[i].put;
-			if (!sbe->get && ext_ops[i].id == be->ext_ops.get)
+			if (!sbe->get &&
+			    ext_ops[i].id == le32_to_cpu(be->ext_ops.get))
 				sbe->get = ext_ops[i].get;
 		}
 
@@ -622,11 +624,11 @@ static int soc_tplg_kcontrol_bind_io(struct snd_soc_tplg_ctl_hdr *hdr,
 	num_ops = tplg->io_ops_count;
 	for (i = 0; i < num_ops; i++) {
 
-		if (k->put == NULL && ops[i].id == hdr->ops.put)
+		if (k->put == NULL && ops[i].id == le32_to_cpu(hdr->ops.put))
 			k->put = ops[i].put;
-		if (k->get == NULL && ops[i].id == hdr->ops.get)
+		if (k->get == NULL && ops[i].id == le32_to_cpu(hdr->ops.get))
 			k->get = ops[i].get;
-		if (k->info == NULL && ops[i].id == hdr->ops.info)
+		if (k->info == NULL && ops[i].id == le32_to_cpu(hdr->ops.info))
 			k->info = ops[i].info;
 	}
 
@@ -639,11 +641,11 @@ static int soc_tplg_kcontrol_bind_io(struct snd_soc_tplg_ctl_hdr *hdr,
 	num_ops = ARRAY_SIZE(io_ops);
 	for (i = 0; i < num_ops; i++) {
 
-		if (k->put == NULL && ops[i].id == hdr->ops.put)
+		if (k->put == NULL && ops[i].id == le32_to_cpu(hdr->ops.put))
 			k->put = ops[i].put;
-		if (k->get == NULL && ops[i].id == hdr->ops.get)
+		if (k->get == NULL && ops[i].id == le32_to_cpu(hdr->ops.get))
 			k->get = ops[i].get;
-		if (k->info == NULL && ops[i].id == hdr->ops.info)
+		if (k->info == NULL && ops[i].id == le32_to_cpu(hdr->ops.info))
 			k->info = ops[i].info;
 	}
 
@@ -932,7 +934,7 @@ static int soc_tplg_denum_create_texts(struct soc_enum *se,
 	if (se->dobj.control.dtexts == NULL)
 		return -ENOMEM;
 
-	for (i = 0; i < ec->items; i++) {
+	for (i = 0; i < le32_to_cpu(ec->items); i++) {
 
 		if (strnlen(ec->texts[i], SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
 			SNDRV_CTL_ELEM_ID_NAME_MAXLEN) {
@@ -1326,7 +1328,7 @@ static struct snd_kcontrol_new *soc_tplg_dapm_widget_dmixer_create(
 		if (kc[i].name == NULL)
 			goto err_sm;
 		kc[i].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-		kc[i].access = mc->hdr.access;
+		kc[i].access = le32_to_cpu(mc->hdr.access);
 
 		/* we only support FL/FR channel mapping atm */
 		sm->reg = tplc_chan_get_reg(tplg, mc->channel,
@@ -1338,10 +1340,10 @@ static struct snd_kcontrol_new *soc_tplg_dapm_widget_dmixer_create(
 		sm->rshift = tplc_chan_get_shift(tplg, mc->channel,
 			SNDRV_CHMAP_FR);
 
-		sm->max = mc->max;
-		sm->min = mc->min;
-		sm->invert = mc->invert;
-		sm->platform_max = mc->platform_max;
+		sm->max = le32_to_cpu(mc->max);
+		sm->min = le32_to_cpu(mc->min);
+		sm->invert = le32_to_cpu(mc->invert);
+		sm->platform_max = le32_to_cpu(mc->platform_max);
 		sm->dobj.index = tplg->index;
 		INIT_LIST_HEAD(&sm->dobj.list);
 
@@ -1402,7 +1404,7 @@ static struct snd_kcontrol_new *soc_tplg_dapm_widget_denum_create(
 			goto err_se;
 
 		tplg->pos += (sizeof(struct snd_soc_tplg_enum_control) +
-				ec->priv.size);
+			      le32_to_cpu(ec->priv.size));
 
 		dev_dbg(tplg->dev, " adding DAPM widget enum control %s\n",
 			ec->hdr.name);
@@ -1412,7 +1414,7 @@ static struct snd_kcontrol_new *soc_tplg_dapm_widget_denum_create(
 		if (kc[i].name == NULL)
 			goto err_se;
 		kc[i].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-		kc[i].access = ec->hdr.access;
+		kc[i].access = le32_to_cpu(ec->hdr.access);
 
 		/* we only support FL/FR channel mapping atm */
 		se->reg = tplc_chan_get_reg(tplg, ec->channel, SNDRV_CHMAP_FL);
@@ -1421,8 +1423,8 @@ static struct snd_kcontrol_new *soc_tplg_dapm_widget_denum_create(
 		se->shift_r = tplc_chan_get_shift(tplg, ec->channel,
 						  SNDRV_CHMAP_FR);
 
-		se->items = ec->items;
-		se->mask = ec->mask;
+		se->items = le32_to_cpu(ec->items);
+		se->mask = le32_to_cpu(ec->mask);
 		se->dobj.index = tplg->index;
 
 		switch (le32_to_cpu(ec->hdr.ops.info)) {
@@ -1524,9 +1526,9 @@ static struct snd_kcontrol_new *soc_tplg_dapm_widget_dbytes_create(
 		if (kc[i].name == NULL)
 			goto err_sbe;
 		kc[i].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-		kc[i].access = be->hdr.access;
+		kc[i].access = le32_to_cpu(be->hdr.access);
 
-		sbe->max = be->max;
+		sbe->max = le32_to_cpu(be->max);
 		INIT_LIST_HEAD(&sbe->dobj.list);
 
 		/* map standard io handlers and check for external handlers */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
