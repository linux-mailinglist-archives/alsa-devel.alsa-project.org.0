Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CF669C99F
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Feb 2023 12:18:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1822AF08;
	Mon, 20 Feb 2023 12:17:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1822AF08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676891923;
	bh=Z054cRXfzoEcExIDbRnFtnWypSCE8y6qJzowPV9d01E=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=eSmm7nZlexwQxKpgWUNTLolb7JNQpG6uNv+E86dfyqUylHyCWxGKDAKkWa0TRuhvR
	 mrhDzIcdoAwJMwoj4760mugn/5OwlxSWP30089xkZbSaMZP1lMCQTdJD5HPcgWdo5N
	 uexaW45xACMuZOLJYQNLyXhFhqj8kmsAHIIBfcUM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16AEBF80525;
	Mon, 20 Feb 2023 12:17:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D510F804B0; Mon, 20 Feb 2023 12:17:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7E2AFF80266
	for <alsa-devel@alsa-project.org>; Mon, 20 Feb 2023 12:17:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E2AFF80266
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=izwjCTNL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676891836; x=1708427836;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Z054cRXfzoEcExIDbRnFtnWypSCE8y6qJzowPV9d01E=;
  b=izwjCTNLIOY9d8MY0jOTtGWY03LPih11ZkDD2yA+bW54SM4lm/VuHckd
   UUsT6tKnyGeDsm9LryDaVE9vweiVbUowwv3gr9qbWVKsk9xlKum8ZdVTq
   p1ajNRWsD3574y8mExLqmxqiJd8wou/85Mz54Ygp9tUrVl/eXmD7tyZZr
   A/JajJQG9TqkAG8sKEn1wOqWms/CHSiloEspB97BjK9C1HGz0nvWewjTZ
   2VsBR4qzb9t6EBM4m4i7c1+/lXu9xiWd31uXsV6lmcTYlpY46k7J7Zv9B
   Ujkywv+jxTIJcuX5+iG5XG1PWh5H0z8MHyhJuYzcifCnP4AKuRqmTxQ1V
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="333739509"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000";
   d="scan'208";a="333739509"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2023 03:17:09 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="795150973"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000";
   d="scan'208";a="795150973"
Received: from mmocanu-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.214.33])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2023 03:17:07 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: stable@vger.kernel.org
Subject: [PATCH BACKPORT 5.4] ASoC: SOF: Intel: hda-dai: fix possible
 stream_tag leak
Date: Mon, 20 Feb 2023 13:17:21 +0200
Message-Id: <20230220111721.32502-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NDYQQPYUHUO733HNCORO22XP4CVHNNC2
X-Message-ID-Hash: NDYQQPYUHUO733HNCORO22XP4CVHNNC2
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: sashal@kernel.org, broonie@kernel.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 gregkh@linuxfoundation.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NDYQQPYUHUO733HNCORO22XP4CVHNNC2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

[ Upstream commit 1f810d2b6b2fbdc5279644d8b2c140b1f7c9d43d ]

There were just too many code changes since 5.4 stable to prevent clean
picking the fix from mainline.

The HDaudio stream allocation is done first, and in a second step the
LOSIDV parameter is programmed for the multi-link used by a codec.

This leads to a possible stream_tag leak, e.g. if a DisplayAudio link
is not used. This would happen when a non-Intel graphics card is used
and userspace unconditionally uses the Intel Display Audio PCMs without
checking if they are connected to a receiver with jack controls.

We should first check that there is a valid multi-link entry to
configure before allocating a stream_tag. This change aligns the
dma_assign and dma_cleanup phases.

Cc: stable@vger.kernel.org # 5.4.x
Complements: b0cd60f3e9f5 ("ALSA/ASoC: hda: clarify bus_get_link() and bus_link_get() helpers")
Link: https://github.com/thesofproject/linux/issues/4151
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Link: https://lore.kernel.org/r/20230216162340.19480-1-peter.ujfalusi@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-dai.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index b3cdd10c83ae..c30e450fa970 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -211,6 +211,10 @@ static int hda_link_hw_params(struct snd_pcm_substream *substream,
 	int stream_tag;
 	int ret;
 
+	link = snd_hdac_ext_bus_get_link(bus, codec_dai->component->name);
+	if (!link)
+		return -EINVAL;
+
 	/* get stored dma data if resuming from system suspend */
 	link_dev = snd_soc_dai_get_dma_data(dai, substream);
 	if (!link_dev) {
@@ -231,10 +235,6 @@ static int hda_link_hw_params(struct snd_pcm_substream *substream,
 	if (ret < 0)
 		return ret;
 
-	link = snd_hdac_ext_bus_get_link(bus, codec_dai->component->name);
-	if (!link)
-		return -EINVAL;
-
 	/* set the stream tag in the codec dai dma params */
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 		snd_soc_dai_set_tdm_slot(codec_dai, stream_tag, 0, 0, 0);
-- 
2.39.2

