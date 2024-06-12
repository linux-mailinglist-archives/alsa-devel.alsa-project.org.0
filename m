Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2339F904BE7
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 08:49:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 960DEDEE;
	Wed, 12 Jun 2024 08:49:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 960DEDEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718174953;
	bh=IzSgx2C25j7P87Yss79wU23sCxQ9oZ4wST9PV3CCwTw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NKb+7aicKPV5ny72EFHpwDyaaVztuwcwN78i4mdE2+rO9TKG7ByEQm622y5xVDLrW
	 o12p2wyT0KRxXFGUHwXVsNe0a01Yh//qgiAqtxqF0s2fgqhm5FIb9r/wXJC1epKzHz
	 DBKulcwOICeFASSR990xS8Kh2IiaYlsdZH6UMjIo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0E90F805E0; Wed, 12 Jun 2024 08:48:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 910F9F805C8;
	Wed, 12 Jun 2024 08:48:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72786F80587; Wed, 12 Jun 2024 08:48:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C7813F80580
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 08:47:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7813F80580
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=i+6DI2Kk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718174881; x=1749710881;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IzSgx2C25j7P87Yss79wU23sCxQ9oZ4wST9PV3CCwTw=;
  b=i+6DI2KkRmkzrsdIWHuzHZL7o5svVhh5G/OR29U25OyiZ6vvoPL7AY3K
   zO77SSwN6t0Zx6g43lQWrZkXpmuwA4jb1RUCY9ABWdBjd0xj1Y7CFCzm+
   KaHMuG9LfcxB9Ow8Syv0Miv1gjH8qXN1elmid5Qws+7qriA1AhoYH3oEU
   +OpCInXhlG4un+cYW9AqYv7e2JCtJBeban4Ml9wBwKE0ktAhAT1hb8N22
   jtPfwqTrTjNqYG8regFg5Qa8kK2MCC9MffEnteHVkG0Fpz6HTVovPq8j9
   1jh+u/krbwqJLrVjSmuv5cr7YTvEEv1NROC+e1HIWtbbfYCtd2mYP7j1s
   w==;
X-CSE-ConnectionGUID: bfTiJvPYQ/amwTZxWEVFsA==
X-CSE-MsgGUID: Ic7HUZoHS8qLfuLfXHEkLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="15145914"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000";
   d="scan'208";a="15145914"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 23:47:45 -0700
X-CSE-ConnectionGUID: x6KdkC32Qb+Bl0LoDPrViA==
X-CSE-MsgGUID: UxuUA5PyS6Oo3mafkVf2/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000";
   d="scan'208";a="39751287"
Received: from iklimasz-mobl1.ger.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.245.246.56])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 23:47:42 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 3/3] ALSA: hda: intel-dsp-config: Add PTL support
Date: Wed, 12 Jun 2024 08:47:09 +0200
Message-ID: <20240612064709.51141-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240612064709.51141-1-pierre-louis.bossart@linux.intel.com>
References: <20240612064709.51141-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: M7KKIR7GI2LRANPTCC7FN46DP7F4ZOGO
X-Message-ID-Hash: M7KKIR7GI2LRANPTCC7FN46DP7F4ZOGO
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M7KKIR7GI2LRANPTCC7FN46DP7F4ZOGO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Same recipes as LNL

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/hda/intel-dsp-config.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index 537863447358..a7419d2e912e 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -543,6 +543,15 @@ static const struct config_entry config_table[] = {
 		.device = PCI_DEVICE_ID_INTEL_HDA_LNL_P,
 	},
 #endif
+
+	/* Panther Lake */
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_PANTHERLAKE)
+	{
+		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.device = PCI_DEVICE_ID_INTEL_HDA_PTL,
+	},
+#endif
+
 };
 
 static const struct config_entry *snd_intel_dsp_find_config
-- 
2.43.0

