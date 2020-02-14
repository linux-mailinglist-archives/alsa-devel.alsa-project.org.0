Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6C615DD20
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 16:57:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51F65166E;
	Fri, 14 Feb 2020 16:56:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51F65166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581695857;
	bh=e3H25G5XQO3KtrzSfAg4xXylDBM51opZDxq/YyrpS9Y=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nhTE2hfsQC5cm/piMaJCJVNFFNPwwdbm88/QkHG2V3nzIFxDJjbEUw24LNhOyhNqJ
	 KhfShUSSnTSV/6EyYXsmCneV0ziEH66cX9GCxY0JkkVSGUF9fT+XX10AjOUoKqELbr
	 Qx0TfvytZZvdgLXnRmi4ebhMbT2qoXRUDPU4GN7g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F11BEF8028F;
	Fri, 14 Feb 2020 16:54:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32DADF8028E; Fri, 14 Feb 2020 16:54:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5459BF8019B
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 16:54:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5459BF8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rWwya4Ho"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EB60E24649;
 Fri, 14 Feb 2020 15:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581695691;
 bh=TKNR1RggkVSKFIYabLZR0PfqLGHp4WwX0Rzzf+yWMoQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rWwya4HotxnZ1nOhQn+2FAtCct9ZmyHDC0TX0GTbfigQwAPpGjdOa6BNcTibbvre1
 c6ZOCRSdsSXeQNOT4f3bmwZz9rC18WLu9Q0dxobOMcEbQejsGQ8GwPnxvMl1HslVLM
 pkHl/I8SjhM4Sg00PnHBV9W2f38AsLFtMMQ8c6Ps=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri, 14 Feb 2020 10:44:27 -0500
Message-Id: <20200214154854.6746-275-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214154854.6746-1-sashal@kernel.org>
References: <20200214154854.6746-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH AUTOSEL 5.5 275/542] ASoC: soc-topology: fix
	endianness issues
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit 72bbeda0222bcd382ee33b3aff71346074410c21 ]

Sparse complains about a series of easy warnings, fix.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200102195952.9465-3-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/soc-topology.c | 42 +++++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 4e1fe623c3908..0119f07cece6f 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -604,9 +604,11 @@ static int soc_tplg_kcontrol_bind_io(struct snd_soc_tplg_ctl_hdr *hdr,
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
 
@@ -621,11 +623,11 @@ static int soc_tplg_kcontrol_bind_io(struct snd_soc_tplg_ctl_hdr *hdr,
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
 
@@ -638,11 +640,11 @@ static int soc_tplg_kcontrol_bind_io(struct snd_soc_tplg_ctl_hdr *hdr,
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
 
@@ -931,7 +933,7 @@ static int soc_tplg_denum_create_texts(struct soc_enum *se,
 	if (se->dobj.control.dtexts == NULL)
 		return -ENOMEM;
 
-	for (i = 0; i < ec->items; i++) {
+	for (i = 0; i < le32_to_cpu(ec->items); i++) {
 
 		if (strnlen(ec->texts[i], SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
 			SNDRV_CTL_ELEM_ID_NAME_MAXLEN) {
@@ -1325,7 +1327,7 @@ static struct snd_kcontrol_new *soc_tplg_dapm_widget_dmixer_create(
 		if (kc[i].name == NULL)
 			goto err_sm;
 		kc[i].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-		kc[i].access = mc->hdr.access;
+		kc[i].access = le32_to_cpu(mc->hdr.access);
 
 		/* we only support FL/FR channel mapping atm */
 		sm->reg = tplc_chan_get_reg(tplg, mc->channel,
@@ -1337,10 +1339,10 @@ static struct snd_kcontrol_new *soc_tplg_dapm_widget_dmixer_create(
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
 
@@ -1401,7 +1403,7 @@ static struct snd_kcontrol_new *soc_tplg_dapm_widget_denum_create(
 			goto err_se;
 
 		tplg->pos += (sizeof(struct snd_soc_tplg_enum_control) +
-				ec->priv.size);
+			      le32_to_cpu(ec->priv.size));
 
 		dev_dbg(tplg->dev, " adding DAPM widget enum control %s\n",
 			ec->hdr.name);
@@ -1411,7 +1413,7 @@ static struct snd_kcontrol_new *soc_tplg_dapm_widget_denum_create(
 		if (kc[i].name == NULL)
 			goto err_se;
 		kc[i].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-		kc[i].access = ec->hdr.access;
+		kc[i].access = le32_to_cpu(ec->hdr.access);
 
 		/* we only support FL/FR channel mapping atm */
 		se->reg = tplc_chan_get_reg(tplg, ec->channel, SNDRV_CHMAP_FL);
@@ -1420,8 +1422,8 @@ static struct snd_kcontrol_new *soc_tplg_dapm_widget_denum_create(
 		se->shift_r = tplc_chan_get_shift(tplg, ec->channel,
 						  SNDRV_CHMAP_FR);
 
-		se->items = ec->items;
-		se->mask = ec->mask;
+		se->items = le32_to_cpu(ec->items);
+		se->mask = le32_to_cpu(ec->mask);
 		se->dobj.index = tplg->index;
 
 		switch (le32_to_cpu(ec->hdr.ops.info)) {
@@ -1523,9 +1525,9 @@ static struct snd_kcontrol_new *soc_tplg_dapm_widget_dbytes_create(
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
