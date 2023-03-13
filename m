Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCE76B780B
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 13:51:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DF191493;
	Mon, 13 Mar 2023 13:51:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DF191493
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678711910;
	bh=zRK+ee3jobCd1oHERh5jLh8J9AWuxNv5lr69dhLNYT0=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Xh/OXBzbw16AA3X6seq/7YmSRW0vL6ZEfgMuN+i6wPxxOKjACXJHKWrQXu8lGkPDF
	 dCEs2OKukIHPrUEtQtkpaOIKWf0jLXNKNWTvJJcmFEQjZaecX7B2K85vakhcRkYi96
	 xtRfatN27EixTAJ3tagC5QtHaLwqyh+kOdeMoBcw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E2BAF80578;
	Mon, 13 Mar 2023 13:49:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F4B6F8056F; Mon, 13 Mar 2023 13:49:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 201AEF80558
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 13:49:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 201AEF80558
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=A0b1s21K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678711773; x=1710247773;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zRK+ee3jobCd1oHERh5jLh8J9AWuxNv5lr69dhLNYT0=;
  b=A0b1s21KiSsuFeM38RT5BXmQXhRCl0Ox/BFAugp6jB4rNfHsqeBfHV8k
   FyD12g7Q4V0wBttb5E1eThOcykTfWMFbJ5RHVW4T8NpNvO4tkKwYAKwQm
   WtqXl3yDbVgGICRGBzi14zilgM/n00V4iwvgv3jsqKjKd/c64+ypYKbvp
   HNrH17e9q5fwHWytc3/kuBF/vbGxVKHcwAlKiZuCnqSl6JaTer/VVzcWm
   Pnmw4aMTkdmGY7B0fte/aE+pQemq5sk/ut+Fp3mbWAZT8mTpVax92TdXf
   puGPsnvXOtMW+q+HDXXV5lzNlw92C6yNihRyHCQKliz/5dLQmGNSugeGS
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="399728085"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400";
   d="scan'208";a="399728085"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 05:48:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="711116443"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400";
   d="scan'208";a="711116443"
Received: from tchambon-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.43.68])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 05:48:46 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 05/11] ASoC: SOF: ipc4-topology: Parse the SOF_COMP_TOKENS
 only once
Date: Mon, 13 Mar 2023 14:48:50 +0200
Message-Id: <20230313124856.8140-6-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313124856.8140-1-peter.ujfalusi@linux.intel.com>
References: <20230313124856.8140-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QJYAKQV6SR5DBPYVC7G2WVD64L6XWKZZ
X-Message-ID-Hash: QJYAKQV6SR5DBPYVC7G2WVD64L6XWKZZ
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QJYAKQV6SR5DBPYVC7G2WVD64L6XWKZZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

There is no need to parse the cpc and is_pages values multiple times.
It is enough to parse the 2 tokens directly into the base_config field
in each module's init_instance IPC payload.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 41 ++++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 50cd4fe3141c..b6933fa1a36d 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -170,6 +170,7 @@ static void sof_ipc4_dbg_audio_format(struct device *dev,
  * @scomp: pointer to pointer to SOC component
  * @swidget: pointer to struct snd_sof_widget containing tuples
  * @available_fmt: pointer to struct sof_ipc4_available_audio_format being filling in
+ * @module_base_cfg: Pointer to the base_config in the module init IPC payload
  * @has_out_format: true if available_fmt contains output format
  *
  * Return: 0 if successful
