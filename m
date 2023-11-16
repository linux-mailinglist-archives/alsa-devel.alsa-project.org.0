Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DFD7EDFC7
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Nov 2023 12:26:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3692EE10;
	Thu, 16 Nov 2023 12:25:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3692EE10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700133999;
	bh=pZ8KkWlAC5FQ4sDN25COBS7V2ofaqlPLtHROUYObzCc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PRUE/XxkO6/8vbgBX6eVSL8gFVO1iJAnZxpwbw6wD6z8frTLcm+JfGurYh/RpO9jQ
	 dBILjZblfBcGVrzesT+fUU5lW2R1uSCxhQMW8Kc0EESB3dGafh9Bft9dDz57PRev+N
	 FO05LTBE/lP1QRCfAp/MY7cmuznfWzXQfD9r/iSE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FA99F805FB; Thu, 16 Nov 2023 12:22:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A4E3F80166;
	Thu, 16 Nov 2023 12:22:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 900E9F805F6; Thu, 16 Nov 2023 12:22:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 52B53F80557
	for <alsa-devel@alsa-project.org>; Thu, 16 Nov 2023 12:22:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52B53F80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=euxEYWrR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700133761; x=1731669761;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pZ8KkWlAC5FQ4sDN25COBS7V2ofaqlPLtHROUYObzCc=;
  b=euxEYWrRsmHc7mrvLMQnb2MtMgaemLh/qh30lcgJ0yWcpU71ixWwYXRk
   Wu+TLu9yAgK8OfDXCLhgmvCsMQil7WXFWTH1KOrSXhdMSD6B2GPfGiH/1
   Uv90jQfWMDN+UEJ+CWjP6rWrMX4R2S9PkdhSE2ihIryCfqkrXjQUyvTEm
   lvbxaOpTOhH7DoaM/ehqK0+ejZ4d4WA1Nn0f9IscyUfjrzNPp4KscuIQi
   QhlGlfu+fi6VIm1FeuZ7M9k4dYQfI4gopDz0u52dpyQWR/x297uaR+glS
   SdAerPUMyKb3hmG+NPchs6tJbpwMSwg4+wGirO6Ra6o7PjkUV9ecfPLsD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="457562087"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600";
   d="scan'208";a="457562087"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 03:22:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,308,1694761200";
   d="scan'208";a="6698275"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa002.fm.intel.com with ESMTP; 16 Nov 2023 03:22:15 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v4 16/16] ASoC: Intel: avs: Unhardcode HDAudio BE DAI drivers
 description
Date: Thu, 16 Nov 2023 12:22:55 +0100
Message-Id: <20231116112255.1584795-17-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231116112255.1584795-1-cezary.rojewski@intel.com>
References: <20231116112255.1584795-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FZWQYBV2ANS5TTOBJGF5W47NUVM24RG4
X-Message-ID-Hash: FZWQYBV2ANS5TTOBJGF5W47NUVM24RG4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FZWQYBV2ANS5TTOBJGF5W47NUVM24RG4/>
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

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 73f0fadb97b9..3e2c3f2f1d38 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -17,6 +17,7 @@
 #include "avs.h"
 #include "path.h"
 #include "topology.h"
+#include "../../codecs/hda.h"
 
 struct avs_dma_data {
 	struct avs_tplg_path_template *template;
@@ -1406,6 +1407,15 @@ static int avs_component_hda_probe(struct snd_soc_component *component)
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
@@ -1416,6 +1426,15 @@ static int avs_component_hda_probe(struct snd_soc_component *component)
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

