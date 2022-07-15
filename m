Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 915C05763E8
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jul 2022 16:56:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32D071943;
	Fri, 15 Jul 2022 16:55:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32D071943
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657896962;
	bh=JzeHtf/OZowtCoerp7t1lQYH8d1p3oYkjdzbLEFQyxM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M1+/LsAW5KGnXkw9nDRauazMPRpHQppjIvrInn3tr5dznLk5rbBGrEjTqjdI8wTRY
	 d0Aj1J3jiS4S1ljnlewMSOECGdahYOrFxm1maP6cbptC6Re5HyBxDXYcJY+lj/oYVV
	 4iEE3vfQC8tXL1tKl0+YUK1v0sej98chvIsv18ho=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 148CAF8057C;
	Fri, 15 Jul 2022 16:53:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDFC5F800AA; Fri, 15 Jul 2022 16:53:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D43FF804B2
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 16:52:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D43FF804B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="JYsv8ONu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657896774; x=1689432774;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JzeHtf/OZowtCoerp7t1lQYH8d1p3oYkjdzbLEFQyxM=;
 b=JYsv8ONusnFos495zWqSMgeH6NG7yKDgeFOPVqpOiCbV/PJqmlQeZAsU
 /pty0UO05k/f5Zp9hfcJXWQhnoUEDJgtdt+wRJStU/gygtBXeg9/HlkRW
 HfAyACQw6xiNj4AcspgRgGkAIJhefJ0PdV2PVIrmxRrbGq0BT2P5NArqg
 JZe/kYWpu5TGLC676nw86xifM6cf4P7JWzHkrKlbC3J0k6PJg8+sxFp5G
 HbzblgcrWkyPfwMd2HHTB5I+UZTR0plF2Gq/xlJs/EShv+Ix73/2JHO1A
 mQ0UhAtxg/YiTma+C5KOZ0sLVj1mh6jmT9voLmEMOjbWdOMnE1/b2djPQ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="311476906"
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="311476906"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 07:52:32 -0700
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="923533113"
Received: from jmurope-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.14.184])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 07:52:31 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/11] ASoC: SOF: ipc4-pcm: set pcm rate to dai setting
Date: Fri, 15 Jul 2022 09:52:08 -0500
Message-Id: <20220715145216.277003-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220715145216.277003-1-pierre-louis.bossart@linux.intel.com>
References: <20220715145216.277003-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Rander Wang <rander.wang@intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

From: Rander Wang <rander.wang@intel.com>

Dsp converts pcm rate to the one defined by dai. When SRC
is used, the pcm runtime rate is different with dai rate
and we need to fix it up for BE components.

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc4-pcm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index 6a702f9dc065..732872395980 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -179,6 +179,7 @@ static int sof_ipc4_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 {
 	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, SOF_AUDIO_PCM_DRV_NAME);
 	struct snd_sof_dai *dai = snd_sof_find_dai(component, rtd->dai_link->name);
+	struct snd_interval *rate = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
 	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	struct sof_ipc4_copier *ipc4_copier;
@@ -201,6 +202,9 @@ static int sof_ipc4_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 	snd_mask_none(fmt);
 	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S32_LE);
 
+	rate->min = ipc4_copier->available_fmt.base_config->audio_fmt.sampling_frequency;
+	rate->max = rate->min;
+
 	/*
 	 * Set trigger order for capture to SND_SOC_DPCM_TRIGGER_PRE. This is required
 	 * to ensure that the BE DAI pipeline gets stopped/suspended before the FE DAI
-- 
2.34.1

