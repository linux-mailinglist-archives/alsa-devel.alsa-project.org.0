Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D52EC6999EA
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 17:24:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 044C3EF8;
	Thu, 16 Feb 2023 17:23:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 044C3EF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676564673;
	bh=s9CkybQpi/v8BlayQOGLe5FHCTKCDukWE/bQxvkr+60=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=b5kDeD1jD3MwTX5cSzOoeqmzkR3JdoOPM8Pze+4djuxhwZMMnUpymtF6T6WrCdI9K
	 6AZuTOecUjfP/CErp8RV95aE518z+8pr3K2ggCT9XfwkYC2hx6ZKbnn6bPy+zMXqXc
	 NRvuSVYnWmGT1K1mPYTGsgd5lE6J9wtwBkxiSUl0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D6C6F800B6;
	Thu, 16 Feb 2023 17:23:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D78A3F80171; Thu, 16 Feb 2023 17:23:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 28DC3F800B6
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 17:23:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28DC3F800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Jc2vNcUJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676564615; x=1708100615;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=s9CkybQpi/v8BlayQOGLe5FHCTKCDukWE/bQxvkr+60=;
  b=Jc2vNcUJvkVPJ2/xVhWgR0WEGF+gFayZPrnNoLyQIMZOQ1FKCgU6SrES
   hEe6hf6i6pE1uA8IOXqEK3gcP3w7H1vMceymG3I6DKls4AMsigogpbzeJ
   AzfuuasQDwsSJMAXgleB2cy5ELFuY5IBbgKeoqSvZxwpMuYHaVC8ayga5
   PbdYPx88Ld12EHh+QPgOKnKgQJDPLkJtEZ+3kKv3tjUdDGTWudSfsiINA
   y/1Bg10dBBMLwraT6hCHmrNu02GN6vF8FWhTLwvdYo1h3lCz0Y9aFl5Lu
   z0tkY/V+zGxI1Z62MLAblsC6AXrVIfzB8+bJuN75GNnQXeXdwtk5kx041
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="331757227"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000";
   d="scan'208";a="331757227"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 08:23:29 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="738900967"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000";
   d="scan'208";a="738900967"
Received: from sbadria-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.18.21])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 08:23:27 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2] ASoC: SOF: Intel: hda-dai: fix possible stream_tag leak
Date: Thu, 16 Feb 2023 18:23:40 +0200
Message-Id: <20230216162340.19480-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4RIXSTD2I2PNZ5RN6S7TFMHTZSBIMIRB
X-Message-ID-Hash: 4RIXSTD2I2PNZ5RN6S7TFMHTZSBIMIRB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4RIXSTD2I2PNZ5RN6S7TFMHTZSBIMIRB/>
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

Complements: b0cd60f3e9f5 ("ALSA/ASoC: hda: clarify bus_get_link() and bus_link_get() helpers")
Link: https://github.com/thesofproject/linux/issues/4151
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
Hi Mark,

I have added a Complements tag for now to force it follow the rename patch.
I need to check how far this needs to go back and I will send a backported
version later on.

b0cd60f3e9f5 is in 6.2-rc

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

