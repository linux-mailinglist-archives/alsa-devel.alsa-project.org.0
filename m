Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A701B8610B2
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Feb 2024 12:45:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13713A4D;
	Fri, 23 Feb 2024 12:45:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13713A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708688757;
	bh=w5f6RNhBhSo4LkceK82xzJNTTn3aKecVjCjLlcA0HqI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YumF4tYIpi22V11VzvbO6kKmXds0SXDffACM9+71VXOmas5icPwm+jJA7SKiBXYg1
	 AxYCkmlYAHD6UGVN90cQ87OG5aaOOzLHpwORM0sNoUYBDNIDjkErLi57kL7RUDc5wA
	 W17hEOuagBts8JugRaknPeOggFyB34ofGz33zJ2U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4589F805B4; Fri, 23 Feb 2024 12:45:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8072EF805D7;
	Fri, 23 Feb 2024 12:45:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65884F804B0; Fri, 23 Feb 2024 12:45:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A2D0F80104
	for <alsa-devel@alsa-project.org>; Fri, 23 Feb 2024 12:44:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A2D0F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jTWFan12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708688696; x=1740224696;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w5f6RNhBhSo4LkceK82xzJNTTn3aKecVjCjLlcA0HqI=;
  b=jTWFan12VWfzBF9wfjhV9+n9GBy4mdPoT9YAMjLDLrozPROs+kc6ipeM
   hdwo8Nll3msW/O5H8CNNAw/vt+5MHc2zXE8uVTinCJLyu3EYSUsTX6Yrl
   IjuEAo852/qyPDHz5jA5ao5rE8qSGZt9CkaTilI21Tbq7+S0fzp/dyV3Z
   CRYSSmg+dPX14UVRdiBAzvJbQxhjYzReUMkLJ8NAi/Icou3+XJabO5gmP
   38C+KBJR9yO4tNbpp+f4/FjzsweribYxbWH+lGVn4m33/0KXWvitwNCZu
   el/iTTGv32nxd15ofTc46+PWOuOEKaT8HjxD6pix6gg6/KVfmhGtEQ0tp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="3504599"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000";
   d="scan'208";a="3504599"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 03:44:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000";
   d="scan'208";a="6092896"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa006.fm.intel.com with ESMTP; 23 Feb 2024 03:44:51 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com,
	tvrtko.ursulin@linux.intel.com,
	intel-gfx@lists.freedesktop.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 1/4] ALSA: hda: Skip i915 initialization on CNL/LKF-based
 platforms
Date: Fri, 23 Feb 2024 12:46:23 +0100
Message-Id: <20240223114626.1052784-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240223114626.1052784-1-cezary.rojewski@intel.com>
References: <20240223114626.1052784-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DLT7AZ7R2ERP3WBJRBF37BUIBLPUXCEW
X-Message-ID-Hash: DLT7AZ7R2ERP3WBJRBF37BUIBLPUXCEW
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DLT7AZ7R2ERP3WBJRBF37BUIBLPUXCEW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Commit 78f613ba1efb ("drm/i915: finish removal of CNL") and its friends
removed support for i915 for all CNL-based platforms. HDAudio library,
however, still treats such platforms as valid candidates for i915
binding. Update query mechanism to reflect changes made in drm tree.

At the same time, i915 support for LKF-based platforms has not been
provided so remove them from valid binding candidates.

Link: https://lore.kernel.org/all/20210728215946.1573015-1-lucas.demarchi@intel.com/
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/hda/hdac_i915.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
index 365c36fdf205..afee87bd0f2e 100644
--- a/sound/hda/hdac_i915.c
+++ b/sound/hda/hdac_i915.c
@@ -127,15 +127,41 @@ static int i915_component_master_match(struct device *dev, int subcomponent,
 /* check whether Intel graphics is present and reachable */
 static int i915_gfx_present(struct pci_dev *hdac_pci)
 {
+	/* List of known platforms with no i915 support. */
+	static struct pci_device_id denylist[] = {
+		/* CNL */
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a40), 0x030000, 0xff0000 },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a41), 0x030000, 0xff0000 },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a42), 0x030000, 0xff0000 },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a44), 0x030000, 0xff0000 },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a49), 0x030000, 0xff0000 },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a4a), 0x030000, 0xff0000 },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a4c), 0x030000, 0xff0000 },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a50), 0x030000, 0xff0000 },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a51), 0x030000, 0xff0000 },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a52), 0x030000, 0xff0000 },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a54), 0x030000, 0xff0000 },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a59), 0x030000, 0xff0000 },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a5a), 0x030000, 0xff0000 },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a5c), 0x030000, 0xff0000 },
+		/* LKF */
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x9840), 0x030000, 0xff0000 },
+		{ 0 }
+	};
 	struct pci_dev *display_dev = NULL;
 
 	if (!gpu_bind || (gpu_bind < 0 && video_firmware_drivers_only()))
 		return false;
 
 	for_each_pci_dev(display_dev) {
-		if (display_dev->vendor == PCI_VENDOR_ID_INTEL &&
-		    (display_dev->class >> 16) == PCI_BASE_CLASS_DISPLAY &&
-		    connectivity_check(display_dev, hdac_pci)) {
+		if (display_dev->vendor != PCI_VENDOR_ID_INTEL ||
+		    (display_dev->class >> 16) != PCI_BASE_CLASS_DISPLAY)
+			continue;
+
+		if (pci_match_id(denylist, display_dev))
+			continue;
+
+		if (connectivity_check(display_dev, hdac_pci)) {
 			pci_dev_put(display_dev);
 			return true;
 		}
-- 
2.25.1

