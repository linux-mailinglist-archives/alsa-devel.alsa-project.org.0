Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDEB2726D4
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 16:21:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE63416B4;
	Mon, 21 Sep 2020 16:20:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE63416B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600698078;
	bh=7n9+E6sIiuagmOzDVD5buu31oocw5bgvFBUETeL94n0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rvwK2quvhnmM7mG3YcH3WxBeCgGTD4z+pqoBvsiGkHDK8oc3cjcROBqTR0wzUpfJR
	 n4FU6ufFJPIGUhY1zIPqUGM769qUpDVKCf17cTkuDqXxfQNjgMWxjgVAeE7ekjAKlz
	 WDjTv7B8Sefzq3vS5ulKojKFwqTXfsTFchrxBxm0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0D07F80161;
	Mon, 21 Sep 2020 16:19:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 054E5F8021C; Mon, 21 Sep 2020 16:19:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED6DDF8010A
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 16:19:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED6DDF8010A
IronPort-SDR: Cb9YZ61pU6AuAYGFtxswpQK8A6S7R3x3Z6pN0xcS7hXI1Vk+TK+I9uSVmcpwwIgw83xpbo5MNi
 Jt5+bWY0uTGA==
X-IronPort-AV: E=McAfee;i="6000,8403,9750"; a="140394073"
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="140394073"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 07:19:17 -0700
IronPort-SDR: hT+F/eSdcd1cb+LGBksC+8xdQvOWrozdiR/2Ro7hvdhbl/xC3lx44zzg/Dchiat/FYZ6LCI81E
 hp+zbYv0LAEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="485495409"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga005.jf.intel.com with ESMTP; 21 Sep 2020 07:19:16 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH 1/4] ALSA: hda - add Intel DG1 PCI and HDMI ids
Date: Mon, 21 Sep 2020 17:17:38 +0300
Message-Id: <20200921141741.2983072-2-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200921141741.2983072-1-kai.vehmanen@linux.intel.com>
References: <20200921141741.2983072-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com
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

Add Intel DG1 PCI id to list of supported HDA controllers and
add its HDMI id as well.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/pci/hda/hda_intel.c  | 3 +++
 sound/pci/hda/patch_hdmi.c | 1 +
 2 files changed, 4 insertions(+)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 36a9dbc33aa0..904d3af5b99e 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2493,6 +2493,9 @@ static const struct pci_device_id azx_ids[] = {
 	/* Tigerlake-H */
 	{ PCI_DEVICE(0x8086, 0x43c8),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
+	/* DG1 */
+	{ PCI_DEVICE(0x8086, 0x490d),
+	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
 	/* Elkhart Lake */
 	{ PCI_DEVICE(0x8086, 0x4b55),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 402050088090..055440740184 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -4269,6 +4269,7 @@ HDA_CODEC_ENTRY(0x8086280c, "Cannonlake HDMI",	patch_i915_glk_hdmi),
 HDA_CODEC_ENTRY(0x8086280d, "Geminilake HDMI",	patch_i915_glk_hdmi),
 HDA_CODEC_ENTRY(0x8086280f, "Icelake HDMI",	patch_i915_icl_hdmi),
 HDA_CODEC_ENTRY(0x80862812, "Tigerlake HDMI",	patch_i915_tgl_hdmi),
+HDA_CODEC_ENTRY(0x80862814, "DG1 HDMI",	patch_i915_tgl_hdmi),
 HDA_CODEC_ENTRY(0x80862816, "Rocketlake HDMI",	patch_i915_tgl_hdmi),
 HDA_CODEC_ENTRY(0x8086281a, "Jasperlake HDMI",	patch_i915_icl_hdmi),
 HDA_CODEC_ENTRY(0x8086281b, "Elkhartlake HDMI",	patch_i915_icl_hdmi),
-- 
2.27.0

