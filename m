Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCF584E5DD
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Feb 2024 18:01:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CBCEE9F;
	Thu,  8 Feb 2024 18:01:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CBCEE9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707411713;
	bh=Q3kKBT2OCE5WYq141Fdi7TsGKTc9+dGxIYt5YbVnmB0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K5ZRY12YLdvPpBne+f9gVLZaPLxWehsFl1Sw8AeB6ZArat3Eyn4atSLaAQ19v6/GA
	 0y5jLnUjHM4MsvL9QzW/kRsYyRORxf5pUICKt8WC6lLIue4ij8vF39t3mTx4NWvBwY
	 /twXbWfUT9d3KWuS/k5qTTlpUadhWpskNi6bpUhU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 329D5F8060A; Thu,  8 Feb 2024 17:57:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15A0DF80CB8;
	Thu,  8 Feb 2024 17:57:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC64AF806A0; Thu,  8 Feb 2024 17:56:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F27D7F805E6
	for <alsa-devel@alsa-project.org>; Thu,  8 Feb 2024 17:56:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F27D7F805E6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=PbTrNDhc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707411375; x=1738947375;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q3kKBT2OCE5WYq141Fdi7TsGKTc9+dGxIYt5YbVnmB0=;
  b=PbTrNDhc0ovcIuHEMcUsL0Ccat0c5c7aQmwT7N3gqxs+0xnf3HNbHImQ
   4JUAyiDg9C8ssdZ+/K52/gPeOPfGjdFJ0g/dBWKGwhdEv42EYxM78B5WD
   O8WQFJpmO987gN3Fm/UxVTxbIg2xqBZeaDb/sErzWk+8pnzVz1yyzde2C
   DC+1OxeHblRyING+LjqYgfXJmMnL9EacKwylX68p0w7rlkFFJECjlZ4Lm
   mDCDgptfGI9bS0lrkk880XCJI3BelY4UIsBbN/GCuY6uX8SdvXIuIU+LG
   p5lI6eg+Q3/5fTKCZdPDeDJ0788TayELcgLlpu11dM9+knn7VTpBMb4Fu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395675428"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="395675428"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:56:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="1690275"
Received: from stang1-mobl1.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.212.92.130])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:56:05 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 20/24] ASoC: Intel: ssp-common: Add stub for
 sof_ssp_get_codec_name
Date: Thu,  8 Feb 2024 10:55:41 -0600
Message-Id: <20240208165545.93811-21-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
References: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IVXDZPIZPU7DLXAF57ZG7DXONNC5EF7C
X-Message-ID-Hash: IVXDZPIZPU7DLXAF57ZG7DXONNC5EF7C
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IVXDZPIZPU7DLXAF57ZG7DXONNC5EF7C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

As this function is now used in sof_board_helpers it requires a build
stub for the case SSP_COMMON is not built in.

Fixes: ba0c7c328762 ("ASoC: Intel: board_helpers: support amp link initialization")
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_ssp_common.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/intel/boards/sof_ssp_common.h b/sound/soc/intel/boards/sof_ssp_common.h
index 6d827103479b..d24888bc99fd 100644
--- a/sound/soc/intel/boards/sof_ssp_common.h
+++ b/sound/soc/intel/boards/sof_ssp_common.h
@@ -67,6 +67,14 @@ enum sof_ssp_codec {
 
 enum sof_ssp_codec sof_ssp_detect_codec_type(struct device *dev);
 enum sof_ssp_codec sof_ssp_detect_amp_type(struct device *dev);
+
+#if IS_ENABLED(CONFIG_SND_SOC_INTEL_SOF_SSP_COMMON)
 const char *sof_ssp_get_codec_name(enum sof_ssp_codec codec_type);
+#else
+static inline const char *sof_ssp_get_codec_name(enum sof_ssp_codec codec_type)
+{
+	return NULL;
+}
+#endif
 
 #endif /* __SOF_SSP_COMMON_H */
-- 
2.40.1

