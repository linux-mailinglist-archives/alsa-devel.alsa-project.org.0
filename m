Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 129667FA50B
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 16:43:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D70FECD;
	Mon, 27 Nov 2023 16:43:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D70FECD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701099819;
	bh=GNdzKNeZPXBqxHIpXNRJBlZad9ZUikVKFXQgyY2nhUU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iybUeiuQJzFKZhL6q3McfUGj4LsP5CTX1U4RrhugacEZ4UACQ1GGbY68K/l2o5vVx
	 3C5O0xtvJtuGqyEES+xN3W7fh+CnjQgCW7ctK9tyy95+WZMiyD+HuWEH9jynRUs1it
	 Iec3Zq7NO9hMgE9bL1Bo0jV9Z0jMtfbEmIJtjoPY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25717F897C5; Mon, 27 Nov 2023 16:36:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D757F897BF;
	Mon, 27 Nov 2023 16:36:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C4F2F805FD; Mon, 27 Nov 2023 16:36:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7769EF8007E
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 16:35:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7769EF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=W5HV3NUI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099325; x=1732635325;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GNdzKNeZPXBqxHIpXNRJBlZad9ZUikVKFXQgyY2nhUU=;
  b=W5HV3NUIFNJT2hTd4boWuK3vXxouzDmC6j5mmehw87LX9nj4VvJt7fC9
   nINvHQt/GR9ZPlUV+6oHhhltftbuy983p2vMjKZQpvozMAvl/tYfdLbo/
   JZv1QMJEqEfRY9J2KJwpl0/mDxpo0XojhCP7uIVWilUvhj3AO6xGCDH3m
   6qCz8xMuB23rGbJIBHUsyyB8pZspGOFfSt7T5IwnnP3Y4aqvp/cwgJQwo
   0azu90Jvgxe5kx3wwXbUx48FVZYH1OtmVJ1lm5pf6myfj5p3maA8qXES0
   laQh8qwgviRDFXsdcTHQO1VcID4sgVasjXedenzQNWBCL8OjSFP4ZZGRo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894416"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="372894416"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:26:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771956363"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="771956363"
Received: from acornagl-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:26:33 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	chao.song@linux.intel.com
Subject: [PATCH 05/27] ASoC: Intel: ssp-common: get codec name function
Date: Mon, 27 Nov 2023 17:26:32 +0200
Message-ID: <20231127152654.28204-6-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
References: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RSJZGLXHVDZIJ76ATQBIMBXCBWWGVF45
X-Message-ID-Hash: RSJZGLXHVDZIJ76ATQBIMBXCBWWGVF45
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RSJZGLXHVDZIJ76ATQBIMBXCBWWGVF45/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Add a helper function to get codec name string from codec type enum
value.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_ssp_common.c | 21 +++++++++++++++++++++
 sound/soc/intel/boards/sof_ssp_common.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/sound/soc/intel/boards/sof_ssp_common.c b/sound/soc/intel/boards/sof_ssp_common.c
index 41a258e45a61..96072790e9c0 100644
--- a/sound/soc/intel/boards/sof_ssp_common.c
+++ b/sound/soc/intel/boards/sof_ssp_common.c
@@ -96,6 +96,27 @@ enum sof_ssp_codec sof_ssp_detect_amp_type(struct device *dev)
 }
 EXPORT_SYMBOL_NS(sof_ssp_detect_amp_type, SND_SOC_INTEL_SOF_SSP_COMMON);
 
+const char *sof_ssp_get_codec_name(enum sof_ssp_codec codec_type)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(codecs); i++) {
+		if (codecs[i].codec_type != codec_type)
+			continue;
+
+		return codecs[i].name;
+	}
+	for (i = 0; i < ARRAY_SIZE(amps); i++) {
+		if (amps[i].codec_type != codec_type)
+			continue;
+
+		return amps[i].name;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_NS(sof_ssp_get_codec_name, SND_SOC_INTEL_SOF_SSP_COMMON);
+
 MODULE_DESCRIPTION("ASoC Intel SOF Common Machine Driver Helpers");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/boards/sof_ssp_common.h b/sound/soc/intel/boards/sof_ssp_common.h
index e3fd6fb1db1c..6d827103479b 100644
--- a/sound/soc/intel/boards/sof_ssp_common.h
+++ b/sound/soc/intel/boards/sof_ssp_common.h
@@ -67,5 +67,6 @@ enum sof_ssp_codec {
 
 enum sof_ssp_codec sof_ssp_detect_codec_type(struct device *dev);
 enum sof_ssp_codec sof_ssp_detect_amp_type(struct device *dev);
+const char *sof_ssp_get_codec_name(enum sof_ssp_codec codec_type);
 
 #endif /* __SOF_SSP_COMMON_H */
-- 
2.43.0

