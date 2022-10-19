Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B1F604F03
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 19:40:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B39A3AF75;
	Wed, 19 Oct 2022 19:39:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B39A3AF75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666201207;
	bh=uBoB0zsyZoh14K54H1KbSX3NBArhb9QZFFXorEIm/Bc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ppWLUNMrEXs+ehoUK7t9ieXdS1wBbJJ1NRT2At7Rxlh7/3fJm+8t9QHreep42qPCD
	 dDcACz6zxEk9UvgqxAxfgvFezQgwH4IrNBdAVj+ONOrhHsjCmnlWNedSFIxW3MYlhj
	 5ZiP8hqpYho7cfLAeUBWH3CioGke9Q4XqqL1Wb7Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AA6DF80567;
	Wed, 19 Oct 2022 19:37:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 372EAF80137; Wed, 19 Oct 2022 19:37:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83E70F80535
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 19:37:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83E70F80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="KIw3aXQC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666201056; x=1697737056;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uBoB0zsyZoh14K54H1KbSX3NBArhb9QZFFXorEIm/Bc=;
 b=KIw3aXQC2CLwxLti86LiQs2n7sGGKDDxNPshdPUIacuDnBnxwSBtuoPJ
 x3h0WkLCZqPRKyxmzaPPoGz4jt39v+lsFFpxK7Q7SB8rhIluqd4HqbiD4
 KBFu9CFsRqOb7bFDer6bN3giLuEYmKlXCm/JB6YiQhNT9KL5aA0qYyWRo
 eb/rR8wTNBSrXUs2xHRTZd8SWe05gFG/wfYha3x+Ri47hCxUwjNZxPEZR
 0AgjPAcIalXIJbceo5PPfN/7MNSwSML7noKwlCnrtFvvmgcb73y4UVVRT
 /9CACOVzza6VOK8pIerc8k5dFtfjF85jEPHDsodVqmzDNVeS9kjPYGzYH g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="333045685"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="333045685"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 10:37:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="771898548"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="771898548"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 19 Oct 2022 10:37:19 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 5/8] ASoC: Intel: avs: Count low power streams
Date: Wed, 19 Oct 2022 19:53:14 +0200
Message-Id: <20221019175317.1540919-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221019175317.1540919-1-cezary.rojewski@intel.com>
References: <20221019175317.1540919-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

Streaming in S0iX differs from SX scenarios. Store the number of
so-called low-power streams to be able to differentiate between the two.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/avs.h |  1 +
 sound/soc/intel/avs/pcm.c | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 91f78eb11bc1..fb73d207697f 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -127,6 +127,7 @@ struct avs_dev {
 	struct list_head fw_list;
 	int *core_refs;		/* reference count per core */
 	char **lib_names;
+	int num_lp_paths;
 
 	struct completion fw_ready;
 	struct work_struct probe_work;
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index cce3756e2a4e..a869402e0f4c 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -60,6 +60,8 @@ avs_dai_find_path_template(struct snd_soc_dai *dai, bool is_fe, int direction)
 static int avs_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai, bool is_fe,
 			   const struct snd_soc_dai_ops *ops)
 {
+	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
+	struct avs_dev *adev = to_avs_dev(dai->dev);
 	struct avs_tplg_path_template *template;
 	struct avs_dma_data *data;
 
@@ -78,6 +80,9 @@ static int avs_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_d
 	data->template = template;
 	snd_soc_dai_set_dma_data(dai, substream, data);
 
+	if (rtd->dai_link->ignore_suspend)
+		adev->num_lp_paths++;
+
 	return 0;
 }
 
@@ -164,8 +169,13 @@ static int avs_dai_nonhda_be_startup(struct snd_pcm_substream *substream, struct
 
 static void avs_dai_nonhda_be_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
+	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
+	struct avs_dev *adev = to_avs_dev(dai->dev);
 	struct avs_dma_data *data;
 
+	if (rtd->dai_link->ignore_suspend)
+		adev->num_lp_paths--;
+
 	data = snd_soc_dai_get_dma_data(dai, substream);
 
 	snd_soc_dai_set_dma_data(dai, substream, NULL);
@@ -479,8 +489,13 @@ static int avs_dai_fe_startup(struct snd_pcm_substream *substream, struct snd_so
 
 static void avs_dai_fe_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
+	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
+	struct avs_dev *adev = to_avs_dev(dai->dev);
 	struct avs_dma_data *data;
 
+	if (rtd->dai_link->ignore_suspend)
+		adev->num_lp_paths--;
+
 	data = snd_soc_dai_get_dma_data(dai, substream);
 
 	snd_soc_dai_set_dma_data(dai, substream, NULL);
-- 
2.25.1

