Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 868ED6E8233
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Apr 2023 21:57:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12936EEF;
	Wed, 19 Apr 2023 21:56:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12936EEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681934269;
	bh=l2zKgQB9Ff6WxvRTLtB3FKOhE6c8T/vIQDQgz2d7EtY=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=U+ayTn0Iu17VwCgTkZVOBKYY8g3raMvk4IrmXB0gcvsb5dmxr+mSAXTlMpOyumZDD
	 plg2ZRVPogSsWUOTWqjAQJjURJR1jzI3WBOFhcno17j9T6uOWEBb6mgfSmsSpnEoQ1
	 6zGznBmxB4QhVKw76atfuhdVbNyInMr5fE0JUND4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FBEEF80155;
	Wed, 19 Apr 2023 21:56:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C740FF80212; Wed, 19 Apr 2023 21:56:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DCD41F800F8
	for <alsa-devel@alsa-project.org>; Wed, 19 Apr 2023 21:56:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCD41F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HvI+bQrB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681934165; x=1713470165;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l2zKgQB9Ff6WxvRTLtB3FKOhE6c8T/vIQDQgz2d7EtY=;
  b=HvI+bQrBkn3m7sMLxepoxbMM21/HG6P6cEywZ9S23SzstuObXBF6fNs2
   JbqkTPDCAqrcyZJXPrL0AzakbcdagrMwqqRgHInliYN9e1xQGhKPY96im
   MAjALGRNUCiWpW/tMefsFfBLmKlbiFWs6RbUtBLGLNDgSIYOmGHJagn83
   v/0ioe5D1iuzaCGEwI9XuTSJK5sFG73tA9H8vhyiuM9W/oLIBUZ3/fpus
   lykb50Fc0M/jmaBx/Q5zE0M/EJk3ee8Gfk5f77lKCkFOxMafFvh1iDpH/
   /rZHsfshlhHWISYe/hRUkuDpDYCf8CTGFsRzo9U3igogR2wKi7Bo9H6UM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="373434382"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200";
   d="scan'208";a="373434382"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 12:56:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="815728091"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200";
   d="scan'208";a="815728091"
Received: from gargicha-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.74.38])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 12:55:59 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/7] ASoC: Intel: sof_cirrus_common: Guard against missing
 buses
Date: Wed, 19 Apr 2023 14:55:18 -0500
Message-Id: <20230419195524.46995-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230419195524.46995-1-pierre-louis.bossart@linux.intel.com>
References: <20230419195524.46995-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UEYBDCDIP6HC5DP5ENS5KNBJXPYXVFRJ
X-Message-ID-Hash: UEYBDCDIP6HC5DP5ENS5KNBJXPYXVFRJ
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.de, broonie@kernel.org,
 Curtis Malainey <cujomalainey@chromium.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UEYBDCDIP6HC5DP5ENS5KNBJXPYXVFRJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Curtis Malainey <cujomalainey@chromium.org>

Even if we find a acpi device we can still be missing the physical node.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_cirrus_common.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_cirrus_common.c b/sound/soc/intel/boards/sof_cirrus_common.c
index 851c516c8f5b..8b8b07e4f2fe 100644
--- a/sound/soc/intel/boards/sof_cirrus_common.c
+++ b/sound/soc/intel/boards/sof_cirrus_common.c
@@ -168,11 +168,16 @@ static int cs35l41_compute_codec_conf(void)
 			continue;
 		}
 		physdev = get_device(acpi_get_first_physical_node(adev));
+		acpi_dev_put(adev);
+		if (!physdev) {
+			pr_devel("Cannot find physical node for HID %s UID %u (%s)\n", CS35L41_HID,
+					uid, cs35l41_name_prefixes[uid]);
+			return 0;
+		}
 		cs35l41_components[sz].name = dev_name(physdev);
 		cs35l41_components[sz].dai_name = CS35L41_CODEC_DAI;
 		cs35l41_codec_conf[sz].dlc.name = dev_name(physdev);
 		cs35l41_codec_conf[sz].name_prefix = cs35l41_name_prefixes[uid];
-		acpi_dev_put(adev);
 		sz++;
 	}
 
-- 
2.37.2

