Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B79B860F1E7
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 10:10:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5691632D8;
	Thu, 27 Oct 2022 10:09:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5691632D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666858234;
	bh=jmujsjyGLm6r9HxgKoELq8kIQcO3Vafz5I0Pw/IAAlc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eGJGybbYigvncizFQVSDo8hDrcokEMMWTrE1f+2p0B7zmDdQlM1Zjb0g6U65fMG3/
	 fkBfRM2NhfjqUiZ2gW0fiBb7SphaNZHjWEZvIX64Bjb0m7KSC9ZWrf3gxohhgGQG96
	 tGo3RPDQeRrXYAylazWj5GoRVwFbO3/NPKrdze30=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 974F7F805A9;
	Thu, 27 Oct 2022 10:07:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12B5AF8054A; Thu, 27 Oct 2022 10:07:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3188DF80551
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 10:07:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3188DF80551
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="FdNqoBb8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666858044; x=1698394044;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jmujsjyGLm6r9HxgKoELq8kIQcO3Vafz5I0Pw/IAAlc=;
 b=FdNqoBb81F9Syga2amqHepIxJFrL/ajkM32OwRixRsQ+p+fi+JCST0OC
 v3XwscML34VbqB2p28wy4VZOISFq3esvgjdm68qXDX1GWYwxoU61A4tty
 C3n2j4+/Scx0OBaRKsFd25unCfa1UVs8BG5SEACt8hO7Esfa9iiFKaaYZ
 9sCxi13P524EqsJUah835h/m4Nvgrm+4apIsboJrGGhG73lAALXuJEQm0
 EEvVAvCnuNxW7FgQfpcnX8R+mGiYg4VyZ+2IIVzNXQN0KUR0CDs2HaZlw
 gFp+mHGQopolUHz0yKclW+xcwRllabeyWHv9XV6uSjWwk/XQkw3m44Npm A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="291462725"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; d="scan'208";a="291462725"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 01:07:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="961534873"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; d="scan'208";a="961534873"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga005.fm.intel.com with ESMTP; 27 Oct 2022 01:07:07 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v3 6/9] ASoC: Intel: avs: Count low power streams
Date: Thu, 27 Oct 2022 10:23:28 +0200
Message-Id: <20221027082331.1561740-7-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221027082331.1561740-1-cezary.rojewski@intel.com>
References: <20221027082331.1561740-1-cezary.rojewski@intel.com>
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
index 660129508c08..157d25e32e16 100644
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

