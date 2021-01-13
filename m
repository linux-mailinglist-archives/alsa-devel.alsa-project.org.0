Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C9E2F4F58
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jan 2021 17:01:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F02BF1729;
	Wed, 13 Jan 2021 17:00:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F02BF1729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610553678;
	bh=nwR/+l7tGqLVyQizYtAYiZmWmdXHjr8LDWw1T2uIXB8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=W/XNAeBsp8RchCjzulA/tRPmR1Yqw0YdXGfievZ8kvxBFcQCzsmgdkYyC7wtzp/uK
	 U2p54CM2H5NQIeJ9wLhjrbWDTSq5kd1TyGX7G4PggZmJjDqDhcyhlArD+kW8XefDEf
	 buTYwgS92eFIdi7eTnnxhTQgoIUiodQDN25IIDzg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54243F80254;
	Wed, 13 Jan 2021 16:59:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A28C3F801ED; Wed, 13 Jan 2021 16:59:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E34E9F80113
 for <alsa-devel@alsa-project.org>; Wed, 13 Jan 2021 16:59:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E34E9F80113
IronPort-SDR: ggefpbEaywGz4FBpjJVBEACK1L1gHRcErv0wavH6C7cEFBDRZSCNwitfvWSfKrUUQ2nTWfUq/l
 8e0OSpcsIPJw==
X-IronPort-AV: E=McAfee;i="6000,8403,9863"; a="157404928"
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="157404928"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2021 07:59:34 -0800
IronPort-SDR: HY3vRV8wXKXm6TsvmPiqGxJ8LD8CQ4mZOQCaDSYXsSz1v8D20BOSPN5aNlZH0g9eYNsQnaW7NJ
 87W4wvrGMcOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="381903736"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga008.jf.intel.com with ESMTP; 13 Jan 2021 07:59:32 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH] ALSA: hda: Add AlderLake-P PCI ID and HDMI codec vid
Date: Wed, 13 Jan 2021 17:56:29 +0200
Message-Id: <20210113155629.4097057-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 kai.vehmanen@linux.intel.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Add HD Audio PCI ID and HDMI codec vendor ID for Intel AlderLake-P.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 sound/pci/hda/hda_intel.c  | 3 +++
 sound/pci/hda/patch_hdmi.c | 1 +
 2 files changed, 4 insertions(+)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index f36ddf1149a6..279739fa3a7d 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2507,6 +2507,9 @@ static const struct pci_device_id azx_ids[] = {
 	/* Alderlake-S */
 	{ PCI_DEVICE(0x8086, 0x7ad0),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
+	/* Alderlake-P */
+	{ PCI_DEVICE(0x8086, 0x51c8),
+	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
 	/* Elkhart Lake */
 	{ PCI_DEVICE(0x8086, 0x4b55),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 74d246a0dc6d..97adff0cbcab 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -4346,6 +4346,7 @@ HDA_CODEC_ENTRY(0x8086280f, "Icelake HDMI",	patch_i915_icl_hdmi),
 HDA_CODEC_ENTRY(0x80862812, "Tigerlake HDMI",	patch_i915_tgl_hdmi),
 HDA_CODEC_ENTRY(0x80862814, "DG1 HDMI",	patch_i915_tgl_hdmi),
 HDA_CODEC_ENTRY(0x80862815, "Alderlake HDMI",	patch_i915_tgl_hdmi),
+HDA_CODEC_ENTRY(0x8086281c, "Alderlake-P HDMI", patch_i915_tgl_hdmi),
 HDA_CODEC_ENTRY(0x80862816, "Rocketlake HDMI",	patch_i915_tgl_hdmi),
 HDA_CODEC_ENTRY(0x8086281a, "Jasperlake HDMI",	patch_i915_icl_hdmi),
 HDA_CODEC_ENTRY(0x8086281b, "Elkhartlake HDMI",	patch_i915_icl_hdmi),
-- 
2.29.2

