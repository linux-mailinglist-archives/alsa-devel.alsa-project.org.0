Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E364F159B
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Apr 2022 15:14:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBD4416E9;
	Mon,  4 Apr 2022 15:13:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBD4416E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649078078;
	bh=+DqX1qebVc7NPGN9C3wVhR4T3xFPZrevTgdQPmE/GdQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DtgqMey8dbO3s8TKs3R2UKg/KSHB/S6qP5G7O+m1Orf8UtsPs2IPlFozplRcs5y3x
	 41V6NHMeicj3hWUh5AxDDD+bZgVk1Ekl5g24faySI3rk6vUNwKkYqb3uUH3xTH3Qtv
	 NvJLD64Vev2CZq/Y+jZdmdvplTC6p3fYLXV6ItfQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13BDFF801F7;
	Mon,  4 Apr 2022 15:13:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B5C6F800D1; Mon,  4 Apr 2022 15:13:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80A35F800D1
 for <alsa-devel@alsa-project.org>; Mon,  4 Apr 2022 15:13:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80A35F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="fQ7OTecY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649078012; x=1680614012;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+DqX1qebVc7NPGN9C3wVhR4T3xFPZrevTgdQPmE/GdQ=;
 b=fQ7OTecYaCEsLsOqy0w1R3HSh3LOE15YtrHegImBz9CuJ4JJdZDYsLvA
 rKE/70xAl1fqQyR03rpq/KtHRBfTlu3S7UL+SP2odlxR7P7FOJn0VYTEO
 josOE4enAzKLlhyjspKIKyeyVp136TTztxD/un4BKt+l0urW59o5rQx/M
 bRDYJnzaTQZVvV/MtV9zVmhqinRHzkjpwOTA9/ffLYFOuVRq7OhLoW5tW
 UjVFzgf2yn4qk2QCGgGvU3Rs6+AOXfnYyJbjozgQyVoY2pXS5lZ+dcM88
 tmhgKeVHkRbXF0BV5ZtLLeDz/Jc4acl5MOAT+rjE1oF4cPJsL2yiiYFGB Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10306"; a="248023854"
X-IronPort-AV: E=Sophos;i="5.90,234,1643702400"; d="scan'208";a="248023854"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2022 06:13:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,234,1643702400"; d="scan'208";a="504900508"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga003.jf.intel.com with ESMTP; 04 Apr 2022 06:13:24 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH] ALSA: hda/i915 - skip acomp init if no matching display
Date: Mon,  4 Apr 2022 16:03:56 +0300
Message-Id: <20220404130356.2776970-1-kai.vehmanen@linux.intel.com>
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
index efe810af28c5..55b61b1a0ef9 100644
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
+		if (display_dev)
+			if (display_dev->vendor == PCI_VENDOR_ID_INTEL &&
+			    connectivity_check(display_dev, hdac_pci))
+				match = true;
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

