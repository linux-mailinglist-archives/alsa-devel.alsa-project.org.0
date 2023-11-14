Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E7B7EB794
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Nov 2023 21:14:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D98C3E7A;
	Tue, 14 Nov 2023 21:13:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D98C3E7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699992881;
	bh=IOjtcsKNdL6NbfKF/gD4mQRcApsmVibTVg8hBQ9CS4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mYBsh6n0+XrgsXTglNhPcO7DdGfkoDQfaDafurrzKkf0EP1gOWgSD9Fesaq4otdmM
	 tgDbJl7iyhpA3m0LyVcMRuJgiwjpaGkOJC4o5hxy1YZ/XkX/AFGT1yJL4Wagug6828
	 Qf/GUjn5zgus0X2GCMkvaALbJ7zFf32dmXBf0ZIw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3B66F805E3; Tue, 14 Nov 2023 21:12:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EA5BF805D5;
	Tue, 14 Nov 2023 21:12:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A298F805AC; Tue, 14 Nov 2023 21:11:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CE785F8057B
	for <alsa-devel@alsa-project.org>; Tue, 14 Nov 2023 21:11:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE785F8057B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=N0y0bUBn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699992703; x=1731528703;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IOjtcsKNdL6NbfKF/gD4mQRcApsmVibTVg8hBQ9CS4c=;
  b=N0y0bUBnZyJmN1DoA2nWW3aw5WKchVk13CL6SDtZdqUNJbRlbtGcs1+Y
   7eb6PHKJtqEbMCuOB1lfU+CPt6JnicpCIU549vTSIHtDkGyGNfbJZtlpo
   xpjjYqewzLelCw9n4ly4JyFZiUz0Jj8IUlD7FYGG55W6vVMgjKnOrh+KK
   kVyDGLT9sA7JihbClBd7Z7Ph1qm1URHkCXV5Y02DMfL8rNcn4OCBqZqq0
   LIbLP+1adoIKuJfslggjI65/Vjygj6kCM54pgICWAlmKSoGLyCT9HB74I
   Y6rJnZ43TXReUAkR+BgSIcE6rhiV/1eiNS2uPO09glhjRGARKLeIJYBeP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="381134731"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200";
   d="scan'208";a="381134731"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 12:11:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="855422432"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200";
   d="scan'208";a="855422432"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Nov 2023 12:11:36 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 10/16] ASoC: codecs: hdac_hdmi: Switch to new stream-format
 interface
Date: Tue, 14 Nov 2023 21:13:11 +0100
Message-Id: <20231114201317.1348066-11-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231114201317.1348066-1-cezary.rojewski@intel.com>
References: <20231114201317.1348066-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: F7XIUPVXQ7PAY6WZNYBY26N2I5JO2W6U
X-Message-ID-Hash: F7XIUPVXQ7PAY6WZNYBY26N2I5JO2W6U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F7XIUPVXQ7PAY6WZNYBY26N2I5JO2W6U/>
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
 sound/soc/codecs/hdac_hdmi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index 3e4f632d8665..824fb4862f22 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -468,13 +468,14 @@ static int hdac_hdmi_set_hw_params(struct snd_pcm_substream *substream,
 	struct hdac_hdmi_priv *hdmi = snd_soc_dai_get_drvdata(dai);
 	struct hdac_hdmi_dai_port_map *dai_map;
 	struct hdac_hdmi_pcm *pcm;
+	unsigned int bps;
 	int format;
 
 	dai_map = &hdmi->dai_map[dai->id];
 
-	format = snd_hdac_calc_stream_format(params_rate(hparams),
-			params_channels(hparams), params_format(hparams),
-			dai->driver->playback.sig_bits, 0);
+	bps = snd_hdac_stream_format_bps(params_format(hparams), SNDRV_PCM_SUBFORMAT_STD,
+					 dai->driver->playback.sig_bits);
+	format = snd_hdac_stream_format(params_channels(hparams), bps, params_rate(hparams));
 
 	pcm = hdac_hdmi_get_pcm_from_cvt(hdmi, dai_map->cvt);
 	if (!pcm)
-- 
2.25.1

