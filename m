Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26648753919
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jul 2023 12:59:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69C6AE88;
	Fri, 14 Jul 2023 12:58:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69C6AE88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689332348;
	bh=s7A7UshZnQEGaR97JLBqMpbiEE9phIPybyuk0Y8+oQg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rmSuj8Oq9Q0JOx+f1zPWTTe+vKqdulZ6C5/e+N/qbvNuY7ziKH9mMOXob+TIaIfjn
	 VgLdP9vNNjR9LwLNl8AhM8V9+l6mjcf+Ht3EHAa3Ub7YIL568vDJJDCTzWSe3FNvMe
	 +0rzeAJTOlADGMOg6oFqhCU3hIJJlkslEwGK17Lc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4972F805E9; Fri, 14 Jul 2023 12:56:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 567E9F805E0;
	Fri, 14 Jul 2023 12:56:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 067FDF805AA; Fri, 14 Jul 2023 12:55:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DATE_IN_FUTURE_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 16E20F800E4
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 12:55:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16E20F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=e82D9Wf5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689332125; x=1720868125;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s7A7UshZnQEGaR97JLBqMpbiEE9phIPybyuk0Y8+oQg=;
  b=e82D9Wf51LXYtOmC/RwY7i7zI3B32PaPpSXXAIR0K3V/6XU/tr2VUgyg
   F9GJv6292PEy9r1QxYii0i+oR+MI+irN1GtiE+Z44uasjbZxe8UWkAscb
   YzxMDdOXt5QwuX5qZQt84cjEInb2fIOS64oTEPp9sacsSIHxtNTetdpJ4
   QvjdVxy8cyk+GOSShB3nnLvZcWHjKOfSxBJnkOgCEVQp1Ghlpx3D7u7Yw
   9+JNYRwp4GmAasFBabjJIp0+fONTJycbTsRtwLlw2TE7ove7iYZV8v0rZ
   GC93BdAu8aEXJQp2S3pYurfcLieYSWNRf0H1pCsjPp96923aL9UzH4MQ6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="364321181"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="364321181"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 03:55:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="722365495"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="722365495"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orsmga002.jf.intel.com with ESMTP; 14 Jul 2023 03:55:20 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 07/15] ALSA: hda/i915:  Use global PCI match macro
Date: Fri, 14 Jul 2023 20:56:07 +0200
Message-Id: <20230714185615.370597-8-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230714185615.370597-1-amadeuszx.slawinski@linux.intel.com>
References: <20230714185615.370597-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PJ67BJRWUQQRNLICGCMHLTF4P7BSKHPA
X-Message-ID-Hash: PJ67BJRWUQQRNLICGCMHLTF4P7BSKHPA
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PJ67BJRWUQQRNLICGCMHLTF4P7BSKHPA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Instead of using local macro to match PCI device, use global one.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 include/linux/pci_ids.h | 1 -
 sound/hda/hdac_i915.c   | 7 +------
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index eb0b3ad64246..d4392f7c51a1 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -2718,7 +2718,6 @@
 #define PCI_DEVICE_ID_INTEL_82840_HB	0x1a21
 #define PCI_DEVICE_ID_INTEL_82845_HB	0x1a30
 #define PCI_DEVICE_ID_INTEL_IOAT	0x1a38
-#define PCI_DEVICE_ID_INTEL_HDA_APL_T	0x1a98
 #define PCI_DEVICE_ID_INTEL_HDA_CPT	0x1c20
 #define PCI_DEVICE_ID_INTEL_COUGARPOINT_LPC_MIN	0x1c41
 #define PCI_DEVICE_ID_INTEL_COUGARPOINT_LPC_MAX	0x1c5f
diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
index 161a9711cd63..2a451ff4fe6a 100644
--- a/sound/hda/hdac_i915.c
+++ b/sound/hda/hdac_i915.c
@@ -11,11 +11,6 @@
 #include <sound/hda_i915.h>
 #include <sound/hda_register.h>
 
-#define IS_HSW_CONTROLLER(pci) (((pci)->device == 0x0a0c) || \
-				((pci)->device == 0x0c0c) || \
-				((pci)->device == 0x0d0c) || \
-				((pci)->device == 0x160c))
-
 /**
  * snd_hdac_i915_set_bclk - Reprogram BCLK for HSW/BDW
  * @bus: HDA core bus
@@ -39,7 +34,7 @@ void snd_hdac_i915_set_bclk(struct hdac_bus *bus)
 
 	if (!acomp || !acomp->ops || !acomp->ops->get_cdclk_freq)
 		return; /* only for i915 binding */
-	if (!IS_HSW_CONTROLLER(pci))
+	if (!HDA_CONTROLLER_IS_HSW(pci))
 		return; /* only HSW/BDW */
 
 	cdclk_freq = acomp->ops->get_cdclk_freq(acomp->dev);
-- 
2.34.1

