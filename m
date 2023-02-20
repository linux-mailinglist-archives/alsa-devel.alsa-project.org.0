Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DBE69C998
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Feb 2023 12:17:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 975D1EB3;
	Mon, 20 Feb 2023 12:17:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 975D1EB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676891870;
	bh=rOMCxEo459LVKFnJiE2YpRPZKTpzgalBc7uTVfzETJE=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ia6tuulF9k47EtN3Vb/wwSJcIb9SkNkrZkbwq8jR4/PXXPats08rTKbBvtMy/1WRc
	 87b6438fF6Zf6ehSnEmwfcEG9e037Ay8/F7PLZWqvZvNwrNs1sqfhQimHJOU/Vx6w+
	 HPGzHZLSkWiqzb/IY2/ZjJLgULimZipcam8qCi50=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6D6AF8025A;
	Mon, 20 Feb 2023 12:16:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 481B2F80266; Mon, 20 Feb 2023 12:16:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2F357F80083
	for <alsa-devel@alsa-project.org>; Mon, 20 Feb 2023 12:16:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F357F80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MdxN6JO6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676891812; x=1708427812;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rOMCxEo459LVKFnJiE2YpRPZKTpzgalBc7uTVfzETJE=;
  b=MdxN6JO6iBQuJ9Ua0g2vVu5h2cCkQIoscCJCAjP/HCtNdLW2Zw6OKCle
   7AB2eCLCJbNkKbE+KaWxzEtpBGwGm18erSjp+ngUOQD0yt1kxR1wPlIL4
   umSQbR5vpQMJkz8q7gzWGBV8MwN15sbLH/0gwbvAHD5nQ9+KaiHWLKpzA
   QDtGhfoFj0RKwlujD1mwoHCm/qaDRw+WT4HM22z4kxpzQVLR4jViRSm3j
   pziX51UPJGj3FRBI88ewipJy3S9u7i27wcS6lvqIzmU355a3GTosadaJb
   Hq0e8O+YA7F7c9Ht+/RkN07MnFc3bqDNPwtd4pEXz3rOq/ZNP5A1PasEi
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="334578773"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000";
   d="scan'208";a="334578773"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2023 03:16:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="814109139"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000";
   d="scan'208";a="814109139"
Received: from mmocanu-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.214.33])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2023 03:16:43 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: stable@vger.kernel.org
Subject: [PATCH BACKPORT 6.0,
 6.1] ASoC: SOF: Intel: hda-dai: fix possible stream_tag leak
Date: Mon, 20 Feb 2023 13:16:58 +0200
Message-Id: <20230220111658.32256-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZFVHYPOPO3YXCYBKR5USXEOECKWK644R
X-Message-ID-Hash: ZFVHYPOPO3YXCYBKR5USXEOECKWK644R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZFVHYPOPO3YXCYBKR5USXEOECKWK644R/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

[ Upstream commit 1f810d2b6b2fbdc5279644d8b2c140b1f7c9d43d ]

The reason for manual backport is that in 6.2 there were a naming cleanup
around hdac, link, hlink, for example snd_hdac_ext_bus_get_link is renamed
to snd_hdac_ext_bus_get_hlink_by_name in 6.2.

The HDaudio stream allocation is done first, and in a second step the
LOSIDV parameter is programmed for the multi-link used by a codec.

This leads to a possible stream_tag leak, e.g. if a DisplayAudio link
is not used. This would happen when a non-Intel graphics card is used
and userspace unconditionally uses the Intel Display Audio PCMs without
checking if they are connected to a receiver with jack controls.

We should first check that there is a valid multi-link entry to
configure before allocating a stream_tag. This change aligns the
dma_assign and dma_cleanup phases.

Cc: stable@vger.kernel.org # 6.1.x 6.0.x
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
index 556e883a32ed..5f03ee390d54 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -216,6 +216,10 @@ static int hda_link_dma_hw_params(struct snd_pcm_substream *substream,
 	struct hdac_bus *bus = hstream->bus;
 	struct hdac_ext_link *link;
 
+	link = snd_hdac_ext_bus_get_link(bus, codec_dai->component->name);
+	if (!link)
+		return -EINVAL;
+
 	hext_stream = snd_soc_dai_get_dma_data(cpu_dai, substream);
 	if (!hext_stream) {
 		hext_stream = hda_link_stream_assign(bus, substream);
@@ -225,10 +229,6 @@ static int hda_link_dma_hw_params(struct snd_pcm_substream *substream,
 		snd_soc_dai_set_dma_data(cpu_dai, substream, (void *)hext_stream);
 	}
 
-	link = snd_hdac_ext_bus_get_link(bus, codec_dai->component->name);
-	if (!link)
-		return -EINVAL;
-
 	/* set the hdac_stream in the codec dai */
 	snd_soc_dai_set_stream(codec_dai, hdac_stream(hext_stream), substream->stream);
 
-- 
2.39.2

