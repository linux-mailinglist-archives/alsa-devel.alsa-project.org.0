Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7224779548
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Aug 2023 18:53:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E015EA4E;
	Fri, 11 Aug 2023 18:52:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E015EA4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691772806;
	bh=oXNLjSee4DXdSlPgoebhwYoSs79LeGTgbfhAdHTL5yk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RUeplNJP0cRIzFd4/C/TTvHHtyVgC0yjj1MysVjSSkP5qXD3Asj7aXhJ/FwU+iJj+
	 tH8XNdg/VpctO46hS6FGIFI0h2Bg7Xbz8nr4L7+BcnnHSR0+kjBwtbkxCkAXCBbucJ
	 LwmXSmuV86CzcVAGFrrK5WrhOWkZFzeIdbKlld9M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B36BDF805F4; Fri, 11 Aug 2023 18:50:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96518F805F3;
	Fri, 11 Aug 2023 18:50:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80C8EF805C0; Fri, 11 Aug 2023 18:49:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 00540F805BB
	for <alsa-devel@alsa-project.org>; Fri, 11 Aug 2023 18:49:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00540F805BB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VH9J5S9w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691772589; x=1723308589;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oXNLjSee4DXdSlPgoebhwYoSs79LeGTgbfhAdHTL5yk=;
  b=VH9J5S9wiZe2F7u21BYsQBXSvl4bFGHIrW2fxr/+hH7y3T/9sV7u8t//
   bmBErl3BsDqkMVOBKw65j0bQ0+xS9/n/yKEt8rjVB7uhPnHJO4pGP/u2S
   RQdVpJqi/57w7v/3PrIicB4CMeLblW2t2AVkrQ0oVjEKuDyzZC6HgqIRR
   oGriLQ6llWVSzfvCly5iMudoUzo1L6n6M+WtrEAiMAYAJZPJp0ONPkZu0
   iYr8ZnjHHFBKpYVFG/BmgOTYPWqaj0u2jGIjgNZ3h03wknfGkWmb5VjIZ
   HHNJAjk0HfuWZcZXfz9oNqqjAWJMm1IL5gqJYBDlp0Xc9bsIFtTpsbLVW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="371725146"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200";
   d="scan'208";a="371725146"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 09:49:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="846842841"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200";
   d="scan'208";a="846842841"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmsmga002.fm.intel.com with ESMTP; 11 Aug 2023 09:49:37 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [RFC PATCH 13/17] ASoC: SOF: Intel: Switch to new stream-format
 interface
Date: Fri, 11 Aug 2023 18:48:49 +0200
Message-Id: <20230811164853.1797547-14-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230811164853.1797547-1-cezary.rojewski@intel.com>
References: <20230811164853.1797547-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5WTOYEDVVQKKF6R43GD7JGTU2GCSEO6Y
X-Message-ID-Hash: 5WTOYEDVVQKKF6R43GD7JGTU2GCSEO6Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5WTOYEDVVQKKF6R43GD7JGTU2GCSEO6Y/>
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
 sound/soc/sof/intel/hda-dai-ops.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai-ops.c b/sound/soc/sof/intel/hda-dai-ops.c
index f3513796c189..00703999e91b 100644
--- a/sound/soc/sof/intel/hda-dai-ops.c
+++ b/sound/soc/sof/intel/hda-dai-ops.c
@@ -194,14 +194,15 @@ static unsigned int hda_calc_stream_format(struct snd_sof_dev *sdev,
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	unsigned int link_bps;
 	unsigned int format_val;
+	unsigned int bps;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 		link_bps = codec_dai->driver->playback.sig_bits;
 	else
 		link_bps = codec_dai->driver->capture.sig_bits;
+	bps = snd_hdac_stream_format_bps(params_format(params), SNDRV_PCM_SUBFORMAT_STD, link_bps);
 
-	format_val = snd_hdac_calc_stream_format(params_rate(params), params_channels(params),
-						 params_format(params), link_bps, 0);
+	format_val = snd_hdac_stream_format(params_channels(params), bps, params_rate(params));
 
 	dev_dbg(sdev->dev, "format_val=%#x, rate=%d, ch=%d, format=%d\n", format_val,
 		params_rate(params), params_channels(params), params_format(params));
-- 
2.25.1

