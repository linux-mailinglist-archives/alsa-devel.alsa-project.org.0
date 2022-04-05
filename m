Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 815194F31E1
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 14:47:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D2B01705;
	Tue,  5 Apr 2022 14:46:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D2B01705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649162823;
	bh=lU47dxYjt7zyYx0YYm55oC2GlrTxk/NFnmA438ZYvSo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uEtVYv7W9yxp6uQZ2ObxZNs99z9DtBqDNuAZm6oOF5/gqSYYjfF/BfSFSFmp8FVvr
	 up3Qtsm0D/j24P2NeE4IJshqFLdm7ONGzgRg/pvAwl8px0oszDUc6Tp0u0lmu+J9XN
	 YaKW3+EJxDyPTip0O9vykrkLYGR3GDbYSO/As6Fw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88F42F8016B;
	Tue,  5 Apr 2022 14:46:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D97CF8016A; Tue,  5 Apr 2022 14:46:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98D74F800D1
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 14:45:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98D74F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="lmSkV+3E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649162757; x=1680698757;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lU47dxYjt7zyYx0YYm55oC2GlrTxk/NFnmA438ZYvSo=;
 b=lmSkV+3ExNW5QWC3caMFnpRiJMcTqjdWzLWbXG8UPIP/ECBQqD6R2pSN
 qCUpqiII3HyGapSokDeByGrTiObRBHoT7gA7pJZxcNJXCRj1g/gQu6fzN
 MN75GEV6nVI8wP4Rw58NB9jdlhPU4kWSJbnL8U7vSxMUjD8AKXRQquvMU
 8Wt+eUgD0irsjjF3hS9OEaaglF/cTi6XMOJnh9iSlBTmTmyB3jJBhDB60
 OXIpnOh0qGbDt0UKyO+tyDMggEm/qqbqRgRB9QLmcjRfVNG/wG2xJEfLk
 jGXxr2RPUrvCrcoJvuMddXnblDl3SSoMbcRoZH3OR3SJRccf+mqbfYyfq Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="285697740"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="285697740"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 05:45:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="850688153"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga005.fm.intel.com with ESMTP; 05 Apr 2022 05:45:47 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH v2] ALSA: hda/i915 - skip acomp init if no matching display
Date: Tue,  5 Apr 2022 15:36:22 +0300
Message-Id: <20220405123622.2874457-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, kai.vehmanen@linux.intel.com
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

In systems with only a discrete i915 GPU, the acomp init will
always timeout for the PCH HDA controller instance.

Avoid the timeout by checking the PCI device hierarchy
whether any display class PCI device can be found on the system,
and at the same level as the HDA PCI device. If found, proceed
with the acomp init, which will wait until i915 probe is complete
and component binding can proceed. If no matching display
device is found, the audio component bind can be safely skipped.

The bind timeout will still be hit if the display is present
in the system, but i915 driver does not bind to it by configuration
choice or probe error. In this case the 60sec timeout will be
hit.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 sound/hda/hdac_i915.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
index efe810af28c5..48b8ed752b69 100644
--- a/sound/hda/hdac_i915.c
+++ b/sound/hda/hdac_i915.c
@@ -116,16 +116,25 @@ static int i915_component_master_match(struct device *dev, int subcomponent,
 	return 0;
 }
 
-/* check whether intel graphics is present */
-static bool i915_gfx_present(void)
+/* check whether Intel graphics is present and reachable */
+static int i915_gfx_present(struct pci_dev *hdac_pci)
 {
-	static const struct pci_device_id ids[] = {
-		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_ANY_ID),
-		  .class = PCI_BASE_CLASS_DISPLAY << 16,
-		  .class_mask = 0xff << 16 },
-		{}
-	};
-	return pci_dev_present(ids);
+	unsigned int class = PCI_BASE_CLASS_DISPLAY << 16;
+	struct pci_dev *display_dev = NULL;
+	bool match = false;
+
+	do {
+		display_dev = pci_get_class(class, display_dev);
+
+		if (display_dev && display_dev->vendor == PCI_VENDOR_ID_INTEL &&
+		    connectivity_check(display_dev, hdac_pci))
+			match = true;
+
+		pci_dev_put(display_dev);
+
+	} while (!match && display_dev);
+
+	return match;
 }
 
 /**
@@ -145,7 +154,7 @@ int snd_hdac_i915_init(struct hdac_bus *bus)
 	struct drm_audio_component *acomp;
 	int err;
 
-	if (!i915_gfx_present())
+	if (!i915_gfx_present(to_pci_dev(bus->dev)))
 		return -ENODEV;
 
 	err = snd_hdac_acomp_init(bus, NULL,

base-commit: bfa1e1a62c8bdbe3d8c915fbb7a078dc783b2ee8
-- 
2.35.1

