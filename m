Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7938BC6EC
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2024 07:35:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA97C20E;
	Mon,  6 May 2024 07:34:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA97C20E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714973702;
	bh=IMso6YyTi3Ak72iVWYL0ZEM1Ah8zdCqQp2wAuBynAv8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ljDmIyZL7M8nyf8i73mFuo9gO4jd5PbY+iYQVRdwAKPMPtnOUkTbc4XOURVU+P3mZ
	 bkqx5DrxUK9vKHKe7LtuWZCitE2Zs8xbQT6eIX2BLOli5CaU1nTVhOxyVsYrQgAeIN
	 py3UKEbMfVcb4zaFZUlvUKQcDIIvi1f0cJZ/W4/I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB9E8F8057E; Mon,  6 May 2024 07:34:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EAA87F8049C;
	Mon,  6 May 2024 07:34:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9425F8049C; Mon,  6 May 2024 07:31:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=AC_FROM_MANY_DOTS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9465FF800E2
	for <alsa-devel@alsa-project.org>; Mon,  6 May 2024 07:31:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9465FF800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=aW0PlG7K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714973492; x=1746509492;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IMso6YyTi3Ak72iVWYL0ZEM1Ah8zdCqQp2wAuBynAv8=;
  b=aW0PlG7KN9bnRj/Ps9Mw7lWXTKOIR0h2OjIY36FLZkIP8jxoXXATrl28
   69hLeYKnqgzEHx5cHak3BXr+oSx2ofsmlacClKnPQmOYLXP6d9wxC37QD
   xPOzvKT2QtR68/3T+68rQ/F6IWYISqJO+LZkRXKDCtzZ/HmmMbB7/eQBr
   xwk4NOgxgimpo68/2YE5JkOMQGPt4bqylSw7ALpOUH1O1+ldnZqjAYYRK
   Hne345mV8rqegJGlpI7xiBefYFeMRIA222S08Up4iEWngxhI2sZ+KoaS/
   jbPQCUn2VF1uyAXhuE4uTPviKC453zRcaRaLgX+V0gxqMu9GHquaTtuk7
   w==;
X-CSE-ConnectionGUID: ClRSPT1RS3iJekzv/+YLeg==
X-CSE-MsgGUID: +1/c5+PaTj+5/lsjjJd7kQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="22111325"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000";
   d="scan'208";a="22111325"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2024 22:31:26 -0700
X-CSE-ConnectionGUID: j87jTdywRm6kqMl/PCqDyw==
X-CSE-MsgGUID: d8+dsFZKQ7qCqd4vz+rJzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000";
   d="scan'208";a="28162781"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
  by fmviesa006.fm.intel.com with ESMTP; 05 May 2024 22:31:24 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	kai.vehmanen@linux.intel.com,
	uma.shankar@intel.com
Subject: [PATCH] ALSA: hda: Add Intel BMG PCI ID and HDMI codec vid
Date: Mon,  6 May 2024 10:55:31 +0530
Message-Id: <20240506052531.1150062-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EPBQK4EULO33ECSXMIAQNE6E7RLHMYLW
X-Message-ID-Hash: EPBQK4EULO33ECSXMIAQNE6E7RLHMYLW
X-MailFrom: chaitanya.kumar.borah@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EPBQK4EULO33ECSXMIAQNE6E7RLHMYLW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add HD Audio PCI ID and HDMI codec vendor ID for Intel Battlemage.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 include/linux/pci_ids.h    | 1 +
 include/sound/hdaudio.h    | 1 +
 sound/pci/hda/hda_intel.c  | 2 ++
 sound/pci/hda/patch_hdmi.c | 1 +
 4 files changed, 5 insertions(+)

diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index a0c75e467df3..ae8e66242927 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -3106,6 +3106,7 @@
 #define PCI_DEVICE_ID_INTEL_HDA_CML_S	0xa3f0
 #define PCI_DEVICE_ID_INTEL_HDA_LNL_P	0xa828
 #define PCI_DEVICE_ID_INTEL_S21152BB	0xb152
+#define PCI_DEVICE_ID_INTEL_HDA_BMG	0xe2f7
 #define PCI_DEVICE_ID_INTEL_HDA_CML_R	0xf0c8
 #define PCI_DEVICE_ID_INTEL_HDA_RKL_S	0xf1c8
 
diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index a73d7f34f4e5..07638111b28f 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -731,6 +731,7 @@ static inline unsigned int snd_array_index(struct snd_array *array, void *ptr)
 			{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_HDA_DG2_0) }, \
 			{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_HDA_DG2_1) }, \
 			{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_HDA_DG2_2) }, \
+			{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_HDA_BMG) }, \
 			{ } \
 		}, pci) || HDA_CONTROLLER_IS_HSW(pci))
 
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 9ea5925401f9..1d8171b11720 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2499,6 +2499,8 @@ static const struct pci_device_id azx_ids[] = {
 	{ PCI_DEVICE_DATA(INTEL, HDA_RPL_M, AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE) },
 	{ PCI_DEVICE_DATA(INTEL, HDA_RPL_PX, AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE) },
 	{ PCI_DEVICE_DATA(INTEL, HDA_MTL, AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE) },
+	/* Battlemage */
+	{ PCI_DEVICE_DATA(INTEL, HDA_BMG, AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE) },
 	/* Lunarlake-P */
 	{ PCI_DEVICE_DATA(INTEL, HDA_LNL_P, AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE) },
 	/* Arrow Lake-S */
diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 495d63101186..0a00c5ea42e0 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -4642,6 +4642,7 @@ HDA_CODEC_ENTRY(0x8086281a, "Jasperlake HDMI",	patch_i915_icl_hdmi),
 HDA_CODEC_ENTRY(0x8086281b, "Elkhartlake HDMI",	patch_i915_icl_hdmi),
 HDA_CODEC_ENTRY(0x8086281c, "Alderlake-P HDMI", patch_i915_adlp_hdmi),
 HDA_CODEC_ENTRY(0x8086281d, "Meteor Lake HDMI",	patch_i915_adlp_hdmi),
+HDA_CODEC_ENTRY(0x8086281e, "Battlemage HDMI",	patch_i915_adlp_hdmi),
 HDA_CODEC_ENTRY(0x8086281f, "Raptor Lake P HDMI",	patch_i915_adlp_hdmi),
 HDA_CODEC_ENTRY(0x80862820, "Lunar Lake HDMI",	patch_i915_adlp_hdmi),
 HDA_CODEC_ENTRY(0x80862880, "CedarTrail HDMI",	patch_generic_hdmi),
-- 
2.25.1

