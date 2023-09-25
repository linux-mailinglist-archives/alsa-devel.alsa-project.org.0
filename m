Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C70C17AD76A
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Sep 2023 14:02:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEDC2BC0;
	Mon, 25 Sep 2023 14:01:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEDC2BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695643331;
	bh=7IaqF9tqYde7TGQs9NJExhz5C/UJMuSbNyTLxe/uCYo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gOvYkzZ54JsSnJvIEUywh3J/Z5E7P17Pd8YKtuFpJi37qDvHQV3t7RXj5IXCaTFQQ
	 wzl3Mm7/xBgE60piYnvR0vkh43wVi7D+pUVSHgtA+2ntE0xqikBgc4AVlTDMvFgbJH
	 q070ZzP8BEuZaVKJUbZjS+to5bQu5dizvcK4uWhc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1ED41F80578; Mon, 25 Sep 2023 14:00:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E229F80571;
	Mon, 25 Sep 2023 14:00:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A943F8047D; Mon, 25 Sep 2023 14:00:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 62C82F80290
	for <alsa-devel@alsa-project.org>; Mon, 25 Sep 2023 13:59:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62C82F80290
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HdOdjufG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695643173; x=1727179173;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7IaqF9tqYde7TGQs9NJExhz5C/UJMuSbNyTLxe/uCYo=;
  b=HdOdjufGHVxrcEjpC7k8vB3aOpXOLq7OY9mZFrOb+Wzi1+vTzjfrgmP+
   24VfoqnngX6Havrx3id+xCfk0jZoN2SV+Bnj7VnrFCFs/rtuIzzswGf0/
   Wx5eZlwMgy+AQQVPplyeruXV/ylmcDQcOD7DnEbFS2fM3qKyXITE5kXiF
   HKWIQhQRL44rZ7jiYRmXBbNMefqo6cg+NmlWhCKtYbex07awelz9X7UCh
   DWVLc0bMTXdIxTul8oHugLY1z4dGYi5/mbRgZymmuXeFAm39HG2+pCPOf
   5Sc32VdYME341ns9W/UW2tXzfRL/zmNDQciuW85wjXdkIK26cE2g2q8Pv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="383993025"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200";
   d="scan'208";a="383993025"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 04:59:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="813938132"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200";
   d="scan'208";a="813938132"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmsmga008.fm.intel.com with ESMTP; 25 Sep 2023 04:59:27 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 3/4] ASoC: Intel: avs: Use helper to setup HOST stream
Date: Mon, 25 Sep 2023 13:58:43 +0200
Message-Id: <20230925115844.18795-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230925115844.18795-1-cezary.rojewski@intel.com>
References: <20230925115844.18795-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5R6N4GBQKR5GFHK5G32ZYALPNANOINKZ
X-Message-ID-Hash: 5R6N4GBQKR5GFHK5G32ZYALPNANOINKZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5R6N4GBQKR5GFHK5G32ZYALPNANOINKZ/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

snd_hdac_ext_host_stream_setup() abstracts the procedure details away.
Simplify the code by using it.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 8565a530706d..e628fdfdc018 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -625,7 +625,7 @@ static int avs_dai_fe_prepare(struct snd_pcm_substream *substream, struct snd_so
 	if (ret < 0)
 		return ret;
 
-	ret = snd_hdac_stream_setup(hdac_stream(host_stream));
+	ret = snd_hdac_ext_host_stream_setup(host_stream);
 	if (ret < 0)
 		return ret;
 
-- 
2.25.1

