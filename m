Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 797D5785273
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 10:13:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93B80950;
	Wed, 23 Aug 2023 10:12:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93B80950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692778386;
	bh=gHyPJ3l7zvgqH5EYgzVMSb18tIgvF5ZMBgcOmAps6Nw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kAc2G0O3RDY+6TkwCpgHC7mcyBjHx2KlJT+AIGeYDcD7vQYrXF/yCgGuIua7NLDOo
	 3tBLbIfkyxmhUmrLJFxNbKBCdiErJ3RoYYX7Qkkgyj+o0X7hQPIPPjoP5LoIFz2E0m
	 PaAsDiV05jec13eWcLnVjDf0xMeLy86dW+ZF67pU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38B29F80621; Wed, 23 Aug 2023 10:08:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2EE5F80621;
	Wed, 23 Aug 2023 10:08:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF4D6F80158; Wed, 23 Aug 2023 10:06:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B7274F80022
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 10:06:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7274F80022
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=YXv59FNN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692778006; x=1724314006;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gHyPJ3l7zvgqH5EYgzVMSb18tIgvF5ZMBgcOmAps6Nw=;
  b=YXv59FNN57Ax7lJhuBedikhbw+VjCZTwP0f4HiYuc7aJi/NEXjEOtieN
   k+NCujS1S0NYCzcx80Wbh6dY0pPDZytkLTB+1lDUPCnKyMl+suSR8TLqu
   FsIwl5PDOpg9vyOuchbllclGxHzndDHshg3rkZK+1M2DYTefOfJ7ixoRU
   NQCb/Ho0eDXX7kVaMA/kKvtfWY+EpcBbubrsK1D78/WeLuhUjfwJWooOJ
   cwY0hmR9Cdt340Ds+fBda7ovNRENxv34vf6Bb6X3WePFamZisKqH0MiRr
   d7495zNgeIvwXKb7vv7iCJ/f9/gQSCslyLiFGJ5es15kCnYDdwAa/NKaO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="372988168"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200";
   d="scan'208";a="372988168"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 01:06:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="766042896"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200";
   d="scan'208";a="766042896"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orsmga008.jf.intel.com with ESMTP; 23 Aug 2023 01:06:40 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 17/17] ASoC: Intel: avs: Unhardcode HDAudio BE DAI drivers
 description
Date: Wed, 23 Aug 2023 10:05:46 +0200
Message-Id: <20230823080546.2224713-18-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230823080546.2224713-1-cezary.rojewski@intel.com>
References: <20230823080546.2224713-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NRU4GP66PRBVS6THE72LA6CIZVHF6COR
X-Message-ID-Hash: NRU4GP66PRBVS6THE72LA6CIZVHF6COR
X-MailFrom: cezary.rojewski@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NRU4GP66PRBVS6THE72LA6CIZVHF6COR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To not expose more than in fact is supported by the codec, update CPU
DAI initialization procedure to rely on codec capabilities instead of
hardcoding them. This includes subformat which is currently ignored.

As capabilities for HDMI streams are initialized on PCM open, leave it
as is for now.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 22f897db6fce..895eba3db6f0 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -17,6 +17,7 @@
 #include "avs.h"
 #include "path.h"
 #include "topology.h"
+#include "../../codecs/hda.h"
 
 struct avs_dma_data {
 	struct avs_tplg_path_template *template;
@@ -1378,6 +1379,15 @@ static int avs_component_hda_probe(struct snd_soc_component *component)
 				ret = -ENOMEM;
 				goto exit;
 			}
+
+			if (!hda_codec_is_display(codec)) {
+				dais[i].playback.formats = pcm->stream[0].formats;
+				dais[i].playback.subformats = pcm->stream[0].subformats;
+				dais[i].playback.rates = pcm->stream[0].rates;
+				dais[i].playback.channels_min = pcm->stream[0].channels_min;
+				dais[i].playback.channels_max = pcm->stream[0].channels_max;
+				dais[i].playback.sig_bits = pcm->stream[0].maxbps;
+			}
 		}
 
 		if (pcm->stream[1].substreams) {
@@ -1388,6 +1398,15 @@ static int avs_component_hda_probe(struct snd_soc_component *component)
 				ret = -ENOMEM;
 				goto exit;
 			}
+
+			if (!hda_codec_is_display(codec)) {
+				dais[i].capture.formats = pcm->stream[1].formats;
+				dais[i].capture.subformats = pcm->stream[1].subformats;
+				dais[i].capture.rates = pcm->stream[1].rates;
+				dais[i].capture.channels_min = pcm->stream[1].channels_min;
+				dais[i].capture.channels_max = pcm->stream[1].channels_max;
+				dais[i].capture.sig_bits = pcm->stream[1].maxbps;
+			}
 		}
 
 		dai = snd_soc_register_dai(component, &dais[i], false);
-- 
2.25.1

