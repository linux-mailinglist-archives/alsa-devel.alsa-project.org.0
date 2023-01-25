Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A02E267B3F2
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Jan 2023 15:11:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E41B2827;
	Wed, 25 Jan 2023 15:10:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E41B2827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674655884;
	bh=XsNiruwMU+8flFDOS6YqzthhJODwBWRtu0/CkSAUdzM=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=DnUQZGSCPk8hmzJnYWrRVDf0y04TshXoIwzIm0q3KAxZOrTDsNE+GF/NoHIoXHWCw
	 LfJVuXBxh+YAsvtoji5NUGn4XOv8ZaEGTKB+XR6pbqjmO+5C9u0yhUw8q5Ow81+IYQ
	 BukSvPxbd2wa00MVoU+nH1XyGaWlHSc4uqVYzryA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66D70F804A9;
	Wed, 25 Jan 2023 15:10:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79257F80424; Wed, 25 Jan 2023 15:10:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71C2BF800FB
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 15:10:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71C2BF800FB
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CLoR5w7k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674655818; x=1706191818;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XsNiruwMU+8flFDOS6YqzthhJODwBWRtu0/CkSAUdzM=;
 b=CLoR5w7kvN+uAVD4WpokZB/FErtlbWP3tw2nS65krQbHl+vf51j2V1Pq
 LZiLrPaiycUZt/H0/QzBWzIMYLf+GTJnKRd5sWJDFoYXYRpHEx6FzBQlK
 gTpVU3e9le4PxoLiPkipkOcw2/MhoDapo+ukgAmkgg13xz9Ym6F4GTuWg
 E07eH6pWU4sO361NwT0dnOwdIms5b8cY9toWZFVJVc+WtfjTULYvVqohz
 9pfJvVjHpeZzhV6hjH/wHUiBrtBjWG5wEnUTAVObfx1lAZdL1DDleONVG
 UrZqs5ZdeetHY2TF6HEH1yXXFvXS/YRJ2sXK8N2VvAP0Tput2YIDDt6jg g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="326589157"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; d="scan'208";a="326589157"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 06:10:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="692964410"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; d="scan'208";a="692964410"
Received: from kpotent-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.30.21])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 06:10:10 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: ipc4-topology: use different channel mask for each sdw
 amp feedback
Date: Wed, 25 Jan 2023 16:10:16 +0200
Message-Id: <20230125141016.29487-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Currently, we use the same channel mask for aggregated speakers.
It works fine for playback because we duplicate the audio data for all
aggregated speakers. But we need to get audio data from each aggregated
speaker and combine them to the captured audio. So we need to set
non-overlapping channel mask for aggregated ALH DAIs.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 59f4d42f9011..34586cbb461f 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1203,8 +1203,11 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 			struct sof_ipc4_copier_data *alh_data;
 			struct sof_ipc4_copier *alh_copier;
 			struct snd_sof_widget *w;
+			u32 ch_count = 0;
 			u32 ch_mask = 0;
 			u32 ch_map;
+			u32 step;
+			u32 mask;
 			int i;
 
 			blob = (struct sof_ipc4_alh_configuration_blob *)ipc4_copier->copier_config;
@@ -1214,11 +1217,15 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 			/* Get channel_mask from ch_map */
 			ch_map = copier_data->base_config.audio_fmt.ch_map;
 			for (i = 0; ch_map; i++) {
-				if ((ch_map & 0xf) != 0xf)
+				if ((ch_map & 0xf) != 0xf) {
 					ch_mask |= BIT(i);
+					ch_count++;
+				}
 				ch_map >>= 4;
 			}
 
+			step = ch_count / blob->alh_cfg.count;
+			mask =  GENMASK(step - 1, 0);
 			/*
 			 * Set each gtw_cfg.node_id to blob->alh_cfg.mapping[]
 			 * for all widgets with the same stream name
@@ -1233,7 +1240,22 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 				alh_copier = (struct sof_ipc4_copier *)dai->private;
 				alh_data = &alh_copier->data;
 				blob->alh_cfg.mapping[i].alh_id = alh_data->gtw_cfg.node_id;
-				blob->alh_cfg.mapping[i].channel_mask = ch_mask;
+				/*
+				 * Set the same channel mask for playback as the audio data is
+				 * duplicated for all speakers. For capture, split the channels
+				 * among the aggregated DAIs. For example, with 4 channels on 2
+				 * aggregated DAIs, the channel_mask should be 0x3 and 0xc for the
+				 * two DAI's.
+				 * The channel masks used depend on the cpu_dais used in the
+				 * dailink at the machine driver level, which actually comes from
+				 * the tables in soc_acpi files depending on the _ADR and devID
+				 * registers for each codec.
+				 */
+				if (w->id == snd_soc_dapm_dai_in)
+					blob->alh_cfg.mapping[i].channel_mask = ch_mask;
+				else
+					blob->alh_cfg.mapping[i].channel_mask = mask << (step * i);
+
 				i++;
 			}
 			if (blob->alh_cfg.count > 1) {
-- 
2.39.1

