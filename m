Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66ADF785262
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 10:11:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25796A4D;
	Wed, 23 Aug 2023 10:10:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25796A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692778260;
	bh=N3yofAoikWdXEKnZoR/6aUXSzneVygpzbhr2X4MlXxI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A1QxBlQEVVe8t0Bu+3j5pVPRktKlJWL7GFaP+4ELwzaG0GX3i4xN+T8BGnRx9eLYv
	 IgGhvzyvpEp6fKBQ450QCxSIfytBsCLUc7Tw8aaILw1zTsykPdzKcb7/i1540IafrC
	 r34BikAxnZWdRLj8bu5jtBToe1ZeYQSU8AWpN9ZM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5605F805E8; Wed, 23 Aug 2023 10:07:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4085EF805DF;
	Wed, 23 Aug 2023 10:07:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE4F0F80536; Wed, 23 Aug 2023 10:06:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B83CF80022
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 10:06:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B83CF80022
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KHF9elHO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692777991; x=1724313991;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=N3yofAoikWdXEKnZoR/6aUXSzneVygpzbhr2X4MlXxI=;
  b=KHF9elHO4U3EVMR9Vgk4E2ZnBgITk1mbQ1B6dgqoK8V4HZCaOvkqsTss
   LcVH5iPYsReXoJ6+eDNS1Vc73aoL8bPkhZU7vsdmVoImttKN/yvY47LTC
   DIwwA7qwFoU7M3itlq5NW+iRtHxnYxu0DPORzU5nXFxGk/OaSFDX74ih1
   mcVjJEbo4r14JAszuH3bBVzfaUTu+Kbg99KM1AcdHpukWBIBg8F8hw2++
   aXl79bYM6JqDHqI8+46pPu2+nop2gPhRYnl+9Ekf1EjraAyGMBtMSu9j+
   9UoT6Yp4yVy0bswoqTxo2NI7HpHjKzs6GiVDjvjYtOlRU5HZPBtwXLi5F
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="372988106"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200";
   d="scan'208";a="372988106"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 01:06:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="766042736"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200";
   d="scan'208";a="766042736"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orsmga008.jf.intel.com with ESMTP; 23 Aug 2023 01:06:25 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 10/17] ASoC: codecs: hdac_hda: Switch to new stream-format
 interface
Date: Wed, 23 Aug 2023 10:05:39 +0200
Message-Id: <20230823080546.2224713-11-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230823080546.2224713-1-cezary.rojewski@intel.com>
References: <20230823080546.2224713-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DEYIXNQ7Q7T24BODE7FDIIQCNIN27QAB
X-Message-ID-Hash: DEYIXNQ7Q7T24BODE7FDIIQCNIN27QAB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DEYIXNQ7Q7T24BODE7FDIIQCNIN27QAB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To provide option for selecting different bit-per-sample than just the
maximum one, use the new format calculation mechanism.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/hdac_hda.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/hdac_hda.c b/sound/soc/codecs/hdac_hda.c
index be66853afbe2..7e308dac07d4 100644
--- a/sound/soc/codecs/hdac_hda.c
+++ b/sound/soc/codecs/hdac_hda.c
@@ -207,18 +207,16 @@ static int hdac_hda_dai_hw_params(struct snd_pcm_substream *substream,
 	struct hdac_hda_priv *hda_pvt;
 	unsigned int format_val;
 	unsigned int maxbps;
+	unsigned int bps;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 		maxbps = dai->driver->playback.sig_bits;
 	else
 		maxbps = dai->driver->capture.sig_bits;
+	bps = snd_hdac_stream_format_bps(params_format(params), SNDRV_PCM_SUBFORMAT_STD, maxbps);
 
 	hda_pvt = snd_soc_component_get_drvdata(component);
-	format_val = snd_hdac_calc_stream_format(params_rate(params),
-						 params_channels(params),
-						 params_format(params),
-						 maxbps,
-						 0);
+	format_val = snd_hdac_stream_format(params_channels(params), bps, params_rate(params));
 	if (!format_val) {
 		dev_err(dai->dev,
 			"invalid format_val, rate=%d, ch=%d, format=%d, maxbps=%d\n",
-- 
2.25.1

