Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E5E8D0E3F
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2024 21:38:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27739B76;
	Mon, 27 May 2024 21:38:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27739B76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716838703;
	bh=Mbv5Pp+x3KBmrpNjxUEHHJN4Ju5oASOGYV2/ps+Ec/k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=L9/ppYEYVqYp9uB+qjtRVHnKJMLbehsnNm2hi8DTPsDBDuFuxxPYUy3DaCD+pDlPv
	 oM7bluGl3tuKcv/ESaHpPW7lNUOiqQy8U3MNFnIaJTvsFVraAOXiSVwnKgxSAPI/ad
	 yq9NY34Y/e8Q279ucF5E2+c4mz6gqajiqqaFH7Ng=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECA00F8068C; Mon, 27 May 2024 21:36:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F415F80682;
	Mon, 27 May 2024 21:36:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22800F805FF; Mon, 27 May 2024 21:36:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A018BF8051D
	for <alsa-devel@alsa-project.org>; Mon, 27 May 2024 21:36:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A018BF8051D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jfIvfXxy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716838582; x=1748374582;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Mbv5Pp+x3KBmrpNjxUEHHJN4Ju5oASOGYV2/ps+Ec/k=;
  b=jfIvfXxyeKxJxSwFQUS0/60Y9Wr9Wk6sQqw8zxaGCAyDZQKzUtQ3Cw4I
   lSXyFO4MkAMry0bFe4z7V+O2898i+M5AcuKHiIpQQUtvJ55nJTpJiKuzz
   9DdB105HsCi8a79xJznv+GZq6cLk4a4Z3dqKI73/nxOlhfUiLy9qP1x30
   h3icnrjSpzY68tKlYzdJz3q7YUJp3l9Lm3+N84kOJA/0WNdZ++b4PD9+T
   8nIiZbAeeAL5fvqDoMUy4rpf7QWFf+ezm0LSE4QH/GfbXfdxfP49KYGbz
   0ELZFs/UKMckJkN6B9TPG3NzRPgqHbSs662w6dO6wx2eDE7bOZImaYsLb
   Q==;
X-CSE-ConnectionGUID: scRUXAjfRVu/S99VQzSNeA==
X-CSE-MsgGUID: hVzEW/MdRIGzlreGwTsSoA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13339360"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000";
   d="scan'208";a="13339360"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 12:36:17 -0700
X-CSE-ConnectionGUID: 1xgFQ/loQvaF+L9zuifpMQ==
X-CSE-MsgGUID: i7UE2F61SVyfigCaYlDlzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000";
   d="scan'208";a="58029772"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 12:36:16 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 10/18] ASoC: Intel: sof_sdw: Add quirks for some new Dell
 laptops
Date: Mon, 27 May 2024 14:35:44 -0500
Message-ID: <20240527193552.165567-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
References: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZHJQUSY7UIKMA62MPOZAKAO7GNBVNPS4
X-Message-ID-Hash: ZHJQUSY7UIKMA62MPOZAKAO7GNBVNPS4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZHJQUSY7UIKMA62MPOZAKAO7GNBVNPS4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Add quirks for some new Dell laptops using Cirrus amplifiers in a bridge
configuration.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 0516ae660824..b646b32dd311 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -505,6 +505,22 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(RT711_JD2),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CE3")
+		},
+		.driver_data = (void *)(SOF_SIDECAR_AMPS),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CE4")
+		},
+		.driver_data = (void *)(SOF_SIDECAR_AMPS),
+	},
 	{}
 };
 
-- 
2.43.0

