Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1541D8D3ED1
	for <lists+alsa-devel@lfdr.de>; Wed, 29 May 2024 21:16:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29DD6950;
	Wed, 29 May 2024 21:15:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29DD6950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717010160;
	bh=2WGXBVBs50TNH9MqDPwVlbQd0d4cA9xeNLapku5f+C0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vZzPDkC2Rbpqw5P1GkP8EV0GSOPzsLnQ20qcv6a5Yyb7M27e8i09ke9MVQHYnJo4Q
	 OkBj6qP2spDGWm1+g/3YPMmcyQPeImNPELhzmxVgpFHNnfwqdehAZnkPS/MPxNeNpf
	 GsHoqkGPuFniCA8IJnzNroCRswgNSYM+Zo6+DOQ8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF3D7F80525; Wed, 29 May 2024 21:15:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8127CF80051;
	Wed, 29 May 2024 21:15:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17402F80149; Wed, 29 May 2024 21:15:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B5D8F80051
	for <alsa-devel@alsa-project.org>; Wed, 29 May 2024 21:15:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B5D8F80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LOyqUT8r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717010104; x=1748546104;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2WGXBVBs50TNH9MqDPwVlbQd0d4cA9xeNLapku5f+C0=;
  b=LOyqUT8r4PdY2boRuz2edEv69PNC7dRKmizhibHk0wFr+DPrEhBnOxFs
   0Ihih6akyKNua177QbfioCfmVUwaW3hcIKh7kBZqZJBhGV4GF19oQ2oIU
   GCyDn92BWBwJlr0iclTml2ZlxT+gqgf+k1UMijacPHZBjFsn92Qo2fmNl
   YXDhCNZkWm6fp84MD6xOqD/QIbs895GzlHmsoUwDqU8ZkJ7qazEyiloLe
   yxM5oLHAKvZildp3CaTqfarqfghCsystePG7cNasX1ICqqYg2CzRf8E5n
   uGdmoeWkEF6Xt+clyeWwhXX8HyRKv2R+Q+9Z2CradbAg8zfVmbQnyETKH
   A==;
X-CSE-ConnectionGUID: ePoDA9dpT5WnerdW67jMKQ==
X-CSE-MsgGUID: hqasNlHVQnSWE9MrnzgZRw==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13212836"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000";
   d="scan'208";a="13212836"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 12:14:58 -0700
X-CSE-ConnectionGUID: 5QmcUxzmRzeRqcynh9Mk7A==
X-CSE-MsgGUID: IvecUSxRQ6eNjXYrbi8Qww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000";
   d="scan'208";a="36163263"
Received: from agluck-desk3.sc.intel.com ([172.25.222.70])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 12:14:57 -0700
From: Tony Luck <tony.luck@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Tony Luck <tony.luck@intel.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH v6 06/49] ASoC: Intel: avs: es8336: Switch to new Intel CPU
 model defines
Date: Wed, 29 May 2024 12:14:50 -0700
Message-ID: <20240529191450.63414-1-tony.luck@intel.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: L2JAYVTS6GOJJQ6RRU3FSWR5ZNMRLIBD
X-Message-ID-Hash: L2JAYVTS6GOJJQ6RRU3FSWR5ZNMRLIBD
X-MailFrom: tony.luck@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L2JAYVTS6GOJJQ6RRU3FSWR5ZNMRLIBD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

New CPU #defines encode vendor and family as well as model.

Signed-off-by: Tony Luck <tony.luck@intel.com>
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Acked-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/avs/boards/es8336.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/avs/boards/es8336.c b/sound/soc/intel/avs/boards/es8336.c
index 3bf37a8fd6e6..c8522e2430f8 100644
--- a/sound/soc/intel/avs/boards/es8336.c
+++ b/sound/soc/intel/avs/boards/es8336.c
@@ -18,7 +18,7 @@
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
-#include <asm/intel-family.h>
+#include <asm/cpu_device_id.h>
 #include "../utils.h"
 
 #define ES8336_CODEC_DAI	"ES8316 HiFi"
@@ -153,9 +153,9 @@ static int avs_es8336_hw_params(struct snd_pcm_substream *substream,
 	int clk_freq;
 	int ret;
 
-	switch (boot_cpu_data.x86_model) {
-	case INTEL_FAM6_KABYLAKE_L:
-	case INTEL_FAM6_KABYLAKE:
+	switch (boot_cpu_data.x86_vfm) {
+	case INTEL_KABYLAKE_L:
+	case INTEL_KABYLAKE:
 		clk_freq = 24000000;
 		break;
 	default:
-- 
2.45.0

