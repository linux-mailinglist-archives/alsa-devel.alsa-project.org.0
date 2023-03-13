Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A816B780C
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 13:52:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9B391461;
	Mon, 13 Mar 2023 13:51:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9B391461
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678711923;
	bh=esnqXMakNk4ugw8YgC03WFGc0LuqrTyicWMzcbiq9sg=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NDcKWXGLY7wtdtjtv42HKjNSRduocF91dnOd6NQV2P9buQCUlmspHPX9zQld7C6v2
	 foaK5AcqIqXZccKZ0hj8XXloInZzAc/doe9MBDMaFGNaZt26xVq+sPWqOA6qgbLi20
	 M+7eDQejQhAAcYtKnkJOfxqz6UDAoonq/YjOUVJk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3204F8057B;
	Mon, 13 Mar 2023 13:49:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A535F8056F; Mon, 13 Mar 2023 13:49:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 83052F80564
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 13:49:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83052F80564
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IqT0ngzz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678711774; x=1710247774;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=esnqXMakNk4ugw8YgC03WFGc0LuqrTyicWMzcbiq9sg=;
  b=IqT0ngzzWCRK/urRRqnl67ZsRYX4Fp7xwXxkllH5b2wtrwqRueko7HoR
   2ScaFgbUCPpnk1h4IlucXspUPdEI1gvyIx5XGwHSMoIj6TSUhcf+pK5ff
   A69mMuCe8LtVbkKB6R8keu02J9MWEWZwDntUDUqsWDJFZBLh4BSovZ7dP
   5e3/+ZPszXq+ubzOQglvImpf2sC1Bse6S2AlIzhSyPJO02ZFpOxDYVO/V
   W5l8IkDl0v3CLPTibBNkDCx8vYO2LYuuR0CgN1ABp0D7d27YcQqum+83C
   biDXaqvuRWPuuTuNQtrwVvi4WII009hj2cMyqdK/9ZLEdoPTnNnMq5Xmm
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="399728093"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400";
   d="scan'208";a="399728093"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 05:48:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="711116459"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400";
   d="scan'208";a="711116459"
Received: from tchambon-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.43.68])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 05:48:49 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 06/11] ASoC: SOF: ipc4-topology: Always parse the output
 formats in topology
Date: Mon, 13 Mar 2023 14:48:51 +0200
Message-Id: <20230313124856.8140-7-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313124856.8140-1-peter.ujfalusi@linux.intel.com>
References: <20230313124856.8140-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Q4XBX6UQKD4BMGQABLK3SISVUXAV2OTW
X-Message-ID-Hash: Q4XBX6UQKD4BMGQABLK3SISVUXAV2OTW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q4XBX6UQKD4BMGQABLK3SISVUXAV2OTW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Parse the output formats available in topology always. Whether the
output format is sent in the init instance payload or not is decided
when sof_ipc4_init_audio_fmt() is invoked.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index b6933fa1a36d..0e1e4fc9224c 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -171,15 +171,13 @@ static void sof_ipc4_dbg_audio_format(struct device *dev,
  * @swidget: pointer to struct snd_sof_widget containing tuples
  * @available_fmt: pointer to struct sof_ipc4_available_audio_format being filling in
  * @module_base_cfg: Pointer to the base_config in the module init IPC payload
- * @has_out_format: true if available_fmt contains output format
  *
  * Return: 0 if successful
  */
 static int sof_ipc4_get_audio_fmt(struct snd_soc_component *scomp,
 				  struct snd_sof_widget *swidget,
 				  struct sof_ipc4_available_audio_format *available_fmt,
-				  struct sof_ipc4_base_module_cfg *module_base_cfg,
-				  bool has_out_format)
+				  struct sof_ipc4_base_module_cfg *module_base_cfg)
 {
 	struct sof_ipc4_base_module_cfg *base_config;
 	struct sof_ipc4_audio_format *out_format, *in_format;
@@ -249,9 +247,6 @@ static int sof_ipc4_get_audio_fmt(struct snd_soc_component *scomp,
 				  sizeof(struct sof_ipc4_audio_format),
 				  available_fmt->audio_fmt_num);
 
-	if (!has_out_format)
-		return 0;
-
 	out_format = kcalloc(available_fmt->audio_fmt_num, sizeof(*out_format), GFP_KERNEL);
 	if (!out_format) {
 		ret = -ENOMEM;
@@ -362,7 +357,7 @@ static int sof_ipc4_widget_setup_pcm(struct snd_sof_widget *swidget)
 	dev_dbg(scomp->dev, "Updating IPC structure for %s\n", swidget->widget->name);
 
 	ret = sof_ipc4_get_audio_fmt(scomp, swidget, available_fmt,
-				     &ipc4_copier->data.base_config, true);
+				     &ipc4_copier->data.base_config);
 	if (ret)
 		goto free_copier;
 
@@ -461,7 +456,7 @@ static int sof_ipc4_widget_setup_comp_dai(struct snd_sof_widget *swidget)
 	dev_dbg(scomp->dev, "Updating IPC structure for %s\n", swidget->widget->name);
 
 	ret = sof_ipc4_get_audio_fmt(scomp, swidget, available_fmt,
-				     &ipc4_copier->data.base_config, true);
+				     &ipc4_copier->data.base_config);
 	if (ret)
 		goto free_copier;
 
@@ -668,9 +663,7 @@ static int sof_ipc4_widget_setup_comp_pga(struct snd_sof_widget *swidget)
 	gain->data.channels = SOF_IPC4_GAIN_ALL_CHANNELS_MASK;
 	gain->data.init_val = SOF_IPC4_VOL_ZERO_DB;
 
-	/* The out_audio_fmt in topology is ignored as it is not required to be sent to the FW */
-	ret = sof_ipc4_get_audio_fmt(scomp, swidget, &gain->available_fmt, &gain->base_config,
-				     false);
+	ret = sof_ipc4_get_audio_fmt(scomp, swidget, &gain->available_fmt, &gain->base_config);
 	if (ret)
 		goto err;
 
@@ -735,9 +728,8 @@ static int sof_ipc4_widget_setup_comp_mixer(struct snd_sof_widget *swidget)
 
 	swidget->private = mixer;
 
-	/* The out_audio_fmt in topology is ignored as it is not required to be sent to the FW */
 	ret = sof_ipc4_get_audio_fmt(scomp, swidget, &mixer->available_fmt,
-				     &mixer->base_config, false);
+				     &mixer->base_config);
 	if (ret)
 		goto err;
 
@@ -767,9 +759,7 @@ static int sof_ipc4_widget_setup_comp_src(struct snd_sof_widget *swidget)
 
 	swidget->private = src;
 
-	/* The out_audio_fmt in topology is ignored as it is not required by SRC */
-	ret = sof_ipc4_get_audio_fmt(scomp, swidget, &src->available_fmt, &src->base_config,
-				     false);
+	ret = sof_ipc4_get_audio_fmt(scomp, swidget, &src->available_fmt, &src->base_config);
 	if (ret)
 		goto err;
 
-- 
2.39.2

