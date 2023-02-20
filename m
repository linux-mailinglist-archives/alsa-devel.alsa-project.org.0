Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BCD69C99E
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Feb 2023 12:18:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A67DED6;
	Mon, 20 Feb 2023 12:17:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A67DED6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676891921;
	bh=VsJRm2lzSODecEFJUfZ3q0dGV7Yw8mvC8iNuWfHwosk=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=aOWzhmRIGawFyztMY2bHeN3iTyoioLW2ABks0Xs8hpKKjS9xvNa9V6TNrFdE0RF27
	 M5ET9XTXQymaNyvWrn3qRHHMWG6rLu9S1sBvyctzQQpiVTSiVJ04o23PuzfUV/mTW7
	 f3zaZ9IAHfGXsJy+SMq35IMpeKJAkZrCefDcv+18=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77DC0F80496;
	Mon, 20 Feb 2023 12:17:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9376FF8047C; Mon, 20 Feb 2023 12:17:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A46ADF8047C
	for <alsa-devel@alsa-project.org>; Mon, 20 Feb 2023 12:17:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A46ADF8047C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZM7Hdp5Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676891834; x=1708427834;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VsJRm2lzSODecEFJUfZ3q0dGV7Yw8mvC8iNuWfHwosk=;
  b=ZM7Hdp5QATve0iWWDS/lE5rDLv+slmsly0N1iKMamU3hToQyQkHI+3e2
   tnbUnAV4SVVI6m+bHf4m2VLuSl6LaihazcvWUxBnZGYH5txg0eO3B05wm
   mBrNnw7ytaMmkrAevC3lLVpJ1liyBB+gtrR948RHq2tI8asLQ53ed2/Tj
   V/EY68pfAq8R5EFsj+J+HwrCCTg60zktDzuIiMkkjb4xO4mAANkO629/I
   jKyMY3DRfDchfh5EVmNvSD2AmydIFD3tgFK0PQphPxY91zwaqoG5RP4+6
   HXu8TnIAqAa7TE/f53E7SmqDM3B8U3pWJU7yUGwOFd0a8AOXNRnat91UK
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="333739472"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000";
   d="scan'208";a="333739472"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2023 03:16:58 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="795150943"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000";
   d="scan'208";a="795150943"
Received: from mmocanu-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.214.33])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2023 03:16:55 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: stable@vger.kernel.org
Subject: [PATCH BACKPORT 5.10,
 5.15] ASoC: SOF: Intel: hda-dai: fix possible stream_tag leak
Date: Mon, 20 Feb 2023 13:17:10 +0200
Message-Id: <20230220111710.32438-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: S3XZI7CFTP7HCQCSJECZ5GPFW6W2XY4N
X-Message-ID-Hash: S3XZI7CFTP7HCQCSJECZ5GPFW6W2XY4N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S3XZI7CFTP7HCQCSJECZ5GPFW6W2XY4N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

[ Upstream commit 1f810d2b6b2fbdc5279644d8b2c140b1f7c9d43d ]

There were just too many code changes since 5.10/5.15 stable to prevent
clean picking the fix from mainline.

The HDaudio stream allocation is done first, and in a second step the
LOSIDV parameter is programmed for the multi-link used by a codec.

This leads to a possible stream_tag leak, e.g. if a DisplayAudio link
is not used. This would happen when a non-Intel graphics card is used
and userspace unconditionally uses the Intel Display Audio PCMs without
checking if they are connected to a receiver with jack controls.

We should first check that there is a valid multi-link entry to
configure before allocating a stream_tag. This change aligns the
dma_assign and dma_cleanup phases.

Cc: stable@vger.kernel.org # 5.15.x 5.10.x
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
index de80f1b3d7f2..a6275cc92a40 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -212,6 +212,10 @@ static int hda_link_hw_params(struct snd_pcm_substream *substream,
 	int stream_tag;
 	int ret;
 
+	link = snd_hdac_ext_bus_get_link(bus, codec_dai->component->name);
+	if (!link)
+		return -EINVAL;
+
 	/* get stored dma data if resuming from system suspend */
 	link_dev = snd_soc_dai_get_dma_data(dai, substream);
 	if (!link_dev) {
@@ -232,10 +236,6 @@ static int hda_link_hw_params(struct snd_pcm_substream *substream,
 	if (ret < 0)
 		return ret;
 
-	link = snd_hdac_ext_bus_get_link(bus, codec_dai->component->name);
-	if (!link)
-		return -EINVAL;
-
 	/* set the hdac_stream in the codec dai */
 	snd_soc_dai_set_stream(codec_dai, hdac_stream(link_dev), substream->stream);
 
-- 
2.39.2

