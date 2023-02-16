Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 196226997AB
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 15:41:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED40EEA9;
	Thu, 16 Feb 2023 15:41:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED40EEA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676558518;
	bh=DcFzL+Mc9BQ9Hw8Juk/R8AH4j49T5gA+cKm37/xDzEE=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SYuMYTai2tcRMz9T4/5Yr21lbQKhFkno8L4cXPYJ7s29njhyUEHAhE+YcPhhbdiNf
	 Vxfu9m9vTo8xP/d9Me103lRGNudZJbMkWy0wzs8oVwvNb7GidryYjJfOVsGimQjM7v
	 Qlf3DbkFUeC0cSvnRhYK1qGX8K8Wl2MGQRnCwY8U=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 368E2F800E4;
	Thu, 16 Feb 2023 15:41:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88025F80171; Thu, 16 Feb 2023 15:41:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C4FC4F80083
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 15:40:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4FC4F80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=f2ZL9dhg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676558459; x=1708094459;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DcFzL+Mc9BQ9Hw8Juk/R8AH4j49T5gA+cKm37/xDzEE=;
  b=f2ZL9dhgZNWP5Q7DoeuUKdhYMaryV06m7XEeqQX9DHjsI97HD9LeYRHd
   DZR+CZS3muza/U6Ks7bslmZhMEhdNeO03wnVHfI1mqHfaEYfRRzhPb8wH
   /ZWkOa1P7REtvHu55IPjxtp0m7MVsElNmpzORqdGuImJIbbSSZuUISatJ
   LK5IKCVpOBkuXo2O4cnWusOjloe9Ph/RFnSnb7nIvFImMWSe7U0XJzuzK
   xxAQv6NlVQpmcDdId257sob2fseq9HgutyKSKcdmSl3RTLq9GjOi88c6E
   TIFjkbcnkqt4EFFH0YCX4kukEOYPjrBsLuTOfdMn33DZ1ZVUrAAK5lNxi
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="394158327"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000";
   d="scan'208";a="394158327"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 06:40:44 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="663474446"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000";
   d="scan'208";a="663474446"
Received: from sbadria-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.18.21])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 06:40:42 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: Intel: hda-dai: fix possible stream_tag leak
Date: Thu, 16 Feb 2023 16:40:54 +0200
Message-Id: <20230216144054.26203-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: N4ANJ5FZRTKSUSZSZPPDFFWOJQEVX4HC
X-Message-ID-Hash: N4ANJ5FZRTKSUSZSZPPDFFWOJQEVX4HC
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, yung-chuan.liao@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N4ANJ5FZRTKSUSZSZPPDFFWOJQEVX4HC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The HDaudio stream allocation is done first, and in a second step the
LOSIDV parameter is programmed for the multi-link used by a codec.

This leads to a possible stream_tag leak, e.g. if a DisplayAudio link
is not used. This would happen when a non-Intel graphics card is used
and userspace unconditionally uses the Intel Display Audio PCMs without
checking if they are connected to a receiver with jack controls.

We should first check that there is a valid multi-link entry to
configure before allocating a stream_tag. This change aligns the
dma_assign and dma_cleanup phases.

Link: https://github.com/thesofproject/linux/issues/4151
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
Hi Mark,

is there still time to send this for v6.2?
If not, then I will re-send it with stable 6.2 tag.

In fact similar change should be sent to stable kernels but due to a function
name change in 6.2 [1], this patch is not going to apply anything older..

[1]
b0cd60f3e9f5 ("ALSA/ASoC: hda: clarify bus_get_link() and bus_link_get() helpers")

Did a snd_hdac_ext_bus_get_link() -> snd_hdac_ext_bus_get_hlink_by_name() rename

I'm not sure if I should add the stable tag and let the stable guys figure it out,
but I feel guilty to do so...

Thanks,
Peter

 sound/soc/sof/intel/hda-dai.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 193b3e74820a..8d9c38d562d3 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -216,6 +216,10 @@ static int hda_link_dma_hw_params(struct snd_pcm_substream *substream,
 	sdev = snd_soc_component_get_drvdata(cpu_dai->component);
 	bus = sof_to_bus(sdev);
 
+	hlink = snd_hdac_ext_bus_get_hlink_by_name(bus, codec_dai->component->name);
+	if (!hlink)
+		return -EINVAL;
+
 	hext_stream = snd_soc_dai_get_dma_data(cpu_dai, substream);
 	if (!hext_stream) {
 		hext_stream = hda_link_stream_assign(bus, substream);
@@ -225,10 +229,6 @@ static int hda_link_dma_hw_params(struct snd_pcm_substream *substream,
 		snd_soc_dai_set_dma_data(cpu_dai, substream, (void *)hext_stream);
 	}
 
-	hlink = snd_hdac_ext_bus_get_hlink_by_name(bus, codec_dai->component->name);
-	if (!hlink)
-		return -EINVAL;
-
 	/* set the hdac_stream in the codec dai */
 	snd_soc_dai_set_stream(codec_dai, hdac_stream(hext_stream), substream->stream);
 
-- 
2.39.2

