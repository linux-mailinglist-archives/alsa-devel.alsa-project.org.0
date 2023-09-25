Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE72C7AD769
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Sep 2023 14:01:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11E51E74;
	Mon, 25 Sep 2023 14:00:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11E51E74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695643307;
	bh=1udrsUXKWi9M5QA0dgKm3W8B4ZxeJLuI6NUL+L3z7G8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tbRM6giO+aY8omaKjxN4O+qWuyTty/fFhy7QqQEB7d2N+K+KWWmPUsZmZ3OfHbyyj
	 tQZFw3biar5qvMQ8jCKCQF7ulmHOcC9vHFk09nReIpinMS8YJw4yM2iPxuxV+E/WQF
	 Ua4YYn45lwFI74Zct7FIaGsU+CbvOrE23LFlp/0o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF4E9F8055C; Mon, 25 Sep 2023 14:00:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D96CF8047D;
	Mon, 25 Sep 2023 14:00:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4541F80553; Mon, 25 Sep 2023 14:00:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E50AAF8047D
	for <alsa-devel@alsa-project.org>; Mon, 25 Sep 2023 13:59:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E50AAF8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WCjuRFa8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695643175; x=1727179175;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1udrsUXKWi9M5QA0dgKm3W8B4ZxeJLuI6NUL+L3z7G8=;
  b=WCjuRFa8VWU2ckw4jJ70XW2P9oH/dtaepahl+dl3yfXnxFxvH0ZRhImS
   fNATnVqk1qpAOxXeiOJlHnmltu7Y/egkgoUbWB39CkN7/5I/SmM+KyBZF
   Lp/3nXrbLLLatPc9fWVovbTes+XtLAMZq6CAIxquzTOSpI1Fp8hEZ2OrH
   ip9vIqttCX4UEMaiHBq3MBM4D0DRxyst5hvTbWFXF5BD22gjyUCX6ORrN
   RReHX98Ky4TFqtwRnlMVgJv2CL5Dkt7/4+wU7A+F+Du/9tqki7NZUnr1L
   baVwVPPrGrsp/mdcqnfiF5mxdsQLCj3Ft3ZZlqwQEIxJDqSUHdAeKpcx7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="383993033"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200";
   d="scan'208";a="383993033"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 04:59:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="813938145"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200";
   d="scan'208";a="813938145"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmsmga008.fm.intel.com with ESMTP; 25 Sep 2023 04:59:29 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 4/4] ASoC: Intel: Skylake: Use helper to setup HOST stream
Date: Mon, 25 Sep 2023 13:58:44 +0200
Message-Id: <20230925115844.18795-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230925115844.18795-1-cezary.rojewski@intel.com>
References: <20230925115844.18795-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HZHULS73TQSZU6RE66WOPMYGTGB7PYYT
X-Message-ID-Hash: HZHULS73TQSZU6RE66WOPMYGTGB7PYYT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HZHULS73TQSZU6RE66WOPMYGTGB7PYYT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

snd_hdac_ext_host_stream_setup() abstracts the procedure details away.
Simplify the code by using it.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/skl-pcm.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
index ac3dc8c63c26..7502b2e70e46 100644
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -124,7 +124,6 @@ static void skl_set_suspend_active(struct snd_pcm_substream *substream,
 int skl_pcm_host_dma_prepare(struct device *dev, struct skl_pipe_params *params)
 {
 	struct hdac_bus *bus = dev_get_drvdata(dev);
-	struct skl_dev *skl = bus_to_skl(bus);
 	unsigned int format_val;
 	struct hdac_stream *hstream;
 	struct hdac_ext_stream *stream;
@@ -149,18 +148,7 @@ int skl_pcm_host_dma_prepare(struct device *dev, struct skl_pipe_params *params)
 	if (err < 0)
 		return err;
 
-	/*
-	 * The recommended SDxFMT programming sequence for BXT
-	 * platforms is to couple the stream before writing the format
-	 */
-	if (HDA_CONTROLLER_IS_APL(skl->pci)) {
-		snd_hdac_ext_stream_decouple(bus, stream, false);
-		err = snd_hdac_stream_setup(hdac_stream(stream));
-		snd_hdac_ext_stream_decouple(bus, stream, true);
-	} else {
-		err = snd_hdac_stream_setup(hdac_stream(stream));
-	}
-
+	err = snd_hdac_ext_host_stream_setup(stream);
 	if (err < 0)
 		return err;
 
-- 
2.25.1

