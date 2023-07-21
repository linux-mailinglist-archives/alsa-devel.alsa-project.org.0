Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D5275C8A5
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 15:58:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39222844;
	Fri, 21 Jul 2023 15:57:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39222844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689947883;
	bh=IyGflU2lnBYJHrmv/gcLzttE/9me9zPJ5oTO79CYzuw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y7HwWjhkOnBFfyyvXp+9amlSdq3S5BUTTfmR1AXczhM+RmdtaUVyt+lWj8JWrCTzS
	 eK7JrtH6fwPedFiY6Rf75K/4uhH6/d4F8fLwctsZJPORD91Jqu+qHCwbzXt6IruYEd
	 zByckBM79staN6H/7b3wH+SU+mLa21d9Q2qQB9vw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8023BF80570; Fri, 21 Jul 2023 15:56:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EDF9F8055B;
	Fri, 21 Jul 2023 15:56:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4E02F8047D; Fri, 21 Jul 2023 15:56:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B3C4EF8007E
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 15:56:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3C4EF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hDUVOYXA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689947773; x=1721483773;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IyGflU2lnBYJHrmv/gcLzttE/9me9zPJ5oTO79CYzuw=;
  b=hDUVOYXAVuT8IrIvzfMQKG3jzUqEnElANQ1LtDeyHZxMhF10JvavRWcu
   B059cJXdwGUdGhKfKe2ge76QIfTKQQxP+xYU7PlDTY7n393X/K3vzviG3
   J6Y6iPuTL7Bj4gH9H2L6/3L+lFyDBlsMAc3kS+YhxdmCD62oXs92kKsE9
   aA1JbHWSb7ADFc2JPHIi0DyIV6QvwzDnDp87MJmnHx53vrZZNyPQ1Hvf4
   N11snVbQCJHVufN+aq0mzIBe8ek2aSeulZzA+zplfKCsq3rrlb6rZyZbC
   L/ct8RB++IlD75up/vbNhMCiKwgp8Pa8M7+eVTkJWwEXVYe/UuccluTPe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="370630884"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200";
   d="scan'208";a="370630884"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 06:56:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="724877900"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200";
   d="scan'208";a="724877900"
Received: from dhardfel-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.223.78])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 06:56:07 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: tiwai@suse.com,
	perex@perex.cz
Cc: kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ALSA: hda/hdmi: keep codec entries in numerical order
Date: Fri, 21 Jul 2023 16:57:21 +0300
Message-ID: <20230721135722.31288-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721135722.31288-1-peter.ujfalusi@linux.intel.com>
References: <20230721135722.31288-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: O4PFKMNU7UIYUDJUQ4ZADIMV2R3J5PCO
X-Message-ID-Hash: O4PFKMNU7UIYUDJUQ4ZADIMV2R3J5PCO
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O4PFKMNU7UIYUDJUQ4ZADIMV2R3J5PCO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Switch order of Intel MTL and RPL codec entries to keep the codec device
id list nicely ordered. Also use the opportunity to fix the naming
to the convention used elsewhere in the drivers.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/pci/hda/patch_hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 260d3e64f658..5139b6e087b3 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -4632,8 +4632,8 @@ HDA_CODEC_ENTRY(0x80862819, "DG2 HDMI",	patch_i915_tgl_hdmi),
 HDA_CODEC_ENTRY(0x8086281a, "Jasperlake HDMI",	patch_i915_icl_hdmi),
 HDA_CODEC_ENTRY(0x8086281b, "Elkhartlake HDMI",	patch_i915_icl_hdmi),
 HDA_CODEC_ENTRY(0x8086281c, "Alderlake-P HDMI", patch_i915_adlp_hdmi),
-HDA_CODEC_ENTRY(0x8086281f, "Raptorlake-P HDMI",	patch_i915_adlp_hdmi),
-HDA_CODEC_ENTRY(0x8086281d, "Meteorlake HDMI",	patch_i915_adlp_hdmi),
+HDA_CODEC_ENTRY(0x8086281d, "Meteor Lake HDMI",	patch_i915_adlp_hdmi),
+HDA_CODEC_ENTRY(0x8086281f, "Raptor Lake P HDMI",	patch_i915_adlp_hdmi),
 HDA_CODEC_ENTRY(0x80862880, "CedarTrail HDMI",	patch_generic_hdmi),
 HDA_CODEC_ENTRY(0x80862882, "Valleyview2 HDMI",	patch_i915_byt_hdmi),
 HDA_CODEC_ENTRY(0x80862883, "Braswell HDMI",	patch_i915_byt_hdmi),
-- 
2.41.0

