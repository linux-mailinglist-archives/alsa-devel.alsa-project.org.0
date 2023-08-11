Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C2277954F
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Aug 2023 18:54:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50EB183A;
	Fri, 11 Aug 2023 18:53:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50EB183A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691772880;
	bh=N3yofAoikWdXEKnZoR/6aUXSzneVygpzbhr2X4MlXxI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uVkwAXtDZJuG9MfyihtoXAi9hnQhtMHOBOKFfXRYV58P7ZIUTn3J5wpMVX30yZW4o
	 efnA6+Ukv2D6Hkdy4PNN8kuEUBssgsm+P0++wykn8HI8SSkDOFCylFCpXqvt9nsI/G
	 Mbe5LMbLOd1+bgAhX7pHKiquh1okSdXJulA2CysY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B1EAF80564; Fri, 11 Aug 2023 18:50:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E19AF801EB;
	Fri, 11 Aug 2023 18:50:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D84E2F8016E; Fri, 11 Aug 2023 18:50:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DBBA7F805AB
	for <alsa-devel@alsa-project.org>; Fri, 11 Aug 2023 18:49:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBBA7F805AB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=c4O7ZPMH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691772587; x=1723308587;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=N3yofAoikWdXEKnZoR/6aUXSzneVygpzbhr2X4MlXxI=;
  b=c4O7ZPMH9rynt1Pl8MHLnbvrOvD1cxuRByont5DrZL2AFYr4ZPWLjbHq
   p6eh0TWjVI6/aEEbRvYmFKhBUWzh54tPZwPf+Yh9vaZCac5+OUKlpCRDJ
   HM3ITJARvKJb1oz0TGmw7wKzl8Ls98+J/HKQfWkXYQiw5+T/Jypsxk/cu
   1oxiZ4blN4sdL5Yorsww8Tfg5vfPuomquaAPGxkk8rlyQ13D9yCE+zowB
   EVt7c+T74ACYQ0MJhfUX+Rr2rRl2C5bH9VpBoRsuJC3kOxJas+Vsp+aa/
   VWid7FRYojwQ5GKJnp3D2mqawLKpyOUxTx/ttjxpIXJxqSGxUXJrwwkPW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="371725117"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200";
   d="scan'208";a="371725117"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 09:49:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="846842815"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200";
   d="scan'208";a="846842815"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmsmga002.fm.intel.com with ESMTP; 11 Aug 2023 09:49:28 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [RFC PATCH 10/17] ASoC: codecs: hdac_hda: Switch to new stream-format
 interface
Date: Fri, 11 Aug 2023 18:48:46 +0200
Message-Id: <20230811164853.1797547-11-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230811164853.1797547-1-cezary.rojewski@intel.com>
References: <20230811164853.1797547-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QQMMQIDWEGJFYFWYJH5NFKAQJTDNUQIB
X-Message-ID-Hash: QQMMQIDWEGJFYFWYJH5NFKAQJTDNUQIB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QQMMQIDWEGJFYFWYJH5NFKAQJTDNUQIB/>
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