@@ -177,6 +178,7 @@ static void sof_ipc4_dbg_audio_format(struct device *dev,
 static int sof_ipc4_get_audio_fmt(struct snd_soc_component *scomp,
 				  struct snd_sof_widget *swidget,
 				  struct sof_ipc4_available_audio_format *available_fmt,
+				  struct sof_ipc4_base_module_cfg *module_base_cfg,
 				  bool has_out_format)
 {
 	struct sof_ipc4_base_module_cfg *base_config;
@@ -199,17 +201,18 @@ static int sof_ipc4_get_audio_fmt(struct snd_soc_component *scomp,
 	if (!base_config)
 		return -ENOMEM;
 
-	/* set cpc and is_pages for all base_cfg */
-	for (i = 0; i < available_fmt->audio_fmt_num; i++) {
-		ret = sof_update_ipc_object(scomp, &base_config[i],
-					    SOF_COMP_TOKENS, swidget->tuples,
-					    swidget->num_tuples, sizeof(*base_config), 1);
-		if (ret) {
-			dev_err(scomp->dev, "parse comp tokens failed %d\n", ret);
-			goto err;
-		}
+	/* set cpc and is_pages in the module's base_config */
+	ret = sof_update_ipc_object(scomp, module_base_cfg, SOF_COMP_TOKENS, swidget->tuples,
+				    swidget->num_tuples, sizeof(*module_base_cfg), 1);
+	if (ret) {
+		dev_err(scomp->dev, "parse comp tokens for %s failed, error: %d\n",
+			swidget->widget->name, ret);
+		goto err;
 	}
 
+	dev_dbg(scomp->dev, "widget %s cpc: %d is_pages: %d\n",
+		swidget->widget->name, module_base_cfg->cpc, module_base_cfg->is_pages);
+
 	/* copy the ibs/obs for each base_cfg */
 	ret = sof_update_ipc_object(scomp, base_config,
 				    SOF_AUDIO_FORMAT_BUFFER_SIZE_TOKENS, swidget->tuples,
@@ -221,9 +224,8 @@ static int sof_ipc4_get_audio_fmt(struct snd_soc_component *scomp,
 	}
 
 	for (i = 0; i < available_fmt->audio_fmt_num; i++)
-		dev_dbg(scomp->dev, "%d: ibs: %d obs: %d cpc: %d is_pages: %d\n", i,
-			base_config[i].ibs, base_config[i].obs,
-			base_config[i].cpc, base_config[i].is_pages);
+		dev_dbg(scomp->dev, "%d: ibs: %d obs: %d\n", i,
+			base_config[i].ibs, base_config[i].obs);
 
 	in_format = kcalloc(available_fmt->audio_fmt_num,
 			    sizeof(struct sof_ipc4_audio_format), GFP_KERNEL);
@@ -359,7 +361,8 @@ static int sof_ipc4_widget_setup_pcm(struct snd_sof_widget *swidget)
 
 	dev_dbg(scomp->dev, "Updating IPC structure for %s\n", swidget->widget->name);
 
-	ret = sof_ipc4_get_audio_fmt(scomp, swidget, available_fmt, true);
+	ret = sof_ipc4_get_audio_fmt(scomp, swidget, available_fmt,
+				     &ipc4_copier->data.base_config, true);
 	if (ret)
 		goto free_copier;
 
@@ -457,7 +460,8 @@ static int sof_ipc4_widget_setup_comp_dai(struct snd_sof_widget *swidget)
 
 	dev_dbg(scomp->dev, "Updating IPC structure for %s\n", swidget->widget->name);
 
-	ret = sof_ipc4_get_audio_fmt(scomp, swidget, available_fmt, true);
+	ret = sof_ipc4_get_audio_fmt(scomp, swidget, available_fmt,
+				     &ipc4_copier->data.base_config, true);
 	if (ret)
 		goto free_copier;
 
@@ -665,7 +669,8 @@ static int sof_ipc4_widget_setup_comp_pga(struct snd_sof_widget *swidget)
 	gain->data.init_val = SOF_IPC4_VOL_ZERO_DB;
 
 	/* The out_audio_fmt in topology is ignored as it is not required to be sent to the FW */
-	ret = sof_ipc4_get_audio_fmt(scomp, swidget, &gain->available_fmt, false);
+	ret = sof_ipc4_get_audio_fmt(scomp, swidget, &gain->available_fmt, &gain->base_config,
+				     false);
 	if (ret)
 		goto err;
 
@@ -731,7 +736,8 @@ static int sof_ipc4_widget_setup_comp_mixer(struct snd_sof_widget *swidget)
 	swidget->private = mixer;
 
 	/* The out_audio_fmt in topology is ignored as it is not required to be sent to the FW */
-	ret = sof_ipc4_get_audio_fmt(scomp, swidget, &mixer->available_fmt, false);
+	ret = sof_ipc4_get_audio_fmt(scomp, swidget, &mixer->available_fmt,
+				     &mixer->base_config, false);
 	if (ret)
 		goto err;
 
@@ -762,7 +768,8 @@ static int sof_ipc4_widget_setup_comp_src(struct snd_sof_widget *swidget)
 	swidget->private = src;
 
 	/* The out_audio_fmt in topology is ignored as it is not required by SRC */
-	ret = sof_ipc4_get_audio_fmt(scomp, swidget, &src->available_fmt, false);
+	ret = sof_ipc4_get_audio_fmt(scomp, swidget, &src->available_fmt, &src->base_config,
+				     false);
 	if (ret)
 		goto err;
 
-- 
2.39.2

