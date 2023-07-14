Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89730753AE3
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jul 2023 14:26:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8475DF8;
	Fri, 14 Jul 2023 14:25:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8475DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689337588;
	bh=O2F310bFUrrtqJHibkMdzi90JDrvWOt0X9HXx8O2FCY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R4+SnJxWu3lCxgV+fJ1x0kIUe+KhEtMsDKshQYohSkRlmt4VVxrg/B9JRRjMvWl80
	 ixRL+dd0yQexIsd+QmtKSkw6vToExkt4F7z3jzr2EO24swnqunE7sKT0qMq+lrGVD8
	 VBmhvFdlaEOZcIr0QBDTJ6RXaF9K/YQsZvu0RmKE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7ED77F805A8; Fri, 14 Jul 2023 14:24:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9047F8057F;
	Fri, 14 Jul 2023 14:24:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78503F80567; Fri, 14 Jul 2023 14:24:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DATE_IN_FUTURE_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 98E48F8047D
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 14:24:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98E48F8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IxyJfWK5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689337449; x=1720873449;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O2F310bFUrrtqJHibkMdzi90JDrvWOt0X9HXx8O2FCY=;
  b=IxyJfWK5lh7hhTb6K8X68r+nuyCJg0wnt1Z6sMouJU+4Ces66N03XHM+
   x0RDeinSNHw6bei7bBYAPiPylDFdxjM6RLaAdtoz48AVghtntFoXKVjni
   2kT3Gwb/WcfeYWGTw1v7hNLv4r6DTgphvIvftbKnwoS3xRozdLZoFNUTx
   zBEIqBXkldzawH4CGtStIwXoweUMJq53n3iuUh/1u8Ra4tcSgJeQ9TFeJ
   V0Z4rlKk/jKScR2RkYZZF5KciiQpUwtw/+jawAsnKeF2uBuCk4ivblPVW
   GhUHjpdZqX234Bns3whzljcjJUMZ9arlXwk5lFYjiFHUIbRG3RY+2NDqZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="429225847"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="429225847"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 05:24:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="1053034912"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="1053034912"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga005.fm.intel.com with ESMTP; 14 Jul 2023 05:23:59 -0700
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
Subject: [PATCH v3 07/15] ALSA: hda/i915:  Use global PCI match macro
Date: Fri, 14 Jul 2023 22:24:49 +0200
Message-Id: <20230714202457.423866-8-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230714202457.423866-1-amadeuszx.slawinski@linux.intel.com>
References: <20230714202457.423866-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Y4OUUZQWGFAA6JPOQIEPNVXYCH3BET2T
X-Message-ID-Hash: Y4OUUZQWGFAA6JPOQIEPNVXYCH3BET2T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y4OUUZQWGFAA6JPOQIEPNVXYCH3BET2T/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Instead of using local macro to match PCI device, use global one.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/hda/hdac_i915.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

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

