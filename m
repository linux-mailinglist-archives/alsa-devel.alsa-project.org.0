Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C107EF247
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Nov 2023 13:07:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE1DF93A;
	Fri, 17 Nov 2023 13:06:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE1DF93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700222824;
	bh=W9LamPJC1RMEEWDAPplkZb3wC0HNgD4APppn5ceLiZk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q5I2NxMnrLussEFhjHRKZyxt+wDOHtvlpBWDpy4WTEwHBWWViGNspMlqE8LiuY8gE
	 D8oCrinF+SZ0eEi2LzDFJywhYk+SB8/zgbGuL3nJC3ztNXZBDXrluwluK+IHB5Ugxd
	 OAWOBnjp3RWR/sBB4M14VPRUiOr94lTuoSkUVfB8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7CEBF805CA; Fri, 17 Nov 2023 13:05:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B074F805C0;
	Fri, 17 Nov 2023 13:05:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5FBCF80589; Fri, 17 Nov 2023 13:04:51 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C8C08F80551
	for <alsa-devel@alsa-project.org>; Fri, 17 Nov 2023 13:04:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8C08F80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=GUUvyjwm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700222665; x=1731758665;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W9LamPJC1RMEEWDAPplkZb3wC0HNgD4APppn5ceLiZk=;
  b=GUUvyjwmoo2tnhsMIEu0q8Msk1K9sPlPN+RltbJMX0Ak/PMQcVgO4oll
   nlqAPxy362sfFRLGmDrgGm6iUeNrUIWAxFTwajapdVQ6zQjjZ4NyL3hyO
   zDHZwDN/yuLX3akW9NCrL5EJ/HyunRyYyr+L/gysni5HJuJA/Mj7/I6f3
   ltQtuQhUcWsRkT5wh4svxuvSVCjtClc7JGAauLiKAzhxHUXvGvMSMz3Yh
   /rPznJRbFOg6d++3dbneQcwwtoRd728ur05GLlIEoJJ7aodgIZuPaCe5r
   zACmxwKH4IUluAtACAlE1HYy20/oBZYuMvXgIkKqtz+WS1XRVEnn5JxRA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="381675263"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600";
   d="scan'208";a="381675263"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 04:04:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="883110191"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600";
   d="scan'208";a="883110191"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmsmga002.fm.intel.com with ESMTP; 17 Nov 2023 04:04:20 -0800
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
Subject: [PATCH v5 09/16] ASoC: codecs: hdac_hda: Switch to new stream-format
 interface
Date: Fri, 17 Nov 2023 13:06:03 +0100
Message-Id: <20231117120610.1755254-10-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231117120610.1755254-1-cezary.rojewski@intel.com>
References: <20231117120610.1755254-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YOUV7KMZZHXMQM6SPYOIKYZLHB3TMCDM
X-Message-ID-Hash: YOUV7KMZZHXMQM6SPYOIKYZLHB3TMCDM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YOUV7KMZZHXMQM6SPYOIKYZLHB3TMCDM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To provide option for selecting different bit-per-sample than just the
maximum one, use the new format calculation mechanism.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/hdac_hda.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/hdac_hda.c b/sound/soc/codecs/hdac_hda.c
index 355f30779a34..0c589e46574d 100644
--- a/sound/soc/codecs/hdac_hda.c
+++ b/sound/soc/codecs/hdac_hda.c
@@ -215,18 +215,16 @@ static int hdac_hda_dai_hw_params(struct snd_pcm_substream *substream,
 	struct hdac_hda_priv *hda_pvt;
 	unsigned int format_val;
 	unsigned int maxbps;
+	unsigned int bits;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 		maxbps = dai->driver->playback.sig_bits;
 	else
 		maxbps = dai->driver->capture.sig_bits;
+	bits = snd_hdac_stream_format_bits(params_format(params), SNDRV_PCM_SUBFORMAT_STD, maxbps);
 
 	hda_pvt = snd_soc_component_get_drvdata(component);
-	format_val = snd_hdac_calc_stream_format(params_rate(params),
-						 params_channels(params),
-						 params_format(params),
-						 maxbps,
-						 0);
+	format_val = snd_hdac_stream_format(params_channels(params), bits, params_rate(params));
 	if (!format_val) {
 		dev_err(dai->dev,
 			"invalid format_val, rate=%d, ch=%d, format=%d, maxbps=%d\n",
-- 
2.25.1

