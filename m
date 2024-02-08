Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E36D884E521
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Feb 2024 17:38:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 587C2DFA;
	Thu,  8 Feb 2024 17:38:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 587C2DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707410330;
	bh=GopZ5/61N+an8PeekkcsbURLOIv13SaQfkgk42FcmK4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=DX3qYSHOVIxE2MwnY116C20Wh+2vdgb7fFT+xpYHR715z7THMk61rEvcWxQq/e2Z1
	 pIDPoihIq8jFtzmHU41vpJSJKYs+0kO+aTjCyDiQqPZFaUVja43OM3kP73Skz4QUO4
	 KwLNoPTwX3dO7+cAOBysj+9fRa+UyyExoEpKMn3w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB8C5F805BB; Thu,  8 Feb 2024 17:38:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 777D4F805CB;
	Thu,  8 Feb 2024 17:38:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33755F804E7; Thu,  8 Feb 2024 17:38:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7D655F805B3
	for <alsa-devel@alsa-project.org>; Thu,  8 Feb 2024 17:38:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D655F805B3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=T3i3rjHk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707410288; x=1738946288;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GopZ5/61N+an8PeekkcsbURLOIv13SaQfkgk42FcmK4=;
  b=T3i3rjHkshLQ9NcH6BsqXnBDdynqV1Fp2RBlUZftM4LxOxAlDIUHH/J5
   yqiBAP9pWr8Mp84SkpGLkPyH/ZJOFedwAYaOfLfl4qsyUu89ByFgRV+Jm
   Awfm63/xFW9bTLsr7KifWAd8JnwuN2NGlnp3xJtCKeY8W4Dlmqvn1Gc+S
   C3NkNYIHtOm9YYT1uDP5yIPSFAnVT6dtv1290gDbYY7zTrM9CwWxZR1c/
   /oA6pmkQeKPZg2l16T1w+cJI9rrML72OQlJVYT8oU3V29O7IEqxNbMdso
   h9jFY4LfasleQM5QO2/GoX01Acr86Qhgcm9IvzLQ1efN8MUrjQ0uIY7R5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="436392514"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="436392514"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:38:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="824883735"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="824883735"
Received: from stang1-mobl1.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.212.92.130])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:38:00 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	vkoul@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH] ALSA: HDA: intel-sdw-acpi: add kernel parameter to select
 alternate controller
Date: Thu,  8 Feb 2024 10:37:50 -0600
Message-Id: <20240208163750.92849-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XCIFXR3HVRCRK7CR5CFKFXPAZEN4OZAD
X-Message-ID-Hash: XCIFXR3HVRCRK7CR5CFKFXPAZEN4OZAD
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XCIFXR3HVRCRK7CR5CFKFXPAZEN4OZAD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Existing DSDT or SSDT platforms hard-code clock and frame shape
configurations. For validation, we'd like to use alternate
configurations. It's not always possible to generate new tables due to
missing symbols, and modifying existing objects usually leads to
AE_OBJECT_EXIST errors.

The mechanism suggested in this patch is to add a NEW ACPI controller
device with a different _ADR value. e.g.

 Scope (_SB_.PC00.RP08.PXSX.HDAS) {

  	Device (SDWP)
            {
                Name (_ADR, 0x40000001)  // _ADR: Address

The desired _ADR can be passed as a parameter with

options snd-intel-sdw-acpi sdw_ctrl_addr=0x40000001

This solution leads to minimal tables with just what the developers or
validation engineers need, and without overriding any of the existing
firmware definitions. It's consistent with the recommendation to
extend ACPI definitions and not redefine them with a risk of conflict.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/hda/intel-sdw-acpi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/hda/intel-sdw-acpi.c b/sound/hda/intel-sdw-acpi.c
index b57d72ea4503..5f60658c6051 100644
--- a/sound/hda/intel-sdw-acpi.c
+++ b/sound/hda/intel-sdw-acpi.c
@@ -23,6 +23,10 @@ static int ctrl_link_mask;
 module_param_named(sdw_link_mask, ctrl_link_mask, int, 0444);
 MODULE_PARM_DESC(sdw_link_mask, "Intel link mask (one bit per link)");
 
+static ulong ctrl_addr = 0x40000000;
+module_param_named(sdw_ctrl_addr, ctrl_addr, ulong, 0444);
+MODULE_PARM_DESC(sdw_ctrl_addr, "Intel SoundWire Controller _ADR");
+
 static bool is_link_enabled(struct fwnode_handle *fw_node, u8 idx)
 {
 	struct fwnode_handle *link;
@@ -141,6 +145,9 @@ static acpi_status sdw_intel_acpi_cb(acpi_handle handle, u32 level,
 	if (FIELD_GET(GENMASK(31, 28), adr) != SDW_LINK_TYPE)
 		return AE_OK; /* keep going */
 
+	if (adr != ctrl_addr)
+		return AE_OK; /* keep going */
+
 	/* found the correct SoundWire controller */
 	info->handle = handle;
 
-- 
2.40.1

