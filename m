Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 430E6503484
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Apr 2022 08:45:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7751171C;
	Sat, 16 Apr 2022 08:44:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7751171C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650091530;
	bh=ceGRmFOdZlSegm+wVvVm65Y/MBGjuTTfhKZ7LliGs4Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uCG2UYPqcJpRYbQhYSAo/KVd80MOxxFBGKKIU8aJLoPNrzNWXSHWtB+0Jtp5WUfog
	 UcjHY6Zp74jIXWlqJyW6i4s6U0zcg26mni6+mJejLsVX9jVhRaCtb2RXChqTCH6FPC
	 ngmy+5UcE3PTUEH1R2RSPBB6UquU27FSE5RwBO6c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31BCFF8019B;
	Sat, 16 Apr 2022 08:44:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E899FF80161; Sat, 16 Apr 2022 08:44:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7175AF800FB
 for <alsa-devel@alsa-project.org>; Sat, 16 Apr 2022 08:44:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7175AF800FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="H/1ER22/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650091465; x=1681627465;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ceGRmFOdZlSegm+wVvVm65Y/MBGjuTTfhKZ7LliGs4Q=;
 b=H/1ER22/4lWTvxjoqYjWHQY0DL2+XU1h0iRbpkpAggz7pRiWF0YMWKec
 nrtUHkDwAABoc+m/S/jZ4cwc8Ib2HwPmp8XHBartQr4OJe4RosZc4RtwW
 RaWQaZUJt9JJo9KQ5u9sh7hCV/wYAv/fifHbzeRD+E2FAVi/eSI5v8v0C
 RCco7Twos+uShDZZzRNQMqEwuAeeLvzK4+wuE29jw0RK74PheY3cAC5UV
 5vOElipQpTaP2L83WUNdjpPiCeMbhWn095CXu6CfQLiXnqiHFhfQTYJdo
 LVVppHiO46HyYhDNOKoTTCngVluZ3txWYxByIYTp07nyr9uw6+lfU15kF A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10318"; a="262733792"
X-IronPort-AV: E=Sophos;i="5.90,264,1643702400"; d="scan'208";a="262733792"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2022 23:44:21 -0700
X-IronPort-AV: E=Sophos;i="5.90,264,1643702400"; d="scan'208";a="509184151"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2022 23:44:21 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/i915: Fix one too many pci_dev_put()
Date: Fri, 15 Apr 2022 23:44:18 -0700
Message-Id: <20220416064418.2364582-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

pci_get_class() will already unref the pci device passed as argument.
So if it's unconditionally unref'ed, even if the loop is not stopped,
there will be one too many unref for each device not matched.

Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.de>
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5701
Fixes: 0dc2696a4623 ("ALSA: hda/i915 - skip acomp init if no matching display")
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 sound/hda/hdac_i915.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
index 1ce2cea137db..12dad5e9c45d 100644
--- a/sound/hda/hdac_i915.c
+++ b/sound/hda/hdac_i915.c
@@ -127,11 +127,10 @@ static int i915_gfx_present(struct pci_dev *hdac_pci)
 		display_dev = pci_get_class(class, display_dev);
 
 		if (display_dev && display_dev->vendor == PCI_VENDOR_ID_INTEL &&
-		    connectivity_check(display_dev, hdac_pci))
+		    connectivity_check(display_dev, hdac_pci)) {
+			pci_dev_put(display_dev);
 			match = true;
-
-		pci_dev_put(display_dev);
-
+		}
 	} while (!match && display_dev);
 
 	return match;
-- 
2.35.2

