Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F354E8AAAD5
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Apr 2024 10:48:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B3BD85D;
	Fri, 19 Apr 2024 10:47:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B3BD85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713516481;
	bh=4G3vxx+BVYU/F3fALZo8cptAG+2Ub3U6wxF3IBeuTRA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QwmdV4Febkj552LE8NLW9N/DaAcKzYAMpsLmXy/gB5u4xJRUv4q4xGIOjtueno1l9
	 t63SQetQsUf80w5yh//uePqTZD7pbmUKt9hynN8F+WpKGQgDeIPrQItVaDrOzquW8p
	 t/E4y+dgQsrHi6egJAGE8e0cWJyowqYbEf3aRLkw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94CA7F805B3; Fri, 19 Apr 2024 10:47:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A518BF805D5;
	Fri, 19 Apr 2024 10:47:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BDDAF80423; Fri, 19 Apr 2024 10:45:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 90F5EF80124
	for <alsa-devel@alsa-project.org>; Fri, 19 Apr 2024 10:41:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90F5EF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hJzzaIN+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713516114; x=1745052114;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4G3vxx+BVYU/F3fALZo8cptAG+2Ub3U6wxF3IBeuTRA=;
  b=hJzzaIN+1W2jfe8kHBVUgn1DdGrT159tXKJ42JxaW7JJW3wJECvVkZzk
   e6ZNskG1bXqGLDtVQj/GjABKgZDSuU+nqtdUPvo4yQVb4ZAyfBakvVC3z
   pmj8c8d3ppkzl467Y3ttZuc4dcbNwq/9xplQ6ZS5wf9Y6DAta7+surQB9
   TjzdHgAcl0us7ebAoCLY4QaxN7Blj0hCuR9ZSqac8RwRGiubp32Me3SQi
   RIhiHYDpYzA2pCKsiZcELmGVBIgZu5slhNNDE0LLo6AuJ0p5zq7LXANZg
   G24xnOUmfCg9TUAapyUv2aOVhtLIKBZ9c5VDdfxha2iM0WBZ3QQxSRz8Q
   A==;
X-CSE-ConnectionGUID: z7vUi2b2STuUt3UzQHkXRg==
X-CSE-MsgGUID: w2OTaf6MRrGkP482M5Sh8A==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9233742"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000";
   d="scan'208";a="9233742"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 01:41:49 -0700
X-CSE-ConnectionGUID: HNjlznS0RtSPs0ZmRGaBQw==
X-CSE-MsgGUID: kW2KUOKTTaqGGhmDPyJsUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000";
   d="scan'208";a="23353166"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa008.fm.intel.com with ESMTP; 19 Apr 2024 01:41:46 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	rafael@kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 1/2] ALSA: hda: intel-dsp-config: Switch to ACPI NHLT
Date: Fri, 19 Apr 2024 10:43:06 +0200
Message-Id: <20240419084307.2718881-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240419084307.2718881-1-cezary.rojewski@intel.com>
References: <20240419084307.2718881-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SPMRYPUGJBIDBY5E5XHQGQIRRRTSH2CY
X-Message-ID-Hash: SPMRYPUGJBIDBY5E5XHQGQIRRRTSH2CY
X-MailFrom: cezary.rojewski@intel.com
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

Now that NHLT support in ACPI framework was introduced, migrate
intel-dsp-config driver to new API.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/hda/Kconfig            |  1 +
 sound/hda/intel-dsp-config.c | 16 +++++++++-------
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/sound/hda/Kconfig b/sound/hda/Kconfig
index 741179ccbd4e..e2ac247fc1d4 100644
--- a/sound/hda/Kconfig
+++ b/sound/hda/Kconfig
@@ -42,6 +42,7 @@ config SND_INTEL_NHLT
 
 config SND_INTEL_DSP_CONFIG
 	tristate
+	select ACPI_NHLT if ACPI
 	select SND_INTEL_NHLT if ACPI
 	select SND_INTEL_SOUNDWIRE_ACPI if ACPI
 	# this config should be selected only for Intel DSP platforms.
diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index 6a384b922e4f..ea050805c20f 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -13,6 +13,8 @@
 #include <sound/intel-nhlt.h>
 #include <sound/soc-acpi.h>
 
+#include <acpi/nhlt.h>
+
 static int dsp_driver;
 
 module_param(dsp_driver, int, 0444);
@@ -570,15 +572,15 @@ static const struct config_entry *snd_intel_dsp_find_config
 
 static int snd_intel_dsp_check_dmic(struct pci_dev *pci)
 {
-	struct nhlt_acpi_table *nhlt;
 	int ret = 0;
 
-	nhlt = intel_nhlt_init(&pci->dev);
-	if (nhlt) {
-		if (intel_nhlt_has_endpoint_type(nhlt, NHLT_LINK_DMIC))
-			ret = 1;
-		intel_nhlt_free(nhlt);
-	}
+	acpi_nhlt_get_gbl_table();
+
+	if (acpi_nhlt_find_endpoint(ACPI_NHLT_LINKTYPE_PDM, -1, -1, -1))
+		ret = 1;
+
+	acpi_nhlt_put_gbl_table();
+
 	return ret;
 }
 
-- 
2.25.1

