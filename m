Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A336B7813
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 13:52:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15A6B148C;
	Mon, 13 Mar 2023 13:52:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15A6B148C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678711976;
	bh=qJo5MhpgsmGDPF2tjW9mvQZ9RC5uM0oc27yPH9wTeno=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dGX1SqVcqfS4lF2I7ABec8I9R+jjE3DU7ajBSvGJWwIcVITj2Bi2w5Q2MLKxu0fXW
	 XQFOWwC1TH+EYPOfdGdbMrmHDDCgS/hDcu5UHZvHkq0Lo0ekKjVvNH4zcaDflH/MwR
	 bYnjrXRm9F82Ah6A6xwJn20J+xmoXV+EbrxeXKrs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04C01F805A0;
	Mon, 13 Mar 2023 13:49:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D69F5F8057E; Mon, 13 Mar 2023 13:49:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D545F80568
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 13:49:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D545F80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Jo0BUu+t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678711778; x=1710247778;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qJo5MhpgsmGDPF2tjW9mvQZ9RC5uM0oc27yPH9wTeno=;
  b=Jo0BUu+tIF0WQaTmzZ2DIzJTYPicxKCLIYd5dbV4cI0QSFg8yuMzfJ2y
   u8+eHQn6sT7cATbaiPyfXlcYb3FhTDxFytp2Goa6wa+UjueMFYmsp113O
   Cq71J0eot0Rgkr8dR23OKPAUSHqyBF1lGebCHUY+0/HwyC3pbtKnfxkDJ
   q+kbUpnaFrqM0taLwu2d8x7/FV52vVl3Q8FAlfO3qC7cM5UoNyYJ5vgNg
   1MUU9NG4eGqzZ+CZg0rGUEnWtmEUwhvBfPKHdFae3SOvqyGmF3snltHyg
   KmaS69agcUBI0Y+g6t9y3u3+6Gi9KHucfENg+04ip3USOXMDKNRg6knH5
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="399728142"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400";
   d="scan'208";a="399728142"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 05:49:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="711116547"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400";
   d="scan'208";a="711116547"
Received: from tchambon-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.43.68])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 05:49:03 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 11/11] ASoC: SOF: ipc4-topology: Search only pin 0 formats
Date: Mon, 13 Mar 2023 14:48:56 +0200
Message-Id: <20230313124856.8140-12-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313124856.8140-1-peter.ujfalusi@linux.intel.com>
References: <20230313124856.8140-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZJB3LP5ZWB65BVHKXROT7RS7F3LCT44P
X-Message-ID-Hash: ZJB3LP5ZWB65BVHKXROT7RS7F3LCT44P
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZJB3LP5ZWB65BVHKXROT7RS7F3LCT44P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Base config only contains the input/output audio formats for pin 0. So
match only the pin 0 formats during runtime format selection.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index c91a90dd8a6e..683182e53a32 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -877,12 +877,15 @@ static int sof_ipc4_init_audio_fmt(struct snd_sof_dev *sdev,
 	}
 
 	/*
-	 * Search supported audio formats to match rate, channels ,and
+	 * Search supported audio formats with pin index 0 to match rate, channels ,and
 	 * sample_valid_bytes from runtime params
 	 */
 	for (i = 0; i < pin_fmts_size; i++) {
 		struct sof_ipc4_audio_format *fmt = &pin_fmts[i].audio_fmt;
 
+		if (pin_fmts[i].pin_index)
+			continue;
+
 		rate = fmt->sampling_frequency;
 		channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(fmt->fmt_cfg);
 		valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(fmt->fmt_cfg);
-- 
2.39.2

