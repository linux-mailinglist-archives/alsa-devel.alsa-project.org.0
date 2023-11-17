Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 101EB7EF256
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Nov 2023 13:09:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F403E89;
	Fri, 17 Nov 2023 13:08:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F403E89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700222951;
	bh=BvEhWbPA4ZujivjGvZkLJDuF6hK9LN01XA/yRQTF5Ak=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Gv8Kh4M+KrmdfTnwmLFekt2z3FM0MQlYGs4ax5/aueYLGg3F0rYmvZ1E3qBwSD4k+
	 X8MX4GdSTXAigs8xatyp09yYIOmRQLDoiYLmL0nMRmkliMH6efOSmEYVkjOB+EpS0z
	 SpvlVszxxBPE/nvlQ1BD/zRyQf9AsOaQe7Y31wXM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08F6BF80610; Fri, 17 Nov 2023 13:05:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CE20F80613;
	Fri, 17 Nov 2023 13:05:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF161F80093; Fri, 17 Nov 2023 13:05:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CED29F80093
	for <alsa-devel@alsa-project.org>; Fri, 17 Nov 2023 13:04:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CED29F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jo9Hc+L9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700222680; x=1731758680;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BvEhWbPA4ZujivjGvZkLJDuF6hK9LN01XA/yRQTF5Ak=;
  b=jo9Hc+L9NaieCEYsvwnqXBy922D/d8QBFH3DQ4nhfAcTU64LLG7NNSMk
   2r8QIznxkhUbfgV2NkhSYev8gbssLsVoZf6oDQs4h8X5GBgihZ9+vgEYP
   uJy5aEpVqYlXr14TTwXSojfb82NrmrRqrXF+ltRF2p4DOTeA+6ymmsrpF
   rbZTG4r/HT2XqhhpvgI7MVH7Cr7IKybQ5C1ElP10ekTlkbTzbzimLkb0P
   /dBtFh2YvGBw0y7ycG0C/yIbGM5pZNADr0QTcbBD7VrQTxBAaZnq4tujF
   Af7q88ELDdBreIGL4zUzJMOTkoyMKE1gOW16a8Z8XFusXwU57+ncsMYhA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="381675322"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600";
   d="scan'208";a="381675322"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 04:04:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="883110232"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600";
   d="scan'208";a="883110232"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmsmga002.fm.intel.com with ESMTP; 17 Nov 2023 04:04:36 -0800
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
Subject: [PATCH v5 16/16] ASoC: Intel: avs: Unhardcode HDAudio BE DAI drivers
 description
Date: Fri, 17 Nov 2023 13:06:10 +0100
Message-Id: <20231117120610.1755254-17-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231117120610.1755254-1-cezary.rojewski@intel.com>
References: <20231117120610.1755254-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JQUJRPHOXPFUMM7BRUR6SQIYNI356DQY
X-Message-ID-Hash: JQUJRPHOXPFUMM7BRUR6SQIYNI356DQY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JQUJRPHOXPFUMM7BRUR6SQIYNI356DQY/>
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
index b6c48f88ca85..4dfc5a1ebb7c 100644
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

